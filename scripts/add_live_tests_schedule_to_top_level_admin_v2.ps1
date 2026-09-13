# add_live_tests_schedule_to_top_level_admin_v2.ps1
# Run from: D:\Projects\GYAN\gyan-platform
$ErrorActionPreference = "Stop"
$app = ".\src\App.tsx"
$dashboard = ".\src\components\PlatformDashboardPage.tsx"
if (-not (Test-Path $app)) { throw "src/App.tsx not found." }
if (-not (Test-Path $dashboard)) { throw "src/components/PlatformDashboardPage.tsx not found." }
function Backup-Once([string]$Path) {
  $backup = "$Path.before-live-tests-top-admin.bak"
  if (-not (Test-Path $backup)) { Copy-Item $Path $backup; Write-Host "Backup created: $backup" }
}

# PlatformDashboardPage.tsx
$text = Get-Content $dashboard -Raw
if ($text -notmatch '\bonOpenLiveTestsSchedule\??\s*:') {
  $m = [regex]::Match($text,'onOpenEducation\s*:\s*\(\)\s*=>\s*void\s*;')
  if (-not $m.Success) { throw "PlatformDashboardPage: onOpenEducation prop not found." }
  $text = $text.Insert($m.Index + $m.Length, "`r`n  onOpenLiveTestsSchedule?: () => void;")
  Write-Host "PlatformDashboardPage: prop added"
}
$header = [regex]::Match($text,'(?s)export\s+default\s+function\s+PlatformDashboardPage\s*\(\s*\{(?<body>.*?)\}\s*:\s*PlatformDashboardPageProps\s*\)')
if (-not $header.Success) { throw "PlatformDashboardPage: function header not found." }
if ($header.Groups['body'].Value -notmatch '\bonOpenLiveTestsSchedule\b') {
  $m = [regex]::Match($header.Groups['body'].Value,'onOpenEducation\s*,')
  if (-not $m.Success) { throw "PlatformDashboardPage: onOpenEducation destructuring entry not found." }
  $insert = $header.Groups['body'].Index + $m.Index + $m.Length
  $text = $text.Insert($insert, "`r`n  onOpenLiveTestsSchedule,")
  Write-Host "PlatformDashboardPage: destructuring added"
}
if ($text -notmatch 'title\s*:\s*[\r\n\s]*"Live Tests Schedule"') {
  $m = [regex]::Match($text,'title\s*:\s*[\r\n\s]*"Add shop"')
  if (-not $m.Success) { throw "PlatformDashboardPage: Add shop tile not found." }
  $before = $text.Substring(0,$m.Index)
  $insert = $before.LastIndexOf('{')
  if ($insert -lt 0) { throw "PlatformDashboardPage: Add shop tile opening brace not found." }
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
  $text = $text.Insert($insert,$tile)
  Write-Host "PlatformDashboardPage: Live Tests Schedule tile added"
}
Backup-Once $dashboard
Set-Content -Path $dashboard -Value $text -NoNewline

# App.tsx
$text = Get-Content $app -Raw
if ($text -notmatch 'import\s+AdminLiveTestSchedule\s+from\s+"\.\/components\/AdminLiveTestSchedule"') {
  $m = [regex]::Match($text,'import\s+PlatformDashboardPage\s+from\s+"\.\/components\/PlatformDashboardPage";')
  if (-not $m.Success) { throw "App.tsx: PlatformDashboardPage import not found." }
  $imp = "`r`n`r`nimport AdminLiveTestSchedule`r`n  from \"./components/AdminLiveTestSchedule\";"
  $text = $text.Insert($m.Index + $m.Length,$imp)
  Write-Host "App.tsx: AdminLiveTestSchedule import added"
}
if ($text -notmatch '\badminLiveTestsOpen\b') {
  $m = [regex]::Match($text,'(?s)(const\s*\[\s*adminStudentsOpen\s*,\s*setAdminStudentsOpen\s*,?\s*\]\s*=\s*useState\(.*?\);)')
  if (-not $m.Success) { throw "App.tsx: adminStudentsOpen state not found." }
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
  $text = $text.Insert($m.Index + $m.Length,$state)
  Write-Host "App.tsx: adminLiveTestsOpen state added"
}
if ($text -notmatch 'if\s*\(\s*adminLiveTestsOpen\s*\)') {
  $m = [regex]::Match($text,'(?m)^\s*if\s*\(\s*adminStudentsOpen\s*\)\s*\{')
  if (-not $m.Success) { throw "App.tsx: adminStudentsOpen render branch not found." }
  $branch = @'
  if (
    adminLiveTestsOpen
  ) {
    return (
      <AdminLiveTestSchedule
        onBack={() => {
          setAdminLiveTestsOpen(false);
          setDashboardView("platform");
          window.history.pushState({}, "", "/admin");
        }}
      />
    );
  }


'@
  $text = $text.Insert($m.Index,$branch)
  Write-Host "App.tsx: Live Tests Schedule render branch added"
}
if ($text -notmatch 'onOpenLiveTestsSchedule\s*=\s*\{') {
  $start = $text.IndexOf('<PlatformDashboardPage')
  if ($start -lt 0) { throw "App.tsx: <PlatformDashboardPage not found." }
  $tail = $text.Substring($start)
  $m = [regex]::Match($tail,'(?m)^\s*onOpenShops\s*=\s*\{')
  if ($m.Success) { $insert = $start + $m.Index } else { $close = $tail.IndexOf('/>'); if ($close -lt 0) { throw "App.tsx: PlatformDashboardPage closing /> not found." }; $insert = $start + $close }
  $callback = @'
        onOpenLiveTestsSchedule={() => {
          setDashboardView(null);
          setAdminLiveTestsOpen(true);
          window.history.pushState({}, "", "/admin/live-tests");
        }}

'@
  $text = $text.Insert($insert,$callback)
  Write-Host "App.tsx: dashboard callback added"
}
Backup-Once $app
Set-Content -Path $app -Value $text -NoNewline

Write-Host ""
Write-Host "Top-level Admin Live Tests Schedule integration complete."
Write-Host "Then run: npm run build"
