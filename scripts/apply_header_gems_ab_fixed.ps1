$ErrorActionPreference = "Stop"

$app = ".\src\App.tsx"
$dash = ".\src\components\PlatformDashboardPage.tsx"
$index = ".\worker\index.ts"

foreach ($p in @($app, $dash, $index)) {
  if (-not (Test-Path $p)) {
    throw "Missing required file: $p"
  }
}

function Backup-Once([string]$Path) {
  $backup = "$Path.before-header-gems-ab.bak"
  if (-not (Test-Path $backup)) {
    Copy-Item $Path $backup
    Write-Host "Backup created: $backup"
  }
}

# ============================================================
# PlatformDashboardPage.tsx
# Enable the existing Settings tile.
# ============================================================
$text = Get-Content $dash -Raw
$original = $text

if ($text -notmatch '\bonOpenSettings\??\s*:') {
  $anchor = '  onOpenLiveTestsSchedule?: () => void;'
  if (-not $text.Contains($anchor)) {
    throw "PlatformDashboardPage: onOpenLiveTestsSchedule prop anchor not found."
  }
  $text = $text.Replace(
    $anchor,
    $anchor + "`r`n" + '  onOpenSettings?: () => void;'
  )
}

$header = [regex]::Match(
  $text,
  '(?s)export\s+default\s+function\s+PlatformDashboardPage\s*\(\s*\{(?<body>.*?)\}\s*:\s*PlatformDashboardPageProps\s*\)'
)
if (-not $header.Success) {
  throw "PlatformDashboardPage: component header not found."
}
if ($header.Groups['body'].Value -notmatch '\bonOpenSettings\b') {
  $body = $header.Groups['body'].Value
  $anchorMatch = [regex]::Match($body, 'onOpenLiveTestsSchedule\s*,')
  if (-not $anchorMatch.Success) {
    throw "PlatformDashboardPage: onOpenLiveTestsSchedule destructuring anchor not found."
  }
  $insertAt = $header.Groups['body'].Index + $anchorMatch.Index + $anchorMatch.Length
  $text = $text.Insert($insertAt, "`r`n  onOpenSettings,")
}

if ($text -notmatch '(?s)title\s*:\s*[\r\n\s]*"Settings"[\s\S]*?onClick\s*:\s*[\r\n\s]*onOpenSettings') {
  $settings = [regex]::Match(
    $text,
    '(?s)(\{\s*icon\s*:\s*"⚙️"\s*,\s*title\s*:\s*"Settings"\s*)(,?\s*\},)'
  )
  if (-not $settings.Success) {
    # Fallback does not depend on emoji rendering.
    $settings = [regex]::Match(
      $text,
      '(?s)(\{\s*icon\s*:\s*".*?"\s*,\s*title\s*:\s*"Settings"\s*)(,?\s*\},)'
    )
  }
  if (-not $settings.Success) {
    throw "PlatformDashboardPage: Settings tile not found."
  }

  $replacement = @'
    {
      icon:
        "⚙️",

      title:
        "Settings",

      onClick:
        onOpenSettings,
    },
'@
  $text = $text.Remove($settings.Index, $settings.Length).Insert($settings.Index, $replacement)
}

if ($text -ne $original) {
  Backup-Once $dash
  Set-Content -Path $dash -Value $text -NoNewline
  Write-Host "Patched PlatformDashboardPage.tsx"
} else {
  Write-Host "PlatformDashboardPage.tsx already patched"
}

# ============================================================
# App.tsx
# Add Settings screen + /admin/settings navigation.
# ============================================================
$text = Get-Content $app -Raw
$original = $text

if ($text -notmatch 'import\s+AdminPlatformSettingsPage') {
  $m = [regex]::Match(
    $text,
    'import\s+PlatformDashboardPage[\s\S]*?from\s+"\.\/components\/PlatformDashboardPage";'
  )
  if (-not $m.Success) {
    throw "App.tsx: PlatformDashboardPage import not found."
  }
  $importBlock = @'

import AdminPlatformSettingsPage
  from "./components/AdminPlatformSettingsPage";
'@
  $text = $text.Insert($m.Index + $m.Length, $importBlock)
}

if ($text -notmatch '\badminPlatformSettingsOpen\b') {
  $m = [regex]::Match(
    $text,
    '(?s)(const\s*\[\s*adminAddGemsOpen\s*,\s*setAdminAddGemsOpen\s*,?\s*\]\s*=\s*useState\(.*?\);)'
  )
  if (-not $m.Success) {
    throw "App.tsx: adminAddGemsOpen state not found."
  }
  $stateBlock = @'

  const [
    adminPlatformSettingsOpen,
    setAdminPlatformSettingsOpen,
  ] = useState(
    () =>
      window.location.pathname ===
        "/admin/settings",
  );
'@
  $text = $text.Insert($m.Index + $m.Length, $stateBlock)
}

if ($text -notmatch 'if\s*\(\s*adminPlatformSettingsOpen\s*\)') {
  $m = [regex]::Match(
    $text,
    '(?m)^\s*if\s*\(\s*adminAddGemsOpen\s*\)'
  )
  if (-not $m.Success) {
    throw "App.tsx: adminAddGemsOpen render branch not found."
  }
  $renderBlock = @'
  if (
    adminPlatformSettingsOpen
  ) {
    return (
      <AdminPlatformSettingsPage
        onBack={() => {
          setAdminPlatformSettingsOpen(
            false,
          );

          setDashboardView(
            "platform",
          );

          window.history.pushState(
            {},
            "",
            "/admin",
          );
        }}
      />
    );
  }


'@
  $text = $text.Insert($m.Index, $renderBlock)
}

if ($text -notmatch 'onOpenSettings\s*=') {
  $dashboardStart = $text.IndexOf('<PlatformDashboardPage')
  if ($dashboardStart -lt 0) {
    throw "App.tsx: PlatformDashboardPage render not found."
  }
  $tail = $text.Substring($dashboardStart)
  $close = $tail.IndexOf('/>')
  if ($close -lt 0) {
    throw "App.tsx: PlatformDashboardPage closing tag not found."
  }
  $callback = @'
        onOpenSettings={() => {
          setDashboardView(
            null,
          );

          setAdminPlatformSettingsOpen(
            true,
          );

          window.history.pushState(
            {},
            "",
            "/admin/settings",
          );
        }}

'@
  $text = $text.Insert($dashboardStart + $close, $callback)
}

if ($text -ne $original) {
  Backup-Once $app
  Set-Content -Path $app -Value $text -NoNewline
  Write-Host "Patched App.tsx"
} else {
  Write-Host "App.tsx already patched"
}

# ============================================================
# worker/index.ts
# Wire platformSettings route.
# ============================================================
$text = Get-Content $index -Raw
$original = $text

if ($text -notmatch 'handlePlatformSettingsRoute') {
  $m = [regex]::Match(
    $text,
    'import\s+\{[\s\S]*?handleAdminGemsRoute[\s\S]*?\}\s+from\s+"\.\/adminGems";'
  )
  if (-not $m.Success) {
    throw "worker/index.ts: adminGems import not found."
  }
  $importBlock = @'

import {
  handlePlatformSettingsRoute,
} from "./platformSettings";
'@
  $text = $text.Insert($m.Index + $m.Length, $importBlock)
}

if ($text -notmatch 'const\s+platformSettingsResponse\s*=') {
  $m = [regex]::Match(
    $text,
    '(?m)^\s*const\s+adminGemsResponse\s*='
  )
  if (-not $m.Success) {
    throw "worker/index.ts: adminGems route block not found."
  }
  $routeBlock = @'
  const platformSettingsResponse =
    await handlePlatformSettingsRoute(
      request,
      env,
      url,
    );

  if (
    platformSettingsResponse
  ) {
    return platformSettingsResponse;
  }


'@
  $text = $text.Insert($m.Index, $routeBlock)
}

if ($text -ne $original) {
  Backup-Once $index
  Set-Content -Path $index -Value $text -NoNewline
  Write-Host "Patched worker/index.ts"
} else {
  Write-Host "worker/index.ts already patched"
}

Write-Host ""
Write-Host "Header Gems A/B integration complete."
Write-Host "Run: npm run build"
