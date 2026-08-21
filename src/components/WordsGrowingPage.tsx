import {
  useEffect,
  useMemo,
  useState,
} from "react";

import {
  loadChildWords,
  saveChildWord,
  type ChildWord,
  type MonthlyWordCount,
} from "../config/littleLearners";

import "./WordsGrowingPage.css";


interface WordsGrowingPageProps {
  studentCode:
    string;

  onBack:
    () => void;
}


function WordChart({
  data,
}: {
  data:
    MonthlyWordCount[];
}) {
  if (
    data.length ===
      0
  ) {
    return (
      <div
        className="words-growing__empty-chart"
      >
        Add the first independent word 🌱
      </div>
    );
  }

  const width =
    320;

  const height =
    140;

  const pad =
    22;

  const max =
    Math.max(
      1,
      ...data.map(
        (
          item,
        ) =>
          item.count,
      ),
    );

  const points =
    data.map(
      (
        item,
        index,
      ) => {
        const x =
          data.length ===
            1
            ? width /
              2
            : pad +
              (
                index /
                (
                  data.length -
                  1
                )
              ) *
              (
                width -
                2 *
                pad
              );

        const y =
          height -
          pad -
          (
            item.count /
            max
          ) *
          (
            height -
            2 *
            pad
          );

        return {
          ...item,
          x,
          y,
        };
      },
    );

  return (
    <svg
      viewBox={
        `0 0 ${width} ${height}`
      }
      role="img"
      aria-label="Independent words over time"
      className="words-growing__chart"
    >
      <polyline
        points={
          points
            .map(
              (
                point,
              ) =>
                `${point.x},${point.y}`,
            )
            .join(
              " ",
            )
        }
        fill="none"
        stroke="currentColor"
        strokeWidth="3"
      />

      {
        points.map(
          (
            point,
          ) => (
            <g
              key={
                point.month
              }
            >
              <circle
                cx={
                  point.x
                }
                cy={
                  point.y
                }
                r="4"
                fill="currentColor"
              />

              <text
                x={
                  point.x
                }
                y={
                  height -
                  4
                }
                textAnchor="middle"
                fontSize="9"
                fill="currentColor"
              >
                {
                  point.month
                    .slice(
                      5,
                    )
                }
              </text>
            </g>
          ),
        )
      }
    </svg>
  );
}


export default function WordsGrowingPage({
  studentCode,
  onBack,
}: WordsGrowingPageProps) {
  const [
    words,
    setWords,
  ] =
    useState<
      ChildWord[]
    >(
      [],
    );

  const [
    monthly,
    setMonthly,
  ] =
    useState<
      MonthlyWordCount[]
    >(
      [],
    );

  const [
    name,
    setName,
  ] =
    useState("");

  const [
    newWord,
    setNewWord,
  ] =
    useState("");

  const [
    status,
    setStatus,
  ] =
    useState<
      "independent" |
      "emerging"
    >(
      "independent",
    );

  const [
    adding,
    setAdding,
  ] =
    useState(
      false,
    );

  const [
    error,
    setError,
  ] =
    useState("");


  async function refresh():
    Promise<void> {
    try {
      const result =
        await loadChildWords(
          studentCode,
        );

      setWords(
        result.words,
      );

      setMonthly(
        result.monthly,
      );

      setName(
        result.student.name,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Words could not be loaded.",
      );
    }
  }


  useEffect(
    () => {
      void refresh();
    },
    [
      studentCode,
    ],
  );


  const independentCount =
    useMemo(
      () =>
        words.filter(
          (
            item,
          ) =>
            item.status ===
              "independent",
        ).length,
      [
        words,
      ],
    );

  const emergingCount =
    words.length -
    independentCount;


  async function save():
    Promise<void> {
    const word =
      newWord.trim();

    if (!word) {
      return;
    }

    setError("");

    try {
      await saveChildWord({
        studentCode,
        word,
        status,
      });

      setNewWord(
        "",
      );

      setAdding(
        false,
      );

      await refresh();
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Word could not be saved.",
      );
    }
  }


  return (
    <main
      className="words-growing"
    >
      <header
        className="words-growing__top"
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

        <strong>
          🌱 Words Growing
        </strong>

        <button
          type="button"
          aria-label="Add word"
          title="Add word"
          onClick={() =>
            setAdding(
              true,
            )
          }
        >
          ＋
        </button>
      </header>


      {
        error && (
          <div
            className="words-growing__error"
          >
            {
              error
            }
          </div>
        )
      }


      <section
        className="words-growing__summary"
      >
        <small>
          {
            name
          }
        </small>

        <strong>
          {
            independentCount
          }
        </strong>

        <span>
          independent words
        </span>

        <small>
          {
            emergingCount
          }{" "}
          emerging
        </small>
      </section>


      <WordChart
        data={
          monthly
        }
      />


      {
        adding && (
          <section
            className="words-growing__add"
          >
            <input
              value={
                newWord
              }
              placeholder="Word"
              autoFocus
              onChange={(
                event,
              ) =>
                setNewWord(
                  event.target.value,
                )
              }
            />

            <div>
              <button
                type="button"
                className={
                  status ===
                    "independent"
                    ? "selected"
                    : ""
                }
                onClick={() =>
                  setStatus(
                    "independent",
                  )
                }
              >
                Independent
              </button>

              <button
                type="button"
                className={
                  status ===
                    "emerging"
                    ? "selected"
                    : ""
                }
                onClick={() =>
                  setStatus(
                    "emerging",
                  )
                }
              >
                Emerging
              </button>
            </div>

            <button
              type="button"
              onClick={() =>
                void save()
              }
            >
              Save
            </button>
          </section>
        )
      }


      <section
        className="words-growing__list"
      >
        {
          words.map(
            (
              item,
            ) => (
              <div
                key={
                  item.id
                }
              >
                <strong>
                  {
                    item.word
                  }
                </strong>

                <span>
                  {
                    item.status ===
                      "independent"
                      ? "✓"
                      : "🌱"
                  }
                </span>
              </div>
            ),
          )
        }
      </section>
    </main>
  );
}
