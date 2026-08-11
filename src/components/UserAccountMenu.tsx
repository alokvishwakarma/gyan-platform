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
    } catch {
      setUser(null);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
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
      /*
       * Remove the temporary callback flag
       * from the address bar.
       */
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
          if (!response.ok) {
            return null;
          }

          return (
            await response.json()
          ) as AuthMeResponse;
        },
      )
      .then(
        (result) => {
          if (
            controller.signal.aborted
          ) {
            return;
          }

          setUser(
            result?.authenticated
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
            controller.signal.aborted
          ) {
            return;
          }

          setUser(
            null,
          );

          setLoading(
            false,
          );
        },
      );

    return () => {
      controller.abort();
    };
  }, []);

  async function openMyShop():
    Promise<void> {
    if (myShopLoading) {
      return;
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
        (await response.json()) as {
          shops?: {
            code: string;
            name: string;
          }[];

          error?: string;
        };

      if (!response.ok) {
        throw new Error(
          result.error ??
            "Your shop could not be loaded.",
        );
      }

      const shops =
        result.shops ?? [];

      if (
        shops.length ===
        0
      ) {
        setOpen(false);

        onRegisterMyShop(
          user?.email ?? "",
        );

        return;
      }

      /*
       * MVP: most shop owners have one shop.
       * If more than one is linked, open the
       * first; we can add a selector later.
       */
      setOpen(false);

      onOpenMyShop(
        shops[0].code,
      );
    } catch (
      caughtError
    ) {
      setMyShopError(
        caughtError instanceof Error
          ? caughtError.message
          : "Your shop could not be loaded.",
      );
    } finally {
      setMyShopLoading(
        false,
      );
    }
  }


  async function logout():
    Promise<void> {
    await fetch(
      "/api/auth/logout",
      {
        method: "POST",
        credentials:
          "include",
      },
    );

    setUser(null);
    setOpen(false);
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
          aria-expanded={open}
          onClick={() =>
            setOpen(
              (current) =>
                !current,
            )
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
                    {user.email}
                  </strong>
                </div>

                <button
                  type="button"
                  onClick={() =>
                    setOpen(false)
                  }
                >
                  🎮 Player
                </button>

                <button
                  type="button"
                  onClick={() =>
                    setOpen(false)
                  }
                >
                  🛍 Shopper
                </button>

                <button
                  type="button"
                  onClick={() => {
                    setOpen(false);
                    onOpenChat();
                  }}
                >
                  💬 Chat
                </button>

                <button
                  type="button"
                  disabled={
                    myShopLoading
                  }
                  onClick={() =>
                    void openMyShop()
                  }
                >
                  {myShopLoading
                    ? "🏪 Opening…"
                    : "🏪 My Shop"}
                </button>

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
                    setOpen(false);
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
                    setOpen(false);
                    setAuthOpen(true);
                  }}
                >
                  ✉️ Sign in
                </button>

                <button
                  type="button"
                  onClick={() => {
                    setOpen(false);
                    onOpenAdmin();
                  }}
                >
                  ⚙ Admin
                </button>

                <button
                  type="button"
                  onClick={() =>
                    setOpen(false)
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
              setAuthOpen(false);

              /*
               * If the user returns after clicking
               * the magic link in this same tab,
               * the component reload will pick up
               * the authenticated session.
               */
              void loadUser();
            }}
          />,
          document.body,
        )}
    </>
  );
}