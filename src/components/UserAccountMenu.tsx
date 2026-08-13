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

interface UserAccountMenuProps {
  onOpenAdmin: () => void;
  onOpenChat: () => void;

  onOpenMyShop: (
    shopCode: string,
  ) => void;

  onRegisterMyShop: (
    email: string,
  ) => void;
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

        {open && (
          <div
            className="user-account-menu__popover"
          >
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
                  onClick={() =>
                    setOpen(
                      false,
                    )
                  }
                >
                  Close
                </button>
              </>
            )}
          </div>
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
            }}
          />,
          document.body,
        )}
    </>
  );
}