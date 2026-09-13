# add_live_tests_schedule_to_top_level_admin_v3.ps1
# Run from: D:\Projects\GYAN\gyan-platform
#
# Safely patches CURRENT local:
#   src\App.tsx
#   src\components\PlatformDashboardPage.tsx
#
# Existing AdminLiveTestSchedule.tsx is NOT replaced.
# Route added: /admin/live-tests

$ErrorActionPreference = "Stop"

$app = ".\src\App.tsx"
$dashboard = ".\src\components\PlatformDashboardPage.tsx"

if (-not (Test-Path $app)) {
    throw "src/App.tsx not found."
}

if (-not (Test-Path $dashboard)) {
    throw "src/components/PlatformDashboardPage.tsx not found."
}

function Backup-Once([string]$Path) {
    $backup = "$Path.before-live-tests-top-admin.bak"
    if (-not (Test-Path $backup)) {
        Copy-Item $Path $backup
        Write-Host "Backup created: $backup"
    }
}

# ============================================================
# PlatformDashboardPage.tsx
# ============================================================

$text = Get-Content $dashboard -Raw

# 1. Interface prop
if ($text -notmatch '\bonOpenLiveTestsSchedule\??\s*:') {
    $anchor = '  onOpenEducation: () => void;'

    if (-not $text.Contains($anchor)) {
        throw "PlatformDashboardPage: onOpenEducation prop anchor not found."
    }

    $replacement = @'
  onOpenEducation: () => void;
  onOpenLiveTestsSchedule?: () => void;
'@

    $text = $text.Replace(
        $anchor,
        $replacement.TrimEnd()
    )

    Write-Host "PlatformDashboardPage: prop added"
}

# 2. Destructuring prop
if ($text -notmatch '(?s)export\s+default\s+function\s+PlatformDashboardPage\s*\(\s*\{.*?\bonOpenLiveTestsSchedule\b') {
    $anchor = '  onOpenEducation,'

    if (-not $text.Contains($anchor)) {
        throw "PlatformDashboardPage: onOpenEducation destructuring anchor not found."
    }

    $replacement = @'
  onOpenEducation,
  onOpenLiveTestsSchedule,
'@

    $text = $text.Replace(
        $anchor,
        $replacement.TrimEnd()
    )

    Write-Host "PlatformDashboardPage: destructuring added"
}

# 3. New sibling tile, inserted immediately before Add shop
if ($text -notmatch 'title\s*:\s*[\r\n\s]*"Live Tests Schedule"') {
    $addShopTitle = [regex]::Match(
        $text,
        'title\s*:\s*[\r\n\s]*"Add shop"'
    )

    if (-not $addShopTitle.Success) {
        throw "PlatformDashboardPage: Add shop tile not found."
    }

    $before = $text.Substring(
        0,
        $addShopTitle.Index
    )

    $insertIndex = $before.LastIndexOf("{")

    if ($insertIndex -lt 0) {
        throw "PlatformDashboardPage: opening brace for Add shop tile not found."
    }

    $tile = @'
    {
      icon:
        "📝",

      title:
        "Live Tests Schedule",

      onClick:
        onOpenLiveTestsSchedule,
    },

'@

    $text = $text.Insert(
        $insertIndex,
        $tile
    )

    Write-Host "PlatformDashboardPage: Live Tests Schedule tile added"
}

Backup-Once $dashboard
Set-Content -Path $dashboard -Value $text -NoNewline


# ============================================================
# App.tsx
# ============================================================

$text = Get-Content $app -Raw

# 1. Import existing schedule component
if ($text -notmatch 'import\s+AdminLiveTestSchedule\s+from\s+"\.\/components\/AdminLiveTestSchedule"') {
    $anchor = 'import PlatformDashboardPage from "./components/PlatformDashboardPage";'

    if (-not $text.Contains($anchor)) {
        throw "App.tsx: PlatformDashboardPage import anchor not found."
    }

    $imp = @'

import AdminLiveTestSchedule
  from "./components/AdminLiveTestSchedule";
'@

    $text = $text.Replace(
        $anchor,
        $anchor + $imp
    )

    Write-Host "App.tsx: AdminLiveTestSchedule import added"
}

# 2. Add state near adminStudentsOpen
if ($text -notmatch '\badminLiveTestsOpen\b') {
    $pattern = '(?s)(const\s*\[\s*adminStudentsOpen\s*,\s*setAdminStudentsOpen\s*,?\s*\]\s*=\s*useState\(.*?\);)'
    $m = [regex]::Match(
        $text,
        $pattern
    )

    if (-not $m.Success) {
        throw "App.tsx: adminStudentsOpen state not found."
    }

    $state = @'


  const [
    adminLiveTestsOpen,
    setAdminLiveTestsOpen,
  ] = useState(
    () =>
      window.location.pathname ===
        "/admin/live-tests",
  );
'@

    $text = $text.Insert(
        $m.Index + $m.Length,
        $state
    )

    Write-Host "App.tsx: adminLiveTestsOpen state added"
}

# 3. Render schedule screen before Admin Students screen
if ($text -notmatch 'if\s*\(\s*adminLiveTestsOpen\s*\)') {
    $pattern = '(?m)^\s*if\s*\(\s*adminStudentsOpen\s*\)\s*\{'
    $m = [regex]::Match(
        $text,
        $pattern
    )

    if (-not $m.Success) {
        throw "App.tsx: adminStudentsOpen render branch not found."
    }

    $branch = @'
  if (
    adminLiveTestsOpen
  ) {
    return (
      <AdminLiveTestSchedule
        onBack={() => {
          setAdminLiveTestsOpen(
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

    $text = $text.Insert(
        $m.Index,
        $branch
    )

    Write-Host "App.tsx: Live Tests Schedule render branch added"
}

# 4. Add callback to PlatformDashboardPage
if ($text -notmatch 'onOpenLiveTestsSchedule\s*=\s*\{') {
    $dashboardIndex = $text.IndexOf(
        "<PlatformDashboardPage"
    )

    if ($dashboardIndex -lt 0) {
        throw "App.tsx: PlatformDashboardPage component not found."
    }

    $tail = $text.Substring(
        $dashboardIndex
    )

    $closeIndex = $tail.IndexOf("/>")

    if ($closeIndex -lt 0) {
        throw "App.tsx: PlatformDashboardPage closing tag not found."
    }

    $insertIndex = $dashboardIndex + $closeIndex

    $callback = @'
        onOpenLiveTestsSchedule={() => {
          setDashboardView(
            null,
          );

          setAdminLiveTestsOpen(
            true,
          );

          window.history.pushState(
            {},
            "",
            "/admin/live-tests",
          );
        }}

'@

    $text = $text.Insert(
        $insertIndex,
        $callback
    )

    Write-Host "App.tsx: dashboard callback added"
}

Backup-Once $app
Set-Content -Path $app -Value $text -NoNewline

Write-Host ""
Write-Host "Top-level Admin Live Tests Schedule integration complete."
Write-Host ""
Write-Host "Verify:"
Write-Host '  Select-String -Path .\src\components\PlatformDashboardPage.tsx -Pattern "Live Tests Schedule|onOpenLiveTestsSchedule" -Context 2,5'
Write-Host '  Select-String -Path .\src\App.tsx -Pattern "AdminLiveTestSchedule|adminLiveTestsOpen|onOpenLiveTestsSchedule" -Context 2,5'
Write-Host ""
Write-Host "Then:"
Write-Host "  npm run build"
