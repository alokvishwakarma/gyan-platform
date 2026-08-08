import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./SharedRequestContent.css";

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

interface SharedRequestContentProps {
  requestNumber: string;
  token: string;

  onClose: () => void;

  onStatusChange?: (
    status: string,
  ) => void;
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

export default function SharedRequestContent({
  requestNumber,
  token,
  onClose,
  onStatusChange,
}: SharedRequestContentProps) {
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

        if (
          result.request
            ?.status
        ) {
          onStatusChange?.(
            result.request
              .status,
          );
        }
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
    onStatusChange,
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



  const meaningfulAnswers =
    answerRows.filter(
      (row) =>
        row.value !==
          "Not provided" &&
        row.value !==
          "None selected" &&
        row.value.trim()
          .length > 0,
    );

  const hasCustomerDetails =
    Boolean(
      customerName ||
      customerPhone ||
      customerEmail ||
      customerWhatsApp ||
      preferredContact,
    );

  return (
    <section className="shared-request-content">
      {loading && (
        <div className="shared-request-content__state">
          Loading request…
        </div>
      )}

      {error && (
        <div className="shared-request-content__state shared-request-content__state--error">
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
            <section className="shared-request-content__hero">
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

              <div className="shared-request-content__request-number">
                {
                  request.requestNumber
                }
              </div>

              <div className="shared-request-content__badges">
                <span>
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
                    {amount}
                  </span>
                )}
              </div>
            </section>

            <section className="shared-request-content__section">
              <div className="shared-request-content__section-heading">
                <span>
                  Request information
                </span>

                <h2>
                  Request
                </h2>
              </div>

              <div className="shared-request-content__card">
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

                  {recipient !==
                    "customer" && (
                    <>
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
                    </>
                  )}
                </dl>
              </div>
            </section>

            {hasCustomerDetails && (
              <section className="shared-request-content__section">
                <div className="shared-request-content__section-heading">
                  <span>
                    Contact
                  </span>

                  <h2>
                    Customer
                  </h2>
                </div>

                <div className="shared-request-content__card">
                  <dl>
                    {customerName && (
                      <div>
                        <dt>Name</dt>
                        <dd>
                          {customerName}
                        </dd>
                      </div>
                    )}

                    {customerPhone && (
                      <div>
                        <dt>
                          Mobile
                        </dt>

                        <dd>
                          {customerPhone}
                        </dd>
                      </div>
                    )}

                    {customerEmail && (
                      <div>
                        <dt>
                          Email
                        </dt>

                        <dd>
                          {customerEmail}
                        </dd>
                      </div>
                    )}

                    {customerWhatsApp && (
                      <div>
                        <dt>
                          WhatsApp
                        </dt>

                        <dd>
                          {customerWhatsApp}
                        </dd>
                      </div>
                    )}

                    {preferredContact && (
                      <div>
                        <dt>
                          Preferred contact
                        </dt>

                        <dd>
                          {preferredContact}
                        </dd>
                      </div>
                    )}
                  </dl>
                </div>
              </section>
            )}

            {meaningfulAnswers.length >
              0 && (
              <section className="shared-request-content__section">
                <div className="shared-request-content__section-heading">
                  <span>
                    Submitted information
                  </span>

                  <h2>
                    Details
                  </h2>
                </div>

                <div className="shared-request-content__card">
                  <dl>
                    {meaningfulAnswers.map(
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
                </div>
              </section>
            )}

            {request.files.length >
              0 && (
              <section className="shared-request-content__section">
                <div className="shared-request-content__section-heading">
                  <span>
                    Attachments
                  </span>

                  <h2>
                    Files
                  </h2>
                </div>

                <div className="shared-request-content__card">
                  {request
                    .retention
                    .filesExpired ? (
                    <p className="shared-request-content__expired">
                      Files are no
                      longer available.
                    </p>
                  ) : (
                    <p className="shared-request-content__retention">
                      Available until{" "}
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

                  <div className="shared-request-content__files">
                    {request.files.map(
                      (file) => (
                        <article
                          key={
                            file.id
                          }
                          className="shared-request-content__file"
                        >
                          <span
                            aria-hidden="true"
                          >
                            📎
                          </span>

                          <div>
                            <strong>
                              {
                                file.name
                              }
                            </strong>

                            <small>
                              {formatFileSize(
                                file.size,
                              )}
                            </small>
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
                            <small>
                              Unavailable
                            </small>
                          )}
                        </article>
                      ),
                    )}
                  </div>
                </div>
              </section>
            )}

            <nav className="shared-request-content__actions">
              <a
                className="shared-request-content__action shared-request-content__action--primary"
                href={allRequestsUrl}
              >
                {primaryActionLabel}
              </a>

              {updateActionUrl && (
                <a
                  className="shared-request-content__action"
                  href={updateActionUrl}
                >
                  {recipient ===
                  "admin"
                    ? "Update Request"
                    : "Update Status"}
                </a>
              )}

              <button
                type="button"
                className="shared-request-content__action"
                onClick={onClose}
              >
                Home
              </button>
            </nav>

            <p className="shared-request-content__security">
              Secure, read-only request
              view. Do not forward this
              link.
            </p>
          </>
        )}
    </section>
  );
}
