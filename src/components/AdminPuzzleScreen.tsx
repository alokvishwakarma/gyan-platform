import {
  useEffect,
  useState,
} from "react";

import "./AdminPuzzleScreen.css";

type TileColor =
  | "red"
  | "blue"
  | "green"
  | "yellow"
  | "purple"
  | "orange";

type PuzzleStage =
  | "5x5"
  | "7x7";

interface PuzzleTile {
  id: number;
  color: TileColor;
  hidden: boolean;
}

interface PuzzleMove {
  from: {
    row: number;
    column: number;
  };

  to: {
    row: number;
    column: number;
  };
}

interface AdminPuzzle {
  puzzleDate: string;
  puzzleNumber: number;
  stage: PuzzleStage;
  size: number;
  maxMoves: number;
  mysteryCount: number;

  scrambledBoard:
    PuzzleTile[];

  solvedBoard:
    PuzzleTile[];

  solutionMoves:
    PuzzleMove[];

  verified: boolean;
  status: string;
}

interface AdminPuzzleResponse {
  puzzleNumber: number;

  five:
    | AdminPuzzle
    | null;

  seven:
    | AdminPuzzle
    | null;
}

interface AdminPuzzleScreenProps {
  onBack?: () => void;
}

function PuzzleBoard({
  title,
  board,
  size,
}: {
  title: string;
  board: PuzzleTile[];
  size: number;
}) {
  return (
    <div className="admin-puzzle__board-block">
      <strong className="admin-puzzle__board-title">
        {title}
      </strong>

      <div
        className="admin-puzzle__board"
        style={{
          gridTemplateColumns:
            `repeat(${size}, 1fr)`,
        }}
      >
        {board.map(
          (tile) => (
            <div
              key={tile.id}
              className={[
                "admin-puzzle__tile",

                tile.hidden
                  ? "admin-puzzle__tile--mystery"
                  : `admin-puzzle__tile--${tile.color}`,
              ].join(" ")}
              title={
                tile.hidden
                  ? `Mystery · actual ${tile.color}`
                  : tile.color
              }
            >
              {tile.hidden
                ? "?"
                : ""}
            </div>
          ),
        )}
      </div>
    </div>
  );
}

function SolutionMoves({
  moves,
}: {
  moves: PuzzleMove[];
}) {
  return (
    <div className="admin-puzzle__solution">
      <strong>
        Known solution
      </strong>

      <ol>
        {moves.map(
          (
            move,
            index,
          ) => (
            <li key={index}>
              (
              {move.from.row +
                1}
              ,
              {move.from.column +
                1}
              )
              {" → "}
              (
              {move.to.row +
                1}
              ,
              {move.to.column +
                1}
              )
            </li>
          ),
        )}
      </ol>
    </div>
  );
}

function StageSection({
  puzzle,
}: {
  puzzle: AdminPuzzle;
}) {
  return (
    <section className="admin-puzzle__stage">
      <div className="admin-puzzle__stage-heading">
        <div>
          <h2>
            {puzzle.stage}
          </h2>

          <span>
            {puzzle.puzzleDate}
          </span>
        </div>

        <div className="admin-puzzle__badges">
          <span>
            {puzzle.verified
              ? "✅ Verified"
              : "❌ Unverified"}
          </span>

          <span>
            {puzzle.status}
          </span>
        </div>
      </div>

      <div className="admin-puzzle__boards">
        <PuzzleBoard
          title="Scrambled"
          board={
            puzzle.scrambledBoard
          }
          size={
            puzzle.size
          }
        />

        <PuzzleBoard
          title="Solved"
          board={
            puzzle.solvedBoard
          }
          size={
            puzzle.size
          }
        />
      </div>

      <SolutionMoves
        moves={
          puzzle.solutionMoves
        }
      />
    </section>
  );
}

export default function AdminPuzzleScreen({
  onBack,
}: AdminPuzzleScreenProps) {
  const [
    puzzleNumber,
    setPuzzleNumber,
  ] =
    useState(219);

  const [
    data,
    setData,
  ] =
    useState<
      AdminPuzzleResponse | null
    >(null);

const [
  loading,
  setLoading,
] = useState(true);

  const [
    error,
    setError,
  ] =
    useState<
      string | null
    >(null);

  async function loadPuzzle(
    number:
      number,
  ) {
    if (
      !Number.isInteger(
        number,
      ) ||
      number <= 0
    ) {
      setError(
        "Enter a valid puzzle number.",
      );

      return;
    }

    setLoading(
      true,
    );

    setError(
      null,
    );

    try {
      const response =
        await fetch(
          `/api/admin/puzzles/${number}`,
        );

      const body =
        (await response.json()) as
          AdminPuzzleResponse & {
            error?: string;
          };

      if (
        !response.ok
      ) {
        throw new Error(
          body.error ??
            "Puzzle not found.",
        );
      }

      setData(
        body,
      );
    } catch (
      problem
    ) {
      setData(
        null,
      );

      setError(
        problem instanceof
        Error
          ? problem.message
          : "Unable to load puzzle.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }

useEffect(() => {
  let cancelled = false;

  async function loadInitialPuzzle() {
    try {
      const response =
        await fetch(
          "/api/admin/puzzles/219",
        );

      const body =
        (await response.json()) as
          AdminPuzzleResponse & {
            error?: string;
          };

      if (cancelled) {
        return;
      }

      if (!response.ok) {
        throw new Error(
          body.error ??
            "Puzzle not found.",
        );
      }

      setData(body);
      setError(null);
    } catch (problem) {
      if (cancelled) {
        return;
      }

      setData(null);

      setError(
        problem instanceof Error
          ? problem.message
          : "Unable to load puzzle.",
      );
    } finally {
      if (!cancelled) {
        setLoading(false);
      }
    }
  }

  void loadInitialPuzzle();

  return () => {
    cancelled = true;
  };
}, []);

  function previousPuzzle() {
    const next =
      Math.max(
        1,
        puzzleNumber -
          1,
      );

    setPuzzleNumber(
      next,
    );

    void loadPuzzle(
      next,
    );
  }

  function nextPuzzle() {
    const next =
      puzzleNumber +
      1;

    setPuzzleNumber(
      next,
    );

    void loadPuzzle(
      next,
    );
  }

  return (
    <main className="admin-puzzle">
      <header className="admin-puzzle__header">
        <button
          type="button"
          onClick={
            onBack
          }
        >
          ← Back
        </button>

        <div>
          <strong>
            Daily Puzzles
          </strong>

          <span>
            Admin
          </span>
        </div>

        <span />
      </header>

      <section className="admin-puzzle__picker">
        <button
          type="button"
          onClick={
            previousPuzzle
          }
        >
          ‹
        </button>

        <label>
          <span>
            Puzzle #
          </span>

          <input
            type="number"
            min={1}
            value={
              puzzleNumber
            }
            onChange={(
              event,
            ) =>
              setPuzzleNumber(
                Number(
                  event.target
                    .value,
                ),
              )
            }
            onKeyDown={(
              event,
            ) => {
              if (
                event.key ===
                "Enter"
              ) {
                void loadPuzzle(
                  puzzleNumber,
                );
              }
            }}
          />
        </label>

        <button
          type="button"
          className="admin-puzzle__load"
          onClick={() =>
            void loadPuzzle(
              puzzleNumber,
            )
          }
        >
          Load
        </button>

        <button
          type="button"
          onClick={
            nextPuzzle
          }
        >
          ›
        </button>
      </section>

      {loading && (
        <div className="admin-puzzle__state">
          Loading puzzle…
        </div>
      )}

      {error && (
        <div className="admin-puzzle__error">
          {error}
        </div>
      )}

      {!loading &&
        data && (
          <>
            <div className="admin-puzzle__summary">
              <strong>
                Puzzle #
                {
                  data.puzzleNumber
                }
              </strong>

              <span>
                Scrambled vs.
                solved
              </span>
            </div>

            {data.five && (
              <StageSection
                puzzle={
                  data.five
                }
              />
            )}

            {data.seven && (
              <StageSection
                puzzle={
                  data.seven
                }
              />
            )}
          </>
        )}
    </main>
  );
}