$ErrorActionPreference = "Stop"

function Backup-Once([string]$Path) {
    $backup = "$Path.before_delete_feature"
    if (-not (Test-Path $backup)) {
        Copy-Item $Path $backup
        Write-Host "Backup: $backup"
    }
}

$classPath = ".\worker\adminLiveClassSchedule.ts"
$testPath  = ".\worker\adminLiveTestSchedule.ts"
$schedPath = ".\worker\liveTestScheduler.ts"

foreach ($p in @($classPath, $testPath, $schedPath)) {
    if (-not (Test-Path $p)) { throw "Missing $p" }
    Backup-Once $p
}

Write-Host ""
Write-Host "This bundle also includes FULL patched worker files."
Write-Host "Because your frontend files were the only files uploaded in the current turn,"
Write-Host "the safest approach is to compare/copy the supplied worker files if your local"
Write-Host "worker versions match the latest add-event versions."
Write-Host ""
Write-Host "No automatic textual patch is performed by this script."
Write-Host "Use:"
Write-Host "  worker\adminLiveClassSchedule.ts"
Write-Host "  worker\adminLiveTestSchedule.ts"
Write-Host "  worker\liveTestScheduler.ts"
Write-Host ""
Write-Host "Then run npm run build."
