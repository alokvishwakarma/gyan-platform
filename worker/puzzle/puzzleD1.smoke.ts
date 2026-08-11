import {
  generateDailyPuzzlePair,
} from "./puzzleGenerator";

const pair =
  generateDailyPuzzlePair(
    "2026-08-08",
    219,
  );

function sqlEscape(
  value: string,
): string {
  return value.replace(
    /'/g,
    "''",
  );
}

function insertSql(
  puzzle:
    typeof pair.five,
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
  '${sqlEscape(
    puzzle.puzzleDate,
  )}',
  ${
    puzzle.puzzleNumber
  },
  '${puzzle.stage}',
  ${puzzle.size},
  ${puzzle.maxMoves},
  ${
    puzzle.mysteryCount
  },
  '${sqlEscape(
    JSON.stringify(
      puzzle.startBoard,
    ),
  )}',
  '${sqlEscape(
    JSON.stringify(
      puzzle.solvedBoard,
    ),
  )}',
  '${sqlEscape(
    JSON.stringify(
      puzzle.solutionMoves,
    ),
  )}',
  '${sqlEscape(
    JSON.stringify(
      puzzle.mysteryRevealOrder,
    ),
  )}',
  1,
  'draft'
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
  verified = 1,
  status = 'draft',
  updated_at =
    CURRENT_TIMESTAMP;
`;
}

console.log(
  insertSql(
    pair.five,
  ),
);

console.log(
  insertSql(
    pair.seven,
  ),
);