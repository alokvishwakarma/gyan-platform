import {
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

export default function MockTestsPage({
  program,
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

  const isJee =
    program === "JEE";

  function chooseAvailable(
    label: string,
    variant?: string,
  ): void {
    setSelected({
      label,
      variant,
    });
  }

  async function openMiniAMain():
  Promise<void> {
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
          program:
            "JEE",

          kind:
            "MINI",

          testCode:
            "MINI_A",

          level:
            "MAIN",

          version:
            1,
        });

      setFixedAnswers(
        {},
      );

      setFixedTest(
        test,
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

    setRunnerError("");
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
        });

      setFixedScore(
        result,
      );
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
              closeFixedTest
            }
            aria-label="Back to mock tests"
          >
            ←
          </button>

          <div>
            <strong>
              📝 {
                fixedTest.name
              } · JEE Main
            </strong>

            <small>
              Fixed v{
                fixedTest.version
              } · {
                fixedTest.questionCount
              } questions · {
                fixedTest.maximumMarks
              } marks
            </small>
          </div>
        </header>

        <div
          className="mock-tests__runner-top-actions"
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
                onClick={() =>
                  void submitFixedTest()
                }
              >
                {
                  runnerLoading
                    ? "Submitting…"
                    : "Submit Mini A"
                }
              </button>
            )
          }
        </div>

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

        <section
          className="mock-tests__runner"
        >
          {
            fixedTest.questions.map(
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
                            const isSelected =
                              fixedAnswers[
                                question.id
                              ] ===
                              choice;

                            const isCorrectAfterSubmit =
                              review
                                ?.correctChoice ===
                              choice;

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
                                  type="radio"
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
                                      ) => ({
                                        ...current,
                                        [question.id]:
                                          choice,
                                      }),
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
                onClick={() =>
                  void submitFixedTest()
                }
              >
                {
                  runnerLoading
                    ? "Submitting…"
                    : "Submit Mini A"
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
                const available =
                  testNumber <=
                  2;

                const restricted =
                  testNumber >=
                    3 &&
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
                              onClick={() =>
                                available
                                  ? chooseAvailable(
                                      label,
                                      "JEE Main",
                                    )
                                  : requestAccess(
                                      label,
                                      "JEE Main",
                                    )
                              }
                            >
                              Main
                            </button>

                            <button
                              type="button"
                              onClick={() =>
                                available
                                  ? chooseAvailable(
                                      label,
                                      "JEE Advanced",
                                    )
                                  : requestAccess(
                                      label,
                                      "JEE Advanced",
                                    )
                              }
                            >
                              Advanced
                            </button>
                          </>
                        ) : (
                          <button
                            type="button"
                            onClick={() =>
                              available
                                ? chooseAvailable(
                                    label,
                                    "NEET",
                                  )
                                : requestAccess(
                                    label,
                                    "NEET",
                                  )
                            }
                          >
                            Open
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
                const available =
                  index <=
                  1;

                const restricted =
                  index >=
                  2;

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
                                  void openMiniAMain();

                                  return;
                                }

                                if (
                                  available
                                ) {
                                  chooseAvailable(
                                    label,
                                    "JEE Main",
                                  );

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
                                  : "Main"
                              }
                            </button>

                            <button
                              type="button"
                              onClick={() =>
                                available
                                  ? chooseAvailable(
                                      label,
                                      "JEE Advanced",
                                    )
                                  : requestAccess(
                                      label,
                                      "JEE Advanced",
                                    )
                              }
                            >
                              Advanced
                            </button>
                          </>
                        ) : (
                          <button
                            type="button"
                            onClick={() =>
                              available
                                ? chooseAvailable(
                                    label,
                                    "NEET",
                                  )
                                : requestAccess(
                                    label,
                                    "NEET",
                                  )
                            }
                          >
                            Open
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
