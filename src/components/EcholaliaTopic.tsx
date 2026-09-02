import {
  useEffect,
  useRef,
  useState,
} from "react";

import "./EcholaliaTopic.css";


type Item = {
  question:
    string;

  emoji:
    string;

  model:
    string;

  accepted:
    string[];
};


const ITEMS:
  Item[] = [
    {
      question: "What do you want?",
      emoji: "🥛",
      model: "MILK",
      accepted: ["milk", "mil"],
    },
    {
      question: "What do you want?",
      emoji: "💧",
      model: "WATER",
      accepted: ["water"],
    },
    {
      question: "What do you want?",
      emoji: "🖊️",
      model: "PEN",
      accepted: ["pen"],
    },
    {
      question: "What do you want?",
      emoji: "🍎",
      model: "APPLE",
      accepted: ["apple", "appl"],
    },
    {
      question: "What do you want?",
      emoji: "🍕",
      model: "PIZZA",
      accepted: ["pizza"],
    },
    {
      question: "What do you want?",
      emoji: "🍦",
      model: "ICE CREAM",
      accepted: ["ice cream", "icecream"],
    },
    {
      question: "What do you need?",
      emoji: "🙋",
      model: "HELP",
      accepted: ["help", "hep"],
    },
    {
      question: "What do you want me to do?",
      emoji: "📦",
      model: "OPEN",
      accepted: ["open"],
    },
    {
      question: "Do you want more?",
      emoji: "➕",
      model: "MORE",
      accepted: ["more"],
    },
  ];


interface Props {
  studentCode?:
    string;

  onBack:
    () => void;
}


type ExistingSpeechRecognition =
  NonNullable<
    Window["SpeechRecognition"]
  > extends new () => infer T
    ? T
    : never;



const DELAYS = [
  {
    label: "Immediate",
    ms: 100,
  },
  {
    label: "0.3 sec",
    ms: 300,
  },
  {
    label: "0.5 sec",
    ms: 500,
  },
  {
    label: "1 sec",
    ms: 1000,
  },
] as const;


const RESPONSE_WINDOW_MS =
  3500;


function normalize(
  value:
    string,
): string {
  return value
    .toLowerCase()
    .replace(
      /[^a-z ]/g,
      "",
    )
    .replace(
      /\s+/g,
      " ",
    )
    .trim();
}


function matchesTarget(
  transcript:
    string,

  accepted:
    string[],
): boolean {
  const heard =
    normalize(
      transcript,
    );

  return accepted
    .some(
      (
        value,
      ) => {
        const target =
          normalize(
            value,
          );

        return (
          heard === target ||
          heard.endsWith(
            ` ${target}`,
          )
        );
      },
    );
}


export default function EcholaliaTopic({
  onBack,
}: Props) {
  const [
    index,
    setIndex,
  ] =
    useState(
      0,
    );

  const [
    delayIndex,
    setDelayIndex,
  ] =
    useState(
      1,
    );

  const [
    showModel,
    setShowModel,
  ] =
    useState(
      false,
    );

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
    useState(
      "",
    );

  const [
    status,
    setStatus,
  ] =
    useState("");

  const recognitionRef =
    useRef<
      ExistingSpeechRecognition |
      null
    >(
      null,
    );

  const responseTimerRef =
    useRef<
      number |
      null
    >(
      null,
    );

  const advancingRef =
    useRef(
      false,
    );

  const item =
    ITEMS[
      index
    ];

  const itemRef =
    useRef(
      item,
    );

  // eslint-disable-next-line react-hooks/refs
  itemRef.current =
    item;

  const delay =
    DELAYS[
      delayIndex
    ];


  function stopListening():
    void {
    setListening(
      false,
    );

    if (
      responseTimerRef.current !==
      null
    ) {
      window.clearTimeout(
        responseTimerRef.current,
      );

      responseTimerRef.current =
        null;
    }

    const recognition =
      recognitionRef.current;

    if (
      recognition
    ) {
      try {
        recognition.stop();
      } catch {
        // Recognition may already be stopped.
      }
    }
  }


  function goNext(
    good:
      boolean,

    transcript =
      "",
  ): void {
    if (
      advancingRef.current
    ) {
      return;
    }

    advancingRef.current =
      true;

    stopListening();

    setHeard(
      transcript,
    );

    if (
      good
    ) {
      setStatus(
        "✨ Good job!",
      );

      window
        .speechSynthesis
        .cancel();

      const praise =
        new SpeechSynthesisUtterance(
          "Good job!",
        );

      praise.rate =
        0.9;

      window
        .speechSynthesis
        .speak(
          praise,
        );
    } else {
      setStatus(
        transcript
          ? `Next one`
          : "No response — next one",
      );
    }

    window
      .setTimeout(
        () => {
          setIndex(
            (
              current,
            ) =>
              (
                current +
                1
              ) %
              ITEMS.length,
          );

          setShowModel(
            false,
          );

          setHeard(
            "",
          );

          setStatus(
            "",
          );

          advancingRef.current =
            false;
        },
        good
          ? 1000
          : 650,
      );
  }


  function beginListening():
    void {
    const recognition =
      recognitionRef.current;

    if (
      !recognition
    ) {
      setStatus(
        "🎤 Microphone unavailable",
      );

      return;
    }

    setHeard(
      "",
    );

    setListening(
      true,
    );

    try {
      recognition.start();
    } catch {
      // It may already be starting/listening.
    }

    responseTimerRef.current =
      window
        .setTimeout(
          () => {
            goNext(
              false,
            );
          },
          RESPONSE_WINDOW_MS,
        );
  }


  function speakModel():
    void {
    setShowModel(
      true,
    );

    window
      .speechSynthesis
      .cancel();

    const modelUtterance =
      new SpeechSynthesisUtterance(
        item.model,
      );

    modelUtterance.rate =
      0.82;

    // Important: listen only AFTER GYAN finishes saying the model,
    // so GYAN does not recognize its own "MILK", "PEN", etc.
    modelUtterance.onend =
      () => {
        beginListening();
      };

    window
      .speechSynthesis
      .speak(
        modelUtterance,
      );
  }


  function startTrial():
    void {
    stopListening();

    setShowModel(
      false,
    );

    setHeard(
      "",
    );

    setStatus(
      "",
    );

    window
      .speechSynthesis
      .cancel();

    const questionUtterance =
      new SpeechSynthesisUtterance(
        item.question,
      );

    questionUtterance.rate =
      0.82;

    questionUtterance.onend =
      () => {
        window
          .setTimeout(
            () => {
              speakModel();
            },
            delay.ms,
          );
      };

    window
      .speechSynthesis
      .speak(
        questionUtterance,
      );
  }


  useEffect(
    () => {
      const Constructor =
        window
          .SpeechRecognition ||
        window
          .webkitSpeechRecognition;

      if (
        !Constructor
      ) {
        return;
      }

      const recognition =
        new Constructor();

      recognition.continuous =
        false;

      recognition.interimResults =
        true;

      recognition.lang =
        "en-US";

      recognition.maxAlternatives =
        3;

      recognition.onresult =
        (
          event,
        ) => {
          const active =
            itemRef.current;

          let latest =
            "";

          for (
            let i =
              event.resultIndex;

            i <
              event.results.length;

            i +=
              1
          ) {
            const result =
              event.results[
                i
              ];

            for (
              let j =
                0;

              j <
                result.length;

              j +=
                1
            ) {
              const transcript =
                result[
                  j
                ]
                  .transcript
                  .trim();

              if (
                transcript
              ) {
                latest =
                  transcript;
              }

              if (
                matchesTarget(
                  transcript,
                  active.accepted,
                )
              ) {
                goNext(
                  true,
                  transcript,
                );

                return;
              }
            }

            // A final spoken response was heard, but it was not the target:
            // move on rather than asking the parent to score it.
            if (
              result.isFinal &&
              latest
            ) {
              goNext(
                false,
                latest,
              );

              return;
            }
          }

          if (
            latest
          ) {
            setHeard(
              latest,
            );
          }
        };

      recognition.onerror =
        () => {
          setListening(
            false,
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

      return () => {
        if (
          responseTimerRef.current !==
          null
        ) {
          window.clearTimeout(
            responseTimerRef.current,
          );
        }

        try {
          recognition.abort();
        } catch {
          // Ignore browser-specific shutdown errors.
        }

        recognitionRef.current =
          null;
      };
    },
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [],
  );


  useEffect(
    () => {
      const timer =
        window
          .setTimeout(
            () => {
              startTrial();
            },
            250,
          );

      return () => {
        window.clearTimeout(
          timer,
        );

        stopListening();

        window
          .speechSynthesis
          .cancel();
      };
    },
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [
      index,
      delayIndex,
    ],
  );


  return (
    <main
      className="echolalia-practice"
    >
      <header
        className="echolalia-practice__top"
      >
        <button
          type="button"
          onClick={
            onBack
          }
        >
          ←
        </button>

        <div>
          <strong>
            💬 Echolalia
          </strong>

          <small>
            Question → rapid model → GYAN listens
          </small>
        </div>
      </header>


      <div
        className="echolalia-practice__delay"
      >
        <span>
          Delay after question:
        </span>

        {
          DELAYS.map(
            (
              option,
              optionIndex,
            ) => (
              <button
                type="button"
                key={
                  option.label
                }
                className={
                  delayIndex ===
                    optionIndex
                    ? "is-active"
                    : ""
                }
                onClick={() => {
                  setDelayIndex(
                    optionIndex,
                  );
                }}
              >
                {
                  option.label
                }
              </button>
            ),
          )
        }
      </div>


      <section
        className="echolalia-practice__card"
      >
        <div
          className="echolalia-practice__count"
        >
          {
            index +
            1
          } / {
            ITEMS.length
          }
        </div>

        <div
          className="echolalia-practice__question"
        >
          {
            item.question
          }
        </div>

        <div
          className="echolalia-practice__picture"
          aria-label={
            item.model
          }
        >
          {
            item.emoji
          }
        </div>

        <div
          className="echolalia-practice__prompt"
          aria-live="polite"
        >
          {
            showModel
              ? item.model
              : "…"
          }
        </div>

        <div
          className="echolalia-practice__phase"
        >
          {
            listening
              ? "🎤 Listening for his answer…"
              : showModel
                ? "GYAN modeled the answer"
                : "Finishing the question…"
          }
        </div>

        {
          heard && (
            <div
              className="echolalia-practice__heard"
            >
              Heard: “{
                heard
              }”
            </div>
          )
        }

        {
          status && (
            <div
              className="echolalia-practice__good"
            >
              {
                status
              }
            </div>
          )
        }

        <div
          className="echolalia-practice__actions"
        >
          <button
            type="button"
            onClick={
              startTrial
            }
          >
            ↻ Repeat
          </button>

          <button
            type="button"
            onClick={() =>
              goNext(
                false,
              )
            }
          >
            Skip
          </button>
        </div>

        <small
          className="echolalia-practice__note"
        >
          No parent scoring is normally needed.
          GYAN waits until it has finished saying the model,
          then listens for about 3.5 seconds.
          If it hears
          {" "}
          <strong>
            {
              item.model
            }
          </strong>
          ,
          it says “Good job!”.
          A different final response, or no response,
          moves to the next question.
        </small>
      </section>
    </main>
  );
}
