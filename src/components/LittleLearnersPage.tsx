import {
  useEffect,
  useRef,
  useState,
} from "react";

import {
  loadLittleQuestions,
  saveLittleAttempt,
  type LittleQuestion,
} from "../config/littleLearners";

import "./LittleLearnersPage.css";


type SpeechRecognitionConstructor =
  new () => {
    lang: string;
    interimResults: boolean;
    maxAlternatives: number;

    onresult:
      (
        event: {
          results: {
            0?: {
              0?: {
                transcript?:
                  string;
              };
            };
          };
        },
      ) => void;

    onerror:
      () => void;

    onend:
      () => void;

    start:
      () => void;

    stop:
      () => void;
  };


declare global {
  interface Window {
    SpeechRecognition?:
      SpeechRecognitionConstructor;

    webkitSpeechRecognition?:
      SpeechRecognitionConstructor;
  }
}


interface LittleLearnersPageProps {
  level?:
    number;

  studentCode?:
    string;

  onBack:
    () => void;

  onOpenWords?:
    () => void;
}


function normalizeSpeech(
  value: string,
): string {
  return value
    .trim()
    .toLowerCase()
    .replace(
      /[^a-z0-9 ]/g,
      "",
    );
}


export default function LittleLearnersPage({
  level = 2,
  studentCode,
  onBack,
  onOpenWords,
}: LittleLearnersPageProps) {
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
    listening,
    setListening,
  ] =
    useState(
      false,
    );

  const [
    heard,
    setHeard,
  ] =
    useState("");

  const recognitionRef =
    useRef<
      InstanceType<
        SpeechRecognitionConstructor
      > |
      null
    >(
      null,
    );

  const question =
    questions[
      index
    ];


  function speak(
    text: string,
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

    utterance.pitch =
      1.0;

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
        await loadLittleQuestions(
          level,
        );

      setQuestions(
        next,
      );

      setIndex(
        0,
      );

      setFeedback(
        "",
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
    ],
  );


  useEffect(
    () => {
      if (
        question
      ) {
        const timer =
          window.setTimeout(
            () => {
              speak(
                question.promptText,
              );
            },
            250,
          );

        return () =>
          window.clearTimeout(
            timer,
          );
      }

      return;
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

    setHeard(
      "",
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
        question
          .acceptedWords[
            0
          ] ??
        "Good",
      );

      window.setTimeout(
        next,
        900,
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

          speak(
            question.promptText,
          );
        },
        850,
      );
    }
  }


  function startListening():
    void {
    if (
      !question
    ) {
      return;
    }

    const Constructor =
      window.SpeechRecognition ??
      window.webkitSpeechRecognition;

    if (
      !Constructor
    ) {
      setHeard(
        "Listening is not available on this browser.",
      );

      return;
    }

    recognitionRef
      .current
      ?.stop();

    const recognition =
      new Constructor();

    recognition.lang =
      "en-US";

    recognition.interimResults =
      false;

    recognition.maxAlternatives =
      1;

    recognition.onresult =
      (
        event,
      ) => {
        const transcript =
          event.results[
            0
          ]?.[
            0
          ]
            ?.transcript ??
          "";

        setHeard(
          transcript,
        );

        const normalized =
          normalizeSpeech(
            transcript,
          );

        const correct =
          question
            .acceptedWords
            .some(
              (
                word,
              ) =>
                normalized ===
                normalizeSpeech(
                  word,
                ),
            );

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
            "speech",

          responseValue:
            transcript,

          correct,
        });

        if (
          correct
        ) {
          speak(
            "Good",
          );

          window.setTimeout(
            next,
            1000,
          );
        } else {
          speak(
            "Try again",
          );
        }
      };

    recognition.onerror =
      () => {
        setListening(
          false,
        );

        setHeard(
          "I couldn't hear that.",
        );
      };

    recognition.onend =
      () => {
        setListening(
          false,
        );
      };

    recognitionRef.current =
      recognition;

    setListening(
      true,
    );

    setHeard(
      "",
    );

    recognition.start();
  }


  if (
    loading ||
    !question
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


      <section
        className="little-learners__stage"
      >
        {
          question.questionType ===
            "tap"
            ? (
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
                    " "
                  )}
              >
                {
                  question.options.map(
                    (
                      option,
                      optionIndex,
                    ) => (
                      <button
                        type="button"
                        key={
                          `${question.id}-${optionIndex}`
                        }
                        onClick={() =>
                          void choose(
                            optionIndex,
                          )
                        }
                      >
                        {
                          option
                        }
                      </button>
                    ),
                  )
                }
              </div>
            )
            : (
              <div
                className="little-learners__speak"
              >
                <button
                  type="button"
                  aria-label="Speak"
                  title="Speak"
                  className={
                    listening
                      ? "listening"
                      : ""
                  }
                  onClick={
                    startListening
                  }
                >
                  🎤
                </button>

                {
                  heard && (
                    <small>
                      {
                        heard
                      }
                    </small>
                  )
                }
              </div>
            )
        }


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
