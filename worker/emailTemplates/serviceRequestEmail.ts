export interface ServiceEmailCustomer {
  name?: string | null;
  phone?: string | null;
  whatsApp?: string | null;
  email?: string | null;
}

export interface ServiceEmailFile {
  name: string;
  size: number;
}

export interface ServiceEmailRow {
  label: string;
  value: string;
}

export interface ServiceEmailSection {
  label: string;
  rows: ServiceEmailRow[];
}

export interface ServiceEmailAction {
  label: string;
  url: string;
  primary?: boolean;
}

export interface ServiceRequestEmailInput {
  recipient:
    | "shop"
    | "customer"
    | "admin";

  serviceName: string;
  requestNumber: string;
  status: string;

  shopName: string;
  shopCode: string;

  customer: ServiceEmailCustomer;

  files: ServiceEmailFile[];
  sections: ServiceEmailSection[];

  actions?: ServiceEmailAction[];

  createdAt: string;
  retentionDays: number;
}

export interface RenderedServiceEmail {
  subject: string;
  html: string;
  text: string;
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

function formatFileSize(
  bytes: number,
): string {
  if (bytes < 1024) {
    return `${bytes} B`;
  }

  if (
    bytes <
    1024 * 1024
  ) {
    return `${(
      bytes / 1024
    ).toFixed(1)} KB`;
  }

  return `${(
    bytes /
    (1024 * 1024)
  ).toFixed(1)} MB`;
}

function formatDate(
  value: Date,
): string {
  return new Intl.DateTimeFormat(
    "en-IN",
    {
      year: "numeric",
      month: "long",
      day: "numeric",
      timeZone: "UTC",
    },
  ).format(value);
}

function calculateExpirationDate(
  createdAt: string,
  retentionDays: number,
): Date {
  const createdDate =
    new Date(createdAt);

  const safeCreatedDate =
    Number.isNaN(
      createdDate.getTime(),
    )
      ? new Date()
      : createdDate;

  return new Date(
    safeCreatedDate.getTime() +
      retentionDays *
        24 *
        60 *
        60 *
        1000,
  );
}

function renderCustomerRows(
  customer:
    ServiceEmailCustomer,
): ServiceEmailRow[] {
  const rows:
    ServiceEmailRow[] = [];

  if (customer.name) {
    rows.push({
      label: "Name",
      value: customer.name,
    });
  }

  if (customer.phone) {
    rows.push({
      label: "Mobile",
      value: customer.phone,
    });
  }

  if (customer.whatsApp) {
    rows.push({
      label: "WhatsApp",
      value: customer.whatsApp,
    });
  }

  if (customer.email) {
    rows.push({
      label: "Email",
      value: customer.email,
    });
  }

  return rows;
}

function hasMeaningfulValue(
  value: string,
): boolean {
  const normalized =
    value
      .trim()
      .toLowerCase();

  return (
    normalized.length > 0 &&
    normalized !==
      "not provided" &&
    normalized !==
      "none selected" &&
    normalized !==
      "n/a" &&
    normalized !==
      "na"
  );
}

function meaningfulRows(
  rows: ServiceEmailRow[],
): ServiceEmailRow[] {
  return rows.filter(
    (row) =>
      hasMeaningfulValue(
        row.value,
      ),
  );
}

function renderHtmlRows(
  rows: ServiceEmailRow[],
): string {
  return rows
    .map(
      (row) => `
        <tr>
          <td
            style="
              width:38%;
              padding:7px 8px 7px 0;
              color:#6b7b8d;
              vertical-align:top;
            "
          >
            ${escapeHtml(row.label)}
          </td>

          <td
            style="
              padding:7px 0;
              color:#17365d;
              font-weight:600;
              vertical-align:top;
              overflow-wrap:anywhere;
            "
          >
            ${escapeHtml(row.value)}
          </td>
        </tr>
      `,
    )
    .join("");
}

function renderHtmlSection(
  section:
    ServiceEmailSection,
): string {
  const rows =
    meaningfulRows(
      section.rows,
    );

  if (
    rows.length === 0
  ) {
    return "";
  }

  return `
    <section
      style="
        margin-top:18px;
        padding:16px;
        background:#ffffff;
        border:1px solid #dbe5ef;
        border-radius:10px;
      "
    >
      <h2
        style="
          margin:0 0 8px;
          color:#17365d;
          font-size:16px;
        "
      >
        ${escapeHtml(section.label)}
      </h2>

      <table
        role="presentation"
        style="
          width:100%;
          border-collapse:collapse;
        "
      >
        ${renderHtmlRows(rows)}
      </table>
    </section>
  `;
}

function renderTextSection(
  section:
    ServiceEmailSection,
): string {
  const rows =
    meaningfulRows(
      section.rows,
    );

  if (
    rows.length === 0
  ) {
    return "";
  }

  return [
    section.label,
    "-".repeat(
      section.label.length,
    ),

    ...rows.map(
      (row) =>
        `${row.label}: ${row.value}`,
    ),

    "",
  ].join("\n");
}

function renderActions(
  actions:
    | ServiceEmailAction[]
    | undefined,
): string {
  if (
    !actions ||
    actions.length === 0
  ) {
    return "";
  }

  return `
    <div
      style="
        margin-top:20px;
      "
    >
      ${actions
        .map(
          (action) => `
            <a
              href="${escapeHtml(action.url)}"
              style="
                display:inline-block;
                min-width:130px;
                margin:0 8px 8px 0;
                padding:11px 16px;
                border:1px solid ${
                  action.primary
                    ? "#145da0"
                    : "#b8c7d8"
                };
                border-radius:8px;
                background:${
                  action.primary
                    ? "#1565c0"
                    : "#ffffff"
                };
                color:${
                  action.primary
                    ? "#ffffff"
                    : "#24415f"
                };
                text-decoration:none;
                font-size:13px;
                font-weight:700;
                text-align:center;
              "
            >
              ${escapeHtml(action.label)}
            </a>
          `,
        )
        .join("")}
    </div>
  `;
}


function formatStatus(
  value: string,
): string {
  const normalized =
    value
      .trim()
      .replace(
        /[_-]+/g,
        " ",
      );

  return normalized
    .replace(
      /\b\w/g,
      (character) =>
        character.toUpperCase(),
    );
}

function getRecipientSubjectLabel(
  recipient:
    ServiceRequestEmailInput[
      "recipient"
    ],
): string {
  if (
    recipient === "shop"
  ) {
    return "Shop";
  }

  if (
    recipient === "admin"
  ) {
    return "Admin";
  }

  return "User";
}

function getRecipientCopy(
  input:
    ServiceRequestEmailInput,
): {
  eyebrow: string;
  title: string;
  introduction: string;
  subject: string;
} {
  const status =
    formatStatus(
      input.status,
    );

  const subject =
    `${getRecipientSubjectLabel(
      input.recipient,
    )} - ${input.serviceName} - ${status} - ${input.requestNumber}`;

  if (
    input.recipient ===
    "shop"
  ) {
    return {
      eyebrow:
        "GYAN SHOP REQUEST",

      title:
        `${input.serviceName} request`,

      introduction:
        `A ${input.serviceName} request has been assigned to ${input.shopName}. Please review it and contact the customer.`,

      subject,
    };
  }

  if (
    input.recipient ===
    "admin"
  ) {
    return {
      eyebrow:
        "GYAN ADMIN",

      title:
        `${input.serviceName} request`,

      introduction:
        `A ${input.serviceName} request was submitted and routed to ${input.shopName}.`,

      subject,
    };
  }

  return {
    eyebrow:
      "GYAN SERVICE",

    title:
      `${input.serviceName} request`,

    introduction:
      `Your ${input.serviceName} request has been received. A GYAN team member will review it and contact you by phone, WhatsApp, or email.`,

    subject,
  };
}

export function renderServiceRequestEmail(
  input:
    ServiceRequestEmailInput,
): RenderedServiceEmail {
  const expirationDate =
    calculateExpirationDate(
      input.createdAt,
      input.retentionDays,
    );

  const expirationText =
    formatDate(
      expirationDate,
    );

  const copy =
    getRecipientCopy(
      input,
    );

  const customerRows =
    meaningfulRows(
      renderCustomerRows(
        input.customer,
      ),
    );

  const filesHtml =
    input.files.length > 0
      ? `
        <section
          style="
            margin-top:18px;
            padding:16px;
            background:#ffffff;
            border:1px solid #dbe5ef;
            border-radius:10px;
          "
        >
          <h2
            style="
              margin:0 0 8px;
              color:#17365d;
              font-size:16px;
            "
          >
            Files
          </h2>

          <ul
            style="
              margin:0;
              padding-left:20px;
              color:#17365d;
            "
          >
            ${input.files
              .map(
                (file) => `
                  <li style="margin:6px 0;">
                    ${escapeHtml(file.name)}
                    <span
                      style="
                        color:#6b7b8d;
                        font-size:12px;
                      "
                    >
                      (${escapeHtml(
                        formatFileSize(
                          file.size,
                        ),
                      )})
                    </span>
                  </li>
                `,
              )
              .join("")}
          </ul>
        </section>
      `
      : "";

  const filesText =
    input.files.length > 0
      ? [
          "Files",
          "-----",

          ...input.files.map(
            (file) =>
              `${file.name} (${formatFileSize(
                file.size,
              )})`,
          ),

          "",
        ].join("\n")
      : "";

  const showCustomerSection =
    input.recipient !==
      "customer" &&
    customerRows.length > 0;

  const customerHtml =
    showCustomerSection
      ? renderHtmlSection({
          label: "Customer",
          rows: customerRows,
        })
      : "";

  const customerText =
    showCustomerSection
      ? renderTextSection({
          label: "Customer",
          rows: customerRows,
        })
      : "";

  const configuredSectionsHtml =
    input.sections
      .map(
        renderHtmlSection,
      )
      .join("");

  const configuredSectionsText =
    input.sections
      .map(
        renderTextSection,
      )
      .join("");

  const html = `
    <!doctype html>
    <html>
      <body
        style="
          margin:0;
          padding:0;
          background:#f4f1eb;
        "
      >
        <div
          style="
            max-width:660px;
            margin:0 auto;
            padding:24px 16px;
          "
        >
          <div
            style="
              overflow:hidden;
              background:#fffdf8;
              border:1px solid #dbe5ef;
              border-radius:14px;
              font-family:Arial,sans-serif;
              line-height:1.5;
            "
          >
            <header
              style="
                padding:14px 16px;
                background:#f4eadc;
                border-bottom:1px solid #ded5c8;
              "
            >
              <table
                role="presentation"
                style="
                  width:100%;
                  border-collapse:collapse;
                "
              >
                <tr>
                  <td
                    style="
                      width:42px;
                      vertical-align:middle;
                      font-size:26px;
                    "
                  >
                    📖
                  </td>

                  <td
                    style="
                      vertical-align:middle;
                    "
                  >
                    <div
                      style="
                        color:#17365d;
                        font-size:20px;
                        font-weight:800;
                        line-height:1.05;
                      "
                    >
                      GYAN
                    </div>

                    <div
                      style="
                        margin-top:2px;
                        color:#65788c;
                        font-size:11px;
                      "
                    >
                      Your Digital Seva Partner
                    </div>
                  </td>

                  <td
                    style="
                      vertical-align:middle;
                      text-align:right;
                    "
                  >
                    <span
                      style="
                        display:inline-block;
                        padding:6px 9px;
                        border:1px solid #cbd7e4;
                        border-radius:8px;
                        background:#ffffff;
                        color:#35536f;
                        font-size:11px;
                        font-weight:700;
                      "
                    >
                      ${escapeHtml(
                        formatStatus(
                          input.status,
                        ),
                      )}
                    </span>
                  </td>
                </tr>
              </table>
            </header>

            <div
              style="
                padding:16px 22px 0;
              "
            >
              <div
                style="
                  color:#6b7b8d;
                  font-size:10px;
                  font-weight:700;
                  letter-spacing:1px;
                "
              >
                ${escapeHtml(copy.eyebrow)}
              </div>

              <h1
                style="
                  margin:4px 0 2px;
                  color:#17365d;
                  font-size:22px;
                "
              >
                ${escapeHtml(copy.title)}
              </h1>

              <div
                style="
                  color:#6b7b8d;
                  font-size:12px;
                "
              >
                ${escapeHtml(input.shopName)}
                ·
                ${escapeHtml(input.shopCode)}
              </div>
            </div>

            <main
              style="
                padding:22px;
              "
            >
              <p
                style="
                  margin-top:0;
                  color:#24415f;
                "
              >
                ${escapeHtml(copy.introduction)}
              </p>

              <div
                style="
                  margin:18px 0;
                  padding:14px;
                  background:#edf6ff;
                  border:1px solid #b9d2ea;
                  border-radius:10px;
                "
              >
                <div
                  style="
                    color:#5d7188;
                    font-size:11px;
                    font-weight:700;
                    letter-spacing:0.7px;
                  "
                >
                  REQUEST NUMBER
                </div>

                <div
                  style="
                    margin-top:4px;
                    color:#17365d;
                    font-family:Consolas,monospace;
                    font-size:17px;
                    font-weight:700;
                    overflow-wrap:anywhere;
                  "
                >
                  ${escapeHtml(input.requestNumber)}
                </div>

                <div
                  style="
                    margin-top:7px;
                    color:#5d7188;
                    font-size:12px;
                    font-weight:700;
                  "
                >
                  Status:
                  ${escapeHtml(
                    formatStatus(
                      input.status,
                    ),
                  )}
                </div>
              </div>

              ${renderActions(input.actions)}
              ${customerHtml}
              ${filesHtml}
              ${configuredSectionsHtml}

              <div
                style="
                  margin-top:20px;
                  padding:14px;
                  background:#fff4d8;
                  border:1px solid #d6a346;
                  border-radius:10px;
                  color:#714a12;
                  font-size:13px;
                  line-height:1.5;
                "
              >
                <strong>
                  ${input.retentionDays}-day file-retention policy
                </strong>

                <p style="margin:6px 0 0;">
                  Uploaded files remain available until
                  ${escapeHtml(expirationText)}.
                  After that date, they are automatically deleted
                  and cannot be recovered through GYAN.
                </p>
              </div>
            </main>

            <footer
              style="
                padding:14px 22px;
                background:#f6f1e8;
                border-top:1px solid #e3d7c6;
                color:#6b7b8d;
                font-size:11px;
                text-align:center;
              "
            >
              This message was generated automatically by GYAN.
            </footer>
          </div>
        </div>
      </body>
    </html>
  `;

  const actionText =
    input.actions?.length
      ? [
          "Actions",
          "-------",
          ...input.actions.map(
            (action) =>
              `${action.label}: ${action.url}`,
          ),
          "",
        ].join("\n")
      : "";

  const text = [
    copy.eyebrow,
    copy.title,
    "",
    copy.introduction,
    "",
    `Request number: ${input.requestNumber}`,
    `Shop: ${input.shopName} (${input.shopCode})`,
    "",
    actionText,
    customerText,
    filesText,
    configuredSectionsText,
    `${input.retentionDays}-day file-retention policy`,
    `Uploaded files remain available until ${expirationText}.`,
    "After that date, they are automatically deleted and cannot be recovered through GYAN.",
  ].join("\n");

  return {
    subject:
      copy.subject,

    html,
    text,
  };
}