import {
  useEffect,
  useMemo,
  useRef,
  useState,
} from "react";

import ShoppingCartBuilder from "./ShoppingCartBuilder";

import {
  GuidanceInsufficientGemsError,
  loadQuestionGuidance,
  requestMoreGems,
  unlockQuestionGuidance,
  type GuidanceKind,
  type GuidanceState,
} from "../config/educationGuidance";

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


function QuestionText({
  text,
}: {
  text:
    string;
}) {
  const textRef =
    useRef<
      HTMLParagraphElement |
      null
    >(
      null,
    );

  const [
    expanded,
    setExpanded,
  ] =
    useState(
      false,
    );

  const [
    overflowing,
    setOverflowing,
  ] =
    useState(
      false,
    );

  useEffect(
    () => {
      const element =
        textRef.current;

      if (
        !element
      ) {
        return;
      }

      const measure =
        (): void => {
          if (
            expanded
          ) {
            return;
          }

          setOverflowing(
            element.scrollHeight >
              element.clientHeight +
              1,
          );
        };

      const frame =
        window.requestAnimationFrame(
          measure,
        );

      window.addEventListener(
        "resize",
        measure,
      );

      return () => {
        window.cancelAnimationFrame(
          frame,
        );

        window.removeEventListener(
          "resize",
          measure,
        );
      };
    },
    [
      text,
      expanded,
    ],
  );

  useEffect(
    () => {
      const frame =
        window.requestAnimationFrame(
          () => {
            setExpanded(
              false,
            );

            setOverflowing(
              false,
            );
          },
        );

      return () =>
        window.cancelAnimationFrame(
          frame,
        );
    },
    [
      text,
    ],
  );

  return (
    <div className="live-test-runner__question-text-wrap">
      <p
        ref={
          textRef
        }
        className={[
          "live-test-runner__question-text",
          expanded
            ? "live-test-runner__question-text--expanded"
            : "",
        ]
          .filter(
            Boolean,
          )
          .join(
            " ",
          )}
      >
        {text}
      </p>

      {
        (
          overflowing ||
          expanded
        ) && (
          <button
            type="button"
            className="live-test-runner__question-more"
            onClick={() =>
              setExpanded(
                (
                  current,
                ) =>
                  !current,
              )
            }
          >
            {
              expanded
                ? "Less"
                : "More"
            }
          </button>
        )
      }
    </div>
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
    guidanceByQuestion,
    setGuidanceByQuestion,
  ] =
    useState<
      Record<
        number,
        GuidanceState
      >
    >({});

  const [
    guidanceLoading,
    setGuidanceLoading,
  ] =
    useState<
      "TIP" |
      "FIFTY_FIFTY" |
      null
    >(null);

  const [
    guidanceNotice,
    setGuidanceNotice,
  ] =
    useState<
      "TIP" |
      "FIFTY_FIFTY" |
      null
    >(null);

  const [
    gemRequestDialog,
    setGemRequestDialog,
  ] =
    useState<{
      questionId: number;
      kind:
        GuidanceKind;
      requiredGems: number;
      gemBalance: number;
      email: string;
      sent: boolean;
      sending: boolean;
      error: string;
    } | null>(
      null,
    );

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
    questionPaper,
    setQuestionPaper,
  ] =
    useState<
      LiveQuestion[] |
      null
    >(
      null,
    );

  const questionGemCost =
    3;

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

  const [
    restoreChecked,
    setRestoreChecked,
  ] =
    useState(false);

  const [
    currentQuestionIndex,
    setCurrentQuestionIndex,
  ] =
    useState(0);

  const [
    fiveMinuteWarningShown,
    setFiveMinuteWarningShown,
  ] =
    useState(false);

  const [
    answerSaveState,
    setAnswerSaveState,
  ] =
    useState<
      "idle" |
      "saving" |
      "saved" |
      "error"
    >("idle");


  const [
    liveDialog,
    setLiveDialog,
  ] =
    useState<
      "five-minute" |
      "submit" |
      null
    >(null);


  const [
    testAccessOpen,
    setTestAccessOpen,
  ] =
    useState(false);


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


  const liveProgram =
    questionsResponse
      ?.liveTest
      .program
      ?.trim()
      .toUpperCase() ??
    liveSummary
      ?.program
      ?.trim()
      .toUpperCase() ??
    "";

  const paletteColumns =
    liveProgram ===
      "JEE"
      ? 5
      : 7;

  const currentQuestion =
    questionsResponse
      ?.questions[
        currentQuestionIndex
      ] ??
    null;

  const liveContextId =
    questionsResponse
      ?.liveTest
      .entryId ??
    null;

  const currentGuidance =
    currentQuestion
      ? guidanceByQuestion[
          currentQuestion
            .questionId
        ] ??
        null
      : null;

  const eliminatedChoices =
    new Set(
      currentGuidance
        ?.eliminatedChoices
        ?.map(
          (
            item,
          ) =>
            item.choice,
        ) ??
      [],
    );


  async function ensureGuidance(
    question:
      LiveQuestion,
  ): Promise<void> {
    if (
      isAdminTest ||
      !liveContextId ||
      guidanceByQuestion[
        question.questionId
      ]
    ) {
      return;
    }

    try {
      const next =
        await loadQuestionGuidance(
          question.questionId,
          "LIVE",
          liveContextId,
        );

      setGuidanceByQuestion(
        (
          current,
        ) => ({
          ...current,
          [
            question.questionId
          ]:
            next,
        }),
      );
    } catch (
      caught
    ) {
      console.error(
        "Unable to load question guidance:",
        caught,
      );
    }
  }


  async function unlockGuidance(
    question:
      LiveQuestion,
    kind:
      "TIP" |
      "FIFTY_FIFTY",
  ): Promise<void> {
    if (
      isAdminTest ||
      !liveContextId ||
      guidanceLoading
    ) {
      return;
    }

    setGuidanceLoading(
      kind,
    );

    setError("");

    try {
      const next =
        await unlockQuestionGuidance(
          question.questionId,
          kind,
          "LIVE",
          liveContextId,
        );

      setGuidanceByQuestion(
        (
          current,
        ) => ({
          ...current,
          [
            question.questionId
          ]:
            next,
        }),
      );

      setGuidanceNotice(
        kind,
      );

      if (
        kind ===
          "FIFTY_FIFTY" &&
        next.eliminatedChoices
          .some(
            (
              item,
            ) =>
              answers[
                question.questionId
              ] ===
              item.choice,
          )
      ) {
        setAnswers(
          (
            current,
          ) => {
            const copy = {
              ...current,
            };

            delete copy[
              question.questionId
            ];

            return copy;
          },
        );
      }
    } catch (
      caught
    ) {
      if (
        caught instanceof
          GuidanceInsufficientGemsError
      ) {
        setError("");

        setGemRequestDialog({
          questionId:
            question.questionId,
          kind,
          requiredGems:
            caught.requiredGems,
          gemBalance:
            caught.gemBalance,
          email:
            caught.contactEmail,
          sent:
            false,
          sending:
            false,
          error:
            "",
        });
      } else {
        setError(
          caught instanceof
            Error
            ? caught.message
            : "Guided help could not be opened.",
        );
      }
    } finally {
      setGuidanceLoading(
        null,
      );
    }
  }


  async function sendGemRequest():
    Promise<void> {
    if (
      !gemRequestDialog ||
      !liveContextId ||
      gemRequestDialog.sending ||
      gemRequestDialog.sent
    ) {
      return;
    }

    const email =
      gemRequestDialog.email
        .trim()
        .toLowerCase();

    if (
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/
        .test(email)
    ) {
      setGemRequestDialog(
        (
          current,
        ) =>
          current
            ? {
                ...current,
                error:
                  "Enter a valid email address.",
              }
            : current,
      );

      return;
    }

    setGemRequestDialog(
      (
        current,
      ) =>
        current
          ? {
              ...current,
              email,
              sending:
                true,
              error:
                "",
            }
          : current,
    );

    try {
      await requestMoreGems({
        email,
        questionId:
          gemRequestDialog
            .questionId,
        kind:
          gemRequestDialog
            .kind,
        contextType:
          "LIVE",
        contextId:
          liveContextId,
      });

      setGemRequestDialog(
        (
          current,
        ) =>
          current
            ? {
                ...current,
                email,
                sending:
                  false,
                sent:
                  true,
                error:
                  "",
              }
            : current,
      );
    } catch (
      caught
    ) {
      setGemRequestDialog(
        (
          current,
        ) =>
          current
            ? {
                ...current,
                sending:
                  false,
                error:
                  caught instanceof
                    Error
                    ? caught.message
                    : "Gem request could not be sent.",
              }
            : current,
      );
    }
  }


  async function loadSavedAnswers():
    Promise<void> {
    if (
      isAdminTest
    ) {
      return;
    }

    try {
      const response =
        await fetch(
          `/api/education/live-tests/answers?code=${encodeURIComponent(
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
          answers?: {
            questionId:
              number;

            selectedChoice:
              "A" |
              "B" |
              "C" |
              "D";
          }[];

          error?:
            string;
        };

      if (
        response.status ===
          404
      ) {
        return;
      }

      if (
        !response.ok
      ) {
        throw new Error(
          body.error ??
          "Saved answers could not be restored.",
        );
      }

      const restored:
        Record<
          number,
          "A" |
          "B" |
          "C" |
          "D"
        > = {};

      for (
        const answer
        of body.answers ??
        []
      ) {
        restored[
          Number(
            answer.questionId,
          )
        ] =
          answer.selectedChoice;
      }

      setAnswers(
        restored,
      );
    } catch (
      caught
    ) {
      setAnswerSaveState(
        "error",
      );

      console.error(
        "Unable to restore Live Test answers:",
        caught,
      );
    }
  }


  async function saveAnswer(
    questionId:
      number,

    selectedChoice:
      "A" |
      "B" |
      "C" |
      "D",
  ): Promise<void> {
    if (
      isAdminTest
    ) {
      setAnswerSaveState(
        "saved",
      );

      return;
    }

    setAnswerSaveState(
      "saving",
    );

    try {
      const response =
        await fetch(
          "/api/education/live-tests/answers",
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

                questionId,

                selectedChoice,
              }),
          },
        );

      const body =
        await response.json() as {
          saved?:
            boolean;

          error?:
            string;
        };

      if (
        !response.ok ||
        !body.saved
      ) {
        throw new Error(
          body.error ??
          "Answer could not be saved.",
        );
      }

      setAnswerSaveState(
        "saved",
      );
    } catch (
      caught
    ) {
      setAnswerSaveState(
        "error",
      );

      console.error(
        "Unable to save Live Test answer:",
        caught,
      );
    }
  }


  useEffect(
    () => {
      setGuidanceNotice(
        null,
      );

      if (
        !started ||
        submitted ||
        !currentQuestion
      ) {
        return;
      }

      void ensureGuidance(
        currentQuestion,
      );
    },
    // ensureGuidance reads current state; rerunning on navigation is enough.
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [
      started,
      submitted,
      currentQuestion
        ?.questionId,
      liveContextId,
    ],
  );


  function chooseAnswer(
    question:
      LiveQuestion,

    choice:
      "A" |
      "B" |
      "C" |
      "D",
  ): void {
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
    );

    void saveAnswer(
      question.questionId,
      choice,
    );
  }


  useEffect(
    () => {
      if (
        isAdminTest
      ) {
        return;
      }

      const controller =
        new AbortController();

      void fetch(
        `/api/education/live-tests/restore?code=${encodeURIComponent(
          code,
        )}`,
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
                found?:
                  boolean;

                submitted?:
                  boolean;

                reportUnlocked?:
                  boolean;

                reportGemCost?:
                  number;

                error?:
                  string;
              };

            if (
              response.status ===
              404
            ) {
              return body;
            }

            if (
              !response.ok
            ) {
              throw new Error(
                body.error ??
                "Previous Live Test attempt could not be checked.",
              );
            }

            return body;
          },
        )
        .then(
          async (
            body,
          ) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setReportGemCost(
              Number(
                body.reportGemCost ??
                15,
              ),
            );

            if (
              body.found &&
              body.submitted
            ) {
              if (
                body.reportUnlocked
              ) {
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

                      signal:
                        controller.signal,
                    },
                  );

                const reportBody =
                  await response.json() as {
                    result?:
                      LiveTestResult;

                    error?:
                      string;
                  };

                if (
                  !response.ok ||
                  !reportBody.result
                ) {
                  throw new Error(
                    reportBody.error ??
                    "Live Test report could not be reopened.",
                  );
                }

                if (
                  !controller.signal.aborted
                ) {
                  setReportResult(
                    reportBody.result,
                  );
                }
              }

              if (
                !controller.signal.aborted
              ) {
                setSubmitted(
                  true,
                );
              }
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
                : "Previous Live Test attempt could not be checked.",
            );
          },
        )
        .finally(
          () => {
            if (
              !controller.signal.aborted
            ) {
              setRestoreChecked(
                true,
              );
            }
          },
        );

      return () => {
        controller.abort();
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

      setCurrentQuestionIndex(
        0,
      );

      await loadSavedAnswers();

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


  async function unlockQuestionPaper():
    Promise<void> {
    setLoading(
      true,
    );

    setError("");

    try {
      const response =
        await fetch(
          "/api/education/live-tests/questions/unlock",
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
          questions?:
            LiveQuestion[];

          error?:
            string;
        };

      if (
        !response.ok ||
        !body.questions
      ) {
        throw new Error(
          body.error ??
          "Live Test question paper could not be opened.",
        );
      }

      setQuestionPaper(
        body.questions,
      );

      setCurrentQuestionIndex(
        0,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Live Test question paper could not be opened.",
      );
    } finally {
      setLoading(
        false,
      );
    }
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

    confirmed =
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
      !confirmed
    ) {
      setLiveDialog(
        "submit",
      );

      return;
    }

    setLiveDialog(
      null,
    );

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
            300 &&
          remaining >
            0 &&
          !fiveMinuteWarningShown
        ) {
          setFiveMinuteWarningShown(
            true,
          );

          setLiveDialog(
            "five-minute",
          );
        }

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
    // submitTest intentionally uses the latest render state;
    // restarting this timer whenever the function identity changes
    // would recreate the interval on every render.
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [
      started,
      questionsResponse,
      submitted,
      fiveMinuteWarningShown,
    ],
  );


  if (
    questionPaper
  ) {
    const paperQuestion =
      questionPaper[
        currentQuestionIndex
      ] ??
      questionPaper[0];

    const paperPaletteColumns =
      liveProgram ===
        "JEE"
        ? 5
        : 7;

    return (
      <main className="live-test-runner live-test-runner--screen">
        <header className="live-test-runner__header">
          <button
            type="button"
            onClick={() =>
              setQuestionPaper(
                null,
              )
            }
            aria-label="Back to Live Test"
          >
            ←
          </button>

          <div>
            <strong className="live-test-runner__desktop-title">
              👀 Live Test #{code}
            </strong>

            <small className="live-test-runner__desktop-title">
              Question Paper · {questionPaper.length} questions
            </small>

            <strong className="live-test-runner__mobile-title">
              GYAN · Test #{code} · {questionPaper.length} Qs
            </strong>
          </div>
        </header>

        {
          error && (
            <div className="live-test-runner__error">
              {error}
            </div>
          )
        }

        <section className="live-test-runner__cbt live-test-runner__paper-cbt">
          <div className="live-test-runner__cbt-main">
            <div className="live-test-runner__cbt-status">
              <strong>
                Question {
                  currentQuestionIndex +
                  1
                } of {
                  questionPaper.length
                }
              </strong>

              <span>
                Read-only question paper
              </span>
            </div>

            {
              paperQuestion && (
                <article
                  key={
                    paperQuestion.questionId
                  }
                  className="live-test-runner__question live-test-runner__question--cbt live-test-runner__paper-question"
                >
                  <header>
                    <strong>
                      {
                        paperQuestion.questionOrder
                      }.
                    </strong>

                    <span>
                      {
                        paperQuestion.section ??
                        "Question"
                      }
                    </span>
                  </header>

                  <QuestionText
                    text={
                      paperQuestion.questionText
                    }
                  />

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
                        ) => (
                          <div
                            key={
                              choice
                            }
                            className="live-test-runner__choice live-test-runner__paper-choice"
                          >
                            <b>
                              {
                                choice
                              }
                            </b>

                            <span>
                              {
                                paperQuestion
                                  .choices[
                                  choice
                                ]
                              }
                            </span>
                          </div>
                        ),
                      )
                    }
                  </div>

                  <nav className="live-test-runner__question-nav">
                    <button
                      type="button"
                      disabled={
                        currentQuestionIndex <=
                        0
                      }
                      onClick={() =>
                        setCurrentQuestionIndex(
                          (
                            current,
                          ) =>
                            Math.max(
                              0,
                              current -
                              1,
                            ),
                        )
                      }
                    >
                      ← Previous
                    </button>

                    <button
                      type="button"
                      disabled={
                        currentQuestionIndex >=
                        questionPaper.length -
                        1
                      }
                      onClick={() =>
                        setCurrentQuestionIndex(
                          (
                            current,
                          ) =>
                            Math.min(
                              questionPaper.length -
                              1,
                              current +
                              1,
                            ),
                        )
                      }
                    >
                      Next →
                    </button>
                  </nav>
                </article>
              )
            }

            <small className="live-test-runner__paper-note">
              Correct answers, score and explanations remain in the detailed 💎{reportGemCost} report.
            </small>
          </div>

          <aside
            className="live-test-runner__palette"
            aria-label="Question paper palette"
          >
            <div className="live-test-runner__palette-title">
              <strong>
                Questions
              </strong>

              <small>
                {
                  currentQuestionIndex +
                  1
                }/{
                  questionPaper.length
                }
              </small>
            </div>

            <div
              className="live-test-runner__palette-grid"
              style={{
                gridTemplateColumns:
                  `repeat(${paperPaletteColumns}, minmax(0, 1fr))`,
              }}
            >
              {
                questionPaper.map(
                  (
                    question,
                    index,
                  ) => {
                    const current =
                      index ===
                      currentQuestionIndex;

                    return (
                      <button
                        type="button"
                        key={
                          question.questionId
                        }
                        className={[
                          "live-test-runner__palette-item",
                          "live-test-runner__paper-palette-item",
                          current
                            ? "live-test-runner__palette-item--current"
                            : "",
                        ]
                          .filter(
                            Boolean,
                          )
                          .join(
                            " ",
                          )}
                        onClick={() =>
                          setCurrentQuestionIndex(
                            index,
                          )
                        }
                        aria-label={`Question ${index + 1}${
                          current
                            ? ", current"
                            : ""
                        }`}
                      >
                        {
                          index +
                          1
                        }
                      </button>
                    );
                  },
                )
              }
            </div>

            <button
              type="button"
              className="live-test-runner__paper-back"
              onClick={() =>
                setQuestionPaper(
                  null,
                )
              }
            >
              Back to Live Test
            </button>
          </aside>
        </section>
      </main>
    );
  }


  if (
    submitted
  ) {
    return (
      <main className="live-test-runner live-test-runner--screen">
        <header className="live-test-runner__header">
          <button
            type="button"
            onClick={
              onBack
            }
          >
            ←
          </button>

          <strong className="live-test-runner__desktop-title">
            ⚡ {
              title
            }
          </strong>

          <strong className="live-test-runner__mobile-title">
            GYAN · Test #{code} · {
              reportResult
                ? "Results"
                : "Submitted"
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

                          <QuestionText
                            text={
                              question.questionText
                            }
                          />

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

                <small>
                  Your detailed report is available for 💎{reportGemCost}.
                  Opening it charges only once.
                </small>

                <div className="live-test-runner__done-actions">
                  {
                    !isAdminTest && (
                      <button
                        type="button"
                        className="live-test-runner__question-paper-button"
                        disabled={
                          loading
                        }
                        onClick={() =>
                          void unlockQuestionPaper()
                        }
                      >
                        {
                          loading
                            ? "Opening…"
                            : `👀 View Questions · 💎${questionGemCost}`
                        }
                      </button>
                    )
                  }

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
    <main className="live-test-runner live-test-runner--screen">
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
          <strong className="live-test-runner__desktop-title">
            ⚡ {
              title
            }
          </strong>

          <small className="live-test-runner__desktop-title">
            {
              isAdminTest
                ? "Martian clock · always open"
                : "GYAN Live"
            }
          </small>

          <strong className="live-test-runner__mobile-title">
            {
              isAdminTest
                ? "GYAN · Admin Test #101"
                : `GYAN · Live Test #${code}${
                    questionsResponse
                      ? ` · ${questionsResponse.questions.length} Qs`
                      : ""
                  }`
            }
          </strong>
        </div>

        {
          started && (
            <div
              className={
                remainingSeconds <=
                  60
                  ? "live-test-runner__timer live-test-runner__timer--urgent"
                  : remainingSeconds <=
                      300
                    ? "live-test-runner__timer live-test-runner__timer--warning"
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
        testAccessOpen && (
          <div
            role="presentation"
            onMouseDown={() =>
              setTestAccessOpen(
                false,
              )
            }
            style={{
              position:
                "fixed",
              inset:
                0,
              zIndex:
                1500,
              display:
                "grid",
              placeItems:
                "start center",
              padding:
                "58px 12px 12px",
              background:
                "rgba(15, 23, 42, 0.42)",
            }}
          >
            <section
              role="dialog"
              aria-modal="true"
              aria-label="Test Access"
              onMouseDown={(
                event,
              ) =>
                event.stopPropagation()
              }
              style={{
                width:
                  "min(100%, 780px)",
                maxHeight:
                  "calc(100vh - 70px)",
                overflowY:
                  "auto",
                borderRadius:
                  "14px",
                background:
                  "#fff",
                boxShadow:
                  "0 20px 50px rgba(15,23,42,0.25)",
              }}
            >
              <ShoppingCartBuilder
                initialProgram={
                  liveSummary
                    ?.program ??
                  ""
                }
                initialLiveTestCode={
                  code
                }
                onClose={() =>
                  setTestAccessOpen(
                    false,
                  )
                }
              />
            </section>
          </div>
        )
      }


      {
        liveDialog && (
          <div
            className="live-test-runner__dialog-backdrop"
            role="presentation"
            onMouseDown={() =>
              setLiveDialog(
                null,
              )
            }
          >
            <section
              className="live-test-runner__dialog"
              role="dialog"
              aria-modal="true"
              aria-labelledby="live-test-dialog-title"
              onMouseDown={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <button
                type="button"
                className="live-test-runner__dialog-x"
                aria-label="Close"
                onClick={() =>
                  setLiveDialog(
                    null,
                  )
                }
              >
                ×
              </button>

              <small>
                GYAN LIVE
              </small>

              <h2
                id="live-test-dialog-title"
              >
                {
                  liveDialog ===
                    "five-minute"
                    ? "⏱ 5 minutes remaining"
                    : "Submit Test?"
                }
              </h2>

              {
                liveDialog ===
                  "five-minute"
                  ? (
                      <p>
                        Your answers are being saved automatically.
                        Please continue with the test.
                      </p>
                    )
                  : (
                      <p>
                        {
                          answeredCount
                        } of {
                          questionsResponse
                            ?.questions
                            .length ??
                          0
                        } answered
                        {
                          (
                            questionsResponse
                              ?.questions
                              .length ??
                            0
                          ) -
                            answeredCount >
                          0
                            ? ` · ${
                                (
                                  questionsResponse
                                    ?.questions
                                    .length ??
                                  0
                                ) -
                                answeredCount
                              } unanswered`
                            : " · All questions answered"
                        }.
                      </p>
                    )
              }

              <div className="live-test-runner__dialog-actions">
                {
                  liveDialog ===
                    "five-minute"
                    ? (
                        <button
                          type="button"
                          className="live-test-runner__dialog-primary"
                          onClick={() =>
                            setLiveDialog(
                              null,
                            )
                          }
                        >
                          Continue
                        </button>
                      )
                    : (
                        <>
                          <button
                            type="button"
                            onClick={() =>
                              setLiveDialog(
                                null,
                              )
                            }
                          >
                            Continue Test
                          </button>

                          <button
                            type="button"
                            className="live-test-runner__dialog-primary"
                            onClick={() =>
                              void submitTest(
                                false,
                                true,
                              )
                            }
                          >
                            Submit Test
                          </button>
                        </>
                      )
                }
              </div>
            </section>
          </div>
        )
      }


      {
        gemRequestDialog && (
          <div
            className="live-test-runner__guidance-toast-backdrop"
            role="presentation"
          >
            <section
              className="live-test-runner__guidance-toast live-test-runner__gem-request-dialog"
              role="dialog"
              aria-modal="true"
              aria-label="More Gems needed"
            >
              <button
                type="button"
                className="live-test-runner__guidance-toast-close"
                aria-label="Close"
                disabled={
                  gemRequestDialog.sending
                }
                onClick={() =>
                  setGemRequestDialog(
                    null,
                  )
                }
              >
                ×
              </button>

              {
                gemRequestDialog.sent
                  ? (
                    <>
                      <div className="live-test-runner__guidance-toast-title">
                        <span
                          aria-hidden="true"
                        >
                          ✓
                        </span>

                        <strong>
                          Request sent
                        </strong>
                      </div>

                      <p className="live-test-runner__gem-request-note">
                        Request sent · You may continue the test.
                      </p>

                      <div className="live-test-runner__gem-request-actions">
                        <button
                          type="button"
                          onClick={() =>
                            setGemRequestDialog(
                              null,
                            )
                          }
                        >
                          Continue
                        </button>
                      </div>
                    </>
                  )
                  : (
                    <>
                      <div className="live-test-runner__guidance-toast-title">
                        <span
                          aria-hidden="true"
                        >
                          💎
                        </span>

                        <strong>
                          Insufficient Gems
                        </strong>
                      </div>

                      <p className="live-test-runner__gem-request-balance">
                        {
                          gemRequestDialog.kind ===
                            "TIP"
                            ? "Tip"
                            : "50/50"
                        } needs 💎{
                          gemRequestDialog.requiredGems
                        } · Balance 💎{
                          gemRequestDialog.gemBalance
                        }
                      </p>

                      <p className="live-test-runner__gem-request-note">
                        Test access remains active.
                      </p>

                      <label className="live-test-runner__gem-request-email">
                        <span>
                          Email
                        </span>

                        <input
                          type="email"
                          autoComplete="email"
                          value={
                            gemRequestDialog.email
                          }
                          disabled={
                            gemRequestDialog.sending
                          }
                          placeholder="student@example.com"
                          onChange={(
                            event,
                          ) =>
                            setGemRequestDialog(
                              (
                                current,
                              ) =>
                                current
                                  ? {
                                      ...current,
                                      email:
                                        event.target.value,
                                      error:
                                        "",
                                    }
                                  : current,
                            )
                          }
                        />
                      </label>

                      {
                        gemRequestDialog.error && (
                          <div className="live-test-runner__gem-request-error">
                            {
                              gemRequestDialog.error
                            }
                          </div>
                        )
                      }

                      <div className="live-test-runner__gem-request-actions">
                        <button
                          type="button"
                          disabled={
                            gemRequestDialog.sending
                          }
                          onClick={() =>
                            setGemRequestDialog(
                              null,
                            )
                          }
                        >
                          Continue
                        </button>

                        <button
                          type="button"
                          className="live-test-runner__gem-request-primary"
                          disabled={
                            gemRequestDialog.sending
                          }
                          onClick={() =>
                            void sendGemRequest()
                          }
                        >
                          {
                            gemRequestDialog.sending
                              ? "Sending…"
                              : "Contact Admin"
                          }
                        </button>
                      </div>
                    </>
                  )
              }
            </section>
          </div>
        )
      }


      {
        guidanceNotice &&
        currentGuidance &&
        currentQuestion && (
          <div
            className="live-test-runner__guidance-toast-backdrop"
            role="presentation"
            onMouseDown={() =>
              setGuidanceNotice(
                null,
              )
            }
          >
            <section
              className="live-test-runner__guidance-toast"
              role="dialog"
              aria-modal="true"
              aria-label={
                guidanceNotice ===
                  "TIP"
                  ? "GYAN Tip"
                  : "50/50 explanation"
              }
              onMouseDown={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <button
                type="button"
                className="live-test-runner__guidance-toast-close"
                aria-label="Close"
                onClick={() =>
                  setGuidanceNotice(
                    null,
                  )
                }
              >
                ×
              </button>

              {
                guidanceNotice ===
                  "TIP"
                  ? (
                    <>
                      <div className="live-test-runner__guidance-toast-title">
                        <span aria-hidden="true">
                          💡
                        </span>

                        <strong>
                          GYAN Tip
                        </strong>
                      </div>

                      <p>
                        {
                          currentGuidance
                            .tipText ??
                          "Tip unlocked."
                        }
                      </p>
                    </>
                  )
                  : (
                    <>
                      <div className="live-test-runner__guidance-toast-title">
                        <span
                          className="live-test-runner__fifty-rect-icon live-test-runner__fifty-rect-icon--toast"
                          aria-hidden="true"
                        />

                        <strong>
                          Two choices eliminated
                        </strong>
                      </div>

                      <div className="live-test-runner__guidance-toast-eliminations">
                        {
                          currentGuidance
                            .eliminatedChoices
                            .map(
                              (
                                item,
                              ) => (
                                <div
                                  key={
                                    item.choice
                                  }
                                >
                                  <b>
                                    ✕ {
                                      item.choice
                                    }
                                  </b>

                                  <span>
                                    {
                                      item.reason
                                    }
                                  </span>
                                </div>
                              ),
                            )
                        }
                      </div>
                    </>
                  )
              }
            </section>
          </div>
        )
      }


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
                      : !restoreChecked
                        ? "Checking your previous Live Test attempt…"
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
                  📝 {isAdminTest ? 8 : "Live"} questions
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
                simulatedParticipants > 0 && (
                  <small className="live-test-runner__simulation">
                    🧪 {simulatedParticipants.toLocaleString()} simulated participants
                  </small>
                )
              }

              <button
                type="button"
                className="live-test-runner__start"
                disabled={
                  loading ||
                  !canStartScheduledTest
                }
                onClick={() =>
                  void startTest()
                }
              >
                {
                  loading
                    ? "Opening…"
                    : isAdminTest
                      ? "Start Test"
                      : canStartScheduledTest
                        ? `Begin Test · 💎${liveSummary?.entryGemCost ?? 5}`
                        : isScheduledOver
                          ? "Test Ended"
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

              {
                isScheduledOver &&
                !isAdminTest && (
                  <div className="live-test-runner__done-actions">
                    <button
                      type="button"
                      className="live-test-runner__question-paper-button"
                      disabled={
                        loading
                      }
                      onClick={() =>
                        void unlockQuestionPaper()
                      }
                    >
                      {
                        loading
                          ? "Opening…"
                          : `👀 View Questions · 💎${questionGemCost}`
                      }
                    </button>
                  </div>
                )
              }

              {
                !isAdminTest && (
                  <div
                    style={{
                      width:
                        "100%",
                      marginTop:
                        "10px",
                    }}
                  >
                    <button
                      type="button"
                      onClick={() =>
                        setTestAccessOpen(
                          true,
                        )
                      }
                      style={{
                        padding:
                          "4px 2px",
                        border:
                          0,
                        background:
                          "transparent",
                        color:
                          "#475569",
                        font:
                          "inherit",
                        fontSize:
                          "0.8rem",
                        fontWeight:
                          700,
                        textDecoration:
                          "underline",
                        cursor:
                          "pointer",
                      }}
                    >
                      View test access options
                    </button>
                  </div>
                )
              }
            </section>
          )
          : (
            <>
              <section className="live-test-runner__cbt">
                <div className="live-test-runner__cbt-main">
                  <div className="live-test-runner__cbt-status">
                    <div className="live-test-runner__question-status-left">
                      <strong className="live-test-runner__question-count">
                        Question {
                          currentQuestionIndex +
                          1
                        } of {
                          questionsResponse
                            ?.questions
                            .length ??
                          0
                        }
                      </strong>

                      {
                        !isAdminTest &&
                        currentQuestion &&
                        currentGuidance &&
                        !currentGuidance
                          .challengeMode && (
                          <div className="live-test-runner__guidance-mini">
                            {
                              currentGuidance
                                .tipAvailable && (
                                <button
                                  type="button"
                                  className={[
                                    "live-test-runner__guidance-mini-button",
                                    currentGuidance
                                      .tipUnlocked
                                      ? "live-test-runner__guidance-mini-button--unlocked"
                                      : "",
                                  ]
                                    .filter(
                                      Boolean,
                                    )
                                    .join(
                                      " ",
                                    )}
                                  disabled={
                                    guidanceLoading !==
                                    null
                                  }
                                  title={
                                    currentGuidance
                                      .tipUnlocked
                                      ? "Show Tip"
                                      : `Unlock Tip${
                                          currentGuidance
                                            .tipGemCost >
                                          0
                                            ? ` · 💎${currentGuidance.tipGemCost}`
                                            : ""
                                        }`
                                  }
                                  aria-label={
                                    currentGuidance
                                      .tipUnlocked
                                      ? "Show Tip"
                                      : `Unlock Tip${
                                          currentGuidance
                                            .tipGemCost >
                                          0
                                            ? ` for ${currentGuidance.tipGemCost} Gem`
                                            : ""
                                        }`
                                  }
                                  onClick={() => {
                                    if (
                                      currentGuidance
                                        .tipUnlocked
                                    ) {
                                      setGuidanceNotice(
                                        "TIP",
                                      );
                                    } else {
                                      void unlockGuidance(
                                        currentQuestion,
                                        "TIP",
                                      );
                                    }
                                  }}
                                >
                                  <span aria-hidden="true">
                                    💡
                                  </span>

                                  <span>
                                    Tip
                                  </span>

                                  {
                                    !currentGuidance
                                      .tipUnlocked &&
                                    currentGuidance
                                      .tipGemCost >
                                      0 && (
                                      <span className="live-test-runner__guidance-gem">
                                        💎{
                                          currentGuidance
                                            .tipGemCost
                                        }
                                      </span>
                                    )
                                  }
                                </button>
                              )
                            }

                            {
                              currentGuidance
                                .fiftyFiftyAvailable && (
                                <button
                                  type="button"
                                  className={[
                                    "live-test-runner__guidance-mini-button",
                                    "live-test-runner__guidance-mini-button--fifty",
                                    currentGuidance
                                      .fiftyFiftyUnlocked
                                      ? "live-test-runner__guidance-mini-button--unlocked"
                                      : "",
                                  ]
                                    .filter(
                                      Boolean,
                                    )
                                    .join(
                                      " ",
                                    )}
                                  disabled={
                                    guidanceLoading !==
                                    null
                                  }
                                  title={
                                    currentGuidance
                                      .fiftyFiftyUnlocked
                                      ? "Show 50/50 explanation"
                                      : `Use 50/50${
                                          currentGuidance
                                            .fiftyFiftyGemCost >
                                          0
                                            ? ` · 💎${currentGuidance.fiftyFiftyGemCost}`
                                            : ""
                                        }`
                                  }
                                  aria-label={
                                    currentGuidance
                                      .fiftyFiftyUnlocked
                                      ? "Show 50/50 explanation"
                                      : `Use 50/50${
                                          currentGuidance
                                            .fiftyFiftyGemCost >
                                          0
                                            ? ` for ${currentGuidance.fiftyFiftyGemCost} Gem`
                                            : ""
                                        }`
                                  }
                                  onClick={() => {
                                    if (
                                      currentGuidance
                                        .fiftyFiftyUnlocked
                                    ) {
                                      setGuidanceNotice(
                                        "FIFTY_FIFTY",
                                      );
                                    } else {
                                      void unlockGuidance(
                                        currentQuestion,
                                        "FIFTY_FIFTY",
                                      );
                                    }
                                  }}
                                >
                                  <span
                                    className="live-test-runner__fifty-rect-icon"
                                    aria-hidden="true"
                                  />

                                  <span>
                                    50/50
                                  </span>

                                  {
                                    !currentGuidance
                                      .fiftyFiftyUnlocked &&
                                    currentGuidance
                                      .fiftyFiftyGemCost >
                                      0 && (
                                      <span className="live-test-runner__guidance-gem">
                                        💎{
                                          currentGuidance
                                            .fiftyFiftyGemCost
                                        }
                                      </span>
                                    )
                                  }
                                </button>
                              )
                            }
                          </div>
                        )
                      }
                    </div>

                    <span>
                      {
                        answeredCount
                      }/{
                        questionsResponse
                          ?.questions
                          .length ??
                        0
                      } answered
                    </span>

                    <small
                      className={`live-test-runner__save-state live-test-runner__save-state--${answerSaveState}`}
                    >
                      {
                        answerSaveState ===
                          "saving"
                          ? "Saving…"
                          : answerSaveState ===
                              "saved"
                            ? "✓ Saved"
                            : answerSaveState ===
                                "error"
                              ? "⚠ Save retry needed"
                              : ""
                      }
                    </small>
                  </div>

                  {
                    currentQuestion && (
                      <article
                        key={
                          currentQuestion
                            .questionId
                        }
                        className="live-test-runner__question live-test-runner__question--cbt"
                      >
                        <header>
                          <strong>
                            {
                              currentQuestion
                                .questionOrder
                            }.
                          </strong>

                          <span>
                            {
                              currentQuestion
                                .section ??
                              "Question"
                            }
                          </span>
                        </header>

                        <QuestionText
                          text={
                            currentQuestion.questionText
                          }
                        />

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
                                    currentQuestion
                                      .questionId
                                  ] ===
                                  choice;

                                const eliminated =
                                  eliminatedChoices
                                    .has(
                                      choice,
                                    );

                                return (
                                  <button
                                    type="button"
                                    key={
                                      choice
                                    }
                                    disabled={
                                      eliminated
                                    }
                                    className={[
                                      "live-test-runner__choice",
                                      selected
                                        ? "live-test-runner__choice--selected"
                                        : "",
                                      eliminated
                                        ? "live-test-runner__choice--eliminated"
                                        : "",
                                    ]
                                      .filter(
                                        Boolean,
                                      )
                                      .join(
                                        " ",
                                      )}
                                    onClick={() =>
                                      chooseAnswer(
                                        currentQuestion,
                                        choice,
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
                                        currentQuestion
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

                        <nav className="live-test-runner__question-nav">
                          <button
                            type="button"
                            disabled={
                              currentQuestionIndex <=
                              0
                            }
                            onClick={() =>
                              setCurrentQuestionIndex(
                                (
                                  current,
                                ) =>
                                  Math.max(
                                    0,
                                    current -
                                      1,
                                  ),
                              )
                            }
                          >
                            ← Previous
                          </button>

                          <button
                            type="button"
                            disabled={
                              !questionsResponse ||
                              currentQuestionIndex >=
                                questionsResponse
                                  .questions
                                  .length -
                                  1
                            }
                            onClick={() =>
                              setCurrentQuestionIndex(
                                (
                                  current,
                                ) =>
                                  Math.min(
                                    (
                                      questionsResponse
                                        ?.questions
                                        .length ??
                                      1
                                    ) -
                                      1,
                                    current +
                                      1,
                                  ),
                              )
                            }
                          >
                            Save & Next →
                          </button>
                        </nav>
                      </article>
                    )
                  }
                </div>

                <aside
                  className="live-test-runner__palette"
                  aria-label="Question palette"
                >
                  <div className="live-test-runner__palette-title">
                    <strong>
                      Questions
                    </strong>

                    <small>
                      {
                        answeredCount
                      }/{
                        questionsResponse
                          ?.questions
                          .length ??
                        0
                      }
                    </small>
                  </div>

                  <div
                    className="live-test-runner__palette-grid"
                    style={{
                      gridTemplateColumns:
                        `repeat(${paletteColumns}, minmax(0, 1fr))`,
                    }}
                  >
                    {
                      questionsResponse
                        ?.questions
                        .map(
                          (
                            question,
                            index,
                          ) => {
                            const answered =
                              Boolean(
                                answers[
                                  question
                                    .questionId
                                ],
                              );

                            const current =
                              index ===
                              currentQuestionIndex;

                            return (
                              <button
                                type="button"
                                key={
                                  question
                                    .questionId
                                }
                                className={[
                                  "live-test-runner__palette-item",

                                  answered
                                    ? "live-test-runner__palette-item--answered"
                                    : "live-test-runner__palette-item--unanswered",

                                  current
                                    ? "live-test-runner__palette-item--current"
                                    : "",
                                ]
                                  .filter(
                                    Boolean,
                                  )
                                  .join(
                                    " ",
                                  )}
                                onClick={() =>
                                  setCurrentQuestionIndex(
                                    index,
                                  )
                                }
                                aria-label={`Question ${index + 1}${
                                  answered
                                    ? ", answered"
                                    : ", unanswered"
                                }${
                                  current
                                    ? ", current"
                                    : ""
                                }`}
                              >
                                {
                                  index +
                                  1
                                }
                              </button>
                            );
                          },
                        )
                    }
                  </div>

                  <button
                    type="button"
                    className="live-test-runner__palette-submit"
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
                        : "✓ Submit"
                    }
                  </button>
                </aside>
              </section>

            </>
          )
      }
    </main>
  );
}
