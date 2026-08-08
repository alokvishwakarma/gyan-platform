import type {
  GeneratedPuzzle,
  PuzzleMove,
  PuzzleStage,
  PuzzleTile,
} from "./puzzleGenerator";

export interface DailyPuzzleRow {
  id: number;

  puzzle_date: string;
  puzzle_number: number;

  stage: PuzzleStage;

  board_size: number;
  max_moves: number;
  mystery_count: number;

  start_board_json: string;
  solved_board_json: string;

  solution_moves_json: string;

  mystery_reveal_order_json: string;

  verified: number;

  status:
    | "draft"
    | "published"
    | "retired";

  created_at: string;
  updated_at: string;
}

export interface StoredPuzzle {
  id: number;

  puzzleDate: string;
  puzzleNumber: number;

  stage: PuzzleStage;

  size: number;
  maxMoves: number;
  mysteryCount: number;

  startBoard: PuzzleTile[];
  solvedBoard: PuzzleTile[];

  solutionMoves: PuzzleMove[];

  mysteryRevealOrder: number[];

  verified: boolean;

  status:
    | "draft"
    | "published"
    | "retired";

  createdAt: string;
  updatedAt: string;
}

/*
 * Keep this deliberately small.
 *
 * Any object exposing D1's
 * prepare() API works here.
 */
export interface PuzzleDatabase {
  prepare(
    sql: string,
  ): {
    bind(
      ...values: unknown[]
    ): {
      run(): Promise<unknown>;

      first<T>():
        Promise<
          T | null
        >;

      all<T>():
        Promise<{
          results?: T[];
        }>;
    };
  };
}

function parseRow(
  row: DailyPuzzleRow,
): StoredPuzzle {
  return {
    id:
      row.id,

    puzzleDate:
      row.puzzle_date,

    puzzleNumber:
      row.puzzle_number,

    stage:
      row.stage,

    size:
      row.board_size,

    maxMoves:
      row.max_moves,

    mysteryCount:
      row.mystery_count,

    startBoard:
      JSON.parse(
        row.start_board_json,
      ) as PuzzleTile[],

    solvedBoard:
      JSON.parse(
        row.solved_board_json,
      ) as PuzzleTile[],

    solutionMoves:
      JSON.parse(
        row.solution_moves_json,
      ) as PuzzleMove[],

    mysteryRevealOrder:
      JSON.parse(
        row.mystery_reveal_order_json,
      ) as number[],

    verified:
      row.verified === 1,

    status:
      row.status,

    createdAt:
      row.created_at,

    updatedAt:
      row.updated_at,
  };
}

export async function savePuzzle(
  db: PuzzleDatabase,
  puzzle: GeneratedPuzzle,
  status:
    | "draft"
    | "published" =
    "draft",
): Promise<void> {
  if (
    !puzzle.verified
  ) {
    throw new Error(
      `Refusing to save unverified ${puzzle.stage} puzzle.`,
    );
  }

  await db
    .prepare(
      `
      INSERT INTO daily_puzzles (
        puzzle_date,
        puzzle_number,

        stage,

        board_size,
        max_moves,
        mystery_count,

        start_board_json,
        solved_board_json,

        solution_moves_json,
        mystery_reveal_order_json,

        verified,
        status,

        updated_at
      )
      VALUES (
        ?,
        ?,

        ?,

        ?,
        ?,
        ?,

        ?,
        ?,

        ?,
        ?,

        1,
        ?,

        CURRENT_TIMESTAMP
      )

      ON CONFLICT(
        puzzle_date,
        stage
      )
      DO UPDATE SET
        puzzle_number =
          excluded.puzzle_number,

        board_size =
          excluded.board_size,

        max_moves =
          excluded.max_moves,

        mystery_count =
          excluded.mystery_count,

        start_board_json =
          excluded.start_board_json,

        solved_board_json =
          excluded.solved_board_json,

        solution_moves_json =
          excluded.solution_moves_json,

        mystery_reveal_order_json =
          excluded.mystery_reveal_order_json,

        verified =
          excluded.verified,

        status =
          excluded.status,

        updated_at =
          CURRENT_TIMESTAMP
      `,
    )
    .bind(
      puzzle.puzzleDate,
      puzzle.puzzleNumber,

      puzzle.stage,

      puzzle.size,
      puzzle.maxMoves,
      puzzle.mysteryCount,

      JSON.stringify(
        puzzle.startBoard,
      ),

      JSON.stringify(
        puzzle.solvedBoard,
      ),

      JSON.stringify(
        puzzle.solutionMoves,
      ),

      JSON.stringify(
        puzzle.mysteryRevealOrder,
      ),

      status,
    )
    .run();
}

export async function savePuzzlePair(
  db: PuzzleDatabase,

  pair: {
    five:
      GeneratedPuzzle;

    seven:
      GeneratedPuzzle;
  },

  status:
    | "draft"
    | "published" =
    "draft",
): Promise<void> {
  await savePuzzle(
    db,
    pair.five,
    status,
  );

  await savePuzzle(
    db,
    pair.seven,
    status,
  );
}

export async function findPuzzle(
  db: PuzzleDatabase,

  puzzleNumber:
    number,

  stage:
    PuzzleStage,
): Promise<
  StoredPuzzle | null
> {
  const row =
    await db
      .prepare(
        `
        SELECT *
        FROM daily_puzzles

        WHERE
          puzzle_number = ?
          AND stage = ?

        LIMIT 1
        `,
      )
      .bind(
        puzzleNumber,
        stage,
      )
      .first<DailyPuzzleRow>();

  return row
    ? parseRow(row)
    : null;
}

/*
 * This is what Admin #205
 * will eventually use.
 */
export async function findPuzzlePair(
  db: PuzzleDatabase,

  puzzleNumber:
    number,
): Promise<{
  five:
    StoredPuzzle | null;

  seven:
    StoredPuzzle | null;
}> {
  return {
    five:
      await findPuzzle(
        db,
        puzzleNumber,
        "5x5",
      ),

    seven:
      await findPuzzle(
        db,
        puzzleNumber,
        "7x7",
      ),
  };
}

export async function findPublishedPuzzleByDate(
  db: PuzzleDatabase,

  puzzleDate:
    string,

  stage:
    PuzzleStage,
): Promise<
  StoredPuzzle | null
> {
  const row =
    await db
      .prepare(
        `
        SELECT *
        FROM daily_puzzles

        WHERE
          puzzle_date = ?
          AND stage = ?
          AND status = 'published'

        LIMIT 1
        `,
      )
      .bind(
        puzzleDate,
        stage,
      )
      .first<DailyPuzzleRow>();

  return row
    ? parseRow(row)
    : null;
}

export async function publishPuzzlePair(
  db: PuzzleDatabase,

  puzzleNumber:
    number,
): Promise<void> {
  await db
    .prepare(
      `
      UPDATE daily_puzzles

      SET
        status = 'published',
        updated_at =
          CURRENT_TIMESTAMP

      WHERE
        puzzle_number = ?
        AND verified = 1
      `,
    )
    .bind(
      puzzleNumber,
    )
    .run();
}