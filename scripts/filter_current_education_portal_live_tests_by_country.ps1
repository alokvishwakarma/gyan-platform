# filter_current_education_portal_live_tests_by_country.ps1
# Run from project root.
#
# Purpose:
#   Public Education live-test strip follows existing Education country:
#     IN -> JEE / NEET
#     US -> SAT
#
# This is a UI filter using the existing EducationCountry prop.
# It does not request browser geolocation.

$ErrorActionPreference = "Stop"

$portal = ".\src\components\EducationPortal.tsx"
if (-not (Test-Path $portal)) {
    throw "EducationPortal.tsx not found."
}

$text = Get-Content $portal -Raw

$backup = "$portal.before-live-country-filter.bak"
if (-not (Test-Path $backup)) {
    Copy-Item $portal $backup
}

# Find the state assignment that accepts API liveTests and filter there.
# Covers common current forms:
#   setLiveTests(body.liveTests ?? [])
#   setLiveTests(Array.isArray(body.liveTests) ? body.liveTests : [])
#
# Rather than risky regex replacement, add a derived display array and
# replace rendering maps when an exact liveTests.map(...) exists.

if ($text -notmatch 'countryVisibleLiveTests') {
    $marker = '  return ('

    $idx = $text.LastIndexOf($marker)
    if ($idx -lt 0) {
        throw "Could not find component return."
    }

    $derived = @'
  const countryVisibleLiveTests =
    liveTests.filter(
      (
        test,
      ) =>
        country ===
          "IN"
          ? (
              test.program ===
                "JEE" ||
              test.program ===
                "NEET"
            )
          : test.program ===
              "SAT",
    );


'@

    $text = $text.Insert(
        $idx,
        $derived
    )

    $text = $text.Replace(
        'liveTests.map(',
        'countryVisibleLiveTests.map('
    )

    $text = $text.Replace(
        'liveTests.length',
        'countryVisibleLiveTests.length'
    )

    Set-Content -Path $portal -Value $text -NoNewline
    Write-Host "EducationPortal country filter added."
}
else {
    Write-Host "EducationPortal country filter already present."
}

Write-Host "Run npm run build"
