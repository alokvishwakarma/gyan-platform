import {
  generateDailyPuzzlePair,
  verifyPuzzle,
} from "./puzzleGenerator";

function printPuzzle(
  label: string,
  puzzle: ReturnType<
    typeof generateDailyPuzzlePair
  >["five"],
) {
  console.log("");
  console.log(
    `=== ${label} ===`,
  );

  console.log(
    "Stage:",
    puzzle.stage,
  );

  console.log(
    "Size:",
    puzzle.size,
  );

  console.log(
    "Moves:",
    puzzle.solutionMoves.length,
  );

  console.log(
    "Mysteries:",
    puzzle.startBoard.filter(
      (tile) =>
        tile.hidden,
    ).length,
  );

  console.log(
    "Verified:",
    verifyPuzzle(
      puzzle,
    ),
  );

  console.log(
    "Solution:",
  );

  puzzle.solutionMoves.forEach(
    (
      move,
      index,
    ) => {
      console.log(
        `${index + 1}.`,
        `(${move.from.row + 1},${move.from.column + 1})`,
        "→",
        `(${move.to.row + 1},${move.to.column + 1})`,
      );
    },
  );
}

const puzzles =
  generateDailyPuzzlePair(
    "2026-08-08",
    219,
  );

printPuzzle(
  "5×5",
  puzzles.five,
);

printPuzzle(
  "7×7",
  puzzles.seven,
);

if (
  !puzzles.five.verified ||
  !puzzles.seven.verified
) {
  throw new Error(
    "Puzzle verification failed.",
  );
}

console.log("");
console.log(
  "✅ Both daily puzzles verified.",
);