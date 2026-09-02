import {
  useEffect,
  useState,
} from "react";

import QRCode
  from "qrcode";

import EducationPortal
  from "./EducationPortal";

import MockTestsPage
  from "./MockTestsPage";

import LittleLearnersExperience
  from "./LittleLearnersExperience";

import {
  checkPracticeAnswer,
  loadPracticeQuestions,
  loadSubjects,
  loadTopics,
  type EducationCountry,
  type LearningItem,
  type PracticeQuestion,
  type TopicItem,
} from "../config/educationLearning";

import {
  saveEducationProgress,
  sendEducationRecoveryLink,
  type EducationReportTopic,
  type SavedStudentCard,
} from "../config/educationProgress";

import "./EducationLearningHub.css";


type PortalSelection = {
  type:
    | "grade"
    | "program";

  code: string;
  name: string;
};


type Step =
  | "portal"
  | "subjects"
  | "topics"
  | "questions"
  | "report"
  | "student-card"
  | "little-learners"
  | "mock-tests";


type AnswerState = {
  selectedChoice?:
    string;

  result?: {
    correct: boolean;
    correctChoice: string;
    explanation: string;
  };
};


interface EducationLearningHubProps {
  country:
    EducationCountry;

  activeGyanCode?:
    string;

  activeGyanName?:
    string;

  activeGyanEmail?:
    string;

  activeGyanEmailKnown?:
    boolean;

  onBack:
    () => void;
}


export default function EducationLearningHub({
  country,
  activeGyanCode,
  activeGyanName,
  activeGyanEmail,
  activeGyanEmailKnown,
  onBack,
}: EducationLearningHubProps) {
  const [
    step,
    setStep,
  ] =
    useState<Step>(() =>
      window.location.pathname ===
      "/education/aba"
        ? "little-learners"
        : "portal",
    );

  const [
    grade,
    setGrade,
  ] =
    useState<
      PortalSelection |
      null
    >(
      null,
    );

  const [
    mockProgram,
    setMockProgram,
  ] =
    useState<
      | "JEE"
      | "NEET"
      | null
    >(
      null,
    );


  const [
    expandedSubjectCode,
    setExpandedSubjectCode,
  ] =
    useState<string | null>(
      null,
    );

  const [
    subjectTopicsLoading,
    setSubjectTopicsLoading,
  ] =
    useState(
      false,
    );


  const [
    subjects,
    setSubjects,
  ] =
    useState<
      LearningItem[]
    >(
      [],
    );


  const [
    subject,
    setSubject,
  ] =
    useState<
      LearningItem |
      null
    >(
      null,
    );

  const [
    topics,
    setTopics,
  ] =
    useState<
      TopicItem[]
    >(
      [],
    );

  const [
    topic,
    setTopic,
  ] =
    useState<
      TopicItem |
      null
    >(
      null,
    );

  const [
    questions,
    setQuestions,
  ] =
    useState<
      PracticeQuestion[]
    >(
      [],
    );

  const [
    answers,
    setAnswers,
  ] =
    useState<
      Record<
        number,
        AnswerState
      >
    >(
      {},
    );

  const [
    submitted,
    setSubmitted,
  ] =
    useState(
      false,
    );

  const [
    reportTopics,
    setReportTopics,
  ] =
    useState<
      EducationReportTopic[]
    >(
      [],
    );

  const [
    saveFormOpen,
    setSaveFormOpen,
  ] =
    useState(
      false,
    );

  const [
    studentName,
    setStudentName,
  ] =
    useState("");

  const [
    studentEmail,
    setStudentEmail,
  ] =
    useState("");

  const [
    savedStudent,
    setSavedStudent,
  ] =
    useState<
      SavedStudentCard |
      null
    >(
      null,
    );

  const [
    qrDataUrl,
    setQrDataUrl,
  ] =
    useState("");

  const [
    recoverySent,
    setRecoverySent,
  ] =
    useState(
      false,
    );


  const [
    loading,
    setLoading,
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
    autoSaveMessage,
    setAutoSaveMessage,
  ] =
    useState("");


  const normalizedActiveGyanCode =
    activeGyanCode
      ?.trim()
      .toUpperCase() ??
    "";

  const activeGyanCodeLabel =
    normalizedActiveGyanCode
      ? `${normalizedActiveGyanCode}${
          activeGyanEmailKnown ===
            false
            ? "*"
            : ""
        }`
      : "";


  function learningCountryFor(
    selection:
      PortalSelection |
      null,
  ): EducationCountry {
    /*
     * IIT-JEE and NEET catalogs are India programs.
     * They must continue to use IN even if the portal's
     * general country selection is currently US.
     */
    if (
      selection?.type ===
        "program" &&
      (
        selection.code ===
          "PROGRAM_JEE" ||
        selection.code ===
          "PROGRAM_NEET"
      )
    ) {
      return "IN";
    }

    return country;
  }


  const educationAccessNotice =
    normalizedActiveGyanCode &&
    activeGyanEmailKnown ===
      false
      ? (
          <div
            className="education-learning__access-warning"
            role="note"
          >
            <strong>
              ⚠ [{activeGyanCodeLabel}]
            </strong>{" "}
            Add a recovery email when convenient. It helps restore this GYAN if browser/device access code is lost.
          </div>
        )
      : null;


  useEffect(() => {
    const syncEducationRoute =
      (): void => {
        setStep(
          window.location.pathname ===
            "/education/aba"
            ? "little-learners"
            : "portal",
        );
      };

    window.addEventListener(
      "popstate",
      syncEducationRoute,
    );

    return () => {
      window.removeEventListener(
        "popstate",
        syncEducationRoute,
      );
    };
  }, []);


  async function loadTopicList(
    selection:
      PortalSelection,

    selectedSubject:
      LearningItem,
  ): Promise<void> {
    const next =
      await loadTopics(
        learningCountryFor(
          selection,
        ),
        selection.code,
        selectedSubject.code,
      );

    setSubject(
      selectedSubject,
    );

    setTopics(
      next,
    );

    setStep(
      "topics",
    );
  }


  async function toggleProgramSubject(
    selectedSubject:
      LearningItem,
  ): Promise<void> {
    if (
      !grade ||
      grade.type !==
        "program"
    ) {
      return;
    }

    if (
      expandedSubjectCode ===
        selectedSubject.code
    ) {
      setExpandedSubjectCode(
        null,
      );
      return;
    }

    setSubjectTopicsLoading(
      true,
    );
    setError(
      "",
    );

    try {
      const nextTopics =
        await loadTopics(
          learningCountryFor(
            grade,
          ),
          grade.code,
          selectedSubject.code,
        );

      setSubject(
        selectedSubject,
      );
      setTopics(
        nextTopics,
      );
      setExpandedSubjectCode(
        selectedSubject.code,
      );
    } catch (caught) {
      setError(
        caught instanceof Error
          ? caught.message
          : "Topics unavailable.",
      );
    } finally {
      setSubjectTopicsLoading(
        false,
      );
    }
  }


  async function selectPortal(
    selection:
      PortalSelection,
  ): Promise<void> {
    if (
      selection.type ===
        "program" &&
      selection.code ===
        "LITTLE_LEARNERS"
    ) {
      window.history.pushState(
        {},
        "",
        "/education/aba",
      );

      setStep(
        "little-learners",
      );
      return;
    }

    if (
      selection.type ===
        "program"
    ) {
      const normalizedProgramCode =
        selection.code
          .trim()
          .replace(/[^A-Z0-9]+/gi, "_")
          .toUpperCase();

      /*
       * Keep IIT-JEE UI aliases mapped to the existing
       * PROGRAM_IIT catalog key used by GYAN data.
       *
       * Config may call the program IIT-JEE / IIT_JEE / JEE,
       * but those labels must not create a new empty
       * PROGRAM_IIT_JEE grade bucket.
       */
      const programGradeCode =
        normalizedProgramCode === "IIT" ||
        normalizedProgramCode === "IIT_JEE" ||
        normalizedProgramCode === "JEE"
          ? "PROGRAM_JEE"
          : normalizedProgramCode.startsWith("PROGRAM_")
            ? normalizedProgramCode
            : `PROGRAM_${normalizedProgramCode}`;

      const programSelection:
        PortalSelection = {
        type:
          "program",

        code:
          programGradeCode,

        name:
          selection.name,
      };

      setGrade(programSelection);
      setSubject(null);
      setTopic(null);
      setExpandedSubjectCode(null);
      setLoading(true);
      setError("");

      try {
        const nextSubjects =
          await loadSubjects(
            learningCountryFor(
              programSelection,
            ),
            programGradeCode,
          );

        setSubjects(nextSubjects);

        if (
          nextSubjects.length === 1
        ) {
          await loadTopicList(
            programSelection,
            nextSubjects[0],
          );
          return;
        }

        if (
          nextSubjects.length === 0
        ) {
          setError(
            "No subjects are configured for this program yet.",
          );
        }

        setStep("subjects");
      } catch (caught) {
        setError(
          caught instanceof Error
            ? caught.message
            : "Program could not be loaded.",
        );
      } finally {
        setLoading(false);
      }

      return;
    }

    setGrade(
      selection,
    );
    setExpandedSubjectCode(
      null,
    );

    setLoading(
      true,
    );

    setError("");

    try {
      const subjects =
        await loadSubjects(
          country,
          selection.code,
        );

      /*
       * Grade 6 currently has only Mathematics.
       * Skip a redundant subject screen when there
       * is exactly one subject.
       */
      if (
        subjects.length ===
          1
      ) {
        await loadTopicList(
          selection,
          subjects[0],
        );

        return;
      }

      /*
       * Keep the multi-subject architecture ready
       * for later grades.
       */
      setSubject(
        null,
      );

      setStep(
        "subjects",
      );

      setError(
        subjects.length ===
          0
          ? "No subjects are configured for this grade yet."
          : "",
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Subjects unavailable.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  async function selectTopic(
    item:
      TopicItem,
  ): Promise<void> {
    if (
      !grade ||
      !subject
    ) {
      return;
    }

    setTopic(
      item,
    );

    setLoading(
      true,
    );

    setError("");
    setAutoSaveMessage("");

    try {
      const next =
        await loadPracticeQuestions(
          learningCountryFor(
            grade,
          ),
          grade.code,
          subject.code,
          item.code,
        );

      setQuestions(
        next,
      );

      setAnswers(
        {},
      );

      setSubmitted(
        false,
      );

      setStep(
        "questions",
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Questions unavailable.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  async function newFive():
    Promise<void> {
    if (
      !grade ||
      !subject ||
      !topic
    ) {
      return;
    }

    setLoading(
      true,
    );

    setError("");

    try {
      const next =
        await loadPracticeQuestions(
          learningCountryFor(
            grade,
          ),
          grade.code,
          subject.code,
          topic.code,
        );

      setQuestions(
        next,
      );

      setAnswers(
        {},
      );

      setSubmitted(
        false,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Questions unavailable.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  function selectChoice(
    questionId:
      number,

    choice:
      string,
  ): void {
    if (
      submitted
    ) {
      return;
    }

    setAnswers(
      (
        current,
      ) => ({
        ...current,

        [
          questionId
        ]: {
          ...current[
            questionId
          ],

          selectedChoice:
            choice,
        },
      }),
    );
  }


  async function submitAnswers():
    Promise<void> {
    if (
      questions.some(
        (
          question,
        ) =>
          !answers[
            question.id
          ]?.selectedChoice,
      )
    ) {
      setError(
        "Please answer all 5 questions before submitting.",
      );

      return;
    }

    setLoading(
      true,
    );

    setError("");

    try {
      const entries =
        await Promise.all(
          questions.map(
            async (
              question,
            ) => {
              const selectedChoice =
                answers[
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
                  result,
                },
              ] as const;
            },
          ),
        );

      setAnswers(
        Object.fromEntries(
          entries,
        ),
      );

      setSubmitted(
        true,
      );

      if (
        normalizedActiveGyanCode &&
        grade &&
        subject &&
        topic
      ) {
        /*
         * Unified GYAN identity owns the Education save.
         * A recovery email is optional and must never
         * prevent an attempt from being saved.
         */
        const normalizedActiveEmail =
          activeGyanEmail
            ?.trim()
            .toLowerCase() ??
          "";

        setAutoSaveMessage(
          `Saving to [${activeGyanCodeLabel}]…`,
        );

        try {
          const checkedAnswers =
            Object.fromEntries(
              entries,
            );

          const saved =
            await saveEducationProgress({
              studentName:
                activeGyanName
                  ?.trim() ||
                "GYAN Learner",

              email:
                normalizedActiveEmail,

              country:
                learningCountryFor(
                  grade,
                ),

              grade:
                grade.code,

              subject:
                subject.code,

              topic:
                topic.code,

              studentCode:
                normalizedActiveGyanCode,

              answers:
                questions.map(
                  (question) => ({
                    questionId:
                      question.id,

                    selectedChoice:
                      checkedAnswers[
                        question.id
                      ]?.selectedChoice ??
                      "",
                  }),
                ),
            });

          setSavedStudent(
            saved.student,
          );

          setReportTopics(
            saved.report,
          );

          setAutoSaveMessage(
            `✓ Saved to [${activeGyanCodeLabel}]`,
          );
        } catch (
          saveCaught
        ) {
          setAutoSaveMessage(
            "⚠ Progress could not be saved automatically.",
          );

          setError(
            saveCaught instanceof
              Error
              ? saveCaught.message
              : "Progress could not be saved automatically.",
          );
        }
      }
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Answers could not be checked.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  const correctCount =
    questions.filter(
      (
        question,
      ) =>
        answers[
          question.id
        ]?.result
          ?.correct,
    )
      .length;

  const answeredCount =
    questions.filter(
      (
        question,
      ) =>
        Boolean(
          answers[
            question.id
          ]?.selectedChoice,
        ),
    ).length;

  const canSubmit =
    questions.length === 5 &&
    answeredCount === 5 &&
    !submitted;



  function currentHeatmap():
    EducationReportTopic[] {
    return topics.map(
      (
        item,
      ) => {
        if (
          item.code !==
            topic?.code ||
          !submitted
        ) {
          return {
            code:
              item.code,
            name:
              item.name,
            attempts:
              0,
            questionsAnswered:
              0,
            correctAnswers:
              0,
            scorePercent:
              null,
          };
        }

        return {
          code:
            item.code,
          name:
            item.name,
          attempts:
            1,
          questionsAnswered:
            5,
          correctAnswers:
            correctCount,
          scorePercent:
            correctCount *
            20,
        };
      },
    );
  }


  async function saveProgress():
    Promise<void> {
    if (
      !grade ||
      !subject ||
      !topic ||
      !submitted
    ) {
      return;
    }

    const normalizedName =
      studentName.trim();

    const normalizedEmail =
      studentEmail
        .trim()
        .toLowerCase();

    if (!normalizedName) {
      setError(
        "Enter the student's name.",
      );

      return;
    }

    if (
      normalizedEmail &&
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        normalizedEmail,
      )
    ) {
      setError(
        "Enter a valid email address.",
      );

      return;
    }

    setLoading(
      true,
    );

    setError("");

    try {
      const saved =
        await saveEducationProgress({
          studentName:
            normalizedName,

          email:
            normalizedEmail,

          country:
            learningCountryFor(
              grade,
            ),

          grade:
            grade.code,

          subject:
            subject.code,

          topic:
            topic.code,

          studentCode:
            savedStudent
              ?.code,

          answers:
            questions.map(
              (
                question,
              ) => ({
                questionId:
                  question.id,

                selectedChoice:
                  answers[
                    question.id
                  ]
                    ?.selectedChoice ??
                  "",
              }),
            ),
        });

      setSavedStudent(
        saved.student,
      );

      setReportTopics(
        saved.report,
      );

      const qr =
        await QRCode.toDataURL(
          saved.student.cardUrl,
          {
            width:
              320,
            margin:
              1,
          },
        );

      setQrDataUrl(
        qr,
      );

      setSaveFormOpen(
        false,
      );

      setStep(
        "student-card",
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Progress could not be saved.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  async function sendRecovery():
    Promise<void> {
    if (
      !savedStudent
    ) {
      return;
    }

    setLoading(
      true,
    );

    setError("");

    try {
      await sendEducationRecoveryLink(
        savedStudent.email,
      );

      setRecoverySent(
        true,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Recovery email could not be sent.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  if (
    step ===
      "little-learners"
  ) {
    return (
      <>
        {educationAccessNotice}

        <LittleLearnersExperience
          onBack={() => {
            window.history.pushState(
              {},
              "",
              "/education",
            );

            setStep(
              "portal",
            );
          }}
        />
      </>
    );
  }


  if (
    step ===
      "mock-tests" &&
    mockProgram
  ) {
    return (
      <>
        {educationAccessNotice}

        <MockTestsPage
          program={
            mockProgram
          }

          onBack={() => {
            setStep(
              "portal",
            );
          }}
        />
      </>
    );
  }


  if (
    step ===
      "portal"
  ) {
    return (
      <>
        {educationAccessNotice}

        <EducationPortal
          country={
            country
          }

          onBack={
            onBack
          }

          onMockTests={(
            program,
          ) => {
            setMockProgram(
              program,
            );

            setStep(
              "mock-tests",
            );
          }}

          onSelect={(
            selection,
          ) => {
            void selectPortal(
              selection,
            );
          }}
        />
      </>
    );
  }


  return (
    <main
      className="education-learning"
    >
      {educationAccessNotice}

      <header
        className="education-learning__header"
      >
        <button
          type="button"
          onClick={() => {
            if (
              step ===
                "student-card" ||
              step ===
                "report"
            ) {
              setStep(
                "questions",
              );

              return;
            }

            if (
              step ===
                "questions"
            ) {
              if (
                grade?.type ===
                  "program"
              ) {
                setStep(
                  "subjects",
                );

                setExpandedSubjectCode(
                  subject?.code ??
                    null,
                );
              } else {
                setStep(
                  "topics",
                );
              }

              return;
            }

            if (
              step ===
                "topics" &&
              subjects.length >
                1
            ) {
              setStep(
                "subjects",
              );

              return;
            }

            setStep(
              "portal",
            );
          }}
        >
          ←
        </button>

        <div>
          <strong>
            🎓 Education
          </strong>

          <small>
            {
              [
                grade?.name,
                subject?.name,
                topic?.name,
              ]
                .filter(
                  Boolean,
                )
                .join(
                  " › ",
                )
            }
          </small>
        </div>
      </header>


      {
        error && (
          <div
            className="education-learning__error"
          >
            {
              error
            }
          </div>
        )
      }


      {
        loading && (
          <div
            className="education-learning__state"
          >
            Loading…
          </div>
        )
      }


      {
        !loading &&
        step ===
          "subjects" && (
          <section>
            <h1>
              {
                grade?.type ===
                  "program"
                  ? "Choose a subject / topic"
                  : "Choose a subject"
              }
            </h1>

            {
              grade?.type ===
                "program" ? (
                <div
                  className="education-learning__subject-accordion"
                >
                  {
                    subjects.map(
                      (item) => {
                        const expanded =
                          expandedSubjectCode ===
                            item.code;

                        return (
                          <section
                            key={
                              item.code
                            }
                            className={[
                              "education-learning__subject-block",
                              expanded
                                ? "education-learning__subject-block--expanded"
                                : "",
                            ]
                              .filter(
                                Boolean,
                              )
                              .join(
                                " ",
                              )}
                          >
                            <button
                              type="button"
                              className="education-learning__subject-toggle"
                              onClick={() =>
                                void toggleProgramSubject(
                                  item,
                                )
                              }
                              aria-expanded={
                                expanded
                              }
                            >
                              <strong>
                                {
                                  item.name
                                    .replace(
                                      /^JEE\s+/i,
                                      "",
                                    )
                                    .replace(
                                      /^NEET\s+/i,
                                      "",
                                    )
                                }
                              </strong>

                              <span>
                                {
                                  expanded
                                    ? "▴"
                                    : "▾"
                                }
                              </span>
                            </button>

                            {
                              expanded && (
                                <div
                                  className="education-learning__subject-topics"
                                >
                                  {
                                    subjectTopicsLoading ? (
                                      <div
                                        className="education-learning__subject-topics-state"
                                      >
                                        Loading topics…
                                      </div>
                                    ) : topics.length >
                                      0 ? (
                                      <div
                                        className="education-learning__topic-grid--compact"
                                      >
                                        {
                                          topics.map(
                                            (topicItem) => (
                                              <button
                                                key={
                                                  topicItem.code
                                                }
                                                type="button"
                                                disabled={
                                                  topicItem.questionCount <
                                                    5
                                                }
                                                onClick={() =>
                                                  void selectTopic(
                                                    topicItem,
                                                  )
                                                }
                                              >
                                                <strong>
                                                  {
                                                    topicItem.name
                                                  }
                                                </strong>

                                                <small>
                                                  {
                                                    topicItem.questionCount
                                                  }
                                                  {" "}
                                                  questions
                                                </small>
                                              </button>
                                            ),
                                          )
                                        }
                                      </div>
                                    ) : (
                                      <div
                                        className="education-learning__subject-topics-state"
                                      >
                                        No topics configured yet.
                                      </div>
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
              ) : (
                <div
                  className="education-learning__cards"
                >
                  {
                    subjects.map(
                      (item) => (
                        <button
                          key={
                            item.code
                          }
                          type="button"
                          onClick={() => {
                            if (
                              !grade
                            ) {
                              return;
                            }

                            void loadTopicList(
                              grade,
                              item,
                            );
                          }}
                        >
                          <strong>
                            {
                              item.name
                            }
                          </strong>
                        </button>
                      ),
                    )
                  }
                </div>
              )
            }
          </section>
        )
      }


      {
        !loading &&
        step ===
          "topics" && (
          <section>
            <h1>
              Choose a topic
            </h1>

            <div
              className="education-learning__cards"
            >
              {
                topics.map(
                  (
                    item,
                  ) => (
                    <button
                      key={
                        item.code
                      }
                      type="button"
                      disabled={
                        item.questionCount <
                          5
                      }
                      onClick={() =>
                        void selectTopic(
                          item,
                        )
                      }
                    >
                      <strong>
                        {
                          item.name
                        }
                      </strong>

                      <small>
                        {
                          item.subtopicCount
                        }{" "}
                        subtopics ·{" "}
                        {
                          item.questionCount
                        }{" "}
                        questions
                      </small>
                    </button>
                  ),
                )
              }
            </div>
          </section>
        )
      }


      {
        !loading &&
        step ===
          "questions" && (
          <section
            className="education-learning__questions"
          >
            <div
              className="education-learning__questions-heading"
            >
              <div>
                <h1>
                  {
                    topic?.name
                  }
                </h1>

                <small>
                  5 random questions
                </small>
              </div>

              <div
                className="education-learning__question-actions"
              >
                <button
                  type="button"
                  onClick={() =>
                    void newFive()
                  }
                >
                  🔄 New 5
                </button>

                <button
                  type="button"
                  disabled={
                    !canSubmit
                  }
                  onClick={() =>
                    void submitAnswers()
                  }
                  title={
                    canSubmit
                      ? "Submit 5 answers"
                      : "Answer all 5 questions first"
                  }
                >
                  ✓ Submit
                </button>
              </div>
            </div>


            {
              questions.map(
                (
                  question,
                  questionIndex,
                ) => {
                  const state =
                    answers[
                      question.id
                    ];

                  return (
                    <article
                      className="education-learning__question-card"
                      key={
                        question.id
                      }
                    >
                      <div
                        className="education-learning__question-number"
                      >
                        <strong>
                          {
                            questionIndex +
                            1
                          }.
                        </strong>

                        <small>
                          {
                            question.difficulty
                          }
                        </small>
                      </div>

                      <h2>
                        {
                          question.text
                        }
                      </h2>

                      <div
                        className="education-learning__choices"
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

                              const correct =
                                submitted &&
                                state
                                  ?.result
                                  ?.correctChoice ===
                                key;

                              const wrongSelected =
                                submitted &&
                                selected &&
                                !state
                                  ?.result
                                  ?.correct;

                              return (
                                <button
                                  type="button"
                                  key={
                                    key
                                  }
                                  disabled={
                                    submitted
                                  }
                                  className={[
                                    selected
                                      ? "selected"
                                      : "",

                                    correct
                                      ? "correct"
                                      : "",

                                    wrongSelected
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
                                    selectChoice(
                                      question.id,
                                      key,
                                    )
                                  }
                                >
                                  <b>
                                    {
                                      key
                                    }.
                                  </b>{" "}
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
                        submitted &&
                        state
                          ?.result && (
                          <div
                            className={[
                              "education-learning__answer",
                              state.result
                                .correct
                                ? "correct"
                                : "wrong",
                            ].join(
                              " ",
                            )}
                          >
                            <strong>
                              {
                                state.result
                                  .correct
                                  ? "✓ Correct"
                                  : `Correct answer: ${state.result.correctChoice}`
                              }
                            </strong>

                            {
                              state.result
                                .explanation && (
                                <span>
                                  {
                                    state.result
                                      .explanation
                                  }
                                </span>
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


            {
              submitted && (
                <div
                  className="education-learning__result-summary"
                >
                  <strong>
                    {
                      correctCount
                    }{" "}
                    / 5 correct
                  </strong>

                  <span>
                    {
                      correctCount >=
                        4
                        ? "🟢 Strong"
                        : correctCount >=
                            3
                          ? "🟡 Developing"
                          : "🔴 Needs Practice"
                    }
                  </span>

                  {autoSaveMessage && (
                    <small
                      className="education-learning__autosave"
                    >
                      {autoSaveMessage}
                    </small>
                  )}

                  <button
                    type="button"
                    className="education-learning__primary"
                    onClick={() => {
                      setReportTopics(
                        currentHeatmap(),
                      );

                      setStep(
                        "report",
                      );
                    }}
                  >
                    View Learning Map
                  </button>

                  <button
                    type="button"
                    className="education-learning__secondary"
                    onClick={() =>
                      void newFive()
                    }
                  >
                    🔄 New 5 Questions
                  </button>

                  <button
                    type="button"
                    className="education-learning__secondary"
                    onClick={() =>
                      setStep(
                        "topics",
                      )
                    }
                  >
                    Choose Another Topic
                  </button>
                </div>
              )
            }
          </section>
        )
      }


      {
        !loading &&
        step ===
          "report" && (
          <section
            className="education-learning__report"
          >
            <div
              className="education-learning__report-title"
            >
              <div>
                <h1>
                  Learning Map
                </h1>

                <small>
                  🟢 Strong · 🟡 Developing · 🔴 Needs Practice · ⚪ Not attempted
                </small>
              </div>
            </div>

            <div
              className="education-learning__heatmap"
            >
              {
                reportTopics.map(
                  (
                    item,
                  ) => {
                    const state =
                      item.scorePercent ==
                        null
                        ? "none"
                        : item.scorePercent >=
                            80
                          ? "green"
                          : item.scorePercent >=
                              50
                            ? "yellow"
                            : "red";

                    return (
                      <button
                        type="button"
                        key={
                          item.code
                        }
                        className={
                          `education-learning__heatmap-item education-learning__heatmap-item--${state}`
                        }
                        onClick={() => {
                          const selectedTopic =
                            topics.find(
                              (
                                candidate,
                              ) =>
                                candidate.code ===
                                item.code,
                            );

                          if (
                            selectedTopic
                          ) {
                            void selectTopic(
                              selectedTopic,
                            );
                          }
                        }}
                      >
                        <strong>
                          {
                            item.name
                          }
                        </strong>

                        <small>
                          {
                            item.scorePercent ==
                              null
                              ? "Not attempted"
                              : `${item.scorePercent}%`
                          }
                        </small>
                      </button>
                    );
                  },
                )
              }
            </div>

            {normalizedActiveGyanCode ? (
              <div
                className="education-learning__autosave-note"
              >
                <strong>
                  ✓ Progress saves automatically to [{activeGyanCodeLabel}]
                </strong>
              </div>
            ) : (
              <button
                type="button"
                className="education-learning__primary"
                onClick={() =>
                  setSaveFormOpen(
                    true,
                  )
                }
              >
                Save My Progress
              </button>
            )}

            {
              !normalizedActiveGyanCode &&
              saveFormOpen && (
                <div
                  className="education-learning__save-form"
                >
                  <input
                    value={
                      studentName
                    }
                    placeholder="Student name"
                    autoComplete="name"
                    onChange={(
                      event,
                    ) =>
                      setStudentName(
                        event.target.value,
                      )
                    }
                  />

                  <input
                    type="email"
                    inputMode="email"
                    value={
                      studentEmail
                    }
                    placeholder="Parent / Guardian Email"
                    autoComplete="email"
                    onChange={(
                      event,
                    ) =>
                      setStudentEmail(
                        event.target.value,
                      )
                    }
                  />

                  <button
                    type="button"
                    className="education-learning__primary"
                    onClick={() =>
                      void saveProgress()
                    }
                  >
                    Save & Create GYAN Card
                  </button>
                </div>
              )
            }
          </section>
        )
      }


      {
        !loading &&
        step ===
          "student-card" &&
        savedStudent && (
          <section
            className="education-learning__student-card"
          >
            <span
              className="education-learning__student-card-icon"
            >
              🎓
            </span>

            <h1>
              Your GYAN Card is ready
            </h1>

            <strong>
              {
                savedStudent.name
              }
            </strong>

            <div
              className="education-learning__student-code"
            >
              <small>
                GYAN Code
              </small>

              <b>
                {
                  savedStudent.code
                }
              </b>
            </div>

            {
              qrDataUrl && (
                <img
                  src={
                    qrDataUrl
                  }
                  alt={`QR code for GYAN student ${savedStudent.code}`}
                />
              )
            }

            <small>
              The code identifies this card. Email verification protects recovery and access on another device.
            </small>

            <button
              type="button"
              className="education-learning__primary"
              disabled={
                recoverySent
              }
              onClick={() =>
                void sendRecovery()
              }
            >
              {
                recoverySent
                  ? "✓ Recovery Email Sent"
                  : "Verify Email / Send Recovery Link"
              }
            </button>

            <button
              type="button"
              className="education-learning__secondary"
              onClick={() => {
                setStep(
                  "topics",
                );

                setSubmitted(
                  false,
                );
              }}
            >
              Continue Learning
            </button>
          </section>
        )
      }
    </main>
  );
}
