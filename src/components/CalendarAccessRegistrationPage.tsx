import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./CalendarAccessRegistrationPage.css";


interface CalendarRecord {
  id:
    number;

  slug:
    string;

  gyan_name:
    string;

  duration_months:
    1 | 3 | 12;

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

          if (
            !recordResponse.ok ||
            !recordBody.record
          ) {
            throw new Error(
              recordBody.error ??
              "This GYAN code could not be found.",
            );
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
            recordBody.record,
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
            recordBody.record.status ===
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

    if (
      !normalizedCode
    ) {
      setError(
        "Enter the printed access code again to protect this GYAN.",
      );

      return;
    }

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
            Opening your GYAN…
          </div>
        </section>
      </main>
    );
  }


  if (
    !record
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
            record.gyan_name
          }
        </h1>

        {
          !guestActive &&
          record.status !==
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
                🔑 Keep this access code safe. Without a verified email, GYAN cannot recover this account if the code is lost.
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
                    record.gyan_name
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
                🔑 Keep your access code safe. Until you protect this GYAN with email, a lost code cannot be recovered.
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
                  record.gyan_name
                }
              </h2>

              <p>
                Add a verified email for recovery and your full {
                  durationLabel(
                    record.duration_months,
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
                          Enter the printed access code once more to confirm possession of this GYAN.
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
                              record.gyan_name
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
                  record.gyan_name
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
