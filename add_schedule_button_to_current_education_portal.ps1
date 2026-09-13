# add_schedule_button_to_current_education_portal.ps1
# Run from: D:\Projects\GYAN\gyan-platform
#
# Patches the CURRENT local EducationPortal.tsx in place.
# Creates:
#   EducationPortal.tsx.before-schedule-button.bak
#
# Safe guards:
# - stops if expected anchors are not found
# - does not duplicate onAdminLiveTests or Schedule button

$ErrorActionPreference = "Stop"

$portal = ".\src\components\EducationPortal.tsx"

if (-not (Test-Path $portal)) {
    throw "EducationPortal.tsx not found at $portal"
}

$text = Get-Content $portal -Raw

$backup = "$portal.before-schedule-button.bak"
if (-not (Test-Path $backup)) {
    Copy-Item $portal $backup
    Write-Host "Backup created: $backup"
}

# ------------------------------------------------------------
# 1. Add onAdminLiveTests prop
# ------------------------------------------------------------
if ($text -notmatch '\bonAdminLiveTests\?\s*:') {
    $pattern = '(?s)(\s+onLiveTest\?\s*:\s*\(\s*code\s*:\s*string\s*,?\s*\)\s*=>\s*void\s*;)'
    $m = [regex]::Match($text, $pattern)

    if (-not $m.Success) {
        throw "Could not find onLiveTest prop in EducationPortalProps."
    }

    $insert = @'

  onAdminLiveTests?:
    () => void;
'@

    $text = $text.Insert(
        $m.Index + $m.Length,
        $insert
    )

    Write-Host "Added onAdminLiveTests prop"
}
else {
    Write-Host "onAdminLiveTests prop already present"
}

# ------------------------------------------------------------
# 2. Add onAdminLiveTests to function destructuring
# ------------------------------------------------------------
if ($text -notmatch '(?s)export\s+default\s+function\s+EducationPortal\s*\(\s*\{[^}]*\bonAdminLiveTests\b') {
    $pattern = '(?s)(export\s+default\s+function\s+EducationPortal\s*\(\s*\{)(.*?)(\}\s*:\s*EducationPortalProps\s*\))'
    $m = [regex]::Match($text, $pattern)

    if (-not $m.Success) {
        throw "Could not find EducationPortal props destructuring."
    }

    $inside = $m.Groups[2].Value

    # Prefer placing after onLiveTest when available.
    if ($inside -match '\bonLiveTest\s*,') {
        $inside = [regex]::Replace(
            $inside,
            '(\bonLiveTest\s*,)',
            '$1' + "`r`n  onAdminLiveTests,",
            1
        )
    }
    elseif ($inside -match '\badminAuthenticated\s*=\s*false\s*,') {
        $inside = [regex]::Replace(
            $inside,
            '(\badminAuthenticated\s*=\s*false\s*,)',
            '$1' + "`r`n  onAdminLiveTests,",
            1
        )
    }
    else {
        throw "Could not find a safe insertion point in EducationPortal destructuring."
    }

    $text =
        $text.Substring(0, $m.Groups[2].Index) +
        $inside +
        $text.Substring(
            $m.Groups[2].Index +
            $m.Groups[2].Length
        )

    Write-Host "Added onAdminLiveTests to component props"
}
else {
    Write-Host "onAdminLiveTests already in destructuring"
}

# ------------------------------------------------------------
# 3. Add Schedule button immediately after Admin Test #101
# ------------------------------------------------------------
if ($text -notmatch 'Manage generated Live Test schedule') {
    $pattern = '(?s)(<button\b[^>]*onClick=\{\(\)\s*=>\s*onLiveTest\?\.\(\s*"ADMIN101"\s*,?\s*\)\s*\}[^>]*>.*?Test\s*#101.*?</button>)'
    $m = [regex]::Match($text, $pattern)

    if (-not $m.Success) {
        # More flexible fallback for multiline formatting.
        $pattern = '(?s)(<button\b.*?"ADMIN101".*?>.*?Test\s*#101.*?</button>)'
        $m = [regex]::Match($text, $pattern)
    }

    if (-not $m.Success) {
        throw "Could not find the Admin Test #101 button."
    }

    $button = @'

                  <button
                    type="button"
                    onClick={() =>
                      onAdminLiveTests?.()
                    }
                    title="Manage generated Live Test schedule"
                  >
                    Schedule
                  </button>
'@

    $text = $text.Insert(
        $m.Index + $m.Length,
        $button
    )

    Write-Host "Added Schedule button"
}
else {
    Write-Host "Schedule button already present"
}

Set-Content -Path $portal -Value $text -NoNewline

Write-Host ""
Write-Host "EducationPortal.tsx updated."
Write-Host ""
Write-Host "Verify:"
Write-Host '  Select-String -Path .\src\components\EducationPortal.tsx -Pattern "onAdminLiveTests|Manage generated Live Test schedule" -Context 2,4'
Write-Host ""
Write-Host "Then:"
Write-Host "  npm run build"
