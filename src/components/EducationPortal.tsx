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
        countryCode?: string;
        programCode?: string;
      },
    ) => void;

  onMockTests:
    (
      program: string,
    ) => void;

  onReport:
    (
      program: string,
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

/*
 * Temporary external demo board.
 *
 * Keep the URL in one place so GYAN is not coupled to Zoom throughout
 * the component. This can later be replaced by a config/API value or a
 * native GYAN demo/whiteboard route without changing the portal UI.
 */
const EDUCATION_DEMO_URL =
  "https://us05whiteboard.zoom.us/wb/db/eWaLjYeCRrGwjTxytRnnQg/p/17502055956480";

function openEducationDemo(): void {
  window.open(
    EDUCATION_DEMO_URL,
    "_blank",
    "noopener,noreferrer",
  );
}

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


export default function EducationPortal({
  country,
  onBack,
  onSelect,
  onMockTests,
  onReport,
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

  const enabledPrograms =
    (
      config?.programs ??
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
          (
            first.sortOrder ??
            100
          ) -
            (
              second.sortOrder ??
              100
            ) ||
          first.name.localeCompare(
            second.name,
          ),
      );

  const gradeCodeForProgram =
    (
      programCode: string,
    ): string => {
      const normalized =
        normalizeProgramCode(
          programCode,
        );

      return normalized.startsWith(
        "PROGRAM_",
      )
        ? normalized
        : `PROGRAM_${normalized}`;
    };


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
            🎓 Education
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
        !loading && (
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
                enabledPrograms.map(
                  (
                    program,
                  ) => {
                    const programCode =
                      normalizeProgramCode(
                        program.code,
                      );

                    const classCategory =
                      programCode
                        .toLowerCase()
                        .replace(
                          /_/g,
                          "-",
                        );

                    return (
                      <div
                        key={
                          `${country}:${programCode}`
                        }
                        className="education-portal__advanced-row"
                      >
                        <strong>
                          {
                            program.name
                          }
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
                                  gradeCodeForProgram(
                                    programCode,
                                  ),

                                name:
                                  program.name,

                                countryCode:
                                  country,

                                programCode,
                              })
                            }
                          >
                            Topics
                          </button>

                          <button
                            type="button"
                            onClick={() =>
                              onMockTests(
                                programCode,
                              )
                            }
                          >
                            Tests
                          </button>

                          <button
                            type="button"
                            onClick={() =>
                              onReport(
                                programCode,
                              )
                            }
                            title={`${program.name} progress report`}
                          >
                            Report
                          </button>

                          <button
                            type="button"
                            onClick={
                              openEducationDemo
                            }
                            title="Open demo whiteboard"
                          >
                            Demo
                          </button>

                          <button
                            type="button"
                            onClick={() => {
                              window.location.href =
                                `/class?category=${encodeURIComponent(
                                  classCategory,
                                )}`;
                            }}
                          >
                            Class
                          </button>
                        </div>
                      </div>
                    );
                  },
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
