# add_live_tests_schedule_to_top_level_admin.ps1
# Run from: D:\Projects\GYAN\gyan-platform
#
# Uses CURRENT local files and patches only:
#   src/App.tsx
#   src/components/PlatformDashboardPage.tsx
#
# Existing src/components/AdminLiveTestSchedule.tsx is NOT replaced.
#
# Adds:
#   Admin dashboard sibling tile: "Live Tests Schedule"
#   Route: /admin/live-tests
#   Opens existing AdminLiveTestSchedule
#   Back returns to /admin
#
# Backups are created once.

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

# 1. Add prop.
if ($text -notmatch '\bonOpenLiveTestsSchedule\??\s*:') {
    $anchor = '  onOpenEducation: () => void;'

    if (-not $text.Contains($anchor)) {
        throw "PlatformDashboardPage: onOpenEducation prop anchor not found."
    }

    $text = $text.Replace(
        $anchor,
        $anchor + "`r`n" +
        '  onOpenLiveTestsSchedule?: () => void;'
    )

    Write-Host "PlatformDashboardPage: prop added"
}

# 2. Add destructured prop.
if ($text -notmatch '(?s)export\s+default\s+function\s+PlatformDashboardPage\s*\(\s*\{.*?\bonOpenLiveTestsSchedule\b') {
    $anchor = '  onOpenEducation,'

    if (-not $text.Contains($anchor)) {
        throw "PlatformDashboardPage: onOpenEducation destructuring anchor not found."
    }

    $text = $text.Replace(
        $anchor,
        $anchor + "`r`n" +
        '  onOpenLiveTestsSchedule,'
    )

    Write-Host "PlatformDashboardPage: destructuring added"
}

# 3. Add sibling tile immediately after Education.
if ($text -notmatch 'title:\s*[\r\n\s]*"Live Tests Schedule"') {
    $educationTilePattern = '(?s)(\{\s*icon:\s*"🎓",\s*title:\s*"Education",\s*onClick:\s*onOpenEducation,\s*\},)'
    $m = [regex]::Match($text, $educationTilePattern)

    if (-not $m.Success) {
        # Fallback independent of emoji.
        $educationTilePattern = '(?s)(\{\s*icon:\s*".*?",\s*title:\s*"Education",\s*onClick:\s*onOpenEducation,\s*\},)'
        $m = [regex]::Match($text, $educationTilePattern)
    }

    if (-not $m.Success) {
        throw "PlatformDashboardPage: Education tile not found."
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
        $m.Index + $m.Length,
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

# 1. Import existing schedule component.
if ($text -notmatch 'import\s+AdminLiveTestSchedule\s+from\s+"\.\/components\/AdminLiveTestSchedule"') {
    $anchorPattern = 'import\s+PlatformDashboardPage\s+from\s+"\.\/components\/PlatformDashboardPage";'
    $m = [regex]::Match($text, $anchorPattern)

    if (-not $m.Success) {
        throw "App.tsx: PlatformDashboardPage import not found."
    }

    $import = @'

import AdminLiveTestSchedule
  from "./components/AdminLiveTestSchedule";
'@

    $text = $text.Insert(
        $m.Index + $m.Length,
        $import
    )

    Write-Host "App.tsx: AdminLiveTestSchedule import added"
}

# 2. Add state near adminStudentsOpen.
if ($text -notmatch '\badminLiveTestsOpen\b') {
    $anchorPattern = '(?s)(const\s*\[\s*adminStudentsOpen,\s*setAdminStudentsOpen,\s*\]\s*=\s*useState\(.*?\);)'
    $m = [regex]::Match($text, $anchorPattern)

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

# 3. Add standalone screen render before adminStudentsOpen.
if ($text -notmatch 'if\s*\(\s*adminLiveTestsOpen\s*\)') {
    $anchorPattern = '(?m)^\s*if\s*\(\s*adminStudentsOpen\s*\)\s*\{'
    $m = [regex]::Match($text, $anchorPattern)

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

# 4. Add dashboard callback prop after onOpenStudents callback block.
if ($text -notmatch 'onOpenLiveTestsSchedule\s*=\s*\{') {
    # Find <PlatformDashboardPage and then the onOpenStudents prop.
    $dashboardIndex = $text.IndexOf("<PlatformDashboardPage")

    if ($dashboardIndex -lt 0) {
        throw "App.tsx: <PlatformDashboardPage not found."
    }

    $tail = $text.Substring($dashboardIndex)

    $studentsPattern = '(?s)(onOpenStudents=\{\(\)\s*=>\s*\{.*?window\.history\.pushState\(\s*\{\},\s*"",\s*"/admin/students",\s*\);\s*\}\})'
    $mLocal = [regex]::Match($tail, $studentsPattern)

    if (-not $mLocal.Success) {
        throw "App.tsx: PlatformDashboardPage onOpenStudents callback not found."
    }

    $absoluteEnd =
        $dashboardIndex +
        $mLocal.Index +
        $mLocal.Length

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
        $absoluteEnd,
        $callback
    )

    Write-Host "App.tsx: dashboard callback added"
}

# 5. When opening Students, Shops, etc., we don't strictly need to reset
#    adminLiveTestsOpen because the schedule screen returns early.
#    But when platform dashboard is explicitly opened from an existing path,
#    ensure this flag is off where practical.
#
#    Add reset inside the known platform dashboard navigation block if
#    setAdminStudentsOpen(false) is present before PlatformDashboardPage.
if ($text -notmatch 'setAdminLiveTestsOpen\(\s*false,\s*\);\s*// Live Tests top-level reset') {
    # This is intentionally optional and conservative.
    # Main navigation works correctly without modifying unrelated reset blocks.
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
