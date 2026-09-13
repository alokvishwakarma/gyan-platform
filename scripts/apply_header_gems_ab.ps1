$ErrorActionPreference = "Stop"
$app = ".\src\App.tsx"
$dash = ".\src\components\PlatformDashboardPage.tsx"
$index = ".\worker\index.ts"
foreach($p in @($app,$dash,$index)){if(-not(Test-Path $p)){throw "Missing $p"}}
function Backup([string]$p){$b="$p.before-header-gems-ab.bak";if(-not(Test-Path $b)){Copy-Item $p $b}}

# Dashboard: enable Settings tile.
$t=Get-Content $dash -Raw
if($t -notmatch 'onOpenSettings\??\s*:'){$t=$t.Replace('  onOpenLiveTestsSchedule?: () => void;','  onOpenLiveTestsSchedule?: () => void;' + "`r`n" + '  onOpenSettings?: () => void;')}
if($t -notmatch '(?s)function\s+PlatformDashboardPage.*?\bonOpenSettings\b'){$t=$t.Replace('  onOpenLiveTestsSchedule,','  onOpenLiveTestsSchedule,' + "`r`n" + '  onOpenSettings,')}
if($t -notmatch '(?s)title:\s*"Settings".*?onOpenSettings'){$t=[regex]::Replace($t,'(?s)(title:\s*"Settings",\s*)(\},)','$1' + "`r`n      onClick:`r`n        onOpenSettings,`r`n    },",1)}
Backup $dash; Set-Content $dash $t -NoNewline

# App: import, state, screen, dashboard callback.
$t=Get-Content $app -Raw
if($t -notmatch 'import\s+AdminPlatformSettingsPage'){$m=[regex]::Match($t,'import\s+PlatformDashboardPage[\s\S]*?from\s+"\.\/components\/PlatformDashboardPage";');if(-not$m.Success){throw 'PlatformDashboardPage import not found'};$t=$t.Insert($m.Index+$m.Length,"`r`n`r`nimport AdminPlatformSettingsPage`r`n  from \"./components/AdminPlatformSettingsPage\";")}
if($t -notmatch '\badminPlatformSettingsOpen\b'){$m=[regex]::Match($t,'(?s)(const\s*\[\s*adminAddGemsOpen\s*,\s*setAdminAddGemsOpen\s*,?\s*\]\s*=\s*useState\(.*?\);)');if(-not$m.Success){throw 'adminAddGemsOpen state not found'};$state="`r`n`r`n  const [`r`n    adminPlatformSettingsOpen,`r`n    setAdminPlatformSettingsOpen,`r`n  ] = useState(() => window.location.pathname === \"/admin/settings\");";$t=$t.Insert($m.Index+$m.Length,$state)}
if($t -notmatch 'if\s*\(\s*adminPlatformSettingsOpen\s*\)'){$m=[regex]::Match($t,'(?m)^\s*if\s*\(\s*adminAddGemsOpen\s*\)');if(-not$m.Success){throw 'adminAddGemsOpen render not found'};$branch="  if (adminPlatformSettingsOpen) {`r`n    return (`r`n      <AdminPlatformSettingsPage onBack={() => {`r`n        setAdminPlatformSettingsOpen(false);`r`n        setDashboardView(\"platform\");`r`n        window.history.pushState({}, \"\", \"/admin\");`r`n      }} />`r`n    );`r`n  }`r`n`r`n";$t=$t.Insert($m.Index,$branch)}
if($t -notmatch 'onOpenSettings\s*='){$i=$t.IndexOf('<PlatformDashboardPage');if($i -lt 0){throw 'PlatformDashboardPage render not found'};$tail=$t.Substring($i);$c=$tail.IndexOf('/>');if($c -lt 0){throw 'dashboard close not found'};$cb="        onOpenSettings={() => {`r`n          setDashboardView(null);`r`n          setAdminPlatformSettingsOpen(true);`r`n          window.history.pushState({}, \"\", \"/admin/settings\");`r`n        }}`r`n";$t=$t.Insert($i+$c,$cb)}
Backup $app; Set-Content $app $t -NoNewline

# Worker index: wire platformSettings handler before an existing admin route.
$t=Get-Content $index -Raw
if($t -notmatch 'handlePlatformSettingsRoute'){$m=[regex]::Match($t,'import\s+\{[\s\S]*?handleAdminGemsRoute[\s\S]*?\}\s+from\s+"\.\/adminGems";');if(-not$m.Success){throw 'adminGems import not found'};$imp="`r`n`r`nimport {`r`n  handlePlatformSettingsRoute,`r`n} from \"./platformSettings\";";$t=$t.Insert($m.Index+$m.Length,$imp)}
if($t -notmatch 'const\s+platformSettingsResponse\s*='){$m=[regex]::Match($t,'(?m)^\s*const\s+adminGemsResponse\s*=');if(-not$m.Success){throw 'adminGems route not found'};$route="  const platformSettingsResponse =`r`n    await handlePlatformSettingsRoute(request, env, url);`r`n  if (platformSettingsResponse) {`r`n    return platformSettingsResponse;`r`n  }`r`n`r`n";$t=$t.Insert($m.Index,$route)}
Backup $index; Set-Content $index $t -NoNewline
Write-Host 'Header Gems A/B integration patched.'
