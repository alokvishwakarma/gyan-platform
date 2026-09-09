import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./LiveTestRunner.css";


interface LiveTestRunnerProps {
  code:
    string;

  adminAuthenticated?:
    boolean;

  onBack:
    () => void;
}


interface LiveTestSummary {
  code: string;
  program: string;
  state: string;
  startsAt: string;
  scheduleTimezone: string;
  durationMinutes: number;
  entryGemCost: number;
  reportGemCost: number;

  participants?:
    number;

  hearts?:
    number;

  bolts?:
    number;

  questionCount?:
    number;
}


interface LiveQuestion {
  questionOrder:
    number;

  questionId:
    number;

  section:
    string | null;

  difficulty:
    string;

  questionText:
    string;

  choices: {
    A:
      string;

    B:
      string;

    C:
      string;

    D:
      string;
  };
}


interface QuestionsResponse {
  liveTest: {
    code:
      string;

    program:
      string;

    state:
      string;

    startsAt:
      string;

    endsAt:
      string;

    durationMinutes:
      number;

    questionCount:
      number;

    entryId:
      number;

    enteredAt:
      string;
  };

  questions:
    LiveQuestion[];

  error?:
    string;
}


interface LiveTestResultQuestion {
  questionOrder:
    number;

  questionId:
    number;

  section:
    string | null;

  questionText:
    string;

  selectedChoice:
    string | null;

  correctChoice:
    string;

  correct:
    boolean;

  choices: {
    A: string;
    B: string;
    C: string;
    D: string;
  };

  explanation:
    string | null;
}


interface LiveTestResult {
  code:
    string;

  attemptId:
    number;

  questionCount:
    number;

  answeredCount:
    number;

  correctCount:
    number;

  incorrectCount:
    number;

  unansweredCount:
    number;

  rawScore:
    number;

  scorePercent:
    number;

  startedAt:
    string;

  submittedAt:
    string;

  questions:
    LiveTestResultQuestion[];
}


function secondsUntil(
  iso:
    string,
): number {
  const end =
    Date.parse(
      iso,
    );

  if (
    !Number.isFinite(
      end,
    )
  ) {
    return 0;
  }

  return Math.max(
    0,
    Math.ceil(
      (
        end -
        Date.now()
      ) /
      1000,
    ),
  );
}


function clockText(
  seconds:
    number,
): string {
  const minutes =
    Math.floor(
      seconds /
      60,
    );

  const remainder =
    seconds %
    60;

  return `${String(
    minutes,
  ).padStart(
    2,
    "0",
  )}:${String(
    remainder,
  ).padStart(
    2,
    "0",
  )}`;
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
  if (nowMs <= 0) {
    return "upcoming";
  }

  const totalMinutes =
    Math.max(
      0,
      Math.ceil(
        (startMs - nowMs) /
        60000,
      ),
    );

  if (totalMinutes <= 1) {
    return "in <1 min";
  }

  const hours =
    Math.floor(
      totalMinutes / 60,
    );

  const minutes =
    totalMinutes % 60;

  if (hours > 0) {
    return minutes > 0
      ? `in ${hours} hr ${minutes} min`
      : `in ${hours} hr`;
  }

  return `in ${minutes} min`;
}


function clockCountdownText(
  targetMs: number,
  nowMs: number,
): string {
  if (
    nowMs <= 0 ||
    !Number.isFinite(targetMs)
  ) {
    return "--:--";
  }

  const totalSeconds =
    Math.max(
      0,
      Math.ceil(
        (targetMs - nowMs) /
        1000,
      ),
    );

  const hours =
    Math.floor(
      totalSeconds / 3600,
    );

  const minutes =
    Math.floor(
      (totalSeconds % 3600) / 60,
    );

  const seconds =
    totalSeconds % 60;

  if (hours > 0) {
    return `${hours}:${String(minutes).padStart(2, "0")}:${String(seconds).padStart(2, "0")}`;
  }

  return `${minutes}:${String(seconds).padStart(2, "0")}`;
}


function scheduledDetailText(
  test: LiveTestSummary,
  nowMs: number,
): string {
  const startMs =
    parseLiveUtc(
      test.startsAt,
    );

  if (!Number.isFinite(startMs)) {
    return "Scheduled Live Test";
  }

  // eslint-disable-next-line no-useless-assignment
  let timeText =
    "scheduled time";

  try {
    timeText =
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
  } catch {
    timeText =
      new Date(
        startMs,
      ).toLocaleTimeString(
        [],
        {
          hour: "numeric",
          minute: "2-digit",
        },
      );
  }

  const zone =
    test.scheduleTimezone ===
      "Asia/Kolkata"
      ? "IST"
      : test.scheduleTimezone;

  const endMs =
    startMs +
    Math.max(
      1,
      test.durationMinutes,
    ) *
      60 *
      1000;

  if (nowMs > 0 && nowMs >= endMs) {
    return `Started at ${timeText} ${zone} · test ended`;
  }

  if (nowMs > 0 && nowMs >= startMs) {
    return `Started at ${timeText} ${zone} · open now`;
  }

  return `Starts at ${timeText} ${zone} (${relativeStartText(
    startMs,
    nowMs,
  )})`;
}


function deterministicSimulationTarget(
  code: string,
): number {
  let hash = 17;

  for (const character of code) {
    hash =
      (hash * 31 +
        character.charCodeAt(0)) %
      100000;
  }

  return 1200 +
    (hash % 701);
}


function simulatedActivityCount(
  test: LiveTestSummary,
  nowMs: number,
): number {
  const startMs =
    parseLiveUtc(
      test.startsAt,
    );

  if (
    nowMs <= 0 ||
    !Number.isFinite(startMs)
  ) {
    return 0;
  }

  const durationMs =
    Math.max(
      1,
      test.durationMinutes,
    ) *
    60 *
    1000;

  const endMs =
    startMs + durationMs;

  const previewStartMs =
    startMs -
    5 * 60 * 1000;

  if (nowMs < previewStartMs) {
    return 0;
  }

  const target =
    deterministicSimulationTarget(
      test.code,
    );

  if (nowMs < startMs) {
    const progress =
      Math.min(
        1,
        Math.max(
          0,
          (nowMs -
            previewStartMs) /
            (startMs -
              previewStartMs),
        ),
      );

    return Math.round(
      target *
        (
          0.04 +
          0.2 * progress
        ),
    );
  }

  if (nowMs >= endMs) {
    return target;
  }

  const progress =
    Math.min(
      1,
      Math.max(
        0,
        (nowMs - startMs) /
          durationMs,
      ),
    );

  const eased =
    1 -
    Math.pow(
      1 - progress,
      2.2,
    );

  return Math.round(
    target *
      (
        0.24 +
        0.76 * eased
      ),
  );
}


export default function LiveTestRunner({
  code,
  adminAuthenticated =
    false,
  onBack,
}: LiveTestRunnerProps) {
  const [
    loading,
    setLoading,
  ] =
    useState(false);

  const [
    error,
    setError,
  ] =
    useState("");

  const [
    started,
    setStarted,
  ] =
    useState(false);

  const [
    submitted,
    setSubmitted,
  ] =
    useState(false);

  const [
    questionsResponse,
    setQuestionsResponse,
  ] =
    useState<
      QuestionsResponse |
      null
    >(
      null,
    );

  const [
    answers,
    setAnswers,
  ] =
    useState<
      Record<
        number,
        "A" |
        "B" |
        "C" |
        "D"
      >
    >({});

  const [
    remainingSeconds,
    setRemainingSeconds,
  ] =
    useState(0);


  const [
    reportResult,
    setReportResult,
  ] =
    useState<
      LiveTestResult |
      null
    >(
      null,
    );

  const [
    reportGemCost,
    setReportGemCost,
  ] =
    useState(15);

  const [
    liveSummary,
    setLiveSummary,
  ] =
    useState<
      LiveTestSummary |
      null
    >(null);

  const [
    introClockMs,
    setIntroClockMs,
  ] =
    useState(0);


  const isAdminTest =
    code
      .trim()
      .toUpperCase() ===
      "ADMIN101";


  const title =
    isAdminTest
      ? "Admin Test #101"
      : `Live Test #${code}`;


  const answeredCount =
    useMemo(
      () =>
        Object.keys(
          answers,
        ).length,
      [
        answers,
      ],
    );


  useEffect(
    () => {
      if (isAdminTest) {
        return;
      }

      let active =
        true;

      void fetch(
        "/api/education/live-tests",
        {
          credentials: "include",
          cache: "no-store",
        },
      )
        .then(
          async (response) => {
            if (!response.ok) {
              return null;
            }

            return await response.json() as {
              liveTests?: LiveTestSummary[];
            };
          },
        )
        .then(
          (body) => {
            if (!active) {
              return;
            }

            const found =
              body?.liveTests?.find(
                (test) =>
                  test.code
                    .trim()
                    .toUpperCase() ===
                  code
                    .trim()
                    .toUpperCase(),
              ) ??
              null;

            setLiveSummary(
              found,
            );
          },
        )
        .catch(
          () => {
            if (active) {
              setLiveSummary(null);
            }
          },
        );

      return () => {
        active = false;
      };
    },
    [
      code,
      isAdminTest,
    ],
  );

  useEffect(
    () => {
      if (isAdminTest) {
        return;
      }

      const update =
        (): void => {
          setIntroClockMs(
            Date.now(),
          );
        };

      const initialTimer =
        window.setTimeout(
          update,
          0,
        );

      const timer =
        window.setInterval(
          update,
          1000,
        );

      return () => {
        window.clearTimeout(
          initialTimer,
        );

        window.clearInterval(
          timer,
        );
      };
    },
    [
      isAdminTest,
    ],
  );


  const scheduledStartMs =
    liveSummary
      ? parseLiveUtc(
          liveSummary.startsAt,
        )
      : Number.NaN;

  const scheduledEndMs =
    liveSummary &&
    Number.isFinite(
      scheduledStartMs,
    )
      ? scheduledStartMs +
        Math.max(
          1,
          liveSummary.durationMinutes,
        ) *
          60 *
          1000
      : Number.NaN;

  const lobbyOpensMs =
    Number.isFinite(
      scheduledStartMs,
    )
      ? scheduledStartMs -
        15 * 60 * 1000
      : Number.NaN;

  const isBeforeLobby =
    !isAdminTest &&
    liveSummary !== null &&
    introClockMs > 0 &&
    Number.isFinite(
      lobbyOpensMs,
    ) &&
    introClockMs <
      lobbyOpensMs;

  const isInLobby =
    !isAdminTest &&
    liveSummary !== null &&
    introClockMs > 0 &&
    Number.isFinite(
      lobbyOpensMs,
    ) &&
    Number.isFinite(
      scheduledStartMs,
    ) &&
    introClockMs >=
      lobbyOpensMs &&
    introClockMs <
      scheduledStartMs;

  const isScheduledOpen =
    !isAdminTest &&
    liveSummary !== null &&
    introClockMs > 0 &&
    Number.isFinite(
      scheduledStartMs,
    ) &&
    Number.isFinite(
      scheduledEndMs,
    ) &&
    introClockMs >=
      scheduledStartMs &&
    introClockMs <
      scheduledEndMs;

  const isScheduledOver =
    !isAdminTest &&
    liveSummary !== null &&
    introClockMs > 0 &&
    Number.isFinite(
      scheduledEndMs,
    ) &&
    introClockMs >=
      scheduledEndMs;

  const canStartScheduledTest =
    isAdminTest ||
    (
      liveSummary !== null &&
      isScheduledOpen
    );


  const simulatedParticipants =
    adminAuthenticated &&
    !isAdminTest &&
    liveSummary
      ? simulatedActivityCount(
          liveSummary,
          introClockMs,
        )
      : 0;


  async function startTest():
    Promise<void> {
    setLoading(
      true,
    );

    setError("");

    try {
      const enterResponse =
        await fetch(
          "/api/education/live-tests/enter",
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
                code,
              }),
          },
        );

      const enterBody =
        await enterResponse
          .json() as {
            error?:
              string;

            submitted?:
              boolean;

            reportUnlocked?:
              boolean;

            reportGemCost?:
              number;
          };

      if (
        !enterResponse.ok
      ) {
        throw new Error(
          enterBody.error ??
          "Live Test could not be opened.",
        );
      }

      setReportGemCost(
        Number(
          enterBody.reportGemCost ??
          (isAdminTest ? 0 : 15),
        ),
      );

      if (
        enterBody.submitted
      ) {
        if (isAdminTest) {
          await loadAdminResult();
        } else if (
          enterBody.reportUnlocked
        ) {
          await unlockReport();
        }

        setSubmitted(
          true,
        );
        return;
      }

      const questionResponse =
        await fetch(
          `/api/education/live-tests/questions?code=${encodeURIComponent(
            code,
          )}`,
          {
            credentials:
              "include",
          },
        );

      const questionBody =
        await questionResponse
          .json() as QuestionsResponse;

      if (
        !questionResponse.ok
      ) {
        throw new Error(
          questionBody.error ??
          "Questions could not be loaded.",
        );
      }

      setQuestionsResponse(
        questionBody,
      );

      setRemainingSeconds(
        secondsUntil(
          questionBody
            .liveTest
            .endsAt,
        ),
      );

      setStarted(
        true,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Live Test could not be opened.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  async function loadAdminResult():
    Promise<void> {
    const response =
      await fetch(
        "/api/admin/live-tests/test-101/result",
        {
          credentials:
            "include",

          cache:
            "no-store",
        },
      );

    const body =
      await response.json() as {
        result?:
          LiveTestResult;

        error?:
          string;
      };

    if (
      !response.ok ||
      !body.result
    ) {
      throw new Error(
        body.error ??
        "Admin Test #101 result could not be loaded.",
      );
    }

    setReportResult(
      body.result,
    );
  }


  async function unlockReport():
    Promise<void> {
    setLoading(
      true,
    );

    setError("");

    try {
      const response =
        await fetch(
          "/api/education/live-tests/report/unlock",
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
                code,
              }),
          },
        );

      const body =
        await response.json() as {
          result?:
            LiveTestResult;

          gemBalance?:
            number;

          error?:
            string;
        };

      if (
        !response.ok ||
        !body.result
      ) {
        throw new Error(
          body.error ??
          "Live Test report could not be opened.",
        );
      }

      setReportResult(
        body.result,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Live Test report could not be opened.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  async function submitTest(
    automatic =
      false,
  ): Promise<void> {
    if (
      submitted ||
      loading ||
      !questionsResponse
    ) {
      return;
    }

    if (
      !automatic &&
      !window.confirm(
        `Submit ${title}? ${answeredCount} of ${questionsResponse.questions.length} answered.`,
      )
    ) {
      return;
    }

    setLoading(
      true,
    );

    setError("");

    try {
      const response =
        await fetch(
          "/api/education/live-tests/submit",
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
                code,

                answers:
                  questionsResponse
                    .questions
                    .map(
                      (
                        question,
                      ) => ({
                        questionId:
                          question
                            .questionId,

                        selectedChoice:
                          answers[
                            question
                              .questionId
                          ] ??
                          null,
                      }),
                    ),
              }),
          },
        );

      const body =
        await response
          .json() as {
            error?:
              string;

            submitted?:
              boolean;

            alreadySubmitted?:
              boolean;

            questionCount?:
              number;

            answeredCount?:
              number;

            reportLocked?:
              boolean;

            reportGemCost?:
              number;
          };

      if (
        !response.ok
      ) {
        throw new Error(
          body.error ??
          "Live Test could not be submitted.",
        );
      }

      setReportGemCost(
        Number(
          body.reportGemCost ??
          (isAdminTest ? 0 : 15),
        ),
      );

      if (
        isAdminTest
      ) {
        await loadAdminResult();
      }

      setSubmitted(
        true,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Live Test could not be submitted.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  useEffect(
    () => {
      if (
        !started ||
        !questionsResponse ||
        submitted
      ) {
        return;
      }

      const update =
        (): void => {
        const remaining =
          secondsUntil(
            questionsResponse
              .liveTest
              .endsAt,
          );

        setRemainingSeconds(
          remaining,
        );

        if (
          remaining <=
            0
        ) {
          void submitTest(
            true,
          );
        }
      };

      update();

      const timer =
        window.setInterval(
          update,
          1000,
        );

      return () => {
        window.clearInterval(
          timer,
        );
      };
    },
    [
      started,
      questionsResponse,
      submitted,
    ],
  );


if (
  submitted ||
  reportResult
) {
    return (
      <main className="live-test-runner">
        <header className="live-test-runner__header">
          <button
            type="button"
            onClick={
              onBack
            }
          >
            ←
          </button>

          <strong>
            ⚡ {
              title
            }
          </strong>
        </header>

        {
          error && (
            <div className="live-test-runner__error">
              {error}
            </div>
          )
        }

        {
          reportResult
            ? (
              <section className="live-test-runner__admin-result">
                <div className="live-test-runner__result-heading">
                  <span aria-hidden="true">
                    ✓
                  </span>

                  <div>
                    <h1>
                      {
                        isAdminTest
                          ? "Admin smoke test completed"
                          : `Live Test #${code} report`
                      }
                    </h1>

                    <small>
                      Attempt #{reportResult.attemptId}
                    </small>
                  </div>
                </div>

                <div className="live-test-runner__result-score">
                  <strong>
                    {reportResult.correctCount}/{reportResult.questionCount}
                  </strong>

                  <span>
                    {reportResult.scorePercent}% correct
                  </span>
                </div>

                <div className="live-test-runner__result-facts">
                  <span>
                    ✓ {reportResult.correctCount} correct
                  </span>

                  <span>
                    ✕ {reportResult.incorrectCount} incorrect
                  </span>

                  <span>
                    ○ {reportResult.unansweredCount} unanswered
                  </span>
                </div>

                <div className="live-test-runner__result-review">
                  {
                    reportResult.questions.map(
                      (
                        question,
                      ) => (
                        <article
                          key={question.questionId}
                          className={
                            question.correct
                              ? "live-test-runner__result-question live-test-runner__result-question--correct"
                              : "live-test-runner__result-question live-test-runner__result-question--wrong"
                          }
                        >
                          <header>
                            <strong>
                              {question.questionOrder}.
                            </strong>

                            <span>
                              {question.section ?? "Question"}
                            </span>

                            <b>
                              {
                                question.correct
                                  ? "✓"
                                  : question.selectedChoice
                                    ? "✕"
                                    : "○"
                              }
                            </b>
                          </header>

                          <p>
                            {question.questionText}
                          </p>

                          <div className="live-test-runner__result-answer">
                            <span>
                              Your answer: <b>{question.selectedChoice ?? "—"}</b>
                            </span>

                            <span>
                              Correct: <b>{question.correctChoice}</b>
                            </span>
                          </div>

                          {
                            question.explanation && (
                              <small className="live-test-runner__result-explanation">
                                {question.explanation}
                              </small>
                            )
                          }
                        </article>
                      ),
                    )
                  }
                </div>

                <button
                  type="button"
                  className="live-test-runner__result-back"
                  onClick={
                    onBack
                  }
                >
                  Back to Education
                </button>
              </section>
            )
            : (
              <section className="live-test-runner__done">
                <span
                  aria-hidden="true"
                >
                  ✓
                </span>

                <h1>
                  Test submitted
                </h1>

                <p>
                  {answeredCount} of{" "}
                  {
                    questionsResponse
                      ?.questions
                      .length ??
                    0
                  } questions answered.
                </p>

                {
                  !isAdminTest &&
                  Number.isFinite(
                    scheduledEndMs,
                  ) &&
                  introClockMs > 0 &&
                  introClockMs <
                    scheduledEndMs
                    ? (
                        <small>
                          Report available after the Live Test ends ·{" "}
                          {clockCountdownText(
                            scheduledEndMs,
                            introClockMs,
                          )} remaining.
                        </small>
                      )
                    : (
                        <small>
                          Your detailed report is available for 💎{reportGemCost}.
                          Opening it charges only once.
                        </small>
                      )
                }

                <div className="live-test-runner__done-actions">
                  {
                    (
                      isAdminTest ||
                      !Number.isFinite(
                        scheduledEndMs,
                      ) ||
                      (
                        introClockMs > 0 &&
                        introClockMs >=
                          scheduledEndMs
                      )
                    ) && (
                      <button
                        type="button"
                        disabled={
                          loading
                        }
                        onClick={() =>
                          void unlockReport()
                        }
                      >
                        {
                          loading
                            ? "Opening…"
                            : `Open Report · 💎${reportGemCost}`
                        }
                      </button>
                    )
                  }

                  <button
                    type="button"
                    className="live-test-runner__secondary"
                    onClick={
                      onBack
                    }
                  >
                    Back to Education
                  </button>
                </div>
              </section>
            )
        }
      </main>
    );
  }


  return (
    <main className="live-test-runner">
      <header className="live-test-runner__header">
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
            ⚡ {
              title
            }
          </strong>

          <small>
            {
              isAdminTest
                ? "Martian clock · always open"
                : "GYAN Live"
            }
          </small>
        </div>

        {
          started && (
            <div
              className={
                remainingSeconds <=
                  60
                  ? "live-test-runner__timer live-test-runner__timer--urgent"
                  : "live-test-runner__timer"
              }
              aria-label="Time remaining"
            >
              {
                clockText(
                  remainingSeconds,
                )
              }
            </div>
          )
        }
      </header>


      {
        error && (
          <div className="live-test-runner__error">
            {
              error
            }
          </div>
        )
      }


      {
        !started
          ? (
            <section className="live-test-runner__intro">
              <div
                className="live-test-runner__intro-icon"
                aria-hidden="true"
              >
                {
                  isAdminTest
                    ? "🪐"
                    : "⚡"
                }
              </div>

              <h1>
                {
                  title
                }
              </h1>

              <p>
                {
                  isAdminTest
                    ? "Permanent admin smoke test. The event clock always began 15 minutes ago."
                    : liveSummary
                      ? isBeforeLobby
                        ? `Lobby opens 15 minutes before the test · ${scheduledDetailText(
                            liveSummary,
                            introClockMs,
                          )}`
                        : isInLobby
                          ? "Welcome to the Live Test lobby. No Gems are charged until you begin the test."
                          : scheduledDetailText(
                              liveSummary,
                              introClockMs,
                            )
                      : "Loading synchronized Live Test details…"
                }
              </p>

              {
                isInLobby && (
                  <div className="live-test-runner__lobby-clock">
                    <small>Test begins in</small>
                    <strong>
                      {
                        clockCountdownText(
                          scheduledStartMs,
                          introClockMs,
                        )
                      }
                    </strong>
                  </div>
                )
              }

              <div className="live-test-runner__facts">
                <span>
                  ⏱ {liveSummary?.durationMinutes ?? 18} min
                </span>

                <span>
                  📝 {
                    isAdminTest
                      ? 8
                      : liveSummary?.questionCount ??
                        "—"
                  } questions
                </span>

                <span>
                  {
                    isAdminTest
                      ? "💎 0"
                      : `💎 ${liveSummary?.entryGemCost ?? 5}`
                  }
                </span>
              </div>

              {
                (
                  (liveSummary?.hearts ?? 0) > 0 ||
                  simulatedParticipants > 0
                ) && (
                  <div className="live-test-runner__participants">
                    <span
                      className="live-test-runner__participants-real"
                      title="Real GYAN participants"
                    >
                      ♥{" "}
                      {(liveSummary?.hearts ?? 0).toLocaleString()}
                    </span>

                    <span
                      className="live-test-runner__participants-simulated"
                      title="Simulated participants"
                    >
                      ⚡{" "}
                      {simulatedParticipants.toLocaleString()} participants
                    </span>
                  </div>
                )
              }

              <button
                type="button"
                className="live-test-runner__start"
                disabled={
                  loading ||
                  (
                    !isScheduledOver &&
                    !canStartScheduledTest
                  )
                }
                onClick={() => {
                  if (isScheduledOver) {
                    void unlockReport();
                    return;
                  }

                  void startTest();
                }}
              >
                {
                  loading
                    ? "Opening…"
                    : isAdminTest
                      ? "Start Test"
                      : canStartScheduledTest
                        ? `Begin Test · 💎${liveSummary?.entryGemCost ?? 5}`
                        : isScheduledOver
                          ? "View Results"
                          : isInLobby
                            ? `Begins in ${clockCountdownText(
                                scheduledStartMs,
                                introClockMs,
                              )}`
                            : isBeforeLobby
                              ? `Lobby opens in ${clockCountdownText(
                                  lobbyOpensMs,
                                  introClockMs,
                                )}`
                              : "Loading…"
                }
              </button>
            </section>
          )
          : (
            <>
              <div className="live-test-runner__progress">
                <strong>
                  {
                    answeredCount
                  } / {
                    questionsResponse
                      ?.questions
                      .length ??
                    0
                  }
                </strong>

                <span>
                  answered
                </span>

                {
                  simulatedParticipants > 0 && (
                    <span className="live-test-runner__simulation-inline">
                      ⚡ {simulatedParticipants.toLocaleString()} participants
                    </span>
                  )
                }
              </div>

              <section className="live-test-runner__questions">
                {
                  questionsResponse
                    ?.questions
                    .map(
                      (
                        question,
                      ) => (
                        <article
                          key={
                            question
                              .questionId
                          }
                          className="live-test-runner__question"
                        >
                          <header>
                            <strong>
                              {
                                question
                                  .questionOrder
                              }.
                            </strong>

                            <span>
                              {
                                question
                                  .section ??
                                "Question"
                              }
                            </span>
                          </header>

                          <p>
                            {
                              question
                                .questionText
                            }
                          </p>

                          <div className="live-test-runner__choices">
                            {
                              (
                                [
                                  "A",
                                  "B",
                                  "C",
                                  "D",
                                ] as const
                              ).map(
                                (
                                  choice,
                                ) => {
                                  const selected =
                                    answers[
                                      question
                                        .questionId
                                    ] ===
                                    choice;

                                  return (
                                    <button
                                      type="button"
                                      key={
                                        choice
                                      }
                                      className={
                                        selected
                                          ? "live-test-runner__choice live-test-runner__choice--selected"
                                          : "live-test-runner__choice"
                                      }
                                      onClick={() =>
                                        setAnswers(
                                          (
                                            current,
                                          ) => ({
                                            ...current,

                                            [
                                              question
                                                .questionId
                                            ]:
                                              choice,
                                          }),
                                        )
                                      }
                                    >
                                      <b>
                                        {
                                          choice
                                        }
                                      </b>

                                      <span>
                                        {
                                          question
                                            .choices[
                                            choice
                                          ]
                                        }
                                      </span>
                                    </button>
                                  );
                                },
                              )
                            }
                          </div>
                        </article>
                      ),
                    )
                }
              </section>

              <div className="live-test-runner__submit-bar">
                <span>
                  {
                    answeredCount
                  } / {
                    questionsResponse
                      ?.questions
                      .length ??
                    0
                  } answered
                </span>

                <button
                  type="button"
                  disabled={
                    loading
                  }
                  onClick={() =>
                    void submitTest()
                  }
                >
                  {
                    loading
                      ? "Submitting…"
                      : "Submit Test"
                  }
                </button>
              </div>
            </>
          )
      }
    </main>
  );
}
