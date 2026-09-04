import {
  useEffect,
  useState,
} from "react";

import {
  loadFixedMockTest,
  scoreFixedMockTest,
  type FixedMockScore,
  type FixedMockTest,
} from "../config/educationMockTests";

import "./MockTestsPage.css";

type MockProgram =
  | "JEE"
  | "NEET";

interface MockTestsPageProps {
  program:
    MockProgram;

  activeGyanCode?:
    string;

  activeGyanEmailKnown?:
    boolean;

  onBack:
    () => void;
}

type SelectedMock = {
  label: string;
  variant?: string;
};

type LockedTest = {
  label: string;
  variant?: string;
};

const FULL_TESTS =
  Array.from(
    {
      length: 8,
    },
    (
      _,
      index,
    ) => index + 1,
  );

const MINI_TESTS =
  [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
  ];


type CbtActionDialog =
  | {
      kind:
        "save";
    }
  | {
      kind:
        "submit";
    }
  | {
      kind:
        "protect";
      stage:
        25 |
        50 |
        "submit";
    }
  | {
      kind:
        "info";
      title:
        string;
      message:
        string;
    };


type FixedCbtDraft = {
  answers:
    Record<number, string>;
  reviewQuestionIds:
    number[];
  currentQuestionId:
    number | null;
  elapsedSeconds:
    number;
  saveCount:
    number;
  savedAtMs:
    number | null;
  updatedAt:
    number;
};


function fixedCbtDraftKey(
  test: FixedMockTest,
): string {
  return [
    "gyan_cbt_draft_v1",
    test.programCode,
    test.kind,
    test.testCode,
    test.level,
    test.version,
  ].join(
    ":",
  );
}


function loadFixedCbtDraft(
  test: FixedMockTest,
): FixedCbtDraft | null {
  try {
    const raw =
      window.localStorage.getItem(
        fixedCbtDraftKey(
          test,
        ),
      );

    if (!raw) {
      return null;
    }

    const parsed =
      JSON.parse(
        raw,
      ) as Partial<FixedCbtDraft>;

    return {
      answers:
        parsed.answers &&
        typeof parsed.answers ===
          "object"
          ? parsed.answers
          : {},
      reviewQuestionIds:
        Array.isArray(
          parsed.reviewQuestionIds,
        )
          ? parsed.reviewQuestionIds
              .map(
                Number,
              )
              .filter(
                Number.isFinite,
              )
          : [],
      currentQuestionId:
        typeof parsed.currentQuestionId ===
          "number"
          ? parsed.currentQuestionId
          : null,
      elapsedSeconds:
        Math.max(
          0,
          Number(
            parsed.elapsedSeconds ??
            0,
          ) ||
          0,
        ),
      saveCount:
        Math.max(
          0,
          Math.min(
            5,
            Number(
              parsed.saveCount ??
              0,
            ) ||
            0,
          ),
        ),
      savedAtMs:
        typeof parsed.savedAtMs ===
          "number"
          ? parsed.savedAtMs
          : null,
      updatedAt:
        Number(
          parsed.updatedAt ??
          0,
        ) ||
        0,
    };
  } catch {
    return null;
  }
}


function formatCbtTime(
  totalSeconds:
    number,
): string {
  const safe =
    Math.max(
      0,
      Math.floor(
        totalSeconds,
      ),
    );

  const hours =
    Math.floor(
      safe /
      3600,
    );

  const minutes =
    Math.floor(
      (
        safe %
        3600
      ) /
      60,
    );

  const seconds =
    safe %
    60;

  return [
    hours,
    minutes,
    seconds,
  ]
    .map(
      (value) =>
        String(
          value,
        ).padStart(
          2,
          "0",
        ),
    )
    .join(
      ":",
    );
}


export default function MockTestsPage({
  program,
  activeGyanCode,
  activeGyanEmailKnown,
  onBack,
}: MockTestsPageProps) {
  const [
    selected,
    setSelected,
  ] =
    useState<
      SelectedMock |
      null
    >(
      null,
    );

  const [
    lockedTest,
    setLockedTest,
  ] =
    useState<
      LockedTest |
      null
    >(
      null,
    );

  const [
    accessCode,
    setAccessCode,
  ] =
    useState("");

  const [
    requestEmail,
    setRequestEmail,
  ] =
    useState("");

  const [
    dialogMessage,
    setDialogMessage,
  ] =
    useState("");

  const [
    fixedTest,
    setFixedTest,
  ] =
    useState<
      FixedMockTest |
      null
    >(
      null,
    );

  const [
    fixedAnswers,
    setFixedAnswers,
  ] =
    useState<
      Record<
        number,
        string
      >
    >(
      {},
    );

  const [
    fixedScore,
    setFixedScore,
  ] =
    useState<
      FixedMockScore |
      null
    >(
      null,
    );

  const [
    runnerLoading,
    setRunnerLoading,
  ] =
    useState(
      false,
    );

  const [
    runnerError,
    setRunnerError,
  ] =
    useState("");

  const [
    currentFixedQuestionId,
    setCurrentFixedQuestionId,
  ] =
    useState<number | null>(
      null,
    );

  const [
    reviewQuestionIds,
    setReviewQuestionIds,
  ] =
    useState<
      number[]
    >(
      [],
    );

  const [
    elapsedCbtSeconds,
    setElapsedCbtSeconds,
  ] =
    useState(
      0,
    );

  const [
    cbtDraftReady,
    setCbtDraftReady,
  ] =
    useState(
      false,
    );

  const [
    cbtSaveCount,
    setCbtSaveCount,
  ] =
    useState(
      0,
    );

  const [
    cbtActionDialog,
    setCbtActionDialog,
  ] =
    useState<
      CbtActionDialog |
      null
    >(
      null,
    );

  const [
    cumulativeAnsweredCount,
    setCumulativeAnsweredCount,
  ] =
    useState(
      0,
    );

  const [
    protection25Shown,
    setProtection25Shown,
  ] =
    useState(
      false,
    );

  const [
    protection50Shown,
    setProtection50Shown,
  ] =
    useState(
      false,
    );

  const [
    recoveryEmail,
    setRecoveryEmail,
  ] =
    useState("");

  const [
    recoveryEmailError,
    setRecoveryEmailError,
  ] =
    useState("");

  const [
    recoveryEmailSending,
    setRecoveryEmailSending,
  ] =
    useState(
      false,
    );

  const [
    recoveryEmailSubmitted,
    setRecoveryEmailSubmitted,
  ] =
    useState(
      false,
    );

  const gyanRecoveryProtected =
    activeGyanEmailKnown ===
      true ||
    recoveryEmailSubmitted;

  const currentMockAnsweredCount =
    Object.values(
      fixedAnswers,
    ).filter(
      Boolean,
    ).length;


  const isJee =
    program === "JEE";

  const cbtTimeLimitSeconds =
    fixedTest?.kind ===
      "FULL"
      ? 180 *
        60
      : 0;

  const cbtRemainingSeconds =
    Math.max(
      0,
      cbtTimeLimitSeconds -
      elapsedCbtSeconds,
    );


  useEffect(
    () => {
      if (
        !fixedTest ||
        fixedTest.kind !==
          "FULL" ||
        fixedScore ||
        !cbtDraftReady ||
        cbtRemainingSeconds <=
          0
      ) {
        return;
      }

      const interval =
        window.setInterval(
          () => {
            setElapsedCbtSeconds(
              (
                current,
              ) =>
                Math.min(
                  cbtTimeLimitSeconds,
                  current +
                    1,
                ),
            );
          },
          1000,
        );

      return () => {
        window.clearInterval(
          interval,
        );
      };
    },
    [
      fixedTest,
      fixedScore,
      cbtDraftReady,
      cbtRemainingSeconds,
      cbtTimeLimitSeconds,
    ],
  );


  useEffect(
    () => {
      if (
        !fixedTest ||
        fixedTest.kind !==
          "FULL" ||
        !cbtDraftReady
      ) {
        return;
      }

      const draft:
        FixedCbtDraft = {
        answers:
          fixedAnswers,
        reviewQuestionIds,
        currentQuestionId:
          currentFixedQuestionId,
        elapsedSeconds:
          elapsedCbtSeconds,
        saveCount:
          cbtSaveCount,
        savedAtMs:
          null,
        updatedAt:
          Date.now(),
      };

      try {
        window.localStorage.setItem(
          fixedCbtDraftKey(
            fixedTest,
          ),
          JSON.stringify(
            draft,
          ),
        );
      } catch {
        // Browser storage failure must not block the exam.
      }
    },
    [
      fixedTest,
      fixedAnswers,
      reviewQuestionIds,
      currentFixedQuestionId,
      elapsedCbtSeconds,
      cbtDraftReady,
      cbtSaveCount,
    ],
  );


  useEffect(
    () => {
      if (
        !fixedTest ||
        fixedTest.kind !==
          "FULL" ||
        fixedScore ||
        !cbtDraftReady ||
        cbtTimeLimitSeconds <=
          0 ||
        elapsedCbtSeconds <
          cbtTimeLimitSeconds
      ) {
        return;
      }

      void submitFixedTest();
    },
    [
      fixedTest,
      fixedScore,
      cbtDraftReady,
      elapsedCbtSeconds,
      cbtTimeLimitSeconds,
    ],
  );


  function showProtectionMilestoneIfNeeded(
    totalAnsweredCount:
      number,

    milestone25Shown:
      boolean,

    milestone50Shown:
      boolean,

    emailProtected:
      boolean,
  ): void {
    if (
      !fixedTest ||
      fixedScore ||
      emailProtected ||
      gyanRecoveryProtected ||
      cbtActionDialog
    ) {
      return;
    }

    if (
      totalAnsweredCount >=
        50 &&
      !milestone50Shown
    ) {
      setProtection50Shown(
        true,
      );

      setCbtActionDialog({
        kind:
          "protect",
        stage:
          50,
      });

      return;
    }

    if (
      totalAnsweredCount >=
        25 &&
      !milestone25Shown &&
      !milestone50Shown
    ) {
      setProtection25Shown(
        true,
      );

      setCbtActionDialog({
        kind:
          "protect",
        stage:
          25,
      });
    }
  }




  async function markProtectionShown(
    milestone:
      25 |
      50,
  ): Promise<void> {
    const studentCode =
      activeGyanCode
        ?.trim()
        .toUpperCase() ??
      "";

    if (!studentCode) {
      return;
    }

    try {
      await fetch(
        "/api/education/protection-milestone",
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
              studentCode,
              milestone,
            }),
        },
      );
    } catch {
      // Local state still prevents repeated prompts this session.
    }
  }


  useEffect(
    () => {
      const studentCode =
        activeGyanCode
          ?.trim()
          .toUpperCase() ??
        "";

      if (
        !fixedTest ||
        !studentCode
      ) {
        return;
      }

      let cancelled =
        false;

      void (
        async () => {
          try {
            const response =
              await fetch(
                `/api/education/protection-status?student=${encodeURIComponent(
                  studentCode,
                )}`,
                {
                  credentials:
                    "include",
                  cache:
                    "no-store",
                },
              );

            if (
              !response.ok ||
              cancelled
            ) {
              return;
            }

            const body =
              await response.json() as {
                protection?: {
                  answeredCount?: number;
                  emailProtected?: boolean;
                  milestone25Shown?: boolean;
                  milestone50Shown?: boolean;
                };
              };

            const status =
              body.protection;

            if (
              !status ||
              cancelled
            ) {
              return;
            }

            setCumulativeAnsweredCount(
              Math.max(
                0,
                Number(
                  status.answeredCount ??
                  0,
                ),
              ),
            );

            setProtection25Shown(
              Boolean(
                status.milestone25Shown,
              ),
            );

            setProtection50Shown(
              Boolean(
                status.milestone50Shown,
              ),
            );

            if (
              status.emailProtected
            ) {
              setRecoveryEmailSubmitted(
                true,
              );
            }

            showProtectionMilestoneIfNeeded(
              Math.max(
                0,
                Number(
                  status.answeredCount ??
                  0,
                ),
              ) +
                currentMockAnsweredCount,

              Boolean(
                status.milestone25Shown,
              ),

              Boolean(
                status.milestone50Shown,
              ),

              Boolean(
                status.emailProtected,
              ),
            );
          } catch {
            /*
             * Protection status is helpful but must never
             * interrupt the mock-test runner.
             */
          }
        }
      )();

      return () => {
        cancelled =
          true;
      };
    },
    [
      fixedTest
        ?.id,
      activeGyanCode,
    ],
  );






  async function openFixedTest(
    options: {
      kind:
        "FULL" |
        "MINI";
      testCode:
        string;
      level:
        "MAIN" |
        "ADVANCED" |
        "NEET";
    },
  ): Promise<void> {
    setRunnerLoading(
      true,
    );

    setRunnerError("");
    setFixedScore(
      null,
    );

    try {
      const test =
        await loadFixedMockTest({
          program,

          kind:
            options.kind,

          testCode:
            options.testCode,

          level:
            options.level,

          version:
            1,
        });

      /*
       * Keep the learner-facing JEE order deterministic:
       *
       *   Mathematics  → Physics → Chemistry
       *   Q1–25          Q26–50    Q51–75
       *
       * The backend question IDs/order metadata remain unchanged.
       * We only normalize the runner/palette presentation order.
       */
      const sectionRank =
        (
          sectionCode:
            string |
            null,
        ): number => {
          const normalized =
            (
              sectionCode ??
              ""
            )
              .trim()
              .toUpperCase();

          if (
            normalized ===
              "MATH" ||
            normalized ===
              "MATHEMATICS"
          ) {
            return 0;
          }

          if (
            normalized ===
            "PHYSICS"
          ) {
            return 1;
          }

          if (
            normalized ===
            "CHEMISTRY"
          ) {
            return 2;
          }

          if (
            normalized ===
            "BIOLOGY"
          ) {
            return 3;
          }

          return 99;
        };

      const orderedTest:
        FixedMockTest = {
        ...test,

        questions:
          [
            ...test.questions,
          ].sort(
            (
              left,
              right,
            ) =>
              sectionRank(
                left.sectionCode,
              ) -
                sectionRank(
                  right.sectionCode,
                ) ||

              left.order -
                right.order,
          ),
      };

      const savedDraft =
        orderedTest.kind ===
          "FULL"
          ? loadFixedCbtDraft(
              orderedTest,
            )
          : null;

      setFixedAnswers(
        savedDraft
          ?.answers ??
        {},
      );

      setReviewQuestionIds(
        savedDraft
          ?.reviewQuestionIds ??
        [],
      );

      const resumedAfterSaveSeconds =
        savedDraft
          ?.savedAtMs
          ? Math.max(
              0,
              Math.floor(
                (
                  Date.now() -
                  savedDraft.savedAtMs
                ) /
                  1000,
              ),
            )
          : 0;

      const restoredElapsedSeconds =
        Math.min(
          orderedTest.kind ===
            "FULL"
            ? 180 *
              60
            : 0,
          (
            savedDraft
              ?.elapsedSeconds ??
            0
          ) +
            resumedAfterSaveSeconds,
        );

      setElapsedCbtSeconds(
        restoredElapsedSeconds,
      );

      setCbtSaveCount(
        savedDraft
          ?.saveCount ??
        0,
      );

      setFixedTest(
        orderedTest,
      );

      const savedQuestionExists =
        savedDraft
          ?.currentQuestionId !=
          null &&
        orderedTest.questions.some(
          (
            question,
          ) =>
            question.id ===
            savedDraft.currentQuestionId,
        );

      setCurrentFixedQuestionId(
        savedQuestionExists
          ? savedDraft!
              .currentQuestionId
          : orderedTest.questions[0]
              ?.id ??
            null,
      );

      setCbtDraftReady(
        true,
      );

      setCbtActionDialog(
        null,
      );

      setRecoveryEmail(
        "",
      );

      setRecoveryEmailError(
        "",
      );

      setRecoveryEmailSubmitted(
        false,
      );

      setSelected(
        null,
      );
    } catch (
      error
    ) {
      setRunnerError(
        error instanceof Error
          ? error.message
          : "Unable to open the fixed test.",
      );
    } finally {
      setRunnerLoading(
        false,
      );
    }
  }

  function closeFixedTest():
  void {
    setFixedTest(
      null,
    );

    setFixedAnswers(
      {},
    );

    setFixedScore(
      null,
    );

    setCurrentFixedQuestionId(
      null,
    );

    setReviewQuestionIds(
      [],
    );

    setElapsedCbtSeconds(
      0,
    );

    setCbtDraftReady(
      false,
    );

    setCbtSaveCount(
      0,
    );

    setCbtActionDialog(
      null,
    );

    setRunnerError("");
  }

  function requestSaveAndExit():
  void {
    if (
      !fixedTest ||
      fixedScore
    ) {
      closeFixedTest();

      return;
    }

    if (
      fixedTest.kind !==
        "FULL"
    ) {
      closeFixedTest();

      return;
    }

    if (
      cbtSaveCount >=
        5
    ) {
      setCbtActionDialog({
        kind:
          "info",
        title:
          "Save limit reached",
        message:
          "All 5 Save & Exit opportunities have been used. Please finish and submit before the remaining exam time expires.",
      });

      return;
    }

    setCbtActionDialog({
      kind:
        "save",
    });
  }


  function performSaveAndExit():
  void {
    if (
      !fixedTest ||
      fixedTest.kind !==
        "FULL" ||
      fixedScore
    ) {
      return;
    }

    const draft:
      FixedCbtDraft = {
      answers:
        fixedAnswers,
      reviewQuestionIds,
      currentQuestionId:
        currentFixedQuestionId,
      elapsedSeconds:
        elapsedCbtSeconds,
      saveCount:
        Math.min(
          5,
          cbtSaveCount +
            1,
        ),
      savedAtMs:
        Date.now(),
      updatedAt:
        Date.now(),
    };

    try {
      window.localStorage.setItem(
        fixedCbtDraftKey(
          fixedTest,
        ),
        JSON.stringify(
          draft,
        ),
      );
    } catch {
      setCbtActionDialog({
        kind:
          "info",
        title:
          "Save unsuccessful",
        message:
          "GYAN could not save this test on this device. Please keep the test open or submit it.",
      });

      return;
    }

    setCbtActionDialog(
      null,
    );
    closeFixedTest();
  }


  function requestSubmitFixedTest():
  void {
    if (
      !fixedTest ||
      fixedScore
    ) {
      return;
    }

    if (
      !gyanRecoveryProtected
    ) {
      setRecoveryEmailError(
        "",
      );

      setCbtActionDialog({
        kind:
          "protect",
        stage:
          "submit",
      });

      return;
    }

    setCbtActionDialog({
      kind:
        "submit",
    });
  }


  async function acknowledgeProtectionWarning(
    stage:
      25 |
      50,
  ): Promise<void> {
    if (
      stage === 50
    ) {
      setProtection25Shown(
        true,
      );

      setProtection50Shown(
        true,
      );
    } else {
      setProtection25Shown(
        true,
      );
    }

    setCbtActionDialog(
      null,
    );

    await markProtectionShown(
      stage,
    );
  }


  async function protectGyanWithEmail():
  Promise<void> {
    const email =
      recoveryEmail
        .trim()
        .toLowerCase();

    if (
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        email,
      )
    ) {
      setRecoveryEmailError(
        "Enter a valid email address.",
      );

      return;
    }

    setRecoveryEmailSending(
      true,
    );

    setRecoveryEmailError(
      "",
    );

    try {
      const response =
        await fetch(
          "/api/gyan-identity/email",
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
                email,
              }),
          },
        );

      const body =
        await response
          .json()
          .catch(
            () => ({}),
          ) as {
            error?:
              string;
          };

      if (
        !response.ok
      ) {
        throw new Error(
          body.error ??
          "Recovery email could not be added.",
        );
      }

      setRecoveryEmailSubmitted(
        true,
      );

      setCbtActionDialog(
        null,
      );
    } catch (
      error
    ) {
      setRecoveryEmailError(
        error instanceof
          Error
          ? error.message
          : "Recovery email could not be added.",
      );
    } finally {
      setRecoveryEmailSending(
        false,
      );
    }
  }


  async function submitFixedTest():
  Promise<void> {
    if (
      !fixedTest ||
      fixedScore
    ) {
      return;
    }

    setRunnerLoading(
      true,
    );

    setRunnerError("");

    try {
      const result =
        await scoreFixedMockTest({
          program:
            fixedTest.programCode,

          kind:
            fixedTest.kind,

          testCode:
            fixedTest.testCode,

          level:
            fixedTest.level,

          version:
            fixedTest.version,

          answers:
            fixedAnswers,

          studentCode:
            activeGyanCode
              ?.trim()
              .toUpperCase() ??
            "",

          elapsedSeconds:
            elapsedCbtSeconds,

          saveCount:
            cbtSaveCount,

          reviewQuestionIds,
        });

      setFixedScore(
        result,
      );

      if (
        fixedTest.kind ===
          "FULL"
      ) {
        try {
          window.localStorage.removeItem(
            fixedCbtDraftKey(
              fixedTest,
            ),
          );
        } catch {
          // Ignore browser-storage cleanup failure.
        }
      }
    } catch (
      error
    ) {
      setRunnerError(
        error instanceof Error
          ? error.message
          : "Unable to score the test.",
      );
    } finally {
      setRunnerLoading(
        false,
      );
    }
  }

  function requestAccess(
    label: string,
    variant?: string,
  ): void {
    setAccessCode("");
    setRequestEmail("");
    setDialogMessage("");

    setLockedTest({
      label,
      variant,
    });
  }

  function tryOpenLockedTest():
  void {
    if (
      !accessCode.trim()
    ) {
      setDialogMessage(
        "Enter an Access Code.",
      );

      return;
    }

    setDialogMessage(
      "Access Code verification will be connected after the fixed-test pilot.",
    );
  }

  function contactAdmin():
  void {
    if (
      !lockedTest
    ) {
      return;
    }

    const email =
      requestEmail
        .trim()
        .toLowerCase();

    const emailPattern =
      /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (
      !emailPattern.test(
        email,
      )
    ) {
      setDialogMessage(
        "Enter a valid email address.",
      );

      return;
    }

    const programLabel =
      isJee
        ? "IIT-JEE"
        : "NEET";

    const subject =
      `GYAN Access Code Request - ${programLabel} - ${lockedTest.label}${lockedTest.variant ? ` - ${lockedTest.variant}` : ""}`;

    const body = [
      "Hello,",
      "",
      "Access Code request for:",
      `Program: ${programLabel}`,
      `Test: ${lockedTest.label}`,
      `Type: ${lockedTest.variant ?? programLabel}`,
      "",
      "GYAN Admin is copied on this email.",
    ].join(
      "\n",
    );

    window.location.href =
      `mailto:${encodeURIComponent(
        email,
      )}?cc=${encodeURIComponent(
        "admin@gyan.cc",
      )}&subject=${encodeURIComponent(
        subject,
      )}&body=${encodeURIComponent(
        body,
      )}`;
  }

  function closeDialog():
  void {
    setLockedTest(
      null,
    );

    setAccessCode("");
    setRequestEmail("");
    setDialogMessage("");
  }

  if (
    fixedTest
  ) {
    const activeFixedTest =
      fixedTest;


    /*
     * Every fixed test uses the CBT runner UI.
     * FULL still owns the 180-minute timer/save-session rules,
     * while MINI simply uses the same one-question/palette layout.
     */
    const isPagedCbt =
      true;

    const currentQuestion =
      activeFixedTest.questions.find(
        (question) =>
          question.id ===
          currentFixedQuestionId,
      ) ??
      activeFixedTest.questions[0];

    const currentIndex =
      currentQuestion
        ? activeFixedTest.questions.findIndex(
            (question) =>
              question.id ===
              currentQuestion.id,
          )
        : -1;

    const sectionCodes =
      Array.from(
        new Set(
          activeFixedTest.questions
            .map(
              (question) =>
                question.sectionCode,
            )
            .filter(
              (
                sectionCode,
              ): sectionCode is string =>
                Boolean(
                  sectionCode,
                ),
            ),
        ),
      );

    const currentSectionCode =
      currentQuestion
        ?.sectionCode ??
      sectionCodes[0] ??
      "";

    const currentSectionQuestions =
      activeFixedTest.questions.filter(
        (question) =>
          question.sectionCode ===
          currentSectionCode,
      );

    const visibleQuestions =
      isPagedCbt &&
      currentQuestion
        ? [
            currentQuestion,
          ]
        : activeFixedTest.questions;

    function goToFixedQuestion(
      questionId: number,
    ): void {
      setCurrentFixedQuestionId(
        questionId,
      );

      window.scrollTo({
        top: 0,
        behavior:
          "smooth",
      });
    }

    function goToFixedSection(
      sectionCode: string,
    ): void {
      const first =
        activeFixedTest.questions.find(
          (question) =>
            question.sectionCode ===
            sectionCode,
        );

      if (first) {
        goToFixedQuestion(
          first.id,
        );
      }
    }

    function goPreviousQuestion():
    void {
      if (
        currentIndex <=
        0
      ) {
        return;
      }

      goToFixedQuestion(
        activeFixedTest.questions[
          currentIndex -
          1
        ].id,
      );
    }

    function goNextQuestion():
    void {
      if (
        currentIndex <
          0 ||
        currentIndex >=
          activeFixedTest.questions.length -
          1
      ) {
        return;
      }

      goToFixedQuestion(
        activeFixedTest.questions[
          currentIndex +
          1
        ].id,
      );
    }


    function toggleCurrentReview():
    void {
      if (
        !currentQuestion
      ) {
        return;
      }

      setReviewQuestionIds(
        (
          current,
        ) =>
          current.includes(
            currentQuestion.id,
          )
            ? current.filter(
                (
                  questionId,
                ) =>
                  questionId !==
                  currentQuestion.id,
              )
            : [
                ...current,
                currentQuestion.id,
              ],
      );
    }


    const sectionLabel =
      (
        sectionCode:
          string,
      ): string => {
        if (
          sectionCode ===
            "MATH"
        ) {
          return "Math";
        }

        if (
          sectionCode ===
            "PHYSICS"
        ) {
          return "Physics";
        }

        if (
          sectionCode ===
            "CHEMISTRY"
        ) {
          return "Chemistry";
        }

        return sectionCode;
      };

    return (
      <main
        className="mock-tests mock-tests--runner"
      >
        <header
          className="mock-tests__header"
        >
          <button
            type="button"
            onClick={
              activeFixedTest.kind ===
                "FULL" &&
              !fixedScore
                ? requestSaveAndExit
                : closeFixedTest
            }
            aria-label={
              activeFixedTest.kind ===
                "FULL" &&
              !fixedScore
                ? "Save and exit test"
                : "Back to mock tests"
            }
          >
            ←
          </button>

          <div
            className="mock-tests__header-main"
          >
            <div
              className="mock-tests__header-copy"
            >
              <strong>
                📝 {
                  activeFixedTest.name
                } · {
                  activeFixedTest.level ===
                    "MAIN"
                    ? "JEE Main"
                    : activeFixedTest.level ===
                        "ADVANCED"
                      ? "JEE Advanced"
                      : activeFixedTest.level ===
                          "NEET"
                        ? "NEET"
                        : activeFixedTest.level
                }
              </strong>

              <small>
                Fixed v{
                  activeFixedTest.version
                } · {
                  activeFixedTest.questionCount
                } questions · {
                  activeFixedTest.maximumMarks
                } marks
              </small>
            </div>

            {
              activeFixedTest.kind ===
                "FULL" &&
              !fixedScore && (
                <div
                  className={[
                    "mock-tests__cbt-timer",
                    cbtRemainingSeconds <=
                      300
                      ? "mock-tests__cbt-timer--warning"
                      : "",
                  ]
                    .filter(
                      Boolean,
                    )
                    .join(
                      " ",
                    )}
                  title="Total exam time remaining across sessions"
                >
                  ⏱ {
                    formatCbtTime(
                      cbtRemainingSeconds,
                    )
                  }
                  <small>
                    💾 {
                      cbtSaveCount
                    }/5
                  </small>
                </div>
              )
            }

            {
              activeFixedTest.kind ===
                "FULL" &&
              !fixedScore && (
                <button
                  type="button"
                  className="mock-tests__header-save"
                  disabled={
                    runnerLoading ||
                    cbtSaveCount >=
                      5
                  }
                  onClick={
                    requestSaveAndExit
                  }
                  title={
                    cbtSaveCount >=
                      5
                      ? "5 of 5 saves used — Save & Exit is no longer available"
                      : `Save & Exit · ${cbtSaveCount} of 5 saves used`
                  }
                  aria-label="Save and exit test"
                >
                  💾
                </button>
              )
            }

            <button
              type="button"
              className="mock-tests__header-submit"
              disabled={
                !fixedScore &&
                runnerLoading
              }
              onClick={
                fixedScore
                  ? closeFixedTest
                  : requestSubmitFixedTest
              }
              title={
                fixedScore
                  ? "Back to mock tests"
                  : "Submit test permanently"
              }
              aria-label={
                fixedScore
                  ? "Back to mock tests"
                  : "Submit test"
              }
            >
              {
                fixedScore
                  ? "←"
                  : runnerLoading
                    ? "…"
                    : "➤"
              }
            </button>
          </div>
        </header>

        {
          cbtActionDialog && (
            <div
              className="mock-tests__cbt-dialog-backdrop"
              role="presentation"
              onMouseDown={() =>
                setCbtActionDialog(
                  null,
                )
              }
            >
              <section
                onMouseDown={(
                  event,
                ) =>
                  event.stopPropagation()
                }
                className={[
                  "mock-tests__cbt-action-dialog",
                  cbtActionDialog.kind ===
                    "submit"
                    ? "mock-tests__cbt-action-dialog--submit"
                    : cbtActionDialog.kind ===
                        "save"
                      ? "mock-tests__cbt-action-dialog--save"
                      : cbtActionDialog.kind ===
                          "protect"
                        ? "mock-tests__cbt-action-dialog--protect"
                        : "mock-tests__cbt-action-dialog--info",
                ].join(
                  " ",
                )}
                role="dialog"
                aria-modal="true"
                aria-label={
                  cbtActionDialog.kind ===
                    "submit"
                    ? "Confirm test submission"
                    : cbtActionDialog.kind ===
                        "save"
                      ? "Confirm save and exit"
                      : cbtActionDialog.kind ===
                          "protect"
                        ? "Protect GYAN progress"
                        : cbtActionDialog.title
                }
              >
                <button
                  type="button"
                  className="mock-tests__cbt-dialog-x"
                  onClick={() =>
                    setCbtActionDialog(
                      null,
                    )
                  }
                  aria-label="Close dialog"
                >
                  ×
                </button>

                {
                  cbtActionDialog.kind ===
                    "save" ? (
                    <>
                      <div
                        className="mock-tests__cbt-dialog-heading"
                      >
                        <span
                          aria-hidden="true"
                        >
                          💾
                        </span>

                        <div>
                          <strong>
                            Save & Exit
                          </strong>
                          <small>
                            {
                              cbtSaveCount
                            } of 5 saves used
                          </small>
                        </div>
                      </div>

                      <p>
                        Your answers, review marks and current question will be saved on this device.
                      </p>

                      <div
                        className="mock-tests__cbt-dialog-warning"
                      >
                        ⏱ The exam timer continues while you are away.
                      </div>

                      <small
                        className="mock-tests__cbt-dialog-note"
                      >
                        Confirming this uses save {
                          cbtSaveCount +
                          1
                        } of 5. Reopening does not use another save. You may return only while exam time remains.
                      </small>

                      <div
                        className="mock-tests__cbt-dialog-actions"
                      >
                        <button
                          type="button"
                          className="mock-tests__cbt-dialog-secondary"
                          onClick={() =>
                            setCbtActionDialog(
                              null,
                            )
                          }
                        >
                          Continue Test
                        </button>

                        <button
                          type="button"
                          className="mock-tests__cbt-dialog-primary"
                          onClick={
                            performSaveAndExit
                          }
                        >
                          💾 Save & Exit
                        </button>
                      </div>
                    </>
                  ) : cbtActionDialog.kind ===
                      "protect" ? (
                    <>
                      <div
                        className="mock-tests__cbt-dialog-heading"
                      >
                        <span
                          aria-hidden="true"
                        >
                          🛡
                        </span>

                        <div>
                          <strong>
                            Protect your GYAN
                          </strong>
                          <small>
                            {
                              cbtActionDialog.stage ===
                                25
                                ? "25 questions answered"
                                : cbtActionDialog.stage ===
                                    50
                                  ? "50 questions answered"
                                  : "Before final submission"
                            }
                          </small>
                        </div>
                      </div>

                      <p>
                        {
                          cbtActionDialog.stage ===
                            25
                            ? "You have already built meaningful progress. Add a recovery email so this GYAN can be restored if this browser or device is lost or reset."
                            : cbtActionDialog.stage ===
                                50
                              ? "You have answered 50 questions. This progress is still tied to this browser unless you add a recovery email."
                              : "This attempt will be saved to this GYAN. Without a recovery email, restoring it may not be possible if browser access is lost."
                        }
                      </p>

                      <div
                        className="mock-tests__cbt-protect-email"
                      >
                        <input
                          type="email"
                          inputMode="email"
                          autoComplete="email"
                          value={
                            recoveryEmail
                          }
                          disabled={
                            recoveryEmailSending
                          }
                          placeholder="Recovery email"
                          aria-label="Recovery email"
                          onChange={(
                            event,
                          ) => {
                            setRecoveryEmail(
                              event.target.value,
                            );

                            setRecoveryEmailError(
                              "",
                            );
                          }}
                        />

                        <button
                          type="button"
                          className="mock-tests__cbt-dialog-primary"
                          disabled={
                            recoveryEmailSending
                          }
                          onClick={() =>
                            void protectGyanWithEmail()
                          }
                        >
                          {
                            recoveryEmailSending
                              ? "Sending…"
                              : "Protect my GYAN"
                          }
                        </button>
                      </div>

                      {
                        recoveryEmailError && (
                          <div
                            className="mock-tests__cbt-protect-error"
                            role="alert"
                          >
                            {
                              recoveryEmailError
                            }
                          </div>
                        )
                      }

                      <small
                        className="mock-tests__cbt-dialog-note"
                      >
                        Recovery email is for restoring your GYAN and progress. You can continue without adding one.
                      </small>

                      <div
                        className="mock-tests__cbt-dialog-actions"
                      >
                        <button
                          type="button"
                          className="mock-tests__cbt-dialog-secondary"
                          onClick={() => {
                            setRecoveryEmailError(
                              "",
                            );

                            if (
                              cbtActionDialog.stage ===
                                "submit"
                            ) {
                              setCbtActionDialog({
                                kind:
                                  "submit",
                              });
                            } else {
                              void acknowledgeProtectionWarning(
                                cbtActionDialog.stage,
                              );
                            }
                          }}
                        >
                          {
                            cbtActionDialog.stage ===
                              "submit"
                              ? "Submit anyway"
                              : "Continue for now"
                          }
                        </button>
                      </div>
                    </>
                  ) : cbtActionDialog.kind ===
                      "submit" ? (
                    <>
                      <div
                        className="mock-tests__cbt-dialog-heading"
                      >
                        <span
                          aria-hidden="true"
                        >
                          ➤
                        </span>

                        <div>
                          <strong>
                            Submit {
                              activeFixedTest.name
                            }
                          </strong>
                          <small>
                            Final submission
                          </small>
                        </div>
                      </div>

                      <div
                        className="mock-tests__cbt-submit-summary"
                      >
                        <span>
                          <b>
                            {
                              Object.values(
                                fixedAnswers,
                              ).filter(
                                Boolean,
                              ).length
                            }
                          </b>
                          Answered
                        </span>

                        <span>
                          <b>
                            {
                              Math.max(
                                0,
                                activeFixedTest.questions.length -
                                  Object.values(
                                    fixedAnswers,
                                  ).filter(
                                    Boolean,
                                  ).length,
                              )
                            }
                          </b>
                          Unanswered
                        </span>

                        <span>
                          <b>
                            {
                              reviewQuestionIds.length
                            }
                          </b>
                          Review
                        </span>
                      </div>

                      <div
                        className="mock-tests__cbt-dialog-danger"
                      >
                        Once submitted, this attempt is final. You cannot return to change answers or resume it.
                      </div>

                      <div
                        className="mock-tests__cbt-dialog-actions"
                      >
                        <button
                          type="button"
                          className="mock-tests__cbt-dialog-secondary"
                          onClick={() =>
                            setCbtActionDialog(
                              null,
                            )
                          }
                        >
                          Keep Working
                        </button>

                        <button
                          type="button"
                          className="mock-tests__cbt-dialog-primary"
                          onClick={() => {
                            setCbtActionDialog(
                              null,
                            );

                            void submitFixedTest();
                          }}
                        >
                          ➤ Submit Test
                        </button>
                      </div>
                    </>
                  ) : (
                    <>
                      <div
                        className="mock-tests__cbt-dialog-heading"
                      >
                        <span
                          aria-hidden="true"
                        >
                          ℹ
                        </span>

                        <div>
                          <strong>
                            {
                              cbtActionDialog.title
                            }
                          </strong>
                        </div>
                      </div>

                      <p>
                        {
                          cbtActionDialog.message
                        }
                      </p>

                      <div
                        className="mock-tests__cbt-dialog-actions mock-tests__cbt-dialog-actions--single"
                      >
                        <button
                          type="button"
                          className="mock-tests__cbt-dialog-primary"
                          onClick={() =>
                            setCbtActionDialog(
                              null,
                            )
                          }
                        >
                          OK
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
          runnerError && (
            <div
              className="mock-tests__runner-error"
              role="alert"
            >
              {
                runnerError
              }
            </div>
          )
        }

        {
          fixedScore && (
            <section
              className="mock-tests__score-card"
            >
              <strong>
                Score {
                  fixedScore.score
                } / {
                  fixedScore.maximumMarks
                }
              </strong>

              <small>
                {
                  fixedScore.correctCount
                } correct · {
                  fixedScore.incorrectCount
                } wrong · {
                  fixedScore.unansweredCount
                } unanswered
              </small>

              <div
                className="mock-tests__score-sections"
              >
                {
                  fixedScore.sections.map(
                    (
                      section,
                    ) => (
                      <span
                        key={
                          section.sectionCode
                        }
                      >
                        {
                          section.sectionCode
                        }:{" "}
                        {
                          section.score
                        } / {
                          section.maximumMarks
                        }
                      </span>
                    ),
                  )
                }
              </div>
            </section>
          )
        }

        {
          isPagedCbt &&
          currentQuestion && (
            <div
              className="mock-tests__cbt-status"
            >
              <strong>
                Question {
                  currentIndex +
                  1
                } of {
                  activeFixedTest.questions.length
                }
              </strong>

              <span>
                {
                  sectionLabel(
                    currentSectionCode,
                  )
                } · {
                  currentSectionQuestions.filter(
                    (question) =>
                      Boolean(
                        fixedAnswers[
                          question.id
                        ],
                      ),
                  ).length
                }/{
                  currentSectionQuestions.length
                } answered
              </span>
            </div>
          )
        }

        <div
          className={
            isPagedCbt
              ? "mock-tests__cbt-layout"
              : ""
          }
        >
          <div
            className={
              isPagedCbt
                ? "mock-tests__cbt-main"
                : ""
            }
          >
        <section
          className="mock-tests__runner"
        >
          {
            visibleQuestions.map(
              (
                question,
              ) => {
                const review =
                  fixedScore
                    ?.questions
                    .find(
                      (
                        item,
                      ) =>
                        item.questionId ===
                        question.id,
                    );

                return (
                  <article
                    key={
                      question.id
                    }
                    className={[
                      "mock-tests__question",
                      review
                        ? review.correct
                          ? "mock-tests__question--correct"
                          : review.selectedChoice
                            ? "mock-tests__question--wrong"
                            : "mock-tests__question--blank"
                        : "",
                    ]
                      .filter(
                        Boolean,
                      )
                      .join(
                        " ",
                      )}
                  >
                    <div
                      className="mock-tests__question-heading"
                    >
                      <strong>
                        {
                          question.order
                        }. {
                          question.text
                        }
                      </strong>

                      <small>
                        {
                          question.sectionCode
                        } · +{
                          question.marksCorrect
                        } / {
                          question.marksIncorrect
                        }
                      </small>
                    </div>

                    {
                      question.questionFormat ===
                        "NUMERICAL" ||
                      question.questionFormat ===
                        "INTEGER" ? (
                        <div
                          className="mock-tests__numerical"
                        >
                          <label>
                            <span>
                              Numerical answer
                            </span>

                            <input
                              type="number"
                              inputMode="decimal"
                              step="any"
                              value={
                                fixedAnswers[
                                  question.id
                                ] ??
                                ""
                              }
                              disabled={
                                Boolean(
                                  fixedScore,
                                )
                              }
                              onChange={(
                                event,
                              ) =>
                                setFixedAnswers(
                                  (
                                    current,
                                  ) => {
                                    const nextAnswers = {
                                      ...current,
                                      [question.id]:
                                        event.target.value,
                                    };

                                    queueMicrotask(
                                      () =>
                                        showProtectionMilestoneIfNeeded(
                                          cumulativeAnsweredCount +
                                            Object.values(
                                              nextAnswers,
                                            ).filter(
                                              Boolean,
                                            ).length,

                                          protection25Shown,
                                          protection50Shown,
                                          gyanRecoveryProtected,
                                        ),
                                    );

                                    return nextAnswers;
                                  },
                                )
                              }
                            />
                          </label>
                        </div>
                      ) : (
                    <div
                      className="mock-tests__choices"
                    >
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
                            const isMultiSelect =
                              question.questionFormat ===
                              "MULTI_SELECT";

                            const selectedValue =
                              fixedAnswers[
                                question.id
                              ] ?? "";

                            const isSelected =
                              isMultiSelect
                                ? selectedValue.includes(
                                    choice,
                                  )
                                : selectedValue ===
                                  choice;

                            const isCorrectAfterSubmit =
                              review
                                ?.correctChoice
                                .includes(
                                  choice,
                                ) ??
                              false;

                            return (
                              <label
                                key={
                                  choice
                                }
                                className={[
                                  isSelected
                                    ? "mock-tests__choice--selected"
                                    : "",
                                  fixedScore &&
                                  isCorrectAfterSubmit
                                    ? "mock-tests__choice--answer"
                                    : "",
                                ]
                                  .filter(
                                    Boolean,
                                  )
                                  .join(
                                    " ",
                                  )}
                              >
                                <input
                                  type={
                                    isMultiSelect
                                      ? "checkbox"
                                      : "radio"
                                  }
                                  name={
                                    `mock-${question.id}`
                                  }
                                  value={
                                    choice
                                  }
                                  checked={
                                    isSelected
                                  }
                                  disabled={
                                    Boolean(
                                      fixedScore,
                                    )
                                  }
                                  onChange={() =>
                                    setFixedAnswers(
                                      (
                                        current,
                                      ) => {
                                        if (
                                          !isMultiSelect
                                        ) {
                                          const nextAnswers = {
                                            ...current,
                                            [question.id]:
                                              choice,
                                          };

                                          queueMicrotask(
                                            () =>
                                              showProtectionMilestoneIfNeeded(
                                                cumulativeAnsweredCount +
                                                  Object.values(
                                                    nextAnswers,
                                                  ).filter(
                                                    Boolean,
                                                  ).length,

                                                protection25Shown,
                                                protection50Shown,
                                                gyanRecoveryProtected,
                                              ),
                                          );

                                          return nextAnswers;
                                        }

                                        const next =
                                          new Set(
                                            (
                                              current[
                                                question.id
                                              ] ??
                                              ""
                                            )
                                              .split(
                                                "",
                                              )
                                              .filter(
                                                Boolean,
                                              ),
                                          );

                                        if (
                                          next.has(
                                            choice,
                                          )
                                        ) {
                                          next.delete(
                                            choice,
                                          );
                                        } else {
                                          next.add(
                                            choice,
                                          );
                                        }

                                        const nextAnswers = {
                                          ...current,
                                          [question.id]:
                                            Array.from(
                                              next,
                                            )
                                              .sort()
                                              .join(
                                                "",
                                              ),
                                        };

                                        queueMicrotask(
                                          () =>
                                            showProtectionMilestoneIfNeeded(
                                              cumulativeAnsweredCount +
                                                Object.values(
                                                  nextAnswers,
                                                ).filter(
                                                  Boolean,
                                                ).length,

                                              protection25Shown,
                                              protection50Shown,
                                              gyanRecoveryProtected,
                                            ),
                                        );

                                        return nextAnswers;
                                      },
                                    )
                                  }
                                />

                                <span>
                                  <b>
                                    {
                                      choice
                                    }.
                                  </b>{" "}
                                  {
                                    question.choices[
                                      choice
                                    ]
                                  }
                                </span>
                              </label>
                            );
                          },
                        )
                      }
                    </div>
                      )
                    }

                    {
                      review && (
                        <div
                          className="mock-tests__explanation"
                        >
                          <strong>
                            Answer: {
                              review.correctChoice
                            }
                          </strong>

                          <span>
                            {
                              review.explanation
                            }
                          </span>
                        </div>
                      )
                    }
                  </article>
                );
              },
            )
          }
        </section>

        {
          isPagedCbt &&
          currentQuestion && (
            <nav
              className="mock-tests__cbt-nav"
              aria-label="Question navigation"
            >
              <button
                type="button"
                disabled={
                  currentIndex <=
                  0
                }
                onClick={
                  goPreviousQuestion
                }
              >
                ← Previous
              </button>

              <button
                type="button"
                className={
                  reviewQuestionIds.includes(
                    currentQuestion.id,
                  )
                    ? "mock-tests__review-button mock-tests__review-button--active"
                    : "mock-tests__review-button"
                }
                onClick={
                  toggleCurrentReview
                }
              >
                {
                  reviewQuestionIds.includes(
                    currentQuestion.id,
                  )
                    ? "★ Reviewed"
                    : "☆ Mark Review"
                }
              </button>

              <button
                type="button"
                disabled={
                  currentIndex >=
                  activeFixedTest.questions.length -
                    1
                }
                onClick={
                  goNextQuestion
                }
              >
                Save & Next →
              </button>
            </nav>
          )
        }
          </div>

          {
            isPagedCbt && (
              <aside
                className="mock-tests__palette"
                aria-label="Question palette"
              >
                <div
                  className="mock-tests__palette-tabs"
                >
                  {
                    sectionCodes.map(
                      (
                        sectionCode,
                      ) => {
                        const sectionQuestions =
                          activeFixedTest.questions.filter(
                            (question) =>
                              question.sectionCode ===
                              sectionCode,
                          );

                        const answeredCount =
                          sectionQuestions.filter(
                            (question) =>
                              Boolean(
                                fixedAnswers[
                                  question.id
                                ],
                              ),
                          ).length;

                        return (
                          <button
                            type="button"
                            key={
                              sectionCode
                            }
                            className={
                              sectionCode ===
                                currentSectionCode
                                ? "mock-tests__palette-tab--active"
                                : ""
                            }
                            onClick={() =>
                              goToFixedSection(
                                sectionCode,
                              )
                            }
                          >
                            {
                              sectionLabel(
                                sectionCode,
                              )
                            }{" "}
                            {
                              answeredCount
                            }/{
                              sectionQuestions.length
                            }
                          </button>
                        );
                      },
                    )
                  }
                </div>

                <div
                  className={[
                    "mock-tests__palette-grid",
                    program === "NEET"
                      ? "mock-tests__palette-grid--neet"
                      : "",
                  ]
                    .filter(
                      Boolean,
                    )
                    .join(
                      " ",
                    )}
                >
                  {
                    currentSectionQuestions.map(
                      (
                        question,
                      ) => {
                        const answered =
                          Boolean(
                            fixedAnswers[
                              question.id
                            ],
                          );

                        const scoreReview =
                          fixedScore
                            ?.questions
                            .find(
                              (
                                item,
                              ) =>
                                item.questionId ===
                                question.id,
                            );

                        return (
                          <button
                            type="button"
                            key={
                              question.id
                            }
                            className={[
                              "mock-tests__palette-number",
                              answered
                                ? "mock-tests__palette-number--answered"
                                : "mock-tests__palette-number--blank",
                              reviewQuestionIds.includes(
                                question.id,
                              )
                                ? "mock-tests__palette-number--review"
                                : "",
                              question.id ===
                                currentQuestion.id
                                ? "mock-tests__palette-number--current"
                                : "",
                              scoreReview
                                ? scoreReview.correct
                                  ? "mock-tests__palette-number--correct"
                                  : scoreReview.selectedChoice
                                    ? "mock-tests__palette-number--wrong"
                                    : ""
                                : "",
                            ]
                              .filter(
                                Boolean,
                              )
                              .join(
                                " ",
                              )}
                            onClick={() =>
                              goToFixedQuestion(
                                question.id,
                              )
                            }
                            aria-label={`Question ${
                              question.order
                            }`}
                          >
                            {
                              question.order
                            }
                          </button>
                        );
                      },
                    )
                  }
                </div>

                <div
                  className="mock-tests__palette-legend"
                >
                  <span>
                    <i className="mock-tests__palette-key mock-tests__palette-key--answered" />
                    Answered
                  </span>
                  <span>
                    <i className="mock-tests__palette-key mock-tests__palette-key--blank" />
                    Not answered
                  </span>
                  <span>
                    <i className="mock-tests__palette-key mock-tests__palette-key--review" />
                    Review
                  </span>
                </div>
              </aside>
            )
          }
        </div>

        <div
          className="mock-tests__runner-actions"
        >
          {
            fixedScore ? (
              <button
                type="button"
                onClick={
                  closeFixedTest
                }
              >
                Back to Mock Tests
              </button>
            ) : (
              <button
                type="button"
                disabled={
                  runnerLoading
                }
                onClick={
                  requestSubmitFixedTest
                }
              >
                {
                  runnerLoading
                    ? "Submitting…"
                    : `Submit ${activeFixedTest.name}`
                }
              </button>
            )
          }
        </div>

        <div
          className="mock-tests__bottom-spacer"
          aria-hidden="true"
        />
      </main>
    );
  }

  return (
    <main
      className="mock-tests"
    >
      <header
        className="mock-tests__header"
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
            📝 {
              isJee
                ? "IIT-JEE"
                : "NEET"
            } Mock Tests
          </strong>

          <small>
            Full mocks · mini tests
          </small>
        </div>
      </header>

      {
        runnerError && (
          <div
            className="mock-tests__runner-error"
            role="alert"
          >
            {
              runnerError
            }
          </div>
        )
      }

      {
        lockedTest && (
          <div
            className="mock-tests__dialog-backdrop"
            role="presentation"
            onMouseDown={
              closeDialog
            }
          >
            <section
              className="mock-tests__dialog"
              role="dialog"
              aria-modal="true"
              aria-labelledby="mock-access-title"
              onMouseDown={(
                event,
              ) => {
                event.stopPropagation();
              }}
            >
              <div
                className="mock-tests__dialog-title"
              >
                <h2
                  id="mock-access-title"
                >
                  Access Code Required
                </h2>

                <button
                  type="button"
                  className="mock-tests__dialog-x"
                  onClick={
                    closeDialog
                  }
                  aria-label="Close"
                >
                  ×
                </button>
              </div>

              <small>
                {
                  lockedTest.label
                }{
                  lockedTest.variant
                    ? ` · ${lockedTest.variant}`
                    : ""
                }
              </small>

              <div
                className="mock-tests__access-row"
              >
                <span>
                  Already have access code
                </span>

                <input
                  type="password"
                  value={
                    accessCode
                  }
                  placeholder="Access Code"
                  onChange={(
                    event,
                  ) =>
                    setAccessCode(
                      event.target.value,
                    )
                  }
                  onKeyDown={(
                    event,
                  ) => {
                    if (
                      event.key ===
                      "Enter"
                    ) {
                      tryOpenLockedTest();
                    }
                  }}
                />

                <button
                  type="button"
                  className="mock-tests__dialog-open"
                  onClick={
                    tryOpenLockedTest
                  }
                >
                  Open Test
                </button>
              </div>

              <div
                className="mock-tests__access-row"
              >
                <span>
                  Do not have access code
                </span>

                <input
                  type="email"
                  inputMode="email"
                  value={
                    requestEmail
                  }
                  placeholder="Your Email"
                  autoComplete="email"
                  onChange={(
                    event,
                  ) =>
                    setRequestEmail(
                      event.target.value,
                    )
                  }
                />

                <button
                  type="button"
                  onClick={
                    contactAdmin
                  }
                >
                  Contact Admin
                </button>
              </div>

              {
                dialogMessage && (
                  <p>
                    {
                      dialogMessage
                    }
                  </p>
                )
              }

              <div
                className="mock-tests__dialog-close-row"
              >
                <button
                  type="button"
                  onClick={
                    closeDialog
                  }
                >
                  Close
                </button>
              </div>
            </section>
          </div>
        )
      }

      {
        selected && (
          <div
            className="mock-tests__selected"
          >
            ✓ {
              selected.label
            }{
              selected.variant
                ? ` · ${selected.variant}`
                : ""
            } — fixed question set is being prepared.
          </div>
        )
      }

      <section
        className="mock-tests__section"
      >
        <h1>
          Mock Tests
        </h1>

        <div
          className="mock-tests__list"
        >
          {
            FULL_TESTS.map(
              (
                testNumber,
              ) => {

                const restricted =
                  testNumber >=
                    2 &&
                  testNumber <=
                    8;

                const label =
                  `Test ${testNumber}`;

                return (
                  <div
                    className={[
                      "mock-tests__row",
                      restricted
                        ? "mock-tests__row--restricted"
                        : "",
                    ]
                      .filter(
                        Boolean,
                      )
                      .join(
                        " ",
                      )}
                    key={
                      testNumber
                    }
                  >
                    <strong>
                      {
                        label
                      }
                    </strong>

                    <div
                      className="mock-tests__row-actions"
                    >
                      {
                        isJee ? (
                          <>
                            <button
                              type="button"
                              disabled={
                                runnerLoading
                              }
                              onClick={() => {
                                if (
                                  testNumber ===
                                    1
                                ) {
                                  void openFixedTest({
                                    kind:
                                      "FULL",
                                    testCode:
                                      "TEST_1",
                                    level:
                                      "MAIN",
                                  });

                                  return;
                                }

                                requestAccess(
                                  label,
                                  "JEE Main",
                                );
                              }}
                            >
                              {
                                testNumber ===
                                  1 &&
                                runnerLoading
                                  ? "Opening…"
                                  : testNumber ===
                                      1
                                    ? "Main"
                                    : "🔒 Main"
                              }
                            </button>

                            <button
                              type="button"
                              disabled={
                                runnerLoading
                              }
                              onClick={() => {
                                if (
                                  testNumber ===
                                    1
                                ) {
                                  void openFixedTest({
                                    kind:
                                      "FULL",
                                    testCode:
                                      "TEST_1",
                                    level:
                                      "ADVANCED",
                                  });

                                  return;
                                }

                                requestAccess(
                                  label,
                                  "JEE Advanced",
                                );
                              }}
                            >
                              {
                                testNumber ===
                                  1 &&
                                runnerLoading
                                  ? "Opening…"
                                  : testNumber ===
                                      1
                                    ? "Advanced"
                                    : "🔒 Advanced"
                              }
                            </button>
                          </>
                        ) : (
                          <button
                            type="button"
                            disabled={
                              runnerLoading
                            }
                            onClick={() => {
                              if (
                                testNumber ===
                                  1
                              ) {
                                void openFixedTest({
                                  kind:
                                    "FULL",
                                  testCode:
                                    "TEST_1",
                                  level:
                                    "NEET",
                                });

                                return;
                              }

                              requestAccess(
                                label,
                                "NEET",
                              );
                            }}
                          >
                            {
                              testNumber ===
                                1 &&
                              runnerLoading
                                ? "Opening…"
                                : testNumber ===
                                    1
                                  ? "Open"
                                  : "🔒 Open"
                            }
                          </button>
                        )
                      }
                    </div>
                  </div>
                );
              },
            )
          }
        </div>
      </section>

      <section
        className="mock-tests__section"
      >
        <h1>
          Mini Tests
        </h1>

        <div
          className="mock-tests__list"
        >
          {
            MINI_TESTS.map(
              (
                letter,
                index,
              ) => {

                const restricted =
                  index >=
                  1;

                const label =
                  `Mini ${letter}`;

                return (
                  <div
                    className={[
                      "mock-tests__row",
                      restricted
                        ? "mock-tests__row--restricted"
                        : "",
                    ]
                      .filter(
                        Boolean,
                      )
                      .join(
                        " ",
                      )}
                    key={
                      letter
                    }
                  >
                    <strong>
                      {
                        label
                      }
                    </strong>

                    <div
                      className="mock-tests__row-actions"
                    >
                      {
                        isJee ? (
                          <>
                            <button
                              type="button"
                              disabled={
                                runnerLoading
                              }
                              onClick={() => {
                                if (
                                  letter ===
                                    "A"
                                ) {
                                  void openFixedTest({
                                    kind:
                                      "MINI",
                                    testCode:
                                      "MINI_A",
                                    level:
                                      "MAIN",
                                  });

                                  return;
                                }

                                requestAccess(
                                  label,
                                  "JEE Main",
                                );
                              }}
                            >
                              {
                                letter ===
                                  "A" &&
                                runnerLoading
                                  ? "Opening…"
                                  : letter ===
                                      "A"
                                    ? "Main"
                                    : "🔒 Main"
                              }
                            </button>

                            <button
                              type="button"
                              disabled={
                                runnerLoading
                              }
                              onClick={() => {
                                if (
                                  letter ===
                                    "A"
                                ) {
                                  void openFixedTest({
                                    kind:
                                      "MINI",
                                    testCode:
                                      "MINI_A",
                                    level:
                                      "ADVANCED",
                                  });

                                  return;
                                }

                                requestAccess(
                                  label,
                                  "JEE Advanced",
                                );
                              }}
                            >
                              {
                                letter ===
                                  "A" &&
                                runnerLoading
                                  ? "Opening…"
                                  : letter ===
                                      "A"
                                    ? "Advanced"
                                    : "🔒 Advanced"
                              }
                            </button>
                          </>
                        ) : (
                          <button
                            type="button"
                            disabled={
                              runnerLoading
                            }
                            onClick={() => {
                              if (
                                letter ===
                                  "A"
                              ) {
                                void openFixedTest({
                                  kind:
                                    "MINI",
                                  testCode:
                                    "MINI_A",
                                  level:
                                    "NEET",
                                });

                                return;
                              }

                              requestAccess(
                                label,
                                "NEET",
                              );
                            }}
                          >
                            {
                              letter ===
                                "A" &&
                              runnerLoading
                                ? "Opening…"
                                : letter ===
                                    "A"
                                  ? "Open"
                                  : "🔒 Open"
                            }
                          </button>
                        )
                      }
                    </div>
                  </div>
                );
              },
            )
          }
        </div>
      </section>
    </main>
  );
}