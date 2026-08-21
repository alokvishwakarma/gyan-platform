import {
  useEffect,
  useState,
} from "react";

import {
  loadStudentReport,
  loadStudentReviewQuestions,
  type StudentReport,
  type StudentReportTopic,
  type StudentReviewQuestion,
} from "../config/studentProgress";

import {
  checkPracticeAnswer,
} from "../config/educationLearning";

import {
  saveEducationProgress,
} from "../config/educationProgress";

import "./StudentProgressPage.css";


interface StudentProgressPageProps {
  studentCode:
    string;

  onBack:
    () => void;

  onContinueLearning:
    (
      student: {
        country: string;
        grade: string;
      },
    ) => void;
}


type ReviewAnswer = {
  selectedChoice?:
    string;

  correct?:
    boolean;

  correctChoice?:
    string;

  explanation?:
    string;
};


function heatState(
  item:
    StudentReportTopic,
):
  | "green"
  | "yellow"
  | "red"
  | "none" {
  if (
    item.scorePercent ==
      null
  ) {
    return "none";
  }

  if (
    item.scorePercent >=
      80
  ) {
    return "green";
  }

  if (
    item.scorePercent >=
      50
  ) {
    return "yellow";
  }

  return "red";
}


function gradeLabel(
  code:
    string,
): string {
  if (
    code ===
      "PREK"
  ) {
    return "Pre-K";
  }

  if (
    code ===
      "K"
  ) {
    return "K";
  }

  const match =
    code.match(
      /^GRADE_(\d+)$/,
    );

  return match
    ? `Grade ${match[1]}`
    : code;
}


export default function StudentProgressPage({
  studentCode,
  onBack,
  onContinueLearning,
}: StudentProgressPageProps) {
  const [
    report,
    setReport,
  ] =
    useState<
      StudentReport |
      null
    >(
      null,
    );

  const [
    loading,
    setLoading,
  ] =
    useState(
      true,
    );

  const [
    requiresSignIn,
    setRequiresSignIn,
  ] =
    useState(
      false,
    );

  const [
    email,
    setEmail,
  ] =
    useState("");

  const [
    sending,
    setSending,
  ] =
    useState(
      false,
    );

  const [
    sent,
    setSent,
  ] =
    useState(
      false,
    );

  const [
    error,
    setError,
  ] =
    useState("");

  const [
    reviewTopic,
    setReviewTopic,
  ] =
    useState<
      StudentReportTopic |
      null
    >(
      null,
    );

  const [
    reviewQuestions,
    setReviewQuestions,
  ] =
    useState<
      StudentReviewQuestion[]
    >(
      [],
    );

  const [
    reviewAnswers,
    setReviewAnswers,
  ] =
    useState<
      Record<
        number,
        ReviewAnswer
      >
    >(
      {},
    );

  const [
    reviewSubmitted,
    setReviewSubmitted,
  ] =
    useState(
      false,
    );

  const [
    reviewLoading,
    setReviewLoading,
  ] =
    useState(
      false,
    );

  const [
    unresolvedWrongCount,
    setUnresolvedWrongCount,
  ] =
    useState(
      0,
    );


  async function refreshReport():
    Promise<void> {
    const value =
      await loadStudentReport(
        studentCode,
      );

    setReport(
      value,
    );
  }


  useEffect(
    () => {
      let active =
        true;

      void loadStudentReport(
        studentCode,
      )
        .then(
          (
            value,
          ) => {
            if (
              active
            ) {
              setReport(
                value,
              );
            }
          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              !active
            ) {
              return;
            }

            const status =
              (
                caught as
                  Error & {
                    status?:
                      number;
                  }
              ).status;

            if (
              status ===
                401 ||
              status ===
                404
            ) {
              setRequiresSignIn(
                true,
              );

              return;
            }

            setError(
              caught instanceof
                Error
                ? caught.message
                : "Student progress could not be loaded.",
            );
          },
        )
        .finally(
          () => {
            if (
              active
            ) {
              setLoading(
                false,
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
      studentCode,
    ],
  );


  async function sendAccess():
    Promise<void> {
    const normalized =
      email
        .trim()
        .toLowerCase();

    if (
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        normalized,
      )
    ) {
      setError(
        "Enter the email used to save this GYAN card.",
      );

      return;
    }

    setSending(
      true,
    );

    setError("");

    try {
      const returnTo =
        `/student/${studentCode
          .trim()
          .toUpperCase()}`;

      const response =
        await fetch(
          "/api/auth/magic-link",
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
                email:
                  normalized,

                returnTo,
              }),
          },
        );

      const result =
        await response.json() as {
          sent?: boolean;
          reused?: boolean;
          error?: string;
        };

      if (
        !response.ok ||
        !(
          result.sent ||
          result.reused
        )
      ) {
        const error =
          new Error(
            result.error ??
              "Verification email could not be sent.",
          ) as
            Error & {
              status?:
                number;
            };

        error.status =
          response.status;

        throw error;
      }

      setSent(
        true,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Verification email could not be sent.",
      );
    } finally {
      setSending(
        false,
      );
    }
  }


  async function startReview(
    item:
      StudentReportTopic,
  ): Promise<void> {
    setReviewLoading(
      true,
    );

    setError("");

    try {
      const result =
        await loadStudentReviewQuestions({
          studentCode,
          subject:
            "MATH",
          topic:
            item.code,
        });

      setReviewTopic(
        item,
      );

      setReviewQuestions(
        result.questions,
      );

      setUnresolvedWrongCount(
        result.unresolvedWrongCount,
      );

      setReviewAnswers(
        {},
      );

      setReviewSubmitted(
        false,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Review could not be started.",
      );
    } finally {
      setReviewLoading(
        false,
      );
    }
  }


  function chooseReviewAnswer(
    questionId:
      number,

    choice:
      string,
  ): void {
    if (
      reviewSubmitted
    ) {
      return;
    }

    setReviewAnswers(
      (
        current,
      ) => ({
        ...current,

        [
          questionId
        ]: {
          selectedChoice:
            choice,
        },
      }),
    );
  }


  async function submitReview():
    Promise<void> {
    if (
      !report ||
      !reviewTopic ||
      reviewQuestions.length !==
        5
    ) {
      return;
    }

    if (
      reviewQuestions.some(
        (
          question,
        ) =>
          !reviewAnswers[
            question.id
          ]
            ?.selectedChoice,
      )
    ) {
      setError(
        "Answer all 5 review questions first.",
      );

      return;
    }

    setReviewLoading(
      true,
    );

    setError("");

    try {
      const checked =
        await Promise.all(
          reviewQuestions.map(
            async (
              question,
            ) => {
              const selectedChoice =
                reviewAnswers[
                  question.id
                ]
                  ?.selectedChoice ??
                "";

              const result =
                await checkPracticeAnswer(
                  question.id,
                  selectedChoice,
                );

              return [
                question.id,
                {
                  selectedChoice,
                  correct:
                    result.correct,
                  correctChoice:
                    result.correctChoice,
                  explanation:
                    result.explanation,
                },
              ] as const;
            },
          ),
        );

      const checkedMap =
        Object.fromEntries(
          checked,
        );

      setReviewAnswers(
        checkedMap,
      );

      setReviewSubmitted(
        true,
      );

      await saveEducationProgress({
        studentName:
          report.student.name,

        email:
          report.student.email,

        country:
          report.student.country,

        grade:
          report.student.grade,

        subject:
          "MATH",

        topic:
          reviewTopic.code,

        studentCode:
          report.student.code,

        answers:
          reviewQuestions.map(
            (
              question,
            ) => ({
              questionId:
                question.id,

              selectedChoice:
                checkedMap[
                  question.id
                ]
                  .selectedChoice ??
                "",
            }),
          ),
      });

      await refreshReport();
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Review could not be saved.",
      );
    } finally {
      setReviewLoading(
        false,
      );
    }
  }


  const attemptedTopics =
    report?.report.filter(
      (
        item,
      ) =>
        item.attempts >
          0,
    ) ??
    [];


  if (
    reviewTopic &&
    report
  ) {
    const reviewCorrect =
      reviewQuestions.filter(
        (
          question,
        ) =>
          reviewAnswers[
            question.id
          ]
            ?.correct,
      ).length;

    return (
      <main
        className="student-progress"
      >
        <header
          className="student-progress__header"
        >
          <button
            type="button"
            aria-label="Back to report"
            onClick={() => {
              setReviewTopic(
                null,
              );

              setReviewQuestions(
                [],
              );
            }}
          >
            ←
          </button>

          <div>
            <strong>
              Revise · {
                reviewTopic.name
              }
            </strong>

            <small>
              {
                unresolvedWrongCount >
                  0
                  ? `${unresolvedWrongCount} previous wrong question${
                      unresolvedWrongCount ===
                        1
                        ? ""
                        : "s"
                    } prioritized`
                  : "Fresh practice"
              }
            </small>
          </div>
        </header>


        {
          error && (
            <div
              className="student-progress__error"
            >
              {
                error
              }
            </div>
          )
        }


        <section
          className="student-progress__review"
        >
          {
            reviewQuestions.map(
              (
                question,
                index,
              ) => {
                const state =
                  reviewAnswers[
                    question.id
                  ];

                return (
                  <article
                    key={
                      question.id
                    }
                    className="student-progress__review-question"
                  >
                    <strong>
                      {
                        index + 1
                      }. {
                        question.text
                      }
                    </strong>

                    <div
                      className="student-progress__review-choices"
                    >
                      {
                        question.choices.map(
                          (
                            choice,
                            choiceIndex,
                          ) => {
                            const key =
                              [
                                "A",
                                "B",
                                "C",
                                "D",
                              ][
                                choiceIndex
                              ];

                            const selected =
                              state
                                ?.selectedChoice ===
                              key;

                            const correctChoice =
                              reviewSubmitted &&
                              state
                                ?.correctChoice ===
                              key;

                            const wrong =
                              reviewSubmitted &&
                              selected &&
                              state
                                ?.correct ===
                                false;

                            return (
                              <button
                                type="button"
                                key={
                                  key
                                }
                                disabled={
                                  reviewSubmitted
                                }
                                className={[
                                  selected
                                    ? "selected"
                                    : "",
                                  correctChoice
                                    ? "correct"
                                    : "",
                                  wrong
                                    ? "wrong"
                                    : "",
                                ]
                                  .filter(
                                    Boolean,
                                  )
                                  .join(
                                    " ",
                                  )}
                                onClick={() =>
                                  chooseReviewAnswer(
                                    question.id,
                                    key,
                                  )
                                }
                              >
                                <span>
                                  {
                                    key
                                  }
                                </span>

                                {
                                  choice
                                }
                              </button>
                            );
                          },
                        )
                      }
                    </div>

                    {
                      reviewSubmitted &&
                      state
                        ?.explanation && (
                        <small
                          className="student-progress__review-explanation"
                        >
                          {
                            state.explanation
                          }
                        </small>
                      )
                    }
                  </article>
                );
              },
            )
          }
        </section>


        {
          reviewSubmitted
            ? (
              <div
                className="student-progress__review-result"
              >
                <strong>
                  {
                    reviewCorrect
                  } / 5 correct
                </strong>

                <button
                  type="button"
                  onClick={() =>
                    void startReview(
                      reviewTopic,
                    )
                  }
                >
                  Revise Again
                </button>

                <button
                  type="button"
                  onClick={() => {
                    setReviewTopic(
                      null,
                    );

                    setReviewQuestions(
                      [],
                    );
                  }}
                >
                  Back to Report
                </button>
              </div>
            )
            : (
              <button
                type="button"
                className="student-progress__primary"
                disabled={
                  reviewLoading ||
                  reviewQuestions.some(
                    (
                      question,
                    ) =>
                      !reviewAnswers[
                        question.id
                      ]
                        ?.selectedChoice,
                  )
                }
                onClick={() =>
                  void submitReview()
                }
              >
                {
                  reviewLoading
                    ? "Checking…"
                    : "✓ Check 5"
                }
              </button>
            )
        }
      </main>
    );
  }


  return (
    <main
      className="student-progress"
    >
      <header
        className="student-progress__header"
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
            🎓 Education Report
          </strong>

          <small>
            GYAN Card · {
              studentCode
            }
          </small>
        </div>
      </header>


      {
        loading && (
          <div
            className="student-progress__state"
          >
            Loading GYAN card…
          </div>
        )
      }


      {
        error && (
          <div
            className="student-progress__error"
          >
            {
              error
            }
          </div>
        )
      }


      {
        !loading &&
        requiresSignIn &&
        !report && (
          <section
            className="student-progress__verify"
          >
            <span>
              🔐
            </span>

            <h1>
              Open GYAN Card
            </h1>

            <p>
              Verify the email used when this student card was saved.
            </p>

            {
              sent
                ? (
                  <div
                    className="student-progress__sent"
                  >
                    <strong>
                      ✉️ Check your email
                    </strong>

                    <small>
                      The secure link will return directly to student card {
                        studentCode
                      }.
                    </small>
                  </div>
                )
                : (
                  <>
                    <input
                      type="email"
                      inputMode="email"
                      autoComplete="email"
                      placeholder="Email"
                      value={
                        email
                      }
                      onChange={(
                        event,
                      ) =>
                        setEmail(
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
                          void sendAccess();
                        }
                      }}
                    />

                    <button
                      type="button"
                      disabled={
                        sending
                      }
                      onClick={() =>
                        void sendAccess()
                      }
                    >
                      {
                        sending
                          ? "Sending…"
                          : "Send Verification Link"
                      }
                    </button>
                  </>
                )
            }

            <small
              className="student-progress__privacy"
            >
              The 4-character code identifies a card; it does not unlock saved progress by itself.
            </small>
          </section>
        )
      }


      {
        !loading &&
        report && (
          <>
            <section
              className="student-progress__identity"
            >
              <div>
                <span>
                  Student
                </span>

                <strong>
                  {
                    report.student.name
                  }
                </strong>
              </div>

              <div>
                <span>
                  Grade
                </span>

                <strong>
                  {
                    gradeLabel(
                      report.student.grade,
                    )
                  }
                </strong>
              </div>

              <div>
                <span>
                  Code
                </span>

                <strong
                  className="student-progress__code"
                >
                  {
                    report.student.code
                  }
                </strong>
              </div>
            </section>


            <section
              className="student-progress__map"
            >
              <div
                className="student-progress__map-title"
              >
                <h1>
                  Topics Attempted
                </h1>

                <small>
                  🟢 Strong · 🟡 Developing · 🔴 Revise
                </small>
              </div>


              {
                attemptedTopics.length ===
                  0
                  ? (
                    <div
                      className="student-progress__state"
                    >
                      No topics attempted yet.
                    </div>
                  )
                  : (
                    <div
                      className="student-progress__topic-circles"
                    >
                      {
                        attemptedTopics.map(
                          (
                            item,
                          ) => {
                            const state =
                              heatState(
                                item,
                              );

                            return (
                              <button
                                type="button"
                                key={
                                  item.code
                                }
                                className={
                                  `student-progress__topic-circle student-progress__topic-circle--${state}`
                                }
                                disabled={
                                  reviewLoading
                                }
                                onClick={() =>
                                  void startReview(
                                    item,
                                  )
                                }
                                title="Revise this topic"
                              >
                                <span>
                                  {
                                    item.scorePercent
                                  }%
                                </span>

                                <strong>
                                  {
                                    item.name
                                  }
                                </strong>

                                <small>
                                  {
                                    state ===
                                      "red"
                                      ? "Revise"
                                      : state ===
                                        "yellow"
                                      ? "Practice"
                                      : "Keep Strong"
                                  }
                                </small>
                              </button>
                            );
                          },
                        )
                      }
                    </div>
                  )
              }
            </section>


            <p
              className="student-progress__revision-note"
            >
              Tap any topic to revise it. Previously wrong questions are prioritized; if fewer than five remain, GYAN fills the set with fresh questions from the same topic.
            </p>


            <button
              type="button"
              className="student-progress__primary"
              onClick={() =>
                onContinueLearning({
                  country:
                    report.student.country,

                  grade:
                    report.student.grade,
                })
              }
            >
              Continue Learning
            </button>
          </>
        )
      }
    </main>
  );
}