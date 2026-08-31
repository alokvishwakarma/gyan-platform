/*
 * ========================================================
 * GYAN Puzzle Triviality Checker — targeted v2
 * ========================================================
 *
 * Purpose:
 * Reject "egregiously trivial" puzzles that have an
 * obvious solution in 0, 1, 2, or 3 PRODUCTIVE swaps.
 *
 * This is intentionally NOT an exhaustive BFS.
 *
 * For each valid winning geometry and candidate color:
 * - inspect only swaps that increase that color's occupancy
 *   on that geometry;
 * - recurse to depth 3;
 * - use full toroidal 8-neighbor movement:
 *   orthogonal, diagonal, edge wrap, diagonal wrap.
 *
 * This keeps memory flat and is practical for 5x5 / 7x7.
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
    wrappedOffset?: number;
    pattern?: "line" | "diagonal" | "wrapped";
  };
}

export interface HardnessCheckResult {
  requestedMode:
    HardnessModeKey;

  accepted: boolean;

  easiestSimpleMoves:
    number | null;

  checkedDepth:
    number;

  statesChecked:
    number;

  reason:
    string;
}

interface Position {
  row: number;
  column: number;
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


function wrappedOffsetForMode(
  mode:
    HardnessPuzzleInput["mode"],
): number {
  if (
    typeof mode.wrappedOffset ===
      "number"
  ) {
    return mode.wrappedOffset;
  }

  if (
    mode.key ===
      "VERY_HARD_1"
  ) {
    return 1;
  }

  if (
    mode.key ===
      "VERY_HARD_2"
  ) {
    return 2;
  }

  if (
    mode.key ===
      "VERY_HARD_3"
  ) {
    return 3;
  }

  if (
    mode.key ===
      "RARE"
  ) {
    return 4;
  }

  return 0;
}

function patternKind(
  mode:
    HardnessPuzzleInput["mode"],
):
  | "line"
  | "diagonal"
  | "wrapped" {
  if (
    mode.pattern
  ) {
    return mode.pattern;
  }

  if (
    mode.key ===
      "HARD"
  ) {
    return "diagonal";
  }

  if (
    mode.key ===
      "VERY_HARD_1" ||
    mode.key ===
      "VERY_HARD_2" ||
    mode.key ===
      "VERY_HARD_3" ||
    mode.key ===
      "RARE"
  ) {
    return "wrapped";
  }

  return "line";
}

function winningPatterns(
  size: number,
  mode:
    HardnessPuzzleInput["mode"],
): Position[][] {
  const kind =
    patternKind(
      mode,
    );

  if (
    kind ===
      "line"
  ) {
    return [
      ...Array.from(
        {
          length:
            size,
        },
        (
          _,
          row,
        ) =>
          Array.from(
            {
              length:
                size,
            },
            (
              __,
              column,
            ) => ({
              row,
              column,
            }),
          ),
      ),

      ...Array.from(
        {
          length:
            size,
        },
        (
          _,
          column,
        ) =>
          Array.from(
            {
              length:
                size,
            },
            (
              __,
              row,
            ) => ({
              row,
              column,
            }),
          ),
      ),
    ];
  }

  if (
    kind ===
      "diagonal"
  ) {
    return [
      Array.from(
        {
          length:
            size,
        },
        (
          _,
          row,
        ) => ({
          row,
          column:
            row,
        }),
      ),

      Array.from(
        {
          length:
            size,
        },
        (
          _,
          row,
        ) => ({
          row,
          column:
            size -
            1 -
            row,
        }),
      ),
    ];
  }

  const offset =
    (
      wrappedOffsetForMode(
        mode,
      ) %
        size +
      size
    ) %
    size;

  /*
   * Match the existing wrapped puzzle definition:
   * one deterministic wrapped ↘ geometry for this mode.
   */
  return [
    Array.from(
      {
        length:
          size,
      },
      (
        _,
        row,
      ) => ({
        row,
        column:
          (
            row +
            offset
          ) %
          size,
      }),
    ),
  ];
}

function legalSpatialSwapPairs(
  size: number,
): SwapPair[] {
  const pairs:
    SwapPair[] = [];

  const seen =
    new Set<string>();

  function add(
    first: number,
    second: number,
  ): void {
    if (
      first ===
        second
    ) {
      return;
    }

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
      first:
        low,
      second:
        high,
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
       * All 8 neighboring offsets with toroidal wrap.
       * Duplicates are eliminated by add().
       */
      for (
        let rowDelta = -1;
        rowDelta <= 1;
        rowDelta += 1
      ) {
        for (
          let columnDelta = -1;
          columnDelta <= 1;
          columnDelta += 1
        ) {
          if (
            rowDelta ===
              0 &&
            columnDelta ===
              0
          ) {
            continue;
          }

          const neighborRow =
            (
              row +
              rowDelta +
              size
            ) %
            size;

          const neighborColumn =
            (
              column +
              columnDelta +
              size
            ) %
            size;

          add(
            here,
            indexOf(
              neighborRow,
              neighborColumn,
              size,
            ),
          );
        }
      }
    }
  }

  return pairs;
}

function occupancy(
  colors:
    string[],
  targetIndices:
    Set<number>,
  color:
    string,
): number {
  let count =
    0;

  for (
    const index of
    targetIndices
  ) {
    if (
      colors[
        index
      ] ===
        color
    ) {
      count +=
        1;
    }
  }

  return count;
}

function swapColors(
  colors:
    string[],
  pair:
    SwapPair,
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

function productivePairs(
  colors:
    string[],
  targetIndices:
    Set<number>,
  color:
    string,
  allPairs:
    SwapPair[],
): SwapPair[] {
  const result:
    SwapPair[] = [];

  for (
    const pair of
    allPairs
  ) {
    const firstInside =
      targetIndices.has(
        pair.first,
      );

    const secondInside =
      targetIndices.has(
        pair.second,
      );

    /*
     * A direct productive swap must cross the boundary.
     */
    if (
      firstInside ===
        secondInside
    ) {
      continue;
    }

    const insideIndex =
      firstInside
        ? pair.first
        : pair.second;

    const outsideIndex =
      firstInside
        ? pair.second
        : pair.first;

    /*
     * Move candidate color INTO a missing target cell.
     */
    if (
      colors[
        insideIndex
      ] !==
        color &&
      colors[
        outsideIndex
      ] ===
        color
    ) {
      result.push(
        pair,
      );
    }
  }

  return result;
}

function boardKey(
  colors:
    string[],
): string {
  return colors.join(",");
}


function isWinningState(
  colors:
    string[],
  size: number,
  mode:
    HardnessPuzzleInput["mode"],
): boolean {
  const patterns =
    winningPatterns(
      size,
      mode,
    );

  for (
    const pattern of
    patterns
  ) {
    const indices =
      pattern.map(
        (
          position,
        ) =>
          indexOf(
            position.row,
            position.column,
            size,
          ),
      );

    const firstColor =
      colors[
        indices[0]
      ];

    if (
      indices.every(
        (
          index,
        ) =>
          colors[index] ===
            firstColor,
      )
    ) {
      return true;
    }
  }

  return false;
}


function shortestExactSolution(
  startColors:
    string[],
  size: number,
  mode:
    HardnessPuzzleInput["mode"],
  maximumDepth:
    number,
): {
  moves:
    number | null;
  statesChecked:
    number;
} {
  let statesChecked =
    1;

  if (
    isWinningState(
      startColors,
      size,
      mode,
    )
  ) {
    return {
      moves: 0,
      statesChecked,
    };
  }

  const allPairs =
    legalSpatialSwapPairs(
      size,
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
      maximumDepth;
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
        allPairs
      ) {
        /*
         * Swapping equal colors cannot change the board state.
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
          isWinningState(
            next,
            size,
            mode,
          )
        ) {
          return {
            moves:
              depth,

            statesChecked,
          };
        }

        if (
          depth <
            maximumDepth
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
    moves:
      null,

    statesChecked,
  };
}


function shortestProductiveSolution(
  startColors:
    string[],
  size: number,
  mode:
    HardnessPuzzleInput["mode"],
  maximumDepth:
    number,
): {
  moves:
    number | null;
  statesChecked:
    number;
} {
  const patterns =
    winningPatterns(
      size,
      mode,
    );

  const allPairs =
    legalSpatialSwapPairs(
      size,
    );

  const colors =
    Array.from(
      new Set(
        startColors,
      ),
    );

  let statesChecked =
    0;

  for (
    const pattern of
    patterns
  ) {
    const targetIndices =
      new Set(
        pattern.map(
          (
            position,
          ) =>
            indexOf(
              position.row,
              position.column,
              size,
            ),
        ),
      );

    for (
      const color of
      colors
    ) {
      const startingOccupancy =
        occupancy(
          startColors,
          targetIndices,
          color,
        );

      statesChecked +=
        1;

      if (
        startingOccupancy ===
          size
      ) {
        return {
          moves:
            0,
          statesChecked,
        };
      }

      /*
       * Even with perfect productive moves, each swap can
       * increase occupancy by at most one.
       */
      if (
        size -
          startingOccupancy >
        maximumDepth
      ) {
        continue;
      }

      const visited =
        new Set<string>();

      function search(
        current:
          string[],
        depth:
          number,
      ): number | null {
        const currentOccupancy =
          occupancy(
            current,
            targetIndices,
            color,
          );

        statesChecked +=
          1;

        if (
          currentOccupancy ===
            size
        ) {
          return depth;
        }

        if (
          depth >=
            maximumDepth
        ) {
          return null;
        }

        const missing =
          size -
          currentOccupancy;

        if (
          depth +
            missing >
          maximumDepth
        ) {
          return null;
        }

        const stateKey =
          `${depth}|${current.join(",")}`;

        if (
          visited.has(
            stateKey,
          )
        ) {
          return null;
        }

        visited.add(
          stateKey,
        );

        for (
          const pair of
          productivePairs(
            current,
            targetIndices,
            color,
            allPairs,
          )
        ) {
          const next =
            swapColors(
              current,
              pair,
            );

          const found =
            search(
              next,
              depth +
                1,
            );

          if (
            found !==
              null
          ) {
            return found;
          }
        }

        return null;
      }

      const found =
        search(
          startColors,
          0,
        );

      if (
        found !==
          null
      ) {
        return {
          moves:
            found,
          statesChecked,
        };
      }
    }
  }

  return {
    moves:
      null,
    statesChecked,
  };
}

export function checkPuzzleHardness(
  puzzle:
    HardnessPuzzleInput,
): HardnessCheckResult {
  const checkedDepth =
    3;

  const requestedMode =
    puzzle.mode.key;

  const startColors =
    puzzle.startBoard.map(
      (
        tile,
      ) =>
        tile.color,
    );

  /*
   * Exact certification through depth 2.
   *
   * This uses every legal toroidal 8-neighbor swap,
   * including wrapped diagonals such as A2 <-> E3
   * and A1 <-> E5 on a 5x5 board.
   */
  const exactResult =
    shortestExactSolution(
      startColors,
      puzzle.size,
      puzzle.mode,
      2,
    );

  if (
    exactResult.moves !==
      null
  ) {
    return {
      requestedMode,

      accepted:
        false,

      easiestSimpleMoves:
        exactResult.moves,

      checkedDepth,

      statesChecked:
        exactResult.statesChecked,

      reason:
        exactResult.moves ===
          0
          ? "Puzzle starts already solved."
          : `Exact spatial solution found in ${exactResult.moves} move${exactResult.moves === 1 ? "" : "s"}.`,
    };
  }

  /*
   * Depth 3 remains targeted/productive to avoid the
   * much larger exhaustive third layer.
   */
  const productiveResult =
    shortestProductiveSolution(
      startColors,
      puzzle.size,
      puzzle.mode,
      checkedDepth,
    );

  if (
    productiveResult.moves !==
      null
  ) {
    return {
      requestedMode,

      accepted:
        false,

      easiestSimpleMoves:
        productiveResult.moves,

      checkedDepth,

      statesChecked:
        exactResult.statesChecked +
        productiveResult.statesChecked,

      reason:
        `Obvious productive solution found in ${productiveResult.moves} move${productiveResult.moves === 1 ? "" : "s"}.`,
    };
  }

  return {
    requestedMode,

    accepted:
      true,

    easiestSimpleMoves:
      null,

    checkedDepth,

    statesChecked:
      exactResult.statesChecked +
      productiveResult.statesChecked,

    reason:
      "No exact solution within 2 moves and no monotonic productive solution within 3 legal spatial swaps.",
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
