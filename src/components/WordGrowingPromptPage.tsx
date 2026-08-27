import {
  useEffect,
  useMemo,
  useRef,
  useState,
} from "react";


type PromptWord = {
  word: string;
  emoji: string;
  imageSrc?: string;
  alt: string;
};


type PromptResult = {
  word: string;
  cue: string;
  cueLength: number;
  elapsedMs: number;
  recordedAt: string;
};


interface WordGrowingPromptPageProps {
  onBack: () => void;
  studentCode?: string;
}


const WORDS: PromptWord[] = [
  {
    word: "MILK",
    emoji: "🥛",
    alt: "Milk",
  },
  {
    word: "APPLE",
    emoji: "🍎",
    alt: "Apple",
  },
  {
    word: "DUCK",
    emoji: "🦆",
    alt: "Duck",
  },
  {
    word: "BALL",
    emoji: "⚽",
    alt: "Ball",
  },
  {
    word: "BUS",
    emoji: "🚌",
    alt: "Bus",
  },
  {
    word: "WATER",
    emoji: "💧",
    alt: "Water",
  },
];


const PICTURE_ONLY_MS = 2000;
const LETTER_STEP_MS = 1000;


function storageKey(
  studentCode?: string,
): string {
  return `gyan_word_growing_prompt_${studentCode || "guest"}`;
}


function loadSavedResults(
  studentCode?: string,
): PromptResult[] {
  try {
    const raw =
      window.localStorage.getItem(
        storageKey(studentCode),
      );

    if (!raw) {
      return [];
    }

    const parsed = JSON.parse(raw);

    return Array.isArray(parsed)
      ? parsed
      : [];
  } catch {
    return [];
  }
}


function saveResults(
  studentCode: string | undefined,
  results: PromptResult[],
): void {
  try {
    window.localStorage.setItem(
      storageKey(studentCode),
      JSON.stringify(results.slice(-100)),
    );
  } catch {
    // Practice should continue even if storage is unavailable.
  }
}


export default function WordGrowingPromptPage({
  onBack,
  studentCode,
}: WordGrowingPromptPageProps) {
  const [
    questionIndex,
    setQuestionIndex,
  ] = useState(0);

  const [
    visibleLetters,
    setVisibleLetters,
  ] = useState(0);

  const [
    running,
    setRunning,
  ] = useState(true);

  const [
    completed,
    setCompleted,
  ] = useState(false);

  const [
    results,
    setResults,
  ] = useState<PromptResult[]>(
    () => loadSavedResults(studentCode),
  );

  const startedAtRef = useRef(
    Date.now(),
  );

  const current =
    WORDS[questionIndex];

  const currentCue =
    current.word.slice(
      0,
      visibleLetters,
    );

  const sessionResults = useMemo(
    () =>
      results.slice(
        Math.max(
          0,
          results.length - questionIndex,
        ),
      ),
    [results, questionIndex],
  );


  useEffect(
    () => {
      if (
        !running ||
        completed
      ) {
        return;
      }

      if (
        visibleLetters >=
        current.word.length
      ) {
        return;
      }

      const delay =
        visibleLetters === 0
          ? PICTURE_ONLY_MS
          : LETTER_STEP_MS;

      const timer =
        window.setTimeout(
          () => {
            setVisibleLetters(
              (value) =>
                Math.min(
                  value + 1,
                  current.word.length,
                ),
            );
          },
          delay,
        );

      return () => {
        window.clearTimeout(
          timer,
        );
      };
    },
    [
      running,
      completed,
      visibleLetters,
      current.word,
    ],
  );


  function startQuestion(
    index: number,
  ): void {
    setQuestionIndex(index);
    setVisibleLetters(0);
    setRunning(true);
    setCompleted(false);
    startedAtRef.current =
      Date.now();
  }


  function recordSaidIt(): void {
    if (completed) {
      return;
    }

    const elapsedMs =
      Date.now() -
      startedAtRef.current;

    const result: PromptResult = {
      word: current.word,
      cue:
        visibleLetters === 0
          ? "PICTURE ONLY"
          : currentCue,
      cueLength:
        visibleLetters,
      elapsedMs,
      recordedAt:
        new Date().toISOString(),
    };

    const nextResults = [
      ...results,
      result,
    ];

    setResults(nextResults);
    saveResults(
      studentCode,
      nextResults,
    );
    setRunning(false);
    setCompleted(true);
  }


  function nextQuestion(): void {
    const nextIndex =
      questionIndex + 1;

    if (
      nextIndex >=
      WORDS.length
    ) {
      setRunning(false);
      setCompleted(true);
      return;
    }

    startQuestion(
      nextIndex,
    );
  }


  function restartSession(): void {
    startQuestion(0);
  }


  const sessionFinished =
    questionIndex ===
      WORDS.length - 1 &&
    completed;


  return (
    <main
      style={{
        maxWidth: "760px",
        margin: "0 auto",
        padding: "18px 16px 30px",
        fontFamily:
          "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif",
      }}
    >
      <header
        style={{
          display: "flex",
          alignItems: "center",
          justifyContent:
            "space-between",
          gap: "12px",
          marginBottom: "16px",
        }}
      >
        <button
          type="button"
          onClick={onBack}
          style={{
            minHeight: "42px",
            padding: "0 14px",
            borderRadius: "10px",
            border:
              "1px solid #d0d5dd",
            background: "white",
            cursor: "pointer",
          }}
        >
          ← Back
        </button>

        <div
          style={{
            textAlign: "center",
            minWidth: 0,
          }}
        >
          <h1
            style={{
              margin: 0,
              fontSize: "1.35rem",
            }}
          >
            🌱 Word Growing
          </h1>
          <div
            style={{
              marginTop: "2px",
              color: "#667085",
              fontSize: "0.82rem",
            }}
          >
            Picture → letters → spoken word
          </div>
        </div>

        <div
          style={{
            minWidth: "72px",
            textAlign: "right",
            fontSize: "0.82rem",
            color: "#667085",
          }}
        >
          {questionIndex + 1}/
          {WORDS.length}
        </div>
      </header>

      <section
        aria-live="polite"
        style={{
          border:
            "1px solid #e4e7ec",
          borderRadius: "18px",
          padding: "24px 18px",
          textAlign: "center",
          background: "#fff",
        }}
      >
        <div
          style={{
            color: "#667085",
            fontSize: "0.85rem",
            marginBottom: "8px",
          }}
        >
          Wait and let the child try before the letters appear.
        </div>

        {current.imageSrc ? (
          <img
            src={current.imageSrc}
            alt={current.alt}
            style={{
              width: "180px",
              height: "180px",
              objectFit: "contain",
              margin: "8px auto 14px",
              display: "block",
            }}
          />
        ) : (
          <div
            role="img"
            aria-label={
              current.alt
            }
            style={{
              fontSize: "8rem",
              lineHeight: 1.1,
              margin: "8px 0 14px",
            }}
          >
            {current.emoji}
          </div>
        )}

        <div
          style={{
            minHeight: "86px",
            display: "flex",
            alignItems: "center",
            justifyContent:
              "center",
          }}
        >
          {visibleLetters === 0 ? (
            <span
              style={{
                color: "#98a2b3",
                fontSize: "1rem",
              }}
            >
              picture only…
            </span>
          ) : (
            <strong
              style={{
                fontSize: "3.4rem",
                letterSpacing:
                  "0.12em",
                lineHeight: 1,
              }}
            >
              {currentCue}
            </strong>
          )}
        </div>

        {!completed ? (
          <button
            type="button"
            onClick={
              recordSaidIt
            }
            style={{
              width: "100%",
              minHeight: "58px",
              marginTop: "16px",
              border: 0,
              borderRadius: "14px",
              fontSize: "1.15rem",
              fontWeight: 750,
              background: "#1570ef",
              color: "white",
              cursor: "pointer",
            }}
          >
            ✓ He said it
          </button>
        ) : (
          <div
            style={{
              marginTop: "16px",
            }}
          >
            <div
              style={{
                padding: "12px",
                borderRadius: "12px",
                background: "#f2f4f7",
                fontWeight: 650,
              }}
            >
              Recorded cue: {results.at(-1)?.cue || "—"}
            </div>

            {sessionFinished ? (
              <button
                type="button"
                onClick={
                  restartSession
                }
                style={{
                  width: "100%",
                  minHeight: "52px",
                  marginTop: "12px",
                  borderRadius: "12px",
                  border:
                    "1px solid #d0d5dd",
                  background: "white",
                  fontWeight: 700,
                  cursor: "pointer",
                }}
              >
                ↻ Start again
              </button>
            ) : (
              <button
                type="button"
                onClick={
                  nextQuestion
                }
                style={{
                  width: "100%",
                  minHeight: "52px",
                  marginTop: "12px",
                  borderRadius: "12px",
                  border:
                    "1px solid #d0d5dd",
                  background: "white",
                  fontWeight: 700,
                  cursor: "pointer",
                }}
              >
                Next word →
              </button>
            )}
          </div>
        )}
      </section>

      <section
        style={{
          marginTop: "16px",
          padding: "14px",
          borderRadius: "14px",
          background: "#f9fafb",
          border:
            "1px solid #eaecf0",
        }}
      >
        <strong>
          Current pattern
        </strong>
        <div
          style={{
            marginTop: "6px",
            color: "#475467",
            fontSize: "0.9rem",
            lineHeight: 1.5,
          }}
        >
          Picture only for 2 seconds → first letter → one more letter every second.
          Tap <strong>He said it</strong> immediately when the word is spoken.
        </div>
      </section>

      {sessionResults.length > 0 && (
        <section
          style={{
            marginTop: "16px",
          }}
        >
          <h2
            style={{
              margin: "0 0 8px",
              fontSize: "1rem",
            }}
          >
            This session
          </h2>

          <div
            style={{
              display: "grid",
              gap: "7px",
            }}
          >
            {sessionResults.map(
              (
                result,
                index,
              ) => (
                <div
                  key={`${result.recordedAt}-${index}`}
                  style={{
                    display: "grid",
                    gridTemplateColumns:
                      "1fr auto",
                    gap: "10px",
                    padding:
                      "9px 11px",
                    borderRadius:
                      "10px",
                    background:
                      "#fff",
                    border:
                      "1px solid #eaecf0",
                  }}
                >
                  <strong>
                    {result.word}
                  </strong>
                  <span>
                    {result.cue}
                  </span>
                </div>
              ),
            )}
          </div>
        </section>
      )}
    </main>
  );
}
