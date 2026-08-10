import {
  useState,
} from "react";

import "./AuthPanel.css";

interface AuthPanelProps {
  onClose: () => void;
}

interface MagicLinkResponse {
  sent?: boolean;
  error?: string;
}

export default function AuthPanel({
  onClose,
}: AuthPanelProps) {
  const [
    email,
    setEmail,
  ] =
    useState("");

  const [
    sending,
    setSending,
  ] =
    useState(false);

  const [
    sent,
    setSent,
  ] =
    useState(false);

  const [
    error,
    setError,
  ] =
    useState("");

  async function sendLink():
    Promise<void> {
    const normalized =
      email
        .trim()
        .toLowerCase();

    if (
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        normalized,
      )
    ) {
      setError(
        "Enter a valid email address.",
      );

      return;
    }

    setSending(true);
    setError("");

    try {
      const response =
        await fetch(
          "/api/auth/magic-link",
          {
            method: "POST",

            credentials:
              "include",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                email:
                  normalized,
              }),
          },
        );

      const result =
        (await response.json()) as
          MagicLinkResponse;

      if (
        !response.ok ||
        !result.sent
      ) {
        throw new Error(
          result.error ??
            "Unable to send sign-in link.",
        );
      }

      setSent(true);
    } catch (caughtError) {
      setError(
        caughtError instanceof Error
          ? caughtError.message
          : "Unable to send sign-in link.",
      );
    } finally {
      setSending(false);
    }
  }

  return (
    <div
      className="auth-panel-overlay"
      role="dialog"
      aria-modal="true"
      aria-label="Sign in to GYAN"
      onClick={onClose}
    >
      <section
        className="auth-panel"
        onClick={(
          event,
        ) =>
          event.stopPropagation()
        }
      >
        <header
          className="auth-panel__header"
        >
          <div>
            <h2>
              Sign in
            </h2>

            <small>
              Use your email to continue.
            </small>
          </div>

          <button
            type="button"
            aria-label="Close sign in"
            onClick={onClose}
          >
            ×
          </button>
        </header>

        {sent ? (
          <div
            className="auth-panel__sent"
          >
            <span
              aria-hidden="true"
            >
              ✉️
            </span>

            <strong>
              Check your email
            </strong>

            <p>
              We sent a secure sign-in
              link to:
            </p>

            <b>
              {email.trim()}
            </b>

            <small>
              The link expires in
              15 minutes.
            </small>

            <button
              type="button"
              onClick={onClose}
            >
              Close
            </button>
          </div>
        ) : (
          <div
            className="auth-panel__body"
          >
            <label>
              <span>
                Email
              </span>

              <input
                autoFocus
                type="email"
                inputMode="email"
                autoComplete="email"
                placeholder="you@example.com"
                value={email}
                onChange={(
                  event,
                ) => {
                  setEmail(
                    event.target.value,
                  );

                  setError("");
                }}
                onKeyDown={(
                  event,
                ) => {
                  if (
                    event.key ===
                    "Enter"
                  ) {
                    event.preventDefault();

                    void sendLink();
                  }
                }}
              />
            </label>

            {error && (
              <p
                className="auth-panel__error"
                role="alert"
              >
                {error}
              </p>
            )}

            <button
              type="button"
              className="auth-panel__continue"
              disabled={sending}
              onClick={() =>
                void sendLink()
              }
            >
              {sending
                ? "Sending…"
                : "Send sign-in link"}
            </button>

            <p
              className="auth-panel__note"
            >
              No password needed.
              Clicking the email link
              signs you in securely.
            </p>
          </div>
        )}
      </section>
    </div>
  );
}
