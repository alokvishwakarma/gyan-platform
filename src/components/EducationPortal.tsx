import {
  useEffect,
  useState,
} from "react";

import {
  loadPublicEducationConfig,
  type EducationCountry,
  type EducationCountryConfig,
} from "../config/education";

import "./EducationPortal.css";

interface EducationPortalProps {
  country:
    EducationCountry;

  onBack:
    () => void;

  onSelect:
    (
      selection: {
        type:
          | "grade"
          | "program";

        code: string;
        name: string;
      },
    ) => void;
}

const GRADES:
  Array<
    [string, string]
  > = [
  [
    "PREK",
    "Pre-K",
  ],
  [
    "K",
    "K",
  ],

  ...Array.from(
    {
      length: 12,
    },
    (
      _,
      index,
    ) => [
      `GRADE_${index + 1}`,
      `Grade ${index + 1}`,
    ] as
      [string, string],
  ),
];

export default function EducationPortal({
  country,
  onBack,
  onSelect,
}: EducationPortalProps) {
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
    loading,
    setLoading,
  ] =
    useState(true);

  useEffect(
    () => {
      let active =
        true;

      setLoading(
        true,
      );

      void loadPublicEducationConfig(
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

  const programs =
    (
      config
        ?.programs ??
      []
    )
      .filter(
        (
          program,
        ) =>
          program.enabled,
      )
      .sort(
        (
          first,
          second,
        ) =>
          first.sortOrder -
          second.sortOrder,
      );

  return (
    <main
      className="education-portal"
    >
      <header
        className="education-portal__header"
      >
        <button
          type="button"
          onClick={
            onBack
          }
          aria-label="Back"
        >
          ←
        </button>

        <div>
          <strong>
            🎓 Education Portal
          </strong>

          <small>
            {
              country ===
                "IN"
                ? "India"
                : "United States"
            }
          </small>
        </div>
      </header>

      <div
        className="education-portal__compact-intro"
      >
        <strong>
          GYAN Education
        </strong>

        <span>
          What would you like to learn?
        </span>

        <small>
          Choose a grade, test, or enrichment program.
        </small>
      </div>

      {
        loading && (
          <div
            className="education-portal__state"
          >
            Loading education…
          </div>
        )
      }

      {
        !loading &&
        config
          ?.preK12Enabled && (
          <section
            className="education-portal__section education-portal__section--grades"
          >
            <div
              className="education-portal__grid education-portal__grid--grades"
            >
              {
                GRADES.map(
                  (
                    [
                      code,
                      name,
                    ],
                  ) => (
                    <button
                      type="button"
                      key={
                        code
                      }
                      onClick={() =>
                        onSelect({
                          type:
                            "grade",
                          code,
                          name,
                        })
                      }
                    >
                      <span>
                        📘
                      </span>

                      <strong>
                        {
                          name
                        }
                      </strong>
                    </button>
                  ),
                )
              }
            </div>
          </section>
        )
      }

      {
        !loading && (
          <section
            className="education-portal__section"
          >
            <h2>
              Tests & enrichment
            </h2>

            <div
              className="education-portal__grid"
            >
              <button
                type="button"
                className="education-portal__little-learners"
                onClick={() =>
                  onSelect({
                    type:
                      "program",

                    code:
                      "LITTLE_LEARNERS",

                    name:
                      "Little Learners",
                  })
                }
              >
                <span>
                  🌱
                </span>

                <strong>
                  Little Learners
                </strong>

                <small>
                  ABA Practice
                </small>
              </button>

              {
                programs.map(
                  (
                    program,
                  ) => (
                    <button
                      type="button"
                      key={
                        program.code
                      }
                      onClick={() =>
                        onSelect({
                          type:
                            "program",

                          code:
                            program.code,

                          name:
                            program.name,
                        })
                      }
                    >
                      <span>
                        🎯
                      </span>

                      <strong>
                        {
                          program.name
                        }
                      </strong>
                    </button>
                  ),
                )
              }
            </div>
          </section>
        )
      }
    </main>
  );
}
