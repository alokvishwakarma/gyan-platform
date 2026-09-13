# fix_current_education_hub_admin_schedule.ps1
# Run from: D:\Projects\GYAN\gyan-platform
#
# Patches CURRENT src/components/EducationLearningHub.tsx in place.
# Creates a backup once.
#
# Adds only the missing Admin Live Test Schedule wiring:
#   import AdminLiveTestSchedule
#   Step union member "admin-live-tests"
#   onAdminLiveTests handler passed to EducationPortal
#   render block for AdminLiveTestSchedule

$ErrorActionPreference = "Stop"

$hub = ".\src\components\EducationLearningHub.tsx"

if (-not (Test-Path $hub)) {
    throw "EducationLearningHub.tsx not found at $hub"
}

$text = Get-Content $hub -Raw

$backup = "$hub.before-admin-live-tests.bak"
if (-not (Test-Path $backup)) {
    Copy-Item $hub $backup
    Write-Host "Backup created: $backup"
}

# ------------------------------------------------------------
# 1. Import AdminLiveTestSchedule
# ------------------------------------------------------------
if ($text -notmatch 'import\s+AdminLiveTestSchedule\s+from\s+"\.\/AdminLiveTestSchedule"') {
    $pattern = 'import\s+LiveTestRunner\s+from\s+"\.\/LiveTestRunner";'
    $m = [regex]::Match($text, $pattern)

    if (-not $m.Success) {
        throw "Could not find LiveTestRunner import."
    }

    $insert = "`r`nimport AdminLiveTestSchedule from `"./AdminLiveTestSchedule`";"

    $text = $text.Insert(
        $m.Index + $m.Length,
        $insert
    )

    Write-Host "Added AdminLiveTestSchedule import"
}
else {
    Write-Host "AdminLiveTestSchedule import already present"
}

# ------------------------------------------------------------
# 2. Add admin-live-tests to Step union
# ------------------------------------------------------------
if ($text -notmatch '"admin-live-tests"') {
    $pattern = '(\|\s*"live-test"\s*;)'
    $m = [regex]::Match($text, $pattern)

    if (-not $m.Success) {
        throw 'Could not find Step union member | "live-test";'
    }

    $replacement =
        '| "live-test"' + "`r`n" +
        '  | "admin-live-tests";'

    $text =
        $text.Substring(0, $m.Index) +
        $replacement +
        $text.Substring($m.Index + $m.Length)

    Write-Host 'Added "admin-live-tests" step'
}
else {
    Write-Host '"admin-live-tests" step already present'
}

# ------------------------------------------------------------
# 3. Pass handler into EducationPortal
# ------------------------------------------------------------
if ($text -notmatch 'onAdminLiveTests\s*=\s*\{') {
    $portalIndex = $text.IndexOf("<EducationPortal")

    if ($portalIndex -lt 0) {
        throw "Could not find <EducationPortal."
    }

    $liveIndex = $text.IndexOf("onLiveTest={", $portalIndex)

    if ($liveIndex -lt 0) {
        throw "Could not find onLiveTest prop on EducationPortal."
    }

    $insert = @'
          onAdminLiveTests={() => {
            setStep(
              "admin-live-tests",
            );
          }}

'@

    $text = $text.Insert(
        $liveIndex,
        $insert
    )

    Write-Host "Added onAdminLiveTests handler to EducationPortal"
}
else {
    Write-Host "onAdminLiveTests handler already present"
}

# ------------------------------------------------------------
# 4. Render AdminLiveTestSchedule
# ------------------------------------------------------------
if ($text -notmatch 'step\s*===\s*"admin-live-tests"') {
    # Put it before the portal branch.
    $pattern = '(?s)(\s+if\s*\(\s*step\s*===\s*"portal"\s*\)\s*\{)'
    $m = [regex]::Match($text, $pattern)

    if (-not $m.Success) {
        throw 'Could not find if (step === "portal") render branch.'
    }

    $render = @'

  if (
    step ===
      "admin-live-tests"
  ) {
    return (
      <>
        {educationAccessNotice}

        <AdminLiveTestSchedule
          onBack={() => {
            setStep(
              "portal",
            );
          }}
        />
      </>
    );
  }

'@

    $text = $text.Insert(
        $m.Index,
        $render
    )

    Write-Host "Added AdminLiveTestSchedule render block"
}
else {
    Write-Host "AdminLiveTestSchedule render block already present"
}

Set-Content -Path $hub -Value $text -NoNewline

Write-Host ""
Write-Host "EducationLearningHub.tsx updated."
Write-Host ""
Write-Host "Verify with:"
Write-Host '  Select-String -Path .\src\components\EducationLearningHub.tsx -Pattern "AdminLiveTestSchedule|admin-live-tests|onAdminLiveTests" -Context 2,5'
Write-Host ""
Write-Host "Then run:"
Write-Host "  npm run build"
