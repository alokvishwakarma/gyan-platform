import {
  useEffect,
  useState,
} from "react";

import "./AdminPlatformSettingsPage.css";


type Mode =
  | "HIDDEN"
  | "EVERYONE"
  | "ID_EVEN"
  | "ID_ODD";


const choices: [
  Mode,
  string,
][] = [
  [
    "HIDDEN",
    "Hidden",
  ],

  [
    "EVERYONE",
    "Everyone",
  ],

  [
    "ID_EVEN",
    "Even IDs",
  ],

  [
    "ID_ODD",
    "Odd IDs",
  ],
];


export default function AdminPlatformSettingsPage({
  onBack,
}: {
  onBack:
    () => void;
}) {
  const [
    value,
    setValue,
  ] =
    useState<Mode>(
      "EVERYONE",
    );

  const [
    welcomeGems,
    setWelcomeGems,
  ] =
    useState(
      100,
    );

  const [
    loading,
    setLoading,
  ] =
    useState(
      true,
    );

  const [
    saving,
    setSaving,
  ] =
    useState(
      false,
    );

  const [
    message,
    setMessage,
  ] =
    useState(
      "",
    );


  useEffect(
    () => {
      const controller =
        new AbortController();

      void fetch(
        "/api/admin/platform-settings",
        {
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
            if (
              !response.ok
            ) {
              throw new Error();
            }

            return await response.json() as {
              headerGemsVisibility?:
                Mode;

              welcomeGems?:
                number;
            };
          },
        )
        .then(
          (
            body,
          ) => {
            if (
              controller.signal
                .aborted
            ) {
              return;
            }

            setValue(
              body.headerGemsVisibility ??
                "EVERYONE",
            );

            setWelcomeGems(
              Number.isFinite(
                body.welcomeGems,
              )
                ? Number(
                    body.welcomeGems,
                  )
                : 100,
            );
          },
        )
        .catch(
          () => {
            if (
              !controller.signal
                .aborted
            ) {
              setMessage(
                "Unable to load settings.",
              );
            }
          },
        )
        .finally(
          () => {
            if (
              !controller.signal
                .aborted
            ) {
              setLoading(
                false,
              );
            }
          },
        );

      return () =>
        controller.abort();
    },
    [],
  );


  async function save():
    Promise<void> {
    setSaving(
      true,
    );

    setMessage(
      "",
    );

    try {
      const response =
        await fetch(
          "/api/admin/platform-settings",
          {
            method:
              "PATCH",

            credentials:
              "include",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                headerGemsVisibility:
                  value,

                welcomeGems,
              }),
          },
        );


      const body =
        await response.json() as {
          error?:
            string;

          welcomeGems?:
            number;
        };


      if (
        !response.ok
      ) {
        throw new Error(
          body.error ??
            "Unable to save settings.",
        );
      }


      if (
        Number.isFinite(
          body.welcomeGems,
        )
      ) {
        setWelcomeGems(
          Number(
            body.welcomeGems,
          ),
        );
      }


      setMessage(
        "Saved.",
      );
    } catch (
      error
    ) {
      setMessage(
        error instanceof
          Error
          ? error.message
          : "Unable to save settings.",
      );
    } finally {
      setSaving(
        false,
      );
    }
  }


  return (
    <main className="admin-platform-settings">
      <header className="admin-platform-settings__header">
        <button
          type="button"
          onClick={
            onBack
          }
        >
          ←
        </button>

        <div>
          <strong>
            Platform Settings
          </strong>

          <small>
            Small switches · easy experiments
          </small>
        </div>
      </header>


      <section className="admin-platform-settings__card">
        <div className="admin-platform-settings__heading">
          <div>
            <strong>
              💎 Gems
            </strong>

            <small>
              Public balance and new-account rewards.
            </small>
          </div>

          <span className="admin-platform-settings__preview">
            [3NQP] 💎
            <sup>
              125
            </sup>
          </span>
        </div>


        {
          loading
            ? (
                <div>
                  Loading…
                </div>
              )
            : (
                <>
                  <div className="admin-platform-settings__setting-row">
                    <div className="admin-platform-settings__setting-label">
                      <strong>
                        Header Gem Balance
                      </strong>

                      <small>
                        Balance beside Learn • Discover • Grow
                      </small>
                    </div>

                    <select
                      value={
                        value
                      }
                      onChange={(
                        event,
                      ) =>
                        setValue(
                          event.target
                            .value as Mode,
                        )
                      }
                    >
                      {
                        choices.map(
                          ([
                            optionValue,
                            label,
                          ]) => (
                            <option
                              key={
                                optionValue
                              }
                              value={
                                optionValue
                              }
                            >
                              {
                                label
                              }
                            </option>
                          ),
                        )
                      }
                    </select>
                  </div>


                  <div className="admin-platform-settings__setting-row">
                    <div className="admin-platform-settings__setting-label">
                      <strong>
                        Welcome Gems
                      </strong>

                      <small>
                        New GYAN accounts only
                      </small>
                    </div>

                    <div className="admin-platform-settings__gem-input">
                      <span>
                        💎
                      </span>

                      <input
                        type="number"
                        min={
                          0
                        }
                        max={
                          1000
                        }
                        step={
                          1
                        }
                        value={
                          welcomeGems
                        }
                        onChange={(
                          event,
                        ) => {
                          const numeric =
                            Number(
                              event.target
                                .value,
                            );

                          setWelcomeGems(
                            Number.isFinite(
                              numeric,
                            )
                              ? numeric
                              : 0,
                          );
                        }}
                      />
                    </div>
                  </div>
                </>
              )
        }


        <div className="admin-platform-settings__footer">
          <small>
            {
              message ||
              "Changes to Welcome Gems do not alter existing balances."
            }
          </small>

          <button
            type="button"
            disabled={
              loading ||
              saving
            }
            onClick={() =>
              void save()
            }
          >
            {
              saving
                ? "Saving…"
                : "Save"
            }
          </button>
        </div>
      </section>
    </main>
  );
}