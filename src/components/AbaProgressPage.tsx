import {
  useEffect,
  useMemo,
  useState,
} from "react";

import {
  loadAbaDifficultQuestions,
  loadAbaProgress,
  rememberLittleStudentCode,
  type AbaProgressReport,
  type LittleQuestion,
} from "../config/littleLearners";

import "./AbaProgressPage.css";


interface AbaProgressPageProps {
  studentCode?:
    string;

  onBack:
    () => void;

  onStartReview:
    (
      questions:
        LittleQuestion[],

      studentCode:
        string,
    ) => void;
}


function stateIcon(
  state:
    "green" |
    "yellow" |
    "red",
): string {
  if (
    state ===
      "green"
  ) {
    return "🟢";
  }

  if (
    state ===
      "yellow"
  ) {
    return "🟡";
  }

  return "🔴";
}


export default function AbaProgressPage({
  studentCode,
  onBack,
  onStartReview,
}: AbaProgressPageProps) {
  const [
    report,
    setReport,
  ] =
    useState<
      AbaProgressReport |
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
    reviewLoading,
    setReviewLoading,
  ] =
    useState(
      false,
    );

  const [
    error,
    setError,
  ] =
    useState("");


  useEffect(
    () => {
      let active =
        true;

      setLoading(
        true,
      );

      setError("");

      void loadAbaProgress(
        studentCode,
      )
        .then(
          (
            next,
          ) => {
            if (
              !active
            ) {
              return;
            }

            setReport(
              next,
            );

            rememberLittleStudentCode(
              next.student.code,
            );
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

            setError(
              caught instanceof
                Error
                ? caught.message
                : "ABA progress could not be loaded.",
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


  const difficult =
    useMemo(
      () =>
        (
          report?.questions ??
          []
        )
          .filter(
            (
              item,
            ) =>
              item.wrongCount >
                0,
          )
          .sort(
            (
              first,
              second,
            ) => {
              const firstRank =
                first.state ===
                  "red"
                  ? 0
                  : first.state ===
                    "yellow"
                  ? 1
                  : 2;

              const secondRank =
                second.state ===
                  "red"
                  ? 0
                  : second.state ===
                    "yellow"
                  ? 1
                  : 2;

              return (
                firstRank -
                  secondRank ||
                second.wrongCount -
                  first.wrongCount ||
                first.accuracyPercent -
                  second.accuracyPercent
              );
            },
          ),
      [
        report,
      ],
    );


  async function startReview():
    Promise<void> {
    if (
      !report
    ) {
      return;
    }

    setReviewLoading(
      true,
    );

    setError("");

    try {
      const questions =
        await loadAbaDifficultQuestions({
          studentCode:
            report.student.code,

          limit:
            5,
        });

      if (
        questions.length ===
          0
      ) {
        setError(
          "No review questions are available yet.",
        );

        return;
      }

      onStartReview(
        questions,
        report.student.code,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Review questions could not be loaded.",
      );
    } finally {
      setReviewLoading(
        false,
      );
    }
  }


  return (
    <main
      className="aba-progress"
    >
      <header
        className="aba-progress__header"
      >
        <button
          type="button"
          aria-label="Back"
          onClick={
            onBack
          }
        >
          ←
        </button>

        <div>
          <strong>
            🌱 ABA Progress
          </strong>

          <small>
            What is growing · what needs practice
          </small>
        </div>

        <span />
      </header>


      {
        loading && (
          <div
            className="aba-progress__state"
          >
            Loading progress…
          </div>
        )
      }


      {
        error && (
          <div
            className="aba-progress__error"
          >
            {
              error
            }
          </div>
        )
      }


      {
        !loading &&
        report && (
          <>
            <section
              className="aba-progress__student"
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
                  Attempts
                </span>

                <strong>
                  {
                    report.summary.attempts
                  }
                </strong>
              </div>

              <div>
                <span>
                  Correct
                </span>

                <strong>
                  {
                    report.summary.accuracyPercent
                  }%
                </strong>
              </div>
            </section>


            <section
              className="aba-progress__section"
            >
              <div
                className="aba-progress__section-title"
              >
                <strong>
                  Topics
                </strong>

                <small>
                  🟢 strong · 🟡 growing · 🔴 revise
                </small>
              </div>

              <div
                className="aba-progress__topics"
              >
                {
                  report.topics.map(
                    (
                      topic,
                    ) => (
                      <article
                        key={
                          topic.code
                        }
                        className={
                          `aba-progress__topic aba-progress__topic--${topic.state}`
                        }
                      >
                        <span
                          aria-hidden="true"
                        >
                          {
                            stateIcon(
                              topic.state,
                            )
                          }
                        </span>

                        <strong>
                          {
                            topic.name
                          }
                        </strong>

                        <small>
                          {
                            topic.correctCount
                          } / {
                            topic.attempts
                          } correct
                        </small>

                        <small>
                          {
                            topic.redQuestions
                          } need review
                        </small>
                      </article>
                    ),
                  )
                }
              </div>
            </section>


            <section
              className="aba-progress__section"
            >
              <div
                className="aba-progress__section-title"
              >
                <strong>
                  Questions to Improve
                </strong>

                <small>
                  Previous failures are kept even after improvement
                </small>
              </div>

              {
                difficult.length ===
                  0
                  ? (
                    <div
                      className="aba-progress__state"
                    >
                      No failed questions yet. 🌱
                    </div>
                  )
                  : (
                    <div
                      className="aba-progress__questions"
                    >
                      {
                        difficult.map(
                          (
                            item,
                          ) => (
                            <article
                              key={
                                item.questionId
                              }
                              className={
                                `aba-progress__question aba-progress__question--${item.state}`
                              }
                            >
                              <span
                                className="aba-progress__question-state"
                              >
                                {
                                  stateIcon(
                                    item.state,
                                  )
                                }
                              </span>

                              <div>
                                <strong>
                                  {
                                    item.promptText
                                  }
                                </strong>

                                <small>
                                  L{
                                    item.level
                                  } · {
                                    item.topicName
                                  }{
                                    item.subtopicName
                                      ? ` · ${item.subtopicName}`
                                      : ""
                                  }
                                </small>
                              </div>

                              <div
                                className="aba-progress__question-score"
                              >
                                <strong>
                                  {
                                    item.wrongCount
                                  }×
                                </strong>

                                <small>
                                  wrong
                                </small>
                              </div>
                            </article>
                          ),
                        )
                      }
                    </div>
                  )
              }
            </section>


            <button
              type="button"
              className="aba-progress__review-button"
              disabled={
                reviewLoading ||
                report.summary.questionsTried ===
                  0
              }
              onClick={() =>
                void startReview()
              }
            >
              {
                reviewLoading
                  ? "Preparing…"
                  : "🔁 Practice 5 Difficult Questions"
              }
            </button>


            <p
              className="aba-progress__note"
            >
              A question turns green after repeated recent success.
              Earlier wrong answers stay in history, so improvement remains visible.
            </p>
          </>
        )
      }
    </main>
  );
}
