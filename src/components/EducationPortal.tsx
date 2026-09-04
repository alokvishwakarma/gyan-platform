import {
  useEffect,
  useState,
} from "react";

import {
  type EducationCountry,
} from "../config/education";

import {
  loadEducationCatalog,
  type EducationCatalog,
  type EducationCatalogProgram,
} from "../config/educationCatalog";

import "./EducationPortal.css";

interface EducationPortalProps {
  country:
    EducationCountry;

  onBack:
    () => void;

  onMockTests?: (
    programCode: string,
  ) => void;

  onReport?: (
    programCode: string,
  ) => void;

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
        experienceType?: string;
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

export default function EducationPortal({
  country,
  onBack,
  onMockTests,
  onReport,
  onSelect,
}: EducationPortalProps) {
  const [
    catalog,
    setCatalog,
  ] =
    useState<
      EducationCatalog |
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

      void loadEducationCatalog(
        country,
      )
        .then(
          (next) => {
            if (
              active
            ) {
              setCatalog(
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
              setCatalog(
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
                (
                  catalog
                    ?.programs ??
                  []
                ).map(
                  (
                    program:
                      EducationCatalogProgram,
                  ) => (
                    <div
                      key={
                        `${program.countryCode}:${program.code}`
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
                        {
                          program.showQuestions && (
                            <button
                              type="button"
                              onClick={() =>
                                onSelect({
                                  type:
                                    "program",
                                  code:
                                    program.gradeCode,
                                  name:
                                    program.name,
                                  countryCode:
                                    program.countryCode,
                                  programCode:
                                    program.code,
                                  experienceType:
                                    program.experienceType,
                                })
                              }
                            >
                              Questions
                            </button>
                          )
                        }

                        {
                          program.showMockTests &&
                          onMockTests && (
                            <button
                              type="button"
                              onClick={() =>
                                onMockTests(
                                  program.code,
                                )
                              }
                            >
                              Mock Tests
                            </button>
                          )
                        }

                        {
                          program.showReports &&
                          onReport && (
                            <button
                              type="button"
                              onClick={() =>
                                onReport(
                                  program.code,
                                )
                              }
                            >
                              Report
                            </button>
                          )
                        }

                        {
                          program.showDemo && (
                            <button
                              type="button"
                              disabled
                              title="Demo Class · Coming Soon"
                            >
                              Demo · Soon
                            </button>
                          )
                        }

                        {
                          program.showClasses && (
                            <button
                              type="button"
                              onClick={() => {
                                window.location.href =
                                  `/class?category=${encodeURIComponent(
                                    program.code.toLowerCase(),
                                  )}`;
                              }}
                            >
                              Class
                            </button>
                          )
                        }
                      </div>
                    </div>
                  ),
                )
              }
            </div>
          </section>
        )
      }


      {
        !loading &&
        (
          catalog?.selectedCountry ===
            "US" ||
          catalog?.selectedCountry ===
            "IN"
        ) && (
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
