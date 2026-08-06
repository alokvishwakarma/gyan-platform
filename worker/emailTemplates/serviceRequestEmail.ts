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
    | "customer";

  serviceName: string;
  requestNumber: string;

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
  customer: ServiceEmailCustomer,
): ServiceEmailRow[] {
  const rows: ServiceEmailRow[] = [];

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
              color:#7d6a54;
              vertical-align:top;
            "
          >
            ${escapeHtml(row.label)}
          </td>

          <td
            style="
              padding:7px 0;
              color:#332317;
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
  section: ServiceEmailSection,
): string {
  if (
    section.rows.length === 0
  ) {
    return "";
  }

  return `
    <section style="margin-top:22px;">
      <h2
        style="
          margin:0 0 8px;
          color:#332317;
          font-size:17px;
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
        ${renderHtmlRows(section.rows)}
      </table>
    </section>
  `;
}

function renderTextSection(
  section: ServiceEmailSection,
): string {
  if (
    section.rows.length === 0
  ) {
    return "";
  }

  return [
    section.label,
    "-".repeat(section.label.length),

    ...section.rows.map(
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
        margin-top:24px;
        display:block;
      "
    >
      ${actions
        .map(
          (action) => `
            <a
              href="${escapeHtml(action.url)}"
              style="
                display:inline-block;
                margin:0 8px 8px 0;
                padding:11px 16px;
                border:1px solid ${
                  action.primary
                    ? "#145da0"
                    : "#cfc3b2"
                };
                background:${
                  action.primary
                    ? "#1565c0"
                    : "#ffffff"
                };
                color:${
                  action.primary
                    ? "#ffffff"
                    : "#50361e"
                };
                text-decoration:none;
                font-size:13px;
                font-weight:700;
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

export function renderServiceRequestEmail(
  input: ServiceRequestEmailInput,
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

  const customerRows =
    renderCustomerRows(
      input.customer,
    );

  const recipientTitle =
    input.recipient === "shop"
      ? `New ${input.serviceName} request`
      : `${input.serviceName} request received`;

  const introduction =
    input.recipient === "shop"
      ? `A new ${input.serviceName} request was submitted to ${input.shopName}.`
      : `Your ${input.serviceName} request has been sent to ${input.shopName}.`;

  const filesHtml =
    input.files.length > 0
      ? `
        <section style="margin-top:22px;">
          <h2
            style="
              margin:0 0 8px;
              color:#332317;
              font-size:17px;
            "
          >
            Files
          </h2>

          <ul
            style="
              margin:0;
              padding-left:20px;
            "
          >
            ${input.files
              .map(
                (file) => `
                  <li style="margin:6px 0;">
                    ${escapeHtml(file.name)}
                    <span
                      style="
                        color:#7d6a54;
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

  const customerHtml =
    customerRows.length > 0
      ? renderHtmlSection({
          label: "Customer",
          rows: customerRows,
        })
      : "";

  const customerText =
    customerRows.length > 0
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

  const subject =
    input.recipient === "shop"
      ? `${recipientTitle} ${input.requestNumber}`
      : `${input.serviceName} request confirmation ${input.requestNumber}`;

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
              border:1px solid #e3d7c6;
              font-family:Arial,sans-serif;
              line-height:1.5;
            "
          >
            <header
              style="
                padding:20px 22px;
                background:#f4eadc;
                border-bottom:1px solid #e3d5c2;
              "
            >
              <div
                style="
                  color:#7d6a54;
                  font-size:11px;
                  font-weight:700;
                  letter-spacing:1.2px;
                "
              >
                GYAN SERVICE
              </div>

              <h1
                style="
                  margin:5px 0 2px;
                  color:#332317;
                  font-size:24px;
                "
              >
                ${escapeHtml(recipientTitle)}
              </h1>

              <div
                style="
                  color:#7d6a54;
                  font-size:13px;
                "
              >
                ${escapeHtml(input.shopName)}
                ·
                ${escapeHtml(input.shopCode)}
              </div>
            </header>

            <main
              style="
                padding:22px;
              "
            >
              <p
                style="
                  margin-top:0;
                  color:#50361e;
                "
              >
                ${escapeHtml(introduction)}
              </p>

              <div
                style="
                  margin:18px 0;
                  padding:14px;
                  background:#ffffff;
                  border:1px solid #e8dfd1;
                "
              >
                <div
                  style="
                    color:#7d6a54;
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
                    color:#332317;
                    font-family:Consolas,monospace;
                    font-size:18px;
                    font-weight:700;
                    overflow-wrap:anywhere;
                  "
                >
                  ${escapeHtml(input.requestNumber)}
                </div>
              </div>

              ${customerHtml}
              ${filesHtml}
              ${configuredSectionsHtml}
              ${renderActions(input.actions)}

              <div
                style="
                  margin-top:24px;
                  padding:14px;
                  background:#fff4d8;
                  border:1px solid #d6a346;
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
                color:#7d6a54;
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

  const text = [
    "GYAN SERVICE",
    recipientTitle,
    "",
    introduction,
    "",
    `Request number: ${input.requestNumber}`,
    `Shop: ${input.shopName} (${input.shopCode})`,
    "",
    customerText,
    filesText,
    configuredSectionsText,
    `${input.retentionDays}-day file-retention policy`,
    `Uploaded files remain available until ${expirationText}.`,
    "After that date, they are automatically deleted and cannot be recovered through GYAN.",
  ].join("\n");

  return {
    subject,
    html,
    text,
  };
}