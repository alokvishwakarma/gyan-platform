import {
  useEffect,
  useState,
} from "react";

import {
  loadPublicEducationConfig,
  type EducationCountry,
  type EducationCountryConfig,
} from "../config/education";

import {
  ADMIN_LOCATION_CHANGED_EVENT,
  getAdminLocationOverride,
} from "../location/adminLocation";

import "./EducationPortal.css";

interface LiveTestSummary {
  code: string;
  program: string;
  state: string;
  startsAt: string;
  scheduleTimezone: string;
  durationMinutes: number;
  entryGemCost: number;
  reportGemCost: number;
  scheduleDate?: string | null;
}

interface LiveTestsResponse {
  liveTests?: LiveTestSummary[];
}

interface EducationPortalProps {
  country:
    EducationCountry;

  adminAuthenticated?:
    boolean;

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

  onLiveTest?:
    (
      code: string,
    ) => void;
  onAdminLiveTests?:
    () => void;

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


function parseLiveUtc(
  value: string,
): number {
  const trimmed =
    value.trim();

  const normalized =
    /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/
      .test(trimmed)
      ? `${trimmed.replace(" ", "T")}Z`
      : /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$/
          .test(trimmed)
        ? `${trimmed}Z`
        : trimmed;

  return Date.parse(
    normalized,
  );
}

function relativeStartText(
  startMs: number,
  nowMs: number,
): string {
  const remainingMs =
    Math.max(
      0,
      startMs - nowMs,
    );

  const totalMinutes =
    Math.ceil(
      remainingMs / 60000,
    );

  if (totalMinutes <= 1) {
    return "starts in <1 min";
  }

  const days =
    Math.floor(
      totalMinutes / 1440,
    );

  const hours =
    Math.floor(
      (totalMinutes % 1440) / 60,
    );

  const minutes =
    totalMinutes % 60;

  if (days > 0) {
    return `starts in ${days}d ${hours}h`;
  }

  if (hours > 0) {
    return minutes > 0
      ? `starts in ${hours}h ${minutes}m`
      : `starts in ${hours}h`;
  }

  return `starts in ${minutes}m`;
}

function shortTimezoneLabel(
  timezone: string,
): string {
  if (timezone === "Asia/Kolkata") {
    return "IST";
  }

  return timezone;
}

function scheduledStartText(
  test: LiveTestSummary,
): string {
  const startMs =
    parseLiveUtc(
      test.startsAt,
    );

  if (!Number.isFinite(startMs)) {
    return "Scheduled";
  }

  try {
    const formatted =
      new Intl.DateTimeFormat(
        "en-US",
        {
          timeZone:
            test.scheduleTimezone ||
            "UTC",
          hour:
            "numeric",
          minute:
            "2-digit",
        },
      ).format(
        new Date(startMs),
      );

    return `${formatted} ${shortTimezoneLabel(
      test.scheduleTimezone,
    )}`;
  } catch {
    return new Date(
      startMs,
    ).toLocaleTimeString(
      [],
      {
        hour:
          "numeric",
        minute:
          "2-digit",
      },
    );
  }
}


function browserTimezone():
  string {
  try {
    return (
      Intl.DateTimeFormat()
        .resolvedOptions()
        .timeZone ||
      "UTC"
    );
  } catch {
    return "UTC";
  }
}


function adminOverrideTimezone():
  string | null {
  const override =
    getAdminLocationOverride();

  if (!override) {
    return null;
  }

  const countryCode =
    override.countryCode
      ?.trim()
      .toUpperCase();

  if (
    countryCode ===
      "IN"
  ) {
    return "Asia/Kolkata";
  }

  if (
    countryCode ===
      "US"
  ) {
    const longitude =
      Number(
        override.longitude,
      );

    if (
      Number.isFinite(
        longitude,
      )
    ) {
      if (
        longitude <=
          -114
      ) {
        return "America/Los_Angeles";
      }

      if (
        longitude <=
          -101
      ) {
        return "America/Denver";
      }

      if (
        longitude <=
          -86
      ) {
        return "America/Chicago";
      }

      return "America/New_York";
    }
  }

  return null;
}


function effectiveViewerTimezone():
  string {
  return (
    adminOverrideTimezone() ??
    browserTimezone()
  );
}


function viewerDateKey(
  timestampMs:
    number,

  timezone:
    string,
): string {
  try {
    const parts =
      new Intl.DateTimeFormat(
        "en-US",
        {
          timeZone:
            timezone,

          year:
            "numeric",

          month:
            "2-digit",

          day:
            "2-digit",
        },
      )
        .formatToParts(
          new Date(
            timestampMs,
          ),
        );

    const year =
      parts.find(
        (
          part,
        ) =>
          part.type ===
          "year",
      )?.value;

    const month =
      parts.find(
        (
          part,
        ) =>
          part.type ===
          "month",
      )?.value;

    const day =
      parts.find(
        (
          part,
        ) =>
          part.type ===
          "day",
      )?.value;

    if (
      year &&
      month &&
      day
    ) {
      return `${year}-${month}-${day}`;
    }
  } catch {
    // Fall through to UTC below.
  }

  return new Date(
    timestampMs,
  )
    .toISOString()
    .slice(
      0,
      10,
    );
}


function isLiveTestTodayForViewer(
  test:
    LiveTestSummary,

  nowMs:
    number,

  timezone:
    string,
): boolean {
  const startMs =
    parseLiveUtc(
      test.startsAt,
    );

  return (
    Number.isFinite(
      startMs,
    ) &&
    viewerDateKey(
      startMs,
      timezone,
    ) ===
      viewerDateKey(
        nowMs,
        timezone,
      )
  );
}


function liveTestDisplayState(
  test: LiveTestSummary,
  nowMs: number,
  viewerTimezone: string,
): {
  open: boolean;
  clickable: boolean;
  tone:
    | "default"
    | "soon"
    | "open"
    | "ended";
  shortTime: string;
  text: string;
} {
  const startMs =
    parseLiveUtc(
      test.startsAt,
    );

  const shortTime =
    Number.isFinite(startMs)
      ? new Intl.DateTimeFormat(
          "en-US",
          {
            timeZone:
              viewerTimezone ||
              "UTC",
            hour:
              "numeric",
            minute:
              "2-digit",
          },
        )
          .format(
            new Date(startMs),
          )
          .replace(
            ":00",
            "",
          )
          .replace(
            " AM",
            "a",
          )
          .replace(
            " PM",
            "p",
          )
      : "--";

  if (
    test.state ===
      "CANCELLED"
  ) {
    return {
      open: false,
      clickable: false,
      tone: "ended",
      shortTime,
      text: "Cancelled",
    };
  }

  if (
    nowMs <= 0 ||
    !Number.isFinite(startMs)
  ) {
    return {
      open: false,
      clickable: true,
      tone: "default",
      shortTime,
      text: "Upcoming",
    };
  }

  const endMs =
    startMs +
    Math.max(
      1,
      test.durationMinutes,
    ) *
      60 *
      1000;

  if (nowMs < startMs) {
    const withinHour =
      startMs - nowMs <=
      60 * 60 * 1000;

    return {
      open: false,
      clickable: true,
      tone:
        withinHour
          ? "soon"
          : "default",
      shortTime,
      text: `${scheduledStartText(test)} · ${relativeStartText(
        startMs,
        nowMs,
      )}`,
    };
  }

  if (nowMs < endMs) {
    return {
      open: true,
      clickable: true,
      tone: "open",
      shortTime,
      text: `Open now · ${test.durationMinutes} min`,
    };
  }

  return {
    open: false,
    clickable: true,
    tone: "ended",
    shortTime,
    text: "Test ended",
  };
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
  onLiveTest,
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

  const [
    liveTests,
    setLiveTests,
  ] =
    useState<LiveTestSummary[]>([]);

  const [
    liveClockMs,
    setLiveClockMs,
  ] =
    useState(0);

  const [
    viewerTimezone,
    setViewerTimezone,
  ] =
    useState(
      () =>
        effectiveViewerTimezone(),
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

  useEffect(
    () => {
      let active =
        true;

      void fetch(
        "/api/education/live-tests",
        {
          credentials:
            "include",
          cache:
            "no-store",
        },
      )
        .then(
          async (response) => {
            if (!response.ok) {
              throw new Error(
                "Live Tests could not be loaded.",
              );
            }

            return await response.json() as
              LiveTestsResponse;
          },
        )
        .then(
          (body) => {
            if (active) {
              setLiveTests(
                Array.isArray(
                  body.liveTests,
                )
                  ? body.liveTests
                  : [],
              );
            }
          },
        )
        .catch(
          () => {
            if (active) {
              setLiveTests([]);
            }
          },
        );

      return () => {
        active =
          false;
      };
    },
    [],
  );


  useEffect(
    () => {
      const updateClock =
        (): void => {
          setLiveClockMs(
            Date.now(),
          );
        };

      updateClock();

      const timer =
        window.setInterval(
          updateClock,
          30000,
        );

      return () => {
        window.clearInterval(
          timer,
        );
      };
    },
    [],
  );


  useEffect(
    () => {
      const updateTimezone =
        (): void => {
          setViewerTimezone(
            effectiveViewerTimezone(),
          );

          setLiveClockMs(
            Date.now(),
          );
        };

      updateTimezone();

      window.addEventListener(
        ADMIN_LOCATION_CHANGED_EVENT,
        updateTimezone,
      );

      return () => {
        window.removeEventListener(
          ADMIN_LOCATION_CHANGED_EVENT,
          updateTimezone,
        );
      };
    },
    [],
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


  const countryVisibleLiveTests =
    liveTests
      .filter(
        (
          test,
        ) => {
          const program =
            test.program
              .trim()
              .toUpperCase();

          const programVisible =
            country ===
              "IN"
              ? (
                  program ===
                    "JEE" ||
                  program ===
                    "NEET" ||
                  program ===
                    "GRE" ||
                  program ===
                    "OLSAT"
                )
              : (
                  program ===
                    "SAT" ||
                  program ===
                    "GRE" ||
                  program ===
                    "OLSAT"
                );

          return (
            programVisible &&
            test.state !==
              "CANCELLED" &&
            liveClockMs >
              0 &&
            isLiveTestTodayForViewer(
              test,
              liveClockMs,
              viewerTimezone,
            )
          );
        },
      )
      .sort(
        (
          first,
          second,
        ) =>
          parseLiveUtc(
            first.startsAt,
          ) -
          parseLiveUtc(
            second.startsAt,
          ),
      );


  const showSatPlaceholder =
    country ===
      "US" &&
    countryVisibleLiveTests.length ===
      0;


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

{(
              countryVisibleLiveTests.length >
                0 ||
              showSatPlaceholder
            ) && (
              <div
                className="education-portal__advanced-row"
              >
                <strong>
                  Live Tests
                </strong>

                <div
                  className="education-portal__advanced-actions"
                >
                  {
                    showSatPlaceholder
                      ? (
                          <button
                            type="button"
                            disabled
                            title="SAT Live Tests coming soon"
                            style={{
                              whiteSpace:
                                "nowrap",
                            }}
                          >
                            SAT · 7:30p ET
                          </button>
                        )
                      : countryVisibleLiveTests.map(
                          (
                            test,
                          ) => {
                            const display =
                              liveTestDisplayState(
                                test,
                                liveClockMs,
                                viewerTimezone,
                              );

                            return (
                              <button
                                type="button"
                                key={
                                  test.code
                                }
                                disabled={
                                  !display.clickable
                                }
                                onClick={() =>
                                  onLiveTest?.(
                                    test.code,
                                  )
                                }
                                title={`${test.program} · ${display.text}`}
                                style={{
                                  background:
                                    display.tone ===
                                      "soon"
                                      ? "#fff2a8"
                                      : display.tone ===
                                          "open"
                                        ? "#d9f5df"
                                        : display.tone ===
                                            "ended"
                                          ? "#ffd9d9"
                                          : "#dceeff",

                                  borderColor:
                                    display.tone ===
                                      "soon"
                                      ? "#e1c44f"
                                      : display.tone ===
                                          "open"
                                        ? "#86c993"
                                        : display.tone ===
                                            "ended"
                                          ? "#db9090"
                                          : "#9fc7ee",

                                  whiteSpace:
                                    "nowrap",
                                }}
                              >
                                #
                                {
                                  test.code
                                }
                                {" · "}
                                {
                                  test.program
                                }
                                {
                                  display.shortTime
                                    ? ` · ${display.shortTime}`
                                    : ""
                                }
                              </button>
                            );
                          },
                        )
                  }
                </div>
              </div>
            )}

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
