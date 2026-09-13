# apply_live_test_14day_scheduler.ps1
# Run from D:\Projects\GYAN\gyan-platform
# Guarded patcher for Windows PowerShell. Creates backups before writing.

$ErrorActionPreference = "Stop"

function Backup-Once([string]$Path) {
    $backup = "$Path.before-live-scheduler.bak"
    if (-not (Test-Path $backup)) {
        Copy-Item $Path $backup
    }
}

$live = ".\worker\liveTests.ts"
$index = ".\worker\index.ts"
$wrangler = ".\wrangler.jsonc"

foreach ($path in @($live, $index, $wrangler)) {
    if (-not (Test-Path $path)) {
        throw "Missing required file: $path"
    }
}

# ------------------------------------------------------------
# 1) worker/liveTests.ts
# Main Live Test strip should only return visible tests.
# ------------------------------------------------------------
$text = Get-Content $live -Raw

if ($text -notmatch 'lt\.visible\s*=\s*1') {
    $pattern = "(?s)(WHERE\s+COALESCE\(\s*lt\.event_kind,\s*'WEEKDAY'\s*\)\s*<>\s*'ADMIN_TEST')"
    if ($text -notmatch $pattern) {
        throw "Could not find listLiveTests WHERE anchor in worker/liveTests.ts. Nothing written to this file."
    }

    $replacement = '$1' + "`r`n`r`n          AND lt.visible = 1"
    $newText = [regex]::Replace($text, $pattern, $replacement, 1)

    Backup-Once $live
    Set-Content -Path $live -Value $newText -NoNewline
    Write-Host "Patched worker/liveTests.ts"
}
else {
    Write-Host "worker/liveTests.ts already has visible filter"
}

# ------------------------------------------------------------
# 2) worker/index.ts
# Import scheduler and run:
#   daily builder: 17 3 * * *
#   hourly switcher: 5 * * * *
# ------------------------------------------------------------
$text = Get-Content $index -Raw

if ($text -notmatch 'from\s+"\.\/liveTestScheduler"') {
    $pattern = '(?s)(import\s*\{\s*handleLiveTestsRoute\s*,?\s*\}\s*from\s*"\.\/liveTests";)'
    $match = [regex]::Match($text, $pattern)

    if (-not $match.Success) {
        throw "Could not find handleLiveTestsRoute import in worker/index.ts."
    }

    $insert = @'

import {
  maintainLiveTestInventory,
  switchLiveTestVisibility,
} from "./liveTestScheduler";
'@

    $text = $text.Insert($match.Index + $match.Length, $insert)
}

if ($text -notmatch 'Live Test 14-day inventory') {
    $pattern = '(?s)(async\s+scheduled\s*\(\s*controller\s*:\s*ScheduledController\s*,\s*env\s*:\s*Env\s*,\s*(?:context|ctx)\s*:\s*ExecutionContext\s*,?\s*\)\s*:\s*Promise<void>\s*\{)'
    $match = [regex]::Match($text, $pattern)

    if (-not $match.Success) {
        throw "Could not find scheduled(controller, env, context) in worker/index.ts."
    }

    # Detect whether the parameter is named context or ctx.
    $header = $match.Value
    $ctxName = if ($header -match '\bctx\s*:') { "ctx" } else { "context" }

    $block = @"

    /*
     * Live Test 14-day inventory.
     *
     * Daily builder: existing 03:17 UTC cron.
     * Hourly switcher: minute 5 of every hour.
     */
    if (
      controller.cron ===
      "17 3 * * *"
    ) {
      $ctxName.waitUntil(
        maintainLiveTestInventory(
          env,
          14,
        )
          .catch(
            (
              error,
            ) => {
              console.error(
                "Live Test 14-day inventory failed:",
                error,
              );
            },
          ),
      );
    }

    if (
      controller.cron ===
      "5 * * * *"
    ) {
      $ctxName.waitUntil(
        switchLiveTestVisibility(
          env,
        )
          .catch(
            (
              error,
            ) => {
              console.error(
                "Live Test visibility switch failed:",
                error,
              );
            },
          ),
      );
    }

"@

    $text = $text.Insert($match.Index + $match.Length, $block)
}

Backup-Once $index
Set-Content -Path $index -Value $text -NoNewline
Write-Host "Patched worker/index.ts"

# ------------------------------------------------------------
# 3) wrangler.jsonc
# Preserve existing cron(s), add hourly switcher if absent.
# ------------------------------------------------------------
$text = Get-Content $wrangler -Raw

if ($text -notmatch '"5 \* \* \* \*"') {
    $pattern = '(?s)("crons"\s*:\s*\[)(.*?)(\])'
    $match = [regex]::Match($text, $pattern)

    if (-not $match.Success) {
        throw "Could not find crons array in wrangler.jsonc."
    }

    $inside = $match.Groups[2].Value
    if ($inside -notmatch '"17 3 \* \* \*"') {
        throw 'Expected existing cron "17 3 * * *" was not found.'
    }

    $values = [regex]::Matches($inside, '"([^"]+)"') |
        ForEach-Object { $_.Groups[1].Value }

    if ($values -notcontains '5 * * * *') {
        $values += '5 * * * *'
    }

    $indentMatch = [regex]::Match($inside, "`n(\s*)`"")
    $indent = if ($indentMatch.Success) { $indentMatch.Groups[1].Value } else { "    " }

    $newInside = "`r`n" + (($values | ForEach-Object { "$indent`"$_`"" }) -join ",`r`n") + "`r`n  "
    $text = $text.Substring(0, $match.Groups[2].Index) +
            $newInside +
            $text.Substring($match.Groups[2].Index + $match.Groups[2].Length)

    Backup-Once $wrangler
    Set-Content -Path $wrangler -Value $text -NoNewline
    Write-Host "Patched wrangler.jsonc"
}
else {
    Write-Host "wrangler.jsonc already has hourly cron"
}

Write-Host ""
Write-Host "Patch complete."
Write-Host "Run:"
Write-Host "  npm run build"
Write-Host "  git diff -- worker\liveTests.ts worker\index.ts wrangler.jsonc"
