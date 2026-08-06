import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./SharedRequestScreen.css";

interface SharedRequestFile {
  id: number;

  sectionKey: string;
  fieldKey: string;

  name: string;
  contentType: string;
  size: number;

  status: string;
  available: boolean;

    downloadUrl:
    | string
    | null;
}

interface SharedRequestResponse {
  access?: {
    recipient:
      | "shop"
      | "customer"
      | "admin";

    readOnly: boolean;
  };

  request?: {
    requestNumber: string;
    status: string;

    createdAt: string;
    updatedAt: string;

    estimatedAmountPaise:
      | number
      | null;

    shop: {
      code: string;
      name: string;
    };

    service: {
      code: string;
      name: string;
    };

    customer: {
      name:
        | string
        | null;

      phone:
        | string
        | null;

      email:
        | string
        | null;

      whatsApp:
        | string
        | null;
    };

    answers:
      Record<
        string,
        unknown
      >;

    retention: {
      days: number;

      expiresAt:
        | string
        | null;

      filesExpired: boolean;
    };

    files:
      SharedRequestFile[];
  };

  error?: string;
}

interface SharedRequestScreenProps {
  requestNumber: string;
  token: string;

  onClose: () => void;
}

interface AnswerRow {
  key: string;
  label: string;
  value: string;
}

function formatKey(
  value: string,
): string {
  return value
    .split(".")
    .at(-1)!
    .replace(
      /[_-]+/g,
      " ",
    )
    .replace(
      /\b\w/g,
      (character) =>
        character.toUpperCase(),
    );
}

function formatAnswerValue(
  value: unknown,
): string {
  if (
    value === null ||
    value === undefined ||
    value === ""
  ) {
    return "Not provided";
  }

  if (
    typeof value ===
    "boolean"
  ) {
    return value
      ? "Yes"
      : "No";
  }

  if (
    Array.isArray(value)
  ) {
    if (
      value.length === 0
    ) {
      return "None selected";
    }

    return value
      .map(
        (item) =>
          String(item),
      )
      .join(", ");
  }

  if (
    typeof value ===
    "object"
  ) {
    return JSON.stringify(
      value,
    );
  }

  return String(value);
}

function formatDateTime(
  value:
    | string
    | null,
): string {
  if (!value) {
    return "Not available";
  }

  const date =
    new Date(value);

  if (
    Number.isNaN(
      date.getTime(),
    )
  ) {
    return value;
  }

  return new Intl.DateTimeFormat(
    "en-US",
    {
      dateStyle:
        "medium",

      timeStyle:
        "short",
    },
  ).format(date);
}

function formatFileSize(
  bytes: number,
): string {
  if (
    bytes < 1024
  ) {
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

function formatAmount(
  paise:
    | number
    | null,
): string | null {
  if (
    paise === null
  ) {
    return null;
  }

  return new Intl.NumberFormat(
    "en-IN",
    {
      style:
        "currency",

      currency:
        "INR",
    },
  ).format(
    paise / 100,
  );
}


function normalizeAnswerKey(
  value: string,
): string {
  return value
    .trim()
    .toLowerCase()
    .replace(
      /[^a-z0-9]+/g,
      "_",
    );
}

function findAnswerValue(
  answers:
    Record<string, unknown>,

  candidateKeys:
    string[],
): string | null {
  const normalizedCandidates =
    new Set(
      candidateKeys.map(
        normalizeAnswerKey,
      ),
    );

  for (
    const [
      key,
      value,
    ]
    of Object.entries(
      answers,
    )
  ) {
    const leafKey =
      key
        .split(".")
        .at(-1) ??
      key;

    const normalizedKey =
      normalizeAnswerKey(
        leafKey,
      );

    if (
      !normalizedCandidates.has(
        normalizedKey,
      )
    ) {
      continue;
    }

    const formatted =
      formatAnswerValue(
        value,
      );

    if (
      formatted !==
        "Not provided" &&
      formatted !==
        "None selected"
    ) {
      return formatted;
    }
  }

  return null;
}

function isCustomerAnswerKey(
  key: string,
): boolean {
  const leafKey =
    key
      .split(".")
      .at(-1) ??
    key;

  const normalized =
    normalizeAnswerKey(
      leafKey,
    );

  return [
    "customer_name",
    "name",
    "phone",
    "phone_number",
    "mobile",
    "mobile_number",
    "whatsapp",
    "whatsapp_number",
    "phone_or_whatsapp",
    "email",
    "email_address",
    "preferred_contact",
  ].includes(
    normalized,
  );
}

function createAppUrl(
  pathname: string,
): string {
  return new URL(
    pathname,
    window.location.origin,
  ).toString();
}

export default function SharedRequestScreen({
  requestNumber,
  token,
  onClose,
}: SharedRequestScreenProps) {
  const [
    data,
    setData,
  ] =
    useState<SharedRequestResponse | null>(
      null,
    );

  const [
    loading,
    setLoading,
  ] =
    useState(true);

  const [
    error,
    setError,
  ] =
    useState("");

  useEffect(() => {
    const controller =
      new AbortController();

    async function loadRequest() {
      try {
        const endpoint =
          new URL(
            `/api/shared/requests/${encodeURIComponent(
              requestNumber,
            )}`,
            window.location.origin,
          );

        endpoint.searchParams.set(
          "token",
          token,
        );

        const response =
          await fetch(
            endpoint.toString(),
            {
              signal:
                controller.signal,
            },
          );

        const result =
          (await response.json()) as
            SharedRequestResponse;

        if (
          !response.ok ||
          !result.request
        ) {
          throw new Error(
            result.error ??
              "The request could not be loaded.",
          );
        }

        setData(result);
      } catch (caughtError) {
        if (
          caughtError instanceof
            DOMException &&
          caughtError.name ===
            "AbortError"
        ) {
          return;
        }

        setError(
          caughtError instanceof
              Error
            ? caughtError.message
            : "The request could not be loaded.",
        );
      } finally {
        if (
          !controller.signal
            .aborted
        ) {
          setLoading(false);
        }
      }
    }

    void loadRequest();

    return () => {
      controller.abort();
    };
  }, [
    requestNumber,
    token,
  ]);

  const answerRows =
    useMemo<
      AnswerRow[]
    >(
      () =>
        Object.entries(
          data?.request
            ?.answers ?? {},
        )
          .filter(
            ([key]) =>
              !key.startsWith(
                "customer.",
              ) &&
              !isCustomerAnswerKey(
                key,
              ),
          )
          .map(
            ([
              key,
              value,
            ]) => ({
              key,

              label:
                formatKey(key),

              value:
                formatAnswerValue(
                  value,
                ),
            }),
          ),
      [data],
    );

  const request =
    data?.request;

  const amount =
    request
      ? formatAmount(
          request
            .estimatedAmountPaise,
        )
      : null;

  const answers =
    request?.answers ?? {};

  const customerName =
    request?.customer.name ??
    findAnswerValue(
      answers,
      [
        "customer_name",
        "name",
      ],
    );

  const customerPhone =
    request?.customer.phone ??
    findAnswerValue(
      answers,
      [
        "phone",
        "phone_number",
        "mobile",
        "mobile_number",
        "phone_or_whatsapp",
      ],
    );

  const customerWhatsApp =
    request?.customer.whatsApp ??
    findAnswerValue(
      answers,
      [
        "whatsapp",
        "whatsapp_number",
        "phone_or_whatsapp",
      ],
    );

  const customerEmail =
    request?.customer.email ??
    findAnswerValue(
      answers,
      [
        "email",
        "email_address",
      ],
    );

  const preferredContact =
    findAnswerValue(
      answers,
      [
        "preferred_contact",
      ],
    );

  const recipient =
    data?.access
      ?.recipient ??
    "customer";

  const roleLabel =
    recipient === "shop"
      ? "Shop View"
      : recipient === "admin"
        ? "Admin View"
        : "Customer View";

  const allRequestsUrl =
    recipient === "shop"
      ? createAppUrl(
          "/shop-admin",
        )
      : recipient === "admin"
        ? createAppUrl(
            "/admin",
          )
        : createAppUrl(
            "/",
          );

  const primaryActionLabel =
    recipient === "shop"
      ? "Shop Requests"
      : recipient === "admin"
        ? "Admin Dashboard"
        : "My Requests";

  const updateActionUrl =
    recipient === "shop"
      ? createAppUrl(
          "/shop-admin",
        )
      : recipient === "admin"
        ? createAppUrl(
            `/admin/requests/${encodeURIComponent(
              requestNumber,
            )}`,
          )
        : null;



  return (
    <main className="shared-request-screen">
      <header className="shared-request-screen__header">
        <button
          type="button"
          onClick={onClose}
          aria-label="Return to GYAN"
        >
          ←
        </button>

        <div>
          <strong>
            GYAN SERVICE
          </strong>

          <span>
            Shared Request
          </span>
        </div>

        <span className="shared-request-screen__recipient">
{roleLabel}
        </span>
      </header>

      <section className="shared-request-screen__content">
        {loading && (
          <div className="shared-request-screen__state">
            Loading request…
          </div>
        )}

        {error && (
          <div className="shared-request-screen__state shared-request-screen__state--error">
            <strong>
              Request unavailable
            </strong>

            <span>
              {error}
            </span>
          </div>
        )}

        {!loading &&
          !error &&
          request && (
            <>
              <section className="shared-request-screen__hero">
                <span>
                  {
                    request
                      .service
                      .name
                  }
                </span>

                <h1>
                  Request details
                </h1>

                <div className="shared-request-screen__request-number">
                  {
                    request.requestNumber
                  }
                </div>

                <div className="shared-request-screen__badges">
                  <span>
                    Status:{" "}
                    {request.status}
                  </span>

                  <span>
                    {
                      request.shop
                        .name
                    }
                  </span>

                  {amount && (
                    <span>
                      Estimate:{" "}
                      {amount}
                    </span>
                  )}
                </div>
              </section>

              <nav
                className="shared-request-screen__actions"
                aria-label="Request actions"
              >
                <a
                  className="shared-request-screen__action shared-request-screen__action--primary"
                  href={allRequestsUrl}
                >
                  {primaryActionLabel}
                </a>

                {updateActionUrl && (
                  <a
                    className="shared-request-screen__action"
                    href={updateActionUrl}
                  >
                    {recipient === "admin"
                      ? "Update Request"
                      : "Update Status"}
                  </a>
                )}

                {recipient === "shop" && (
                  <a
                    className="shared-request-screen__action"
                    href={createAppUrl(
                      `/?shop=${encodeURIComponent(
                        request.shop.code,
                      )}`,
                    )}
                  >
                    Update Shop
                  </a>
                )}

                {recipient === "admin" && (
                  <a
                    className="shared-request-screen__action"
                    href={createAppUrl(
                      "/admin/shops",
                    )}
                  >
                    Add Shop
                  </a>
                )}
              </nav>

              <section className="shared-request-screen__grid">
                <article className="shared-request-card">
                  <h2>
                    Request
                  </h2>

                  <dl>
                    <div>
                      <dt>
                        Created
                      </dt>

                      <dd>
                        {formatDateTime(
                          request.createdAt,
                        )}
                      </dd>
                    </div>

                    <div>
                      <dt>
                        Last updated
                      </dt>

                      <dd>
                        {formatDateTime(
                          request.updatedAt,
                        )}
                      </dd>
                    </div>

                    <div>
                      <dt>
                        Shop code
                      </dt>

                      <dd>
                        {
                          request.shop
                            .code
                        }
                      </dd>
                    </div>

                    <div>
                      <dt>
                        Service code
                      </dt>

                      <dd>
                        {
                          request.service
                            .code
                        }
                      </dd>
                    </div>
                  </dl>
                </article>

                <article className="shared-request-card">
                  <h2>
                    Customer
                  </h2>

                  <dl>
                    <div>
                      <dt>
                        Name
                      </dt>

                      <dd>
                        {customerName ??
                          "Not provided"}
                      </dd>
                    </div>

                    <div>
                      <dt>
                        Mobile
                      </dt>

                      <dd>
                        {customerPhone ??
                          "Not provided"}
                      </dd>
                    </div>

                    <div>
                      <dt>
                        Email
                      </dt>

                      <dd>
                        {customerEmail ??
                          "Not provided"}
                      </dd>
                    </div>

                    <div>
                      <dt>
                        WhatsApp
                      </dt>

                      <dd>
                        {customerWhatsApp ??
                          "Not provided"}
                      </dd>
                    </div>

                    <div>
                      <dt>
                        Preferred contact
                      </dt>

                      <dd>
                        {preferredContact ??
                          "Not provided"}
                      </dd>
                    </div>
                  </dl>
                </article>
              </section>

              {answerRows.length >
                0 && (
                <section className="shared-request-card">
                  <h2>
                    Submitted information
                  </h2>

                  <dl>
                    {answerRows.map(
                      (row) => (
                        <div
                          key={
                            row.key
                          }
                        >
                          <dt>
                            {
                              row.label
                            }
                          </dt>

                          <dd>
                            {
                              row.value
                            }
                          </dd>
                        </div>
                      ),
                    )}
                  </dl>
                </section>
              )}

              <section className="shared-request-card">
                <header className="shared-request-card__heading">
                  <div>
                    <h2>
                      Files
                    </h2>

                    <span>
                      {
                        request.files
                          .length
                      }
                      {" uploaded"}
                    </span>
                  </div>
                </header>

                {request
                  .retention
                  .filesExpired && (
                  <p className="shared-request-screen__expired">
                    These files have
                    reached the end of
                    their{" "}
                    {
                      request
                        .retention
                        .days
                    }
                    -day retention
                    period and are no
                    longer available.
                  </p>
                )}

                {!request
                  .retention
                  .filesExpired && (
                  <p className="shared-request-screen__retention">
                    Files remain
                    available until{" "}
                    <strong>
                      {formatDateTime(
                        request
                          .retention
                          .expiresAt,
                      )}
                    </strong>
                    .
                  </p>
                )}

                {request.files
                  .length ===
                  0 && (
                  <p className="shared-request-screen__empty">
                    No files were
                    uploaded with this
                    request.
                  </p>
                )}

                <div className="shared-request-screen__files">
                  {request.files.map(
                    (file) => (
                      <article
                        key={
                          file.id
                        }
                        className="shared-request-file"
                      >
                        <div className="shared-request-file__icon">
                          📎
                        </div>

                        <div className="shared-request-file__details">
                          <strong>
                            {
                              file.name
                            }
                          </strong>

                          <span>
                            {formatFileSize(
                              file.size,
                            )}
                          </span>
                        </div>

                        {file.available &&
file.downloadUrl ? (
  <a
    href={
      file.downloadUrl
    }
  >
    Download
  </a>
) : (
                          <span className="shared-request-file__unavailable">
                            Unavailable
                          </span>
                        )}
                      </article>
                    ),
                  )}
                </div>
              </section>

              <footer className="shared-request-screen__footer">
                <p>
                  This is a secure,
                  read-only request
                  view for the intended
                  recipient. Do not
                  forward this link.
                </p>

                <button
                  type="button"
                  onClick={
                    onClose
                  }
                >
                  Return to GYAN
                </button>
              </footer>
            </>
          )}
      </section>
    </main>
  );
}