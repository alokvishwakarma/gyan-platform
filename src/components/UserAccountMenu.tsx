import {
  useEffect,
  useState,
  type SyntheticEvent,
} from "react";

import {
  createPortal,
} from "react-dom";

import AuthPanel
  from "./AuthPanel";

import "./UserAccountMenu.css";

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
 * Normal component mount uses GET and is read-only. If the user
 * explicitly opens Account and no owned GYAN exists, POST may create
 * one. Concurrent POST callers share this promise so StrictMode or
 * rapid interaction cannot create duplicate accounts.
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

            return body.identity ??
              null;
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
          ].join(" ")}
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
                    <strong>
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
                    >
                      {
                        gyanIdentity.publicUrl
                          .replace(
                            /^https?:\/\//,
                            "",
                          )
                      }
                    </a>

                    {
                      gyanIdentity.accessCode && (
                        <span className="user-account-menu__access-code">
                          Access Code{" "}
                          <b>
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
                  className="user-account-menu__identity"
                >
                  <strong>
                    GYAN Account
                  </strong>

                  <small>
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
                >
                  ✉️ Sign in
                </button>

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
