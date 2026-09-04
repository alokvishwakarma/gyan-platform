import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./AdminEducationProgramsPage.css";


type Country = {
  code: string;
  name: string;
  flag: string;
  sortOrder: number;
};






type EditableProgram = {
  code: string;
  name: string;
  enabled: boolean;
  sortOrder: number;
};


interface Props {
  onBack: () => void;
}


export default function AdminEducationProgramsPage({
  onBack,
}: Props) {
  const [
    countries,
    setCountries,
  ] =
    useState<Country[]>([]);

  const [
    countryCode,
    setCountryCode,
  ] =
    useState("IN");

  const [
    programs,
    setPrograms,
  ] =
    useState<EditableProgram[]>([]);

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
    error,
    setError,
  ] =
    useState("");

  const [
    message,
    setMessage,
  ] =
    useState("");


  async function loadCountry(
    code: string,
  ): Promise<void> {
    setLoading(true);
    setError("");
    setMessage("");

    try {
      /*
       * Public catalog returns only enabled programs.
       * Admin endpoint returns every country/program row,
       * including disabled ones.
       */
      const response =
        await fetch(
          `/api/education/admin/programs?country=${encodeURIComponent(
            code,
          )}`,
          {
            credentials:
              "include",
            cache:
              "no-store",
          },
        );

      const body =
        await response.json() as {
          countries?: Country[];
          programs?: EditableProgram[];
          selectedCountry?: string;
          error?: string;
        };

      if (!response.ok) {
        throw new Error(
          body.error ??
          "Education programs could not be loaded.",
        );
      }

      setCountries(
        body.countries ??
        [],
      );

      setCountryCode(
        body.selectedCountry ??
        code,
      );

      setPrograms(
        body.programs ??
        [],
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof Error
          ? caught.message
          : "Education programs could not be loaded.",
      );
    } finally {
      setLoading(false);
    }
  }


  useEffect(
    () => {
      let active =
        true;

      void fetch(
        "/api/education/admin/programs?country=IN",
        {
          credentials:
            "include",
          cache:
            "no-store",
        },
      )
        .then(
          async (
            response,
          ) => {
            const body =
              await response.json() as {
                countries?: Country[];
                programs?: EditableProgram[];
                selectedCountry?: string;
                error?: string;
              };

            if (
              !response.ok
            ) {
              throw new Error(
                body.error ??
                "Education programs could not be loaded.",
              );
            }

            if (
              !active
            ) {
              return;
            }

            setCountries(
              body.countries ??
              [],
            );

            setCountryCode(
              body.selectedCountry ??
              "IN",
            );

            setPrograms(
              body.programs ??
              [],
            );

            setLoading(
              false,
            );
          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              !active
            ) {
              return;
            }

            setError(
              caught instanceof Error
                ? caught.message
                : "Education programs could not be loaded.",
            );

            setLoading(
              false,
            );
          },
        );

      return () => {
        active =
          false;
      };
    },
    [],
  );


  const selectedCountry =
    useMemo(
      () =>
        countries.find(
          (
            item,
          ) =>
            item.code ===
            countryCode,
        ) ??
        null,
      [
        countries,
        countryCode,
      ],
    );


  function updateProgram(
    code: string,
    patch:
      Partial<
        EditableProgram
      >,
  ): void {
    setPrograms(
      (
        current,
      ) =>
        current.map(
          (
            program,
          ) =>
            program.code ===
              code
              ? {
                  ...program,
                  ...patch,
                }
              : program,
        ),
    );
  }


  async function save():
  Promise<void> {
    setSaving(true);
    setError("");
    setMessage("");

    try {
      const response =
        await fetch(
          "/api/education/admin/programs",
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
                countryCode,
                programs:
                  programs.map(
                    (
                      item,
                    ) => ({
                      code:
                        item.code,
                      name:
                        item.name,
                      enabled:
                        item.enabled,
                      sortOrder:
                        item.sortOrder,
                    }),
                  ),
              }),
          },
        );

      const body =
        await response.json() as {
          saved?: boolean;
          error?: string;
        };

      if (
        !response.ok ||
        !body.saved
      ) {
        throw new Error(
          body.error ??
          "Education programs could not be saved.",
        );
      }

      setMessage(
        `Saved ${selectedCountry?.name ?? countryCode}.`,
      );

      await loadCountry(
        countryCode,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof Error
          ? caught.message
          : "Education programs could not be saved.",
      );
    } finally {
      setSaving(false);
    }
  }


  return (
    <main
      className="admin-education-programs"
    >
      <header
        className="admin-education-programs__header"
      >
        <button
          type="button"
          onClick={onBack}
          aria-label="Back to Admin"
        >
          ←
        </button>

        <div>
          <strong>
            🎓 Education Programs
          </strong>

          <small>
            Configure programs by country
          </small>
        </div>

        <button
          type="button"
          className="admin-education-programs__save"
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
      </header>

      <section
        className="admin-education-programs__content"
      >
        <nav
          className="admin-education-programs__countries"
          aria-label="Education country"
        >
          {
            countries.map(
              (
                item,
              ) => (
                <button
                  type="button"
                  key={
                    item.code
                  }
                  className={
                    item.code ===
                      countryCode
                      ? "active"
                      : ""
                  }
                  onClick={() => {
                    setCountryCode(
                      item.code,
                    );

                    void loadCountry(
                      item.code,
                    );
                  }}
                >
                  <span>
                    {
                      item.flag
                    }
                  </span>

                  <strong>
                    {
                      item.name
                    }
                  </strong>
                </button>
              ),
            )
          }
        </nav>

        {
          error && (
            <div
              className="admin-education-programs__error"
            >
              {
                error
              }
            </div>
          )
        }

        {
          message && (
            <div
              className="admin-education-programs__success"
            >
              ✓ {
                message
              }
            </div>
          )
        }

        {
          loading
            ? (
              <div
                className="admin-education-programs__state"
              >
                Loading programs…
              </div>
            )
            : (
              <div
                className="admin-education-programs__list"
              >
                {
                  programs.map(
                    (
                      program,
                    ) => (
                      <article
                        key={
                          program.code
                        }
                        className="admin-education-programs__row"
                      >
                        <label
                          className="admin-education-programs__toggle"
                        >
                          <input
                            type="checkbox"
                            checked={
                              program.enabled
                            }
                            onChange={(
                              event,
                            ) =>
                              updateProgram(
                                program.code,
                                {
                                  enabled:
                                    event.target.checked,
                                },
                              )
                            }
                          />

                          <span
                            aria-hidden="true"
                          />

                          <strong>
                            {
                              program.code
                            }
                          </strong>
                        </label>

                        <label
                          className="admin-education-programs__name"
                        >
                          <small>
                            Display name
                          </small>

                          <input
                            value={
                              program.name
                            }
                            onChange={(
                              event,
                            ) =>
                              updateProgram(
                                program.code,
                                {
                                  name:
                                    event.target.value,
                                },
                              )
                            }
                          />
                        </label>

                        <label
                          className="admin-education-programs__order"
                        >
                          <small>
                            Order
                          </small>

                          <input
                            type="number"
                            inputMode="numeric"
                            min="1"
                            max="9999"
                            value={
                              program.sortOrder
                            }
                            onChange={(
                              event,
                            ) =>
                              updateProgram(
                                program.code,
                                {
                                  sortOrder:
                                    Number(
                                      event.target.value,
                                    ) ||
                                    100,
                                },
                              )
                            }
                          />
                        </label>
                      </article>
                    ),
                  )
                }
              </div>
            )
        }

        <p
          className="admin-education-programs__note"
        >
          Enabled programs appear in the Education Portal for this country.
          Program curriculum and exam behavior remain shared in the master catalog.
        </p>
      </section>
    </main>
  );
}
