import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./LiveTestResultsPanel.css";


export type LiveTestResultSummary = {
  attemptId: number;
  liveTestId: number;
  code: string;
  program: string;
  date: string;
  startsAt: string;
  submittedAt: string;
  questionCount: number;
  answeredCount: number;
  correctCount: number;
  incorrectCount: number;
  unansweredCount: number;
  scorePercent: number;
  tipsUsed: number;
  fiftyFiftyUsed: number;
  unaidedCorrect: number;
  reportUnlocked: boolean;
};


type Props = {
  mode:
    | "dialog"
    | "program";

  program?:
    string;

  onClose?:
    () => void;

  onView?:
    (
      code:
        string,
    ) => void;
};


const PROGRAM_ORDER = [
  "JEE",
  "NEET",
  "SAT",
  "GRE",
  "OLSAT",
];


function dateLabel(
  value:
    string,
): string {
  const match =
    /^(\d{4})-(\d{2})-(\d{2})$/
      .exec(
        value,
      );

  if (!match) {
    return value;
  }

  const date =
    new Date(
      Date.UTC(
        Number(
          match[1],
        ),
        Number(
          match[2],
        ) -
          1,
        Number(
          match[3],
        ),
      ),
    );

  return new Intl.DateTimeFormat(
    "en-US",
    {
      month:
        "short",
      day:
        "numeric",
    },
  ).format(
    date,
  );
}


function normalizeProgram(
  value:
    string,
): string {
  return value
    .trim()
    .toUpperCase();
}


export default function LiveTestResultsPanel({
  mode,
  program,
  onClose,
  onView,
}: Props) {
  const [
    results,
    setResults,
  ] =
    useState<
      LiveTestResultSummary[]
    >(
      [],
    );

  const [
    loading,
    setLoading,
  ] =
    useState(
      true,
    );

  const [
    error,
    setError,
  ] =
    useState("");

  const [
    expandedPrograms,
    setExpandedPrograms,
  ] =
    useState<
      Set<string>
    >(
      new Set(),
    );

  const [
    expandedAttempts,
    setExpandedAttempts,
  ] =
    useState<
      Set<number>
    >(
      new Set(),
    );


  useEffect(
    () => {
      const controller =
        new AbortController();

      setLoading(
        true,
      );

      setError("");

      void fetch(
        "/api/education/live-tests/results",
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
            const body =
              await response.json() as {
                results?:
                  LiveTestResultSummary[];
                error?:
                  string;
              };

            if (
              !response.ok
            ) {
              throw new Error(
                body.error ??
                "Live Test results could not be loaded.",
              );
            }

            return Array.isArray(
              body.results,
            )
              ? body.results
              : [];
          },
        )
        .then(
          (
            next,
          ) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setResults(
              next,
            );

            if (
              next.length >
              0
            ) {
              const newest =
                next[0];

              setExpandedPrograms(
                new Set([
                  normalizeProgram(
                    newest.program,
                  ),
                ]),
              );

              setExpandedAttempts(
                new Set([
                  newest.attemptId,
                ]),
              );
            }
          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setError(
              caught instanceof
                Error
                ? caught.message
                : "Live Test results could not be loaded.",
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
    [],
  );


  const filtered =
    useMemo(
      () => {
        const requested =
          normalizeProgram(
            program ??
            "",
          );

        return requested
          ? results.filter(
              (
                item,
              ) =>
                normalizeProgram(
                  item.program,
                ) ===
                requested,
            )
          : results;
      },
      [
        results,
        program,
      ],
    );


  const grouped =
    useMemo(
      () => {
        const map =
          new Map<
            string,
            LiveTestResultSummary[]
          >();

        for (
          const result
          of filtered
        ) {
          const code =
            normalizeProgram(
              result.program,
            );

          const items =
            map.get(
              code,
            ) ??
            [];

          items.push(
            result,
          );

          map.set(
            code,
            items,
          );
        }

        return Array.from(
          map.entries(),
        ).sort(
          (
            [
              first,
            ],
            [
              second,
            ],
          ) => {
            const firstIndex =
              PROGRAM_ORDER.indexOf(
                first,
              );

            const secondIndex =
              PROGRAM_ORDER.indexOf(
                second,
              );

            return (
              (
                firstIndex <
                0
                  ? 999
                  : firstIndex
              ) -
              (
                secondIndex <
                0
                  ? 999
                  : secondIndex
              )
            ) ||
              first.localeCompare(
                second,
              );
          },
        );
      },
      [
        filtered,
      ],
    );


  function toggleProgram(
    code:
      string,
  ): void {
    setExpandedPrograms(
      (
        current,
      ) => {
        const next =
          new Set(
            current,
          );

        if (
          next.has(
            code,
          )
        ) {
          next.delete(
            code,
          );
        } else {
          next.add(
            code,
          );
        }

        return next;
      },
    );
  }


  function toggleAttempt(
    attemptId:
      number,
  ): void {
    setExpandedAttempts(
      (
        current,
      ) => {
        const next =
          new Set(
            current,
          );

        if (
          next.has(
            attemptId,
          )
        ) {
          next.delete(
            attemptId,
          );
        } else {
          next.add(
            attemptId,
          );
        }

        return next;
      },
    );
  }


  const content = (
    <section
      className={[
        "live-test-results",
        mode ===
          "dialog"
          ? "live-test-results--dialog"
          : "live-test-results--program",
      ].join(
        " ",
      )}
      role={
        mode ===
          "dialog"
          ? "dialog"
          : undefined
      }
      aria-modal={
        mode ===
          "dialog"
          ? true
          : undefined
      }
      aria-label="Live Test Results"
      onMouseDown={(
        event,
      ) =>
        event.stopPropagation()
      }
    >
      <header className="live-test-results__header">
        <div>
          <strong>
            LIVE TEST RESULTS
          </strong>

          {
            mode ===
              "dialog" && (
              <small>
                All programs
              </small>
            )
          }
        </div>

        {
          mode ===
            "dialog" &&
          onClose && (
            <button
              type="button"
              className="live-test-results__close"
              aria-label="Close Live Test Results"
              onClick={
                onClose
              }
            >
              ×
            </button>
          )
        }
      </header>

      {
        loading ? (
          <div className="live-test-results__state">
            Loading…
          </div>
        ) : error ? (
          <div className="live-test-results__state live-test-results__state--error">
            {
              error
            }
          </div>
        ) : grouped.length ===
          0 ? (
          <div className="live-test-results__state">
            No submitted live tests yet.
          </div>
        ) : (
          <div className="live-test-results__programs">
            {
              grouped.map(
                ([
                  programCode,
                  attempts,
                ]) => {
                  const programExpanded =
                    mode ===
                      "program" ||
                    expandedPrograms.has(
                      programCode,
                    );

                  return (
                    <section
                      key={
                        programCode
                      }
                      className="live-test-results__program"
                    >
                      {
                        mode ===
                          "dialog" && (
                          <button
                            type="button"
                            className="live-test-results__program-toggle"
                            onClick={() =>
                              toggleProgram(
                                programCode,
                              )
                            }
                          >
                            <span>
                              {
                                programExpanded
                                  ? "▾"
                                  : "▸"
                              }{" "}
                              {
                                programCode
                              }
                            </span>

                            <small>
                              {
                                attempts.length
                              } submitted
                            </small>
                          </button>
                        )
                      }

                      {
                        programExpanded && (
                          <div className="live-test-results__attempts">
                            {
                              attempts.map(
                                (
                                  attempt,
                                ) => {
                                  const expanded =
                                    expandedAttempts.has(
                                      attempt.attemptId,
                                    );

                                  return (
                                    <article
                                      key={
                                        attempt.attemptId
                                      }
                                      className={[
                                        "live-test-results__attempt",
                                        expanded
                                          ? "live-test-results__attempt--expanded"
                                          : "",
                                      ]
                                        .filter(
                                          Boolean,
                                        )
                                        .join(
                                          " ",
                                        )}
                                    >
                                      <div className="live-test-results__attempt-row">
                                        <button
                                          type="button"
                                          className="live-test-results__attempt-toggle"
                                          onClick={() =>
                                            toggleAttempt(
                                              attempt.attemptId,
                                            )
                                          }
                                          aria-expanded={
                                            expanded
                                          }
                                        >
                                          <span className="live-test-results__chevron">
                                            {
                                              expanded
                                                ? "▾"
                                                : "▸"
                                            }
                                          </span>

                                          <strong>
                                            #{
                                              attempt.code
                                            }
                                          </strong>

                                          <span>
                                            {
                                              dateLabel(
                                                attempt.date,
                                              )
                                            }
                                          </span>

                                          <span>
                                            {
                                              attempt.correctCount
                                            }/{
                                              attempt.questionCount
                                            }
                                          </span>

                                          <b>
                                            {
                                              attempt.scorePercent
                                            }%
                                          </b>

                                          <span
                                            title="Tips used"
                                          >
                                            💡{
                                              attempt.tipsUsed
                                            }
                                          </span>

                                          <span
                                            title="50/50 helps used"
                                          >
                                            50/50 {
                                              attempt.fiftyFiftyUsed
                                            }
                                          </span>
                                        </button>

                                        {
                                          onView && (
                                            <button
                                              type="button"
                                              className="live-test-results__view"
                                              onClick={() =>
                                                onView(
                                                  attempt.code,
                                                )
                                              }
                                            >
                                              View
                                            </button>
                                          )
                                        }
                                      </div>

                                      {
                                        expanded && (
                                          <div className="live-test-results__details">
                                            <div>
                                              <small>
                                                Correct
                                              </small>

                                              <strong>
                                                {
                                                  attempt.correctCount
                                                }
                                              </strong>
                                            </div>

                                            <div>
                                              <small>
                                                Incorrect
                                              </small>

                                              <strong>
                                                {
                                                  attempt.incorrectCount
                                                }
                                              </strong>
                                            </div>

                                            <div>
                                              <small>
                                                Unanswered
                                              </small>

                                              <strong>
                                                {
                                                  attempt.unansweredCount
                                                }
                                              </strong>
                                            </div>

                                            <div>
                                              <small>
                                                Unaided correct
                                              </small>

                                              <strong>
                                                {
                                                  attempt.unaidedCorrect
                                                }/{
                                                  attempt.questionCount
                                                }
                                              </strong>
                                            </div>

                                            <div>
                                              <small>
                                                Tips
                                              </small>

                                              <strong>
                                                💡{
                                                  attempt.tipsUsed
                                                }
                                              </strong>
                                            </div>

                                            <div>
                                              <small>
                                                50/50
                                              </small>

                                              <strong>
                                                {
                                                  attempt.fiftyFiftyUsed
                                                }
                                              </strong>
                                            </div>

                                            {
                                              onView && (
                                                <button
                                                  type="button"
                                                  className="live-test-results__full"
                                                  onClick={() =>
                                                    onView(
                                                      attempt.code,
                                                    )
                                                  }
                                                >
                                                  {
                                                    attempt.reportUnlocked
                                                      ? "View Full Result"
                                                      : "Open Result"
                                                  }
                                                </button>
                                              )
                                            }
                                          </div>
                                        )
                                      }
                                    </article>
                                  );
                                },
                              )
                            }
                          </div>
                        )
                      }
                    </section>
                  );
                },
              )
            }
          </div>
        )
      }
    </section>
  );


  if (
    mode ===
      "program"
  ) {
    return content;
  }


  return (
    <div
      className="live-test-results__backdrop"
      role="presentation"
      onMouseDown={
        onClose
      }
    >
      {
        content
      }
    </div>
  );
}
