import {
  useEffect,
  useState,
  type SyntheticEvent,
} from "react";

import {
  createPortal,
} from "react-dom";

import {
  QRCodeSVG,
} from "qrcode.react";

import AuthPanel
  from "./AuthPanel";

import GyanCalendarPage
  from "./GyanCalendarPage";

import "./UserAccountMenu.css";

const GYAN_CARD_WELCOME_EVENT =
  "gyan-card-welcome-change";

const GYAN_CARD_WELCOME_SESSION_KEY =
  "gyan_card_welcome_open_v1";


interface AuthUser {
  id: number;
  email: string;
}

interface AuthMeResponse {
  authenticated: boolean;

  user:
    | AuthUser
    | null;
}

interface GyanIdentity {
  code: string;
  displayName: string;
  publicUrl: string;
  accessCode?: string;
  maskedEmail?: string;
  registered?: boolean;
  emailStatus?:
    | "none"
    | "pending"
    | "verified";

  goodies?: GyanGoodie[];
  welcomeGems?: number;
}


type GyanGoodieType =
  | "MESSAGE"
  | "LOST_FOUND"
  | "EMERGENCY"
  | "CERTIFICATE"
  | "HELP";

type GyanGoodie = {
  type: GyanGoodieType;
  token: string;
  publicUrl: string;
};

const GOODIE_ORDER:
  GyanGoodieType[] = [
    "MESSAGE",
    "LOST_FOUND",
    "EMERGENCY",
    "CERTIFICATE",
    "HELP",
  ];

function goodieLabel(
  type: GyanGoodieType,
): string {
  if (type === "MESSAGE") {
    return "G-Wink";
  }

  if (type === "LOST_FOUND") {
    return "Lost & Found";
  }

  if (type === "EMERGENCY") {
    return "Emergency";
  }

  if (type === "CERTIFICATE") {
    return "Certificate";
  }

  return "Help";
}

function goodieIcon(
  type: GyanGoodieType,
): string {
  if (type === "MESSAGE") {
    return "💌";
  }

  if (type === "LOST_FOUND") {
    return "🔎";
  }

  if (type === "EMERGENCY") {
    return "🆘";
  }

  if (type === "CERTIFICATE") {
    return "🏅";
  }

  return "🤝";
}


function gyanEmailStatus(
  identity:
    GyanIdentity,
): {
  label:
    "Unregistered" |
    "Pending verification" |
    "Verified";
  icon: string;
  title: string;
} {
  if (
    identity.emailStatus ===
      "verified" ||
    (
      identity.registered &&
      identity.maskedEmail
    )
  ) {
    return {
      label:
        "Verified",
      icon:
        "✅",
      title:
        identity.maskedEmail ??
        "Verified email",
    };
  }

  if (
    identity.emailStatus ===
      "pending" ||
    identity.maskedEmail
  ) {
    return {
      label:
        "Pending verification",
      icon:
        "🟡",
      title:
        identity.maskedEmail ??
        "Pending email verification",
    };
  }

  return {
    label:
      "Unregistered",
    icon:
      "✉️",
    title:
      "No verified email is linked to this GYAN.",
  };
}



interface UserAccountMenuProps {
  onOpenAdmin: () => void;
  onOpenChat: () => void;

  onOpenMyShop: (
    shopCode: string,
  ) => void;

  onRegisterMyShop: (
    email: string,
  ) => void;

  /*
   * Existing Education/account-menu props.
   * Keep these accepted while the unified GYAN identity work
   * is layered onto the current menu.
   */
  educationCode?: string;
  educationEmailKnown?: boolean;
  onOpenMyRatings?: () => void;

  isAdminAuthenticated?: boolean;

  onGenerateQr?: () => void;
}

interface MyShopsResponse {
  shops?: {
    code: string;
    name: string;
  }[];

  error?: string;
}


/*
 * Single-flight guard for EXPLICIT identity creation.
 *
 * Normal component mount first uses GET. If no GYAN belongs to this
 * browser yet, startup falls through to the explicit POST create path.
 * Concurrent POST callers share this promise so StrictMode or rapid
 * interaction cannot create duplicate accounts.
 */
let gyanIdentityCreateRequest:
  Promise<GyanIdentity> | null =
    null;


async function createOrGetGyanIdentity():
  Promise<GyanIdentity> {
  if (
    gyanIdentityCreateRequest
  ) {
    return gyanIdentityCreateRequest;
  }

  gyanIdentityCreateRequest =
    (async () => {
      const response =
        await fetch(
          "/api/gyan-identity",
          {
            method:
              "POST",

            credentials:
              "include",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                browserCode:
                  window.localStorage.getItem(
                    "gyan_browser_code_v1",
                  ) ??
                  undefined,

                client: {
                  userAgent:
                    window.navigator.userAgent,

                  language:
                    window.navigator.language,

                  languages:
                    Array.from(
                      window.navigator.languages ??
                      [],
                    ),

                  platform:
                    window.navigator.platform ??
                    "",

                  touch:
                    (
                      window.navigator.maxTouchPoints ??
                      0
                    ) >
                      0,

                  screenWidth:
                    window.screen.width,

                  screenHeight:
                    window.screen.height,

                  viewportWidth:
                    window.innerWidth,

                  viewportHeight:
                    window.innerHeight,

                  referrer:
                    document.referrer,

                  utmSource:
                    new URLSearchParams(
                      window.location.search,
                    ).get(
                      "utm_source",
                    ) ??
                    "",

                  utmMedium:
                    new URLSearchParams(
                      window.location.search,
                    ).get(
                      "utm_medium",
                    ) ??
                    "",

                  utmCampaign:
                    new URLSearchParams(
                      window.location.search,
                    ).get(
                      "utm_campaign",
                    ) ??
                    "",
                },
              }),
          },
        );

      const body =
        await response.json() as {
          identity?:
            GyanIdentity;

          error?:
            string;
        };

      if (
        !response.ok ||
        !body.identity
      ) {
        throw new Error(
          body.error ??
            "GYAN identity could not be loaded.",
        );
      }

      return body.identity;
    })();

  try {
    return await gyanIdentityCreateRequest;
  } finally {
    /*
     * Keep only concurrent callers deduplicated.
     * Future remounts can call the endpoint again; by then the cookie
     * exists and the Worker returns the same account.
     */
    gyanIdentityCreateRequest =
      null;
  }
}

export default function UserAccountMenu({
  onOpenAdmin,
  onOpenChat,
  onOpenMyShop,
  onRegisterMyShop,
  isAdminAuthenticated =
    false,
  onGenerateQr,
}: UserAccountMenuProps) {
  const [
    open,
    setOpen,
  ] =
    useState(false);

  const [
    authOpen,
    setAuthOpen,
  ] =
    useState(false);

  const [
    loading,
    setLoading,
  ] =
    useState(true);

  const [
    user,
    setUser,
  ] =
    useState<
      AuthUser | null
    >(null);

  const [
    gyanIdentity,
    setGyanIdentity,
  ] =
    useState<
      GyanIdentity | null
    >(null);

  const [
    identityLoading,
    setIdentityLoading,
  ] =
    useState(true);

  const [
    showAccessCode,
    setShowAccessCode,
  ] =
    useState(false);
  const [
    emailDraft,
    setEmailDraft,
  ] =
    useState("");

  const [
    emailUpdating,
    setEmailUpdating,
  ] =
    useState(false);

  const [
    emailPendingLocal,
    setEmailPendingLocal,
  ] =
    useState(false);

  const [
    emailUpdateMessage,
    setEmailUpdateMessage,
  ] =
    useState("");

  const [
    newCardWelcome,
    setNewCardWelcome,
  ] =
    useState<
      GyanIdentity | null
    >(null);

  const [
    newCardEmailOpen,
    setNewCardEmailOpen,
  ] =
    useState(false);

  const [
    newCardEmail,
    setNewCardEmail,
  ] =
    useState("");

  const [
    newCardEmailStatus,
    setNewCardEmailStatus,
  ] =
    useState("");

  const [
    cardDownloadRequested,
    setCardDownloadRequested,
  ] =
    useState(false);

  const [
    calendarDownloadRequested,
    setCalendarDownloadRequested,
  ] =
    useState(false);

  const [
    welcomeSaved,
    setWelcomeSaved,
  ] =
    useState(false);

  const [
    unreadGWinks,
    setUnreadGWinks,
  ] =
    useState(0);

  function welcomeSeenKey(
    code: string,
  ): string {
    return `gyan_new_card_welcome_seen_v1:${code
      .trim()
      .toUpperCase()}`;
  }

  const welcomePendingKey =
    "gyan_new_card_welcome_pending_v1";


  useEffect(
    () => {
      const welcomeOpen =
        Boolean(
          newCardWelcome,
        );

      try {
        if (welcomeOpen) {
          window.sessionStorage.setItem(
            GYAN_CARD_WELCOME_SESSION_KEY,
            "1",
          );
        } else {
          window.sessionStorage.removeItem(
            GYAN_CARD_WELCOME_SESSION_KEY,
          );
        }
      } catch {
        // Continue normally when sessionStorage is unavailable.
      }

      window.dispatchEvent(
        new CustomEvent(
          GYAN_CARD_WELCOME_EVENT,
          {
            detail: {
              open:
                welcomeOpen,
            },
          },
        ),
      );
    },
    [
      newCardWelcome,
    ],
  );


  useEffect(
    () =>
      () => {
        try {
          window.sessionStorage.removeItem(
            GYAN_CARD_WELCOME_SESSION_KEY,
          );
        } catch {
          // Ignore storage cleanup failures.
        }

        window.dispatchEvent(
          new CustomEvent(
            GYAN_CARD_WELCOME_EVENT,
            {
              detail: {
                open:
                  false,
              },
            },
          ),
        );
      },
    [],
  );


  function isGWinkRevealRoute():
    boolean {
    return Boolean(
      new URLSearchParams(
        window.location.search,
      ).get(
        "wink",
      ),
    );
  }

  function markWelcomeSeen(
    identity:
      GyanIdentity,
  ): void {
    window.localStorage.setItem(
      welcomeSeenKey(
        identity.code,
      ),
      "1",
    );

    window.localStorage.removeItem(
      welcomePendingKey,
    );

    setWelcomeSaved(
      true,
    );
  }

  function closeWelcomeDialog():
    void {
    setNewCardWelcome(
      null,
    );

    setWelcomeSaved(
      false,
    );

    setNewCardEmailOpen(
      false,
    );

    setNewCardEmailStatus(
      "",
    );
  }

  function downloadCurrentCard(
    identity:
      GyanIdentity,
  ): void {
    window.localStorage.setItem(
      "gyan_browser_code_v1",
      identity.code,
    );

    setCardDownloadRequested(
      true,
    );
  }


async function emailCurrentCard(
  recipient:
    string,
): Promise<void> {
    const email =
      recipient.trim();

    if (!email) {
      setNewCardEmailOpen(
        true,
      );

      return;
    }

    setNewCardEmailStatus(
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
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                email,
              }),
          },
        );

      const body =
        await response.json() as {
          sent?: boolean;
          error?: string;
        };

      if (
        !response.ok ||
        !body.sent
      ) {
        throw new Error(
          body.error ??
            "Unable to send GYAN Card email.",
        );
      }

      setNewCardEmailStatus(
        "✓ Sent",
      );

      if (
        newCardWelcome
      ) {
        markWelcomeSeen(
          newCardWelcome,
        );
      }
    } catch (
      error
    ) {
      setNewCardEmailStatus(
        error instanceof
          Error
          ? error.message
          : "Unable to send.",
      );
    }
  }


  function shareCurrentCardOnWhatsApp(
    identity:
      GyanIdentity,
  ): void {
    const message =
      encodeURIComponent(
        [
          `My GYAN Card: ${identity.displayName} [${identity.code}]`,
          identity.publicUrl,
          "",
          "Keeping this here so I can find my GYAN Card again. 🌱",
        ].join("\n"),
      );

    window.open(
      `https://wa.me/?text=${message}`,
      "_blank",
      "noopener,noreferrer",
    );

    markWelcomeSeen(
      identity,
    );
  }


  const [
    myShopLoading,
    setMyShopLoading,
  ] =
    useState(false);

  const [
    myShops,
    setMyShops,
  ] =
    useState<
      {
        code: string;
        name: string;
      }[]
    >([]);

  const [
    myShopError,
    setMyShopError,
  ] =
    useState("");

  async function loadGyanIdentity():
    Promise<void> {
    setIdentityLoading(
      true,
    );

    try {
      const identity =
        await createOrGetGyanIdentity();

      setGyanIdentity(
        identity,
      );

      window.localStorage.setItem(
        "gyan_browser_code_v1",
        identity.code,
      );

      if (
        window.localStorage.getItem(
          welcomeSeenKey(
            identity.code,
          ),
        ) !== "1"
      ) {
        setOpen(
          false,
        );

        setWelcomeSaved(
          false,
        );

        setNewCardWelcome(
          identity,
        );
      }
    } catch (
      error
    ) {
      console.error(
        "Unable to load GYAN identity:",
        error,
      );

      setGyanIdentity(
        null,
      );
    } finally {
      setIdentityLoading(
        false,
      );
    }
  }

  async function loadUser():
    Promise<void> {
    try {
      const response =
        await fetch(
          "/api/auth/me",
          {
            credentials:
              "include",
          },
        );

      if (!response.ok) {
        setUser(null);
        setMyShops([]);
        return;
      }

      const result =
        (await response.json()) as
          AuthMeResponse;

      setUser(
        result.authenticated
          ? result.user
          : null,
      );

      if (
        !result.authenticated
      ) {
        setMyShops(
          [],
        );
      }
    } catch {
      setUser(null);
      setMyShops([]);
    } finally {
      setLoading(false);
    }
  }

  async function updateGyanEmail():
    Promise<void> {
    const email =
      emailDraft
        .trim()
        .toLowerCase();

    if (
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        email,
      )
    ) {
      setEmailUpdateMessage(
        "Enter a valid email.",
      );

      return;
    }

    setEmailUpdating(
      true,
    );

    setEmailUpdateMessage(
      "",
    );

    try {
      const response =
        await fetch(
          "/api/gyan-identity/email",
          {
            method:
              "POST",

            credentials:
              "include",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                email,
              }),
          },
        );

      const body =
        await response.json() as {
          saved?: boolean;
          verificationSent?: boolean;
          emailStatus?:
            | "pending"
            | "verified";
          maskedEmail?: string;
          error?: string;
        };

      if (
        !body.saved
      ) {
        throw new Error(
          body.error ??
            "Email could not be saved.",
        );
      }

      setGyanIdentity(
        (
          current,
        ) =>
          current
            ? {
                ...current,
                maskedEmail:
                  body.maskedEmail ??
                  current.maskedEmail,
                emailStatus:
                  body.emailStatus ??
                  "pending",
                registered:
                  body.emailStatus ===
                    "verified"
                    ? true
                    : current.registered,
              }
            : current,
      );

      setEmailPendingLocal(
        body.emailStatus !==
          "verified",
      );

      setEmailUpdateMessage(
        body.emailStatus ===
          "verified"
          ? "Verified."
          : body.verificationSent
            ? "Saved · verification sent."
            : "Saved · verification pending.",
      );

      if (
        !response.ok &&
        body.error
      ) {
        console.warn(
          body.error,
        );
      }
    } catch (
      caught
    ) {
      setEmailUpdateMessage(
        caught instanceof Error
          ? caught.message
          : "Email could not be saved.",
      );
    } finally {
      setEmailUpdating(
        false,
      );
    }
  }



  useEffect(
    () => {
      let cancelled =
        false;

      async function refreshUnread():
        Promise<void> {
        try {
          const response =
            await fetch(
              "/api/safety-resources/winks/unread",
              {
                credentials:
                  "include",
                cache:
                  "no-store",
              },
            );

          if (!response.ok) {
            return;
          }

          const body =
            await response.json() as {
              unread?: number;
            };

          if (!cancelled) {
            setUnreadGWinks(
              Math.max(
                0,
                Number(
                  body.unread ??
                  0,
                ),
              ),
            );
          }
        } catch {
          // Keep account navigation usable if unread refresh fails.
        }
      }

      void refreshUnread();

      const refresh =
        (): void => {
          void refreshUnread();
        };

      window.addEventListener(
        "focus",
        refresh,
      );

      document.addEventListener(
        "visibilitychange",
        refresh,
      );

      window.addEventListener(
        "gyan-wink-read",
        refresh,
      );

      return () => {
        cancelled =
          true;

        window.removeEventListener(
          "focus",
          refresh,
        );

        document.removeEventListener(
          "visibilitychange",
          refresh,
        );

        window.removeEventListener(
          "gyan-wink-read",
          refresh,
        );
      };
    },
    [],
  );


  useEffect(
    () => {
      const controller =
        new AbortController();

      void fetch(
        "/api/gyan-identity",
        {
          method:
            "GET",

          credentials:
            "include",

          cache:
            "no-store",

          signal:
            controller.signal,
        },
      )
        .then(
          async (
            response,
          ) => {
            const body =
              await response.json() as {
                identity?:
                  GyanIdentity | null;

                error?:
                  string;
              };

            if (!response.ok) {
              throw new Error(
                body.error ??
                  "GYAN identity could not be loaded.",
              );
            }

            if (
              body.identity
            ) {
              return body.identity;
            }

            /*
             * No GYAN belongs to this browser yet.
             * Create it immediately so the welcome dialog can appear
             * without waiting for the Account icon to be clicked.
             */
            return createOrGetGyanIdentity();
          },
        )
        .then(
          (identity) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setGyanIdentity(
              identity,
            );

            if (identity) {
              window.localStorage.setItem(
                "gyan_browser_code_v1",
                identity.code,
              );

              if (
                window.localStorage.getItem(
                  welcomeSeenKey(
                    identity.code,
                  ),
                ) !== "1"
              ) {
                if (
                  isGWinkRevealRoute()
                ) {
                  window.localStorage.setItem(
                    welcomePendingKey,
                    identity.code
                      .trim()
                      .toUpperCase(),
                  );
                } else {
                  setWelcomeSaved(
                    false,
                  );

                  setNewCardWelcome(
                    identity,
                  );
                }
              }
            }
          },
        )
        .catch(
          (error) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            console.error(
              "Unable to read GYAN identity:",
              error,
            );

            setGyanIdentity(
              null,
            );
          },
        )
        .finally(
          () => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setIdentityLoading(
              false,
            );
          },
        );

      return () => {
        controller.abort();
      };
    },
    [],
  );


  useEffect(
    () => {
      const showPendingWelcome =
        (): void => {
          if (
            !gyanIdentity
          ) {
            return;
          }

          const pendingCode =
            window.localStorage.getItem(
              welcomePendingKey,
            );

          if (
            pendingCode !==
              gyanIdentity.code
                .trim()
                .toUpperCase() ||
            window.localStorage.getItem(
              welcomeSeenKey(
                gyanIdentity.code,
              ),
            ) === "1"
          ) {
            return;
          }

          setWelcomeSaved(
            false,
          );

          setNewCardWelcome(
            gyanIdentity,
          );
        };

      window.addEventListener(
        "gyan-show-welcome-pending",
        showPendingWelcome,
      );

      if (
        !isGWinkRevealRoute()
      ) {
        showPendingWelcome();
      }

      return () => {
        window.removeEventListener(
          "gyan-show-welcome-pending",
          showPendingWelcome,
        );
      };
    },
    [
      gyanIdentity,
    ],
  );


  useEffect(
    () => {
      const controller =
        new AbortController();

      const parameters =
        new URLSearchParams(
          window.location.search,
        );

      if (
        parameters.get(
          "auth",
        ) ===
          "success"
      ) {
        window.history.replaceState(
          {},
          "",
          window.location.pathname,
        );
      }

      fetch(
        "/api/auth/me",
        {
          credentials:
            "include",

          signal:
            controller.signal,
        },
      )
        .then(
          async (
            response,
          ) => {
            if (
              !response.ok
            ) {
              return null;
            }

            return (
              await response.json()
            ) as
              AuthMeResponse;
          },
        )
        .then(
          (result) => {
            if (
              controller.signal
                .aborted
            ) {
              return;
            }

            setUser(
              result
                ?.authenticated
                ? result.user
                : null,
            );

            setLoading(
              false,
            );
          },
        )
        .catch(
          (error) => {
            if (
              error instanceof
                DOMException &&
              error.name ===
                "AbortError"
            ) {
              return;
            }

            if (
              controller.signal
                .aborted
            ) {
              return;
            }

            setUser(
              null,
            );

            setMyShops(
              [],
            );

            setLoading(
              false,
            );
          },
        );

      return () => {
        controller.abort();
      };
    },
    [],
  );

  async function loadMyShops():
    Promise<
      {
        code: string;
        name: string;
      }[]
    > {
    if (
      myShopLoading
    ) {
      return myShops;
    }

    setMyShopLoading(
      true,
    );

    setMyShopError("");

    try {
      const response =
        await fetch(
          "/api/chat/my-shops",
          {
            credentials:
              "include",
          },
        );

      const result =
        (await response.json()) as
          MyShopsResponse;

      if (
        !response.ok
      ) {
        throw new Error(
          result.error ??
            "Your shops could not be loaded.",
        );
      }

      const shops =
        (result.shops ?? [])
          .map(
            (shop) => ({
              code:
                shop.code
                  .trim()
                  .toUpperCase(),

              name:
                shop.name,
            }),
          );

      setMyShops(
        shops,
      );

      if (
        shops.length ===
          0
      ) {
        setMyShopError(
          "No active shop is linked to this email.",
        );
      }

      return shops;
    } catch (
      caughtError
    ) {
      setMyShopError(
        caughtError instanceof
          Error
          ? caughtError.message
          : "Your shops could not be loaded.",
      );

      return [];
    } finally {
      setMyShopLoading(
        false,
      );
    }
  }


  function openMyShop(
    shopCode: string,
  ): void {
    setOpen(
      false,
    );

    onOpenMyShop(
      shopCode,
    );
  }


  function closeMenu(
    event?:
      SyntheticEvent,
  ): void {
    event?.preventDefault();
    event?.stopPropagation();

    setShowAccessCode(
      false,
    );

    setOpen(
      false,
    );
  }


  function toggleMenu():
    void {
    const nextOpen =
      !open;

    setOpen(
      nextOpen,
    );

    /*
     * Opening Account is an explicit account action.
     * Ordinary page load/Home uses GET only and never creates.
     */
    if (
      nextOpen &&
      !identityLoading &&
      !gyanIdentity
    ) {
      void loadGyanIdentity();
    }

    if (
      nextOpen &&
      user &&
      myShops.length ===
        0 &&
      !myShopLoading
    ) {
      void loadMyShops();
    }
  }

  async function logout():
    Promise<void> {
    await fetch(
      "/api/auth/logout",
      {
        method:
          "POST",

        credentials:
          "include",
      },
    );

    setUser(
      null,
    );

    setMyShops(
      [],
    );

    setMyShopError(
      "",
    );

    setOpen(
      false,
    );
  }

  return (
    <>
      <div
        className="user-account-menu"
      >
        <button
          type="button"
          className={[
            "user-account-menu__trigger",

            user
              ? "user-account-menu__trigger--signed-in"
              : "",

            unreadGWinks > 0
              ? "user-account-menu__trigger--unread"
              : "",
          ].join(" ")}
          style={{
            position:
              "relative",
            color:
              unreadGWinks > 0
                ? "#b91c1c"
                : undefined,
          }}
          aria-label={
            user
              ? "Open signed-in user menu"
              : "Open user menu"
          }
          title={
            user
              ? user.email
              : "User"
          }
          aria-expanded={
            open
          }
          onClick={
            toggleMenu
          }
        >
          <span
            aria-hidden="true"
          >
            👤
          </span>

          {unreadGWinks > 0 && (
            <sup
              aria-label={`${unreadGWinks} unread G-Winks`}
              style={{
                position:
                  "absolute",
                top:
                  "-5px",
                right:
                  "-7px",
                minWidth:
                  "16px",
                height:
                  "16px",
                padding:
                  "0 4px",
                border:
                  "2px solid #fff",
                borderRadius:
                  "999px",
                background:
                  "#dc2626",
                color:
                  "#fff",
                fontSize:
                  "0.58rem",
                fontWeight:
                  900,
                lineHeight:
                  "12px",
                textAlign:
                  "center",
              }}
            >
              {
                unreadGWinks >
                  99
                  ? "99+"
                  : unreadGWinks
              }
            </sup>
          )}

          {user && (
            <b
              aria-hidden="true"
            >
              ✓
            </b>
          )}
        </button>

        {open &&
          createPortal(
            <div
              className="user-account-menu__popover user-account-menu__popover--portal"
              onClick={(event) =>
                event.stopPropagation()
              }
            >
            <button
              type="button"
              aria-label="Close account menu"
              title="Close"
              onPointerDown={(event) => {
                event.preventDefault();
                event.stopPropagation();
              }}
              onClick={(event) => {
                closeMenu(
                  event,
                );
              }}
              style={{
                position:
                  "absolute",
                top:
                  "4px",
                right:
                  "5px",
                width:
                  "24px",
                height:
                  "24px",
                padding:
                  0,
                display:
                  "grid",
                placeItems:
                  "center",
                border:
                  0,
                background:
                  "transparent",
                fontSize:
                  "1rem",
                lineHeight:
                  1,
                cursor:
                  "pointer",
                zIndex:
                  2,
              }}
            >
              ×
            </button>
            <div className="user-account-menu__identity">
              <small>
                Your GYAN
              </small>

              {
                identityLoading ? (
                  <strong>
                    Loading…
                  </strong>
                ) : gyanIdentity ? (
                  <>
                    <strong
                      style={{
                        color:
                          "#e97825",
                      }}
                    >
                      {
                        gyanIdentity.displayName
                      } · {
                        gyanIdentity.code
                      }
                    </strong>

                    <a
                      href={
                        gyanIdentity.publicUrl
                      }
                      style={{
                        color:
                          "#e97825",
                        fontWeight:
                          850,
                      }}
                    >
                      {
                        gyanIdentity.publicUrl
                      }
                    </a>

                    {
                      gyanIdentity.accessCode && (
                        <span className="user-account-menu__access-code">
                          Access Code{" "}
                          <b
                            style={{
                              color:
                                "#e97825",
                            }}
                          >
                            {
                              showAccessCode
                                ? gyanIdentity.accessCode
                                : "•••••-•••••"
                            }
                          </b>

                          <button
                            type="button"
                            onClick={() =>
                              setShowAccessCode(
                                (
                                  current,
                                ) =>
                                  !current,
                              )
                            }
                            style={{
                              flex:
                                "0 0 auto",
                              width:
                                "auto",
                              minWidth:
                                0,
                              minHeight:
                                "20px",
                              padding:
                                "1px 5px",
                              borderRadius:
                                "5px",
                              fontSize:
                                "0.58rem",
                              lineHeight:
                                1.05,
                            }}
                          >
                            {
                              showAccessCode
                                ? "Hide"
                                : "Show"
                            }
                          </button>
                        </span>
                      )
                    }

                    {(() => {
                      const emailStatus =
                        gyanEmailStatus(
                          gyanIdentity,
                        );

                      const effectiveStatus =
                        emailPendingLocal &&
                        !gyanIdentity.registered
                          ? "Pending verification"
                          : emailStatus.label;

                      const statusColor =
                        effectiveStatus ===
                          "Verified"
                          ? "#2e7d32"
                          : effectiveStatus ===
                              "Pending verification"
                            ? "#d8a500"
                            : "#8b5a2b";

                      const statusTitle =
                        effectiveStatus ===
                          "Verified"
                          ? "Verified email"
                          : effectiveStatus ===
                              "Pending verification"
                            ? "Pending email verification"
                            : "Email not registered";

                      return (
                        <>
                          <div
                            className="user-account-menu__email-editor"
                            style={{
                              display:
                                "grid",
                              gridTemplateColumns:
                                "auto minmax(0, 1fr) auto",
                              alignItems:
                                "center",
                              gap:
                                "5px",
                              width:
                                "100%",
                              boxSizing:
                                "border-box",
                              marginTop:
                                "6px",
                            }}
                          >
                            <span
                              title={
                                statusTitle
                              }
                              aria-label={
                                statusTitle
                              }
                              style={{
                                width:
                                  "17px",
                                height:
                                  "17px",
                                display:
                                  "grid",
                                placeItems:
                                  "center",
                                border:
                                  `1.5px solid ${statusColor}`,
                                borderRadius:
                                  "999px",
                                color:
                                  statusColor,
                                fontSize:
                                  "0.58rem",
                                fontWeight:
                                  900,
                                lineHeight:
                                  1,
                              }}
                            >
                              i
                            </span>

                            <input
                              type="email"
                              inputMode="email"
                              autoComplete="email"
                              value={
                                emailDraft
                              }
                              onChange={(
                                event,
                              ) => {
                                setEmailDraft(
                                  event.target.value,
                                );

                                setEmailUpdateMessage(
                                  "",
                                );
                              }}
                              placeholder={
                                gyanIdentity.maskedEmail ??
                                "Email"
                              }
                              aria-label="GYAN email"
                              style={{
                                minWidth:
                                  0,
                                width:
                                  "100%",
                                height:
                                  "24px",
                                boxSizing:
                                  "border-box",
                                padding:
                                  "2px 6px",
                                border:
                                  "1px solid #cbd5e1",
                                borderRadius:
                                  "5px",
                                background:
                                  "#fff",
                                fontSize:
                                  "0.61rem",
                              }}
                            />

                            <button
                              type="button"
                              title="Update email / send verification"
                              aria-label="Update email and send verification"
                              disabled={
                                emailUpdating
                              }
                              onClick={() =>
                                void updateGyanEmail()
                              }
                              style={{
                                flex:
                                  "0 0 auto",
                                width:
                                  "24px",
                                height:
                                  "24px",
                                minWidth:
                                  "24px",
                                minHeight:
                                  "24px",
                                padding:
                                  0,
                                display:
                                  "grid",
                                placeItems:
                                  "center",
                                border:
                                  "1px solid #cbd5e1",
                                borderRadius:
                                  "5px",
                                background:
                                  "#fff",
                                cursor:
                                  emailUpdating
                                    ? "wait"
                                    : "pointer",
                                fontSize:
                                  "0.74rem",
                                lineHeight:
                                  1,
                              }}
                            >
                              {
                                emailUpdating
                                  ? "…"
                                  : "↻"
                              }
                            </button>
                          </div>

                          <small
                            style={{
                              display:
                                "block",
                              minHeight:
                                "12px",
                              marginTop:
                                "2px",
                              color:
                                emailUpdateMessage
                                  ? "#64748b"
                                  : statusColor,
                              fontSize:
                                "0.54rem",
                              lineHeight:
                                1.1,
                            }}
                          >
                            Email: {
                              emailUpdateMessage ||
                              effectiveStatus
                            }
                          </small>
                        </>
                      );
                    })()}

                    <div


                      style={{


                        display:


                          "grid",


                        gridTemplateColumns:


                          "repeat(2, minmax(0, 1fr))",


                        gap:


                          "4px",


                        marginTop:


                          "6px",


                      }}


                    >


                      <button


                        type="button"


                        className="user-account-menu__compact-download"
                        onClick={() => {


                          setOpen(


                            false,


                          );



                          setNewCardWelcome(


                            gyanIdentity,


                          );


                        }}


                        title="Download GYAN Card"


                        style={{


                          width:


                            "100%",


                          minWidth:


                            0,


                          padding:


                            "5px 4px",


                          border:


                            "1px solid #cbd5e1",


                          borderRadius:


                            "7px",


                          background:


                            "#fff",


                          color:


                            "#174a73",


                          font:


                            "inherit",


                          fontSize:


                            "0.6rem",


                          fontWeight:


                            800,


                          lineHeight:


                            1.05,


                          textAlign:


                            "center",


                          whiteSpace:


                            "nowrap",


                          cursor:


                            "pointer",


                        }}


                      >


                        🎁 GYAN Card ↓


                      </button>



                      <button


                        type="button"


                        className="user-account-menu__compact-download"
                        onClick={() => {


                          setOpen(


                            false,


                          );



                          window.localStorage.setItem(
                            "gyan_browser_code_v1",
                            gyanIdentity.code,
                          );

                          setCalendarDownloadRequested(
                            true,
                          );


                        }}


                        title="Download Calendar"


                        style={{


                          width:


                            "100%",


                          minWidth:


                            0,


                          padding:


                            "5px 4px",


                          border:


                            "1px solid #cbd5e1",


                          borderRadius:


                            "7px",


                          background:


                            "#fff",


                          color:


                            "#174a73",


                          font:


                            "inherit",


                          fontSize:


                            "0.6rem",


                          fontWeight:


                            800,


                          lineHeight:


                            1.05,


                          textAlign:


                            "center",


                          whiteSpace:


                            "nowrap",


                          cursor:


                            "pointer",


                        }}


                      >


                        📅 Calendar ↓


                      </button>


                    </div>
                  </>
                ) : (
                  <strong>
                    GYAN unavailable
                  </strong>
                )
              }
            </div>

            {loading ? (
              <div
                className="user-account-menu__status"
              >
                Loading…
              </div>
            ) : user ? (
              <>
                <div
                  className="user-account-menu__identity"
                >
                  <small>
                    Signed in as
                  </small>

                  <strong>
                    {
                      user.email
                    }
                  </strong>
                </div>

                <button
                  type="button"
                  onClick={() =>
                    setOpen(
                      false,
                    )
                  }
                >
                  🎮 Player
                </button>

                <button
                  type="button"
                  onClick={() =>
                    setOpen(
                      false,
                    )
                  }
                >
                  🛍 Shopper
                </button>

                <button
                  type="button"
                  onClick={() => {
                    setOpen(
                      false,
                    );

                    onOpenChat();
                  }}
                >
                  💬 Chat
                </button>

                {myShopLoading ? (
                  <button
                    type="button"
                    disabled
                  >
                    🏪 My Shop…
                  </button>
                ) : myShops.length >
                  0 ? (
                  myShops.map(
                    (shop) => (
                      <button
                        type="button"
                        key={
                          shop.code
                        }
                        title={
                          shop.name
                        }
                        onClick={() =>
                          openMyShop(
                            shop.code,
                          )
                        }
                      >
                        🏪 My Shop (
                        {shop.code})
                      </button>
                    ),
                  )
                ) : (
                  <button
                    type="button"
                    onClick={() => {
                      setOpen(
                        false,
                      );

                      onRegisterMyShop(
                        user.email,
                      );
                    }}
                  >
                    🏪 Register My Shop
                  </button>
                )}

                {myShopError && (
                  <div
                    className="user-account-menu__status"
                  >
                    {
                      myShopError
                    }
                  </div>
                )}

                <button
                  type="button"
                  onClick={() => {
                    setOpen(
                      false,
                    );

                    onOpenAdmin();
                  }}
                >
                  ⚙ Admin
                </button>

                {isAdminAuthenticated &&
                  onGenerateQr && (
                    <button
                      type="button"
                      onClick={() => {
                        setOpen(
                          false,
                        );

                        onGenerateQr();
                      }}
                    >
                      ▣ Generate QR
                    </button>
                  )}

                <button
                  type="button"
                  className="user-account-menu__logout"
                  onClick={() =>
                    void logout()
                  }
                >
                  ↪ Logout
                </button>
              </>
            ) : (
              <>
                <div
                  style={{
                    display:
                      "grid",
                    gridTemplateColumns:
                      "minmax(0, 1fr) auto",
                    alignItems:
                      "center",
                    gap:
                      "6px",
                    padding:
                      "5px 4px",
                    borderBottom:
                      "1px solid #edf1f6",
                    marginBottom:
                      "3px",
                  }}
                >
                  <div
                    style={{
                      minWidth:
                        0,
                      whiteSpace:
                        "nowrap",
                      overflow:
                        "hidden",
                      textOverflow:
                        "ellipsis",
                      lineHeight:
                        1.05,
                    }}
                  >
                    <strong
                      style={{
                        fontSize:
                          "0.68rem",
                      }}
                    >
                      GYAN Account
                    </strong>
                    <small
                      style={{
                        marginLeft:
                          "4px",
                        color:
                          "#64748b",
                        fontSize:
                          "0.56rem",
                      }}
                    >
                      Sign in with email.
                    </small>
                  </div>

                  <button
                    type="button"
                    className="user-account-menu__signin"
                    onClick={() => {
                      setOpen(
                        false,
                      );

                      setAuthOpen(
                        true,
                      );
                    }}
                    style={{
                      width:
                        "auto",
                      minWidth:
                        "62px",
                      padding:
                        "6px 8px",
                      textAlign:
                        "center",
                      whiteSpace:
                        "nowrap",
                    }}
                  >
                    ✉️ Sign in
                  </button>
                </div>

                <button
                  type="button"
                  onClick={() => {
                    setOpen(
                      false,
                    );

                    onOpenAdmin();
                  }}
                >
                  ⚙ Admin
                </button>

                {isAdminAuthenticated &&
                  onGenerateQr && (
                    <button
                      type="button"
                      onClick={() => {
                        setOpen(
                          false,
                        );

                        onGenerateQr();
                      }}
                    >
                      ▣ Generate QR
                    </button>
                  )}

                <button
                  type="button"
                  onClick={(event) => {
                    closeMenu(
                      event,
                    );
                  }}
                >
                  Close
                </button>
              </>
            )}
            </div>,
            document.body,
          )}
      </div>

      {newCardWelcome &&
        createPortal(
          <div
            role="presentation"
            style={{
              position: "fixed",
              inset: 0,
              zIndex: 5000,
              display: "block",
              padding: 0,
              background: "rgb(15 23 42 / 42%)",
              backdropFilter: "blur(2px)",
            }}
          >
            <section
              role="dialog"
              aria-modal="true"
              aria-labelledby="gyan-new-card-title"
              onClick={(event) =>
                event.stopPropagation()
              }
              style={{
                position: "absolute",
                top:
                  "calc(var(--gyan-header-height, 64px) + 6px)",
                left: "50%",
                transform:
                  "translateX(-50%)",
                boxSizing: "border-box",
                width:
                  "min(calc(100vw - 24px), 520px)",
                maxHeight:
                  "calc(100dvh - var(--gyan-header-height, 64px) - 18px)",
                overflowY:
                  "auto",
                border:
                  "1px solid rgb(148 163 184 / 38%)",
                borderRadius: "18px",
                padding: "13px 14px",
                background: "#fffdf8",
                boxShadow:
                  "0 22px 60px rgb(15 23 42 / 24%)",
                color: "#1f2937",
              }}
            >
              <div
                style={{
                  display: "flex",
                  alignItems: "flex-start",
                  justifyContent: "space-between",
                  gap: "12px",
                }}
              >
                <div>
                  <small
                    style={{
                      display: "block",
                      marginBottom: "4px",
                      fontSize: "0.68rem",
                      fontWeight: 800,
                      color: "#9a6700",
                      textTransform: "uppercase",
                      letterSpacing: "0.04em",
                    }}
                  >
                    New GYAN Card created
                  </small>

                  <h2
                    id="gyan-new-card-title"
                    style={{
                      margin: 0,
                      fontSize: "1.05rem",
                      lineHeight: 1.2,
                    }}
                  >
                    🎉 Your GYAN Card is ready!
                  </h2>
                </div>

                {welcomeSaved && (
                  <button
                    type="button"
                    aria-label="Close GYAN Card"
                    title="Close"
                    onClick={
                      closeWelcomeDialog
                    }
                    style={{
                      width:
                        "30px",
                      minWidth:
                        "30px",
                      height:
                        "30px",
                      padding:
                        0,
                      border:
                        0,
                      borderRadius:
                        "999px",
                      background:
                        "rgb(226 232 240 / 82%)",
                      color:
                        "#334155",
                      cursor:
                        "pointer",
                      font:
                        "inherit",
                      fontSize:
                        "1rem",
                      fontWeight:
                        900,
                      lineHeight:
                        1,
                    }}
                  >
                    ×
                  </button>
                )}

              </div>

              <div
                style={{
                  margin:
                    "13px 0 11px",
                  display:
                    "flex",
                  alignItems:
                    "center",
                  justifyContent:
                    "center",
                  gap:
                    "6px",
                  textAlign:
                    "center",
                }}
              >
                <strong
                  style={{
                    fontSize:
                      "0.82rem",
                    lineHeight:
                      1.05,
                  }}
                >
                  {newCardWelcome.displayName}
                  {" "}
                  <span
                    style={{
                      color:
                        "#64748b",
                      fontSize:
                        "0.68rem",
                      letterSpacing:
                        "0.04em",
                    }}
                  >
                    [{newCardWelcome.code}]
                  </span>
                </strong>

                <span
                  style={{
                    color:
                      "#5b3ea8",
                    fontSize:
                      "0.62rem",
                    fontWeight:
                      850,
                    whiteSpace:
                      "nowrap",
                  }}
                >
                  💎 {
                    newCardWelcome.welcomeGems ??
                    0
                  }*
                </span>
              </div>

              <div
                style={{
                  display:
                    "grid",
                  gridTemplateColumns:
                    "84px minmax(0, 1fr)",
                  gap:
                    "5px",
                  alignItems:
                    "stretch",
                  marginBottom:
                    "11px",
                }}
              >
                <a
                  href={
                    newCardWelcome.publicUrl
                  }
                  target="_blank"
                  rel="noreferrer"
                  title="My GYAN Home"
                  style={{
                    minWidth:
                      0,
                    color:
                      "#7a4d32",
                    textDecoration:
                      "none",
                    textAlign:
                      "center",
                  }}
                >
                  <div
                    style={{
                      marginBottom:
                        "1px",
                      color:
                        "#8a5a3b",
                      fontSize:
                        "0.4rem",
                      fontWeight:
                        900,
                      letterSpacing:
                        "0.04em",
                    }}
                  >
                    GYAN HOME
                  </div>

                  <QRCodeSVG
                    value={
                      newCardWelcome.publicUrl
                    }
                    size={
                      76
                    }
                    level="M"
                    includeMargin
                    style={{
                      display:
                        "block",
                      width:
                        "76px",
                      maxWidth:
                        "100%",
                      height:
                        "auto",
                      margin:
                        "0 auto",
                      background:
                        "#fff",
                    }}
                  />

                  <strong
                    style={{
                      display:
                        "block",
                      marginTop:
                        "1px",
                      fontSize:
                        "0.42rem",
                      lineHeight:
                        1,
                      whiteSpace:
                        "nowrap",
                    }}
                  >
                    🏠 GYAN
                  </strong>
                </a>

                <div
                  style={{
                    minWidth:
                      0,
                    padding:
                      "3px 4px 4px",
                    border:
                      "1px solid #8fb39a",
                    borderRadius:
                      "8px",
                    background:
                      "#f7fbf8",
                  }}
                >
                  <div
                    style={{
                      marginBottom:
                        "1px",
                      color:
                        "#356442",
                      fontSize:
                        "0.43rem",
                      fontWeight:
                        900,
                      letterSpacing:
                        "0.07em",
                      textAlign:
                        "center",
                    }}
                  >
                    FEATURES
                  </div>

                  <div
                    style={{
                      display:
                        "grid",
                      gridTemplateColumns:
                        "repeat(3, minmax(0, 1fr))",
                      gap:
                        "3px",
                    }}
                  >
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
                          new URL(
                            shortcut.path,
                            newCardWelcome.publicUrl,
                          ).toString();

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
                                54
                              }
                              level="M"
                              includeMargin
                              style={{
                                display:
                                  "block",
                                width:
                                  "54px",
                                maxWidth:
                                  "100%",
                                height:
                                  "auto",
                                margin:
                                  "0 auto",
                                background:
                                  "#fff",
                              }}
                            />

                            <strong
                              style={{
                                display:
                                  "block",
                                marginTop:
                                  "1px",
                                overflow:
                                  "hidden",
                                fontSize:
                                  "0.38rem",
                                lineHeight:
                                  1,
                                textOverflow:
                                  "ellipsis",
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
                </div>
              </div>

              {newCardWelcome.goodies &&
              newCardWelcome.goodies.length > 0 ? (
                <div
                  style={{
                    marginBottom:
                      "13px",
                    padding:
                      "4px",
                    border:
                      "1px solid #9bbbd0",
                    borderRadius:
                      "9px",
                    background:
                      "#f7fbff",
                  }}
                >
                  <div
                    style={{
                      marginBottom:
                        "2px",
                      color:
                        "#2f6385",
                      fontSize:
                        "0.46rem",
                      fontWeight:
                        900,
                      letterSpacing:
                        "0.08em",
                      textAlign:
                        "left",
                    }}
                  >
                    GOODIES / FREE SERVICES
                  </div>

                  <div
                    style={{
                      display:
                        "grid",
                      gridTemplateColumns:
                        "repeat(5, minmax(0, 1fr))",
                      gap:
                        "3px",
                    }}
                  >
                  {[
                    ...newCardWelcome.goodies,
                  ]
                    .sort(
                      (
                        first,
                        second,
                      ) =>
                        GOODIE_ORDER.indexOf(
                          first.type,
                        ) -
                        GOODIE_ORDER.indexOf(
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
                            goodieLabel(
                              goodie.type,
                            )
                          }
                          style={{
                            minWidth:
                              0,
                            color:
                              "#2f6385",
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
                              44
                            }
                            level="M"
                            includeMargin
                            style={{
                              display:
                                "block",
                              width:
                                "44px",
                              maxWidth:
                                "100%",
                              height:
                                "auto",
                              margin:
                                "0 auto",
                              background:
                                "#fff",
                            }}
                          />

                          <strong
                            style={{
                              display:
                                "block",
                              marginTop:
                                "1px",
                              overflow:
                                "hidden",
                              fontSize:
                                "0.36rem",
                              lineHeight:
                                1,
                              textOverflow:
                                "ellipsis",
                              whiteSpace:
                                "nowrap",
                            }}
                          >
                            {goodieIcon(
                              goodie.type,
                            )}{" "}
                            {goodieLabel(
                              goodie.type,
                            )}
                          </strong>
                        </a>
                      ),
                    )}
                  </div>
                </div>
              ) : (
                <div
                  style={{
                    marginBottom:
                      "6px",
                    padding:
                      "5px 7px",
                    borderRadius:
                      "7px",
                    background:
                      "#f8fafc",
                    color:
                      "#64748b",
                    fontSize:
                      "0.54rem",
                    textAlign:
                      "center",
                  }}
                >
                  Preparing your unique GYAN QR goodies…
                </div>
              )}

              <div
                style={{
                  display:
                    "grid",
                  gridTemplateColumns:
                    "repeat(3, minmax(0, 1fr))",
                  gap:
                    "6px",
                }}
              >
                <button
                  type="button"
                  disabled={
                    cardDownloadRequested
                  }
                  onClick={() =>
                    downloadCurrentCard(
                      newCardWelcome,
                    )
                  }
                  style={{
                    minHeight: "32px",
                    border: "1px solid #b8c5d1",
                    borderRadius: "10px",
                    background: "#ffffff",
                    font: "inherit",
                    fontSize: "0.64rem",
                    fontWeight: 800,
                    cursor: "pointer",
                  }}
                >
                  {
                    cardDownloadRequested
                      ? "Preparing PDF…"
                      : "🖨️ Download"
                  }
                </button>

                <button
                  type="button"
                  onClick={() =>
                    setNewCardEmailOpen(
                      (
                        current,
                      ) =>
                        !current,
                    )
                  }
                  style={{
                    minHeight: "32px",
                    border: "1px solid #b8c5d1",
                    borderRadius: "10px",
                    background: "#ffffff",
                    font: "inherit",
                    fontSize: "0.64rem",
                    fontWeight: 800,
                    cursor: "pointer",
                  }}
                >
                  ✉️ Email
                </button>

                <button
                  type="button"
                  onClick={() =>
                    shareCurrentCardOnWhatsApp(
                      newCardWelcome,
                    )
                  }
                  style={{
                    minHeight: "32px",
                    border: "1px solid #b8c5d1",
                    borderRadius: "10px",
                    background: "#ffffff",
                    font: "inherit",
                    fontSize: "0.64rem",
                    fontWeight: 800,
                    cursor: "pointer",
                  }}
                >
                  🟢 WhatsApp
                </button>
              </div>

              <div
                style={{
                  marginTop:
                    "4px",
                  color:
                    "#5b3ea8",
                  fontSize:
                    "0.48rem",
                  fontWeight:
                    750,
                  lineHeight:
                    1.05,
                  textAlign:
                    "center",
                }}
              >
                * 💎 {
                  newCardWelcome.welcomeGems ??
                  0
                } Welcome Gems
              </div>

              <div
                style={{
                  marginTop:
                    "4px",
                  color:
                    "#7a5600",
                  fontSize:
                    "0.5rem",
                  lineHeight:
                    1.1,
                  textAlign:
                    "center",
                }}
              >
                ⓘ Saved on this device only. No registration required.
              </div>

              {welcomeSaved && (
                <div
                  style={{
                    marginTop:
                      "7px",
                    fontSize:
                      "0.62rem",
                    fontWeight:
                      800,
                    textAlign:
                      "center",
                    color:
                      "#166534",
                  }}
                >
                  ✓ GYAN Card saved. You may close this window.
                </div>
              )}

              {newCardEmailOpen && (
                <div
                  style={{
                    display:
                      "grid",
                    gridTemplateColumns:
                      "minmax(0, 1fr) auto",
                    gap:
                      "6px",
                    marginTop:
                      "8px",
                  }}
                >
                  <input
                    type="email"
                    value={
                      newCardEmail
                    }
                    placeholder="Email address"
                    aria-label="Email address for GYAN Card"
                    onChange={(
                      event,
                    ) =>
                      setNewCardEmail(
                        event.target.value,
                      )
                    }
                    style={{
                      minWidth:
                        0,
                      minHeight:
                        "38px",
                      boxSizing:
                        "border-box",
                      border:
                        "1px solid #cbd5e1",
                      borderRadius:
                        "9px",
                      padding:
                        "7px 9px",
                      font:
                        "inherit",
                      fontSize:
                        "0.7rem",
                    }}
                  />

                  <button
                    type="button"
                    disabled={
                      !newCardEmail.trim()
                    }
                    onClick={() =>
                      emailCurrentCard(
                        newCardEmail,
                      )
                    }
                    style={{
                      minHeight:
                        "38px",
                      border:
                        0,
                      borderRadius:
                        "9px",
                      padding:
                        "7px 11px",
                      background:
                        "#285f85",
                      color:
                        "#fff",
                      font:
                        "inherit",
                      fontSize:
                        "0.68rem",
                      fontWeight:
                        800,
                      cursor:
                        newCardEmail.trim()
                          ? "pointer"
                          : "default",
                      opacity:
                        newCardEmail.trim()
                          ? 1
                          : 0.55,
                    }}
                  >
                    Send
                  </button>
                </div>
              )}

              {newCardEmailStatus && (
                <div
                  style={{
                    marginTop:
                      "5px",
                    fontSize:
                      "0.6rem",
                    textAlign:
                      "center",
                    color:
                      newCardEmailStatus.startsWith(
                        "✓",
                      )
                        ? "#166534"
                        : "#64748b",
                  }}
                >
                  {
                    newCardEmailStatus
                  }
                </div>
              )}

            </section>
          </div>,
          document.body,
        )}

      {cardDownloadRequested &&
        newCardWelcome && (
          <div
            aria-hidden="true"
            style={{
              position:
                "fixed",
              left:
                "-10000px",
              top:
                "0",
              width:
                "760px",
              minHeight:
                "1100px",
              overflow:
                "visible",
              pointerEvents:
                "none",
              zIndex:
                -1,
            }}
          >
            <GyanCalendarPage
              onClose={() =>
                setCardDownloadRequested(
                  false,
                )
              }
              initialPrintOpen
              useCurrentGyan
              autoDownloadA5
              onPdfDownloaded={() => {
                setCardDownloadRequested(
                  false,
                );

                markWelcomeSeen(
                  newCardWelcome,
                );

                closeWelcomeDialog();
              }}
            />
          </div>
        )}

      {calendarDownloadRequested &&
        gyanIdentity && (
          <div
            aria-hidden="true"
            style={{
              position:
                "fixed",
              left:
                "-10000px",
              top:
                "0",
              width:
                "760px",
              minHeight:
                "1100px",
              overflow:
                "visible",
              pointerEvents:
                "none",
              zIndex:
                -1,
            }}
          >
            <GyanCalendarPage
              onClose={() =>
                setCalendarDownloadRequested(
                  false,
                )
              }
              initialPrintOpen
              useCurrentGyan
              autoDownloadA5
              onPdfDownloaded={() =>
                setCalendarDownloadRequested(
                  false,
                )
              }
            />
          </div>
        )}

      {authOpen &&
        createPortal(
          <AuthPanel
            onClose={() => {
              setAuthOpen(
                false,
              );

              void loadUser();
              void loadGyanIdentity();
            }}
          />,
          document.body,
        )}
    </>
  );
}
