# add_admin_add_gems.ps1
# Run from: D:\Projects\GYAN\gyan-platform
#
# Before running, copy:
#   AdminAddGemsPage.tsx -> src\components\
#   AdminAddGemsPage.css -> src\components\
#   adminGems.ts         -> worker\
#
# This patches only CURRENT local:
#   src\App.tsx
#   src\components\PlatformDashboardPage.tsx
#   worker\index.ts
#
# Adds:
#   Admin sibling tile: Add Gems
#   Route: /admin/add-gems
#   API wiring: POST /api/admin/gems/add

$ErrorActionPreference = "Stop"

$appFile =
  ".\src\App.tsx"

$dashboardFile =
  ".\src\components\PlatformDashboardPage.tsx"

$workerIndexFile =
  ".\worker\index.ts"

foreach (
  $path
  in @(
    $appFile,
    $dashboardFile,
    $workerIndexFile
  )
) {
  if (
    -not (
      Test-Path $path
    )
  ) {
    throw "Required file not found: $path"
  }
}

function Backup-Once(
  [string]$Path
) {
  $backup =
    "$Path.before-admin-add-gems.bak"

  if (
    -not (
      Test-Path $backup
    )
  ) {
    Copy-Item
      $Path
      $backup
  }
}


# ============================================================
# PlatformDashboardPage.tsx
# ============================================================

$text =
  Get-Content
    $dashboardFile
    -Raw

if (
  $text -notmatch
    '\bonOpenAddGems\??\s*:'
) {
  $anchor =
    '  onOpenEducation: () => void;'

  if (
    -not $text.Contains(
      $anchor
    )
  ) {
    throw "PlatformDashboardPage: onOpenEducation prop not found."
  }

  $replacement = @'
  onOpenEducation: () => void;
  onOpenAddGems?: () => void;
'@

  $text =
    $text.Replace(
      $anchor,
      $replacement.TrimEnd()
    )
}

$header =
  [regex]::Match(
    $text,
    '(?s)export\s+default\s+function\s+PlatformDashboardPage\s*\(\s*\{(?<body>.*?)\}\s*:\s*PlatformDashboardPageProps\s*\)'
  )

if (
  -not $header.Success
) {
  throw "PlatformDashboardPage: component header not found."
}

if (
  $header.Groups[
    "body"
  ].Value -notmatch
    '\bonOpenAddGems\b'
) {
  $body =
    $header.Groups[
      "body"
    ].Value

  $anchorMatch =
    [regex]::Match(
      $body,
      'onOpenEducation\s*,'
    )

  if (
    -not $anchorMatch.Success
  ) {
    throw "PlatformDashboardPage: onOpenEducation destructuring not found."
  }

  $absolute =
    $header.Groups[
      "body"
    ].Index +
    $anchorMatch.Index +
    $anchorMatch.Length

  $text =
    $text.Insert(
      $absolute,
      "`r`n  onOpenAddGems,"
    )
}

if (
  $text -notmatch
    'title\s*:\s*[\r\n\s]*"Add Gems"'
) {
  # Prefer inserting after Education.
  $educationTile =
    [regex]::Match(
      $text,
      '(?s)(\{\s*icon\s*:\s*".*?"\s*,\s*title\s*:\s*"Education"\s*,\s*onClick\s*:\s*onOpenEducation\s*,\s*\},)'
    )

  if (
    $educationTile.Success
  ) {
    $insertAt =
      $educationTile.Index +
      $educationTile.Length
  }
  else {
    # Safe fallback: immediately before Add shop.
    $addShop =
      [regex]::Match(
        $text,
        'title\s*:\s*[\r\n\s]*"Add shop"'
      )

    if (
      -not $addShop.Success
    ) {
      throw "PlatformDashboardPage: cannot locate Education or Add shop tile."
    }

    $before =
      $text.Substring(
        0,
        $addShop.Index
      )

    $insertAt =
      $before.LastIndexOf(
        "{"
      )
  }

  $tile = @'

    {
      icon:
        "💎",

      title:
        "Add Gems",

      onClick:
        onOpenAddGems,
    },
'@

  $text =
    $text.Insert(
      $insertAt,
      $tile
    )
}

Backup-Once
  $dashboardFile

Set-Content
  -Path $dashboardFile
  -Value $text
  -NoNewline


# ============================================================
# App.tsx
# ============================================================

$text =
  Get-Content
    $appFile
    -Raw

if (
  $text -notmatch
    'import\s+AdminAddGemsPage'
) {
  $importAnchor =
    [regex]::Match(
      $text,
      'import\s+PlatformDashboardPage[\s\S]*?from\s+"\.\/components\/PlatformDashboardPage";'
    )

  if (
    -not $importAnchor.Success
  ) {
    throw "App.tsx: PlatformDashboardPage import not found."
  }

  $newImport = @'

import AdminAddGemsPage
  from "./components/AdminAddGemsPage";
'@

  $text =
    $text.Insert(
      $importAnchor.Index +
      $importAnchor.Length,
      $newImport
    )
}

if (
  $text -notmatch
    '\badminAddGemsOpen\b'
) {
  $stateAnchor =
    [regex]::Match(
      $text,
      '(?s)(const\s*\[\s*adminLiveTestsOpen\s*,\s*setAdminLiveTestsOpen\s*,?\s*\]\s*=\s*useState\(.*?\);)'
    )

  if (
    -not $stateAnchor.Success
  ) {
    $stateAnchor =
      [regex]::Match(
        $text,
        '(?s)(const\s*\[\s*adminStudentsOpen\s*,\s*setAdminStudentsOpen\s*,?\s*\]\s*=\s*useState\(.*?\);)'
      )
  }

  if (
    -not $stateAnchor.Success
  ) {
    throw "App.tsx: admin screen state anchor not found."
  }

  $state = @'


  const [
    adminAddGemsOpen,
    setAdminAddGemsOpen,
  ] =
    useState(
      () =>
        window.location.pathname ===
        "/admin/add-gems",
    );
'@

  $text =
    $text.Insert(
      $stateAnchor.Index +
      $stateAnchor.Length,
      $state
    )
}

if (
  $text -notmatch
    'if\s*\(\s*adminAddGemsOpen\s*\)'
) {
  $renderAnchor =
    [regex]::Match(
      $text,
      '(?m)^\s*if\s*\(\s*adminLiveTestsOpen\s*\)\s*\{'
    )

  if (
    -not $renderAnchor.Success
  ) {
    $renderAnchor =
      [regex]::Match(
        $text,
        '(?m)^\s*if\s*\(\s*adminStudentsOpen\s*\)\s*\{'
      )
  }

  if (
    -not $renderAnchor.Success
  ) {
    throw "App.tsx: admin render branch anchor not found."
  }

  $branch = @'
  if (
    adminAddGemsOpen
  ) {
    return (
      <AdminAddGemsPage
        onBack={() => {
          setAdminAddGemsOpen(
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

  $text =
    $text.Insert(
      $renderAnchor.Index,
      $branch
    )
}

if (
  $text -notmatch
    'onOpenAddGems\s*='
) {
  $dashboardStart =
    $text.IndexOf(
      "<PlatformDashboardPage"
    )

  if (
    $dashboardStart -lt 0
  ) {
    throw "App.tsx: PlatformDashboardPage render not found."
  }

  $tail =
    $text.Substring(
      $dashboardStart
    )

  $close =
    $tail.IndexOf(
      "/>"
    )

  if (
    $close -lt 0
  ) {
    throw "App.tsx: PlatformDashboardPage closing tag not found."
  }

  $insertAt =
    $dashboardStart +
    $close

  $callback = @'
        onOpenAddGems={() => {
          setDashboardView(
            null,
          );

          setAdminAddGemsOpen(
            true,
          );

          window.history.pushState(
            {},
            "",
            "/admin/add-gems",
          );
        }}

'@

  $text =
    $text.Insert(
      $insertAt,
      $callback
    )
}

Backup-Once
  $appFile

Set-Content
  -Path $appFile
  -Value $text
  -NoNewline


# ============================================================
# worker/index.ts
# ============================================================

$text =
  Get-Content
    $workerIndexFile
    -Raw

if (
  $text -notmatch
    'handleAdminGemsRoute'
) {
  $importAnchor =
    [regex]::Match(
      $text,
      'import\s+\{[\s\S]*?handleAdminLiveTestScheduleRoute[\s\S]*?\}\s+from\s+"\.\/adminLiveTestSchedule";'
    )

  if (
    -not $importAnchor.Success
  ) {
    $importAnchor =
      [regex]::Match(
        $text,
        'import\s+\{[\s\S]*?handleLiveTestsRoute[\s\S]*?\}\s+from\s+"\.\/liveTests";'
      )
  }

  if (
    -not $importAnchor.Success
  ) {
    throw "worker/index.ts: Live Test import anchor not found."
  }

  $newImport = @'

import {
  handleAdminGemsRoute,
} from "./adminGems";
'@

  $text =
    $text.Insert(
      $importAnchor.Index +
      $importAnchor.Length,
      $newImport
    )
}

if (
  $text -notmatch
    'const\s+adminGemsResponse\s*='
) {
  $routeAnchor =
    [regex]::Match(
      $text,
      '(?m)^\s*const\s+adminLiveTestScheduleResponse\s*='
    )

  if (
    -not $routeAnchor.Success
  ) {
    $routeAnchor =
      [regex]::Match(
        $text,
        '(?m)^\s*const\s+adminStudentsResponse\s*='
      )
  }

  if (
    -not $routeAnchor.Success
  ) {
    throw "worker/index.ts: admin route anchor not found."
  }

  $route = @'
  const adminGemsResponse =
    await handleAdminGemsRoute(
      request,
      env,
      url,
    );

  if (
    adminGemsResponse
  ) {
    return adminGemsResponse;
  }


'@

  $text =
    $text.Insert(
      $routeAnchor.Index,
      $route
    )
}

Backup-Once
  $workerIndexFile

Set-Content
  -Path $workerIndexFile
  -Value $text
  -NoNewline


Write-Host ""
Write-Host "Admin Add Gems integration complete."
Write-Host ""
Write-Host "Run:"
Write-Host "  npm run build"
Write-Host ""
Write-Host "Then test locally:"
Write-Host "  Admin -> Add Gems"
Write-Host "  Recipient: ABCD"
Write-Host "  Gems: 10"
