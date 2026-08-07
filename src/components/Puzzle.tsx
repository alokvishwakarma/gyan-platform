import {
  useEffect,
  useRef,
  useState,
} from "react";

import "./Puzzle.css";

type TileColor =
  | "red"
  | "blue"
  | "green"
  | "yellow"
  | "purple"
  | "orange";

interface Tile {
  id: number;
  color: TileColor;
  hidden: boolean;
}

interface Position {
  row: number;
  column: number;
}

interface Winner {
  date: string;
  name: string;
  city?: string;
}

interface SavedPuzzleState {
  date: string;
  board: Tile[];
  moves: number;
  chancesRemaining: number;
  attemptFinished: boolean;
  qualified: boolean;
}

interface PuzzleProps {
  isRegistered?: boolean;
  onClose?: () => void;
}

interface HintResponse {
  hint: string;
}

const SIZE = 5;

const MAX_MOVES = 5;
const MAX_CHANCES = 5;

const PUZZLE_NUMBER = 218;

const SWIPE_THRESHOLD = 22;

const STATE_KEY =
  "gyan-puzzle-state-v1";

const WINNERS_KEY =
  "gyan-puzzle-winners-v1";

/*
 * Daily Puzzle #218
 *
 * Same board for everybody for v0.1.
 * Hidden colors are fixed.
 *
 * Later this will come from D1.
 */
const DAILY_BOARD: Tile[] = [
  { id: 0, color: "red", hidden: false },
  { id: 1, color: "blue", hidden: false },
  { id: 2, color: "red", hidden: true },
  { id: 3, color: "yellow", hidden: false },
  { id: 4, color: "green", hidden: false },

  { id: 5, color: "yellow", hidden: false },
  { id: 6, color: "purple", hidden: false },
  { id: 7, color: "red", hidden: false },
  { id: 8, color: "blue", hidden: false },
  { id: 9, color: "yellow", hidden: true },

  { id: 10, color: "blue", hidden: true },
  { id: 11, color: "green", hidden: false },
  { id: 12, color: "yellow", hidden: false },
  { id: 13, color: "red", hidden: false },
  { id: 14, color: "blue", hidden: false },

  { id: 15, color: "blue", hidden: false },
  { id: 16, color: "red", hidden: false },
  { id: 17, color: "purple", hidden: false },
  { id: 18, color: "green", hidden: true },
  { id: 19, color: "yellow", hidden: false },

  { id: 20, color: "green", hidden: false },
  { id: 21, color: "orange", hidden: true },
  { id: 22, color: "blue", hidden: false },
  { id: 23, color: "purple", hidden: false },
  { id: 24, color: "red", hidden: false },
];

function createBoard(): Tile[] {
  return DAILY_BOARD.map((tile) => ({
    ...tile,
  }));
}

function localDateKey(
  date = new Date(),
): string {
  const year =
    date.getFullYear();

  const month = String(
    date.getMonth() + 1,
  ).padStart(2, "0");

  const day = String(
    date.getDate(),
  ).padStart(2, "0");

  return `${year}-${month}-${day}`;
}

function getToday(): string {
  return localDateKey();
}

function getYesterday(): string {
  const date =
    new Date();

  date.setDate(
    date.getDate() - 1,
  );

  return localDateKey(date);
}

function getIndex(
  row: number,
  column: number,
): number {
  return row * SIZE + column;
}

function getPosition(
  index: number,
): Position {
  return {
    row: Math.floor(
      index / SIZE,
    ),
    column:
      index % SIZE,
  };
}

function samePosition(
  first: Position,
  second: Position,
): boolean {
  return (
    first.row ===
      second.row &&
    first.column ===
      second.column
  );
}

function adjacent(
  first: Position,
  second: Position,
): boolean {
  return (
    Math.abs(
      first.row -
        second.row,
    ) +
      Math.abs(
        first.column -
          second.column,
      ) ===
    1
  );
}

/*
 * Mystery squares do not count
 * until they have been revealed.
 */
function longestVisibleMatch(
  board: Tile[],
): number {
  let best = 1;

  /*
   * Horizontal
   */
  for (
    let row = 0;
    row < SIZE;
    row += 1
  ) {
    let length = 1;

    for (
      let column = 1;
      column < SIZE;
      column += 1
    ) {
      const previous =
        board[
          getIndex(
            row,
            column - 1,
          )
        ];

      const current =
        board[
          getIndex(
            row,
            column,
          )
        ];

      if (
        !previous.hidden &&
        !current.hidden &&
        previous.color ===
          current.color
      ) {
        length += 1;

        best =
          Math.max(
            best,
            length,
          );
      } else {
        length = 1;
      }
    }
  }

  /*
   * Vertical
   */
  for (
    let column = 0;
    column < SIZE;
    column += 1
  ) {
    let length = 1;

    for (
      let row = 1;
      row < SIZE;
      row += 1
    ) {
      const previous =
        board[
          getIndex(
            row - 1,
            column,
          )
        ];

      const current =
        board[
          getIndex(
            row,
            column,
          )
        ];

      if (
        !previous.hidden &&
        !current.hidden &&
        previous.color ===
          current.color
      ) {
        length += 1;

        best =
          Math.max(
            best,
            length,
          );
      } else {
        length = 1;
      }
    }
  }

  return best;
}

function revealOneMystery(
  board: Tile[],
): Tile[] {
  const index =
    board.findIndex(
      (tile) =>
        tile.hidden,
    );

  if (index === -1) {
    return board;
  }

  return board.map(
    (tile, tileIndex) =>
      tileIndex === index
        ? {
            ...tile,
            hidden: false,
          }
        : tile,
  );
}

function cleanWinnerHistory(
  winners: Winner[],
): Winner[] {
  const cutoff =
    new Date();

  cutoff.setDate(
    cutoff.getDate() -
      365,
  );

  cutoff.setHours(
    0,
    0,
    0,
    0,
  );

  return winners.filter(
    (winner) => {
      const date =
        new Date(
          `${winner.date}T00:00:00`,
        );

      return date >= cutoff;
    },
  );
}

function loadWinnerHistory(): Winner[] {
  try {
    const raw =
      localStorage.getItem(
        WINNERS_KEY,
      );

    let winners: Winner[] =
      raw
        ? JSON.parse(raw)
        : [];

    winners =
      cleanWinnerHistory(
        winners,
      );

    /*
     * Dummy winner until D1
     * supplies the real daily winner.
     */
    const yesterday =
      getYesterday();

    const exists =
      winners.some(
        (winner) =>
          winner.date ===
          yesterday,
      );

    if (!exists) {
      winners.push({
        date: yesterday,
        name: "Aarav",
        city: "Lucknow",
      });
    }

    localStorage.setItem(
      WINNERS_KEY,
      JSON.stringify(
        winners,
      ),
    );

    return winners;
  } catch {
    return [
      {
        date:
          getYesterday(),
        name: "Aarav",
        city: "Lucknow",
      },
    ];
  }
}

function loadSavedState():
  | SavedPuzzleState
  | null {
  try {
    const raw =
      localStorage.getItem(
        STATE_KEY,
      );

    if (!raw) {
      return null;
    }

    const saved =
      JSON.parse(
        raw,
      ) as SavedPuzzleState;

    /*
     * New day = fresh puzzle.
     */
    if (
      saved.date !==
      getToday()
    ) {
      localStorage.removeItem(
        STATE_KEY,
      );

      return null;
    }

    return saved;
  } catch {
    return null;
  }
}

export default function Puzzle({
  isRegistered = false,
  onClose,
}: PuzzleProps) {
  /*
   * Read localStorage only once
   * when the component mounts.
   */
  const initialStateRef =
    useRef<
      SavedPuzzleState | null
    >(loadSavedState());

  const initialState =
    initialStateRef.current;

  const [
    visible,
    setVisible,
  ] =
    useState(true);

  const [
    board,
    setBoard,
  ] =
    useState<Tile[]>(
      initialState?.board ??
        createBoard(),
    );

  const [
    moves,
    setMoves,
  ] =
    useState(
      initialState?.moves ??
        0,
    );

  const [
    chancesRemaining,
    setChancesRemaining,
  ] =
    useState(
      initialState
        ?.chancesRemaining ??
        MAX_CHANCES,
    );

  const [
    attemptFinished,
    setAttemptFinished,
  ] =
    useState(
      initialState
        ?.attemptFinished ??
        false,
    );

  const [
    qualified,
    setQualified,
  ] =
    useState(
      initialState
        ?.qualified ??
        false,
    );

  const [
    selected,
    setSelected,
  ] =
    useState<Position | null>(
      null,
    );

  const [
    lastSwap,
    setLastSwap,
  ] =
    useState<
      [
        Position,
        Position,
      ] | null
    >(null);

  const [
    previousMatch,
    setPreviousMatch,
  ] =
    useState(
      longestVisibleMatch(
        initialState?.board ??
          createBoard(),
      ),
    );

  const [
    message,
    setMessage,
  ] =
    useState(
      initialState
        ?.attemptFinished
        ? "Attempt complete."
        : "Swipe a square to swap with its neighbor.",
    );

  const [
    hint,
    setHint,
  ] =
    useState<
      string | null
    >(null);

  const [
    hintLoading,
    setHintLoading,
  ] =
    useState(false);

  const [
    winners,
  ] =
    useState<Winner[]>(
      loadWinnerHistory,
    );

  const touchStart =
    useRef<{
      row: number;
      column: number;
      x: number;
      y: number;
    } | null>(null);

  /*
   * Save today's state after
   * every meaningful change.
   */
  useEffect(() => {
    const state:
      SavedPuzzleState = {
      date: getToday(),
      board,
      moves,
      chancesRemaining,
      attemptFinished,
      qualified,
    };

    localStorage.setItem(
      STATE_KEY,
      JSON.stringify(
        state,
      ),
    );
  }, [
    board,
    moves,
    chancesRemaining,
    attemptFinished,
    qualified,
  ]);

  const yesterdayWinner =
    winners.find(
      (winner) =>
        winner.date ===
        getYesterday(),
    );

  function closePuzzle() {
    setVisible(false);

    onClose?.();
  }

  function finishAttempt() {
    const next =
      Math.max(
        0,
        chancesRemaining -
          1,
      );

    setChancesRemaining(
      next,
    );

    setAttemptFinished(
      true,
    );

    setSelected(null);

    if (next > 0) {
      setMessage(
        "Almost! Try again with what you learned.",
      );
    } else {
      setMessage(
        "All 5 chances used. Come back tomorrow!",
      );
    }
  }

  function startNextAttempt() {
    if (
      chancesRemaining <=
        0 ||
      qualified
    ) {
      return;
    }

    const freshBoard =
      createBoard();

    setBoard(
      freshBoard,
    );

    setMoves(0);

    setAttemptFinished(
      false,
    );

    setSelected(null);

    setLastSwap(null);

    setPreviousMatch(
      longestVisibleMatch(
        freshBoard,
      ),
    );

    setHint(null);

    setMessage(
      "Good luck — you know more this time!",
    );
  }

  function performSwap(
    firstPosition: Position,
    secondPosition: Position,
  ) {
    if (
      qualified ||
      attemptFinished ||
      chancesRemaining <= 0 ||
      moves >= MAX_MOVES
    ) {
      return;
    }

    if (
      !adjacent(
        firstPosition,
        secondPosition,
      )
    ) {
      return;
    }

    const firstIndex =
      getIndex(
        firstPosition.row,
        firstPosition.column,
      );

    const secondIndex =
      getIndex(
        secondPosition.row,
        secondPosition.column,
      );

    let nextBoard =
      board.map(
        (tile) => ({
          ...tile,
        }),
      );

    [
      nextBoard[
        firstIndex
      ],
      nextBoard[
        secondIndex
      ],
    ] = [
      nextBoard[
        secondIndex
      ],
      nextBoard[
        firstIndex
      ],
    ];

    const nextMove =
      moves + 1;

    setLastSwap([
      firstPosition,
      secondPosition,
    ]);

    let match =
      longestVisibleMatch(
        nextBoard,
      );

    /*
     * A newly-created visible
     * Match 3+ reveals one mystery.
     */
    if (
      match >= 3 &&
      previousMatch < 3
    ) {
      nextBoard =
        revealOneMystery(
          nextBoard,
        );

      match =
        Math.max(
          match,
          longestVisibleMatch(
            nextBoard,
          ),
        );

      setMessage(
        "✨ Mystery revealed!",
      );
    } else {
      const remaining =
        MAX_MOVES -
        nextMove;

      if (
        remaining > 0
      ) {
        setMessage(
          remaining === 1
            ? "1 move remaining."
            : `${remaining} moves remaining.`,
        );
      }
    }

    setBoard(
      nextBoard,
    );

    setMoves(
      nextMove,
    );

    setPreviousMatch(
      match,
    );

    setSelected(null);

    /*
     * Board changed:
     * previous hint is stale.
     */
    setHint(null);

    if (
      match >= 5
    ) {
      setQualified(
        true,
      );

      setAttemptFinished(
        true,
      );

      setMessage(
        "🏆 You unlocked the 7×7 Final!",
      );

      return;
    }

    /*
     * Blur after the 5th move.
     */
    if (
      nextMove >=
      MAX_MOVES
    ) {
      finishAttempt();
    }
  }

  /*
   * Desktop / normal tap fallback.
   */
  function handleTileClick(
    row: number,
    column: number,
  ) {
    if (
      attemptFinished ||
      qualified
    ) {
      return;
    }

    const clicked = {
      row,
      column,
    };

    if (!selected) {
      setSelected(
        clicked,
      );

      return;
    }

    if (
      samePosition(
        selected,
        clicked,
      )
    ) {
      setSelected(null);

      return;
    }

    if (
      adjacent(
        selected,
        clicked,
      )
    ) {
      performSwap(
        selected,
        clicked,
      );

      return;
    }

    setSelected(
      clicked,
    );

    setMessage(
      "Choose a neighboring square.",
    );
  }

  /*
   * Mobile swipe.
   */
  function handleTouchStart(
    event:
      React.TouchEvent<HTMLButtonElement>,
    row: number,
    column: number,
  ) {
    if (
      attemptFinished ||
      qualified
    ) {
      return;
    }

    const touch =
      event.touches[0];

    touchStart.current =
      {
        row,
        column,
        x: touch.clientX,
        y: touch.clientY,
      };
  }

  function handleTouchEnd(
    event:
      React.TouchEvent<HTMLButtonElement>,
  ) {
    const start =
      touchStart.current;

    touchStart.current =
      null;

    if (!start) {
      return;
    }

    const touch =
      event.changedTouches[0];

    const dx =
      touch.clientX -
      start.x;

    const dy =
      touch.clientY -
      start.y;

    /*
     * Short movement:
     * normal tap/click handles it.
     */
    if (
      Math.abs(dx) <
        SWIPE_THRESHOLD &&
      Math.abs(dy) <
        SWIPE_THRESHOLD
    ) {
      return;
    }

    let targetRow =
      start.row;

    let targetColumn =
      start.column;

    if (
      Math.abs(dx) >
      Math.abs(dy)
    ) {
      targetColumn +=
        dx > 0
          ? 1
          : -1;
    } else {
      targetRow +=
        dy > 0
          ? 1
          : -1;
    }

    /*
     * Swipe outside board:
     * ignore.
     */
    if (
      targetRow < 0 ||
      targetRow >= SIZE ||
      targetColumn < 0 ||
      targetColumn >= SIZE
    ) {
      return;
    }

    performSwap(
      {
        row: start.row,
        column:
          start.column,
      },
      {
        row: targetRow,
        column:
          targetColumn,
      },
    );
  }

  /*
   * Hint stays server-side.
   *
   * Until /api/puzzle/hint exists,
   * registered users see a
   * "coming soon" fallback.
   */
  async function requestHint() {
    if (!isRegistered) {
      setHint(
        "Create a free GYAN profile to unlock hints.",
      );

      return;
    }

    setHintLoading(
      true,
    );

    setHint(null);

    try {
      const response =
        await fetch(
          "/api/puzzle/hint",
          {
            method:
              "POST",

            headers: {
              "Content-Type":
                "application/json",
            },

            body:
              JSON.stringify(
                {
                  puzzleNumber:
                    PUZZLE_NUMBER,

                  stage:
                    "5x5",

                  movesUsed:
                    moves,

                  board:
                    board.map(
                      (
                        tile,
                      ) => ({
                        id: tile.id,
                        color:
                          tile.color,
                        hidden:
                          tile.hidden,
                      }),
                    ),
                },
              ),
          },
        );

      if (
        response.status ===
        401
      ) {
        setHint(
          "Sign in to your GYAN profile to use hints.",
        );

        return;
      }

      if (
        !response.ok
      ) {
        throw new Error(
          "Hint request failed",
        );
      }

      const data =
        (await response.json()) as HintResponse;

      setHint(
        data.hint,
      );
    } catch {
      setHint(
        "Live hints are coming soon.",
      );
    } finally {
      setHintLoading(
        false,
      );
    }
  }

  if (!visible) {
    return null;
  }

  return (
    <section
      className="daily-puzzle"
      aria-label="GYAN Puzzle of the Day"
    >
      <button
        type="button"
        className="daily-puzzle__close"
        aria-label="Close puzzle"
        onClick={
          closePuzzle
        }
      >
        ×
      </button>

      <header className="daily-puzzle__header">
        <span>
          Puzzle of the Day
        </span>

        <strong>
          #{PUZZLE_NUMBER}
        </strong>
      </header>

      <div className="daily-puzzle__winner">
        🏆 Yesterday:{" "}
        <strong>
          {yesterdayWinner
            ?.name ??
            "Aarav"}
        </strong>

        {yesterdayWinner
          ?.city && (
          <>
            {" "}
            ·{" "}
            {
              yesterdayWinner.city
            }
          </>
        )}
      </div>

      <div
        className="daily-puzzle__lives"
        aria-label={`${chancesRemaining} chances remaining`}
      >
        {Array.from({
          length:
            MAX_CHANCES,
        }).map(
          (_, index) => (
            <span
              key={index}
              className={[
                "daily-puzzle__life",

                index <
                chancesRemaining
                  ? "daily-puzzle__life--active"
                  : "",
              ].join(
                " ",
              )}
            />
          ),
        )}
      </div>

      <div className="daily-puzzle__lives-label">
        {chancesRemaining}{" "}
        {chancesRemaining ===
        1
          ? "chance"
          : "chances"}
      </div>

      <div className="daily-puzzle__board-shell">
        <div
          className={[
            "daily-puzzle__board",

            attemptFinished &&
            !qualified
              ? "daily-puzzle__board--blurred"
              : "",
          ].join(
            " ",
          )}
        >
          {board.map(
            (
              tile,
              index,
            ) => {
              const position =
                getPosition(
                  index,
                );

              const isSelected =
                selected !==
                  null &&
                samePosition(
                  selected,
                  position,
                );

              const wasSwapped =
                lastSwap?.some(
                  (
                    swapped,
                  ) =>
                    samePosition(
                      swapped,
                      position,
                    ),
                ) ??
                false;

              return (
                <button
                  key={
                    tile.id
                  }
                  type="button"
                  aria-label={
                    tile.hidden
                      ? "Mystery square"
                      : `${tile.color} square`
                  }
                  className={[
                    "daily-puzzle__tile",

                    tile.hidden
                      ? "daily-puzzle__tile--mystery"
                      : `daily-puzzle__tile--${tile.color}`,

                    isSelected
                      ? "daily-puzzle__tile--selected"
                      : "",

                    wasSwapped
                      ? "daily-puzzle__tile--last-swap"
                      : "",
                  ].join(
                    " ",
                  )}
                  onClick={() =>
                    handleTileClick(
                      position.row,
                      position.column,
                    )
                  }
                  onTouchStart={(
                    event,
                  ) =>
                    handleTouchStart(
                      event,
                      position.row,
                      position.column,
                    )
                  }
                  onTouchEnd={
                    handleTouchEnd
                  }
                >
                  {tile.hidden
                    ? "?"
                    : ""}
                </button>
              );
            },
          )}
        </div>

        {attemptFinished &&
          !qualified && (
            <div className="daily-puzzle__attempt-overlay">
              <div className="daily-puzzle__attempt-card">
                <div className="daily-puzzle__retry-icon">
                  ↻
                </div>

                {chancesRemaining >
                0 ? (
                  <>
                    <strong>
                      Try again!
                    </strong>

                    <span>
                      You've used
                      all 5 moves.
                    </span>

                    <span>
                      {
                        chancesRemaining
                      }{" "}
                      {chancesRemaining ===
                      1
                        ? "chance"
                        : "chances"}{" "}
                      left today.
                    </span>

                    <button
                      type="button"
                      onClick={
                        startNextAttempt
                      }
                    >
                      Try Again
                    </button>
                  </>
                ) : (
                  <>
                    <strong>
                      Nice try!
                    </strong>

                    <span>
                      You've used
                      today's 5
                      chances.
                    </span>

                    <span className="daily-puzzle__tomorrow">
                      New puzzle
                      tomorrow.
                    </span>
                  </>
                )}
              </div>
            </div>
          )}
      </div>

      <div className="daily-puzzle__moves">
        Move {moves} /{" "}
        {MAX_MOVES}
      </div>

      {!attemptFinished &&
        !qualified && (
          <div
            className="daily-puzzle__message"
            aria-live="polite"
          >
            {message}
          </div>
        )}

      {qualified && (
        <>
          <div className="daily-puzzle__qualified-message">
            🏆 You qualified!
          </div>

          <button
            type="button"
            className="daily-puzzle__final"
            onClick={() =>
              window.alert(
                "7×7 Final coming next!",
              )
            }
          >
            Play 7×7 Final
          </button>
        </>
      )}

      <div className="daily-puzzle__rules">
        <span>
          <strong>
            Match 3
          </strong>{" "}
          → reveal mystery
        </span>

        <span>
          <strong>
            Match 5
          </strong>{" "}
          → unlock final
        </span>
      </div>

      <section className="daily-puzzle__hint">
        <div className="daily-puzzle__hint-header">
          <strong>
            💡 Hint
          </strong>

          {!isRegistered && (
            <span>
              Profile benefit
            </span>
          )}
        </div>

        {!isRegistered &&
          !hint && (
            <p className="daily-puzzle__hint-intro">
              Create a free GYAN
              profile to unlock
              hints.
            </p>
          )}

        {hint && (
          <p className="daily-puzzle__hint-text">
            {hint}
          </p>
        )}

        <button
          type="button"
          className="daily-puzzle__hint-button"
          disabled={
            hintLoading ||
            qualified ||
            attemptFinished
          }
          onClick={
            requestHint
          }
        >
          <strong>
            {hintLoading
              ? "Thinking…"
              : isRegistered
                ? "💡 Give me a hint"
                : "🔒 Unlock Hints"}
          </strong>

          {!isRegistered && (
            <small>
              Free with GYAN
              profile
            </small>
          )}
        </button>
      </section>

      <footer className="daily-puzzle__footer">
        <span>
          🗓 New puzzle
          tomorrow
        </span>

        <span>
          Streak: 0 day 🔥
        </span>
      </footer>
    </section>
  );
}