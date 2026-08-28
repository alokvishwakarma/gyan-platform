import "./TextualPromptingTopic.css";

import {
  useEffect,
  useMemo,
  useRef,
  useState,
} from "react";


type SpeechRecognitionAlternativeLike = {
  transcript:
    string;

  confidence?:
    number;
};


type SpeechRecognitionResultLike = {
  isFinal:
    boolean;

  length:
    number;

  [index: number]:
    SpeechRecognitionAlternativeLike;
};


type SpeechRecognitionEventLike = {
  resultIndex:
    number;

  results: {
    length:
      number;

    [index: number]:
      SpeechRecognitionResultLike;
  };
};


type SpeechRecognitionErrorEventLike = {
  error:
    string;
};


type SpeechRecognitionLike = {
  continuous:
    boolean;

  interimResults:
    boolean;

  lang:
    string;

  maxAlternatives:
    number;

  onresult:
    (
      event:
        SpeechRecognitionEventLike,
    ) => void;

  onerror:
    (
      event:
        SpeechRecognitionErrorEventLike,
    ) => void;

  onend:
    () => void;

  start:
    () => void;

  stop:
    () => void;

  abort:
    () => void;
};


type SpeechRecognitionConstructorLike =
  new () =>
    SpeechRecognitionLike;


declare global {
  interface Window {
    SpeechRecognition?:
      SpeechRecognitionConstructorLike;

    webkitSpeechRecognition?:
      SpeechRecognitionConstructorLike;
  }
}


export type TextualPromptResult = {
  word:
    string;

  cue:
    string;

  cueLength:
    number;

  elapsedMs:
    number;

  createdAt:
    string;

  confirmedBy:
    "speech" |
    "parent";

  heardText?:
    string;
};


export type TextualPromptItem = {
  word:
    string;

  emoji:
    string;

  label:
    string;

  group:
    "known-independent" |
    "known-with-prompt" |
    "unfamiliar";

  acceptedSpeech:
    string[];
};


export const DEFAULT_TEXTUAL_PROMPT_ITEMS:
  TextualPromptItem[] = [
    { word: "WATER", emoji: "💧", label: "water", group: "known-independent", acceptedSpeech: ["water"] },
    { word: "APPLE", emoji: "🍎", label: "apple", group: "known-independent", acceptedSpeech: ["apple", "appl"] },
    { word: "RED", emoji: "🔴", label: "red", group: "known-independent", acceptedSpeech: ["red"] },
    { word: "YELLOW", emoji: "🟡", label: "yellow", group: "known-independent", acceptedSpeech: ["yellow"] },
    { word: "ORANGE", emoji: "🟠", label: "orange", group: "known-independent", acceptedSpeech: ["orange"] },
    { word: "EYES", emoji: "👀", label: "eyes", group: "known-independent", acceptedSpeech: ["eyes", "eye"] },
    { word: "NOSE", emoji: "👃", label: "nose", group: "known-independent", acceptedSpeech: ["nose"] },
    { word: "SHOE", emoji: "👟", label: "shoe", group: "known-independent", acceptedSpeech: ["shoe", "shoes"] },
    { word: "GO", emoji: "▶️", label: "go", group: "known-independent", acceptedSpeech: ["go"] },

    { word: "PIZZA", emoji: "🍕", label: "pizza", group: "known-with-prompt", acceptedSpeech: ["pizza"] },
    { word: "ICE CREAM", emoji: "🍦", label: "ice cream", group: "known-with-prompt", acceptedSpeech: ["ice cream", "icecream"] },
    { word: "CEREALS", emoji: "🥣", label: "cereals", group: "known-with-prompt", acceptedSpeech: ["cereals", "cereal"] },
    { word: "MILK", emoji: "🥛", label: "milk", group: "known-with-prompt", acceptedSpeech: ["milk", "mil"] },
    { word: "SLIDE", emoji: "🛝", label: "slide", group: "known-with-prompt", acceptedSpeech: ["slide"] },
    { word: "PUSH", emoji: "👉", label: "push", group: "known-with-prompt", acceptedSpeech: ["push"] },
    { word: "ARM", emoji: "💪", label: "arm", group: "known-with-prompt", acceptedSpeech: ["arm"] },
    { word: "PURPLE", emoji: "🟣", label: "purple", group: "known-with-prompt", acceptedSpeech: ["purple"] },
    { word: "BOARD", emoji: "🧾", label: "board", group: "known-with-prompt", acceptedSpeech: ["board"] },
    { word: "BIRD", emoji: "🐦", label: "bird", group: "known-with-prompt", acceptedSpeech: ["bird"] },
    { word: "TREE", emoji: "🌳", label: "tree", group: "known-with-prompt", acceptedSpeech: ["tree"] },
    { word: "LEAF", emoji: "🍃", label: "leaf", group: "known-with-prompt", acceptedSpeech: ["leaf"] },

    { word: "DAY", emoji: "🌞", label: "day", group: "unfamiliar", acceptedSpeech: ["day"] },
    { word: "DAILY", emoji: "📅", label: "daily", group: "unfamiliar", acceptedSpeech: ["daily"] },
    { word: "DESK", emoji: "🪑", label: "desk", group: "unfamiliar", acceptedSpeech: ["desk"] },
    { word: "PORT", emoji: "⚓", label: "port", group: "unfamiliar", acceptedSpeech: ["port"] },
    { word: "SPORT", emoji: "🏅", label: "sport", group: "unfamiliar", acceptedSpeech: ["sport"] },
    { word: "FAN", emoji: "🪭", label: "fan", group: "unfamiliar", acceptedSpeech: ["fan"] },
    { word: "PHONE", emoji: "📱", label: "phone", group: "unfamiliar", acceptedSpeech: ["phone"] },
    { word: "PAN", emoji: "🍳", label: "pan", group: "unfamiliar", acceptedSpeech: ["pan"] },
    { word: "ART", emoji: "🎨", label: "art", group: "unfamiliar", acceptedSpeech: ["art"] },
    { word: "SMART", emoji: "💡", label: "smart", group: "unfamiliar", acceptedSpeech: ["smart"] },
  ];


type Props = {
  studentCode?:
    string;

  items?:
    TextualPromptItem[];

  pictureOnlyMs?:
    number;

  letterDelayMs?:
    number;

  onBack?:
    () => void;

  onResult?:
    (
      result:
        TextualPromptResult,
    ) => void;
};


const STORAGE_PREFIX =
  "gyan:textual-prompting:v2";


function storageKey(
  studentCode?:
    string,
): string {
  return `${STORAGE_PREFIX}:${studentCode?.trim() || "guest"}`;
}


function safeLoad(
  studentCode?:
    string,
): TextualPromptResult[] {
  try {
    const raw =
      window.localStorage
        .getItem(
          storageKey(
            studentCode,
          ),
        );

    if (
      !raw
    ) {
      return [];
    }

    const parsed =
      JSON.parse(
        raw,
      );

    return Array.isArray(
      parsed,
    )
      ? parsed
      : [];
  } catch {
    return [];
  }
}


function safeSave(
  studentCode:
    string |
    undefined,

  rows:
    TextualPromptResult[],
): void {
  try {
    window.localStorage
      .setItem(
        storageKey(
          studentCode,
        ),

        JSON.stringify(
          rows.slice(
            -100,
          ),
        ),
      );
  } catch {
    // Practice must continue even when storage is unavailable.
  }
}


function normalizeSpeech(
  value:
    string,
): string {
  return value
    .toLowerCase()
    .replace(
      /[^a-z]/g,
      "",
    );
}


function speechMatches(
  transcript:
    string,

  acceptedSpeech:
    string[],
): boolean {
  const heard =
    normalizeSpeech(
      transcript,
    );

  if (
    !heard
  ) {
    return false;
  }

  return acceptedSpeech
    .some(
      (
        accepted,
      ) => {
        const target =
          normalizeSpeech(
            accepted,
          );

        return (
          heard ===
            target ||
          heard.endsWith(
            target,
          )
        );
      },
    );
}


function sayGoodJob():
  void {
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
      "Good job!",
    );

  utterance.rate =
    0.9;

  window
    .speechSynthesis
    .speak(
      utterance,
    );
}


export default function TextualPromptingTopic({
  studentCode,
  items =
    DEFAULT_TEXTUAL_PROMPT_ITEMS,
  pictureOnlyMs =
    2000,
  letterDelayMs =
    1000,
  onBack,
  onResult,
}: Props) {
  const [
    selectedGroup,
    setSelectedGroup,
  ] =
    useState<
      "known-independent" |
      "known-with-prompt" |
      "unfamiliar"
    >(
      "known-independent",
    );


  const usableItems =
    useMemo(
      () =>
        items.filter(
          (
            item,
          ) =>
            item.word
              .trim()
              .length >
              0 &&
            item.group ===
              selectedGroup,
        ),

      [
        items,
        selectedGroup,
      ],
    );


  const [
    index,
    setIndex,
  ] =
    useState(
      0,
    );


  const [
    visibleLetters,
    setVisibleLetters,
  ] =
    useState(
      0,
    );


  const [
    running,
    setRunning,
  ] =
    useState(
      true,
    );


  const [
    results,
    setResults,
  ] =
    useState<
      TextualPromptResult[]
    >(
      () =>
        safeLoad(
          studentCode,
        ),
    );


  const [
    lastMessage,
    setLastMessage,
  ] =
    useState(
      "",
    );


  const [
    heardText,
    setHeardText,
  ] =
    useState(
      "",
    );


  const [
    micState,
    setMicState,
  ] =
    useState<
      "unsupported" |
      "starting" |
      "listening" |
      "blocked" |
      "idle"
    >(
      () =>
        (
          window
            .SpeechRecognition ||
          window
            .webkitSpeechRecognition
        )
          ? "starting"
          : "unsupported",
    );


  const startRef =
    useRef(
      Date.now(),
    );


  const recognitionRef =
    useRef<
      SpeechRecognitionLike |
      null
    >(
      null,
    );


  const restartListeningRef =
    useRef(
      true,
    );


  const current =
    usableItems[
      index %
      Math.max(
        usableItems.length,
        1,
      )
    ];


  const currentRef =
    useRef(
      current,
    );


  const visibleLettersRef =
    useRef(
      visibleLetters,
    );


  const runningRef =
    useRef(
      running,
    );


  const resultsRef =
    useRef(
      results,
    );


  currentRef.current =
    current;

  visibleLettersRef.current =
    visibleLetters;

  runningRef.current =
    running;

  resultsRef.current =
    results;


  function restartTrial(
    nextIndex =
      index,
  ): void {
    restartListeningRef.current =
      true;

    setIndex(
      nextIndex,
    );

    setVisibleLetters(
      0,
    );

    setRunning(
      true,
    );

    setLastMessage(
      "",
    );

    setHeardText(
      "",
    );

    startRef.current =
      Date.now();
  }


  function stopListening():
    void {
    restartListeningRef.current =
      false;

    const recognition =
      recognitionRef.current;

    if (
      !recognition
    ) {
      return;
    }

    try {
      recognition.stop();
    } catch {
      // Recognition may already be stopped.
    }
  }


  function recordSuccess(
    confirmedBy:
      "speech" |
      "parent",

    transcript?:
      string,
  ): void {
    if (
      !runningRef.current
    ) {
      return;
    }

    const activeItem =
      currentRef.current;

    if (
      !activeItem
    ) {
      return;
    }

    stopListening();

    const cueLength =
      visibleLettersRef.current;

    const cue =
      cueLength ===
        0
        ? "PICTURE ONLY"
        : activeItem.word
            .slice(
              0,
              cueLength,
            );

    const result:
      TextualPromptResult = {
        word:
          activeItem.word,

        cue,

        cueLength,

        elapsedMs:
          Date.now() -
          startRef.current,

        createdAt:
          new Date()
            .toISOString(),

        confirmedBy,

        heardText:
          transcript,
      };


    const nextRows =
      [
        ...resultsRef.current,
        result,
      ]
        .slice(
          -100,
        );


    resultsRef.current =
      nextRows;

    setResults(
      nextRows,
    );

    safeSave(
      studentCode,
      nextRows,
    );

    onResult?.(
      result,
    );

    setRunning(
      false,
    );

    setLastMessage(
      cueLength ===
        0
        ? `Independent: ${activeItem.label}`
        : `Said at cue: ${cue}`,
    );

    sayGoodJob();

    window
      .setTimeout(
        () => {
          restartTrial(
            (
              index +
              1
            ) %
            usableItems.length,
          );
        },
        1000,
      );
  }


  useEffect(
    () => {
      if (
        !current ||
        !running
      ) {
        return;
      }

      const timers:
        number[] =
        [];


      const first =
        window
          .setTimeout(
            () => {
              setVisibleLetters(
                1,
              );
            },

            Math.max(
              0,
              pictureOnlyMs,
            ),
          );


      timers.push(
        first,
      );


      for (
        let n =
          2;

        n <=
          current.word.length;

        n +=
          1
      ) {
        const timer =
          window
            .setTimeout(
              () => {
                setVisibleLetters(
                  n,
                );
              },

              Math.max(
                0,
                pictureOnlyMs,
              ) +
              (
                n -
                1
              ) *
              Math.max(
                100,
                letterDelayMs,
              ),
            );


        timers.push(
          timer,
        );
      }


      return () =>
        timers
          .forEach(
            (
              timer,
            ) =>
              window
                .clearTimeout(
                  timer,
                ),
          );
    },

    [
      current,
      index,
      running,
      pictureOnlyMs,
      letterDelayMs,
    ],
  );


  useEffect(
    () => {
      const Recognition =
        window
          .SpeechRecognition ||
        window
          .webkitSpeechRecognition;


      if (
        !Recognition
      ) {
        return;
      }


      const recognition =
        new Recognition();


      recognition.continuous =
        true;

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
          if (
            !runningRef.current
          ) {
            return;
          }


          let latestText =
            "";


          for (
            let resultIndex =
              event.resultIndex;

            resultIndex <
              event.results.length;

            resultIndex +=
              1
          ) {
            const result =
              event.results[
                resultIndex
              ];


            for (
              let alternativeIndex =
                0;

              alternativeIndex <
                result.length;

              alternativeIndex +=
                1
            ) {
              const transcript =
                result[
                  alternativeIndex
                ]
                  .transcript
                  .trim();


              if (
                transcript
              ) {
                latestText =
                  transcript;
              }


              const activeItem =
                currentRef.current;


              if (
                activeItem &&
                speechMatches(
                  transcript,
                  activeItem
                    .acceptedSpeech,
                )
              ) {
                setHeardText(
                  transcript,
                );

                recordSuccess(
                  "speech",
                  transcript,
                );

                return;
              }
            }
          }


          if (
            latestText
          ) {
            setHeardText(
              latestText,
            );
          }
        };


      recognition.onerror =
        (
          event,
        ) => {
          if (
            event.error ===
              "not-allowed" ||
            event.error ===
              "service-not-allowed"
          ) {
            restartListeningRef.current =
              false;

            setMicState(
              "blocked",
            );

            return;
          }


          if (
            event.error ===
              "audio-capture"
          ) {
            setMicState(
              "blocked",
            );

            return;
          }


          setMicState(
            "idle",
          );
        };


      recognition.onend =
        () => {
          if (
            !restartListeningRef.current ||
            !runningRef.current
          ) {
            return;
          }


          window
            .setTimeout(
              () => {
                try {
                  recognition
                    .start();

                  setMicState(
                    "listening",
                  );
                } catch {
                  // Browser can reject an immediate duplicate start.
                }
              },
              150,
            );
        };


      recognitionRef.current =
        recognition;


      const timer =
        window
          .setTimeout(
            () => {
              try {
                recognition
                  .start();

                setMicState(
                  "listening",
                );
              } catch {
                setMicState(
                  "idle",
                );
              }
            },
            0,
          );


      return () => {
        restartListeningRef.current =
          false;

        window
          .clearTimeout(
            timer,
          );

        try {
          recognition
            .abort();
        } catch {
          // Ignore browser-specific shutdown errors.
        }

        recognitionRef.current =
          null;
      };
    },

    [],
  );


  useEffect(
    () => {
      if (
        !running
      ) {
        return;
      }


      restartListeningRef.current =
        true;


      const recognition =
        recognitionRef.current;


      if (
        !recognition
      ) {
        return;
      }


      if (
        micState ===
          "blocked" ||
        micState ===
          "unsupported"
      ) {
        return;
      }


      const timer =
        window
          .setTimeout(
            () => {
              try {
                recognition
                  .start();

                setMicState(
                  "listening",
                );
              } catch {
                // It may already be listening, which is fine.
              }
            },
            0,
          );


      return () => {
        window
          .clearTimeout(
            timer,
          );
      };
    },

    [
      index,
      running,
    ],
  );


  if (
    !current
  ) {
    return (
      <div
        style={{
          padding:
            20,
        }}
      >
        No textual-prompt items are configured.
      </div>
    );
  }


  function noResponse():
    void {
    if (
      !running
    ) {
      return;
    }


    stopListening();

    setRunning(
      false,
    );

    setLastMessage(
      "No response recorded",
    );
  }


  function tryAgain():
    void {
    restartTrial(
      index,
    );
  }


  return (
    <section
      className="textual-prompting"
      aria-label="Textual Prompting practice"
    >
      <div
        className="textual-prompting__topbar"
      >
        {
          onBack && (
            <button
              type="button"
              className="textual-prompting__back"
              onClick={() => {
                stopListening();

                onBack();
              }}
            >
              ← Back
            </button>
          )
        }

        <div>
          <h2>
            📝 Textual Prompting
          </h2>

          <p>
            Known • Textual prompt • Unfamiliar decoding
          </p>
        </div>
      </div>


      <div
        className="textual-prompting__sets"
        aria-label="Textual Prompting word set"
      >
        <button
          type="button"
          className={
            selectedGroup ===
              "known-independent"
              ? "is-active"
              : ""
          }
          onClick={() => {
            setSelectedGroup(
              "known-independent",
            );

            restartTrial(
              0,
            );
          }}
        >
          ✓ Known
        </button>

        <button
          type="button"
          className={
            selectedGroup ===
              "known-with-prompt"
              ? "is-active"
              : ""
          }
          onClick={() => {
            setSelectedGroup(
              "known-with-prompt",
            );

            restartTrial(
              0,
            );
          }}
        >
          📝 Prompt
        </button>

        <button
          type="button"
          className={
            selectedGroup ===
              "unfamiliar"
              ? "is-active"
              : ""
          }
          onClick={() => {
            setSelectedGroup(
              "unfamiliar",
            );

            restartTrial(
              0,
            );
          }}
        >
          🔤 Unfamiliar
        </button>
      </div>


      <div
        className="textual-prompting__card"
      >
        <div
          className="textual-prompting__progress"
        >
          Question {
            index +
            1
          } of {
            usableItems.length
          }
        </div>


        <div
          className="textual-prompting__picture"
          aria-label={
            current.label
          }
        >
          <span
            aria-hidden="true"
          >
            {
              current.emoji
            }
          </span>
        </div>


        <div
          className="textual-prompting__cue"
          aria-live="polite"
        >
          {
            visibleLetters ===
              0
              ? (
                <span
                  className="textual-prompting__waiting"
                >
                  …
                </span>
              )
              : (
                <strong>
                  {
                    current.word
                      .slice(
                        0,
                        visibleLetters,
                      )
                  }
                </strong>
              )
          }
        </div>


        <div
          className={[
            "textual-prompting__mic",
            `textual-prompting__mic--${micState}`,
          ].join(
            " ",
          )}
        >
          {
            micState ===
              "listening"
              ? "🎤 Listening…"
              : micState ===
                  "blocked"
                ? "🎤 Microphone unavailable — use ✓ Accept"
                : micState ===
                    "unsupported"
                  ? "🎤 Speech recognition not supported — use ✓ Accept"
                  : "🎤 Starting…"
          }
        </div>


        {
          heardText && (
            <div
              className="textual-prompting__heard"
            >
              Heard: “{
                heardText
              }”
            </div>
          )
        }


        {
          running
            ? (
              <div
                className="textual-prompting__actions"
              >
                <button
                  type="button"
                  className="textual-prompting__said"
                  onClick={() =>
                    recordSuccess(
                      "parent",
                    )
                  }
                >
                  ✓ Accept
                </button>

                <button
                  type="button"
                  className="textual-prompting__secondary"
                  onClick={
                    noResponse
                  }
                >
                  No response
                </button>
              </div>
            )
            : (
              <div
                className="textual-prompting__result"
                aria-live="polite"
              >
                <strong>
                  {
                    lastMessage
                  }
                </strong>

                {
                  lastMessage ===
                    "No response recorded"
                    ? (
                      <button
                        type="button"
                        className="textual-prompting__next"
                        onClick={
                          tryAgain
                        }
                      >
                        ↻ Try again
                      </button>
                    )
                    : (
                      <span
                        className="textual-prompting__good"
                      >
                        ✨ Good job!
                      </span>
                    )
                }
              </div>
            )
        }
      </div>


      <details
        className="textual-prompting__recent"
      >
        <summary>
          Recent cue levels
        </summary>

        {
          results.length ===
            0
            ? (
              <p>
                No observations yet.
              </p>
            )
            : (
              <ul>
                {
                  results
                    .slice(
                      -8,
                    )
                    .reverse()
                    .map(
                      (
                        row,
                        rowIndex,
                      ) => (
                        <li
                          key={
                            `${row.createdAt}-${rowIndex}`
                          }
                        >
                          <strong>
                            {
                              row.word
                            }
                          </strong>
                          : {
                            row.cue
                          }
                          {" · "}
                          {
                            row.confirmedBy ===
                              "speech"
                              ? "🎤"
                              : "✓"
                          }
                        </li>
                      ),
                    )
                }
              </ul>
            )
        }
      </details>
    </section>
  );
}
