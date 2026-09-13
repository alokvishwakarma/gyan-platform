# add_request_chat_button_current.ps1
# Run from D:\Projects\GYAN\gyan-platform
#
# Uses CURRENT local App.tsx and PublicHomePage.tsx.
# It does not replace either large file.
# Replace ChatPanel.tsx separately with the supplied final ChatPanel.tsx first.

$ErrorActionPreference = "Stop"

$home = ".\src\components\PublicHomePage.tsx"
$app  = ".\src\App.tsx"

foreach ($path in @($home, $app)) {
  if (-not (Test-Path $path)) {
    throw "Required file not found: $path"
  }
}

function Backup-Once([string]$Path) {
  $backup = "$Path.before-request-chat-button.bak"
  if (-not (Test-Path $backup)) {
    Copy-Item $Path $backup
  }
}

# ============================================================
# PublicHomePage.tsx
# ============================================================
$text = Get-Content $home -Raw

if ($text -notmatch '\bonOpenRequestChat\??\s*:') {
  $propsEnd = $text.IndexOf("interface PublicHomePageProps")
  if ($propsEnd -lt 0) {
    throw "PublicHomePageProps not found."
  }

  $braceStart = $text.IndexOf("{", $propsEnd)
  $braceEnd = $text.IndexOf("`n}", $braceStart)

  if ($braceEnd -lt 0) {
    throw "PublicHomePageProps closing brace not found."
  }

  $prop = @'

  onOpenRequestChat?: (
    requestNumber: string,
  ) => void;
'@

  $text = $text.Insert($braceEnd, $prop)
}

$header = [regex]::Match(
  $text,
  '(?s)export\s+default\s+function\s+PublicHomePage\s*\(\s*\{(?<body>.*?)\}\s*:\s*PublicHomePageProps\s*\)'
)

if (-not $header.Success) {
  throw "PublicHomePage function header not found."
}

if ($header.Groups["body"].Value -notmatch '\bonOpenRequestChat\b') {
  $insertAt = $header.Groups["body"].Index + $header.Groups["body"].Length
  $text = $text.Insert(
    $insertAt,
    "`r`n  onOpenRequestChat,`r`n"
  )
}

if ($text -notmatch 'title="Chat about this request"') {
  $setter = $text.LastIndexOf(
    "setServiceRequestDetailExpanded("
  )

  if ($setter -lt 0) {
    throw "Request-detail More button was not found."
  }

  $buttonStart = $text.LastIndexOf(
    "<button",
    $setter
  )

  if ($buttonStart -lt 0) {
    throw "Request-detail footer button was not found."
  }

  $chatButton = @'
<button
                  type="button"
                  title="Chat about this request"
                  disabled={
                    !onOpenRequestChat
                  }
                  onClick={() => {
                    if (
                      !serviceRequestDetail ||
                      !onOpenRequestChat
                    ) {
                      return;
                    }

                    setServiceRequestDetailOpen(
                      false,
                    );

                    onOpenRequestChat(
                      serviceRequestDetail
                        .requestNumber,
                    );
                  }}
                  style={{
                    width:
                      "100%",
                    minHeight:
                      "30px",
                    border:
                      "1px solid #bfdbfe",
                    borderRadius:
                      "8px",
                    background:
                      "#eff6ff",
                    color:
                      "#1d4ed8",
                    font:
                      "inherit",
                    fontSize:
                      "0.68rem",
                    fontWeight:
                      800,
                    cursor:
                      onOpenRequestChat
                        ? "pointer"
                        : "default",
                  }}
                >
                  💬 Chat
                </button>

                '@

  $text = $text.Insert(
    $buttonStart,
    $chatButton
  )
}

Backup-Once $home
Set-Content -Path $home -Value $text -NoNewline


# ============================================================
# App.tsx
# ============================================================
$text = Get-Content $app -Raw

if ($text -notmatch '\bchatRequestNumber\b') {
  $m = [regex]::Match(
    $text,
    '(?s)const\s*\[\s*chatOpen\s*,\s*setChatOpen\s*,?\s*\]\s*=\s*useState\(false\);'
  )

  if (-not $m.Success) {
    throw "chatOpen state not found in App.tsx."
  }

  $state = @'


  const [
    chatRequestNumber,
    setChatRequestNumber,
  ] =
    useState("");
'@

  $text = $text.Insert(
    $m.Index + $m.Length,
    $state
  )
}

if ($text -notmatch 'initialRequestNumber=\{\s*chatRequestNumber') {
  $chatPanel = $text.IndexOf("<ChatPanel")

  if ($chatPanel -lt 0) {
    throw "ChatPanel render not found in App.tsx."
  }

  $insertAt =
    $chatPanel +
    "<ChatPanel".Length

  $prop = @'

          initialRequestNumber={
            chatRequestNumber ||
            undefined
          }
'@

  $text = $text.Insert(
    $insertAt,
    $prop
  )
}

if ($text -notmatch 'onOpenRequestChat=\{') {
  $matches = [regex]::Matches(
    $text,
    '(?s)<PublicHomePage\b.*?/>'
  )

  if ($matches.Count -eq 0) {
    throw "PublicHomePage render not found in App.tsx."
  }

  # Use the last/current main PublicHomePage render.
  $m = $matches[$matches.Count - 1]
  $block = $m.Value

  $insertAt = $block.LastIndexOf("/>")

  if ($insertAt -lt 0) {
    throw "PublicHomePage closing tag not found."
  }

  $callback = @'

          onOpenRequestChat={(requestNumber) => {
            setChatRequestNumber(
              requestNumber
                .trim()
                .toUpperCase(),
            );

            setChatOpen(
              true,
            );
          }}
'@

  $block =
    $block.Insert(
      $insertAt,
      $callback
    )

  $text =
    $text.Remove(
      $m.Index,
      $m.Length
    ).Insert(
      $m.Index,
      $block
    )
}

Backup-Once $app
Set-Content -Path $app -Value $text -NoNewline

Write-Host "Request Chat wiring applied."
Write-Host "Run: npm run build"
