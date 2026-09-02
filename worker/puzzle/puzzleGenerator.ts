import {
  checkPuzzleHardness,
} from "./puzzleHardnessChecker";

export type PuzzleStage =
  | "5x5"
  | "7x7";

export type PuzzleModeKey =
  | "EASY"
  | "MEDIUM"
  | "HARD"
  | "VERY_HARD_1"
  | "VERY_HARD_2"
  | "VERY_HARD_3"
  | "RARE";

export interface PuzzleModeInfo {
  key: PuzzleModeKey;
  label: string;
  shortLabel: string;
  probabilityBasisPoints: number;
  probabilityPercent: number;
  gemReward: number;
  wrappedOffset: number;
  pattern:
    | "line"
    | "diagonal"
    | "wrapped";
}

export type TileColor =
  | "red"
  | "blue"
  | "green"
  | "yellow"
  | "purple"
  | "orange"
  | "cyan"
  | "gray";

export interface PuzzleTile {
  id: number;
  color: TileColor;
  hidden: boolean;
}

export interface PuzzlePosition {
  row: number;
  column: number;
}

export interface PuzzleMove {
  from: PuzzlePosition;
  to: PuzzlePosition;
}

export interface GeneratedPuzzle {
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

  mode: PuzzleModeInfo;

  verified: boolean;
}

type Orientation =
  | "horizontal"
  | "vertical"
  | "diagonal-down"
  | "diagonal-up"
  | "wrapped";

interface SolvedBoardResult {
  board: PuzzleTile[];

  winningColor: TileColor;

  orientation: Orientation;

  lineIndex: number;

  winningTileIds: number[];
}

const FIVE_BY_FIVE_COLORS:
  TileColor[] = [
  "red",
  "blue",
  "green",
  "yellow",
  "purple",
  "orange",
];

const SEVEN_BY_SEVEN_COLORS:
  TileColor[] = [
  "red",
  "yellow",
  "green",
  "cyan",
  "blue",
  "purple",
  "gray",
];


function colorsForStage(
  stage: PuzzleStage,
): TileColor[] {
  return stage ===
    "7x7"
    ? SEVEN_BY_SEVEN_COLORS
    : FIVE_BY_FIVE_COLORS;
}


/*
 * ========================================================
 * SEEDED RANDOM
 * ========================================================
 *
 * Same puzzle number/date/stage always produces the
 * same puzzle.
 */

function hashString(
  value: string,
): number {
  let hash =
    2166136261;

  for (
    let index = 0;
    index <
    value.length;
    index += 1
  ) {
    hash ^=
      value.charCodeAt(
        index,
      );

    hash =
      Math.imul(
        hash,
        16777619,
      );
  }

  return hash >>> 0;
}


export const PUZZLE_MODES:
  PuzzleModeInfo[] = [
    {
      key: "EASY",
      label: "Easy",
      shortLabel: "Easy",
      probabilityBasisPoints: 5000,
      probabilityPercent: 50,
      gemReward: 1,
      wrappedOffset: 0,
      pattern: "line",
    },
    {
      key: "MEDIUM",
      label: "Medium",
      shortLabel: "Medium",
      probabilityBasisPoints: 2500,
      probabilityPercent: 25,
      gemReward: 2,
      wrappedOffset: 0,
      pattern: "line",
    },
    {
      key: "HARD",
      label: "Hard",
      shortLabel: "Hard",
      probabilityBasisPoints: 1300,
      probabilityPercent: 13,
      gemReward: 3,
      wrappedOffset: 0,
      pattern: "diagonal",
    },
    {
      key: "VERY_HARD_1",
      label: "Very Hard · Pattern 1",
      shortLabel: "Very Hard P1",
      probabilityBasisPoints: 600,
      probabilityPercent: 6,
      gemReward: 4,
      wrappedOffset: 1,
      pattern: "wrapped",
    },
    {
      key: "VERY_HARD_2",
      label: "Very Hard · Pattern 2",
      shortLabel: "Very Hard P2",
      probabilityBasisPoints: 300,
      probabilityPercent: 3,
      gemReward: 5,
      wrappedOffset: 2,
      pattern: "wrapped",
    },
    {
      key: "VERY_HARD_3",
      label: "Very Hard · Pattern 3",
      shortLabel: "Very Hard P3",
      probabilityBasisPoints: 200,
      probabilityPercent: 2,
      gemReward: 6,
      wrappedOffset: 3,
      pattern: "wrapped",
    },
    {
      key: "RARE",
      label: "Rare Spatial",
      shortLabel: "Rare",
      probabilityBasisPoints: 100,
      probabilityPercent: 1,
      gemReward: 8,
      wrappedOffset: 4,
      pattern: "wrapped",
    },
  ];


export function puzzleModeFor(
  puzzleDate: string,
  puzzleNumber: number,
): PuzzleModeInfo {
  const bucket =
    hashString(
      [
        "gyan-puzzle-mode-v1",
        puzzleDate,
        puzzleNumber,
      ].join(":"),
    ) %
    10000;

  let upper =
    0;

  for (
    const mode of
    PUZZLE_MODES
  ) {
    upper +=
      mode.probabilityBasisPoints;

    if (
      bucket <
      upper
    ) {
      return {
        ...mode,
      };
    }
  }

  return {
    ...PUZZLE_MODES[
      PUZZLE_MODES.length - 1
    ],
  };
}


function winningPositionsForMode(
  size: number,
  mode: PuzzleModeInfo,
  random: () => number,
): {
  orientation: Orientation;
  positions: PuzzlePosition[];
  lineIndex: number;
} {
  if (
    mode.pattern ===
      "diagonal"
  ) {
    const down =
      random() <
      0.5;

    return {
      orientation:
        down
          ? "diagonal-down"
          : "diagonal-up",
      lineIndex:
        0,
      positions:
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
              down
                ? row
                : size - 1 - row,
          }),
        ),
    };
  }

  if (
    mode.pattern ===
      "wrapped"
  ) {
    const offset =
      mode.wrappedOffset %
      size;

    return {
      orientation:
        "wrapped",
      lineIndex:
        offset,
      positions:
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
    };
  }

  const orientation:
    Orientation =
    random() <
      0.5
      ? "horizontal"
      : "vertical";

  const lineIndex =
    1 +
    randomInt(
      random,
      size - 2,
    );

  return {
    orientation,
    lineIndex,
    positions:
      Array.from(
        {
          length:
            size,
        },
        (
          _,
          position,
        ) => ({
          row:
            orientation ===
              "horizontal"
              ? lineIndex
              : position,
          column:
            orientation ===
              "horizontal"
              ? position
              : lineIndex,
        }),
      ),
  };
}


function fullPatternSolved(
  board: PuzzleTile[],
  size: number,
  mode: PuzzleModeInfo,
): boolean {
  const candidatePatterns:
    PuzzlePosition[][] = [];

  if (
    mode.pattern ===
      "line"
  ) {
    for (
      let row = 0;
      row < size;
      row += 1
    ) {
      candidatePatterns.push(
        Array.from(
          { length: size },
          (_, column) => ({
            row,
            column,
          }),
        ),
      );
    }

    for (
      let column = 0;
      column < size;
      column += 1
    ) {
      candidatePatterns.push(
        Array.from(
          { length: size },
          (_, row) => ({
            row,
            column,
          }),
        ),
      );
    }
  } else if (
    mode.pattern ===
      "diagonal"
  ) {
    candidatePatterns.push(
      Array.from(
        { length: size },
        (_, row) => ({
          row,
          column: row,
        }),
      ),
      Array.from(
        { length: size },
        (_, row) => ({
          row,
          column:
            size - 1 - row,
        }),
      ),
    );
  } else {
    const offset =
      mode.wrappedOffset %
      size;

    candidatePatterns.push(
      Array.from(
        { length: size },
        (_, row) => ({
          row,
          column:
            (
              row +
              offset
            ) %
            size,
        }),
      ),
    );
  }

  return candidatePatterns.some(
    (
      positions,
    ) => {
      const first =
        board[
          indexOf(
            positions[0].row,
            positions[0].column,
            size,
          )
        ];

      if (
        first.hidden
      ) {
        return false;
      }

      return positions.every(
        (
          position,
        ) => {
          const tile =
            board[
              indexOf(
                position.row,
                position.column,
                size,
              )
            ];

          return (
            !tile.hidden &&
            tile.color ===
              first.color
          );
        },
      );
    },
  );
}


function createPatternScrambleMoves(
  size: number,
  winningPositions: PuzzlePosition[],
  mode: PuzzleModeInfo,
  random: () => number,
): PuzzleMove[] {
  const winningKeys =
    new Set(
      winningPositions.map(
        (position) =>
          `${position.row}:${position.column}`,
      ),
    );

  const decoys =
    shuffle(
      Array.from(
        {
          length:
            size * size,
        },
        (
          _,
          index,
        ) => ({
          row:
            Math.floor(
              index /
              size,
            ),
          column:
            index %
            size,
        }),
      ).filter(
        (position) =>
          !winningKeys.has(
            `${position.row}:${position.column}`,
          ),
      ),
      random,
    );

  const moveCount =
    mode.key === "EASY"
      ? 1
      : mode.key === "MEDIUM"
        ? 2
        : mode.key === "HARD"
          ? Math.min(
              3,
              size,
            )
          : Math.min(
              Math.max(
                3,
                mode.wrappedOffset + 2,
              ),
              size,
            );

  const chosenWinning =
    shuffle(
      winningPositions,
      random,
    ).slice(
      0,
      moveCount,
    );

  const moves:
    PuzzleMove[] = [];

  for (
    let index = 0;
    index <
      chosenWinning.length;
    index += 1
  ) {
    const from =
      chosenWinning[
        index
      ];

    let destinationIndex =
      index;

    if (
      mode.key ===
        "MEDIUM" &&
      index === 1
    ) {
      const far =
        decoys.findIndex(
          (
            candidate,
          ) =>
            (
              Math.abs(
                candidate.row -
                from.row,
              ) +
              Math.abs(
                candidate.column -
                from.column,
              )
            ) >= 2,
        );

      if (
        far >= 0
      ) {
        destinationIndex =
          far;
      }
    }

    const to =
      decoys.splice(
        destinationIndex,
        1,
      )[0];

    if (
      !to
    ) {
      throw new Error(
        "Unable to allocate scramble destination.",
      );
    }

    moves.push({
      from: {
        ...from,
      },
      to: {
        ...to,
      },
    });
  }

  return moves;
}


function createRandom(
  seedText: string,
): () => number {
  let state =
    hashString(
      seedText,
    );

  return () => {
    state +=
      0x6d2b79f5;

    let value =
      state;

    value =
      Math.imul(
        value ^
          (value >>> 15),
        value | 1,
      );

    value ^=
      value +
      Math.imul(
        value ^
          (value >>> 7),
        value | 61,
      );

    return (
      (
        value ^
        (value >>> 14)
      ) >>>
      0
    ) /
      4294967296;
  };
}

function randomInt(
  random: () => number,
  maximum: number,
): number {
  return Math.floor(
    random() *
      maximum,
  );
}

function shuffle<T>(
  values: T[],
  random: () => number,
): T[] {
  const result =
    [...values];

  for (
    let index =
      result.length - 1;
    index > 0;
    index -= 1
  ) {
    const other =
      randomInt(
        random,
        index + 1,
      );

    [
      result[index],
      result[other],
    ] = [
      result[other],
      result[index],
    ];
  }

  return result;
}


/*
 * ========================================================
 * BOARD HELPERS
 * ========================================================
 */

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

function cloneBoard(
  board: PuzzleTile[],
): PuzzleTile[] {
  return board.map(
    (tile) => ({
      ...tile,
    }),
  );
}

function swap(
  board: PuzzleTile[],
  move: PuzzleMove,
  size: number,
): PuzzleTile[] {
  const next =
    cloneBoard(
      board,
    );

  const first =
    indexOf(
      move.from.row,
      move.from.column,
      size,
    );

  const second =
    indexOf(
      move.to.row,
      move.to.column,
      size,
    );

  [
    next[first],
    next[second],
  ] = [
    next[second],
    next[first],
  ];

  return next;
}

function applyMoves(
  board: PuzzleTile[],
  moves: PuzzleMove[],
  size: number,
): PuzzleTile[] {
  let next =
    cloneBoard(
      board,
    );

  for (
    const move of moves
  ) {
    next =
      swap(
        next,
        move,
        size,
      );
  }

  return next;
}

function reverseMove(
  move: PuzzleMove,
): PuzzleMove {
  return {
    from: {
      ...move.to,
    },

    to: {
      ...move.from,
    },
  };
}

function createSolutionMoves(
  scrambleMoves:
    PuzzleMove[],
): PuzzleMove[] {
  return [
    ...scrambleMoves,
  ]
    .reverse()
    .map(
      reverseMove,
    );
}


/*
 * ========================================================
 * SOLVED BOARD
 * ========================================================
 */

function createSolvedBoard(
  size: number,
  random: () => number,
  mode: PuzzleModeInfo,
  stage: PuzzleStage,
): SolvedBoardResult {
  const colors =
    colorsForStage(
      stage,
    );

  const winningColor =
    colors[
      randomInt(
        random,
        colors.length,
      )
    ];

  const pattern =
    winningPositionsForMode(
      size,
      mode,
      random,
    );

  const palette =
    shuffle(
      colors,
      random,
    );

  const board:
    PuzzleTile[] = [];

  let id = 1;

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
      const offset =
        (
          row * 3 +
          column * 2 +
          randomInt(
            random,
            colors.length,
          )
        ) %
        palette.length;

      board.push({
        id,
        color:
          palette[
            offset
          ],
        hidden:
          false,
      });

      id += 1;
    }
  }

  const winningTileIds:
    number[] = [];

  for (
    const position of
    pattern.positions
  ) {
    const tile =
      board[
        indexOf(
          position.row,
          position.column,
          size,
        )
      ];

    tile.color =
      winningColor;

    winningTileIds.push(
      tile.id,
    );
  }

  return {
    board,
    winningColor,
    orientation:
      pattern.orientation,
    lineIndex:
      pattern.lineIndex,
    winningTileIds,
  };
}

/*
 * ========================================================
 * MEDIUM / HARD SCRAMBLE
 * ========================================================
 *
 * Every winning tile moves exactly once away from its
 * solved line.
 *
 * Instead of all moving in the same direction, they are
 * distributed on BOTH sides of the target line.
 *
 * Example:
 *
 *       R       R
 *   R       R
 * ---------------- target
 *     R       R
 *
 * This is substantially less obvious than our old:
 *
 * R R R R R
 * directly underneath one empty winning row.
 */

function createScrambleMoves(
  size: number,
  orientation:
    Orientation,
  lineIndex: number,
  random: () => number,
  stage: PuzzleStage,
): PuzzleMove[] {
  const moves:
    PuzzleMove[] = [];

  /*
   * Deliberately move one winning tile twice
   * in the same direction. This guarantees
   * that at least one tile can finish two
   * cells away from its solved location.
   */
  const longDirections =
    [-1, 1].filter(
      (direction) => {
        const destination =
          lineIndex +
          direction * 2;

        return (
          destination >= 0 &&
          destination < size
        );
      },
    );

  if (
    longDirections.length === 0
  ) {
    throw new Error(
      "Winning line cannot support a two-cell scramble.",
    );
  }

  const longDirection =
    longDirections[
      randomInt(
        random,
        longDirections.length,
      )
    ];

  const longPosition =
    randomInt(
      random,
      size,
    );

  if (
    orientation ===
      "horizontal"
  ) {
    moves.push(
      {
        from: {
          row:
            lineIndex,
          column:
            longPosition,
        },
        to: {
          row:
            lineIndex +
            longDirection,
          column:
            longPosition,
        },
      },
      {
        from: {
          row:
            lineIndex +
            longDirection,
          column:
            longPosition,
        },
        to: {
          row:
            lineIndex +
            longDirection * 2,
          column:
            longPosition,
        },
      },
    );
  } else {
    moves.push(
      {
        from: {
          row:
            longPosition,
          column:
            lineIndex,
        },
        to: {
          row:
            longPosition,
          column:
            lineIndex +
            longDirection,
        },
      },
      {
        from: {
          row:
            longPosition,
          column:
            lineIndex +
            longDirection,
        },
        to: {
          row:
            longPosition,
          column:
            lineIndex +
            longDirection * 2,
        },
      },
    );
  }

  const remainingPositions =
    shuffle(
      Array.from(
        {
          length:
            size,
        },
        (_, index) =>
          index,
      ).filter(
        (position) =>
          position !==
          longPosition,
      ),
      random,
    );

  for (
    let order = 0;
    moves.length < size &&
    order <
      remainingPositions.length;
    order += 1
  ) {
    const position =
      remainingPositions[
        order
      ];

    const directions =
      [-1, 1].filter(
        (direction) => {
          const destination =
            lineIndex +
            direction;

          return (
            destination >= 0 &&
            destination < size
          );
        },
      );

    if (
      directions.length === 0
    ) {
      continue;
    }

    const direction =
      stage === "5x5"
        ? directions[
            order %
              directions.length
          ]
        : directions[
            randomInt(
              random,
              directions.length,
            )
          ];

    if (
      orientation ===
        "horizontal"
    ) {
      moves.push({
        from: {
          row:
            lineIndex,
          column:
            position,
        },
        to: {
          row:
            lineIndex +
            direction,
          column:
            position,
        },
      });
    } else {
      moves.push({
        from: {
          row:
            position,
          column:
            lineIndex,
        },
        to: {
          row:
            position,
          column:
            lineIndex +
            direction,
        },
      });
    }
  }

  if (
    moves.length !== size
  ) {
    throw new Error(
      `Expected ${size} scramble moves but generated ${moves.length}.`,
    );
  }

  return moves;
}


/*
 * ========================================================
 * MYSTERIES
 * ========================================================
 */

function addMysteries(
  board: PuzzleTile[],
  size: number,
  winningTileIds:
    number[],
  random: () => number,
  hideWinningTile = true,
): {
  board: PuzzleTile[];
  revealOrder: number[];
} {
  const next =
    cloneBoard(
      board,
    );

  const revealOrder:
    number[] = [];

  /*
   * One winning tile becomes a mystery.
   *
   * Its location varies by puzzle.
   */
  const shuffledWinningIds =
    shuffle(
      winningTileIds,
      random,
    );

  if (
    hideWinningTile
  ) {
    const winningMysteryId =
      shuffledWinningIds[
        0
      ];

    const winningMystery =
      next.find(
        (tile) =>
          tile.id ===
          winningMysteryId,
      );

    if (!winningMystery) {
      throw new Error(
        "Winning mystery tile not found.",
      );
    }

    winningMystery.hidden =
      true;

    revealOrder.push(
      winningMystery.id,
    );
  }

  /*
   * Other mysteries are decoys.
   */
  const candidates =
    shuffle(
      next.filter(
        (tile) =>
          !tile.hidden &&
          !winningTileIds.includes(
            tile.id,
          ),
      ),
      random,
    );

  const decoyCount =
    size -
    revealOrder.length;

  for (
    let index = 0;
    index <
    decoyCount;
    index += 1
  ) {
    const tile =
      candidates[
        index
      ];

    if (!tile) {
      break;
    }

    tile.hidden =
      true;

    revealOrder.push(
      tile.id,
    );
  }

  if (
    revealOrder.length !==
    size
  ) {
    throw new Error(
      `Expected ${size} mystery tiles but generated ${revealOrder.length}.`,
    );
  }

  return {
    board:
      next,

    revealOrder,
  };
}


/*
 * ========================================================
 * MATCH CHECK
 * ========================================================
 */

function longestVisibleMatch(
  board: PuzzleTile[],
  size: number,
): number {
  let best = 1;

  for (
    let row = 0;
    row < size;
    row += 1
  ) {
    let length = 1;

    for (
      let column = 1;
      column < size;
      column += 1
    ) {
      const previous =
        board[
          indexOf(
            row,
            column - 1,
            size,
          )
        ];

      const current =
        board[
          indexOf(
            row,
            column,
            size,
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

  for (
    let column = 0;
    column < size;
    column += 1
  ) {
    let length = 1;

    for (
      let row = 1;
      row < size;
      row += 1
    ) {
      const previous =
        board[
          indexOf(
            row - 1,
            column,
            size,
          )
        ];

      const current =
        board[
          indexOf(
            row,
            column,
            size,
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


/*
 * ========================================================
 * MYSTERY REVEAL
 * ========================================================
 */

function countDirection(
  board: PuzzleTile[],
  size: number,

  row: number,
  column: number,

  rowDelta: number,
  columnDelta: number,

  color: TileColor,
): number {
  let count = 0;

  let currentRow =
    row +
    rowDelta;

  let currentColumn =
    column +
    columnDelta;

  while (
    currentRow >= 0 &&
    currentRow < size &&
    currentColumn >= 0 &&
    currentColumn < size
  ) {
    const tile =
      board[
        indexOf(
          currentRow,
          currentColumn,
          size,
        )
      ];

    if (
      tile.hidden ||
      tile.color !==
        color
    ) {
      break;
    }

    count += 1;

    currentRow +=
      rowDelta;

    currentColumn +=
      columnDelta;
  }

  return count;
}

function shouldRevealMystery(
  board: PuzzleTile[],
  size: number,
  tileIndex: number,
): boolean {
  const tile =
    board[
      tileIndex
    ];

  if (
    !tile ||
    !tile.hidden
  ) {
    return false;
  }

  const row =
    Math.floor(
      tileIndex /
        size,
    );

  const column =
    tileIndex %
    size;

  const horizontal =
    countDirection(
      board,
      size,
      row,
      column,
      0,
      -1,
      tile.color,
    ) +
    countDirection(
      board,
      size,
      row,
      column,
      0,
      1,
      tile.color,
    );

  const vertical =
    countDirection(
      board,
      size,
      row,
      column,
      -1,
      0,
      tile.color,
    ) +
    countDirection(
      board,
      size,
      row,
      column,
      1,
      0,
      tile.color,
    );

  return (
    horizontal >= 3 ||
    vertical >= 3
  );
}

export function revealEligibleMysteries(
  board: PuzzleTile[],
  size: number,
): PuzzleTile[] {
  const next =
    cloneBoard(
      board,
    );

  let changed =
    true;

  while (changed) {
    changed =
      false;

    for (
      let index = 0;
      index <
      next.length;
      index += 1
    ) {
      if (
        shouldRevealMystery(
          next,
          size,
          index,
        )
      ) {
        next[index] = {
          ...next[
            index
          ],

          hidden:
            false,
        };

        changed =
          true;
      }
    }
  }

  return next;
}


/*
 * ========================================================
 * VERIFIER
 * ========================================================
 */

export function verifyPuzzle(
  puzzle: GeneratedPuzzle,
): boolean {
  let board =
    cloneBoard(
      puzzle.startBoard,
    );

  /*
   * Never publish something already solved.
   */
  if (
    fullPatternSolved(
      board,
      puzzle.size,
      puzzle.mode,
    )
  ) {
    return false;
  }

  if (
    puzzle.solutionMoves.length >
    puzzle.maxMoves
  ) {
    return false;
  }

  for (
    const move of
    puzzle.solutionMoves
  ) {
    board =
      swap(
        board,
        move,
        puzzle.size,
      );

    board =
      revealEligibleMysteries(
        board,
        puzzle.size,
      );

    if (
      fullPatternSolved(
        board,
        puzzle.size,
        puzzle.mode,
      )
    ) {
      return true;
    }
  }

  return fullPatternSolved(
    board,
    puzzle.size,
    puzzle.mode,
  );
}


/*
 * ========================================================
 * GENERATOR
 * ========================================================
 */

function stageSize(
  stage: PuzzleStage,
): number {
  return (
    stage ===
      "5x5"
      ? 5
      : 7
  );
}

function hasTileDisplacedByAtLeastTwo(
  solvedBoard: PuzzleTile[],
  scrambledBoard: PuzzleTile[],
  size: number,
): boolean {
  const solvedPositionById =
    new Map<number, PuzzlePosition>();

  for (
    let index = 0;
    index < solvedBoard.length;
    index += 1
  ) {
    solvedPositionById.set(
      solvedBoard[index].id,
      {
        row:
          Math.floor(index / size),

        column:
          index % size,
      },
    );
  }

  for (
    let index = 0;
    index < scrambledBoard.length;
    index += 1
  ) {
    const tile =
      scrambledBoard[index];

    const solvedPosition =
      solvedPositionById.get(
        tile.id,
      );

    if (!solvedPosition) {
      continue;
    }

    const row =
      Math.floor(index / size);

    const column =
      index % size;

    const distance =
      Math.abs(
        row -
          solvedPosition.row,
      ) +
      Math.abs(
        column -
          solvedPosition.column,
      );

    if (distance >= 2) {
      return true;
    }
  }

  return false;
}


function visualStartAcceptable(
  puzzle:
    GeneratedPuzzle,
): boolean {
  const longest =
    longestVisibleMatch(
      puzzle.startBoard,
      puzzle.size,
    );

  /*
   * Don't start with an obvious visible
   * Match-3 or better.
   *
   * Player must inspect/discover structure.
   */
  return (
    longest <= 2
  );
}

export function generatePuzzle(
  puzzleDate: string,
  puzzleNumber: number,
  stage: PuzzleStage,
): GeneratedPuzzle {
  const size =
    stageSize(
      stage,
    );

  const mode =
    puzzleModeFor(
      puzzleDate,
      puzzleNumber,
    );

  /*
   * Multiple deterministic candidates.
   *
   * If a background arrangement accidentally
   * looks too easy, generate another candidate.
   *
   * Emergency fallback:
   * keep the LAST structurally verified candidate.
   * This means candidate 499 wins if it is solvable,
   * even when it misses only visual/hardness quality
   * certification. We never publish an unverified
   * / unsolvable candidate merely to avoid a 500.
   */
  let fallbackPuzzle:
    GeneratedPuzzle | null =
      null;

  for (
    let candidate = 0;
    candidate < 500;
    candidate += 1
  ) {
const random =
  createRandom(
    [
      "reverse-auto-v1",
      puzzleDate,
      puzzleNumber,
      stage,
      candidate,
    ].join(":"),
  );

    const solved =
      createSolvedBoard(
        size,
        random,
        mode,
        stage,
      );

    const winningPositions =
      solved.winningTileIds.map(
        (
          tileId,
        ) => {
          const index =
            solved.board.findIndex(
              (
                tile,
              ) =>
                tile.id ===
                tileId,
            );

          return {
            row:
              Math.floor(
                index /
                size,
              ),
            column:
              index %
              size,
          };
        },
      );

    const scrambleMoves =
      mode.key ===
        "EASY" ||
      mode.key ===
        "MEDIUM"
        ? createPatternScrambleMoves(
            size,
            winningPositions,
            mode,
            random,
          )
        : mode.pattern ===
            "line"
          ? createScrambleMoves(
              size,
              solved.orientation,
              solved.lineIndex,
              random,
              stage,
            )
          : createPatternScrambleMoves(
            size,
            winningPositions,
            mode,
            random,
          );

    const scrambledBoard =
      applyMoves(
        solved.board,
        scrambleMoves,
        size,
      );

    if (
      mode.key !==
        "EASY" &&
      !hasTileDisplacedByAtLeastTwo(
        solved.board,
        scrambledBoard,
        size,
      )
    ) {
      continue;
    }

    const mysteryResult =
      addMysteries(
        scrambledBoard,
        size,
        solved.winningTileIds,
        random,
        mode.pattern ===
          "line",
      );

    const solutionMoves =
      createSolutionMoves(
        scrambleMoves,
      );

    const draft:
      GeneratedPuzzle = {
      puzzleDate,

      puzzleNumber,

      stage,

      size,

      maxMoves:
        size,

      mysteryCount:
        size,

      startBoard:
        mysteryResult.board,

      solvedBoard:
        cloneBoard(
          solved.board,
        ),

      solutionMoves,

      mysteryRevealOrder:
        mysteryResult.revealOrder,

      mode: {
        ...mode,
      },

      verified:
        false,
    };

    /*
     * Safety check comes before quality checks.
     *
     * Remember the latest solvable candidate so
     * candidate 499 can act as the emergency
     * fallback if all quality-certified candidates
     * fail.
     */
    const structurallyVerified =
      verifyPuzzle(
        draft,
      );

    if (
      structurallyVerified
    ) {
      fallbackPuzzle = {
        ...draft,
        verified:
          true,
      };
    }

    if (
      !visualStartAcceptable(
        draft,
      )
    ) {
      continue;
    }

    if (
      !structurallyVerified
    ) {
      continue;
    }

    /*
     * v1 hardness certification:
     *
     * MEDIUM must not have a simple line in
     * 0–1 legal swaps.
     *
     * HARD / VERY HARD / RARE must not have
     * a simple line in 0–2 legal swaps.
     *
     * Mystery tiles are checked using their true
     * generator-known colors, so they do not create
     * an exponential hidden-color search.
     */
    const hardness =
      checkPuzzleHardness(
        draft,
      );

    if (
      !hardness.accepted
    ) {
      continue;
    }

    return {
      ...draft,

      verified:
        true,
    };
  }

  /*
   * No candidate passed every quality gate.
   *
   * Prefer availability over hardness certification,
   * but ONLY with a puzzle that verifyPuzzle()
   * proved solvable. Because fallbackPuzzle is
   * overwritten as we iterate, candidate 499 is
   * used when it is structurally valid.
   */
  if (
    fallbackPuzzle
  ) {
    console.warn(
      `Using verified fallback ${stage} puzzle #${puzzleNumber} after all 500 quality candidates failed.`,
    );

    return fallbackPuzzle;
  }

  throw new Error(
    `Unable to generate a verified ${stage} puzzle #${puzzleNumber} after 500 candidates.`,
  );
}

export function generateDailyPuzzlePair(
  puzzleDate: string,
  puzzleNumber: number,
): {
  five:
    GeneratedPuzzle;

  seven:
    GeneratedPuzzle;
} {
  return {
    five:
      generatePuzzle(
        puzzleDate,
        puzzleNumber,
        "5x5",
      ),

    seven:
      generatePuzzle(
        puzzleDate,
        puzzleNumber,
        "7x7",
      ),
  };
}