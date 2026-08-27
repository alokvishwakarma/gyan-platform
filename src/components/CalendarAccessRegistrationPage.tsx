import {
  useEffect,
  useMemo,
  useState,
} from "react";

import {
  QRCodeSVG,
} from "qrcode.react";

import "./CalendarAccessRegistrationPage.css";


interface CalendarRecord {
  id:
    number;

  slug:
    string;

  gyan_name:
    string;

  duration_months:
    1 | 3 | 6 | 12;

  status:
    "GENERATED" |
    "PRINTED" |
    "GUEST_ACTIVE" |
    "CLAIMED" |
    "EXPIRED";

  generated_at:
    string;

  printed_at:
    string | null;

  guest_started_at:
    string | null;

  guest_expires_at:
    string | null;

  claimed_at:
    string | null;

  expires_at:
    string | null;
}


interface UnifiedGyanAccount {
  id: number;
  code: string;
  displayName: string;
  registered: boolean;
  createdAt: string;
}


interface AuthMe {
  authenticated:
    boolean;

  user:
    {
      id:
        number;

      email:
        string;
    } | null;
}


function durationLabel(
  months:
    number,
):
  string {
  if (
    months ===
      12
  ) {
    return "12 months";
  }

  if (
    months ===
      3
  ) {
    return "3 months";
  }

  return "1 month";
}


export default function CalendarAccessRegistrationPage({
  slug,
  onContinue,
  onBack,
}: {
  slug:
    string;

  onContinue:
    () => void;

  onBack:
    () => void;
}) {
  const normalizedSlug =
    useMemo(
      () =>
        slug
          .trim()
          .toUpperCase(),
      [
        slug,
      ],
    );

  const [
    record,
    setRecord,
  ] =
    useState<
      CalendarRecord |
      null
    >(
      null,
    );

  const [
    unifiedAccount,
    setUnifiedAccount,
  ] =
    useState<
      UnifiedGyanAccount |
      null
    >(
      null,
    );


  const [
    authenticatedEmail,
    setAuthenticatedEmail,
  ] =
    useState<
      string | null
    >(
      null,
    );

  const [
    loading,
    setLoading,
  ] =
    useState(
      true,
    );

  const [
    accessCode,
    setAccessCode,
  ] =
    useState("");

  const [
    email,
    setEmail,
  ] =
    useState("");

  const [
    guestActive,
    setGuestActive,
  ] =
    useState(
      false,
    );

  const [
    showProtect,
    setShowProtect,
  ] =
    useState(
      false,
    );

  const [
    verificationSent,
    setVerificationSent,
  ] =
    useState(
      false,
    );

  const [
    activating,
    setActivating,
  ] =
    useState(
      false,
    );

  const [
    qrActivating,
    setQrActivating,
  ] =
    useState(
      false,
    );

  const [
    sending,
    setSending,
  ] =
    useState(
      false,
    );

  const [
    claiming,
    setClaiming,
  ] =
    useState(
      false,
    );

  const [
    claimed,
    setClaimed,
  ] =
    useState(
      false,
    );

  const [
    error,
    setError,
  ] =
    useState("");

  useEffect(
    () => {
      let cancelled =
        false;

      async function load():
        Promise<void> {
        setLoading(
          true,
        );

        setError("");

        try {
          const [
            recordResponse,
            authResponse,
            guestResponse,
          ] =
            await Promise.all([
              fetch(
                `/api/calendar-access/${encodeURIComponent(
                  normalizedSlug,
                )}`,
                {
                  cache:
                    "no-store",
                },
              ),

              fetch(
                "/api/auth/me",
                {
                  cache:
                    "no-store",
                },
              ),

              fetch(
                "/api/calendar-access/me",
                {
                  cache:
                    "no-store",
                },
              ),
            ]);

          const recordBody =
            await recordResponse.json() as {
              record?:
                CalendarRecord;

              error?:
                string;
            };

          let accountBody:
            {
              account?:
                UnifiedGyanAccount;

              error?:
                string;
            } | null =
              null;

          if (
            !recordResponse.ok ||
            !recordBody.record
          ) {
            const accountResponse =
              await fetch(
                `/api/gyan-identity/${encodeURIComponent(
                  normalizedSlug,
                )}`,
                {
                  cache:
                    "no-store",
                },
              );

            accountBody =
              await accountResponse.json() as {
                account?:
                  UnifiedGyanAccount;

                error?:
                  string;
              };

            if (
              !accountResponse.ok ||
              !accountBody.account
            ) {
              throw new Error(
                accountBody.error ??
                recordBody.error ??
                "This GYAN code could not be found.",
              );
            }
          }

          const authBody =
            await authResponse.json() as
              AuthMe;

          const guestBody =
            await guestResponse.json() as {
              guest?:
                {
                  slug?:
                    string;

                  status?:
                    string;
                } | null;
            };

          if (
            cancelled
          ) {
            return;
          }

          setRecord(
            recordBody.record ??
            null,
          );

          setUnifiedAccount(
            accountBody?.account ??
            null,
          );

          setAuthenticatedEmail(
            authBody.authenticated
              ? authBody.user
                  ?.email ??
                null
              : null,
          );

          setGuestActive(
            guestBody.guest
              ?.slug ===
                normalizedSlug &&
            guestBody.guest
              ?.status ===
                "GUEST_ACTIVE",
          );

          if (
            authBody.authenticated &&
            recordBody.record?.status ===
              "GUEST_ACTIVE"
          ) {
            setShowProtect(
              true,
            );
          }
        } catch (
          caught
        ) {
          if (
            !cancelled
          ) {
            setError(
              caught instanceof
                Error
                ? caught.message
                : "Unable to open this GYAN.",
            );
          }
        } finally {
          if (
            !cancelled
          ) {
            setLoading(
              false,
            );
          }
        }
      }

      void load();

      return () => {
        cancelled =
          true;
      };
    },
    [
      normalizedSlug,
    ],
  );


  useEffect(
    () => {
      const token =
        window.location.hash
          .replace(
            /^#/,
            "",
          )
          .trim();

      if (
        !token ||
        guestActive ||
        qrActivating
      ) {
        return;
      }

      let cancelled =
        false;

      setQrActivating(
        true,
      );

      setError("");

      void fetch(
        `/api/calendar-access/${encodeURIComponent(
          normalizedSlug,
        )}/guest-token`,
        {
          method:
            "POST",

          headers: {
            "Content-Type":
              "application/json",
          },

          body:
            JSON.stringify({
              token,
            }),
        },
      )
        .then(
          async (
            response,
          ) => {
            const body =
              await response.json() as {
                guest?:
                  boolean;

                error?:
                  string;
              };

            if (
              !response.ok ||
              !body.guest
            ) {
              throw new Error(
                body.error ??
                "This QR could not open the GYAN.",
              );
            }

            if (
              cancelled
            ) {
              return;
            }

            setGuestActive(
              true,
            );

            setRecord(
              (
                previous,
              ) =>
                previous
                  ? {
                      ...previous,
                      status:
                        "GUEST_ACTIVE",
                    }
                  : previous,
            );

            /*
             * Remove the secret fragment from the address bar after
             * successful activation. Fragments are never sent to the server
             * in the original HTTP request.
             */
            window.history.replaceState(
              {},
              "",
              `${window.location.pathname}${window.location.search}`,
            );
          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              !cancelled
            ) {
              setError(
                caught instanceof
                  Error
                  ? caught.message
                  : "This QR could not open the GYAN.",
              );
            }
          },
        )
        .finally(
          () => {
            if (
              !cancelled
            ) {
              setQrActivating(
                false,
              );
            }
          },
        );

      return () => {
        cancelled =
          true;
      };
    },
    [
      normalizedSlug,
      guestActive,
      qrActivating,
    ],
  );


  async function activateGuest():
    Promise<void> {
    const normalizedCode =
      accessCode
        .trim()
        .toUpperCase();

    if (
      !normalizedCode
    ) {
      setError(
        "Enter the access code printed next to the QR.",
      );

      return;
    }

    setActivating(
      true,
    );

    setError("");

    try {
      const response =
        await fetch(
          `/api/calendar-access/${encodeURIComponent(
            normalizedSlug,
          )}/guest`,
          {
            method:
              "POST",

            headers: {
              "Content-Type":
                "application/json",
            },

            body:
              JSON.stringify({
                accessCode:
                  normalizedCode,
              }),
          },
        );

      const body =
        await response.json() as {
          guest?:
            boolean;

          record?:
            {
              guestStartedAt?:
                string | null;

              guestExpiresAt?:
                string | null;
            };

          error?:
            string;
        };

      if (
        !response.ok ||
        !body.guest
      ) {
        throw new Error(
          body.error ??
          "This GYAN could not be opened.",
        );
      }

      setGuestActive(
        true,
      );

      setRecord(
        (
          previous,
        ) =>
          previous
            ? {
                ...previous,

                status:
                  "GUEST_ACTIVE",

                guest_started_at:
                  body.record
                    ?.guestStartedAt ??
                  previous
                    .guest_started_at,

                guest_expires_at:
                  body.record
                    ?.guestExpiresAt ??
                  previous
                    .guest_expires_at,
              }
            : previous,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "This GYAN could not be opened.",
      );
    } finally {
      setActivating(
        false,
      );
    }
  }


  async function sendVerification():
    Promise<void> {
    const normalizedEmail =
      email
        .trim()
        .toLowerCase();

    if (
      !normalizedEmail
    ) {
      setError(
        "Enter your email address.",
      );

      return;
    }

    setSending(
      true,
    );

    setError("");

    try {
      const response =
        await fetch(
          "/api/auth/magic-link",
          {
            method:
              "POST",

            headers: {
              "Content-Type":
                "application/json",
            },

            body:
              JSON.stringify({
                email:
                  normalizedEmail,

                returnTo:
                  `/${normalizedSlug.toLowerCase()}`,
              }),
          },
        );

      const body =
        await response.json() as {
          sent?:
            boolean;

          error?:
            string;
        };

      if (
        !response.ok
      ) {
        throw new Error(
          body.error ??
          "Verification email could not be sent.",
        );
      }

      setVerificationSent(
        true,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Verification email could not be sent.",
      );
    } finally {
      setSending(
        false,
      );
    }
  }


  async function protectGyan():
    Promise<void> {
    if (
      !authenticatedEmail
    ) {
      setShowProtect(
        true,
      );

      return;
    }

    const normalizedCode =
      accessCode
        .trim()
        .toUpperCase();

    setClaiming(
      true,
    );

    setError("");

    try {
      const response =
        await fetch(
          `/api/calendar-access/${encodeURIComponent(
            normalizedSlug,
          )}/claim`,
          {
            method:
              "POST",

            headers: {
              "Content-Type":
                "application/json",
            },

            body:
              JSON.stringify({
                accessCode:
                  normalizedCode,
              }),
          },
        );

      const body =
        await response.json() as {
          claimed?:
            boolean;

          error?:
            string;
        };

      if (
        !response.ok ||
        !body.claimed
      ) {
        throw new Error(
          body.error ??
          "This GYAN could not be protected.",
        );
      }

      setClaimed(
        true,
      );

      setRecord(
        (
          previous,
        ) =>
          previous
            ? {
                ...previous,
                status:
                  "CLAIMED",
              }
            : previous,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "This GYAN could not be protected.",
      );
    } finally {
      setClaiming(
        false,
      );
    }
  }


  if (
    loading
  ) {
    return (
      <main className="calendar-register-page">
        <section className="calendar-register-card">
          <div className="calendar-register-state">
            {
              qrActivating
                ? "Opening your GYAN from QR…"
                : "Opening your GYAN…"
            }
          </div>
        </section>
      </main>
    );
  }


  if (
    !record &&
    !unifiedAccount
  ) {
    return (
      <main className="calendar-register-page">
        <section className="calendar-register-card">
          <div className="calendar-register-logo">
            GYAN
          </div>

          <h1>
            We couldn't find this GYAN
          </h1>

          <p>
            Please check the short code printed below the QR.
          </p>

          {
            error && (
              <div className="calendar-register-error">
                {
                  error
                }
              </div>
            )
          }

          <button
            type="button"
            className="calendar-register-secondary"
            onClick={
              onBack
            }
          >
            Go to gyan.cc
          </button>
        </section>
      </main>
    );
  }


  if (
    unifiedAccount
  ) {
    const publicUrl =
      `${window.location.origin}/${unifiedAccount.code.toLowerCase()}`;

    const localCode =
      (
        window.localStorage.getItem(
          "gyan_browser_code_v1",
        ) ??
        ""
      )
        .trim()
        .toUpperCase();

    const sameBrowserOwner =
      localCode ===
      unifiedAccount.code.toUpperCase();

    const navigate =
      (
        destination:
          string,
      ): void => {
        window.location.assign(
          destination,
        );
      };

    const openAccount =
      (): void => {
        navigate(
          "/account",
        );
      };

    return (
      <main className="calendar-register-page">
        <section className="calendar-register-card calendar-register-card--gyan-home">
          <div className="calendar-register-logo">
            GYAN
          </div>

          <small className="calendar-register-kicker">
            ACCOUNT
          </small>

          <h1>
            {
              unifiedAccount.displayName
            }
          </h1>

          <strong className="calendar-register-gyan-code">
            {
              unifiedAccount.code
            }
          </strong>

          <span className="calendar-register-gyan-code-label">
            Your GYAN Code
          </span>

          <small className="calendar-register-gyan-summary">
            One GYAN identity across GYAN.
          </small>

          <div className="calendar-register-account-qr">
            <a
              href={
                publicUrl
              }
              className="calendar-register-account-url"
            >
              {
                publicUrl
              }
            </a>

            <a
              href={
                publicUrl
              }
              className="calendar-register-account-qr-link"
              aria-label={`Open GYAN account ${unifiedAccount.code}`}
              title={
                publicUrl
              }
            >
              <QRCodeSVG
                value={
                  publicUrl
                }
                size={
                  112
                }
                level="M"
                marginSize={
                  1
                }
              />
            </a>

            <strong>
              ACCOUNT
            </strong>
          </div>

          {
            sameBrowserOwner && (
              <>
          <div className="calendar-register-destination-grid">
            <button
              type="button"
              className="calendar-register-destination"
              onClick={() =>
                navigate(
                  "/puzzle",
                )
              }
            >
              🧩 GYAN Puzzle
            </button>

            <button
              type="button"
              className="calendar-register-destination"
              onClick={() =>
                navigate(
                  "/education",
                )
              }
            >
              🎓 GYAN Education
            </button>

            <button
              type="button"
              className="calendar-register-destination"
              onClick={() =>
                navigate(
                  "/services",
                )
              }
            >
              🧰 GYAN Services
            </button>

            <button
              type="button"
              className="calendar-register-destination"
              onClick={
                openAccount
              }
            >
              👤 GYAN Account
            </button>

            <button
              type="button"
              className="calendar-register-destination calendar-register-destination--wide"
              onClick={() =>
                navigate(
                  "/?calendar=print",
                )
              }
            >
              📅 GYAN Calendar
            </button>
          </div>

              </>
            )
          }

          {
            sameBrowserOwner && (
              <small className="calendar-register-owner-device">
                ✓ This device owns {
                  unifiedAccount.code
                }.
              </small>
            )
          }

          {
            !sameBrowserOwner &&
            !unifiedAccount.registered && (
              <small className="calendar-register-public-note">
                Public profile · only owner-shared information is visible.
              </small>
            )
          }

          <button
            type="button"
            className="calendar-register-secondary"
            onClick={
              onBack
            }
          >
            Go to gyan.cc
          </button>
        </section>
      </main>
    );
  }


  /*
   * At this point:
   * - !record && !unifiedAccount already returned the not-found state.
   * - unifiedAccount already returned the unified-account state.
   * Therefore the remaining legacy calendar path has a record.
   *
   * Assigning a non-null local gives TypeScript the narrowing it needs
   * without sprinkling optional chaining through the existing calendar UI.
   */
  const calendarRecord =
    record as CalendarRecord;


  return (
    <main className="calendar-register-page">
      <section className="calendar-register-card">
        <div className="calendar-register-logo">
          GYAN
        </div>

        <small className="calendar-register-kicker">
          YOUR GYAN
        </small>

        <h1>
          {
            calendarRecord.gyan_name
          }
        </h1>

        {
          !guestActive &&
          calendarRecord.status !==
            "CLAIMED" && (
            <>
              <div className="calendar-register-benefit">
                <strong>
                  30-day guest access
                </strong>

                <span>
                  No email required
                </span>

                <small>
                  Progress and reports can be saved to this GYAN.
                </small>
              </div>

              <label className="calendar-register-field">
                <span>
                  Access code
                </span>

                <input
                  type="text"
                  autoCapitalize="characters"
                  autoComplete="off"
                  spellCheck={
                    false
                  }
                  placeholder="XXXXX-XXXXX"
                  value={
                    accessCode
                  }
                  onChange={(
                    event,
                  ) =>
                    setAccessCode(
                      event.target.value,
                    )
                  }
                  onKeyDown={(
                    event,
                  ) => {
                    if (
                      event.key ===
                        "Enter"
                    ) {
                      void activateGuest();
                    }
                  }}
                />
              </label>

              <button
                type="button"
                className="calendar-register-primary"
                disabled={
                  activating
                }
                onClick={() =>
                  void activateGuest()
                }
              >
                {
                  activating
                    ? "Opening…"
                    : "Open My GYAN"
                }
              </button>

              <p className="calendar-register-warning">
                🔑 Keep your GYAN card or access code safe. Without a verified email, GYAN cannot recover it if the card/code is lost.
              </p>
            </>
          )
        }

        {
          guestActive &&
          !claimed && (
            <>
              <div className="calendar-register-success calendar-register-success--guest">
                <span>
                  ✓
                </span>

                <h2>
                  Your 30-day Guest GYAN is ready
                </h2>

                <p>
                  Your learning progress and reports can be saved to {
                    calendarRecord.gyan_name
                  }.
                </p>
              </div>

              <button
                type="button"
                className="calendar-register-primary"
                onClick={
                  onContinue
                }
              >
                Start Learning
              </button>

              <button
                type="button"
                className="calendar-register-protect"
                onClick={() =>
                  setShowProtect(
                    true,
                  )
                }
              >
                🛡️ Protect My GYAN
              </button>

              <p className="calendar-register-warning">
                🔑 Keep your GYAN card safe. Until you protect it with email, losing the card/access credential may make this GYAN unrecoverable.
              </p>
            </>
          )
        }

        {
          showProtect &&
          guestActive &&
          !claimed && (
            <section className="calendar-register-protect-panel">
              <h2>
                Protect {
                  calendarRecord.gyan_name
                }
              </h2>

              <p>
                Add a verified email for recovery and your full {
                  durationLabel(
                    calendarRecord.duration_months,
                  )
                } complimentary access.
              </p>

              {
                authenticatedEmail
                  ? (
                      <>
                        <div className="calendar-register-verified">
                          <span>
                            ✓ Email verified
                          </span>

                          <strong>
                            {
                              authenticatedEmail
                            }
                          </strong>
                        </div>

                        <p className="calendar-register-help">
                          Your verified guest session confirms possession. Protect this GYAN with your email.
                        </p>

                        <button
                          type="button"
                          className="calendar-register-primary"
                          disabled={
                            claiming
                          }
                          onClick={() =>
                            void protectGyan()
                          }
                        >
                          {
                            claiming
                              ? "Protecting…"
                              : "Protect My GYAN"
                          }
                        </button>
                      </>
                    )
                  : verificationSent
                    ? (
                        <div className="calendar-register-email-sent">
                          <span>
                            ✉️
                          </span>

                          <h2>
                            Check your email
                          </h2>

                          <p>
                            Open the verification link. It will bring you back to {
                              calendarRecord.gyan_name
                            }.
                          </p>
                        </div>
                      )
                    : (
                        <>
                          <label className="calendar-register-field">
                            <span>
                              Email
                            </span>

                            <input
                              type="email"
                              inputMode="email"
                              autoComplete="email"
                              placeholder="you@example.com"
                              value={
                                email
                              }
                              onChange={(
                                event,
                              ) =>
                                setEmail(
                                  event.target.value,
                                )
                              }
                              onKeyDown={(
                                event,
                              ) => {
                                if (
                                  event.key ===
                                    "Enter"
                                ) {
                                  void sendVerification();
                                }
                              }}
                            />
                          </label>

                          <button
                            type="button"
                            className="calendar-register-primary"
                            disabled={
                              sending
                            }
                            onClick={() =>
                              void sendVerification()
                            }
                          >
                            {
                              sending
                                ? "Sending…"
                                : "Verify Email"
                            }
                          </button>

                          <small className="calendar-register-privacy">
                            Email protects and recovers your GYAN. It is not shown on the public QR page.
                          </small>
                        </>
                      )
              }
            </section>
          )
        }

        {
          claimed && (
            <div className="calendar-register-success">
              <span>
                ✓
              </span>

              <h2>
                {
                  calendarRecord.gyan_name
                } is protected
              </h2>

              <p>
                If you lose your calendar or access code, you can recover this GYAN with your verified email.
              </p>

              <button
                type="button"
                className="calendar-register-primary"
                onClick={
                  onContinue
                }
              >
                Continue to GYAN
              </button>
            </div>
          )
        }

        {
          error && (
            <div className="calendar-register-error">
              {
                error
              }
            </div>
          )
        }

        <button
          type="button"
          className="calendar-register-link"
          onClick={
            onBack
          }
        >
          Back to GYAN
        </button>
      </section>
    </main>
  );
}
