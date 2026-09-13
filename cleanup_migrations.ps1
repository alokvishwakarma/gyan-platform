# ============================================================
# GYAN migration cleanup
# Run from:
#   D:\Projects\GYAN\gyan-platform
#
# Purpose:
# - Archive obsolete/problematic historical migrations
# - Move diagnostic SQL out of active migration stream
# - Fix SAT migration ordering
# - Preserve all working/current migrations
# ============================================================

$ErrorActionPreference = "Stop"

$root       = Get-Location
$migrations = Join-Path $root "migrations"
$archive    = Join-Path $root "migrations_archive"
$audit      = Join-Path $root "scripts\audit"

if (-not (Test-Path $migrations)) {
    throw "Migrations folder not found: $migrations"
}

New-Item -ItemType Directory -Force $archive | Out-Null
New-Item -ItemType Directory -Force $audit | Out-Null

Write-Host ""
Write-Host "GYAN migration cleanup" -ForegroundColor Cyan
Write-Host "Project: $root"
Write-Host ""

# ------------------------------------------------------------
# 1. Historical migrations proven problematic during clean rebuild
# ------------------------------------------------------------

$archiveFiles = @(
    "0118_neet_quality_test_1.sql",
    "0118_neet_quality_test_1_mapping_fixed.sql",
    "0126_education_reporting_summaries.sql",
    "0127_neet_remove_legacy_mega_banks.sql",
    "0127_neet_remove_legacy_mega_banks_v2.sql",
    "0127_neet_remove_legacy_mega_banks_v3.sql"
)

foreach ($name in $archiveFiles) {
    $source = Join-Path $migrations $name
    $target = Join-Path $archive $name

    if (Test-Path $source) {
        Write-Host "ARCHIVE  $name" -ForegroundColor Yellow
        Move-Item $source $target -Force
    }
    else {
        Write-Host "SKIP     $name (not found)" -ForegroundColor DarkGray
    }
}

# ------------------------------------------------------------
# 2. Diagnostic/audit scripts: useful, but not migrations
# ------------------------------------------------------------

$auditFiles = @(
    "0141_audit_first_live_topics.sql",
    "0141b_discover_live_topic_codes.sql",
    "0141c_discover_live_subtopics.sql",
    "0142b_live_schedule_catalog_audit.sql"
)

foreach ($name in $auditFiles) {
    $source = Join-Path $migrations $name
    $target = Join-Path $audit $name

    if (Test-Path $source) {
        Write-Host "AUDIT    $name" -ForegroundColor Cyan
        Move-Item $source $target -Force
    }
    else {
        Write-Host "SKIP     $name (not found)" -ForegroundColor DarkGray
    }
}

# ------------------------------------------------------------
# 3. Fix SAT migration ordering
#
# Correct order:
#   0153_live_test_answer_autosave.sql
#   0153a_expand_live_class_schedule_to_sat.sql
#   0153b_seed_sat_classes_2026_sep_oct.sql
#   0154_enable_sat_live_tests.sql
# ------------------------------------------------------------

$oldSatSeed = Join-Path $migrations "0153_seed_sat_classes_2026_sep_oct.sql"
$newSatSeed = Join-Path $migrations "0153b_seed_sat_classes_2026_sep_oct.sql"

if (Test-Path $oldSatSeed) {
    if (Test-Path $newSatSeed) {
        Write-Host "WARNING  0153b seed already exists; old seed not renamed." -ForegroundColor Red
    }
    else {
        Write-Host "RENAME   0153_seed_sat_classes_2026_sep_oct.sql" -ForegroundColor Green
        Write-Host "      -> 0153b_seed_sat_classes_2026_sep_oct.sql" -ForegroundColor Green
        Rename-Item $oldSatSeed "0153b_seed_sat_classes_2026_sep_oct.sql"
    }
}
elseif (Test-Path $newSatSeed) {
    Write-Host "OK       SAT seed already named 0153b_..." -ForegroundColor Green
}
else {
    Write-Host "WARNING  SAT seed migration not found." -ForegroundColor Red
}

# ------------------------------------------------------------
# 4. Verify important migrations remain active
# ------------------------------------------------------------

$requiredFiles = @(
    "0118_neet_quality_test_1_fixed.sql",
    "0118_neet_quality_test_1_unique_fixed.sql",
    "0126_clean_education_practice_reporting.sql",
    "0153a_expand_live_class_schedule_to_sat.sql",
    "0153b_seed_sat_classes_2026_sep_oct.sql",
    "0157_live_test_formula_pricing_and_sunday.sql",
    "0158_rebuild_live_tests_for_sat.sql"
)

Write-Host ""
Write-Host "Checking required working migrations..." -ForegroundColor Cyan

$missing = @()

foreach ($name in $requiredFiles) {
    $path = Join-Path $migrations $name

    if (Test-Path $path) {
        Write-Host "OK       $name" -ForegroundColor Green
    }
    else {
        Write-Host "MISSING  $name" -ForegroundColor Red
        $missing += $name
    }
}

# ------------------------------------------------------------
# 5. Show final active migration tail
# ------------------------------------------------------------

Write-Host ""
Write-Host "Latest active migrations:" -ForegroundColor Cyan

Get-ChildItem "$migrations\*.sql" |
    Where-Object { $_.Name -match '^\d{4}[a-z]?_' } |
    Sort-Object Name |
    Select-Object -Last 25 |
    ForEach-Object {
        Write-Host "  $($_.Name)"
    }

Write-Host ""

if ($missing.Count -eq 0) {
    Write-Host "Cleanup complete. Required current migrations are present." -ForegroundColor Green
}
else {
    Write-Host "Cleanup finished, but $($missing.Count) required migration(s) are missing." -ForegroundColor Yellow
    Write-Host "Do NOT delete/archive anything else until those are checked." -ForegroundColor Yellow
}