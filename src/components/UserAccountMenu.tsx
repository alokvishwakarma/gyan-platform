import {
  useEffect,
  useState,
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
    useState(
      () =>
        window.location.pathname ===
          "/account",
    );

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

      setGyanIdentity(
        body.identity,
      );

      window.localStorage.setItem(
        "gyan_browser_code_v1",
        body.identity.code,
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
      void loadGyanIdentity();
    },
    [],
  );


  useEffect(
    () => {
      const parameters =
        new URLSearchParams(
          window.location.search,
        );

      if (
        parameters.get(
          "account",
        ) !==
          "1"
      ) {
        return;
      }

      setOpen(
        true,
      );

      parameters.delete(
        "account",
      );

      const query =
        parameters.toString();

      window.history.replaceState(
        {},
        "",
        `${window.location.pathname}${query ? `?${query}` : ""}`,
      );
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
    setAccountMenuRoute(
      false,
    );

    onOpenMyShop(
      shopCode,
    );
  }


  useEffect(
    () => {
      const syncAccountRoute =
        (): void => {
          setOpen(
            window.location.pathname ===
              "/account",
          );
        };

      window.addEventListener(
        "popstate",
        syncAccountRoute,
      );

      return () => {
        window.removeEventListener(
          "popstate",
          syncAccountRoute,
        );
      };
    },
    [],
  );


  function setAccountMenuRoute(
    nextOpen:
      boolean,
  ): void {
    setAccountMenuRoute(
      nextOpen,
    );

    const targetPath =
      nextOpen
        ? "/account"
        : "/";

    if (
      window.location.pathname !==
        targetPath
    ) {
      window.history.pushState(
        {},
        "",
        targetPath,
      );

      window.dispatchEvent(
        new PopStateEvent(
          "popstate",
        ),
      );
    }
  }


  function toggleMenu():
    void {
    const nextOpen =
      !open;

    setOpen(
      nextOpen,
    );

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

    setAccountMenuRoute(
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
            >
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
                    setAccountMenuRoute(
                        false,
                      )
                  }
                >
                  🎮 Player
                </button>

                <button
                  type="button"
                  onClick={() =>
                    setAccountMenuRoute(
                        false,
                      )
                  }
                >
                  🛍 Shopper
                </button>

                <button
                  type="button"
                  onClick={() => {
                    setAccountMenuRoute(
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
                      setAccountMenuRoute(
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
                    setAccountMenuRoute(
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
                    setAccountMenuRoute(
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
                    setAccountMenuRoute(
                        false,
                      );

                    onOpenAdmin();
                  }}
                >
                  ⚙ Admin
                </button>

                <button
                  type="button"
                  onClick={() =>
                    setAccountMenuRoute(
                        false,
                      )
                  }
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
