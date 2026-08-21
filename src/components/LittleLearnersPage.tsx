import {
  useEffect,
  useState,
} from "react";

import {
  loadLittleQuestions,
  saveLittleAttempt,
  type LittleQuestion,
} from "../config/littleLearners";

import LittleLearnerSettings
  from "./LittleLearnerSettings";

import {
  LITTLE_LEARNER_TOPICS,
} from "../config/littleLearnerTopics";

import "./LittleLearnersPage.css";


interface LittleLearnersPageProps {
  title?:
    string;

  level?:
    number;

  studentCode?:
    string;

  onBack:
    () => void;

  onOpenWords?:
    () => void;
}


export default function LittleLearnersPage({
  title =
    "Education ABA",

  level:
    initialLevel = 2,

  studentCode,
  onBack,
  onOpenWords,
}: LittleLearnersPageProps) {
  const [
    level,
    setLevel,
  ] =
    useState(
      initialLevel,
    );

  const [
    topic,
    setTopic,
  ] =
    useState(
      "ALL",
    );

  const [
    subtopic,
    setSubtopic,
  ] =
    useState("");

  const [
    settingsOpen,
    setSettingsOpen,
  ] =
    useState(
      false,
    );

  const [
    questions,
    setQuestions,
  ] =
    useState<
      LittleQuestion[]
    >(
      [],
    );

  const [
    index,
    setIndex,
  ] =
    useState(
      0,
    );

  const [
    loading,
    setLoading,
  ] =
    useState(
      true,
    );

  const [
    feedback,
    setFeedback,
  ] =
    useState<
      "good" |
      "try" |
      ""
    >("");


  const [
    selectedOption,
    setSelectedOption,
  ] =
    useState<
      number |
      null
    >(
      null,
    );


  const selectedTopic =
    LITTLE_LEARNER_TOPICS
      .find(
        (
          item,
        ) =>
          item.code ===
          topic,
      );

  const selectedSubtopic =
    selectedTopic
      ?.subtopics
      .find(
        (
          item,
        ) =>
          item.code ===
          subtopic,
      );

  const compactHeading =
    [
      title,
      `L${level}`,
      selectedTopic
        ?.name ??
        "Mixed",
      selectedSubtopic
        ?.name,
    ]
      .filter(
        Boolean,
      )
      .join(
        " · ",
      );


  const question =
    questions[
      index
    ];


  function speak(
    text:
      string,
  ): void {
    if (
      !(
        "speechSynthesis"
        in window
      )
    ) {
      return;
    }

    window
      .speechSynthesis
      .cancel();

    const utterance =
      new SpeechSynthesisUtterance(
        text,
      );

    utterance.rate =
      0.82;

    window
      .speechSynthesis
      .speak(
        utterance,
      );
  }


  async function refresh():
    Promise<void> {
    setLoading(
      true,
    );

    try {
      const next =
        await loadLittleQuestions({
          level,
          mode:
            "exact",
          topic,
          subtopic:
            subtopic ||
            undefined,
          limit:
            5,
        });

      setQuestions(
        next,
      );

      setIndex(
        0,
      );

      setFeedback(
        "",
      );

      setSelectedOption(
        null,
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  useEffect(
    () => {
      void refresh();
    },
    [
      level,
      topic,
      subtopic,
    ],
  );


  useEffect(
    () => {
      if (
        !question
      ) {
        return;
      }

      const timer =
        window.setTimeout(
          () => {
            speak(
              question.promptText,
            );
          },
          350,
        );

      return () => {
        window.clearTimeout(
          timer,
        );

        if (
          "speechSynthesis"
          in window
        ) {
          window
            .speechSynthesis
            .cancel();
        }
      };
    },
    [
      question?.id,
    ],
  );


  function next():
    void {
    setFeedback(
      "",
    );

    setSelectedOption(
      null,
    );

    if (
      index + 1 >=
        questions.length
    ) {
      void refresh();

      return;
    }

    setIndex(
      (
        current,
      ) =>
        current + 1,
    );
  }


  async function choose(
    optionIndex:
      number,
  ): Promise<void> {
    if (
      !question ||
      feedback
    ) {
      return;
    }

    setSelectedOption(
      optionIndex,
    );

    const key =
      [
        "A",
        "B",
        "C",
      ][
        optionIndex
      ];

    const correct =
      key ===
      question.correctOption;

    setFeedback(
      correct
        ? "good"
        : "try",
    );

    void saveLittleAttempt({
      studentCode,

      questionId:
        question.id,

      responseType:
        "tap",

      responseValue:
        key,

      correct,
    });

    if (
      correct
    ) {
      speak(
        "Good Job",
      );

      window.setTimeout(
        next,
        500,
      );
    } else {
      speak(
        "Try again",
      );

      window.setTimeout(
        () => {
          setFeedback(
            "",
          );

          setSelectedOption(
            null,
          );

          speak(
            question.promptText,
          );
        },
        500,
      );
    }
  }


  if (
    settingsOpen
  ) {
    return (
      <LittleLearnerSettings
        level={
          level
        }

        topic={
          topic
        }

        subtopic={
          subtopic
        }

        onChangeLevel={(
          value,
        ) => {
          setLevel(
            value,
          );
        }}

        onChangeTopic={(
          nextTopic,
          nextSubtopic,
        ) => {
          setTopic(
            nextTopic,
          );

          setSubtopic(
            nextSubtopic,
          );
        }}

        onClose={() => {
          setSettingsOpen(
            false,
          );
        }}
      />
    );
  }


  if (
    loading
  ) {
    return (
      <main
        className="little-learners"
      >
        <div
          className="little-learners__loading"
        >
          🌱
        </div>
      </main>
    );
  }


  if (
    !question
  ) {
    return (
      <main
        className="little-learners"
      >
        <header
          className="little-learners__top"
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

          <button
            type="button"
            aria-label="Settings"
            onClick={() =>
              setSettingsOpen(
                true,
              )
            }
          >
            ⚙️
          </button>
        </header>

        <div
          className="little-learners__no-questions"
        >
          No questions at this level/topic yet.
          Choose another level or topic.
        </div>
      </main>
    );
  }


  return (
    <main
      className="little-learners"
    >
      <header
        className="little-learners__top"
      >
        <button
          type="button"
          aria-label="Back"
          title="Back"
          onClick={
            onBack
          }
        >
          ←
        </button>

        <button
          type="button"
          aria-label="Replay"
          title="Replay"
          onClick={() =>
            speak(
              question.promptText,
            )
          }
        >
          🔊
        </button>

        <button
          type="button"
          aria-label="Settings"
          title="Parent settings"
          onClick={() =>
            setSettingsOpen(
              true,
            )
          }
        >
          ⚙️
        </button>

        {
          onOpenWords && (
            <button
              type="button"
              aria-label="Words Growing"
              title="Words Growing"
              onClick={
                onOpenWords
              }
            >
              🌱
            </button>
          )
        }
      </header>

      <div
        className="little-learners__context"
      >
        {
          compactHeading
        }
      </div>

      <section
        className="little-learners__stage"
      >
        <div
          className={[
            "little-learners__options",
            question.options.length ===
              1
              ? "little-learners__options--one"
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
            question.options.map(
              (
                option,
                optionIndex,
              ) => {
                const scale =
                  question
                    .optionScales[
                      optionIndex
                    ];

                return (
                  <button
                    type="button"
                    key={
                      `${question.id}-${optionIndex}`
                    }
                    className={
                      selectedOption ===
                        optionIndex &&
                      feedback
                        ? `little-learners__choice--${feedback}`
                        : ""
                    }
                    onClick={() =>
                      void choose(
                        optionIndex,
                      )
                    }
                  >
                    <span
                      className={
                        scale
                          ? `little-learners__visual little-learners__visual--${scale}`
                          : "little-learners__visual"
                      }
                    >
                      {
                        option
                      }
                    </span>
                  </button>
                );
              },
            )
          }
        </div>


        {
          feedback && (
            <div
              className={
                `little-learners__feedback little-learners__feedback--${feedback}`
              }
            >
              {
                feedback ===
                  "good"
                  ? "✨ ✓"
                  : "↻"
              }
            </div>
          )
        }
      </section>


      <footer
        className="little-learners__progress"
      >
        {
          questions.map(
            (
              item,
              itemIndex,
            ) => (
              <span
                key={
                  item.id
                }
                className={
                  itemIndex <=
                    index
                    ? "done"
                    : ""
                }
              >
                ●
              </span>
            ),
          )
        }
      </footer>
    </main>
  );
}
