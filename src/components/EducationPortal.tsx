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

const FOUNDATION_ROWS:
  Array<
    Array<
      [string, string]
    >
  > = [
    [
      ["GRADE_12", "12"],
      ["GRADE_11", "11"],
      ["GRADE_10", "10"],
      ["GRADE_9", "9"],
      ["GRADE_8", "8"],
    ],

    [
      ["GRADE_7", "7"],
      ["GRADE_6", "6"],
      ["GRADE_5", "5"],
      ["GRADE_4", "4"],
      ["GRADE_3", "3"],
    ],

    [
      ["GRADE_2", "2"],
      ["GRADE_1", "1"],
      ["K", "K"],
      ["PREK", "Pre-K"],
    ],
  ];

function normalizeProgramCode(
  value: string,
): string {
  return value
    .trim()
    .toUpperCase()
    .replace(
      /[^A-Z0-9]+/g,
      "_",
    )
    .replace(
      /^_+|_+$/g,
      "",
    );
}

function findProgram(
  config:
    EducationCountryConfig |
    null,
  candidates:
    string[],
) {
  if (
    !config
  ) {
    return undefined;
  }

  const normalizedCandidates =
    candidates.map(
      normalizeProgramCode,
    );

  return (
    config.programs ??
    []
  ).find(
    (
      program,
    ) =>
      program.enabled &&
      normalizedCandidates.includes(
        normalizeProgramCode(
          program.code,
        ),
      ),
  );
}

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
    loadedCountry,
    setLoadedCountry,
  ] =
    useState<
      EducationCountry |
      null
    >(
      null,
    );

  const loading =
    loadedCountry !==
    country;

  useEffect(
    () => {
      let active =
        true;

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

              setLoadedCountry(
                country,
              );
            }
          },
        )
        .catch(
          () => {
            if (
              active
            ) {
              setConfig(
                null,
              );

              setLoadedCountry(
                country,
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

  /*
   * Advanced v1 is intentionally focused on IIT-JEE and NEET.
   *
   * If older config uses IIT / JEE / IIT_JEE variants,
   * treat them as the same IIT-JEE program.
   */
  const iitJeeProgram =
    findProgram(
      config,
      [
        "IIT_JEE",
        "IIT-JEE",
        "IIT",
        "JEE",
      ],
    );

  const neetProgram =
    findProgram(
      config,
      [
        "NEET",
      ],
    );

  const iitJeeEnabled =
    country ===
      "IN" &&
    !loading;

  const neetEnabled =
    country ===
      "IN" &&
    !loading;

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
        </div>
      </header>

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
        country ===
          "IN" && (
          <section
            className="education-portal__section education-portal__section--advanced"
          >
            <h2>
              Advanced
            </h2>

            <div
              className="education-portal__advanced-list"
            >
              {
                iitJeeEnabled && (
                  <div
                    className="education-portal__advanced-row"
                  >
                    <strong>
                      IIT-JEE
                    </strong>

                    <div
                      className="education-portal__advanced-actions"
                    >
                      <button
                        type="button"
                        onClick={() =>
                          onSelect({
                            type:
                              "program",

                            /*
                             * Use the EXISTING configured program code.
                             * The topic/subject flow keys off this exact
                             * value. Older GYAN data commonly uses IIT,
                             * while the UI label can still say IIT-JEE.
                             */
                            code:
                              iitJeeProgram
                                ?.code ??
                              "IIT",

                            name:
                              iitJeeProgram
                                ?.name ??
                              "IIT-JEE",
                          })
                        }
                      >
                        Questions
                      </button>

                      <button
                        type="button"
                        onClick={() => {
                          window.location.href =
                            "/class?category=iit-jee";
                        }}
                      >
                        Classes
                      </button>
                    </div>
                  </div>
                )
              }

              {
                neetEnabled && (
                  <div
                    className="education-portal__advanced-row"
                  >
                    <strong>
                      NEET
                    </strong>

                    <div
                      className="education-portal__advanced-actions"
                    >
                      <button
                        type="button"
                        onClick={() =>
                          onSelect({
                            type:
                              "program",

                            code:
                              neetProgram
                                ?.code ??
                              "NEET",

                            name:
                              neetProgram
                                ?.name ??
                              "NEET",
                          })
                        }
                      >
                        Questions
                      </button>

                      <button
                        type="button"
                        onClick={() => {
                          window.location.href =
                            "/class?category=neet";
                        }}
                      >
                        Classes
                      </button>
                    </div>
                  </div>
                )
              }
            </div>
          </section>
        )
      }

      {
        !loading &&
        config
          ?.preK12Enabled && (
          <section
            className="education-portal__section education-portal__section--grades"
          >
            <h2>
              Foundation
            </h2>

            <div
              className="education-portal__foundation"
            >
              {
                FOUNDATION_ROWS.map(
                  (
                    row,
                    rowIndex,
                  ) => (
                    <div
                      className="education-portal__foundation-row"
                      key={
                        rowIndex
                      }
                    >
                      {
                        row.map(
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
            className="education-portal__section education-portal__section--aba"
          >
            <h2>
              ABA
            </h2>

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
                ABA
              </strong>

              <small>
                Little Learners
              </small>
            </button>
          </section>
        )
      }
    </main>
  );
}
