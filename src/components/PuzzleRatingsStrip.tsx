import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./PuzzleRatingsStrip.css";

type PuzzleStage =
  | "5x5"
  | "7x7";

type PuzzleState =
  | "none"
  | "attempted"
  | "solved";

interface PuzzleHistoryItem {
  puzzleNumber: number;
  puzzleDate: string;
  stage: PuzzleStage;
  state: PuzzleState;
  bestGq: number | null;
  current: boolean;
}

interface PuzzleHistoryResponse {
  averageGq: number | null;

  puzzles: {
    "5x5": PuzzleHistoryItem[];
    "7x7": PuzzleHistoryItem[];
  };

  error?: string;
}

interface PuzzleRatingsStripProps {
  onOpenPuzzle: () => void;
}

interface LocalPuzzleState {
  puzzleNumber?: number;
  stage?: PuzzleStage;
  moves?: number;
  qualified?: boolean;
  medalWon?: boolean;
  solveStartedAt?: number | null;
}

export const PUZZLE_LAUNCH_KEY =
  "gyan-puzzle-launch-v1";

const PUZZLE_STATE_KEY =
  "gyan-d1-puzzle-state-v9";


function localAttempt():
  LocalPuzzleState | null {
  try {
    const raw =
      window.localStorage.getItem(
        PUZZLE_STATE_KEY,
      );

    if (!raw) {
      return null;
    }

    const parsed =
      JSON.parse(
        raw,
      ) as LocalPuzzleState;

    if (
      !Number.isInteger(
        parsed.puzzleNumber,
      ) ||
      (
        parsed.stage !==
          "5x5" &&
        parsed.stage !==
          "7x7"
      )
    ) {
      return null;
    }

    return parsed;
  } catch {
    return null;
  }
}


function visualState(
  item: PuzzleHistoryItem,
  local:
    LocalPuzzleState | null,
): PuzzleState {
  if (
    item.state ===
      "solved"
  ) {
    return "solved";
  }

  if (
    local &&
    local.puzzleNumber ===
      item.puzzleNumber &&
    local.stage ===
      item.stage
  ) {
    const locallySolved =
      item.stage ===
        "5x5"
        ? Boolean(
            local.qualified,
          )
        : Boolean(
            local.medalWon,
          );

    if (locallySolved) {
      return "solved";
    }

    if (
      (
        local.moves ??
        0
      ) >
        0 ||
      local.solveStartedAt !=
        null
    ) {
      return "attempted";
    }
  }

  return item.state;
}


function openRequest(
  item: PuzzleHistoryItem,
): void {
  window.sessionStorage.setItem(
    PUZZLE_LAUNCH_KEY,
    JSON.stringify({
      puzzleNumber:
        item.puzzleNumber,

      stage:
        item.stage,

      current:
        item.current,
    }),
  );
}


function PuzzleRow({
  stage,
  items,
  onOpenPuzzle,
}: {
  stage: PuzzleStage;
  items: PuzzleHistoryItem[];
  onOpenPuzzle: () => void;
}) {
  const local =
    useMemo(
      () =>
        localAttempt(),
      [
        items,
      ],
    );

  /*
   * API returns newest first because that is
   * convenient for DB lookup. The UI reads as
   * history -> today, so today stays at far right.
   */
  const displayItems =
    [...items]
      .reverse();

  return (
    <div
      className="puzzle-ratings-strip__row"
    >
      <strong
        className="puzzle-ratings-strip__stage"
      >
        {stage ===
          "5x5"
          ? "5×5"
          : "7×7"}
      </strong>

      <div
        className="puzzle-ratings-strip__bars"
        aria-label={`${stage} puzzle history`}
      >
        {displayItems.map(
          (
            item,
          ) => {
            const state =
              visualState(
                item,
                local,
              );

            const title =
              [
                `Puzzle #${item.puzzleNumber}`,
                item.current
                  ? "Today"
                  : "Practice",
                state ===
                  "solved"
                  ? item.bestGq
                    ? `Solved · GQ ${item.bestGq}`
                    : "Solved"
                  : state ===
                      "attempted"
                    ? "Attempted"
                    : "Not attempted",
              ].join(
                " · ",
              );

            return (
              <button
                key={`${item.stage}-${item.puzzleNumber}`}
                type="button"
                className={[
                  "puzzle-ratings-strip__bar-button",
                  item.current
                    ? "puzzle-ratings-strip__bar-button--current"
                    : "",
                ]
                  .filter(
                    Boolean,
                  )
                  .join(
                    " ",
                  )}
                title={
                  title
                }
                aria-label={
                  title
                }
                onClick={(event) => {
                  event.stopPropagation();

                  openRequest(
                    item,
                  );

                  onOpenPuzzle();
                }}
              >
                <span
                  aria-hidden="true"
                  className={`puzzle-ratings-strip__bar puzzle-ratings-strip__bar--${state}`}
                />
              </button>
            );
          },
        )}
      </div>
    </div>
  );
}


export default function PuzzleRatingsStrip({
  onOpenPuzzle,
}: PuzzleRatingsStripProps) {
  const [
    history,
    setHistory,
  ] =
    useState<
      PuzzleHistoryResponse | null
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

  useEffect(
    () => {
      const controller =
        new AbortController();

      void fetch(
        "/api/puzzle/my-history?limit=10",
        {
          cache:
            "no-store",

          credentials:
            "include",

          signal:
            controller.signal,
        },
      )
        .then(
          async (
            response,
          ) => {
            const body =
              await response.json() as
                PuzzleHistoryResponse;

            if (
              !response.ok
            ) {
              throw new Error(
                body.error ??
                  "Puzzle history unavailable.",
              );
            }

            return body;
          },
        )
        .then(
          (
            body,
          ) => {
            if (
              !controller.signal.aborted
            ) {
              setHistory(
                body,
              );
            }
          },
        )
        .catch(
          (
            error,
          ) => {
            if (
              error instanceof
                DOMException &&
              error.name ===
                "AbortError"
            ) {
              return;
            }

            /*
             * Keep My Ratings usable even if this
             * secondary strip cannot load.
             */
            if (
              !controller.signal.aborted
            ) {
              setHistory(
                null,
              );
            }
          },
        )
        .finally(
          () => {
            if (
              !controller.signal.aborted
            ) {
              setLoading(
                false,
              );
            }
          },
        );

      return () => {
        controller.abort();
      };
    },
    [],
  );

  if (
    !loading &&
    !history
  ) {
    return null;
  }

  return (
    <section
      className="puzzle-ratings-strip"
      aria-label="Puzzle ratings and history"
    >
      <div
        className="puzzle-ratings-strip__heading"
      >
        <strong>
          Puzzles
        </strong>

        <span>
          [
          Average GQ:{" "}
          {history?.averageGq ??
            "—"}
          ]
        </span>
      </div>

      {loading
        ? (
          <div
            className="puzzle-ratings-strip__loading"
          >
            Loading puzzle history…
          </div>
        )
        : history && (
          <>
            <PuzzleRow
              stage="5x5"
              items={
                history.puzzles[
                  "5x5"
                ]
              }
              onOpenPuzzle={
                onOpenPuzzle
              }
            />

            <PuzzleRow
              stage="7x7"
              items={
                history.puzzles[
                  "7x7"
                ]
              }
              onOpenPuzzle={
                onOpenPuzzle
              }
            />
          </>
        )}
    </section>
  );
}
