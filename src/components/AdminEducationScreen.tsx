import {
  useEffect,
  useState,
} from "react";

import {
  loadAdminEducationConfig,
  makeCustomEducationProgram,
  saveAdminEducationConfig,
  type EducationCountry,
  type EducationCountryConfig,
} from "../config/education";

import "./AdminEducationScreen.css";

interface AdminEducationScreenProps {
  onBack:
    () => void;
}

export default function AdminEducationScreen({
  onBack,
}: AdminEducationScreenProps) {
  const [
    country,
    setCountry,
  ] =
    useState<
      EducationCountry
    >(
      "US",
    );

  const [
    config,
    setConfig,
  ] =
    useState<
      EducationCountryConfig |
      null
    >(
      null,
    );

  const [
    otherName,
    setOtherName,
  ] =
    useState("");

  const [
    loading,
    setLoading,
  ] =
    useState(true);

  const [
    saving,
    setSaving,
  ] =
    useState(false);

  const [
    status,
    setStatus,
  ] =
    useState("");

  const [
    error,
    setError,
  ] =
    useState("");

  useEffect(
    () => {
      let active =
        true;

      setLoading(
        true,
      );

      setStatus("");
      setError("");

      void loadAdminEducationConfig(
        country,
      )
        .then(
          (next) => {
            if (
              active
            ) {
              setConfig(
                next,
              );
            }
          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              active
            ) {
              setError(
                caught instanceof
                  Error
                  ? caught.message
                  : "Could not load Education.",
              );
            }
          },
        )
        .finally(
          () => {
            if (
              active
            ) {
              setLoading(
                false,
              );
            }
          },
        );

      return () => {
        active =
          false;
      };
    },
    [
      country,
    ],
  );

  function toggleProgram(
    code: string,
  ) {
    setConfig(
      (
        current,
      ) =>
        current
          ? {
              ...current,

              programs:
                current.programs.map(
                  (
                    program,
                  ) =>
                    program.code ===
                      code
                      ? {
                          ...program,

                          enabled:
                            !program.enabled,
                        }
                      : program,
                ),
            }
          : current,
    );

    setStatus("");
  }

  function addOther() {
    if (!config) {
      return;
    }

    const name =
      otherName.trim();

    if (!name) {
      return;
    }

    if (
      config.programs.some(
        (
          program,
        ) =>
          program.name
            .trim()
            .toLowerCase() ===
          name.toLowerCase(),
      )
    ) {
      setError(
        "That program already exists.",
      );

      return;
    }

    const nextOrder =
      Math.max(
        0,
        ...config.programs.map(
          (
            program,
          ) =>
            program.sortOrder,
        ),
      ) + 10;

    setConfig({
      ...config,

      programs: [
        ...config.programs,

        makeCustomEducationProgram(
          name,
          nextOrder,
        ),
      ],
    });

    setOtherName("");
    setError("");
    setStatus("");
  }

  function deleteCustom(
    code: string,
  ) {
    setConfig(
      (
        current,
      ) =>
        current
          ? {
              ...current,

              programs:
                current.programs.filter(
                  (
                    program,
                  ) =>
                    program.code !==
                    code,
                ),
            }
          : current,
    );

    setStatus("");
  }

  async function save() {
    if (!config) {
      return;
    }

    setSaving(true);
    setError("");
    setStatus("");

    try {
      const saved =
        await saveAdminEducationConfig(
          config,
        );

      setConfig(
        saved,
      );

      setStatus(
        "✓ Education configuration saved.",
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Could not save Education.",
      );
    } finally {
      setSaving(
        false,
      );
    }
  }

  return (
    <main
      className="admin-education"
    >
      <header
        className="admin-education__header"
      >
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
            GYAN CONTROL CENTER
          </strong>

          <span>
            Education
          </span>
        </div>
      </header>

      <div
        className="admin-education__tabs"
      >
        <button
          type="button"
          className={
            country ===
              "US"
              ? "active"
              : ""
          }
          onClick={() =>
            setCountry(
              "US",
            )
          }
        >
          🇺🇸 USA
        </button>

        <button
          type="button"
          className={
            country ===
              "IN"
              ? "active"
              : ""
          }
          onClick={() =>
            setCountry(
              "IN",
            )
          }
        >
          🇮🇳 India
        </button>
      </div>

      {
        loading ? (
          <div
            className="admin-education__state"
          >
            Loading…
          </div>
        )
        : config ? (
          <section
            className="admin-education__card"
          >
            <h1>
              {
                country ===
                  "IN"
                  ? "India"
                  : "United States"
              }
            </h1>

            <label
              className="admin-education__option"
            >
              <input
                type="checkbox"
                checked={
                  config.preK12Enabled
                }
                onChange={(
                  event,
                ) =>
                  setConfig({
                    ...config,

                    preK12Enabled:
                      event.target
                        .checked,
                  })
                }
              />

              <span>
                PreK–12
              </span>
            </label>

            {
              config.programs.map(
                (
                  program,
                ) => (
                  <div
                    className="admin-education__row"
                    key={
                      program.code
                    }
                  >
                    <label
                      className="admin-education__option"
                    >
                      <input
                        type="checkbox"
                        checked={
                          program.enabled
                        }
                        onChange={() =>
                          toggleProgram(
                            program.code,
                          )
                        }
                      />

                      <span>
                        {
                          program.name
                        }
                      </span>
                    </label>

                    {
                      program.custom && (
                        <button
                          type="button"
                          className="admin-education__delete"
                          onClick={() =>
                            deleteCustom(
                              program.code,
                            )
                          }
                          title="Delete custom program"
                        >
                          🗑
                        </button>
                      )
                    }
                  </div>
                ),
              )
            }

            <div
              className="admin-education__other"
            >
              <strong>
                Other
              </strong>

              <div>
                <input
                  value={
                    otherName
                  }
                  placeholder="abcd"
                  onChange={(
                    event,
                  ) =>
                    setOtherName(
                      event.target
                        .value,
                    )
                  }
                  onKeyDown={(
                    event,
                  ) => {
                    if (
                      event.key ===
                        "Enter"
                    ) {
                      addOther();
                    }
                  }}
                />

                <button
                  type="button"
                  onClick={
                    addOther
                  }
                >
                  Add
                </button>
              </div>
            </div>

            <button
              type="button"
              className="admin-education__save"
              disabled={
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

            {
              status && (
                <div
                  className="admin-education__status"
                >
                  {
                    status
                  }
                </div>
              )
            }
          </section>
        )
        : null
      }

      {
        error && (
          <div
            className="admin-education__error"
          >
            {
              error
            }
          </div>
        )
      }
    </main>
  );
}
