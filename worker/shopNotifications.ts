interface PrintRequestNotification {
  shopName: string;
  shopEmail: string;

  orderNumber: string;

  customerName: string;
  phoneNumber: string;
  whatsAppNumber: string;
  emailAddress: string;

  fileNames: string[];

  estimatedPages: number;
  copies: number;

  colorMode: string;
  printSides: string;
  paperSize: string;

  instructions: string;
  estimatedAmountRupees: number;
}

interface ResendResponse {
  id?: string;

  message?: string;
  error?: {
    message?: string;
  };
}

function escapeHtml(
  value: string,
): string {
  return value
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

function formatSetting(
  value: string,
): string {
  return value
    .replaceAll("-", " ")
    .replace(/\b\w/g, (character) =>
      character.toUpperCase(),
    );
}

function normalizeWhatsAppNumber(
  value: string,
): string {
  let digits =
    value.replace(/\D/g, "");

  /*
   * Most GYAN customers currently use
   * Indian mobile numbers.
   *
   * Add country code 91 when a plain
   * 10-digit number is supplied.
   */
  if (digits.length === 10) {
    digits = `91${digits}`;
  }

  return digits;
}

function createWhatsAppLink(
  whatsAppNumber: string,
  orderNumber: string,
  customerName: string,
): string | null {
  const normalizedNumber =
    normalizeWhatsAppNumber(
      whatsAppNumber,
    );

  if (!normalizedNumber) {
    return null;
  }

  const message =
    [
      `Hello ${customerName},`,
      "",
      `We received your GYAN print request ${orderNumber}.`,
      "We will review the documents and confirm the final amount shortly.",
    ].join("\n");

  return (
    `https://wa.me/${normalizedNumber}` +
    `?text=${encodeURIComponent(message)}`
  );
}

export async function sendPrintRequestEmail(
  env: Env,
  notification:
    PrintRequestNotification,
): Promise<{
  sent: boolean;
  emailId?: string;
  reason?: string;
}> {
  if (!notification.shopEmail) {
    return {
      sent: false,
      reason:
        "The shop does not have an email address.",
    };
  }

  if (!env.RESEND_API_KEY) {
    return {
      sent: false,
      reason:
        "RESEND_API_KEY is not configured.",
    };
  }

  const whatsappLink =
    createWhatsAppLink(
      notification.whatsAppNumber ||
        notification.phoneNumber,
      notification.orderNumber,
      notification.customerName,
    );

  const fileList =
    notification.fileNames
      .map(
        (fileName) =>
          `<li>${escapeHtml(fileName)}</li>`,
      )
      .join("");

  const instructionsHtml =
    notification.instructions
      ? escapeHtml(
          notification.instructions,
        )
      : "No special instructions";

  const customerEmailHtml =
    notification.emailAddress
      ? escapeHtml(
          notification.emailAddress,
        )
      : "Not provided";

  const whatsappButton =
    whatsappLink
      ? `
        <p style="margin:24px 0;">
          <a
            href="${escapeHtml(whatsappLink)}"
            style="
              display:inline-block;
              padding:12px 18px;
              background:#1f8f4e;
              color:#ffffff;
              text-decoration:none;
              font-weight:700;
              border-radius:4px;
            "
          >
            Open customer WhatsApp
          </a>
        </p>
      `
      : "";

  const html = `
    <div
      style="
        max-width:640px;
        margin:0 auto;
        padding:24px;
        background:#fffdf8;
        color:#332317;
        font-family:Arial,sans-serif;
        line-height:1.5;
      "
    >
      <p
        style="
          margin:0;
          color:#7d6a54;
          font-size:12px;
          font-weight:700;
          letter-spacing:1px;
        "
      >
        GYAN PRINT
      </p>

      <h1
        style="
          margin:6px 0 4px;
          font-size:24px;
        "
      >
        New print request
      </h1>

      <p style="margin-top:0;">
        A new print request was submitted to
        <strong>
          ${escapeHtml(notification.shopName)}
        </strong>.
      </p>

      <div
        style="
          margin:20px 0;
          padding:16px;
          background:#f4eadc;
          border:1px solid #e3d5c2;
        "
      >
        <div style="font-size:12px;color:#7d6a54;">
          ORDER NUMBER
        </div>

        <div
          style="
            margin-top:4px;
            font-family:Consolas,monospace;
            font-size:20px;
            font-weight:700;
          "
        >
          ${escapeHtml(notification.orderNumber)}
        </div>
      </div>

      <h2 style="font-size:17px;">
        Customer
      </h2>

      <table
        style="
          width:100%;
          border-collapse:collapse;
        "
      >
        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Name
          </td>
          <td style="padding:6px 0;font-weight:700;">
            ${escapeHtml(notification.customerName)}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Mobile
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(notification.phoneNumber)}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            WhatsApp
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(
              notification.whatsAppNumber ||
                notification.phoneNumber,
            )}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Email
          </td>
          <td style="padding:6px 0;">
            ${customerEmailHtml}
          </td>
        </tr>
      </table>

      ${whatsappButton}

      <h2 style="font-size:17px;">
        Print preferences
      </h2>

      <table
        style="
          width:100%;
          border-collapse:collapse;
        "
      >
        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Estimated pages
          </td>
          <td style="padding:6px 0;">
            ${notification.estimatedPages}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Copies
          </td>
          <td style="padding:6px 0;">
            ${notification.copies}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Color
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(
              formatSetting(
                notification.colorMode,
              ),
            )}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Sides
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(
              formatSetting(
                notification.printSides,
              ),
            )}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Paper
          </td>
          <td style="padding:6px 0;">
            ${escapeHtml(
              notification.paperSize.toUpperCase(),
            )}
          </td>
        </tr>

        <tr>
          <td style="padding:6px 0;color:#7d6a54;">
            Estimate
          </td>
          <td style="padding:6px 0;font-weight:700;">
            ₹${notification.estimatedAmountRupees}
          </td>
        </tr>
      </table>

      <h2 style="font-size:17px;">
        Uploaded files
      </h2>

      <ul>
        ${fileList}
      </ul>

      <h2 style="font-size:17px;">
        Instructions
      </h2>

      <p
        style="
          padding:12px;
          background:#ffffff;
          border:1px solid #e8dfd1;
        "
      >
        ${instructionsHtml}
      </p>

      <p
        style="
          margin-top:24px;
          color:#7d6a54;
          font-size:12px;
        "
      >
        This notification was generated automatically by GYAN.
      </p>
    </div>
  `;

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

          body: JSON.stringify({
            from:
              "GYAN Orders <admin@gyan.cc>",

            to: [
              notification.shopEmail,
            ],

            subject:
              `New print request ${notification.orderNumber}`,

            html,
          }),
        },
      );

    const result =
      (await response.json()) as
        ResendResponse;

    if (!response.ok) {
      const reason =
        result.message ??
        result.error?.message ??
        "Resend rejected the email.";

      console.error(
        "Print notification email failed:",
        reason,
      );

      return {
        sent: false,
        reason,
      };
    }

    return {
      sent: true,
      emailId: result.id,
    };
  } catch (error) {
    const reason =
      error instanceof Error
        ? error.message
        : "Unexpected email error.";

    console.error(
      "Print notification email failed:",
      reason,
    );

    return {
      sent: false,
      reason,
    };
  }
}