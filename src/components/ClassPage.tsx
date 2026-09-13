import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./ClassPage.css";


type Category =
  | "IIT-JEE"
  | "NEET"
  | "SAT";


type ClassScheduleItem = {
  scheduleDate: string;
  subject: string;
  topicCode: string | null;
  topicName: string;
  startLocal: string;
  endLocal: string;
  scheduleTimezone: string;
  sequenceNumber: number;
};


type LiveTestItem = {
  code: string;
  scheduleDate: string;
  startsAtUtc: string;
  scheduleTimezone: string;
  durationMinutes: number;
  status: string;
};


type ScheduleResponse = {
  program:
    | "JEE"
    | "NEET"
    | "SAT";
  classes: ClassScheduleItem[];
  tests: LiveTestItem[];
  error?: string;
};


type ClassDialog =
  | {
      kind: "registration";
      item: ClassScheduleItem;
    }
  | {
      kind: "upcoming-test";
      test: LiveTestItem;
    }
  | null;


function categoryFromUrl(): Category {
  const value =
    new URLSearchParams(
      window.location.search,
    )
      .get("category")
      ?.trim()
      .toLowerCase();

  return value === "sat"
    ? "SAT"
    : value === "neet"
      ? "NEET"
      : "IIT-JEE";
}


function todayKey(
  timeZone: string,
): string {
  const parts =
    new Intl.DateTimeFormat(
      "en-CA",
      {
        timeZone,
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
      },
    ).formatToParts(
      new Date(),
    );

  const values =
    new Map(
      parts.map(
        (item) => [
          item.type,
          item.value,
        ],
      ),
    );

  return `${values.get("year")}-${values.get("month")}-${values.get("day")}`;
}


function prettyDate(
  value: string,
): string {
  const [
    year,
    month,
    day,
  ] = value
    .split("-")
    .map(Number);

  return new Intl.DateTimeFormat(
    undefined,
    {
      weekday: "short",
      month: "short",
      day: "numeric",
    },
  ).format(
    new Date(
      year,
      month - 1,
      day,
    ),
  );
}


function compactTime(
  value: string,
): string {
  const [
    rawHour,
    minute,
  ] = value
    .split(":")
    .map(Number);

  const suffix =
    rawHour >= 12
      ? "PM"
      : "AM";

  const hour =
    rawHour % 12 || 12;

  return `${hour}:${String(minute).padStart(2, "0")} ${suffix}`;
}


function normalizedUtc(
  value: string,
): string {
  return /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/
    .test(value)
    ? `${value.replace(" ", "T")}Z`
    : value;
}


function testStartMs(
  test: LiveTestItem,
): number {
  return new Date(
    normalizedUtc(
      test.startsAtUtc,
    ),
  ).getTime();
}


function testLocalTime(
  test: LiveTestItem,
): string {
  const parsed =
    new Date(
      normalizedUtc(
        test.startsAtUtc,
      ),
    );

  if (
    Number.isNaN(
      parsed.getTime(),
    )
  ) {
    return "—";
  }

  return new Intl.DateTimeFormat(
    "en-US",
    {
      timeZone:
        test.scheduleTimezone ||
        "Asia/Kolkata",
      hour: "numeric",
      minute: "2-digit",
      hour12: true,
    },
  ).format(parsed);
}


function liveTestPhase(
  test: LiveTestItem,
): "UPCOMING" | "OPEN" | "OVER" {
  const startMs =
    testStartMs(test);

  if (
    !Number.isFinite(
      startMs,
    )
  ) {
    return "UPCOMING";
  }

  const endMs =
    startMs +
    Math.max(
      1,
      Number(
        test.durationMinutes,
      ),
    ) *
      60 *
      1000;

  const now = Date.now();

  if (now < startMs) {
    return "UPCOMING";
  }

  if (now < endMs) {
    return "OPEN";
  }

  return "OVER";
}


function subjectToneClass(
  subject: string,
): string {
  switch (
    subject
      .trim()
      .toUpperCase()
  ) {
    case "MATH":
    case "MATHEMATICS":
      return "gyan-class__cell--math";
    case "PHYSICS":
      return "gyan-class__cell--physics";
    case "CHEMISTRY":
      return "gyan-class__cell--chemistry";
    case "BIOLOGY":
      return "gyan-class__cell--biology";
    case "RW":
      return "gyan-class__cell--rw";
    default:
      return "";
  }
}


export default function ClassPage() {
  const [
    category,
    setCategory,
  ] = useState<Category>(
    categoryFromUrl,
  );

  const [
    schedule,
    setSchedule,
  ] = useState<ScheduleResponse | null>(
    null,
  );

  const [
    loading,
    setLoading,
  ] = useState(true);

  const [
    error,
    setError,
  ] = useState("");

  const [
    classDialog,
    setClassDialog,
  ] = useState<ClassDialog>(
    null,
  );

  const [
    interestEmail,
    setInterestEmail,
  ] = useState("");

  const [
    interestSubmitting,
    setInterestSubmitting,
  ] = useState(false);

  const [
    interestMessage,
    setInterestMessage,
  ] = useState("");


  const program =
    category === "SAT"
      ? "SAT"
      : category === "NEET"
        ? "NEET"
        : "JEE";

  const pageTimezone =
    program === "SAT"
      ? "America/New_York"
      : "Asia/Kolkata";

  const pageTimezoneLabel =
    program === "SAT"
      ? "ET"
      : "IST";

  const today =
    todayKey(
      pageTimezone,
    );

  useEffect(
    () => {
      const controller =
        new AbortController();

      void fetch(
        `/api/live-class-schedule?program=${encodeURIComponent(program)}`,
        {
          cache: "no-store",
          signal: controller.signal,
        },
      )
        .then(
          async (response) => {
            const body =
              await response.json() as
                ScheduleResponse;

            if (!response.ok) {
              throw new Error(
                body.error ??
                "Class schedule could not be loaded.",
              );
            }

            return body;
          },
        )
        .then(
          (body) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setSchedule(body);
          },
        )
        .catch(
          (caught) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setSchedule(null);
            setError(
              caught instanceof Error
                ? caught.message
                : "Class schedule could not be loaded.",
            );
          },
        )
        .finally(
          () => {
            if (
              !controller.signal.aborted
            ) {
              setLoading(false);
            }
          },
        );

      return () => {
        controller.abort();
      };
    },
    [program],
  );

  const rows =
    useMemo(
      () => {
        const classes =
          schedule?.classes ?? [];

        const tests =
          schedule?.tests ?? [];

        const dates =
          Array.from(
            new Set(
              [
                ...classes.map(
                  (item) =>
                    item.scheduleDate,
                ),
                ...tests.map(
                  (item) =>
                    item.scheduleDate,
                ),
              ],
            ),
          );

        const future =
          dates
            .filter(
              (date) =>
                date >= today,
            )
            .sort();

        const previous =
          dates
            .filter(
              (date) =>
                date < today,
            )
            .sort()
            .reverse();

        return [
          ...future,
          ...previous,
        ].map(
          (date) => ({
            date,
            classes:
              classes
                .filter(
                  (item) =>
                    item.scheduleDate === date,
                )
                .sort(
                  (first, second) =>
                    first.startLocal.localeCompare(
                      second.startLocal,
                    ),
                ),
            test:
              tests.find(
                (item) =>
                  item.scheduleDate === date,
              ) ?? null,
          }),
        );
      },
      [schedule, today],
    );

  const subjectOrder =
    program === "JEE"
      ? [
          "MATH",
          "PHYSICS",
          "CHEMISTRY",
        ]
      : program === "SAT"
        ? [
            "RW",
            "MATH",
          ]
        : [
            "PHYSICS",
            "CHEMISTRY",
            "BIOLOGY",
          ];

  function selectCategory(
    next: Category,
  ): void {
    setLoading(true);
    setError("");
    setCategory(next);
    setClassDialog(null);

    window.history.pushState(
      {},
      "",
      `/class?category=${
        next === "IIT-JEE"
          ? "iit-jee"
          : next === "SAT"
            ? "sat"
            : "neet"
      }`,
    );
  }

  function subjectLabel(
    subject: string,
  ): string {
    if (subject === "RW") {
      return "Reading & Writing";
    }

    if (subject === "MATH") {
      return program === "SAT"
        ? "Math"
        : "Maths";
    }

    return subject
      .slice(0, 1) +
      subject
        .slice(1)
        .toLowerCase();
  }

  function sampleTime(
    subject: string,
  ): string {
    const item =
      schedule
        ?.classes
        .find(
          (candidate) =>
            candidate.subject === subject,
        );

    if (!item) {
      return "—";
    }

    return `${compactTime(
      item.startLocal,
    ).replace(" PM", "")}–${compactTime(
      item.endLocal,
    )}`;
  }

  function openLiveTest(
    test: LiveTestItem,
  ): void {
    if (
      liveTestPhase(test) ===
      "UPCOMING"
    ) {
      setClassDialog({
        kind: "upcoming-test",
        test,
      });
      return;
    }

    window.location.assign(
      `/education?live=${encodeURIComponent(test.code)}`,
    );
  }

  function goToLiveTestLobby(
    test: LiveTestItem,
  ): void {
    setClassDialog(null);
    window.location.assign(
      `/education?live=${encodeURIComponent(test.code)}`,
    );
  }

  async function requestClassDetails(
    item: ClassScheduleItem,
  ): Promise<void> {
    const email =
      interestEmail
        .trim()
        .toLowerCase();

    if (
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/
        .test(email)
    ) {
      setInterestMessage(
        "Please enter a valid email address.",
      );
      return;
    }

    setInterestSubmitting(true);
    setInterestMessage("");

    try {
      const response =
        await fetch(
          "/api/class-interest",
          {
            method: "POST",
            credentials: "include",
            headers: {
              "content-type": "application/json",
            },
            body: JSON.stringify({
              email,
              program,
              scheduleDate: item.scheduleDate,
              subject: item.subject,
            }),
          },
        );

      const body =
        await response.json() as {
          ok?: boolean;
          emailSent?: boolean;
          error?: string;
        };

      if (!response.ok) {
        throw new Error(
          body.error ??
          "Your request could not be sent.",
        );
      }

      setInterestMessage(
        body.emailSent === false
          ? "✓ Request saved. GYAN will contact you at this email."
          : "✓ Details sent. Please check your email.",
      );
    } catch (caught) {
      setInterestMessage(
        caught instanceof Error
          ? caught.message
          : "Your request could not be sent.",
      );
    } finally {
      setInterestSubmitting(false);
    }
  }


  return (
    <main
      className={`gyan-class gyan-class--${program.toLowerCase()}`}
    >
      <header className="gyan-class__header">
        <button
          type="button"
          aria-label="Back"
          onClick={() => {
            window.location.assign(
              "/education",
            );
          }}
        >
          ←
        </button>

        <div>
          <strong>
            👨‍🏫 GYAN Classes
          </strong>
          <small>
            Master Class Calendar
          </small>
        </div>
      </header>

      <div className="gyan-class__filters">
        <button
          type="button"
          className={[
            "gyan-class__filter",
            "gyan-class__filter--jee",
            category === "IIT-JEE"
              ? "is-active"
              : "",
          ].filter(Boolean).join(" ")}
          onClick={() =>
            selectCategory("IIT-JEE")
          }
        >
          IIT-JEE
        </button>

        <button
          type="button"
          className={[
            "gyan-class__filter",
            "gyan-class__filter--neet",
            category === "NEET"
              ? "is-active"
              : "",
          ].filter(Boolean).join(" ")}
          onClick={() =>
            selectCategory("NEET")
          }
        >
          NEET
        </button>

        <button
          type="button"
          className={[
            "gyan-class__filter",
            "gyan-class__filter--sat",
            category === "SAT"
              ? "is-active"
              : "",
          ].filter(Boolean).join(" ")}
          onClick={() =>
            selectCategory("SAT")
          }
        >
          SAT
        </button>
      </div>

      <div className="gyan-class__note">
        8-week {category} cycle · Monday–Friday · schedule synchronized with GYAN Admin
      </div>

      {loading ? (
        <div className="gyan-class__state">
          Loading schedule…
        </div>
      ) : error ? (
        <div className="gyan-class__state">
          {error}
        </div>
      ) : (
        <div className="gyan-class__table-shell">
          <table className="gyan-class__table">
            <thead>
              <tr>
                <th>
                  Date
                </th>

                {subjectOrder.map(
                  (subject) => (
                    <th
                      key={subject}
                      className={
                        subjectToneClass(subject)
                      }
                    >
                      {subjectLabel(subject)}
                      <small>
                        {sampleTime(subject)}
                      </small>
                    </th>
                  ),
                )}

                <th className="gyan-class__cell--test">
                  Test
                  <small>
                    Live Test
                  </small>
                </th>
              </tr>
            </thead>

            <tbody>
              {rows.map(
                (row) => (
                  <tr
                    key={row.date}
                    className={
                      row.date === today
                        ? "is-today"
                        : ""
                    }
                  >
                    <td className="gyan-class__date">
                      <strong>
                        {prettyDate(row.date)}
                      </strong>
                      {row.date === today && (
                        <small>
                          TODAY
                        </small>
                      )}
                    </td>

                    {subjectOrder.map(
                      (subject) => {
                        const item =
                          row.classes.find(
                            (candidate) =>
                              candidate.subject === subject,
                          );

                        return (
                          <td
                            key={subject}
                            className={
                              subjectToneClass(subject)
                            }
                          >
                            {item ? (
                              <button
                                type="button"
                                className={`gyan-class__cell-button ${subjectToneClass(subject)}`}
                                title={`${compactTime(item.startLocal)}–${compactTime(item.endLocal)} ${pageTimezoneLabel}`}
                                onClick={() =>
                                  setClassDialog({
                                    kind: "registration",
                                    item,
                                  })
                                }
                              >
                                {item.topicName}
                              </button>
                            ) : "—"}
                          </td>
                        );
                      },
                    )}

                    <td className="gyan-class__cell--test">
                      {row.test ? (
                        <button
                          type="button"
                          className={[
                            "gyan-class__cell-button",
                            "gyan-class__cell-button--test",
                            `gyan-class__cell-button--test-${liveTestPhase(row.test).toLowerCase()}`,
                          ].join(" ")}
                          title={`${testLocalTime(row.test)} · ${row.test.durationMinutes} min`}
                          onClick={() =>
                            openLiveTest(row.test!)
                          }
                        >
                          <strong>
                            #{row.test.code}
                          </strong>
                          <small>
                            {testLocalTime(row.test)}
                          </small>
                          <span className="gyan-class__test-state">
                            {liveTestPhase(row.test) === "OPEN"
                              ? "OPEN NOW"
                              : liveTestPhase(row.test) === "OVER"
                                ? "ENDED"
                                : "UPCOMING"}
                          </span>
                        </button>
                      ) : "—"}
                    </td>
                  </tr>
                ),
              )}
            </tbody>
          </table>
        </div>
      )}

      {classDialog && (
        <div
          className="gyan-class__dialog-backdrop"
          role="presentation"
          onMouseDown={() =>
            setClassDialog(null)
          }
        >
          <section
            className="gyan-class__dialog"
            role="dialog"
            aria-modal="true"
            aria-labelledby="gyan-class-dialog-title"
            onMouseDown={(event) =>
              event.stopPropagation()
            }
          >
            <button
              type="button"
              className="gyan-class__dialog-x"
              aria-label="Close"
              onClick={() =>
                setClassDialog(null)
              }
            >
              ×
            </button>

            <div
              className="gyan-class__dialog-icon"
              aria-hidden="true"
            >
              {classDialog.kind === "registration"
                ? "👨‍🏫"
                : "⚡"}
            </div>

            <small>
              {classDialog.kind === "registration"
                ? "GYAN CLASS"
                : "GYAN LIVE"}
            </small>

            <h2 id="gyan-class-dialog-title">
              {classDialog.kind === "registration"
                ? classDialog.item.topicName
                : `Live Test #${classDialog.test.code}`}
            </h2>

            {classDialog.kind === "registration" ? (
              <>
                <p>
                  Interested in joining this {program} class?
                </p>

                <div className="gyan-class__dialog-facts">
                  <span>
                    📅 {prettyDate(classDialog.item.scheduleDate)}
                  </span>
                  <span>
                    🕒 {compactTime(classDialog.item.startLocal)}–{compactTime(classDialog.item.endLocal)} {pageTimezoneLabel}
                  </span>
                </div>

                <label className="gyan-class__interest-field">
                  <span>
                    Your email
                  </span>
                  <input
                    type="email"
                    inputMode="email"
                    autoComplete="email"
                    placeholder="student@example.com"
                    value={interestEmail}
                    disabled={interestSubmitting}
                    onChange={(event) => {
                      setInterestEmail(
                        event.target.value,
                      );
                      setInterestMessage("");
                    }}
                    onKeyDown={(event) => {
                      if (
                        event.key === "Enter" &&
                        !interestSubmitting
                      ) {
                        event.preventDefault();
                        void requestClassDetails(
                          classDialog.item,
                        );
                      }
                    }}
                  />
                </label>

                <p className="gyan-class__dialog-note">
                  GYAN will email the class details to you. No phone number is required.
                </p>

                {interestMessage && (
                  <div
                    className="gyan-class__interest-message"
                    role="status"
                  >
                    {interestMessage}
                  </div>
                )}

                <div className="gyan-class__dialog-actions">
                  <button
                    type="button"
                    disabled={interestSubmitting}
                    onClick={() =>
                      setClassDialog(null)
                    }
                  >
                    Not now
                  </button>
                  <button
                    type="button"
                    className="gyan-class__dialog-primary"
                    disabled={interestSubmitting}
                    onClick={() =>
                      void requestClassDetails(
                        classDialog.item,
                      )
                    }
                  >
                    {interestSubmitting
                      ? "Sending…"
                      : "Request Details"}
                  </button>
                </div>
              </>
            ) : (
              <>
                <p>
                  This test has not started yet. You can open the Live Test lobby and see the synchronized start time.
                </p>

                <div className="gyan-class__dialog-facts">
                  <span>
                    🕒 {testLocalTime(classDialog.test)} {pageTimezoneLabel}
                  </span>
                  <span>
                    ⏱ {classDialog.test.durationMinutes} min
                  </span>
                </div>

                <p className="gyan-class__dialog-note">
                  The lobby controls when the test can begin.
                </p>

                <div className="gyan-class__dialog-actions">
                  <button
                    type="button"
                    onClick={() =>
                      setClassDialog(null)
                    }
                  >
                    Stay here
                  </button>
                  <button
                    type="button"
                    className="gyan-class__dialog-primary"
                    onClick={() =>
                      goToLiveTestLobby(classDialog.test)
                    }
                  >
                    Open Lobby
                  </button>
                </div>
              </>
            )}
          </section>
        </div>
      )}
    </main>
  );
}
