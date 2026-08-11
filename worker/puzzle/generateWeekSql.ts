import {
  generateDailyPuzzlePair,
  type GeneratedPuzzle,
} from "./puzzleGenerator";

function addDays(
  isoDate: string,
  days: number,
): string {
  const date =
    new Date(
      `${isoDate}T00:00:00`,
    );

  date.setDate(
    date.getDate() + days,
  );

  return date
    .toISOString()
    .slice(0, 10);
}

function escapeSql(
  value: string,
): string {
  return value.replace(
    /'/g,
    "''",
  );
}

function toInsertSql(
  puzzle: GeneratedPuzzle,
  status:
    | "draft"
    | "published",
): string {
  return `
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
  status
)
VALUES (
  '${escapeSql(
    puzzle.puzzleDate,
  )}',
  ${puzzle.puzzleNumber},
  '${puzzle.stage}',
  ${puzzle.size},
  ${puzzle.maxMoves},
  ${puzzle.mysteryCount},
  '${escapeSql(
    JSON.stringify(
      puzzle.startBoard,
    ),
  )}',
  '${escapeSql(
    JSON.stringify(
      puzzle.solvedBoard,
    ),
  )}',
  '${escapeSql(
    JSON.stringify(
      puzzle.solutionMoves,
    ),
  )}',
  '${escapeSql(
    JSON.stringify(
      puzzle.mysteryRevealOrder,
    ),
  )}',
  1,
  '${status}'
)
ON CONFLICT (
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
  verified = 1,
  status =
    excluded.status,
  updated_at =
    CURRENT_TIMESTAMP;
`;
}

const START_DATE =
  "2026-08-07";

const START_NUMBER =
  219;

const DAYS = 7;

for (
  let offset = 0;
  offset < DAYS;
  offset += 1
) {
  const puzzleDate =
    addDays(
      START_DATE,
      offset,
    );

  const puzzleNumber =
    START_NUMBER +
    offset;

  const pair =
    generateDailyPuzzlePair(
      puzzleDate,
      puzzleNumber,
    );

  /*
   * For local testing,
   * publish #219 only.
   *
   * Future puzzles remain draft.
   */
const status =
  "published" as const;

  console.log(
    toInsertSql(
      pair.five,
      status,
    ),
  );

  console.log(
    toInsertSql(
      pair.seven,
      status,
    ),
  );
}