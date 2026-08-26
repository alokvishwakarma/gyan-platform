/*
 * ========================================================
 * GYAN Puzzle Hardness Checker — v1
 * ========================================================
 *
 * Goal:
 * Prevent a puzzle labelled Medium / Hard / Very Hard
 * from having an obviously easier horizontal/vertical
 * solution.
 *
 * v1 deliberately checks only EASY-style solutions:
 *
 *   MEDIUM:
 *     reject if a simple line exists in 0–1 legal swaps.
 *
 *   HARD / VERY HARD / RARE:
 *     reject if a simple line exists in 0–2 legal swaps.
 *
 * Mystery squares do NOT create extra combinations here.
 * The generator already knows their true colors, so the
 * checker evaluates those underlying colors directly.
 *
 * This is intentionally a bounded validator, not a full
 * exhaustive puzzle solver.
 */

export type HardnessModeKey =
  | "EASY"
  | "MEDIUM"
  | "HARD"
  | "VERY_HARD_1"
  | "VERY_HARD_2"
  | "VERY_HARD_3"
  | "RARE";

export interface HardnessTile {
  id: number;
  color: string;
  hidden: boolean;
}

export interface HardnessPuzzleInput {
  size: number;
  startBoard: HardnessTile[];

  mode: {
    key: HardnessModeKey;
  };
}

export interface HardnessCheckResult {
  requestedMode:
    HardnessModeKey;

  accepted: boolean;

  /*
   * Number of legal swaps needed to reach an
   * ordinary horizontal/vertical solution.
   *
   * null means no simple solution was found
   * inside the bounded search depth.
   */
  easiestSimpleMoves:
    number | null;

  checkedDepth:
    number;

  statesChecked:
    number;

  reason:
    string;
}


interface SwapPair {
  first: number;
  second: number;
}


function indexOf(
  row: number,
  column: number,
  size: number,
): number {
  return (
    row * size +
    column
  );
}


function hasSimpleLine(
  colors: string[],
  size: number,
): boolean {
  /*
   * Horizontal.
   */
  for (
    let row = 0;
    row < size;
    row += 1
  ) {
    const first =
      colors[
        indexOf(
          row,
          0,
          size,
        )
      ];

    let same =
      true;

    for (
      let column = 1;
      column < size;
      column += 1
    ) {
      if (
        colors[
          indexOf(
            row,
            column,
            size,
          )
        ] !==
        first
      ) {
        same =
          false;

        break;
      }
    }

    if (same) {
      return true;
    }
  }

  /*
   * Vertical.
   */
  for (
    let column = 0;
    column < size;
    column += 1
  ) {
    const first =
      colors[
        indexOf(
          0,
          column,
          size,
        )
      ];

    let same =
      true;

    for (
      let row = 1;
      row < size;
      row += 1
    ) {
      if (
        colors[
          indexOf(
            row,
            column,
            size,
          )
        ] !==
        first
      ) {
        same =
          false;

        break;
      }
    }

    if (same) {
      return true;
    }
  }

  return false;
}


function legalSwapPairs(
  size: number,
): SwapPair[] {
  const pairs:
    SwapPair[] = [];

  const seen =
    new Set<string>();

  function add(
    first: number,
    second: number,
  ) {
    const low =
      Math.min(
        first,
        second,
      );

    const high =
      Math.max(
        first,
        second,
      );

    const key =
      `${low}:${high}`;

    if (
      seen.has(
        key,
      )
    ) {
      return;
    }

    seen.add(
      key,
    );

    pairs.push({
      first: low,
      second: high,
    });
  }

  for (
    let row = 0;
    row < size;
    row += 1
  ) {
    for (
      let column = 0;
      column < size;
      column += 1
    ) {
      const here =
        indexOf(
          row,
          column,
          size,
        );

      /*
       * Orthogonal neighbours.
       */
      if (
        column + 1 <
        size
      ) {
        add(
          here,
          indexOf(
            row,
            column + 1,
            size,
          ),
        );
      }

      if (
        row + 1 <
        size
      ) {
        add(
          here,
          indexOf(
            row + 1,
            column,
            size,
          ),
        );
      }

      /*
       * Diagonal neighbours.
       */
      if (
        row + 1 <
          size &&
        column + 1 <
          size
      ) {
        add(
          here,
          indexOf(
            row + 1,
            column + 1,
            size,
          ),
        );
      }

      if (
        row + 1 <
          size &&
        column - 1 >=
          0
      ) {
        add(
          here,
          indexOf(
            row + 1,
            column - 1,
            size,
          ),
        );
      }
    }
  }

  /*
   * Opposite horizontal edges.
   */
  for (
    let row = 0;
    row < size;
    row += 1
  ) {
    add(
      indexOf(
        row,
        0,
        size,
      ),
      indexOf(
        row,
        size - 1,
        size,
      ),
    );
  }

  /*
   * Opposite vertical edges.
   */
  for (
    let column = 0;
    column < size;
    column += 1
  ) {
    add(
      indexOf(
        0,
        column,
        size,
      ),
      indexOf(
        size - 1,
        column,
        size,
      ),
    );
  }

  return pairs;
}


function swapColors(
  colors: string[],
  pair: SwapPair,
): string[] {
  const next =
    [...colors];

  [
    next[
      pair.first
    ],
    next[
      pair.second
    ],
  ] = [
    next[
      pair.second
    ],
    next[
      pair.first
    ],
  ];

  return next;
}


function boardKey(
  colors: string[],
): string {
  /*
   * Color names are stable and small.
   * Joining is sufficient for the bounded v1 search.
   */
  return colors.join(
    ",",
  );
}


function easySearchDepth(
  mode:
    HardnessModeKey,
): number {
  if (
    mode ===
      "EASY"
  ) {
    return 0;
  }

  if (
    mode ===
      "MEDIUM"
  ) {
    return 1;
  }

  return 2;
}


export function checkPuzzleHardness(
  puzzle:
    HardnessPuzzleInput,
): HardnessCheckResult {
  const requestedMode =
    puzzle.mode.key;

  const checkedDepth =
    easySearchDepth(
      requestedMode,
    );

  /*
   * EASY puzzles are allowed to be easy.
   */
  if (
    requestedMode ===
      "EASY"
  ) {
    return {
      requestedMode,

      accepted:
        true,

      easiestSimpleMoves:
        hasSimpleLine(
          puzzle.startBoard.map(
            (
              tile,
            ) =>
              tile.color,
          ),
          puzzle.size,
        )
          ? 0
          : null,

      checkedDepth,

      statesChecked:
        1,

      reason:
        "Easy puzzle; hardness rejection is not required.",
    };
  }

  /*
   * Important:
   * Use the true colors behind mystery tiles.
   * We are validating the generated board, not what
   * the player currently knows.
   */
  const startColors =
    puzzle.startBoard.map(
      (
        tile,
      ) =>
        tile.color,
    );

  let statesChecked =
    1;

  if (
    hasSimpleLine(
      startColors,
      puzzle.size,
    )
  ) {
    return {
      requestedMode,

      accepted:
        false,

      easiestSimpleMoves:
        0,

      checkedDepth,

      statesChecked,

      reason:
        "Simple horizontal/vertical solution already exists.",
    };
  }

  if (
    checkedDepth ===
      0
  ) {
    return {
      requestedMode,

      accepted:
        true,

      easiestSimpleMoves:
        null,

      checkedDepth,

      statesChecked,

      reason:
        "No simple solution found inside bounded search.",
    };
  }

  const swapPairs =
    legalSwapPairs(
      puzzle.size,
    );

  const visited =
    new Set<string>([
      boardKey(
        startColors,
      ),
    ]);

  let frontier:
    string[][] = [
      startColors,
    ];

  for (
    let depth = 1;
    depth <=
      checkedDepth;
    depth += 1
  ) {
    const nextFrontier:
      string[][] = [];

    for (
      const colors of
      frontier
    ) {
      for (
        const pair of
        swapPairs
      ) {
        /*
         * Swapping identical colors produces the same
         * color-state and cannot create a new solution.
         */
        if (
          colors[
            pair.first
          ] ===
          colors[
            pair.second
          ]
        ) {
          continue;
        }

        const next =
          swapColors(
            colors,
            pair,
          );

        const key =
          boardKey(
            next,
          );

        if (
          visited.has(
            key,
          )
        ) {
          continue;
        }

        visited.add(
          key,
        );

        statesChecked +=
          1;

        if (
          hasSimpleLine(
            next,
            puzzle.size,
          )
        ) {
          return {
            requestedMode,

            accepted:
              false,

            easiestSimpleMoves:
              depth,

            checkedDepth,

            statesChecked,

            reason:
              `Simple horizontal/vertical solution found in ${depth} legal swap${depth === 1 ? "" : "s"}.`,
          };
        }

        if (
          depth <
          checkedDepth
        ) {
          nextFrontier.push(
            next,
          );
        }
      }
    }

    frontier =
      nextFrontier;
  }

  return {
    requestedMode,

    accepted:
      true,

    easiestSimpleMoves:
      null,

    checkedDepth,

    statesChecked,

    reason:
      `No simple horizontal/vertical solution found within ${checkedDepth} legal swap${checkedDepth === 1 ? "" : "s"}.`,
  };
}


export function passesPuzzleHardness(
  puzzle:
    HardnessPuzzleInput,
): boolean {
  return checkPuzzleHardness(
    puzzle,
  ).accepted;
}
