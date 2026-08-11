import {
  generateDailyPuzzlePair,
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

const START_DATE =
  "2026-08-08";

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

  console.log(
    [
      puzzleNumber,
      puzzleDate,
      pair.five.verified
        ? "5x5 ✅"
        : "5x5 ❌",
      pair.seven.verified
        ? "7x7 ✅"
        : "7x7 ❌",
    ].join(" | "),
  );
}