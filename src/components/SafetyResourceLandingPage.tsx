import {
  useEffect,
  useState,
} from "react";

import "./SafetyResourceLandingPage.css";


type SafetyResourceType =
  | "CERTIFICATE"
  | "LOST_FOUND"
  | "EMERGENCY"
  | "HELP";


type SafetyResource = {
  token: string;
  type: SafetyResourceType;
  displayName: string;
};


function titleFor(
  type: SafetyResourceType,
): string {
  if (
    type ===
      "CERTIFICATE"
  ) {
    return "GYAN Certificate";
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

  return "Help";
}


function messageFor(
  type: SafetyResourceType,
): string {
  if (
    type ===
      "CERTIFICATE"
  ) {
    return "This is a shareable GYAN certificate link. Private learning history is not exposed here.";
  }

  if (
    type ===
      "LOST_FOUND"
  ) {
    return "Use this privacy-friendly GYAN card to help return a found item without asking for a phone number or email.";
  }

  if (
    type ===
      "EMERGENCY"
  ) {
    return "This privacy-friendly GYAN card can show owner-approved emergency options without exposing private contact details.";
  }

  return "Use this privacy-friendly GYAN card to request or offer help without exposing private contact details.";
}


export default function SafetyResourceLandingPage({
  token,
  onBack,
}: {
  token: string;
  onBack: () => void;
}) {
  const [
    resource,
    setResource,
  ] =
    useState<SafetyResource | null>(
      null,
    );

  const [
    loading,
    setLoading,
  ] =
    useState(true);

  const [
    error,
    setError,
  ] =
    useState("");


  useEffect(
    () => {
      const controller =
        new AbortController();

      void fetch(
        `/api/safety-resources/${encodeURIComponent(
          token,
        )}`,
        {
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
              await response.json() as
                SafetyResource & {
                  error?: string;
                };

            if (
              !response.ok
            ) {
              throw new Error(
                body.error ??
                "This GYAN card could not be opened.",
              );
            }

            return body;
          },
        )
        .then(
          (
            body,
          ) => {
            if (
              !controller.signal.aborted
            ) {
              setResource(
                body,
              );
            }
          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              caught instanceof DOMException &&
              caught.name ===
                "AbortError"
            ) {
              return;
            }

            setError(
              caught instanceof Error
                ? caught.message
                : "This GYAN card could not be opened.",
            );
          },
        )
        .finally(
          () => {
            if (
              !controller.signal.aborted
            ) {
              setLoading(
                false,
              );
            }
          },
        );

      return () => {
        controller.abort();
      };
    },
    [
      token,
    ],
  );


  return (
    <main className="safety-resource">
      <section className="safety-resource__card">
        <header>
          <strong>
            GYAN
          </strong>

          <button
            type="button"
            onClick={
              onBack
            }
            aria-label="Close"
          >
            ×
          </button>
        </header>

        {
          loading
            ? (
                <p>
                  Opening GYAN card…
                </p>
              )
            : error
              ? (
                  <p className="safety-resource__error">
                    {error}
                  </p>
                )
              : resource
                ? (
                    <>
                      <h1>
                        {titleFor(
                          resource.type,
                        )}
                      </h1>

                      <div className="safety-resource__alias">
                        Known as{" "}
                        <strong>
                          {resource.displayName}
                        </strong>
                      </div>

                      <p>
                        {messageFor(
                          resource.type,
                        )}
                      </p>

                      <small>
                        No parent GYAN code, phone number or email is exposed by this public card.
                      </small>
                    </>
                  )
                : null
        }
      </section>
    </main>
  );
}
