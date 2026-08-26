import QRCode from "qrcode";

import {
  ensurePuzzleEmailGyan,
  type CalendarAccessEnv,
} from "../calendarAccess";

export type PuzzleCompletionStage =
  | "5x5"
  | "7x7";

export interface PuzzleCompletionEmailEnv
  extends CalendarAccessEnv {
  RESEND_API_KEY?: string;
}

function escapeHtml(
  value: string,
): string {
  return value
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#39;");
}

function qrHtml(
  url: string,
  label: string,
): string {
  const qr = QRCode.create(
    url,
    {
      errorCorrectionLevel:
        "M",
    },
  );

  const rows: string[] = [];

  for (
    let row = 0;
    row < qr.modules.size;
    row += 1
  ) {
    const cells: string[] = [];

    for (
      let column = 0;
      column < qr.modules.size;
      column += 1
    ) {
      const dark =
        qr.modules.get(
          row,
          column,
        ) === 1;

      cells.push(
        `<td style="width:3px;height:3px;padding:0;background:${dark ? "#111" : "#fff"}"></td>`,
      );
    }

    rows.push(
      `<tr>${cells.join("")}</tr>`,
    );
  }

  return `<table role="img" aria-label="${escapeHtml(
    label,
  )}" cellpadding="0" cellspacing="0" style="border-collapse:collapse;border:5px solid #fff;outline:1px solid #e6e0d5">${rows.join(
    "",
  )}</table>`;
}

function resourceUrl(
  cards: Array<{
    type: string;
    publicUrl: string;
  }>,
  type: string,
): string {
  return (
    cards.find(
      (card) =>
        card.type === type,
    )?.publicUrl ??
    "https://gyan.cc"
  );
}

export async function sendPuzzleCompletionEmail({
  env,
  email,
  name = "",
  puzzleNumber,
  stage,
  gqScore = null,
  icons = [],
}: {
  env: PuzzleCompletionEmailEnv;
  email: string;
  name?: string;
  puzzleNumber: number;
  stage: PuzzleCompletionStage;
  gqScore?: number | null;
  icons?: string[];
}): Promise<{
  sent: boolean;
  reason?: string;
}> {
  if (!env.RESEND_API_KEY) {
    return {
      sent: false,
      reason:
        "RESEND_API_KEY is not configured.",
    };
  }

  const normalizedEmail =
    email.trim().toLowerCase();

  const account =
    await ensurePuzzleEmailGyan(
      env,
      normalizedEmail,
    );

  const certificateUrl =
    resourceUrl(
      account.safetyCards,
      "CERTIFICATE",
    );

  const helpUrl =
    resourceUrl(
      account.safetyCards,
      "HELP",
    );

  const lostFoundUrl =
    resourceUrl(
      account.safetyCards,
      "LOST_FOUND",
    );

  const iconText =
    icons
      .slice(0, 12)
      .join(" ");

  const gqLine =
    gqScore !== null
      ? `GQ ${gqScore}${iconText ? ` ${iconText}` : ""}`
      : iconText;

  const subject =
    `GYAN Puzzle Completion #${puzzleNumber} (${stage})`;

  const completion =
    stage === "7x7"
      ? `You completed GYAN Puzzle #${puzzleNumber} (7×7) and earned your medal.`
      : `You completed GYAN Puzzle #${puzzleNumber} (5×5).`;

  const safeName =
    escapeHtml(
      name.trim(),
    );

  const html = `
    <div style="font-family:Arial,sans-serif;max-width:560px;margin:0 auto;padding:22px;color:#222;line-height:1.45">
      <h2 style="text-align:center;color:#102a56;margin:0 0 14px">GYAN Puzzle Completion</h2>
      ${safeName ? `<p>Congratulations, <strong>${safeName}</strong>!</p>` : ""}
      <p>${completion}</p>
      ${gqLine ? `<p style="font-weight:700;color:#102a56">${escapeHtml(gqLine)}</p>` : ""}

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0"
        style="border-collapse:separate;border-spacing:0 14px">

        <tr>
          <td align="center" style="padding:12px;border:1px solid #e6e0d5;border-radius:10px;background:#fff">
            <div style="font-size:12px;margin-bottom:7px">
              <a href="${certificateUrl}" style="color:#1976d2;text-decoration:none">
                ${certificateUrl}
              </a>
            </div>
            ${qrHtml(certificateUrl,"Certificate QR")}
            <div style="margin-top:7px;font-size:12px;font-weight:800;letter-spacing:.08em;color:#7a4b18">
              COMPLETION
            </div>
          </td>
        </tr>

        <tr>
          <td align="center" style="padding:12px;border:1px solid #e6e0d5;border-radius:10px;background:#fff">
            <div style="font-size:12px;margin-bottom:7px">
              <a href="${account.publicUrl}" style="color:#1976d2;text-decoration:none">
                ${account.publicUrl}
              </a>
            </div>
            ${qrHtml(account.publicUrl,"GYAN Account QR")}
            <div style="margin-top:7px;font-size:12px;font-weight:800;letter-spacing:.08em;color:#102a56">
              ACCOUNT
            </div>
            <div style="margin-top:4px;font-size:12px;color:#666">
              ${escapeHtml(account.gyanName)}
            </div>
          </td>
        </tr>

        <tr>
          <td align="center" style="padding:12px;border:1px solid #e6e0d5;border-radius:10px;background:#fff">
            <div style="font-size:12px;margin-bottom:7px">
              <a href="${helpUrl}" style="color:#1976d2;text-decoration:none">
                ${helpUrl}
              </a>
            </div>
            ${qrHtml(helpUrl,"GYAN Help QR")}
            <div style="margin-top:7px;font-size:12px;font-weight:800;letter-spacing:.08em;color:#102a56">
              HELP
            </div>
            <div style="margin-top:4px;font-size:12px;color:#666;max-width:430px">
              Explains your GYAN links, shows your available QR resources,
              and guides you when editing details using your Access Code.
            </div>
          </td>
        </tr>
      </table>

      <div style="margin-top:14px;padding:12px 14px;background:#fff7e6;border:1px solid #ead2a4;border-radius:9px">
        <strong style="color:#7a4b18">Your Access Code</strong><br>
        <span style="font-size:20px;font-weight:800;letter-spacing:1px;color:#102a56">${escapeHtml(account.accessCode)}</span>
        <div style="font-size:12px;color:#6b6258;margin-top:5px">
          Keep this code private. Use it to edit certificate, Lost &amp; Found,
          Emergency and Help details.
        </div>
      </div>

      <p><strong>🎁 Freebie unlocked:</strong>
        Lost &amp; Found QR stickers are available from your GYAN Account.
        <a href="${lostFoundUrl}">Lost &amp; Found</a>
      </p>

      <p>Play again tomorrow at <a href="https://gyan.cc/">https://gyan.cc/</a>.</p>
      <p style="font-size:11px;color:#777">
        Public QR links do not contain your Access Code. Keep the Access Code private.
      </p>
    </div>`;

  const text = [
    "GYAN Puzzle Completion",
    name.trim()
      ? `Congratulations, ${name.trim()}!`
      : "",
    completion,
    gqLine,
    `Your Certificate: ${certificateUrl}`,
    `Your GYAN Account: ${account.gyanName} - ${account.publicUrl}`,
    `Help: ${helpUrl}`,
    `Your Access Code: ${account.accessCode}`,
    "Keep this code private. Use it to edit certificate, Lost & Found, Emergency and Help details.",
    "Freebie unlocked: Lost & Found QR stickers are available from your GYAN Account.",
    "Play again tomorrow at https://gyan.cc/.",
  ]
    .filter(Boolean)
    .join("\n\n");

  try {
    const response =
      await fetch(
        "https://api.resend.com/emails",
        {
          method: "POST",
          headers: {
            authorization:
              `Bearer ${env.RESEND_API_KEY}`,
            "content-type":
              "application/json",
          },
          body:
            JSON.stringify({
              from:
                "GYAN Puzzle <admin@gyan.cc>",
              to: [
                normalizedEmail,
              ],
              bcc:
                normalizedEmail ===
                  "admin@gyan.cc"
                  ? undefined
                  : [
                      "admin@gyan.cc",
                    ],
              subject,
              html,
              text,
            }),
        },
      );

    if (!response.ok) {
      return {
        sent: false,
        reason:
          await response.text(),
      };
    }

    return {
      sent: true,
    };
  } catch (error) {
    return {
      sent: false,
      reason:
        error instanceof Error
          ? error.message
          : "Unexpected email error.",
    };
  }
}
