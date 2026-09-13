# apply_admin_live_test_schedule.ps1
# Run from the gyan-platform project root.
#
# Guarded edits:
#   worker/index.ts
#   src/components/EducationLearningHub.tsx
#   src/components/EducationPortal.tsx
#
# New files must already be copied:
#   worker/adminLiveTestSchedule.ts
#   src/components/AdminLiveTestSchedule.tsx
#   src/components/AdminLiveTestSchedule.css

$ErrorActionPreference = "Stop"

function Backup-Once([string]$Path) {
    $backup = "$Path.before-admin-live-schedule.bak"
    if (-not (Test-Path $backup)) {
        Copy-Item $Path $backup
    }
}

# ------------------------------------------------------------
# worker/index.ts
# ------------------------------------------------------------
$index = ".\worker\index.ts"
$text = Get-Content $index -Raw

if ($text -notmatch 'handleAdminLiveTestScheduleRoute') {
    $anchor = 'import {' + "`r`n" + '  handleLiveTestsRoute,' + "`r`n" + '} from "./liveTests";'

    if (-not $text.Contains($anchor)) {
        $anchor = 'import {' + "`n" + '  handleLiveTestsRoute,' + "`n" + '} from "./liveTests";'
    }

    if (-not $text.Contains($anchor)) {
        throw "worker/index.ts: liveTests import anchor not found."
    }

    $insert = @'

import {
  handleAdminLiveTestScheduleRoute,
} from "./adminLiveTestSchedule";
'@

    $text = $text.Replace(
        $anchor,
        $anchor + $insert
    )

    $routeAnchor = @'
  const liveTestsResponse =
  await handleLiveTestsRoute(
    request,
    env,
    url,
  );

if (
  liveTestsResponse
) {
  return liveTestsResponse;
}
'@

    if (-not $text.Contains($routeAnchor)) {
        # tolerate indentation used by current file
        $pattern = '(?s)(const\s+liveTestsResponse\s*=\s*await\s+handleLiveTestsRoute\(\s*request,\s*env,\s*url,\s*\);\s*if\s*\(\s*liveTestsResponse\s*\)\s*\{\s*return\s+liveTestsResponse;\s*\})'
        $m = [regex]::Match($text, $pattern)

        if (-not $m.Success) {
            throw "worker/index.ts: Live Test route block not found."
        }

        $routeInsert = @'

  const adminLiveTestScheduleResponse =
    await handleAdminLiveTestScheduleRoute(
      request,
      env,
      url,
    );

  if (
    adminLiveTestScheduleResponse
  ) {
    return adminLiveTestScheduleResponse;
  }
'@

        $text = $text.Insert(
            $m.Index + $m.Length,
            $routeInsert
        )
    }
    else {
        $routeInsert = @'

  const adminLiveTestScheduleResponse =
    await handleAdminLiveTestScheduleRoute(
      request,
      env,
      url,
    );

  if (
    adminLiveTestScheduleResponse
  ) {
    return adminLiveTestScheduleResponse;
  }
'@

        $text = $text.Replace(
            $routeAnchor,
            $routeAnchor + $routeInsert
        )
    }

    Backup-Once $index
    Set-Content -Path $index -Value $text -NoNewline
    Write-Host "Patched worker/index.ts"
}
else {
    Write-Host "worker/index.ts already patched"
}

# ------------------------------------------------------------
# EducationLearningHub.tsx
# ------------------------------------------------------------
$hub = ".\src\components\EducationLearningHub.tsx"
$text = Get-Content $hub -Raw

if ($text -notmatch 'AdminLiveTestSchedule') {
    $importAnchor = 'import LiveTestRunner from "./LiveTestRunner";'

    if (-not $text.Contains($importAnchor)) {
        throw "EducationLearningHub.tsx: LiveTestRunner import not found."
    }

    $text = $text.Replace(
        $importAnchor,
        $importAnchor + "`r`nimport AdminLiveTestSchedule from `"./AdminLiveTestSchedule`";"
    )

    $stepAnchor = '| "live-test";'
    if (-not $text.Contains($stepAnchor)) {
        throw "EducationLearningHub.tsx: Step union anchor not found."
    }

    $text = $text.Replace(
        $stepAnchor,
        '| "live-test"' + "`r`n" + '  | "admin-live-tests";'
    )

    $portalAnchor = '          onLiveTest={('
    $portalIndex = $text.IndexOf($portalAnchor)
    if ($portalIndex -lt 0) {
        throw "EducationLearningHub.tsx: EducationPortal onLiveTest anchor not found."
    }

    $adminProp = @'
          onAdminLiveTests={() => {
            setStep(
              "admin-live-tests",
            );
          }}

'@

    $text = $text.Insert(
        $portalIndex,
        $adminProp
    )

    $renderAnchor = '  if (' + "`r`n" + '    step ===' + "`r`n" + '      "portal"' + "`r`n" + '  ) {'
    if (-not $text.Contains($renderAnchor)) {
        $renderAnchor = '  if (' + "`n" + '    step ===' + "`n" + '      "portal"' + "`n" + '  ) {'
    }

    if (-not $text.Contains($renderAnchor)) {
        throw "EducationLearningHub.tsx: portal render anchor not found."
    }

    $adminRender = @'
  if (
    step ===
      "admin-live-tests"
  ) {
    return (
      <AdminLiveTestSchedule
        onBack={() => {
          setStep(
            "portal",
          );
        }}
      />
    );
  }


'@

    $text = $text.Replace(
        $renderAnchor,
        $adminRender + $renderAnchor
    )

    Backup-Once $hub
    Set-Content -Path $hub -Value $text -NoNewline
    Write-Host "Patched EducationLearningHub.tsx"
}
else {
    Write-Host "EducationLearningHub.tsx already patched"
}

# ------------------------------------------------------------
# EducationPortal.tsx
# ------------------------------------------------------------
$portal = ".\src\components\EducationPortal.tsx"
$text = Get-Content $portal -Raw

if ($text -notmatch 'onAdminLiveTests') {
    $propAnchor = @'
  onLiveTest?:
    (
      code: string,
    ) => void;

'@

    if (-not $text.Contains($propAnchor)) {
        throw "EducationPortal.tsx: onLiveTest prop anchor not found."
    }

    $newProp = @'
  onLiveTest?:
    (
      code: string,
    ) => void;

  onAdminLiveTests?:
    () => void;

'@

    $text = $text.Replace(
        $propAnchor,
        $newProp
    )

    $destructureAnchor = '  adminAuthenticated =' + "`r`n" + '    false,'
    $dIndex = $text.IndexOf($destructureAnchor)

    if ($dIndex -lt 0) {
        $destructureAnchor = '  adminAuthenticated =' + "`n" + '    false,'
        $dIndex = $text.IndexOf($destructureAnchor)
    }

    if ($dIndex -lt 0) {
        throw "EducationPortal.tsx: props destructuring anchor not found."
    }

    # Insert onAdminLiveTests after adminAuthenticated default block.
    $after = $dIndex + $destructureAnchor.Length
    $text = $text.Insert(
        $after,
        "`r`n  onAdminLiveTests,"
    )

    $buttonAnchor = @'
                  <button
                    type="button"
                    onClick={() =>
                      onLiveTest?.(
                        "ADMIN101",
                      )
                    }
                    title="Permanent admin-only live test"
                  >
                    Test #101
                  </button>
'@

    if (-not $text.Contains($buttonAnchor)) {
        throw "EducationPortal.tsx: Admin Test #101 button anchor not found."
    }

    $scheduleButton = @'

                  <button
                    type="button"
                    onClick={() =>
                      onAdminLiveTests?.()
                    }
                    title="Manage generated Live Test schedule"
                  >
                    Schedule
                  </button>
'@

    $text = $text.Replace(
        $buttonAnchor,
        $buttonAnchor + $scheduleButton
    )

    Backup-Once $portal
    Set-Content -Path $portal -Value $text -NoNewline
    Write-Host "Patched EducationPortal.tsx"
}
else {
    Write-Host "EducationPortal.tsx already patched"
}

Write-Host ""
Write-Host "Admin Live Test schedule integration applied."
Write-Host "Run:"
Write-Host "  npm run build"
