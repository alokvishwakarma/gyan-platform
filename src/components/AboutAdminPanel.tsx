import {
  useEffect,
  useState,
} from "react";
import "./AboutAdminPanel.css";

interface AboutAdminPanelProps {
  onClose: () => void;
  onAdminAuthenticated: () => void;
}

interface SessionResponse {
  authenticated?: boolean;
}

interface LoginResponse {
  authenticated?: boolean;
  error?: string;
}

type PanelStep =
  | "about"
  | "login"
  | "authenticated";

export default function AboutAdminPanel({
  onClose,
  onAdminAuthenticated,
}: AboutAdminPanelProps) {
  const [step, setStep] =
    useState<PanelStep>("about");

  const [password, setPassword] =
    useState("");

  const [errorMessage, setErrorMessage] =
    useState("");

  const [isWorking, setIsWorking] =
    useState(false);

  useEffect(() => {
    const abortController =
      new AbortController();

    async function checkSession() {
      try {
        const response = await fetch(
          "/api/admin/session",
          {
            credentials: "include",
            signal:
              abortController.signal,
          },
        );

        const result =
          (await response.json()) as
            SessionResponse;

        if (
          response.ok &&
          result.authenticated
        ) {
          setStep("authenticated");
        }
      } catch (error) {
        if (
          error instanceof DOMException &&
          error.name === "AbortError"
        ) {
          return;
        }

        console.error(
          "Unable to check administrator session:",
          error,
        );
      }
    }

    void checkSession();

    return () => {
      abortController.abort();
    };
  }, []);

  async function login() {
    if (password.length < 8) {
      setErrorMessage(
        "Enter the administrator password.",
      );

      return;
    }

    setIsWorking(true);
    setErrorMessage("");

    try {
      const response = await fetch(
        "/api/admin/login",
        {
          method: "POST",
          credentials: "include",

          headers: {
            "content-type":
              "application/json",
          },

          body: JSON.stringify({
            password,
          }),
        },
      );

      const result =
        (await response.json()) as
          LoginResponse;

      if (
        !response.ok ||
        !result.authenticated
      ) {
        throw new Error(
          result.error ??
            "Administrator login failed.",
        );
      }

      setPassword("");
      setStep("authenticated");
    } catch (error) {
      setErrorMessage(
        error instanceof Error
          ? error.message
          : "Administrator login failed.",
      );
    } finally {
      setIsWorking(false);
    }
  }

  return (
    <div className="about-admin-overlay">
      <section
        className="about-admin-panel"
        role="dialog"
        aria-modal="true"
        aria-labelledby="about-admin-title"
      >
        <header className="about-admin-panel__header">
          <div>
            <span>GYAN.cc</span>

            <h2 id="about-admin-title">
              One Place. Many Services.
            </h2>
          </div>

          <button
            type="button"
            className="about-admin-panel__close"
            onClick={onClose}
            aria-label="Close About GYAN"
          >
            ×
          </button>
        </header>

        <div className="about-admin-panel__content">
          {step === "about" && (
            <>
              <div className="about-admin-panel__logo">
                GYAN
              </div>

              <p>
                GYAN helps customers connect
                with nearby service shops for
                documents, printing, education,
                office and government-related
                assistance.
              </p>

              <p>
                One QR identifies the shop and
                presents the services it offers.
              </p>

              <div className="about-admin-panel__actions">
                <button
                  type="button"
                  className="about-admin-panel__secondary"
                  onClick={onClose}
                >
                  Close
                </button>

                <button
                  type="button"
                  className="about-admin-panel__quiet"
                  onClick={() => {
                    setErrorMessage("");
                    setStep("login");
                  }}
                >
                  Admin
                </button>
              </div>
            </>
          )}

          {step === "login" && (
            <>
              <h3>
                Administrator access
              </h3>

              <p>
                Enter the private GYAN
                administrator password.
              </p>

              <label>
                <span>
                  Administrator password
                </span>

                <input
                  type="password"
                  value={password}
                  autoComplete="current-password"
                  placeholder="Enter password"
                  onChange={(event) =>
                    setPassword(
                      event.target.value,
                    )
                  }
                  onKeyDown={(event) => {
                    if (
                      event.key === "Enter" &&
                      !isWorking
                    ) {
                      void login();
                    }
                  }}
                />
              </label>

              {errorMessage && (
                <p
                  className="about-admin-panel__error"
                  role="alert"
                >
                  {errorMessage}
                </p>
              )}

              <div className="about-admin-panel__actions">
                <button
                  type="button"
                  className="about-admin-panel__secondary"
                  onClick={() => {
                    setPassword("");
                    setErrorMessage("");
                    setStep("about");
                  }}
                >
                  Back
                </button>

                <button
                  type="button"
                  className="about-admin-panel__primary"
                  disabled={
                    isWorking ||
                    password.length < 8
                  }
                  onClick={() => {
                    void login();
                  }}
                >
                  {isWorking
                    ? "Signing in…"
                    : "Sign in"}
                </button>
              </div>
            </>
          )}

          {step === "authenticated" && (
            <>
              <div className="about-admin-panel__success">
                ✓
              </div>

              <h3>
                Administrator authenticated
              </h3>

              <p>
                Your secure administrator
                session is active.
              </p>

              <button
                type="button"
                className="about-admin-panel__primary about-admin-panel__full"
                onClick={
                  onAdminAuthenticated
                }
              >
                Open service administration
              </button>
            </>
          )}
        </div>
      </section>
    </div>
  );
}