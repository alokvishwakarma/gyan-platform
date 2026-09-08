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
  isFriend: boolean;
}


type OwnerGyanGoodieType =
  | "MESSAGE"
  | "LOST_FOUND"
  | "EMERGENCY"
  | "CERTIFICATE"
  | "HELP";

interface OwnerGyanGoodie {
  type: OwnerGyanGoodieType;
  token: string;
  publicUrl: string;
}

interface OwnerGyanCard {
  code: string;
  displayName: string;
  publicUrl: string;
  welcomeGems?: number;
  goodies?: OwnerGyanGoodie[];
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


function ownerGoodieLabel(
  type:
    OwnerGyanGoodieType,
): string {
  if (
    type ===
      "MESSAGE"
  ) {
    return "G-Wink";
  }

  if (
    type ===
      "LOST_FOUND"
  ) {
    return "Lost & Found";
  }

  if (
    type ===
      "EMERGENCY"
  ) {
    return "Emergency";
  }

  if (
    type ===
      "CERTIFICATE"
  ) {
    return "Certificate";
  }

  return "Help";
}


function ownerGoodieIcon(
  type:
    OwnerGyanGoodieType,
): string {
  if (
    type ===
      "MESSAGE"
  ) {
    return "💌";
  }

  if (
    type ===
      "LOST_FOUND"
  ) {
    return "🔎";
  }

  if (
    type ===
      "EMERGENCY"
  ) {
    return "🆘";
  }

  if (
    type ===
      "CERTIFICATE"
  ) {
    return "🏅";
  }

  return "🤝";
}


const OWNER_GOODIE_ORDER:
  OwnerGyanGoodieType[] = [
    "MESSAGE",
    "LOST_FOUND",
    "EMERGENCY",
    "CERTIFICATE",
    "HELP",
  ];


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


  const [
    publicAction,
    setPublicAction,
  ] =
    useState<
      "friend" |
      "wink" |
      null
    >(
      () => {
        const action =
          new URLSearchParams(
            window.location.search,
          ).get(
            "action",
          );

        return action ===
          "friend" ||
          action ===
            "wink"
          ? action
          : null;
      },
    );

  const [
    winkMessage,
    setWinkMessage,
  ] =
    useState(
      "Hi 👋",
    );

  const [
    publicActionStatus,
    setPublicActionStatus,
  ] =
    useState("");


  const [
    publicActionSubmitting,
    setPublicActionSubmitting,
  ] =
    useState(
      false,
    );


  const [
    ownerCardOpen,
    setOwnerCardOpen,
  ] =
    useState(
      false,
    );

  const [
    ownerCard,
    setOwnerCard,
  ] =
    useState<
      OwnerGyanCard |
      null
    >(
      null,
    );

  const [
    ownerCardLoading,
    setOwnerCardLoading,
  ] =
    useState(
      false,
    );

  const [
    ownerCardError,
    setOwnerCardError,
  ] =
    useState("");


  const [
    ownerCardEmailOpen,
    setOwnerCardEmailOpen,
  ] =
    useState(
      false,
    );

  const [
    ownerCardEmail,
    setOwnerCardEmail,
  ] =
    useState("");

  const [
    ownerCardEmailStatus,
    setOwnerCardEmailStatus,
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
        guestActive
      ) {
        return;
      }

      let cancelled =
        false;

      /*
       * Defer the state updates out of the synchronous effect body.
       * This keeps the effect focused on synchronizing with the
       * URL/fetch lifecycle and satisfies react-hooks/set-state-in-effect.
       */
      queueMicrotask(
        () => {
          if (
            cancelled
          ) {
            return;
          }

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

                setQrActivating(
                  false,
                );

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
                  cancelled
                ) {
                  return;
                }

                setQrActivating(
                  false,
                );

                setError(
                  caught instanceof
                    Error
                    ? caught.message
                    : "This QR could not open the GYAN.",
                );
              },
            );
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

    const friendUrl =
      `${publicUrl}?action=friend`;

    const winkUrl =
      `${publicUrl}?action=wink`;

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


    const openOwnerCard =
      async (): Promise<void> => {
        if (
          ownerCardLoading
        ) {
          return;
        }

        setOwnerCardOpen(
          true,
        );

        setOwnerCardError(
          "",
        );

        if (
          ownerCard &&
          ownerCard.code
            .trim()
            .toUpperCase() ===
          unifiedAccount.code
            .trim()
            .toUpperCase()
        ) {
          return;
        }

        setOwnerCardLoading(
          true,
        );

        try {
          const response =
            await fetch(
              "/api/gyan-identity",
              {
                method:
                  "GET",
                cache:
                  "no-store",
                credentials:
                  "include",
              },
            );

          const body =
            await response.json() as {
              identity?:
                OwnerGyanCard |
                null;

              error?:
                string;
            };

          if (
            !response.ok ||
            !body.identity
          ) {
            throw new Error(
              body.error ??
                "Your GYAN Card could not be loaded.",
            );
          }

          if (
            body.identity.code
              .trim()
              .toUpperCase() !==
            unifiedAccount.code
              .trim()
              .toUpperCase()
          ) {
            throw new Error(
              "This device does not own this GYAN Card.",
            );
          }

          setOwnerCard(
            body.identity,
          );
        } catch (
          caught
        ) {
          setOwnerCardError(
            caught instanceof
              Error
              ? caught.message
              : "Your GYAN Card could not be loaded.",
          );
        } finally {
          setOwnerCardLoading(
            false,
          );
        }
      };

    const downloadOwnerCard =
      (): void => {
        if (
          !ownerCard
        ) {
          return;
        }

        window.localStorage.setItem(
          "gyan_browser_code_v1",
          ownerCard.code,
        );

        window.location.href =
          "/?calendar=print&autodownload=1";
      };


    const shareOwnerCardOnWhatsApp =
      (): void => {
        if (
          !ownerCard
        ) {
          return;
        }

        const message =
          encodeURIComponent(
            [
              `My GYAN Card: ${ownerCard.displayName} [${ownerCard.code}]`,
              ownerCard.publicUrl,
              "",
              "Keeping this here so I can find my GYAN Card again. 🌱",
            ].join(
              "\n",
            ),
          );

        window.open(
          `https://wa.me/?text=${message}`,
          "_blank",
          "noopener,noreferrer",
        );
      };


    const emailOwnerCard =
      async (): Promise<void> => {
        const recipient =
          ownerCardEmail
            .trim()
            .toLowerCase();

        if (
          !recipient
        ) {
          setOwnerCardEmailOpen(
            true,
          );

          return;
        }

        setOwnerCardEmailStatus(
          "Sending…",
        );

        try {
          const response =
            await fetch(
              "/api/gyan-identity/email-card",
              {
                method:
                  "POST",

                credentials:
                  "include",

                headers: {
                  "Content-Type":
                    "application/json",
                },

                body:
                  JSON.stringify({
                    email:
                      recipient,
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
            !response.ok ||
            !body.sent
          ) {
            throw new Error(
              body.error ??
                "Unable to send the GYAN Card email.",
            );
          }

          setOwnerCardEmailStatus(
            "✓ Sent",
          );
        } catch (
          caught
        ) {
          setOwnerCardEmailStatus(
            caught instanceof
              Error
              ? caught.message
              : "Unable to send.",
          );
        }
      };


    const closePublicAction =
      (): void => {
        setPublicAction(
          null,
        );

        setPublicActionStatus(
          "",
        );

        const nextUrl =
          `${window.location.pathname}`;

        window.history.replaceState(
          {},
          "",
          nextUrl,
        );
      };

    const openPublicAction =
      (
        action:
          "friend" |
          "wink",
      ): void => {
        setPublicActionStatus(
          "",
        );

        if (
          action ===
            "wink" &&
          !winkMessage.trim()
        ) {
          setWinkMessage(
            "Hi 👋",
          );
        }

        setPublicAction(
          action,
        );

        const nextUrl =
          `${window.location.pathname}?action=${action}`;

        window.history.replaceState(
          {},
          "",
          nextUrl,
        );
      };


    const submitPublicAction =
      async (): Promise<void> => {
        if (
          !publicAction ||
          publicActionSubmitting
        ) {
          return;
        }

        const message =
          publicAction ===
            "friend"
            ? ""
            : winkMessage.trim();

        if (
          publicAction ===
            "wink" &&
          !message
        ) {
          setPublicActionStatus(
            "Write a G-Wink message first.",
          );

          return;
        }

        setPublicActionSubmitting(
          true,
        );

        setPublicActionStatus(
          "",
        );

        try {
          /*
           * Friend is now a real persistent relationship and does not
           * need to manufacture a G-Wink. Send Hi continues to reuse
           * the existing G-Wink recipient flow.
           */
          if (
            publicAction ===
              "friend"
          ) {
            const friendResponse =
              await fetch(
                "/api/gyan-identity/friends",
                {
                  method:
                    "POST",

                  credentials:
                    "include",

                  headers: {
                    "Content-Type":
                      "application/json",
                  },

                  body:
                    JSON.stringify({
                      friendCode:
                        unifiedAccount.code,
                    }),
                },
              );

            const friendBody =
              await friendResponse.json() as {
                added?:
                  boolean;

                friend?:
                  {
                    code:
                      string;

                    displayName:
                      string;
                  };

                error?:
                  string;
              };

            if (
              !friendResponse.ok ||
              !friendBody.added
            ) {
              throw new Error(
                friendBody.error ??
                  "Friend could not be added.",
              );
            }

            setUnifiedAccount(
              (
                current,
              ) =>
                current
                  ? {
                      ...current,
                      isFriend:
                        true,
                    }
                  : current,
            );

            setPublicActionStatus(
              `✓ ${unifiedAccount.displayName} is now a friend.`,
            );

            return;
          }

          /*
           * Send Hi uses the visitor's existing GYAN identity and
           * MESSAGE goodie as the sender. GET is read-only and does
           * not silently create an identity.
           */
          const identityResponse =
            await fetch(
              "/api/gyan-identity",
              {
                method:
                  "GET",
                cache:
                  "no-store",
                credentials:
                  "include",
              },
            );

          const identityBody =
            await identityResponse.json() as {
              identity?:
                {
                  code:
                    string;

                  goodies?:
                    Array<{
                      type:
                        string;

                      token:
                        string;

                      publicUrl:
                        string;
                    }>;
                } |
                null;

              error?:
                string;
            };

          if (
            !identityResponse.ok
          ) {
            throw new Error(
              identityBody.error ??
                "Your GYAN identity could not be loaded.",
            );
          }

          const senderIdentity =
            identityBody.identity ??
            null;

          if (
            !senderIdentity
          ) {
            setPublicActionStatus(
              "This device needs its own GYAN identity before connecting or sending a G-Wink.",
            );

            return;
          }

          if (
            senderIdentity.code
              .trim()
              .toUpperCase() ===
            unifiedAccount.code
              .trim()
              .toUpperCase()
          ) {
            setPublicActionStatus(
              "This is your own GYAN account.",
            );

            return;
          }

          const messageGoodie =
            senderIdentity.goodies
              ?.find(
                (
                  goodie,
                ) =>
                  goodie.type ===
                  "MESSAGE",
              ) ??
            null;

          if (
            !messageGoodie?.token
          ) {
            throw new Error(
              "Your GYAN Message card is not available yet.",
            );
          }

          const response =
            await fetch(
              `/api/safety-resources/${encodeURIComponent(
                messageGoodie.token,
              )}/message/winks`,
              {
                method:
                  "POST",

                credentials:
                  "include",

                headers: {
                  "Content-Type":
                    "application/json",
                },

                body:
                  JSON.stringify({
                    kind:
                      "😉",

                    message,

                    recipient:
                      unifiedAccount.code,

                    addFriend:
                      false,
                  }),
              },
            );

          const body =
            await response.json() as {
              created?:
                boolean;

              deliveredToAccount?:
                {
                  code:
                    string;

                  displayName:
                    string;
                } |
                null;

              recipientEmailSent?:
                boolean;

              error?:
                string;
            };

          if (
            !response.ok ||
            !body.created
          ) {
            throw new Error(
              body.error ??
                "G-Wink could not be sent.",
            );
          }

          setPublicActionStatus(
            `✓ Hi sent to ${unifiedAccount.displayName}.`,
          );
        } catch (
          caught
        ) {
          setPublicActionStatus(
            caught instanceof
              Error
              ? caught.message
              : (
                  publicAction ===
                    "friend"
                    ? "Friend request could not be sent."
                    : "G-Wink could not be sent."
                ),
          );
        } finally {
          setPublicActionSubmitting(
            false,
          );
        }
      };

    return (
      <main className="calendar-register-page">
        <section className="calendar-register-card calendar-register-card--gyan-home">
          <div
            style={{
              textAlign:
                "center",
              color:
                "#111827",
              fontSize:
                "0.82rem",
              fontWeight:
                900,
              letterSpacing:
                "0.08em",
            }}
          >
            GYAN ACCOUNT
          </div>

          <h1
            style={{
              margin:
                "7px 0 3px",
              color:
                "#9a5b24",
              textAlign:
                "center",
            }}
          >
            {
              unifiedAccount.displayName
            }
          </h1>

          <div
            style={{
              display:
                "flex",
              justifyContent:
                "center",
              alignItems:
                "baseline",
              gap:
                "5px",
              marginBottom:
                "8px",
              textAlign:
                "center",
              fontSize:
                "0.76rem",
            }}
          >
            <strong>
              Account Code
            </strong>

            <span>
              -
            </span>

            <strong
              style={{
                color:
                  "#9a5b24",
                letterSpacing:
                  "0.08em",
              }}
            >
              {
                unifiedAccount.code
              }
            </strong>
          </div>

          <div className="calendar-register-account-qr">
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
                  126
                }
                level="M"
                marginSize={
                  1
                }
              />
            </a>

          </div>

          {
            sameBrowserOwner && (
              <>
                <small
                  className="calendar-register-owner-device"
                  style={{
                    display:
                      "block",
                    width:
                      "100%",
                    textAlign:
                      "center",
                  }}
                >
                  ✓ This device owns {
                    unifiedAccount.code
                  }.
                </small>

                <div
                  style={{
                    display:
                      "flex",
                    justifyContent:
                      "center",
                    width:
                      "100%",
                    marginTop:
                      "6px",
                  }}
                >
                  <button
                    type="button"
                    className="calendar-register-destination"
                    onClick={() => {
                      void openOwnerCard();
                    }}
                    style={{
                      width:
                        "auto",
                      minHeight:
                        "26px",
                      padding:
                        "3px 10px",
                      fontSize:
                        "0.62rem",
                    }}
                  >
                    🎁 GYAN Card
                  </button>
                </div>
              </>
            )
          }

          {
            !sameBrowserOwner && (
              <>
                <div
                  style={{
                    display:
                      "grid",
                    gridTemplateColumns:
                      "repeat(2, minmax(0, 1fr))",
                    gap:
                      "8px",
                    width:
                      "100%",
                    marginTop:
                      "9px",
                  }}
                >
                  <div
                    style={{
                      display:
                        "grid",
                      justifyItems:
                        "center",
                      gap:
                        "4px",
                      padding:
                        "7px 5px 6px",
                      border:
                        "1px solid #d9dee7",
                      borderRadius:
                        "10px",
                      background:
                        "#ffffff",
                    }}
                  >
                    <a
                      href={
                        friendUrl
                      }
                      title={`Scan to add ${unifiedAccount.displayName} as a friend`}
                      aria-label={`Add friend QR for ${unifiedAccount.code}`}
                      style={{
                        display:
                          "grid",
                        placeItems:
                          "center",
                        textDecoration:
                          "none",
                      }}
                    >
                      <QRCodeSVG
                        value={
                          friendUrl
                        }
                        size={
                          54
                        }
                        level="M"
                        marginSize={
                          0
                        }
                      />
                    </a>

                    {
                      unifiedAccount.isFriend
                        ? (
                          <span
                            style={{
                              minHeight:
                                "22px",
                              display:
                                "inline-flex",
                              alignItems:
                                "center",
                              padding:
                                "2px 6px",
                              color:
                                "#334155",
                              fontSize:
                                "0.56rem",
                              fontWeight:
                                800,
                              whiteSpace:
                                "nowrap",
                            }}
                          >
                            ✓ Already a friend
                          </span>
                        )
                        : (
                          <button
                            type="button"
                            onClick={() =>
                              openPublicAction(
                                "friend",
                              )
                            }
                            style={{
                              minHeight:
                                "22px",
                              padding:
                                "2px 6px",
                              border:
                                "1px solid #cbd5e1",
                              borderRadius:
                                "7px",
                              background:
                                "#f8fafc",
                              color:
                                "#334155",
                              font:
                                "inherit",
                              fontSize:
                                "0.56rem",
                              fontWeight:
                                800,
                              cursor:
                                "pointer",
                              whiteSpace:
                                "nowrap",
                            }}
                          >
                            👥 Add friend
                          </button>
                        )
                    }
                  </div>

                  <div
                    style={{
                      display:
                        "grid",
                      justifyItems:
                        "center",
                      gap:
                        "4px",
                      padding:
                        "7px 5px 6px",
                      border:
                        "1px solid #d9dee7",
                      borderRadius:
                        "10px",
                      background:
                        "#ffffff",
                    }}
                  >
                    <a
                      href={
                        winkUrl
                      }
                      title={`Scan to say Hi to ${unifiedAccount.displayName}`}
                      aria-label={`Send Hi QR for ${unifiedAccount.code}`}
                      style={{
                        display:
                          "grid",
                        placeItems:
                          "center",
                        textDecoration:
                          "none",
                      }}
                    >
                      <QRCodeSVG
                        value={
                          winkUrl
                        }
                        size={
                          54
                        }
                        level="M"
                        marginSize={
                          0
                        }
                      />
                    </a>

                    <button
                      type="button"
                      onClick={() =>
                        openPublicAction(
                          "wink",
                        )
                      }
                      style={{
                        minHeight:
                          "22px",
                        padding:
                          "2px 6px",
                        border:
                          "1px solid #cbd5e1",
                        borderRadius:
                          "7px",
                        background:
                          "#f8fafc",
                        color:
                          "#334155",
                        font:
                          "inherit",
                        fontSize:
                          "0.56rem",
                        fontWeight:
                          800,
                        cursor:
                          "pointer",
                        whiteSpace:
                          "nowrap",
                      }}
                    >
                      💌 Send Hi
                    </button>
                  </div>
                </div>

                <small className="calendar-register-public-note">
                  Scanning opens a confirmation first. Nothing is added or sent automatically.
                </small>
              </>
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

        {
          sameBrowserOwner &&
          ownerCardOpen && (
            <div
              role="presentation"
              onClick={() =>
                setOwnerCardOpen(
                  false,
                )
              }
              style={{
                position:
                  "fixed",
                inset:
                  0,
                zIndex:
                  1000,
                display:
                  "grid",
                placeItems:
                  "center",
                padding:
                  "12px",
                overflowY:
                  "auto",
                background:
                  "rgba(15, 23, 42, 0.48)",
              }}
            >
              <section
                role="dialog"
                aria-modal="true"
                aria-label="GYAN Card"
                onClick={(
                  event,
                ) =>
                  event.stopPropagation()
                }
                style={{
                  boxSizing:
                    "border-box",
                  width:
                    "min(100%, 430px)",
                  maxHeight:
                    "calc(100vh - 24px)",
                  overflowY:
                    "auto",
                  padding:
                    "14px",
                  border:
                    "1px solid #d8dee8",
                  borderRadius:
                    "14px",
                  background:
                    "#fff",
                  boxShadow:
                    "0 18px 48px rgba(15, 23, 42, 0.22)",
                  textAlign:
                    "center",
                }}
              >
                <div
                  style={{
                    fontSize:
                      "0.7rem",
                    fontWeight:
                      900,
                    letterSpacing:
                      "0.08em",
                    color:
                      "#111827",
                  }}
                >
                  GYAN CARD
                </div>

                {
                  ownerCardLoading
                    ? (
                      <p
                        style={{
                          margin:
                            "18px 0",
                          fontSize:
                            "0.78rem",
                        }}
                      >
                        Loading GYAN Card…
                      </p>
                    )
                    : ownerCardError
                      ? (
                        <p
                          style={{
                            margin:
                              "18px 0",
                            color:
                              "#b42318",
                            fontSize:
                              "0.76rem",
                          }}
                        >
                          {
                            ownerCardError
                          }
                        </p>
                      )
                      : ownerCard
                        ? (
                          <>
                            <h2
                              style={{
                                margin:
                                  "6px 0 2px",
                                color:
                                  "#9a5b24",
                              }}
                            >
                              {
                                ownerCard.displayName
                              }
                            </h2>

                            <div
                              style={{
                                marginBottom:
                                  "8px",
                                fontSize:
                                  "0.72rem",
                              }}
                            >
                              <strong>
                                Account Code
                              </strong>{" "}
                              -{" "}
                              <strong
                                style={{
                                  color:
                                    "#9a5b24",
                                  letterSpacing:
                                    "0.08em",
                                }}
                              >
                                {
                                  ownerCard.code
                                }
                              </strong>

                              {
                                typeof ownerCard.welcomeGems ===
                                  "number" && (
                                  <>
                                    {" · "}
                                    💎 {
                                      ownerCard.welcomeGems
                                    }
                                  </>
                                )
                              }
                            </div>

                            <div
                              style={{
                                display:
                                  "grid",
                                gridTemplateColumns:
                                  "repeat(4, minmax(0, 1fr))",
                                gap:
                                  "5px",
                                width:
                                  "100%",
                              }}
                            >
                              <a
                                href={
                                  ownerCard.publicUrl
                                }
                                target="_blank"
                                rel="noreferrer"
                                title="My GYAN Home"
                                style={{
                                  minWidth:
                                    0,
                                  padding:
                                    "4px 2px",
                                  border:
                                    "2px solid #8a5a3b",
                                  borderRadius:
                                    "8px",
                                  background:
                                    "#fffaf6",
                                  color:
                                    "#7a4d32",
                                  textDecoration:
                                    "none",
                                  textAlign:
                                    "center",
                                }}
                              >
                                <QRCodeSVG
                                  value={
                                    ownerCard.publicUrl
                                  }
                                  size={
                                    58
                                  }
                                  level="M"
                                  marginSize={
                                    0
                                  }
                                />

                                <strong
                                  style={{
                                    display:
                                      "block",
                                    marginTop:
                                      "2px",
                                    fontSize:
                                      "0.5rem",
                                    lineHeight:
                                      1,
                                    whiteSpace:
                                      "nowrap",
                                  }}
                                >
                                  🏠 GYAN
                                </strong>
                              </a>

                              {[
                                {
                                  label:
                                    "Education",
                                  icon:
                                    "🎓",
                                  path:
                                    "/education",
                                },
                                {
                                  label:
                                    "Services",
                                  icon:
                                    "🧰",
                                  path:
                                    "/services",
                                },
                                {
                                  label:
                                    "Puzzle",
                                  icon:
                                    "🧩",
                                  path:
                                    "/puzzle",
                                },
                              ].map(
                                (
                                  shortcut,
                                ) => {
                                  const shortcutUrl =
                                    `${window.location.origin}${shortcut.path}`;

                                  return (
                                    <a
                                      key={
                                        shortcut.path
                                      }
                                      href={
                                        shortcutUrl
                                      }
                                      target="_blank"
                                      rel="noreferrer"
                                      title={
                                        shortcut.label
                                      }
                                      style={{
                                        minWidth:
                                          0,
                                        padding:
                                          "4px 2px",
                                        border:
                                          "1px solid #c9d8cc",
                                        borderRadius:
                                          "8px",
                                        background:
                                          "#f8fcf8",
                                        color:
                                          "#356442",
                                        textDecoration:
                                          "none",
                                        textAlign:
                                          "center",
                                      }}
                                    >
                                      <QRCodeSVG
                                        value={
                                          shortcutUrl
                                        }
                                        size={
                                          58
                                        }
                                        level="M"
                                        marginSize={
                                          0
                                        }
                                      />

                                      <strong
                                        style={{
                                          display:
                                            "block",
                                          marginTop:
                                            "2px",
                                          fontSize:
                                            "0.47rem",
                                          lineHeight:
                                            1,
                                          whiteSpace:
                                            "nowrap",
                                        }}
                                      >
                                        {
                                          shortcut.icon
                                        }{" "}
                                        {
                                          shortcut.label
                                        }
                                      </strong>
                                    </a>
                                  );
                                },
                              )}
                            </div>

                            <div
                              style={{
                                margin:
                                  "7px 0 4px",
                                color:
                                  "#356442",
                                fontSize:
                                  "0.5rem",
                                fontWeight:
                                  900,
                                letterSpacing:
                                  "0.08em",
                              }}
                            >
                              GOODIES
                            </div>

                            <div
                              style={{
                                display:
                                  "grid",
                                gridTemplateColumns:
                                  "repeat(5, minmax(0, 1fr))",
                                gap:
                                  "4px",
                                width:
                                  "100%",
                              }}
                            >
                              {[
                                ...(ownerCard.goodies ??
                                  []),
                              ]
                                .sort(
                                  (
                                    first,
                                    second,
                                  ) =>
                                    OWNER_GOODIE_ORDER.indexOf(
                                      first.type,
                                    ) -
                                    OWNER_GOODIE_ORDER.indexOf(
                                      second.type,
                                    ),
                                )
                                .map(
                                  (
                                    goodie,
                                  ) => (
                                    <a
                                      key={
                                        goodie.type
                                      }
                                      href={
                                        goodie.publicUrl
                                      }
                                      target="_blank"
                                      rel="noreferrer"
                                      title={
                                        ownerGoodieLabel(
                                          goodie.type,
                                        )
                                      }
                                      style={{
                                        minWidth:
                                          0,
                                        padding:
                                          "4px 1px",
                                        border:
                                          "1px solid #d8dee8",
                                        borderRadius:
                                          "8px",
                                        background:
                                          "#fff",
                                        color:
                                          "#475569",
                                        textDecoration:
                                          "none",
                                        textAlign:
                                          "center",
                                      }}
                                    >
                                      <QRCodeSVG
                                        value={
                                          goodie.publicUrl
                                        }
                                        size={
                                          48
                                        }
                                        level="M"
                                        marginSize={
                                          0
                                        }
                                      />

                                      <strong
                                        style={{
                                          display:
                                            "block",
                                          marginTop:
                                            "2px",
                                          overflow:
                                            "hidden",
                                          textOverflow:
                                            "ellipsis",
                                          fontSize:
                                            "0.42rem",
                                          lineHeight:
                                            1.05,
                                          whiteSpace:
                                            "nowrap",
                                        }}
                                      >
                                        {
                                          ownerGoodieIcon(
                                            goodie.type,
                                          )
                                        }{" "}
                                        {
                                          ownerGoodieLabel(
                                            goodie.type,
                                          )
                                        }
                                      </strong>
                                    </a>
                                  ),
                                )}
                            </div>

                            <div
                              style={{
                                display:
                                  "grid",
                                gridTemplateColumns:
                                  "repeat(3, minmax(0, 1fr))",
                                gap:
                                  "6px",
                                marginTop:
                                  "10px",
                              }}
                            >
                              <button
                                type="button"
                                onClick={
                                  downloadOwnerCard
                                }
                                style={{
                                  minHeight:
                                    "34px",
                                  border:
                                    "1px solid #b8c5d1",
                                  borderRadius:
                                    "8px",
                                  background:
                                    "#fff",
                                  font:
                                    "inherit",
                                  fontSize:
                                    "0.58rem",
                                  fontWeight:
                                    800,
                                  cursor:
                                    "pointer",
                                }}
                              >
                                🖨️ Download
                              </button>

                              <button
                                type="button"
                                onClick={() =>
                                  setOwnerCardEmailOpen(
                                    (
                                      current,
                                    ) =>
                                      !current,
                                  )
                                }
                                style={{
                                  minHeight:
                                    "34px",
                                  border:
                                    "1px solid #b8c5d1",
                                  borderRadius:
                                    "8px",
                                  background:
                                    "#fff",
                                  font:
                                    "inherit",
                                  fontSize:
                                    "0.58rem",
                                  fontWeight:
                                    800,
                                  cursor:
                                    "pointer",
                                }}
                              >
                                ✉️ Email
                              </button>

                              <button
                                type="button"
                                onClick={
                                  shareOwnerCardOnWhatsApp
                                }
                                style={{
                                  minHeight:
                                    "34px",
                                  border:
                                    "1px solid #b8c5d1",
                                  borderRadius:
                                    "8px",
                                  background:
                                    "#fff",
                                  font:
                                    "inherit",
                                  fontSize:
                                    "0.58rem",
                                  fontWeight:
                                    800,
                                  cursor:
                                    "pointer",
                                }}
                              >
                                🟢 WhatsApp
                              </button>
                            </div>

                            {
                              ownerCardEmailOpen && (
                                <div
                                  style={{
                                    display:
                                      "grid",
                                    gridTemplateColumns:
                                      "minmax(0, 1fr) auto",
                                    gap:
                                      "6px",
                                    marginTop:
                                      "7px",
                                  }}
                                >
                                  <input
                                    type="email"
                                    value={
                                      ownerCardEmail
                                    }
                                    onChange={(
                                      event,
                                    ) => {
                                      setOwnerCardEmail(
                                        event.target.value,
                                      );

                                      setOwnerCardEmailStatus(
                                        "",
                                      );
                                    }}
                                    placeholder="Email address"
                                    style={{
                                      minWidth:
                                        0,
                                      border:
                                        "1px solid #cbd5e1",
                                      borderRadius:
                                        "8px",
                                      padding:
                                        "6px 8px",
                                      font:
                                        "inherit",
                                      fontSize:
                                        "0.68rem",
                                    }}
                                  />

                                  <button
                                    type="button"
                                    onClick={() => {
                                      void emailOwnerCard();
                                    }}
                                    style={{
                                      border:
                                        "1px solid #b8c5d1",
                                      borderRadius:
                                        "8px",
                                      background:
                                        "#fff",
                                      padding:
                                        "5px 9px",
                                      font:
                                        "inherit",
                                      fontSize:
                                        "0.62rem",
                                      fontWeight:
                                        800,
                                      cursor:
                                        "pointer",
                                    }}
                                  >
                                    Send
                                  </button>
                                </div>
                              )
                            }

                            {
                              ownerCardEmailStatus && (
                                <small
                                  style={{
                                    display:
                                      "block",
                                    marginTop:
                                      "5px",
                                    color:
                                      "#64748b",
                                  }}
                                >
                                  {
                                    ownerCardEmailStatus
                                  }
                                </small>
                              )
                            }
                          </>
                        )
                        : null
                }

                <button
                  type="button"
                  className="calendar-register-primary"
                  onClick={() =>
                    setOwnerCardOpen(
                      false,
                    )
                  }
                  style={{
                    width:
                      "100%",
                    marginTop:
                      "10px",
                  }}
                >
                  Close
                </button>
              </section>
            </div>
          )
        }

        {
          !sameBrowserOwner &&
          publicAction && (
            <div
              role="presentation"
              onClick={
                closePublicAction
              }
              style={{
                position:
                  "fixed",
                inset:
                  0,
                zIndex:
                  1000,
                display:
                  "grid",
                placeItems:
                  "center",
                padding:
                  "18px",
                background:
                  "rgba(15, 23, 42, 0.48)",
              }}
            >
              <section
                role="dialog"
                aria-modal="true"
                aria-label={
                  publicAction ===
                    "friend"
                    ? "Add friend"
                    : "Send G-Wink"
                }
                onClick={(
                  event,
                ) =>
                  event.stopPropagation()
                }
                style={{
                  boxSizing:
                    "border-box",
                  width:
                    "min(100%, 360px)",
                  padding:
                    "16px",
                  border:
                    "1px solid #d8dee8",
                  borderRadius:
                    "14px",
                  background:
                    "#fff",
                  boxShadow:
                    "0 18px 48px rgba(15, 23, 42, 0.22)",
                }}
              >
                {
                  publicAction ===
                    "friend"
                    ? (
                      <>
                        <h2
                          style={{
                            margin:
                              "0 0 7px",
                            textAlign:
                              "center",
                          }}
                        >
                          {
                            unifiedAccount.isFriend
                              ? "✓ Already a Friend"
                              : "👥 Add Friend"
                          }
                        </h2>

                        <p
                          style={{
                            margin:
                              "0 0 13px",
                            textAlign:
                              "center",
                          }}
                        >
                          {
                            unifiedAccount.isFriend
                              ? (
                                <>
                                  <strong>
                                    {
                                      unifiedAccount.displayName
                                    }
                                  </strong>{" "}
                                  [{
                                    unifiedAccount.code
                                  }] is already in your friends.
                                </>
                              )
                              : (
                                <>
                                  Add{" "}
                                  <strong>
                                    {
                                      unifiedAccount.displayName
                                    }
                                  </strong>{" "}
                                  [{
                                    unifiedAccount.code
                                  }] as a friend?
                                </>
                              )
                          }
                        </p>
                      </>
                    )
                    : (
                      <>
                        <h2
                          style={{
                            margin:
                              "0 0 7px",
                            textAlign:
                              "center",
                          }}
                        >
                          💌 Send Hi
                        </h2>

                        <p
                          style={{
                            margin:
                              "0 0 8px",
                            textAlign:
                              "center",
                            fontSize:
                              "0.82rem",
                          }}
                        >
                          To{" "}
                          <strong>
                            {
                              unifiedAccount.displayName
                            }
                          </strong>{" "}
                          [{
                            unifiedAccount.code
                          }]
                        </p>

                        <textarea
                          value={
                            winkMessage
                          }
                          onChange={(
                            event,
                          ) =>
                            setWinkMessage(
                              event.target.value,
                            )
                          }
                          rows={
                            3
                          }
                          maxLength={
                            240
                          }
                          autoFocus
                          style={{
                            boxSizing:
                              "border-box",
                            width:
                              "100%",
                            resize:
                              "vertical",
                            border:
                              "1px solid #cbd5e1",
                            borderRadius:
                              "9px",
                            padding:
                              "9px",
                            font:
                              "inherit",
                          }}
                        />
                      </>
                    )
                }

                {
                  publicActionStatus && (
                    <small
                      style={{
                        display:
                          "block",
                        marginTop:
                          "8px",
                        color:
                          "#64748b",
                        textAlign:
                          "center",
                      }}
                    >
                      {
                        publicActionStatus
                      }
                    </small>
                  )
                }

                {
                  publicAction ===
                    "friend" &&
                  unifiedAccount.isFriend
                    ? (
                      <button
                        type="button"
                        className="calendar-register-primary"
                        onClick={
                          closePublicAction
                        }
                        style={{
                          width:
                            "100%",
                          marginTop:
                            "12px",
                        }}
                      >
                        Close
                      </button>
                    )
                    : (
                      <div
                        style={{
                          display:
                            "grid",
                          gridTemplateColumns:
                            "1fr 1fr",
                          gap:
                            "8px",
                          marginTop:
                            "12px",
                        }}
                      >
                        <button
                          type="button"
                          className="calendar-register-secondary"
                          onClick={
                            closePublicAction
                          }
                        >
                          Cancel
                        </button>

                        <button
                          type="button"
                          className="calendar-register-primary"
                          disabled={
                            publicActionSubmitting ||
                            (
                              publicAction ===
                                "wink" &&
                              !winkMessage.trim()
                            )
                          }
                          onClick={() => {
                            void submitPublicAction();
                          }}
                        >
                          {
                            publicActionSubmitting
                              ? "Sending…"
                              : publicAction ===
                                  "friend"
                                ? "👥 Add Friend"
                                : "💌 Send Hi"
                          }
                        </button>
                      </div>
                    )
                }
              </section>
            </div>
          )
        }
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
