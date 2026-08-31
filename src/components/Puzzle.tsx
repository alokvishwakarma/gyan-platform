import {
  useEffect,
  useRef,
  useState,
} from "react";

import QRCode from "qrcode";

import "./Puzzle.css";
import LivePuzzle from "./LivePuzzle";

type TileColor =
  | "red"
  | "blue"
  | "green"
  | "yellow"
  | "purple"
  | "orange"
  | "cyan"
  | "gray";

type PuzzleStage =
  | "5x5"
  | "7x7";

interface Tile {
  id: number;
  hidden: boolean;
  color?: TileColor;

  /*
   * Opaque per-puzzle identity used only for
   * client-side equality checks.
   *
   * Hidden tiles still do not expose their
   * literal color.
   */
  matchCode?: string;
}

interface Position {
  row: number;
  column: number;
}

interface PuzzleMove {
  from: Position;
  to: Position;
}

type MatchOrientation =
  | "horizontal"
  | "vertical"
  | "diagonal-down"
  | "diagonal-up";

interface MatchDetail {
  signature: string;
  orientation: MatchOrientation;
  tileIds: number[];
}

interface PuzzleSkillStats {
  strategicReveals: number;
  doubleReveals: number;

  /*
   * Kept separately so the future GQ formula can
   * decide whether to reward the gesture, the
   * resulting pattern, or both.
   */
  productiveDiagonalSwaps: number;
  diagonalMatches: number;

  productiveEdgeSwaps: number;
  mysteryFinishes: number;
}

function emptySkillStats():
  PuzzleSkillStats {
  return {
    strategicReveals: 0,
    doubleReveals: 0,
    productiveDiagonalSwaps: 0,
    diagonalMatches: 0,
    productiveEdgeSwaps: 0,
    mysteryFinishes: 0,
  };
}


interface GqResult {
  score: number;
  efficiencyMultiplier: number;
  efficiencyLevel:
    0 | 1 | 2;
  icons: string[];
}

function elapsedSince(
  startedAt: number | null,
  endedAt: number,
): number {
  return startedAt === null
    ? 0
    : Math.max(
        0,
        endedAt -
          startedAt,
      );
}


function calculateStageGq(
  maxMoves: number,
  movesUsed: number,
  stats: PuzzleSkillStats,
  solved: boolean,
  activeSolveMs: number,
  stage: PuzzleStage,
): GqResult {
  if (!solved) {
    return {
      score: 0,
      efficiencyMultiplier: 1,
      efficiencyLevel: 0,
      icons: [],
    };
  }

  const movesSaved =
    Math.max(
      0,
      maxMoves -
        movesUsed,
    );

  const efficiencyLevel:
    0 | 1 | 2 =
      movesSaved >= 2
        ? 2
        : movesSaved === 1
          ? 1
          : 0;

  const efficiencyPoints =
    efficiencyLevel === 2
      ? 10
      : efficiencyLevel === 1
        ? 6
        : 0;

  const seconds =
    Math.max(
      1,
      Math.round(
        activeSolveMs /
          1000,
      ),
    );

  const speedPoints =
    stage ===
      "7x7"
      ? seconds <= 45
        ? 10
        : seconds <= 75
          ? 8
          : seconds <= 120
            ? 6
            : seconds <= 180
              ? 4
              : seconds <= 300
                ? 2
                : 0
      : seconds <= 20
        ? 10
        : seconds <= 35
          ? 8
          : seconds <= 60
            ? 6
            : seconds <= 90
              ? 4
              : seconds <= 150
                ? 2
                : 0;

  const revealPoints =
    Math.min(
      4,
      stats.strategicReveals,
    );

  const doubleRevealPoints =
    Math.min(
      12,
      stats.doubleReveals *
        6,
    );

  const diagonalPoints =
    Math.min(
      8,
      stats.diagonalMatches *
        4,
    );

  const edgePoints =
    Math.min(
      6,
      stats.productiveEdgeSwaps *
        3,
    );

  const mysteryFinishPoints =
    stats.mysteryFinishes >
    0
      ? 5
      : 0;

  const rawBonus =
    efficiencyPoints +
    speedPoints +
    revealPoints +
    doubleRevealPoints +
    diagonalPoints +
    edgePoints +
    mysteryFinishPoints;

  const stageBonus =
    stage ===
      "7x7"
      ? Math.round(
          rawBonus *
            Math.sqrt(
              7 / 5,
            ),
        )
      : rawBonus;

  const score =
    Math.min(
      150,
      100 +
        stageBonus,
    );

  const icons:
    string[] = [];

  if (
    efficiencyLevel === 1
  ) {
    icons.push(
      "⚡",
    );
  } else if (
    efficiencyLevel === 2
  ) {
    icons.push(
      "⚡",
      "⚡",
    );
  }

  if (
    speedPoints >
    0
  ) {
    icons.push(
      "⏱",
    );
  } 

  for (
    let index = 0;
    index <
      Math.min(
        4,
        stats.strategicReveals,
      );
    index += 1
  ) {
    icons.push(
      "👁️",
    );
  }

  for (
    let index = 0;
    index <
      Math.min(
        2,
        stats.doubleReveals,
      );
    index += 1
  ) {
    icons.push(
      "👁️👁️",
    );
  }

  for (
    let index = 0;
    index <
      Math.min(
        2,
        stats.diagonalMatches,
      );
    index += 1
  ) {
    icons.push(
      "◇",
    );
  }

  for (
    let index = 0;
    index <
      Math.min(
        2,
        stats.productiveEdgeSwaps,
      );
    index += 1
  ) {
    icons.push(
      "↔",
    );
  }

  if (
    stats.mysteryFinishes >
    0
  ) {
    icons.push(
      "❓",
    );
  }

  return {
    score,
    efficiencyMultiplier:
      efficiencyLevel === 2
        ? 1.2
        : efficiencyLevel === 1
          ? 1.1
          : 1,
    efficiencyLevel,
    icons,
  };
}

type PuzzleModeKey =
  | "EASY"
  | "MEDIUM"
  | "HARD"
  | "VERY_HARD_1"
  | "VERY_HARD_2"
  | "VERY_HARD_3"
  | "RARE";

interface PuzzleModeInfo {
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

interface PublicPuzzle {
  puzzleDate: string;
  puzzleNumber: number;
  stage: PuzzleStage;
  size: number;
  maxMoves: number;
  mysteryCount: number;
  mode: PuzzleModeInfo;
  board: Tile[];
}

interface RecentPuzzleSummary {
  puzzleDate: string;
  puzzleNumber: number;
  stage: PuzzleStage;
  size: number;
  maxMoves: number;
  mysteryCount: number;
  mode: PuzzleModeInfo;
}

interface RecentPuzzlesResponse {
  puzzles: RecentPuzzleSummary[];
}

interface HistoricalPuzzleSolution {
  puzzleNumber: number;
  puzzleDate: string;
  size: number;
  mode: PuzzleModeInfo;
  solvedBoard: Tile[];
}

async function fetchRecentPuzzles(
  stage: PuzzleStage,
  limit = 10,
): Promise<RecentPuzzleSummary[]> {
  const response =
    await fetch(
      `/api/puzzle/recent?stage=${stage}&limit=${limit}`,
      {
        cache:
          "no-store",
      },
    );

  const body =
    (await response.json()) as
      RecentPuzzlesResponse & {
        error?: string;
      };

  if (
    !response.ok
  ) {
    throw new Error(
      body.error ??
      "Unable to load recent puzzles.",
    );
  }

  return Array.isArray(
    body.puzzles,
  )
    ? body.puzzles
    : [];
}


interface PuzzleResponse {
  puzzle: PublicPuzzle;
}

interface RevealResponse {
  revealed: Array<{
    id: number;
    color: TileColor;
  }>;
}

interface RevealResult {
  board: Tile[];
  count: number;

  revealedTileIds:
    number[];
}



interface ResultClaimResponse {
  claimed: boolean;

  result?: {
    name: string;
  };

  emailStatus?:
    | "none"
    | "pending"
    | "verified";

  error?: string;
}

interface LeaderboardEntry {
  rank: number;
  resultId: string;
  name: string;
  stage: PuzzleStage;
  isBot?: boolean;

  /*
   * Combined leaderboard score:
   * average of 5×5 GQ and 7×7 GQ.
   */
  gq: number;

  fiveGq:
    number | null;

  sevenGq:
    number | null;

  moves: number;
  icons: string[];
}

interface LeaderboardResponse {
  puzzleNumber: number;
  top:
    LeaderboardEntry[];
  yourRank:
    number | null;
  yourScore:
    number | null;

  yourEntries?:
    LeaderboardEntry[];
}

interface SaveResultResponse {
  saved: boolean;
  resultId: string;
  name?: string;
  error?: string;
}


interface PuzzleGyanIdentityResponse {
  identity?: {
    displayName?: string;
  };
}

interface SavedGameState {
  date: string;
  puzzleNumber: number;
  stage: PuzzleStage;

  board: Tile[];

  moves: number;

  moveHistory:
    PuzzleMove[];

  chancesRemaining: number;

  attemptFinished: boolean;

  qualified: boolean;

  medalWon: boolean;

  pendingRevealCount: number;

  skillStats:
    PuzzleSkillStats;

  rewardedMatchSignatures:
    string[];

  finalResultId:
    string | null;

  solveStartedAt:
    number | null;

  activeSolveMs:
    number;
}

interface PuzzleProps {
  onClose?: () => void;
  onOpenEducation?: () => void;
}


interface PuzzleLaunchRequest {
  puzzleNumber: number;
  stage: PuzzleStage;
  current: boolean;
}

const PUZZLE_LAUNCH_KEY =
  "gyan-puzzle-launch-v1";


function readPuzzleLaunchRequest():
  PuzzleLaunchRequest | null {
  try {
    const raw =
      window.sessionStorage.getItem(
        PUZZLE_LAUNCH_KEY,
      );

    if (!raw) {
      return null;
    }

    window.sessionStorage.removeItem(
      PUZZLE_LAUNCH_KEY,
    );

    const value =
      JSON.parse(
        raw,
      ) as Partial<
        PuzzleLaunchRequest
      >;

    if (
      !Number.isInteger(
        value.puzzleNumber,
      ) ||
      (
        value.stage !==
          "5x5" &&
        value.stage !==
          "7x7"
      ) ||
      typeof value.current !==
        "boolean"
    ) {
      return null;
    }

    return {
      puzzleNumber:
        Number(
          value.puzzleNumber,
        ),

      stage:
        value.stage,

      current:
        value.current,
    };
  } catch {
    return null;
  }
}

const MAX_CHANCES = 5;

const SWIPE_THRESHOLD =
  22;

/*
 * Production:
 * null = /api/puzzle/today
 */
const DEV_PUZZLE_NUMBER:
  number | null = null;

const STATE_KEY =
  "gyan-d1-puzzle-state-v9";


/*
 * ========================================================
 * HELPERS
 * ========================================================
 */

function localDateKey(): string {
  const now =
    new Date();

  return [
    now.getFullYear(),

    String(
      now.getMonth() + 1,
    ).padStart(
      2,
      "0",
    ),

    String(
      now.getDate(),
    ).padStart(
      2,
      "0",
    ),
  ].join("-");
}

function cloneBoard(
  board: Tile[],
): Tile[] {
  return board.map(
    (tile) => ({
      ...tile,
    }),
  );
}

function cloneMove(
  move: PuzzleMove,
): PuzzleMove {
  return {
    from: {
      ...move.from,
    },

    to: {
      ...move.to,
    },
  };
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

function positionOf(
  index: number,
  size: number,
): Position {
  return {
    row:
      Math.floor(
        index / size,
      ),

    column:
      index % size,
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

type SwapKind =
  | "normal"
  | "diagonal"
  | "edge"
  | null;

function swapKind(
  first: Position,
  second: Position,
  size: number,
): SwapKind {
  const rawRowDifference =
    Math.abs(
      first.row -
        second.row,
    );

  const rawColumnDifference =
    Math.abs(
      first.column -
        second.column,
    );

  /*
   * Spatial / toroidal distance.
   *
   * Opposite edges touch, including diagonally:
   *
   * 5×5 examples:
   * A2 <-> E3
   * A1 <-> E5
   */
  const rowDifference =
    Math.min(
      rawRowDifference,
      size -
        rawRowDifference,
    );

  const columnDifference =
    Math.min(
      rawColumnDifference,
      size -
        rawColumnDifference,
    );

  if (
    rowDifference === 0 &&
    columnDifference === 0
  ) {
    return null;
  }

  /*
   * Diagonal spatial neighbor,
   * including wrapped diagonals.
   */
  if (
    rowDifference === 1 &&
    columnDifference === 1
  ) {
    return "diagonal";
  }

  /*
   * Orthogonal spatial neighbor.
   *
   * Preserve "edge" classification for wrapped
   * horizontal / vertical moves so existing GQ
   * telemetry remains unchanged.
   */
  if (
    rowDifference +
      columnDifference ===
    1
  ) {
    const crossesVisibleEdge =
      rawRowDifference ===
        size - 1 ||
      rawColumnDifference ===
        size - 1;

    return crossesVisibleEdge
      ? "edge"
      : "normal";
  }

  return null;
}

function canSwap(
  first: Position,
  second: Position,
  size: number,
): boolean {
  return (
    swapKind(
      first,
      second,
      size,
    ) !== null
  );
}

function scrollGyanShellToTop():
  void {
  window.requestAnimationFrame(
    () => {
      window.requestAnimationFrame(
        () => {
          const shellBody =
            document.querySelector(
              ".gyan-shell__body",
            );

          if (
            shellBody instanceof
              HTMLElement
          ) {
            shellBody.scrollTop = 0;
          }
        },
      );
    },
  );
}


function validEmail(
  value: string,
): boolean {
  return (
    /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
      value
        .trim()
        .toLowerCase(),
    )
  );
}


function guestNameForResultId(
  resultId: string,
): string {
  let hash = 0;

  for (
    let index = 0;
    index <
      resultId.length;
    index += 1
  ) {
    hash =
      (
        hash * 31 +
        resultId.charCodeAt(
          index,
        )
      ) >>> 0;
  }

  const number =
    1000 +
    (
      hash %
      9000
    );

  return `Guest ${String(
    number,
  ).padStart(
    4,
    "0",
  )}`;
}


function sameMatchIdentity(
  first: Tile,
  second: Tile,
): boolean {
  /*
   * Preferred path:
   * opaque equality identity supplied
   * by the puzzle API.
   */
  if (
    first.matchCode &&
    second.matchCode
  ) {
    return (
      first.matchCode ===
      second.matchCode
    );
  }

  /*
   * Backward-compatible fallback.
   *
   * Never infer a hidden color when
   * matchCode is unavailable.
   */
  if (
    first.hidden ||
    second.hidden ||
    !first.color ||
    !second.color
  ) {
    return false;
  }

  return (
    first.color ===
    second.color
  );
}

function aiBotNumber(puzzleNumber: number): number {
  return ((puzzleNumber * 37 + 17) % 90) + 10;
}

const PUZZLE_BOT_NAMES = [
  "SummerMoon1234",
  "GoldenOwl4821",
  "RiverFalcon7318",
  "BluePanda6041",
  "SunnyRabbit3652",
  "ForestOtter6392",
  "PurpleFinch2751",
  "OceanDeer8146",
  "BrightBee4638",
  "GreenTiger5924",
  "CrystalSparrow7315",
  "MorningPanda2684",
  "EveningFox9051",
  "SkyDolphin3472",
  "SnowOwl6183",
  "SpringRabbit7529",
] as const;

function aiBotName(
  puzzleNumber: number,
): string {
  return PUZZLE_BOT_NAMES[
    puzzleNumber %
      PUZZLE_BOT_NAMES.length
  ];
}

function aiBotGq(puzzleNumber: number): number {
  const five =
    116 +
    (
      puzzleNumber *
        11 +
      5
    ) %
      16;

  const seven =
    118 +
    (
      puzzleNumber *
        13 +
      7
    ) %
      18;

  return Math.round(
    (
      five +
      seven
    ) /
      2,
  );
}


function buildShareText(
  puzzleNumber: number,
  stage: PuzzleStage,
  gq: number,
  icons: string[],
): string {
  const stageLabel =
    stage ===
      "5x5"
      ? "5×5 Qualifier"
      : "7×7 Final";

  const iconText =
    icons.length >
      0
      ? ` ${icons.join(" ")}`
      : "";

  return [
    `🏆 GYAN #${puzzleNumber} · ${stageLabel}`,
    `GQ ${gq}${iconText}`,
    "Can you beat my GQ?",
    "https://gyan.cc",
  ].join(
    "\n",
  );
}


async function sharePuzzleResult(
  puzzleNumber: number,
  stage: PuzzleStage,
  gq: number,
  icons: string[],
): Promise<
  "shared" | "copied" | "cancelled"
> {
  const text =
    buildShareText(
      puzzleNumber,
      stage,
      gq,
      icons,
    );

  if (
    typeof navigator.share ===
      "function"
  ) {
    try {
      /*
       * Native share sheets append the `url`
       * separately, so remove the URL from the
       * message text to avoid showing it twice.
       */
      const nativeShareText =
        text
          .split(
            "\n",
          )
          .filter(
            (
              line,
            ) =>
              line.trim() !==
              "https://gyan.cc",
          )
          .join(
            "\n",
          );

      await navigator.share({
        title:
          `GYAN Puzzle #${puzzleNumber}`,
        text:
          nativeShareText,
        url:
          "https://gyan.cc",
      });

      return "shared";
    } catch (
      error
    ) {
      if (
        error instanceof
          DOMException &&
        error.name ===
          "AbortError"
      ) {
        return "cancelled";
      }
    }
  }

  try {
    await navigator.clipboard.writeText(
      text,
    );

    return "copied";
  } catch {
    /*
     * Final fallback for older browsers.
     */
    const textarea =
      document.createElement(
        "textarea",
      );

    textarea.value =
      text;

    textarea.style.position =
      "fixed";

    textarea.style.opacity =
      "0";

    document.body.appendChild(
      textarea,
    );

    textarea.select();

    document.execCommand(
      "copy",
    );

    textarea.remove();

    return "copied";
  }
}



/*
 * ========================================================
 * MATCH DETECTION
 * ========================================================
 */

function findMatches(
  board: Tile[],
  size: number,
): MatchDetail[] {
  const matches:
    MatchDetail[] = [];

  function addRun(
    orientation:
      MatchOrientation,
    positions:
      Position[],
  ): void {
    let start = 0;

    while (
      start <
      positions.length
    ) {
      const firstPosition =
        positions[start];

      const firstTile =
        board[
          indexOf(
            firstPosition.row,
            firstPosition.column,
            size,
          )
        ];

      let end =
        start + 1;

      while (
        end <
        positions.length
      ) {
        const currentPosition =
          positions[end];

        const currentTile =
          board[
            indexOf(
              currentPosition.row,
              currentPosition.column,
              size,
            )
          ];

        if (
          !sameMatchIdentity(
            firstTile,
            currentTile,
          )
        ) {
          break;
        }

        end += 1;
      }

      if (
        end - start >= 3
      ) {
        const runPositions =
          positions.slice(
            start,
            end,
          );

        const tileIds =
          runPositions.map(
            (
              position,
            ) =>
              board[
                indexOf(
                  position.row,
                  position.column,
                  size,
                )
              ].id,
          );

        const firstRunPosition =
          runPositions[0];

        const lastRunPosition =
          runPositions[
            runPositions.length -
            1
          ];

        matches.push({
          signature:
            [
              orientation,
              firstRunPosition.row,
              firstRunPosition.column,
              lastRunPosition.row,
              lastRunPosition.column,
              firstTile.matchCode ??
                firstTile.color ??
                "?",
            ].join(":"),

          orientation,

          tileIds,
        });
      }

      start =
        end;
    }
  }


  /*
   * Horizontal.
   */
  for (
    let row = 0;
    row < size;
    row += 1
  ) {
    addRun(
      "horizontal",

      Array.from(
        {
          length:
            size,
        },
        (
          _,
          column,
        ) => ({
          row,
          column,
        }),
      ),
    );
  }


  /*
   * Vertical.
   */
  for (
    let column = 0;
    column < size;
    column += 1
  ) {
    addRun(
      "vertical",

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
          column,
        }),
      ),
    );
  }


  /*
   * Diagonal down-right: ↘
   *
   * Start at every cell on the top edge
   * and then every cell on the left edge.
   */
  for (
    let startColumn = 0;
    startColumn < size;
    startColumn += 1
  ) {
    const positions:
      Position[] = [];

    for (
      let row = 0,
        column =
          startColumn;
      row < size &&
      column < size;
      row += 1,
        column += 1
    ) {
      positions.push({
        row,
        column,
      });
    }

    if (
      positions.length >= 3
    ) {
      addRun(
        "diagonal-down",
        positions,
      );
    }
  }

  for (
    let startRow = 1;
    startRow < size;
    startRow += 1
  ) {
    const positions:
      Position[] = [];

    for (
      let row =
          startRow,
        column = 0;
      row < size &&
      column < size;
      row += 1,
        column += 1
    ) {
      positions.push({
        row,
        column,
      });
    }

    if (
      positions.length >= 3
    ) {
      addRun(
        "diagonal-down",
        positions,
      );
    }
  }


  /*
   * Diagonal up-right: ↗
   *
   * Start at every cell on the bottom edge
   * and then every remaining cell on the
   * left edge.
   */
  for (
    let startColumn = 0;
    startColumn < size;
    startColumn += 1
  ) {
    const positions:
      Position[] = [];

    for (
      let row =
          size - 1,
        column =
          startColumn;
      row >= 0 &&
      column < size;
      row -= 1,
        column += 1
    ) {
      positions.push({
        row,
        column,
      });
    }

    if (
      positions.length >= 3
    ) {
      addRun(
        "diagonal-up",
        positions,
      );
    }
  }

  for (
    let startRow =
          size - 2;
    startRow >= 0;
    startRow -= 1
  ) {
    const positions:
      Position[] = [];

    for (
      let row =
          startRow,
        column = 0;
      row >= 0 &&
      column < size;
      row -= 1,
        column += 1
    ) {
      positions.push({
        row,
        column,
      });
    }

    if (
      positions.length >= 3
    ) {
      addRun(
        "diagonal-up",
        positions,
      );
    }
  }

  return matches;
}


function findMatchSignatures(
  board: Tile[],
  size: number,
): Set<string> {
  return new Set(
    findMatches(
      board,
      size,
    ).map(
      (
        match,
      ) =>
        match.signature,
    ),
  );
}



const PUZZLE_MODE_CATALOG:
  PuzzleModeInfo[] = [
    { key: "EASY", label: "Easy", shortLabel: "Easy", probabilityBasisPoints: 5000, probabilityPercent: 50, gemReward: 1, wrappedOffset: 0, pattern: "line" },
    { key: "MEDIUM", label: "Medium", shortLabel: "Medium", probabilityBasisPoints: 2500, probabilityPercent: 25, gemReward: 2, wrappedOffset: 0, pattern: "line" },
    { key: "HARD", label: "Hard", shortLabel: "Hard", probabilityBasisPoints: 1300, probabilityPercent: 13, gemReward: 3, wrappedOffset: 0, pattern: "diagonal" },
    { key: "VERY_HARD_1", label: "Very Hard · Pattern 1", shortLabel: "Very Hard P1", probabilityBasisPoints: 600, probabilityPercent: 6, gemReward: 4, wrappedOffset: 1, pattern: "wrapped" },
    { key: "VERY_HARD_2", label: "Very Hard · Pattern 2", shortLabel: "Very Hard P2", probabilityBasisPoints: 300, probabilityPercent: 3, gemReward: 5, wrappedOffset: 2, pattern: "wrapped" },
    { key: "VERY_HARD_3", label: "Very Hard · Pattern 3", shortLabel: "Very Hard P3", probabilityBasisPoints: 200, probabilityPercent: 2, gemReward: 6, wrappedOffset: 3, pattern: "wrapped" },
    { key: "RARE", label: "Rare Spatial", shortLabel: "Rare", probabilityBasisPoints: 100, probabilityPercent: 1, gemReward: 8, wrappedOffset: 4, pattern: "wrapped" },
  ];


function patternPositions(
  size: number,
  mode: PuzzleModeInfo,
): Position[][] {
  if (
    mode.pattern ===
      "line"
  ) {
    return [
      ...Array.from(
        { length: size },
        (_, row) =>
          Array.from(
            { length: size },
            (_, column) => ({
              row,
              column,
            }),
          ),
      ),
      ...Array.from(
        { length: size },
        (_, column) =>
          Array.from(
            { length: size },
            (_, row) => ({
              row,
              column,
            }),
          ),
      ),
    ];
  }

  if (
    mode.pattern ===
      "diagonal"
  ) {
    return [
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
    ];
  }

  const offset =
    mode.wrappedOffset %
    size;

  return [
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
  ];
}



function solvedPatternTileIds(
  board: Tile[],
  size: number,
  mode: PuzzleModeInfo,
): Set<number> {
  const patterns =
    patternPositions(
      size,
      mode,
    );

  for (
    const positions of
    patterns
  ) {
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
      continue;
    }

    const matches =
      positions.every(
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
            sameMatchIdentity(
              first,
              tile,
            )
          );
        },
      );

    if (
      matches
    ) {
      return new Set(
        positions.map(
          (
            position,
          ) =>
            board[
              indexOf(
                position.row,
                position.column,
                size,
              )
            ].id,
        ),
      );
    }
  }

  return new Set();
}


function isPuzzleSolved(
  board: Tile[],
  size: number,
  mode: PuzzleModeInfo,
): boolean {
  return patternPositions(
    size,
    mode,
  ).some(
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
            sameMatchIdentity(
              first,
              tile,
            )
          );
        },
      );
    },
  );
}


function ModePatternPreview({
  mode,
}: {
  mode: PuzzleModeInfo;
}) {
  const size =
    5;

  const marked =
    new Set(
      patternPositions(
        size,
        mode,
      )[0].map(
        (
          position,
        ) =>
          `${position.row}:${position.column}`,
      ),
    );

  return (
    <div
      aria-label={`${mode.label} sample solution`}
      style={{
        display: "grid",
        gridTemplateColumns:
          `repeat(${size}, 12px)`,
        gap: "2px",
        justifyContent: "center",
        margin: "5px 0",
      }}
    >
      {Array.from(
        { length: size * size },
        (_, index) => {
          const row =
            Math.floor(
              index /
              size,
            );

          const column =
            index %
            size;

          const active =
            marked.has(
              `${row}:${column}`,
            );

          return (
            <span
              key={index}
              style={{
                width: "12px",
                height: "12px",
                borderRadius: "3px",
                border:
                  "1px solid #ccd6dc",
                background:
                  active
                    ? "#e97825"
                    : "#f4f7f8",
              }}
            />
          );
        },
      )}
    </div>
  );
}




function findCompletedWinningLine(
  board: Tile[],
  size: number,
): {
  orientation:
    | "horizontal"
    | "vertical"
    | "diagonal-down"
    | "diagonal-up";
  tileIds: number[];
} | null {
  const candidateLines: Array<{
    orientation:
      | "horizontal"
      | "vertical"
      | "diagonal-down"
      | "diagonal-up";
    positions: Position[];
  }> = [
    ...Array.from(
      { length: size },
      (_, row) => ({
        orientation:
          "horizontal" as const,
        positions:
          Array.from(
            { length: size },
            (_, column) => ({
              row,
              column,
            }),
          ),
      }),
    ),

    ...Array.from(
      { length: size },
      (_, column) => ({
        orientation:
          "vertical" as const,
        positions:
          Array.from(
            { length: size },
            (_, row) => ({
              row,
              column,
            }),
          ),
      }),
    ),

    {
      orientation:
        "diagonal-down",
      positions:
        Array.from(
          { length: size },
          (_, index) => ({
            row: index,
            column: index,
          }),
        ),
    },

    {
      orientation:
        "diagonal-up",
      positions:
        Array.from(
          { length: size },
          (_, index) => ({
            row:
              size - 1 - index,
            column:
              index,
          }),
        ),
    },
  ];

  for (
    const candidate of
    candidateLines
  ) {
    const firstPosition =
      candidate.positions[0];

    const first =
      board[
        indexOf(
          firstPosition.row,
          firstPosition.column,
          size,
        )
      ];

    if (
      !first ||
      first.hidden
    ) {
      continue;
    }

    const tileIds:
      number[] = [];

    let matches =
      true;

    for (
      const position of
      candidate.positions
    ) {
      const tile =
        board[
          indexOf(
            position.row,
            position.column,
            size,
          )
        ];

      if (
        !tile ||
        tile.hidden ||
        !sameMatchIdentity(
          first,
          tile,
        )
      ) {
        matches =
          false;

        break;
      }

      tileIds.push(
        tile.id,
      );
    }

    if (matches) {
      return {
        orientation:
          candidate.orientation,
        tileIds,
      };
    }
  }

  return null;
}

function isAcceptedPuzzleSolution(
  board: Tile[],
  size: number,
  mode: PuzzleModeInfo,
): boolean {
  /*
   * The assigned mode is the intended challenge,
   * not the only way a player is allowed to win.
   *
   * A fully-visible horizontal/vertical line is
   * always accepted as a valid simple solution.
   */
  return (
    isPuzzleSolved(
      board,
      size,
      mode,
    ) ||
    findCompletedWinningLine(
      board,
      size,
    ) !== null
  );
}


function hasHiddenWinningLine(
  board: Tile[],
  size: number,
): boolean {
  /*
   * Full horizontal line.
   */
  for (
    let row = 0;
    row < size;
    row += 1
  ) {
    const first =
      board[
        indexOf(
          row,
          0,
          size,
        )
      ];

    let allMatch =
      true;

    let hasHidden =
      first.hidden;

    for (
      let column = 1;
      column < size;
      column += 1
    ) {
      const current =
        board[
          indexOf(
            row,
            column,
            size,
          )
        ];

      if (
        !sameMatchIdentity(
          first,
          current,
        )
      ) {
        allMatch =
          false;

        break;
      }

      hasHidden =
        hasHidden ||
        current.hidden;
    }

    if (
      allMatch &&
      hasHidden
    ) {
      return true;
    }
  }

  /*
   * Full vertical line.
   */
  for (
    let column = 0;
    column < size;
    column += 1
  ) {
    const first =
      board[
        indexOf(
          0,
          column,
          size,
        )
      ];

    let allMatch =
      true;

    let hasHidden =
      first.hidden;

    for (
      let row = 1;
      row < size;
      row += 1
    ) {
      const current =
        board[
          indexOf(
            row,
            column,
            size,
          )
        ];

      if (
        !sameMatchIdentity(
          first,
          current,
        )
      ) {
        allMatch =
          false;

        break;
      }

      hasHidden =
        hasHidden ||
        current.hidden;
    }

    if (
      allMatch &&
      hasHidden
    ) {
      return true;
    }
  }

  return false;
}



/*
 * ========================================================
 * LOCAL STORAGE
 * ========================================================
 */

function loadSavedState():
  | SavedGameState
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
      ) as SavedGameState;

    if (
      saved.date !==
      localDateKey()
    ) {
      localStorage.removeItem(
        STATE_KEY,
      );

      return null;
    }

    return {
      ...saved,

      moveHistory:
        Array.isArray(
          saved.moveHistory,
        )
          ? saved.moveHistory
          : [],

      pendingRevealCount:
        Number.isInteger(
          saved.pendingRevealCount,
        )
          ? saved.pendingRevealCount
          : 0,

      skillStats:
        saved.skillStats
          ? {
              ...emptySkillStats(),
              ...saved.skillStats,
            }
          : emptySkillStats(),

      rewardedMatchSignatures:
        Array.isArray(
          saved.rewardedMatchSignatures,
        )
          ? saved.rewardedMatchSignatures
          : [],

      finalResultId:
        typeof saved.finalResultId ===
          "string"
          ? saved.finalResultId
          : null,

      solveStartedAt:
        typeof saved.solveStartedAt ===
          "number"
          ? saved.solveStartedAt
          : null,

      activeSolveMs:
        typeof saved.activeSolveMs ===
          "number"
          ? saved.activeSolveMs
          : 0,
    };
  } catch {
    return null;
  }
}


/*
 * ========================================================
 * API
 * ========================================================
 */

async function fetchPuzzle(
  stage: PuzzleStage,
): Promise<PublicPuzzle> {
  const path =
    DEV_PUZZLE_NUMBER !==
    null
      ? `/api/puzzle/${DEV_PUZZLE_NUMBER}/${stage}`
      : `/api/puzzle/today?stage=${stage}`;

  const response =
    await fetch(
      path,
    );

  if (!response.ok) {
    throw new Error(
      "Puzzle unavailable.",
    );
  }

  const data =
    (await response.json()) as
      PuzzleResponse;

  return data.puzzle;
}

async function fetchLeaderboard(
  puzzleNumber: number,
  resultId:
    string | null,
): Promise<
  LeaderboardResponse | null
> {
  try {
    const params =
      new URLSearchParams();

    if (resultId) {
      params.set(
        "resultId",
        resultId,
      );
    }

    const suffix =
      params.size > 0
        ? `?${params.toString()}`
        : "";

    const response =
      await fetch(
        `/api/puzzle/${puzzleNumber}/leaderboard${suffix}`,
      );

    if (!response.ok) {
      return null;
    }

    return (
      await response.json()
    ) as
      LeaderboardResponse;
  } catch {
    return null;
  }
}



/*
 * ========================================================
 * COMPONENT
 * ========================================================
 */

export default function Puzzle({
  onClose,
  onOpenEducation,
}: PuzzleProps) {
  /*
   * Live Puzzle is deliberately isolated from the
   * Daily Puzzle. Future Live gameplay changes belong
   * in LivePuzzle.tsx, not in this component.
   */
  const [
    livePuzzleOpen,
    setLivePuzzleOpen,
  ] = useState(false);

  const [
    visible,
    setVisible,
  ] =
    useState(true);

  const [
    loading,
    setLoading,
  ] =
    useState(true);

  const [
    puzzle,
    setPuzzle,
  ] =
    useState<
      PublicPuzzle | null
    >(null);

  const [
    stage,
    setStage,
  ] =
    useState<PuzzleStage>(
      "5x5",
    );

  const [
    board,
    setBoard,
  ] =
    useState<Tile[]>(
      [],
    );

  const [
    initialBoard,
    setInitialBoard,
  ] =
    useState<Tile[]>(
      [],
    );

  const [
    moves,
    setMoves,
  ] =
    useState(0);

  const [
    moveHistory,
    setMoveHistory,
  ] =
    useState<
      PuzzleMove[]
    >([]);

  const [
    chancesRemaining,
    setChancesRemaining,
  ] =
    useState(
      MAX_CHANCES,
    );

  const [
    attemptFinished,
    setAttemptFinished,
  ] =
    useState(false);

  const [
    qualified,
    setQualified,
  ] =
    useState(false);

  const [
    medalWon,
    setMedalWon,
  ] =
    useState(false);

  const [
    selected,
    setSelected,
  ] =
    useState<
      Position | null
    >(null);

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
    message,
    setMessage,
  ] =
    useState(
      "Loading puzzle…",
    );

  const [
    sharingResult,
    setSharingResult,
  ] =
    useState(false);


  const [
    justRevealedTileIds,
    setJustRevealedTileIds,
  ] =
    useState<
      number[]
    >([]);


  /*
   * ------------------------------------------------
   * Reveal mode / future GQ telemetry
   * ------------------------------------------------
   */

  const [
    pendingRevealCount,
    setPendingRevealCount,
  ] =
    useState(0);

  const [
    skillStats,
    setSkillStats,
  ] =
    useState<
      PuzzleSkillStats
    >(
      emptySkillStats,
    );

  const [
    rewardedMatchSignatures,
    setRewardedMatchSignatures,
  ] =
    useState<
      string[]
    >([]);


  /*
   * ------------------------------------------------
   * Certificate
   * ------------------------------------------------
   */

  const [
    certificateBoard,
    setCertificateBoard,
  ] =
    useState<Tile[]>(
      [],
    );

  const [
    certificateQr,
    setCertificateQr,
  ] =
    useState("");

  const [
    certificateOpen,
    setCertificateOpen,
  ] =
    useState(false);

  const [
    certificateEmail,
    setCertificateEmail,
  ] =
    useState("");

  const [
    certificateSending,
    setCertificateSending,
  ] =
    useState(false);

  const [
    certificateSent,
    setCertificateSent,
  ] =
    useState(false);

  const [
    qualifierClaimed,
    setQualifierClaimed,
  ] =
    useState(false);

  const [
    certificateError,
    setCertificateError,
  ] =
    useState<
      string | null
    >(null);

  const [
    educationComingSoon,
    setEducationComingSoon,
  ] =
    useState("");


  /*
   * ------------------------------------------------
   * Medal
   * ------------------------------------------------
   */

  const [
    winnerName,
    setWinnerName,
  ] =
    useState("");

  const [
    winnerEmail,
    setWinnerEmail,
  ] =
    useState("");

  const [
    claimingMedal,
    setClaimingMedal,
  ] =
    useState(false);

  const [
    medalClaimed,
    setMedalClaimed,
  ] =
    useState(false);

  const [
    medalClaimName,
    setMedalClaimName,
  ] =
    useState("");

  const [
    medalError,
    setMedalError,
  ] =
    useState<
      string | null
    >(null);


  useEffect(
    () => {
      const controller =
        new AbortController();

      void fetch(
        "/api/gyan-identity",
        {
          method:
            "POST",

          credentials:
            "include",

          headers: {
            "content-type":
              "application/json",
          },

          body:
            "{}",

          signal:
            controller.signal,
        },
      )
        .then(
          async (
            response,
          ) => {
            if (
              !response.ok
            ) {
              return null;
            }

            return await response.json() as
              PuzzleGyanIdentityResponse;
          },
        )
        .then(
          (
            body,
          ) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            const displayName =
              body?.identity
                ?.displayName
                ?.trim() ??
              "";

            if (
              displayName
            ) {
              setWinnerName(
                (
                  current,
                ) =>
                  current.trim()
                    ? current
                    : displayName,
              );
            }
          },
        )
        .catch(
          () => {
            // Keep the form usable even if identity lookup fails.
          },
        );

      return () => {
        controller.abort();
      };
    },
    [],
  );


  /*
   * ------------------------------------------------
   * Winners
   * ------------------------------------------------
   */

  const [
    winnersOpen,
    setWinnersOpen,
  ] =
    useState(false);

  const [
    puzzleModesOpen,
    setPuzzleModesOpen,
  ] =
    useState(false);

  const [
    recentPuzzles,
    setRecentPuzzles,
  ] =
    useState<
      RecentPuzzleSummary[]
    >([]);

  const [
    recentPuzzleIndex,
    setRecentPuzzleIndex,
  ] =
    useState(0);

  const [
    historyLoading,
    setHistoryLoading,
  ] =
    useState(false);

  const [
    historicalSolution,
    setHistoricalSolution,
  ] =
    useState<
      HistoricalPuzzleSolution |
      null
    >(null);

  const [
    historicalSolutionLoading,
    setHistoricalSolutionLoading,
  ] =
    useState(false);

  const [
    winnersLoading,
    setWinnersLoading,
  ] =
    useState(false);

  const [
    leaderboard,
    setLeaderboard,
  ] =
    useState<
      LeaderboardResponse | null
    >(null);

  const [
    challengeLeaderboard,
    setChallengeLeaderboard,
  ] =
    useState<
      LeaderboardResponse | null
    >(null);

  const [
    finalResultId,
    setFinalResultId,
  ] =
    useState<
      string | null
    >(null);

  const [
    solveStartedAt,
    setSolveStartedAt,
  ] =
    useState<
      number | null
    >(null);

  const [
    activeSolveMs,
    setActiveSolveMs,
  ] =
    useState(0);

  const [
    displaySolveMs,
    setDisplaySolveMs,
  ] =
    useState(0);

  const [
    resultSaving,
    setResultSaving,
  ] =
    useState(false);

  const [
    assignedGuestName,
    setAssignedGuestName,
  ] =
    useState("");


  /*
   * ------------------------------------------------
   * Swipe
   * ------------------------------------------------
   */

  const touchStart =
    useRef<{
      row: number;
      column: number;
      x: number;
      y: number;
    } | null>(null);

  /*
   * Keep today's competitive state isolated while
   * previous puzzles run in Practice Mode.
   */
  const todayPracticeReturnRef =
    useRef<SavedGameState | null>(
      null,
    );


  const certificateOverlayRef =
    useRef<
      HTMLDivElement | null
    >(null);


  const revealAnimationTimeout =
    useRef<
      number | null
    >(null);


  /*
   * ========================================================
   * RECENT PUZZLE HISTORY
   * ========================================================
   */

  async function loadRecentPuzzleHistory(
    historyStage: PuzzleStage,
    currentPuzzleNumber?: number,
  ) {
    setHistoryLoading(
      true,
    );

    try {
      const recent =
        await fetchRecentPuzzles(
          historyStage,
          10,
        );

      setRecentPuzzles(
        recent,
      );

      const index =
        currentPuzzleNumber
          ? recent.findIndex(
              (
                item,
              ) =>
                item.puzzleNumber ===
                currentPuzzleNumber,
            )
          : 0;

      setRecentPuzzleIndex(
        index >= 0
          ? index
          : 0,
      );
    } catch {
      // Keep daily puzzle usable if history fails.
    } finally {
      setHistoryLoading(
        false,
      );
    }
  }


  /*
   * ========================================================
   * LOAD
   * ========================================================
   */

  useEffect(() => {
    let cancelled =
      false;

    async function load() {
      try {
        const launch =
          readPuzzleLaunchRequest();

        const requestedStage:
          PuzzleStage =
            launch?.stage ??
            "5x5";

        let loaded:
          PublicPuzzle;

        let requestedIndex =
          0;

        if (
          launch &&
          !launch.current
        ) {
          const response =
            await fetch(
              `/api/puzzle/practice/${launch.puzzleNumber}?stage=${requestedStage}`,
              {
                cache:
                  "no-store",
              },
            );

          const body =
            await response.json() as {
              puzzle?:
                PublicPuzzle;
              error?:
                string;
            };

          if (
            !response.ok ||
            !body.puzzle
          ) {
            throw new Error(
              body.error ??
                "Practice puzzle unavailable.",
            );
          }

          loaded =
            body.puzzle;
        } else {
          loaded =
            await fetchPuzzle(
              requestedStage,
            );
        }

        if (cancelled) {
          return;
        }

        const recent =
          await fetchRecentPuzzles(
            requestedStage,
            10,
          );

        if (cancelled) {
          return;
        }

        setRecentPuzzles(
          recent,
        );

        requestedIndex =
          recent.findIndex(
            (
              item,
            ) =>
              item.puzzleNumber ===
                loaded.puzzleNumber &&
              item.stage ===
                loaded.stage,
          );

        if (
          requestedIndex <
            0
        ) {
          requestedIndex =
            0;
        }

        setRecentPuzzleIndex(
          requestedIndex,
        );

        const saved =
          loadSavedState();

        setPuzzle(
          loaded,
        );

        setStage(
          loaded.stage,
        );

        const challenge =
          await fetchLeaderboard(
            loaded.puzzleNumber,
            null,
          );

        if (!cancelled) {
          setChallengeLeaderboard(
            challenge,
          );
        }

        setInitialBoard(
          cloneBoard(
            loaded.board,
          ),
        );

        const canRestoreSaved =
          requestedIndex ===
            0 &&
          saved &&
          saved.puzzleNumber ===
            loaded.puzzleNumber &&
          saved.stage ===
            loaded.stage;

        if (
          canRestoreSaved &&
          saved
        ) {
          setBoard(
            cloneBoard(
              saved.board,
            ),
          );

          setMoves(
            saved.moves,
          );

          setMoveHistory(
            saved.moveHistory.map(
              cloneMove,
            ),
          );

          setChancesRemaining(
            saved.chancesRemaining,
          );

          setAttemptFinished(
            saved.attemptFinished,
          );

          setQualified(
            saved.qualified,
          );

          setMedalWon(
            saved.medalWon,
          );

          setPendingRevealCount(
            saved.pendingRevealCount,
          );

          setSkillStats({
            ...emptySkillStats(),
            ...saved.skillStats,
          });

          setRewardedMatchSignatures(
            saved.rewardedMatchSignatures,
          );

          setFinalResultId(
            saved.finalResultId,
          );

          setSolveStartedAt(
            saved.solveStartedAt,
          );

          setActiveSolveMs(
            saved.activeSolveMs,
          );

          setDisplaySolveMs(
            saved.activeSolveMs,
          );

          const savedSolved =
            loaded.stage ===
              "5x5"
              ? saved.qualified
              : saved.medalWon;

          if (savedSolved) {
            setCertificateBoard(
              cloneBoard(
                saved.board,
              ),
            );

            setCertificateOpen(
              true,
            );
          }
        } else {
          setBoard(
            cloneBoard(
              loaded.board,
            ),
          );

          setMoves(0);
          setMoveHistory([]);
          setChancesRemaining(
            MAX_CHANCES,
          );
          setAttemptFinished(
            false,
          );
          setQualified(
            false,
          );
          setMedalWon(
            false,
          );
          setPendingRevealCount(
            0,
          );
          setSkillStats(
            emptySkillStats(),
          );
          setRewardedMatchSignatures(
            [],
          );
          setFinalResultId(
            null,
          );
          setAssignedGuestName(
            "",
          );
          setSolveStartedAt(
            null,
          );
          setActiveSolveMs(
            0,
          );
          setDisplaySolveMs(
            0,
          );
          setCertificateOpen(
            false,
          );
          setCertificateBoard(
            [],
          );
        }

        if (
          requestedIndex >
            0
        ) {
          void loadHistoricalSolution(
            loaded.puzzleNumber,
            loaded.stage,
          );

          setMessage("");
        } else {
          setHistoricalSolution(
            null,
          );

          setMessage(
            "Swipe or tap two squares to swap. Diagonal and opposite-edge swaps valid.",
          );
        }
      } catch (
        error
      ) {
        setMessage(
          error instanceof
            Error
            ? error.message
            : "Puzzle unavailable.",
        );
      } finally {
        if (!cancelled) {
          setLoading(
            false,
          );
        }
      }
    }

    void load();

    return () => {
      cancelled =
        true;
    };
  }, []);


  /*
   * ========================================================
   * REVEAL ANIMATION CLEANUP
   * ========================================================
   */

  useEffect(
    () => {
      return () => {
        if (
          revealAnimationTimeout
            .current !==
          null
        ) {
          window.clearTimeout(
            revealAnimationTimeout
              .current,
          );
        }
      };
    },
    [],
  );


  useEffect(() => {
    if (
      recentPuzzleIndex >
        0 ||
      !puzzle ||
      attemptFinished ||
      medalWon ||
      solveStartedAt ===
        null
    ) {
      return;
    }

    const updateDisplayTimer =
      () => {
        setDisplaySolveMs(
          elapsedSince(
            solveStartedAt,
            new Date().getTime(),
          ),
        );
      };

    updateDisplayTimer();

    const intervalId =
      window.setInterval(
        updateDisplayTimer,
        1000,
      );

    return () => {
      window.clearInterval(
        intervalId,
      );
    };
  }, [
    puzzle,
    attemptFinished,
    medalWon,
    solveStartedAt,
    recentPuzzleIndex,
  ]);


  /*
   * ========================================================
   * SAVE
   * ========================================================
   */

  useEffect(() => {
    if (
      !puzzle ||
      recentPuzzleIndex >
        0
    ) {
      return;
    }

    const saved:
      SavedGameState = {
      date:
        localDateKey(),

      puzzleNumber:
        puzzle.puzzleNumber,

      stage,

      board,

      moves,

      moveHistory,

      chancesRemaining,

      attemptFinished,

      qualified,

      medalWon,

      pendingRevealCount,

      skillStats,

      rewardedMatchSignatures,

      finalResultId,

      solveStartedAt,

      activeSolveMs,
    };

    localStorage.setItem(
      STATE_KEY,
      JSON.stringify(
        saved,
      ),
    );
  }, [
    puzzle,
    stage,
    board,
    moves,
    moveHistory,
    chancesRemaining,
    attemptFinished,
    qualified,
    medalWon,
    pendingRevealCount,
    skillStats,
    rewardedMatchSignatures,
    finalResultId,
    solveStartedAt,
    activeSolveMs,
    recentPuzzleIndex,
  ]);


  /*
   * ========================================================
   * CERTIFICATE POSITION
   * ========================================================
   */

  useEffect(() => {
    if (
      !certificateOpen
    ) {
      return;
    }

    scrollGyanShellToTop();

    window.requestAnimationFrame(
      () => {
        if (
          certificateOverlayRef
            .current
        ) {
          certificateOverlayRef
            .current
            .scrollTop = 0;
        }
      },
    );
  }, [
    certificateOpen,
  ]);


  /*
   * ========================================================
   * CERTIFICATE QR
   * ========================================================
   */

  useEffect(() => {
    if (
      !qualified ||
      !puzzle
    ) {
      return;
    }

    let cancelled =
      false;

    async function createQr() {
      try {
        const dataUrl =
          await QRCode.toDataURL(
            "https://gyan.cc",
            {
              width: 96,
              margin: 1,

              errorCorrectionLevel:
                "M",
            },
          );

        if (!cancelled) {
          setCertificateQr(
            dataUrl,
          );
        }
      } catch {
        // Certificate still works.
      }
    }

    void createQr();

    return () => {
      cancelled =
        true;
    };
  }, [
    qualified,
    puzzle,
  ]);


  /*
   * ========================================================
   * WINNERS
   * ========================================================
   */



  async function loadHistoricalSolution(
    puzzleNumber: number,
    practiceStage: PuzzleStage,
  ) {
    setHistoricalSolution(
      null,
    );

    setHistoricalSolutionLoading(
      true,
    );

    try {
      const response =
        await fetch(
          `/api/puzzle/solution/${puzzleNumber}?stage=${practiceStage}`,
          {
            cache:
              "no-store",
          },
        );

      const body =
        (await response.json()) as
          HistoricalPuzzleSolution & {
            error?:
              string;
          };

      if (
        !response.ok
      ) {
        throw new Error(
          body.error ??
          "Solution is not available.",
        );
      }

      setHistoricalSolution(
        body,
      );
    } catch {
      setHistoricalSolution(
        null,
      );
    } finally {
      setHistoricalSolutionLoading(
        false,
      );
    }
  }


  async function openHistoricalPuzzleAt(
    index: number,
  ) {
    if (
      index < 0 ||
      index >=
        recentPuzzles.length
    ) {
      return;
    }

    if (
      recentPuzzleIndex ===
        0 &&
      index >
        0 &&
      puzzle
    ) {
      todayPracticeReturnRef.current = {
        date:
          localDateKey(),

        puzzleNumber:
          puzzle.puzzleNumber,

        stage,

        board:
          cloneBoard(
            board,
          ),

        moves,

        moveHistory:
          moveHistory.map(
            cloneMove,
          ),

        chancesRemaining,

        attemptFinished,

        qualified,

        medalWon,

        pendingRevealCount,

        skillStats: {
          ...skillStats,
        },

        rewardedMatchSignatures: [
          ...rewardedMatchSignatures,
        ],

        finalResultId,

        solveStartedAt,

        activeSolveMs,
      };
    }

    const summary =
      recentPuzzles[
        index
      ];

    const practiceStage =
      summary.stage;

    setHistoryLoading(
      true,
    );

    try {
      const response =
        await fetch(
          `/api/puzzle/practice/${summary.puzzleNumber}?stage=${practiceStage}`,
          {
            cache:
              "no-store",
          },
        );

      const body =
        (await response.json()) as {
          puzzle?: PublicPuzzle;
          error?: string;
        };

      if (
        !response.ok ||
        !body.puzzle
      ) {
        throw new Error(
          body.error ??
          "Unable to open puzzle.",
        );
      }

      const loaded =
        body.puzzle;

      setPuzzle(
        loaded,
      );

      setStage(
        loaded.stage,
      );

      setInitialBoard(
        cloneBoard(
          loaded.board,
        ),
      );

      const returnState =
        index === 0
          ? todayPracticeReturnRef.current
          : null;

      if (
        returnState &&
        returnState.puzzleNumber ===
          loaded.puzzleNumber &&
        returnState.stage ===
          loaded.stage
      ) {
        setStage(
          returnState.stage,
        );

        setBoard(
          cloneBoard(
            returnState.board,
          ),
        );

        setMoves(
          returnState.moves,
        );

        setMoveHistory(
          returnState.moveHistory.map(
            cloneMove,
          ),
        );

        setChancesRemaining(
          returnState.chancesRemaining,
        );

        setAttemptFinished(
          returnState.attemptFinished,
        );

        setQualified(
          returnState.qualified,
        );

        setMedalWon(
          returnState.medalWon,
        );

        setPendingRevealCount(
          returnState.pendingRevealCount,
        );

        setSkillStats({
          ...emptySkillStats(),
          ...returnState.skillStats,
        });

        setRewardedMatchSignatures([
          ...returnState.rewardedMatchSignatures,
        ]);

        setFinalResultId(
          returnState.finalResultId,
        );

        setSolveStartedAt(
          returnState.solveStartedAt,
        );

        setActiveSolveMs(
          returnState.activeSolveMs,
        );

        setDisplaySolveMs(
          returnState.activeSolveMs,
        );
      } else {
        setBoard(
          cloneBoard(
            loaded.board,
          ),
        );

        setMoves(0);
        setMoveHistory([]);
        setChancesRemaining(
          MAX_CHANCES,
        );
        setAttemptFinished(false);
        setQualified(false);
        setMedalWon(false);
        setPendingRevealCount(0);
        setSkillStats(
          emptySkillStats(),
        );
        setRewardedMatchSignatures([]);
        setFinalResultId(null);
        setSolveStartedAt(null);
        setActiveSolveMs(0);
        setDisplaySolveMs(0);
      }

      setSelected(null);
      setLastSwap(null);
      setQualifierClaimed(false);
      setCertificateOpen(false);
      setCertificateSent(false);
      setCertificateError(null);

      setRecentPuzzleIndex(
        index,
      );

      if (
        index === 0
      ) {
        setHistoricalSolution(
          null,
        );
      } else {
        void loadHistoricalSolution(
          loaded.puzzleNumber,
          loaded.stage,
        );
      }

      setMessage(
        index === 0
          ? "Today's puzzle"
          : "",
      );

      if (
        index === 0
      ) {
        const challenge =
          await fetchLeaderboard(
            loaded.puzzleNumber,
            returnState?.finalResultId ??
              null,
          );

        setChallengeLeaderboard(
          challenge,
        );

        setLeaderboard(
          challenge,
        );
      }
    } catch (
      error
    ) {
      setMessage(
        error instanceof Error
          ? error.message
          : "Unable to open puzzle.",
      );
    } finally {
      setHistoryLoading(
        false,
      );
    }
  }


  async function openWinners() {
    if (!puzzle) {
      return;
    }

    setWinnersLoading(
      true,
    );

    const nextLeaderboard =
      await fetchLeaderboard(
        puzzle.puzzleNumber,
        finalResultId,
      );

    setLeaderboard(
      nextLeaderboard,
    );
    setChallengeLeaderboard(
      nextLeaderboard,
    );

    setWinnersLoading(
      false,
    );

    setWinnersOpen(
      true,
    );
  }


  /*
   * ========================================================
   * SERVER MYSTERY REVEAL
   * ========================================================
   */

  async function revealTiles(
    currentBoard:
      Tile[],
    tileIds:
      number[],
  ): Promise<
    RevealResult
  > {
    if (
      !puzzle ||
      tileIds.length ===
        0
    ) {
      return {
        board:
          currentBoard,

        count: 0,

        revealedTileIds:
          [],
      };
    }

    const uniqueTileIds =
      Array.from(
        new Set(
          tileIds,
        ),
      );

    const response =
      await fetch(
        "/api/puzzle/reveal",
        {
          method:
            "POST",

          headers: {
            "content-type":
              "application/json",
          },

          body:
            JSON.stringify({
              puzzleNumber:
                puzzle.puzzleNumber,

              stage,

              tileIds:
                uniqueTileIds,

              board:
                currentBoard.map(
                  (tile) => ({
                    id:
                      tile.id,

                    hidden:
                      tile.hidden,

                    color:
                      tile.hidden
                        ? undefined
                        : tile.color,
                  }),
                ),
            }),
        },
      );

    if (!response.ok) {
      return {
        board:
          currentBoard,

        count: 0,

        revealedTileIds:
          [],
      };
    }

    const data =
      (await response.json()) as
        RevealResponse;

    if (
      data.revealed.length ===
      0
    ) {
      return {
        board:
          currentBoard,

        count: 0,

        revealedTileIds:
          [],
      };
    }

    const revealMap =
      new Map(
        data.revealed.map(
          (tile) => [
            tile.id,
            tile.color,
          ],
        ),
      );

    return {
      board:
        currentBoard.map(
          (tile) => {
            const color =
              revealMap.get(
                tile.id,
              );

            if (!color) {
              return tile;
            }

            /*
             * Preserve matchCode.
             */
            return {
              ...tile,

              hidden:
                false,

              color,
            };
          },
        ),

      count:
        data.revealed.length,

      revealedTileIds:
        data.revealed.map(
          (tile) =>
            tile.id,
        ),
    };
  }


  async function chooseMysteryReveal(
    tileId: number,
  ): Promise<void> {
    if (
      pendingRevealCount <=
        0 ||
      attemptFinished ||
      medalWon
    ) {
      return;
    }

    const chosen =
      board.find(
        (
          tile,
        ) =>
          tile.id ===
          tileId,
      );

    if (
      !chosen ||
      !chosen.hidden
    ) {
      setMessage(
        "Choose a mystery square to reveal.",
      );

      return;
    }

    const result =
      await revealTiles(
        board,
        [
          tileId,
        ],
      );

    if (
      result.count ===
      0
    ) {
      setMessage(
        "Unable to reveal that mystery. Please try again.",
      );

      return;
    }

    setBoard(
      result.board,
    );

    animateRevealedTiles(
      result.revealedTileIds,
    );

    setPendingRevealCount(
      (
        current,
      ) =>
        Math.max(
          0,
          current - 1,
        ),
    );

    setSkillStats(
      (
        current,
      ) => ({
        ...current,

        strategicReveals:
          current.strategicReveals +
          1,
      }),
    );

    setSelected(
      null,
    );

    const remainingPending =
      Math.max(
        0,
        pendingRevealCount - 1,
      );

    if (
      recentPuzzleIndex ===
        0 &&
      remainingPending ===
        0 &&
      puzzle &&
      moves >=
        puzzle.maxMoves
    ) {
      setMessage(
        "✨ Mystery revealed.",
      );

      /*
       * The reveal was earned by the final move,
       * so let the player receive it before the
       * attempt closes.
       */
      window.setTimeout(
        () => {
          finishAttempt();
        },
        250,
      );

      return;
    }

    setMessage(
      remainingPending > 0
        ? "✨ Mystery revealed! Choose another mystery."
        : "✨ Mystery revealed! Continue solving.",
    );
  }



  function animateRevealedTiles(
    tileIds:
      number[],
  ): void {
    if (
      tileIds.length ===
      0
    ) {
      return;
    }

    if (
      revealAnimationTimeout
        .current !==
      null
    ) {
      window.clearTimeout(
        revealAnimationTimeout
          .current,
      );
    }

    /*
     * Clear first so the same tile can animate again
     * after another server reveal in a later move.
     */
    setJustRevealedTileIds(
      [],
    );

    window.requestAnimationFrame(
      () => {
        window.requestAnimationFrame(
          () => {
            setJustRevealedTileIds(
              tileIds,
            );

            revealAnimationTimeout
              .current =
                window.setTimeout(
                  () => {
                    setJustRevealedTileIds(
                      [],
                    );

                    revealAnimationTimeout
                      .current =
                        null;
                  },
                  950,
                );
          },
        );
      },
    );
  }


  /*
   * ========================================================
   * ATTEMPTS
   * ========================================================
   */

  function finishAttempt() {
    if (
      stage ===
      "5x5"
    ) {
      setChancesRemaining(
        (current) =>
          Math.max(
            0,
            current - 1,
          ),
      );
    }

    setAttemptFinished(
      true,
    );

    setSelected(
      null,
    );
  }

  function startNextAttempt() {
    if (
      stage !== "5x5" ||
      qualified ||
      chancesRemaining <=
        0
    ) {
      return;
    }

    setBoard(
      cloneBoard(
        initialBoard,
      ),
    );

    setMoves(
      0,
    );

    setMoveHistory(
      [],
    );

    setAttemptFinished(
      false,
    );

    setSelected(
      null,
    );

    setLastSwap(
      null,
    );

    setJustRevealedTileIds(
      [],
    );

    setPendingRevealCount(
      0,
    );

    setSkillStats(
      emptySkillStats(),
    );

    setRewardedMatchSignatures(
      [],
    );

    setSolveStartedAt(
      null,
    );

    setActiveSolveMs(
      0,
    );

    setDisplaySolveMs(
      0,
    );

    setCertificateBoard(
      [],
    );

    setCertificateOpen(
      false,
    );

    setCertificateEmail(
      "",
    );

    setCertificateSent(
      false,
    );

    setCertificateError(
      null,
    );

    setEducationComingSoon(
      "",
    );

    setMessage(
      "Try again — you know more now!",
    );
  }


  /*
   * ========================================================
   * START 7×7
   * ========================================================
   */

  async function startFinal() {
    if (!qualified) {
      return;
    }

    try {
      setLoading(
        true,
      );

      const loaded =
        await fetchPuzzle(
          "7x7",
        );

      setPuzzle(
        loaded,
      );

      setStage(
        "7x7",
      );

      void loadRecentPuzzleHistory(
        "7x7",
        loaded.puzzleNumber,
      );

      setBoard(
        cloneBoard(
          loaded.board,
        ),
      );

      setInitialBoard(
        cloneBoard(
          loaded.board,
        ),
      );

      setMoves(
        0,
      );

      setMoveHistory(
        [],
      );

      setChancesRemaining(
        1,
      );

      setAttemptFinished(
        false,
      );

      setSelected(
        null,
      );

      setLastSwap(
        null,
      );

      setJustRevealedTileIds(
        [],
      );

      setPendingRevealCount(
        0,
      );

      setSkillStats(
        emptySkillStats(),
      );

      setRewardedMatchSignatures(
        [],
      );

      /*
       * Keep finalResultId from the 5×5 qualifier.
       * The same id links both stage scores into one
       * combined leaderboard entry.
       */

      setLeaderboard(
        null,
      );

      const finalChallenge =
        await fetchLeaderboard(
            loaded.puzzleNumber,
            finalResultId,
          );

      setChallengeLeaderboard(
        finalChallenge,
      );

      setSolveStartedAt(
        null,
      );

      setActiveSolveMs(
        0,
      );

      setDisplaySolveMs(
        0,
      );

      setMedalWon(
        false,
      );

      setMedalClaimed(
        false,
      );

      /*
       * Keep the 5×5 name and carry its email
       * into the Final claim row.
       */
      setWinnerEmail(
        certificateEmail,
      );

      setMedalError(
        null,
      );

      setCertificateOpen(
        false,
      );

      setEducationComingSoon(
        "",
      );

      setMessage(
        "🏆 Match all 7 to win today's medal.",
      );

      scrollGyanShellToTop();
    } catch {
      setMessage(
        "Unable to load the Final.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  /*
   * ========================================================
   * SWAP
   * ========================================================
   */

  async function performSwap(
    first: Position,
    second: Position,
  ) {
    const actionNow =
      new Date().getTime();

    if (
      !puzzle ||
      (
        recentPuzzleIndex ===
          0 &&
        attemptFinished
      ) ||
      medalWon ||
      pendingRevealCount >
        0 ||
      (
        recentPuzzleIndex ===
          0 &&
        moves >=
          puzzle.maxMoves
      )
    ) {
      return;
    }

    const performedSwapKind =
      swapKind(
        first,
        second,
        puzzle.size,
      );

    if (
      !performedSwapKind
    ) {
      return;
    }

    const effectiveSolveStartedAt =
      solveStartedAt ??
      actionNow;

    if (
      recentPuzzleIndex ===
        0 &&
      solveStartedAt ===
        null
    ) {
      setSolveStartedAt(
        actionNow,
      );

      setDisplaySolveMs(
        0,
      );
    }

    const matchesBefore =
      findMatchSignatures(
        board,
        puzzle.size,
      );

    const firstIndex =
      indexOf(
        first.row,
        first.column,
        puzzle.size,
      );

    const secondIndex =
      indexOf(
        second.row,
        second.column,
        puzzle.size,
      );

    let nextBoard =
      cloneBoard(
        board,
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

    const performedMove:
      PuzzleMove = {
      from: {
        ...first,
      },

      to: {
        ...second,
      },
    };

    const nextMoveHistory =
      [
        ...moveHistory.map(
          cloneMove,
        ),

        performedMove,
      ];

    setLastSwap([
      first,
      second,
    ]);

    const matchDetailsAfter =
      findMatches(
        nextBoard,
        puzzle.size,
      );

    const newMatches =
      matchDetailsAfter.filter(
        (
          match,
        ) =>
          !matchesBefore.has(
            match.signature,
          ),
      );

    const createdNewMatch =
      newMatches.length >
      0;

    /*
     * Capture Mystery Finish before any hidden
     * matching tile is automatically uncovered.
     *
     * Future GQ:
     * ❓ Mystery Finish = +5.
     */
    const mysteryFinish =
      hasHiddenWinningLine(
        nextBoard,
        puzzle.size,
      );

    const hiddenMatchedTileIds =
      Array.from(
        new Set(
          newMatches
            .flatMap(
              (
                match,
              ) =>
                match.tileIds,
            )
            .filter(
              (
                tileId,
              ) => {
                const tile =
                  nextBoard.find(
                    (
                      candidate,
                    ) =>
                      candidate.id ===
                      tileId,
                  );

                return (
                  tile?.hidden ===
                  true
                );
              },
            ),
        ),
      );

    const rewardableNewMatches =
      newMatches.filter(
        (
          match,
        ) =>
          !rewardedMatchSignatures.includes(
            match.signature,
          ),
      );

    const diagonalMatchCount =
      rewardableNewMatches.filter(
        (
          match,
        ) =>
          match.orientation ===
            "diagonal-down" ||
          match.orientation ===
            "diagonal-up",
      ).length;

    /*
     * If a newly-created match itself contains
     * mystery tiles, reveal those participating
     * tiles immediately.
     *
     * Example:
     * 🔴 🔴 ?  where ? is secretly 🔴
     *
     * The matching mystery becomes known AND the
     * successful Match-3 still earns one player-
     * selected reveal. That is our future
     * 👁️👁️ Double Reveal event.
     */
    const automaticRevealResult =
      hiddenMatchedTileIds.length >
      0
        ? await revealTiles(
            nextBoard,
            hiddenMatchedTileIds,
          )
        : {
            board:
              nextBoard,

            count: 0,

            revealedTileIds:
              [],
          };

    nextBoard =
      automaticRevealResult.board;

    const remainingMysteries =
      nextBoard.filter(
        (
          tile,
        ) =>
          tile.hidden,
      ).length;

    const earnedChosenReveal =
      createdNewMatch &&
      remainingMysteries >
        0;

    const doubleReveal =
      earnedChosenReveal &&
      automaticRevealResult.count >
        0;

    if (
      createdNewMatch
    ) {
      const hasNewRewardableMatch =
        rewardableNewMatches.length >
        0;

      setSkillStats(
        (
          current,
        ) => ({
          ...current,

          /*
           * A recreated RRRY -> RRRR pattern may
           * still earn another reveal, but it does
           * not farm repeated diagonal/edge skill
           * bonuses for the same match signature.
           */
          doubleReveals:
            current.doubleReveals +
            (
              doubleReveal
                ? 1
                : 0
            ),

          productiveDiagonalSwaps:
            current.productiveDiagonalSwaps +
            (
              hasNewRewardableMatch &&
              performedSwapKind ===
                "diagonal"
                ? 1
                : 0
            ),

          diagonalMatches:
            current.diagonalMatches +
            diagonalMatchCount,

          productiveEdgeSwaps:
            current.productiveEdgeSwaps +
            (
              hasNewRewardableMatch &&
              performedSwapKind ===
                "edge"
                ? 1
                : 0
            ),

          mysteryFinishes:
            current.mysteryFinishes +
            (
              mysteryFinish &&
              current.mysteryFinishes ===
                0
                ? 1
                : 0
            ),
        }),
      );

      if (
        rewardableNewMatches.length >
        0
      ) {
        setRewardedMatchSignatures(
          (
            current,
          ) =>
            Array.from(
              new Set([
                ...current,

                ...rewardableNewMatches.map(
                  (
                    match,
                  ) =>
                    match.signature,
                ),
              ]),
            ),
        );
      }
    }

    setBoard(
      nextBoard,
    );

    animateRevealedTiles(
      automaticRevealResult
        .revealedTileIds,
    );

    setMoves(
      nextMove,
    );

    setMoveHistory(
      nextMoveHistory,
    );

    setSelected(
      null,
    );

    /*
     * 5×5 solved
     */
    if (
      stage ===
        "5x5" &&
      isAcceptedPuzzleSolution(
        nextBoard,
        puzzle.size,
        puzzle.mode,
      )
    ) {
      if (
        recentPuzzleIndex >
          0
      ) {
        setMessage(
          `✓ Practice puzzle #${puzzle.puzzleNumber} solved`,
        );

        setSelected(
          null,
        );

        return;
      }

      if (
        !finalResultId
      ) {
        setFinalResultId(
          crypto.randomUUID(),
        );
      }

      if (
        solveStartedAt !==
          null
      ) {
        const finalElapsed =
          elapsedSince(
            effectiveSolveStartedAt,
            actionNow,
          );

        setActiveSolveMs(
          finalElapsed,
        );

        setDisplaySolveMs(
          finalElapsed,
        );
      }

      setQualified(
        true,
      );

      setAttemptFinished(
        true,
      );

      setCertificateBoard(
        cloneBoard(
          nextBoard,
        ),
      );

      scrollGyanShellToTop();

      setCertificateOpen(
        true,
      );

      setCertificateSent(
        false,
      );

      setCertificateError(
        null,
      );

      setMessage(
        mysteryFinish
          ? "🎉 Mystery Finish! 5×5 complete. ❓ +5 GQ"
          : "🎉 5×5 complete!",
      );

      return;
    }


    /*
     * 7×7 solved
     */
    if (
      stage ===
        "7x7" &&
      isAcceptedPuzzleSolution(
        nextBoard,
        puzzle.size,
        puzzle.mode,
      )
    ) {
      if (
        recentPuzzleIndex >
          0
      ) {
        setMessage(
          `✓ Practice puzzle #${puzzle.puzzleNumber} solved`,
        );

        setSelected(
          null,
        );

        return;
      }

      if (
        solveStartedAt !==
          null
      ) {
        const finalElapsed =
          elapsedSince(
            effectiveSolveStartedAt,
            actionNow,
          );

        setActiveSolveMs(
          finalElapsed,
        );

        setDisplaySolveMs(
          finalElapsed,
        );
      }

      if (
        !finalResultId
      ) {
        setFinalResultId(
          crypto.randomUUID(),
        );
      }

      setMedalWon(
        true,
      );

      setAttemptFinished(
        true,
      );

      setCertificateBoard(
        cloneBoard(
          nextBoard,
        ),
      );

      setCertificateOpen(
        true,
      );

      scrollGyanShellToTop();

      setMessage(
        mysteryFinish
          ? "🏅 Mystery Finish! Winner! ❓ +5 GQ"
          : "🏅 Winner! Claim your medal.",
      );

      return;
    }


    if (
      earnedChosenReveal
    ) {
      setPendingRevealCount(
        (
          current,
        ) =>
          current + 1,
      );

      setMessage(
        doubleReveal
          ? "👁️👁️ Double reveal! Matching mystery uncovered — now choose another mystery."
          : "👁️ Reveal earned! Choose a mystery square.",
      );

      return;
    }

    if (
      recentPuzzleIndex ===
        0 &&
      nextMove >=
        puzzle.maxMoves
    ) {
      finishAttempt();

      return;
    }

    setMessage(
      recentPuzzleIndex >
        0
        ? ""
        : `${
            puzzle.maxMoves -
            nextMove
          } moves remaining.`,
    );
  }


  /*
   * ========================================================
   * CLICK
   * ========================================================
   */

  function handleClick(
    row: number,
    column: number,
  ) {
    if (
      attemptFinished
    ) {
      return;
    }

    const clickedTile =
      board[
        indexOf(
          row,
          column,
          puzzle?.size ??
            1,
        )
      ];

    if (
      pendingRevealCount >
      0
    ) {
      if (
        clickedTile?.hidden
      ) {
        void chooseMysteryReveal(
          clickedTile.id,
        );
      } else {
        setMessage(
          "Choose a mystery square to reveal.",
        );
      }

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
      setSelected(
        null,
      );

      return;
    }

    if (
      puzzle &&
      canSwap(
        selected,
        clicked,
        puzzle.size,
      )
    ) {
      void performSwap(
        selected,
        clicked,
      );

      return;
    }

    setSelected(
      clicked,
    );
  }


  /*
   * ========================================================
   * TOUCH
   * ========================================================
   */

  function handleTouchStart(
    event:
      React.TouchEvent<HTMLButtonElement>,
    row: number,
    column: number,
  ) {
    if (
      pendingRevealCount >
      0
    ) {
      return;
    }

    const touch =
      event.touches[0];

    touchStart.current =
      {
        row,
        column,

        x:
          touch.clientX,

        y:
          touch.clientY,
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

    if (
      !start ||
      !puzzle ||
      pendingRevealCount >
        0
    ) {
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

    if (
      Math.abs(dx) <
        SWIPE_THRESHOLD &&
      Math.abs(dy) <
        SWIPE_THRESHOLD
    ) {
      return;
    }

    let row =
      start.row;

    let column =
      start.column;

    const absoluteDx =
      Math.abs(dx);

    const absoluteDy =
      Math.abs(dy);

    /*
     * Diagonal swipe:
     *
     * Both axes must cross the normal swipe
     * threshold, and the smaller component must
     * be at least 45% of the larger component.
     *
     * This keeps slightly-slanted horizontal /
     * vertical gestures cardinal while making
     * intentional ↖ ↗ ↙ ↘ gestures natural.
     */
    const largerDistance =
      Math.max(
        absoluteDx,
        absoluteDy,
      );

    const smallerDistance =
      Math.min(
        absoluteDx,
        absoluteDy,
      );

    const isDiagonalSwipe =
      absoluteDx >=
        SWIPE_THRESHOLD &&
      absoluteDy >=
        SWIPE_THRESHOLD &&
      smallerDistance >=
        largerDistance *
          0.45;

    if (isDiagonalSwipe) {
      row +=
        dy > 0
          ? 1
          : -1;

      column +=
        dx > 0
          ? 1
          : -1;
    } else if (
      absoluteDx >
      absoluteDy
    ) {
      column +=
        dx > 0
          ? 1
          : -1;
    } else {
      row +=
        dy > 0
          ? 1
          : -1;
    }

    /*
     * Spatial wrapping for swipe gestures.
     *
     * Examples on 5×5:
     * A2 ↖ / ↙ can wrap to E1 / E3 as appropriate,
     * and A1 ↖ wraps diagonally to E5.
     */
    row =
      (
        row %
          puzzle.size +
        puzzle.size
      ) %
      puzzle.size;

    column =
      (
        column %
          puzzle.size +
        puzzle.size
      ) %
      puzzle.size;

    void performSwap(
      {
        row:
          start.row,

        column:
          start.column,
      },

      {
        row,
        column,
      },
    );
  }


  /*
   * ========================================================
   * FINAL GQ RESULT / LEADERBOARD
   * ========================================================
   */

  useEffect(
    () => {
      const resultSolved =
        stage ===
          "5x5"
          ? qualified
          : medalWon;

      if (
        recentPuzzleIndex >
          0 ||
        !puzzle ||
        !resultSolved
      ) {
        return;
      }

      let cancelled =
        false;

      if (
        !finalResultId
      ) {
        return;
      }

      const resultId =
        finalResultId;

      const anonymousName =
        guestNameForResultId(
          resultId,
        );

      const currentPuzzle =
        puzzle;

      const currentStage =
        stage;

      const gq =
        calculateStageGq(
          currentPuzzle.maxMoves,
          moves,
          skillStats,
          true,
          activeSolveMs,
          currentStage,
        );

      async function saveResult() {
        setResultSaving(
          true,
        );

        try {
          const response =
            await fetch(
              "/api/puzzle/result",
              {
                method:
                  "POST",

                headers: {
                  "content-type":
                    "application/json",
                },

                body:
                  JSON.stringify({
                    resultId,

                    anonymousName,

                    puzzleNumber:
                      currentPuzzle.puzzleNumber,
                    stage:
                      currentStage,
                    gqScore:
                      gq.score,
                    movesUsed:
                      moves,
                    icons:
                      gq.icons,
                    skillStats,
                  }),
              },
            );

          const data =
            (await response.json()) as
              SaveResultResponse;

          if (
            !response.ok ||
            !data.saved
          ) {
            return;
          }

          if (
            !cancelled &&
            data.name
          ) {
            setAssignedGuestName(
              data.name,
            );
          }

          const nextLeaderboard =
            await fetchLeaderboard(
              currentPuzzle.puzzleNumber,
              resultId,
            );

          if (
            !cancelled
          ) {
            setLeaderboard(
              nextLeaderboard,
            );
          }
        } finally {
          if (
            !cancelled
          ) {
            setResultSaving(
              false,
            );
          }
        }
      }

      void saveResult();

      return () => {
        cancelled =
          true;
      };
    },
    [
      qualified,
      medalWon,
      stage,
      puzzle,
      moves,
      skillStats,
      finalResultId,
      activeSolveMs,
      recentPuzzleIndex,
    ],
  );


  /*
   * ========================================================
   * EMAIL CERTIFICATE
   * ========================================================
   */

  async function claimQualifierScore() {
    if (
      !puzzle ||
      stage !==
        "5x5" ||
      !qualified ||
      !finalResultId
    ) {
      return;
    }

    const name =
      winnerName.trim();

    const email =
      certificateEmail
        .trim()
        .toLowerCase();

    if (
      name.length < 2
    ) {
      setCertificateError(
        "Please provide your display name.",
      );

      return;
    }

    if (
      email &&
      !validEmail(
        email,
      )
    ) {
      setCertificateError(
        "Please provide a valid email address, or leave it blank.",
      );

      return;
    }

    setCertificateSending(
      true,
    );

    setCertificateError(
      null,
    );

    try {
      const claimResponse =
        await fetch(
          "/api/puzzle/result/claim",
          {
            method:
              "POST",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                puzzleNumber:
                  puzzle.puzzleNumber,

                resultId:
                  finalResultId,

                name,

                email,
              }),
          },
        );

      const claimData =
        (await claimResponse.json()) as
          ResultClaimResponse;

      if (
        !claimResponse.ok ||
        !claimData.claimed
      ) {
        throw new Error(
          claimData.error ??
            "Unable to claim score.",
        );
      }

      setQualifierClaimed(
        true,
      );

      if (
        email &&
        claimData.emailStatus ===
          "pending"
      ) {
        setCertificateSent(
          false,
        );

        setMessage(
          "✓ Name updated. Verification email sent.",
        );
      } else if (
        claimData.emailStatus ===
          "verified"
      ) {
        setMessage(
          "✓ Account updated.",
        );
      } else {
        setMessage(
          "✓ Leaderboard name updated.",
        );
      }

      const nextLeaderboard =
        await fetchLeaderboard(
          puzzle.puzzleNumber,
          finalResultId,
        );

      setLeaderboard(
        nextLeaderboard,
      );

      setChallengeLeaderboard(
        nextLeaderboard,
      );
    } catch (
      error
    ) {
      setCertificateError(
        error instanceof
          Error
          ? error.message
          : "Unable to claim score.",
      );
    } finally {
      setCertificateSending(
        false,
      );
    }
  }





  /*
   * ========================================================
   * MEDAL
   * ========================================================
   */

  async function claimMedal() {
    if (
      !puzzle ||
      !finalResultId
    ) {
      return;
    }

    const name =
      winnerName.trim();

    const email =
      winnerEmail
        .trim()
        .toLowerCase();

    if (
      name.length < 2
    ) {
      setMedalError(
        "Please enter your display name.",
      );

      return;
    }

    if (
      email &&
      !validEmail(
        email,
      )
    ) {
      setMedalError(
        "Please enter a valid email, or leave it blank.",
      );

      return;
    }

    setClaimingMedal(
      true,
    );

    setMedalError(
      null,
    );

    try {
      const response =
        await fetch(
          "/api/puzzle/result/claim",
          {
            method:
              "POST",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                puzzleNumber:
                  puzzle.puzzleNumber,

                resultId:
                  finalResultId,

                name,

                email,
              }),
          },
        );

      const data =
        (await response.json()) as
          ResultClaimResponse;

      if (
        !response.ok ||
        !data.claimed
      ) {
        throw new Error(
          data.error ??
            "Unable to update leaderboard profile.",
        );
      }

      setMedalClaimed(
        true,
      );

      setMedalClaimName(
        name,
      );

      if (
        email &&
        data.emailStatus ===
          "pending"
      ) {
        setMessage(
          "✓ Name updated. Verification email sent.",
        );
      } else {
        setMessage(
          "✓ Account updated.",
        );
      }

      const nextLeaderboard =
        await fetchLeaderboard(
          puzzle.puzzleNumber,
          finalResultId,
        );

      setLeaderboard(
        nextLeaderboard,
      );

      setChallengeLeaderboard(
        nextLeaderboard,
      );
    } catch (
      error
    ) {
      setMedalError(
        error instanceof
          Error
          ? error.message
          : "Unable to update leaderboard profile.",
      );
    } finally {
      setClaimingMedal(
        false,
      );
    }
  }


  async function shareResult() {
    if (
      !puzzle ||
      !solvedStage
    ) {
      return;
    }

    setSharingResult(
      true,
    );

    try {
      const result =
        await sharePuzzleResult(
          puzzle.puzzleNumber,
          stage,
          currentGq.score,
          currentGq.icons,
        );

      if (
        result ===
          "copied"
      ) {
        setMessage(
          "📋 Result copied — share it with friends or WhatsApp groups.",
        );
      } else if (
        result ===
          "shared"
      ) {
        setMessage(
          "📤 Result shared!",
        );
      }
    } finally {
      setSharingResult(
        false,
      );
    }
  }


  const botNumber =
    puzzle
      ? aiBotNumber(
          puzzle.puzzleNumber,
        )
      : 0;

  const botGq =
    puzzle
      ? aiBotGq(
          puzzle.puzzleNumber,
        )
      : 0;

  const humanLeader =
    challengeLeaderboard
      ?.top?.[0] ??
    null;

  /*
   * AI Bot is only the fallback when nobody
   * has completed the 7×7 Final yet.
   *
   * As soon as a human result exists, the
   * current human GQ leader becomes the
   * challenge target regardless of whether
   * their score is above the Bot benchmark.
   */
  const hasHumanLeader =
    humanLeader !==
      null;

  const challengeName =
    hasHumanLeader
      ? humanLeader.name
      : puzzle
        ? aiBotName(
            puzzle.puzzleNumber,
          )
        : `AI Bot #${botNumber}`;

  const challengeGq =
    hasHumanLeader
      ? humanLeader.gq
      : botGq;

  const challengeIcon =
    hasHumanLeader
      ? "🥇"
      : "🤖";


  /*
   * ========================================================
   * EARLY RETURNS
   * ========================================================
   */

  if (!visible) {
    return null;
  }

  if (livePuzzleOpen) {
    return (
      <LivePuzzle
        onBack={() =>
          setLivePuzzleOpen(false)
        }
      />
    );
  }

  if (
    loading &&
    !puzzle
  ) {
    return (
      <section className="daily-puzzle">
        <div className="daily-puzzle__message">
          Loading puzzle…
        </div>
      </section>
    );
  }

  if (!puzzle) {
    return (
      <section className="daily-puzzle">
        <div className="daily-puzzle__message">
          {message}
        </div>
      </section>
    );
  }


  const solvedStage =
    stage ===
      "5x5"
      ? qualified
      : medalWon;

  const completedWinningLine =
    solvedStage
      ? findCompletedWinningLine(
          board,
          puzzle.size,
        )
      : null;

  const completedWinningTileIds =
    new Set(
      completedWinningLine
        ?.tileIds ??
        [],
    );

  const certificateWinningLine =
    certificateBoard.length ===
      puzzle.size *
        puzzle.size
      ? findCompletedWinningLine(
          certificateBoard,
          puzzle.size,
        )
      : null;

  const certificateWinningTileIds =
    new Set(
      certificateWinningLine
        ?.tileIds ??
        [],
    );

  const currentGq =
    calculateStageGq(
      puzzle.maxMoves,
      moves,
      skillStats,
      solvedStage,
      activeSolveMs,
      stage,
    );


  const historicalWinningTileIds =
    historicalSolution
      ? solvedPatternTileIds(
          historicalSolution.solvedBoard,
          historicalSolution.size,
          historicalSolution.mode,
        )
      : new Set<number>();


  /*
   * ========================================================
   * UI
   * ========================================================
   */

  return (
    <section
      style={{
        position:
          "relative",
        minHeight:
          "calc(100dvh - var(--gyan-header-height, 64px) - 64px)",
        boxSizing:
          "border-box",
        display:
          "flex",
        flexDirection:
          "column",
      }}
      className={[
        "daily-puzzle",

        stage ===
          "7x7"
          ? "daily-puzzle--final"
          : "",
      ].join(" ")}
    >
      <button
        type="button"
        className="daily-puzzle__close"
        aria-label="Close puzzle"
        onClick={() => {
          setVisible(
            false,
          );

          onClose?.();
        }}
      >
        ×
      </button>

      <header
        className="daily-puzzle__header"
        style={{
          display: "grid",
          gridTemplateColumns:
            "28px minmax(0, 1fr) 28px",
          alignItems: "center",
          gap: "4px",
        }}
      >
        <button
          type="button"
          aria-label="Previous puzzle"
          title="Previous puzzle"
          disabled={
            historyLoading ||
            recentPuzzleIndex >=
              recentPuzzles.length - 1
          }
          onClick={() =>
            void openHistoricalPuzzleAt(
              recentPuzzleIndex + 1,
            )
          }
          style={{
            width: "25px",
            height: "25px",
            border:
              "1px solid #d6e0e5",
            borderRadius:
              "6px",
            background: "#fff",
            cursor:
              recentPuzzleIndex >=
                recentPuzzles.length - 1
                ? "default"
                : "pointer",
            opacity:
              recentPuzzleIndex >=
                recentPuzzles.length - 1
                ? 0.35
                : 1,
            fontWeight: 900,
          }}
        >
          ‹
        </button>

        <div
          style={{
            minWidth: 0,
            textAlign: "center",
          }}
        >
          <span
            style={{
              display: "block",
              fontSize:
                "0.72rem",
            }}
          >
            {recentPuzzleIndex ===
              0
              ? "Puzzle of the Day"
              : "Practice Puzzle"}
          </span>

          <strong
            style={{
              display:
                "flex",
              alignItems:
                "center",
              justifyContent:
                "center",
              gap:
                "5px",
              whiteSpace:
                "nowrap",
              flexWrap:
                "wrap",
            }}
          >
            <span>
              #
              {
                puzzle.puzzleNumber
              }
              {stage ===
                "5x5"
                ? " (5×5)"
                : ""}
            </span>

            {recentPuzzleIndex ===
              0 && (
              <button
                type="button"
                onClick={() =>
                  setPuzzleModesOpen(
                    true,
                  )
                }
                style={{
                  border:
                    0,
                  background:
                    "transparent",
                  padding:
                    0,
                  font:
                    "inherit",
                  fontSize:
                    "0.72rem",
                  fontWeight:
                    800,
                  cursor:
                    "pointer",
                  color:
                    "#536670",
                }}
                title="See all puzzle modes"
              >
                {puzzle.mode.shortLabel}
                {" · "}
                💎{puzzle.mode.gemReward}
              </button>
            )}
          </strong>
        </div>

        <button
          type="button"
          aria-label="Next puzzle"
          title="Next puzzle"
          disabled={
            historyLoading ||
            recentPuzzleIndex <=
              0
          }
          onClick={() =>
            void openHistoricalPuzzleAt(
              recentPuzzleIndex - 1,
            )
          }
          style={{
            width: "25px",
            height: "25px",
            border:
              "1px solid #d6e0e5",
            borderRadius:
              "6px",
            background: "#fff",
            cursor:
              recentPuzzleIndex <=
                0
                ? "default"
                : "pointer",
            opacity:
              recentPuzzleIndex <=
                0
                ? 0.35
                : 1,
            fontWeight: 900,
          }}
        >
          ›
        </button>
      </header>

      {recentPuzzles.length >
        0 && (
        <div
          aria-label="Last 10 puzzle history"
          style={{
            display: "flex",
            justifyContent:
              "center",
            alignItems:
              "center",
            gap: "5px",
            margin:
              "4px auto 2px",
            width:
              "100%",
            maxWidth:
              "300px",
            overflow:
              "hidden",
            padding:
              "1px 2px 3px",
          }}
        >
          {
            [...recentPuzzles]
              .reverse()
              .map(
                (
                  item,
                ) => {
                  const index =
                    recentPuzzles.findIndex(
                      (
                        candidate,
                      ) =>
                        candidate.puzzleNumber ===
                        item.puzzleNumber,
                    );

                  const active =
                    index ===
                    recentPuzzleIndex;

                  return (
                    <button
                      key={
                        item.puzzleNumber
                      }
                      type="button"
                      title={`Puzzle #${item.puzzleNumber} · ${item.mode.shortLabel}`}
                      aria-label={`Puzzle ${item.puzzleNumber}`}
                      onClick={() =>
                        void openHistoricalPuzzleAt(
                          index,
                        )
                      }
                      style={{
                        flex:
                          "1 1 0",
                        minWidth:
                          0,
                        maxWidth:
                          "30px",
                        height:
                          "7px",
                        padding:
                          0,
                        border:
                          active
                            ? "1px solid #d3a600"
                            : "1px solid #cfd8dd",
                        borderRadius:
                          "999px",
                        background:
                          active
                            ? "#f5d64b"
                            : "#e7ecef",
                        cursor:
                          "pointer",
                      }}
                    />
                  );
                },
              )
          }
        </div>
      )}

      {recentPuzzleIndex ===
        0 && (
        <>
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
          flexWrap: "wrap",
          gap: "4px",
          margin: "3px auto 7px",
          fontSize: "0.7rem",
          lineHeight: 1.35,
          textAlign: "center",
        }}
      >
        <strong>
          {challengeIcon}{" "}
          {challengeName} · GQ{" "}
          {challengeGq}
        </strong>
        <span aria-hidden="true">·</span>
        <strong>
          Beat score
        </strong>
        <span aria-hidden="true">·</span>
        <button
          type="button"
          className="daily-puzzle__all-winners"
          onClick={() =>
            void openWinners()
          }
          style={{
            padding: 0,
            border: 0,
            background: "transparent",
            font: "inherit",
            fontWeight: 650,
            textDecoration: "underline",
            cursor: "pointer",
          }}
        >
          See GQ Leaders
        </button>
      </div>
        </>
      )}



      {!medalWon && (
        <div
          className="daily-puzzle__board-shell"
          style={
            recentPuzzleIndex >
              0
              ? {
                  width:
                    "100%",
                  maxWidth:
                    "440px",
                  margin:
                    "0 auto",
                  display:
                    "grid",
                  gridTemplateColumns:
                    "minmax(0, 1fr) minmax(0, 1fr)",
                  gap:
                    "8px",
                  alignItems:
                    "start",
                }
              : undefined
          }
        >
          {recentPuzzleIndex >
            0 && (
            <div
              style={{
                gridColumn:
                  "1 / -1",
                textAlign:
                  "center",
                margin:
                  "0 0 1px",
                color:
                  "#536670",
                fontSize:
                  "0.72rem",
                fontWeight:
                  800,
              }}
            >
              {puzzle.mode.shortLabel}
              {" · "}
              💎{puzzle.mode.gemReward}
            </div>
          )}
          <section
            aria-label="Previous puzzle question"
            style={
              recentPuzzleIndex >
                0
                ? {
                    margin:
                      "0 auto",
                    padding:
                      "6px",
                    border:
                      "1px solid #dce5ea",
                    borderRadius:
                      "10px",
                    background:
                      "#fbfcfd",
                    width:
                      "100%",
                    maxWidth:
                      "205px",
                    minWidth:
                      0,
                    boxSizing:
                      "border-box",
                    height:
                      "100%",
                    display:
                      "grid",
                    gridTemplateRows:
                      "auto 1fr",
                  }
                : {
                    display:
                      "contents",
                  }
            }
          >
            {recentPuzzleIndex >
              0 && (
              <div
                style={{
                  textAlign:
                    "center",
                  marginBottom:
                    "3px",
                }}
              >
                <strong
                  style={{
                    fontSize:
                      "0.72rem",
                  }}
                >
                  Question
                </strong>
              </div>
            )}

          <div
            className={[
              "daily-puzzle__board",

              attemptFinished &&
              !qualified
                ? "daily-puzzle__board--blurred"
                : "",

              pendingRevealCount >
              0
                ? "daily-puzzle__board--reveal-mode"
                : "",
            ].join(" ")}
            style={{
              gridTemplateColumns:
                `repeat(${puzzle.size}, 1fr)`,

              ...(
                recentPuzzleIndex >
                  0
                  ? {
                      width:
                        "100%",
                      maxWidth:
                        "193px",
                      margin:
                        "0 auto",
                      alignSelf:
                        "center",
                    }
                  : {}
              ),
            }}
          >
            {board.map(
              (
                tile,
                index,
              ) => {
                const position =
                  positionOf(
                    index,
                    puzzle.size,
                  );

                const selectedNow =
                  selected !==
                    null &&
                  samePosition(
                    selected,
                    position,
                  );

                const swapped =
                  lastSwap?.some(
                    (item) =>
                      samePosition(
                        item,
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
                        : initialBoard.some(
                            (
                              initialTile,
                            ) =>
                              initialTile.id ===
                                tile.id &&
                              initialTile.hidden,
                          )
                          ? `Revealed ${tile.color} mystery square`
                          : `${tile.color} square`
                    }
                    className={[
                      "daily-puzzle__tile",

                      stage ===
                        "7x7"
                        ? "daily-puzzle__tile--final"
                        : "",

                      tile.hidden
                        ? "daily-puzzle__tile--mystery"
                        : `daily-puzzle__tile--${tile.color}`,

                      !tile.hidden &&
                      initialBoard.some(
                        (
                          initialTile,
                        ) =>
                          initialTile.id ===
                            tile.id &&
                          initialTile.hidden,
                      )
                        ? "daily-puzzle__tile--revealed"
                        : "",

                      justRevealedTileIds.includes(
                        tile.id,
                      )
                        ? "daily-puzzle__tile--just-revealed"
                        : "",

                      selectedNow
                        ? "daily-puzzle__tile--selected"
                        : "",

                      swapped
                        ? "daily-puzzle__tile--last-swap"
                        : "",

                      completedWinningTileIds.has(
                        tile.id,
                      )
                        ? "daily-puzzle__tile--winning-line"
                        : "",

                      pendingRevealCount >
                        0 &&
                      tile.hidden
                        ? "daily-puzzle__tile--reveal-choice"
                        : "",

                      pendingRevealCount >
                        0 &&
                      !tile.hidden
                        ? "daily-puzzle__tile--reveal-dimmed"
                        : "",
                    ].join(" ")}
                    style={{
                      touchAction:
                        "none",

                      ...(
                        completedWinningTileIds.has(
                          tile.id,
                        )
                          ? {
                              outline:
                                "2px solid rgba(20, 85, 55, 0.72)",
                              outlineOffset:
                                "-2px",
                            }
                          : {}
                      ),

                      ...(
                        pendingRevealCount >
                        0
                          ? tile.hidden
                            ? {
                                transform:
                                  "scale(1.06)",
                                fontWeight:
                                  900,
                                opacity:
                                  1,
                                filter:
                                  "none",
                              }
                            : {
                                opacity:
                                  0.34,
                                filter:
                                  "blur(1.8px)",
                              }
                          : {}
                      ),
                    }}
                    onClick={() =>
                      handleClick(
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
                    onTouchMove={() => {
                      /*
                       * touchAction: "none" on the tile already prevents
                       * browser panning/scrolling for the gesture.
                       * Do not call preventDefault() here because some
                       * browsers treat touchmove listeners as passive.
                       */
                    }}
                    onTouchCancel={() => {
                      touchStart.current =
                        null;
                    }}
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
          </section>


          {recentPuzzleIndex >
            0 && (
            <section
              aria-label="Previous puzzle solution"
              style={{
                margin:
                  "0 auto",
                padding:
                  "6px",
                border:
                  "1px solid #dce5ea",
                borderRadius:
                  "10px",
                background:
                  "#fbfcfd",
                width:
                  "100%",
                maxWidth:
                  "205px",
                minWidth:
                  0,
                boxSizing:
                  "border-box",
                height:
                  "100%",
                display:
                  "grid",
                gridTemplateRows:
                  "auto 1fr auto",
              }}
            >
              <div
                style={{
                  textAlign:
                    "center",
                  marginBottom:
                    "3px",
                }}
              >
                <strong
                  style={{
                    fontSize:
                      "0.72rem",
                  }}
                >
                  Answer
                </strong>
              </div>

              {historicalSolutionLoading
                ? (
                    <small>
                      Loading solution…
                    </small>
                  )
                : historicalSolution
                  ? (
                      <>
                        <div
                          style={{
                            display:
                              "grid",
                            gridTemplateColumns:
                              `repeat(${historicalSolution.size}, 1fr)`,
                            gap:
                              "3px",
                            width:
                              "100%",
                            maxWidth:
                              "193px",
                            margin:
                              "0 auto",
                            alignSelf:
                              "center",
                          }}
                        >
                          {historicalSolution.solvedBoard.map(
                            (
                              tile,
                            ) => (
                              <span
                                key={
                                  tile.id
                                }
                                title={
                                  tile.color
                                }
                                aria-label={
                                  `${tile.color} solution square`
                                }
                                className={`daily-puzzle__tile daily-puzzle__tile--${tile.color}`}
                                style={{
                                  aspectRatio:
                                    "1",
                                  minWidth:
                                    0,
                                  borderRadius:
                                    "5px",
                                  pointerEvents:
                                    "none",

                                  ...(historicalWinningTileIds.has(
                                    tile.id,
                                  )
                                    ? {
                                        outline:
                                          "3px solid rgba(232, 120, 37, 0.92)",
                                        outlineOffset:
                                          "-3px",
                                        boxShadow:
                                          "0 0 0 2px rgba(255, 255, 255, 0.92)",
                                        transform:
                                          "scale(1.04)",
                                        zIndex:
                                          1,
                                      }
                                    : {
                                        opacity:
                                          0.72,
                                      }),
                                }}
                              />
                            ),
                          )}
                        </div>

                      </>
                    )
                  : (
                      <small>
                        Solution unavailable.
                      </small>
                    )}
            </section>
          )}

          {attemptFinished &&
            !qualified &&
            stage ===
              "5x5" && (
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
                        You've used all 5 moves.
                      </span>

                      <span>
                        {
                          chancesRemaining
                        }{" "}
                        {chancesRemaining ===
                        1
                          ? "attempt"
                          : "attempts"}{" "}
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
                        Today's challenge is complete
                      </strong>

                      <span>
                        Previous 5×5 practice is coming next.
                      </span>
                    </>
                  )}
                </div>
              </div>
            )}


          {attemptFinished &&
            stage ===
              "7x7" &&
            !medalWon && (
              <div className="daily-puzzle__attempt-overlay">
                <div className="daily-puzzle__attempt-card">
                  <div className="daily-puzzle__retry-icon">
                    🏆
                  </div>

                  <strong>
                    Final complete
                  </strong>

                  <span>
                    No medal this time.
                  </span>

                  <span className="daily-puzzle__tomorrow">
                    New challenge tomorrow.
                  </span>
                </div>
              </div>
            )}
        </div>
      )}


      {!medalWon &&
        recentPuzzleIndex ===
          0 && (
        <div
          className="daily-puzzle__moves"
          style={{
            display:
              "flex",
            alignItems:
              "center",
            justifyContent:
              "center",
            flexWrap:
              "nowrap",
            gap:
              "4px",
            margin:
              "3px auto",
            whiteSpace:
              "nowrap",
            fontSize:
              "0.72rem",
          }}
        >
          <span>
            Move{" "}
            {moves}
            {"/"}
            {
              puzzle.maxMoves
            }
          </span>

          <span
            aria-hidden="true"
            style={{
              opacity:
                0.55,
            }}
          >
            |
          </span>

          <span>
            ⏱{" "}
            {
              solveStartedAt ===
                null
                ? "--"
                : `${Math.floor(
                    displaySolveMs /
                      60000,
                  )}:${String(
                    Math.floor(
                      (
                        displaySolveMs %
                          60000
                      ) /
                        1000,
                    ),
                  ).padStart(
                    2,
                    "0",
                  )}`
            }
          </span>

          {stage ===
            "5x5" && (
            <>
              <span
                aria-hidden="true"
                style={{
                  opacity:
                    0.55,
                }}
              >
                |
              </span>

              <strong>
                Attempts:
              </strong>

              <div
                className="daily-puzzle__lives"
                aria-label={`${chancesRemaining} attempts remaining`}
                style={{
                  display:
                    "inline-flex",
                  alignItems:
                    "center",
                  justifyContent:
                    "center",
                  gap:
                    "3px",
                  height:
                    "12px",
                  lineHeight:
                    1,
                  verticalAlign:
                    "middle",
                }}
              >
                {Array.from({
                  length:
                    MAX_CHANCES,
                }).map(
                  (
                    _,
                    index,
                  ) => (
                    <span
                      key={
                        index
                      }
                      className={[
                        "daily-puzzle__life",

                        index <
                        chancesRemaining
                          ? "daily-puzzle__life--active"
                          : "",
                      ].join(" ")}
                      style={{
                        display:
                          "block",
                        width:
                          "8px",
                        height:
                          "8px",
                        minWidth:
                          "8px",
                        margin:
                          0,
                        flex:
                          "0 0 8px",
                      }}
                    />
                  ),
                )}
              </div>
            </>
          )}
        </div>
      )}

      {(recentPuzzleIndex ===
        0 ||
        (
          recentPuzzleIndex >
            0 &&
          message.startsWith(
            "✓ Practice puzzle",
          )
        )) && (
        <div
          className="daily-puzzle__message"
          style={
            recentPuzzleIndex >
              0
              ? {
                  margin:
                    "4px auto 0",
                  padding:
                    "4px 9px",
                  border:
                    "1px solid #b7833f",
                  borderRadius:
                    "999px",
                  background:
                    "#f6ead6",
                  color:
                    "#7a4b18",
                  fontSize:
                    "0.72rem",
                  fontWeight:
                    850,
                  textAlign:
                    "center",
                  width:
                    "fit-content",
                }
              : undefined
          }
        >
          {message}
        </div>
      )}


      {solvedStage && (
        <section
          className="daily-puzzle__gq"
          aria-label={`${stage} GYAN Quotient`}
          style={{
            margin:
              "10px auto",
            padding:
              "10px 12px",
            width:
              "100%",
            boxSizing:
              "border-box",
            border:
              "1px solid rgba(0,0,0,0.12)",
            borderRadius:
              "12px",
            textAlign:
              "center",
            background:
              "rgba(255,255,255,0.72)",
          }}
        >
          <div
            style={{
              display:
                "flex",
              justifyContent:
                "center",
              alignItems:
                "baseline",
              gap:
                "6px",
              flexWrap:
                "wrap",
              fontSize:
                "0.78rem",
            }}
          >
            <strong
              style={{
                fontSize:
                  "0.78rem",
                fontWeight:
                  650,
              }}
            >
              {stage ===
                "5x5"
                ? "5×5 GQ"
                : "Final GQ"}
              {": "}
              {currentGq.score}
            </strong>

            {currentGq.icons.length >
              0 && (
              <span
                aria-label="GQ achievement icons"
                title="GQ achievement icons"
              >
                {
                  currentGq.icons.join(
                    " ",
                  )
                }
              </span>
            )}
          </div>

          <button
            type="button"
            onClick={() =>
              void shareResult()
            }
            disabled={
              sharingResult
            }
            style={{
              margin:
                "6px auto 0",
              padding:
                "6px 10px",
              borderRadius:
                "999px",
              border:
                "1px solid rgba(0,0,0,0.14)",
              background:
                "rgba(255,255,255,0.82)",
              font:
                "inherit",
              fontSize:
                "0.72rem",
              fontWeight:
                650,
              cursor:
                sharingResult
                  ? "default"
                  : "pointer",
            }}
          >
            {sharingResult
              ? "Sharing…"
              : "📤 Share result"}
          </button>

          <small
            style={{
              display:
                "block",
              marginTop:
                "4px",
              fontSize:
                "0.68rem",
              lineHeight:
                1.3,
              fontWeight:
                650,
            }}
          >
            ⏱ Solved in{" "}
            {Math.max(
              1,
              Math.round(
                activeSolveMs /
                  1000,
              ),
            )}s
          </small>

          <small
            style={{
              display:
                "block",
              marginTop:
                "3px",
              fontSize:
                "0.6rem",
              lineHeight:
                1.3,
            }}
          >
            GQ is a GYAN game-performance score,
            not a scientific IQ or intelligence test.
          </small>

          <details
            style={{
              marginTop:
                "6px",
            }}
          >
            <summary
              style={{
                fontSize:
                  "0.72rem",
              }}
            >
              GQ legend
            </summary>

            <div
              style={{
                marginTop:
                  "4px",
                lineHeight:
                  1.4,
                fontSize:
                  "0.68rem",
              }}
            >
              ⚡ efficient solve ·
              ⏱ fast solve ·
              👁️ chosen reveal ·
              👁️👁️ double reveal ·
              ◇ diagonal match ·
              ↔ productive edge move ·
              ❓ mystery finish
            </div>

            <div
              style={{
                marginTop:
                  "3px",
                fontSize:
                  "0.66rem",
                lineHeight:
                  1.35,
              }}
            >
              GQ rewards successful completion,
              efficient moves, strategic reveals,
              productive diagonal/edge reasoning,
              and mystery finishes.
            </div>
          </details>
        </section>
      )}





      {!medalWon && (
        <div className="daily-puzzle__rules">
          <span>
            <strong>
              Match 3+
            </strong>

            {" → "}

            choose 1 mystery
          </span>

          <span>
            <strong>
              Match{" "}
              {
                puzzle.size
              }
            </strong>

            {" → "}

            {stage ===
            "5x5"
              ? "unlock final"
              : "win medal"}
          </span>
        </div>
      )}


      {stage ===
        "5x5" &&
        qualified &&
        !certificateOpen && (
          <div
            style={{
              display:
                "flex",
              justifyContent:
                "center",
              margin:
                "8px 0 4px",
            }}
          >
            <button
              type="button"
              className="daily-puzzle__certificate-final"
              onClick={() =>
                void startFinal()
              }
            >
              🏆 Play 7×7{" "}
              <span
                style={{
                  fontWeight:
                    500,
                }}
              >
                to improve your GQ
              </span>
            </button>
          </div>
        )}


      <footer
        className="daily-puzzle__footer"
        style={{
          marginTop:
            "auto",
        }}
      >
        <span>
          🗓 New puzzle tomorrow
        </span>

        <button
          type="button"
          className="daily-puzzle__education-entry"
          onClick={() => {
            if (
              onOpenEducation
            ) {
              onOpenEducation();

              return;
            }

            setEducationComingSoon(
              "🎓 Education Portal",
            );
          }}
        >
          🎓 Education Portal
        </button>

        <span>
          🏅 Medals: 0 / 7
        </span>
      </footer>



      {/* =================================================
          SHARED COMPLETION CERTIFICATE
          ================================================= */}

      {solvedStage &&
        certificateOpen && (
          <div
            ref={
              certificateOverlayRef
            }
            className="daily-puzzle__certificate-overlay"
            role="dialog"
            aria-modal="true"
            aria-label="Puzzle completion certificate"
            style={{
              top:
                "var(--gyan-header-height, 64px)",

              alignItems:
                "start",

              justifyItems:
                "center",

              paddingTop:
                "8px",
            }}
          >
            <section
              className="daily-puzzle__certificate"
              style={{
                margin:
                  "0 auto 12px",
                position:
                  "relative",
              }}
            >
              <div
                className="daily-puzzle__certificate-top"
                style={{
                  display:
                    "grid",
                  gridTemplateColumns:
                    "auto minmax(0, 1fr) auto",
                  alignItems:
                    "center",
                  gap:
                    "8px",
                  marginBottom:
                    "8px",
                }}
              >
                <div className="daily-puzzle__certificate-brand">
                  <span
                    aria-hidden="true"
                  >
                    📖
                  </span>

                  <div>
                    <strong>
                      GYAN
                    </strong>
                  </div>
                </div>

                <div
                  className="daily-puzzle__certificate-title"
                  style={{
                    minWidth:
                      0,
                    textAlign:
                      "center",
                  }}
                >
                  <small
                    style={{
                      display:
                        "block",
                      fontSize:
                        "0.66rem",
                      fontWeight:
                        700,
                      letterSpacing:
                        "0.04em",
                      whiteSpace:
                        "nowrap",
                    }}
                  >
                    CERTIFICATE
                  </small>

                  <strong
                    style={{
                      display:
                        "block",
                      marginTop:
                        "2px",
                      fontSize:
                        "0.82rem",
                      whiteSpace:
                        "nowrap",
                    }}
                  >
                    Puzzle #
                    {
                      puzzle.puzzleNumber
                    }
                    {stage ===
                      "5x5"
                      ? " (5×5)"
                      : " (7×7)"}
                  </strong>
                </div>


                {certificateQr && (
                  <img
                    className="daily-puzzle__certificate-qr"
                    src={
                      certificateQr
                    }
                    alt="QR code for gyan.cc"
                  />
                )}
              </div>



              <div
                style={{
                  display:
                    "flex",
                  justifyContent:
                    "center",
                  alignItems:
                    "baseline",
                  flexWrap:
                    "wrap",
                  gap:
                    "4px",
                  margin:
                    "2px auto 7px",
                  fontSize:
                    "0.7rem",
                  lineHeight:
                    1.3,
                  textAlign:
                    "center",
                }}
              >
                <strong>
                  {
                    stage ===
                      "7x7" &&
                    medalClaimed &&
                    medalClaimName.trim()
                      ? medalClaimName.trim()
                      : qualifierClaimed &&
                          winnerName.trim()
                        ? winnerName.trim()
                        : assignedGuestName ||
                          (
                            finalResultId
                              ? guestNameForResultId(
                                  finalResultId,
                                )
                              : "Guest"
                          )
                  }{" "}
                  (GQ{" "}
                  {currentGq.score})
                </strong>

                <span
                  aria-hidden="true"
                >
                  |
                </span>

                <button
                  type="button"
                  className="daily-puzzle__all-winners"
                  onClick={() =>
                    void openWinners()
                  }
                  style={{
                    padding:
                      0,
                    border:
                      0,
                    background:
                      "transparent",
                    font:
                      "inherit",
                    fontSize:
                      "inherit",
                    fontWeight:
                      650,
                    textDecoration:
                      "underline",
                    cursor:
                      "pointer",
                  }}
                >
                  See GQ Leaders
                </button>

                <span
                  aria-hidden="true"
                >
                  |
                </span>

                <button
                  type="button"
                  aria-label="Close completion certificate"
                  title="Close"
                  onClick={() =>
                    setCertificateOpen(
                      false,
                    )
                  }
                  style={{
                    padding:
                      "0 2px",
                    border:
                      0,
                    background:
                      "transparent",
                    font:
                      "inherit",
                    fontSize:
                      "0.9rem",
                    fontWeight:
                      700,
                    lineHeight:
                      1,
                    cursor:
                      "pointer",
                  }}
                >
                  ×
                </button>
              </div>


              <div
                className="daily-puzzle__certificate-grid"
                style={{
                  gridTemplateColumns:
                    `repeat(${puzzle.size}, 1fr)`,
                }}
                aria-label={`Solved ${puzzle.size} by ${puzzle.size} puzzle`}
              >
                {certificateBoard.map(
                  (tile) => (
                    <span
                      key={
                        tile.id
                      }
                      className={[
                        "daily-puzzle__certificate-tile",

                        tile.hidden
                          ? "daily-puzzle__certificate-tile--mystery"
                          : `daily-puzzle__certificate-tile--${tile.color}`,

                        certificateWinningTileIds.has(
                          tile.id,
                        )
                          ? "daily-puzzle__certificate-tile--winning-line"
                          : "",
                      ].join(" ")}
                      style={
                        certificateWinningTileIds.has(
                          tile.id,
                        )
                          ? {
                              boxShadow:
                                "inset 0 0 0 2px rgba(20, 85, 55, 0.82)",
                            }
                          : undefined
                      }
                    >
                      {tile.hidden
                        ? "?"
                        : ""}
                    </span>
                  ),
                )}
              </div>


              <div
                className="daily-puzzle__certificate-gq"
                style={{
                  margin:
                    "8px auto 6px",
                  padding:
                    "7px 9px",
                  border:
                    "1px solid rgba(0,0,0,0.12)",
                  borderRadius:
                    "10px",
                  background:
                    "rgba(255,255,255,0.78)",
                  textAlign:
                    "center",
                }}
              >
                <div
                  style={{
                    display:
                      "flex",
                    justifyContent:
                      "center",
                    alignItems:
                      "center",
                    flexWrap:
                      "wrap",
                    gap:
                      "6px",
                    fontSize:
                      "0.7rem",
                    lineHeight:
                      1.25,
                  }}
                >
                  <strong>
                    GQ{" "}
                    {
                      currentGq.score
                    }
                    {currentGq.icons.filter(
                      (icon) =>
                        icon !== "⏱",
                    ).length > 0
                      ? ` ${currentGq.icons
                          .filter(
                            (icon) =>
                              icon !== "⏱",
                          )
                          .join(" ")}`
                      : ""}
                  </strong>

                  <span
                    aria-hidden="true"
                  >
                    ·
                  </span>

                  <strong>
                    ⏱{" "}
                    {Math.max(
                      1,
                      Math.round(
                        activeSolveMs /
                          1000,
                      ),
                    )}
                    s
                  </strong>
                </div>

                <div
                  style={{
                    display:
                      "flex",
                    justifyContent:
                      "center",
                    alignItems:
                      "center",
                    flexWrap:
                      "wrap",
                    gap:
                      "8px",
                    marginTop:
                      "4px",
                    fontSize:
                      "0.68rem",
                    lineHeight:
                      1.25,
                  }}
                >
                  <button
                    type="button"
                    onClick={() =>
                      void shareResult()
                    }
                    disabled={
                      sharingResult
                    }
                    style={{
                      padding:
                        0,
                      border:
                        0,
                      background:
                        "transparent",
                      font:
                        "inherit",
                      fontWeight:
                        650,
                      textDecoration:
                        "underline",
                      cursor:
                        sharingResult
                          ? "default"
                          : "pointer",
                    }}
                  >
                    {sharingResult
                      ? "Sharing…"
                      : "📤 Share result"}
                  </button>


                </div>
              </div>


              <div className="daily-puzzle__certificate-actions">
                <div
                  className="daily-puzzle__certificate-email-row"
                  style={{
                    display:
                      "grid",
                    gridTemplateColumns:
                      "minmax(0, 2fr) minmax(0, 2fr) minmax(76px, 1fr)",
                    gap:
                      "6px",
                    alignItems:
                      "stretch",
                    width:
                      "100%",
                  }}
                >
                  <input
                    type="text"
                    value={
                      winnerName
                    }
                    maxLength={
                      80
                    }
                    autoComplete="name"
                    placeholder="Name"
                    aria-label="Display name"
                    style={{
                      height:
                        "100%",
                      minHeight:
                        "42px",
                      boxSizing:
                        "border-box",
                    }}
                    disabled={
                      stage ===
                        "5x5"
                        ? certificateSending
                        : claimingMedal
                    }
                    onChange={(
                      event,
                    ) => {
                      setWinnerName(
                        event.target
                          .value,
                      );

                      setCertificateError(
                        null,
                      );

                      setMedalError(
                        null,
                      );

                      setCertificateSent(
                        false,
                      );

                      setQualifierClaimed(
                        false,
                      );
                    }}
                  />

                  <input
                    type="email"
                    value={
                      stage ===
                        "5x5"
                        ? certificateEmail
                        : winnerEmail
                    }
                    maxLength={
                      160
                    }
                    autoComplete="email"
                    placeholder="Email (optional)"
                    aria-label="Email"
                    style={{
                      height:
                        "100%",
                      minHeight:
                        "42px",
                      boxSizing:
                        "border-box",
                    }}
                    disabled={
                      stage ===
                        "5x5"
                        ? certificateSending
                        : claimingMedal
                    }
                    onChange={(
                      event,
                    ) => {
                      const value =
                        event.target.value;

                      if (
                        stage ===
                          "5x5"
                      ) {
                        setCertificateEmail(
                          value,
                        );
                      } else {
                        setWinnerEmail(
                          value,
                        );
                      }

                      setCertificateError(
                        null,
                      );

                      setMedalError(
                        null,
                      );

                      setCertificateSent(
                        false,
                      );

                      setQualifierClaimed(
                        false,
                      );
                    }}
                    onKeyDown={(
                      event,
                    ) => {
                      if (
                        event.key ===
                          "Enter"
                      ) {
                        event.preventDefault();

                        if (
                          stage ===
                            "5x5"
                        ) {
                          void claimQualifierScore();
                        } else {
                          void claimMedal();
                        }
                      }
                    }}
                  />

                  <button
                    type="button"
                    className="daily-puzzle__certificate-email-icon"
                    aria-label={
                      "Update account"
                    }
                    title={
                      "Update account"
                    }
                    disabled={
                      stage ===
                        "5x5"
                        ? certificateSending ||
                          resultSaving ||
                          !finalResultId
                        : claimingMedal ||
                          !finalResultId
                    }
                    onClick={() => {
                      if (
                        stage ===
                          "5x5"
                      ) {
                        void claimQualifierScore();
                      } else {
                        void claimMedal();
                      }
                    }}
                    style={{
                      height:
                        "100%",
                      minHeight:
                        "42px",
                      minWidth:
                        0,
                      padding:
                        "8px 5px",
                      whiteSpace:
                        "nowrap",
                    }}
                  >
                    {stage ===
                      "5x5"
                      ? certificateSending
                        ? "…"
                        : qualifierClaimed
                          ? "✓ Joined"
                          : (
                            <span
                              style={{
                                display:
                                  "flex",
                                flexDirection:
                                  "column",
                                alignItems:
                                  "center",
                                justifyContent:
                                  "center",
                                lineHeight:
                                  1.05,
                              }}
                            >
                              <strong>
                                UPDATE
                              </strong>

                              <small
                                style={{
                                  marginTop:
                                    "2px",
                                  fontSize:
                                    "0.56rem",
                                  fontWeight:
                                    650,
                                  letterSpacing:
                                    "0.02em",
                                }}
                              >
                                PROFILE
                              </small>
                            </span>
                          )
                      : claimingMedal
                        ? "…"
                        : medalClaimed
                          ? "✓ Joined"
                          : (
                            <span
                              style={{
                                display:
                                  "flex",
                                flexDirection:
                                  "column",
                                alignItems:
                                  "center",
                                justifyContent:
                                  "center",
                                lineHeight:
                                  1.05,
                              }}
                            >
                              <strong>
                                UPDATE
                              </strong>

                              <small
                                style={{
                                  marginTop:
                                    "2px",
                                  fontSize:
                                    "0.56rem",
                                  fontWeight:
                                    650,
                                  letterSpacing:
                                    "0.02em",
                                }}
                              >
                                PROFILE
                              </small>
                            </span>
                          )}
                  </button>
                </div>

                {stage ===
                  "5x5" &&
                  certificateError && (
                  <div className="daily-puzzle__certificate-error">
                    {
                      certificateError
                    }
                  </div>
                )}

                {stage ===
                  "7x7" &&
                  medalError && (
                  <div className="daily-puzzle__certificate-error">
                    {
                      medalError
                    }
                  </div>
                )}

                {stage ===
                  "5x5" &&
                  qualifierClaimed && (
                  <div className="daily-puzzle__certificate-sent">
                    ✓ Score claimed as{" "}
                    <strong>
                      {
                        winnerName.trim()
                      }
                    </strong>
                    {certificateSent
                      ? ` · Certificate sent to ${certificateEmail}`
                      : ""}
                  </div>
                )}

                {stage ===
                  "7x7" &&
                  medalClaimed && (
                  <div className="daily-puzzle__certificate-sent">
                    ✓ Joined leaderboard as{" "}
                    <strong>
                      {
                        medalClaimName
                      }
                    </strong>
                  </div>
                )}

                {stage ===
                  "5x5" && (
                  <button
                    type="button"
                    className="daily-puzzle__certificate-final"
                    onClick={() => {
                      setCertificateOpen(
                        false,
                      );

                      void startFinal();
                    }}
                  >
                    🏆 Play 7×7{" "}
                    <span
                      style={{
                        fontWeight:
                          500,
                      }}
                    >
                      to improve your GQ
                    </span>
                  </button>
                )}

                <details
                  style={{
                    marginTop:
                      "5px",
                    textAlign:
                      "center",
                  }}
                >
                  <summary
                    style={{
                      cursor:
                        "pointer",
                      fontSize:
                        "0.68rem",
                    }}
                  >
                    GQ legend
                  </summary>

                  <div
                    style={{
                      marginTop:
                        "4px",
                      fontSize:
                        "0.64rem",
                      lineHeight:
                        1.35,
                      textAlign:
                        "center",
                    }}
                  >
                    <div
                      style={{
                        marginBottom:
                          "4px",
                      }}
                    >
                      GQ is a GYAN game-performance
                      score, not a scientific IQ or
                      intelligence test.
                    </div>

                    ⚡ efficient solve ·
                    ⏱ fast solve ·
                    👁️ chosen reveal ·
                    👁️👁️ double reveal ·
                    ◇ diagonal match ·
                    ↔ productive edge move ·
                    ❓ mystery finish
                  </div>
                </details>

                <div
                  style={{
                    marginTop:
                      "7px",
                    textAlign:
                      "center",
                  }}
                >
                  <button
                    type="button"
                    className="daily-puzzle__education-entry"
                    onClick={() => {
                      if (
                        onOpenEducation
                      ) {
                        onOpenEducation();

                        return;
                      }

                      setEducationComingSoon(
                        "🎓 Education Portal",
                      );
                    }}
                  >
                    🎓 Education Portal
                  </button>
                </div>

                {educationComingSoon && (
                  <small
                    style={{
                      display:
                        "block",
                      marginTop:
                        "4px",
                      textAlign:
                        "center",
                      fontSize:
                        "0.64rem",
                      fontWeight:
                        650,
                    }}
                  >
                    {
                      educationComingSoon
                    }
                  </small>
                )}
              </div>


              <small className="daily-puzzle__certificate-footnote">
                gyan.cc
              </small>
            </section>
          </div>
        )}


      {/* =================================================
          WINNERS / TOP GQ
          ================================================= */}

      {puzzleModesOpen && (
        <div
          role="dialog"
          aria-modal="true"
          aria-label="Puzzle modes"
          onClick={() =>
            setPuzzleModesOpen(
              false,
            )
          }
          style={{
            position: "fixed",
            inset: 0,
            zIndex: 10020,
            background:
              "rgba(18, 35, 46, 0.44)",
            display: "grid",
            placeItems: "start center",
            padding:
              "calc(var(--gyan-header-height, 64px) + 10px) 10px 24px",
            overflowY: "auto",
          }}
        >
          <section
            onClick={(
              event,
            ) =>
              event.stopPropagation()
            }
            style={{
              width:
                "min(100%, 520px)",
              borderRadius:
                "14px",
              background:
                "#fff",
              padding:
                "12px",
              boxShadow:
                "0 16px 44px rgba(0,0,0,.18)",
            }}
          >
            <div
              style={{
                display: "flex",
                alignItems: "center",
                justifyContent:
                  "space-between",
                gap: "8px",
              }}
            >
              <strong>
                Puzzle Modes
              </strong>

              <button
                type="button"
                aria-label="Close puzzle modes"
                onClick={() =>
                  setPuzzleModesOpen(
                    false,
                  )
                }
                style={{
                  border: 0,
                  background:
                    "#eef3f6",
                  borderRadius:
                    "999px",
                  width: "30px",
                  height: "30px",
                  cursor:
                    "pointer",
                }}
              >
                ×
              </button>
            </div>

            <small
              style={{
                display: "block",
                color: "#687983",
                margin:
                  "2px 0 8px",
              }}
            >
              Today’s mode is shown first. Difficulty is selected deterministically from 10,000 hash buckets.
            </small>

            {[
              puzzle.mode,
              ...PUZZLE_MODE_CATALOG.filter(
                (
                  mode,
                ) =>
                  mode.key !==
                  puzzle.mode.key,
              ),
            ].map(
              (
                mode,
                index,
              ) => (
                <div
                  key={
                    mode.key
                  }
                  style={{
                    border:
                      index === 0
                        ? "2px solid #e97825"
                        : "1px solid #dfe7eb",
                    borderRadius:
                      "10px",
                    padding:
                      "8px",
                    marginBottom:
                      "7px",
                    background:
                      index === 0
                        ? "#fff8ec"
                        : "#fff",
                  }}
                >
                  <div
                    style={{
                      display: "flex",
                      alignItems:
                        "baseline",
                      justifyContent:
                        "space-between",
                      gap: "8px",
                    }}
                  >
                    <strong>
                      {index === 0
                        ? "TODAY · "
                        : ""}
                      {mode.label}
                    </strong>

                    <span
                      style={{
                        whiteSpace:
                          "nowrap",
                        fontSize:
                          "0.74rem",
                        fontWeight:
                          800,
                      }}
                    >
                      {mode.probabilityPercent}% · 💎{mode.gemReward}
                    </span>
                  </div>

                  <ModePatternPreview
                    mode={
                      mode
                    }
                  />

                  <small
                    style={{
                      display:
                        "block",
                      color:
                        "#667780",
                      textAlign:
                        "center",
                    }}
                  >
                    {mode.key ===
                      "EASY"
                      ? "One simple displacement."
                      : mode.key ===
                          "MEDIUM"
                        ? "Simple displacement + a distance-2 spatial move."
                        : mode.key ===
                            "HARD"
                          ? "Solve the full diagonal pattern."
                          : mode.pattern ===
                              "wrapped"
                            ? `Wrapped diagonal: row-to-row pattern offset ${mode.wrappedOffset}.`
                            : ""}
                  </small>
                </div>
              ),
            )}

            <small
              style={{
                display: "block",
                marginTop: "4px",
                color: "#687983",
                textAlign: "center",
              }}
            >
              Complete the daily puzzle to earn its Gem reward once.
            </small>
          </section>
        </div>
      )}


      {winnersOpen && (
        <div
          role="presentation"
          onClick={() =>
            setWinnersOpen(
              false,
            )
          }
          style={{
            position:
              "fixed",
            inset:
              0,
            zIndex:
              10000,
            display:
              "flex",
            alignItems:
              "flex-start",
            justifyContent:
              "center",
            padding:
              "calc(var(--gyan-header-height, 64px) + 8px) 8px 8px",
            boxSizing:
              "border-box",
            background:
              "rgba(0,0,0,0.18)",
          }}
        >
          <section
            className="daily-puzzle__winner-panel"
            role="dialog"
            aria-modal="false"
            aria-label={
              stage ===
                "7x7"
                ? "Top GQ results"
                : "Puzzle winners"
            }
            onClick={(
              event,
            ) =>
              event.stopPropagation()
            }
            style={{
              width:
                "min(calc(100vw - 16px), 420px)",
              margin:
                0,
              maxHeight:
                "70vh",
              overflowY:
                "auto",
              boxSizing:
                "border-box",
              boxShadow:
                "0 10px 30px rgba(0,0,0,0.22)",
            }}
          >
            <button
              type="button"
              className="daily-puzzle__winner-panel-close"
              aria-label="Close winners"
              onClick={() =>
                setWinnersOpen(
                  false,
                )
              }
            >
              ×
            </button>

            <h3>
              🏆 GQ Leaders
            </h3>

            <small
              style={{
                display:
                  "block",
                margin:
                  "-4px 0 8px",
                textAlign:
                  "center",
                fontSize:
                  "0.68rem",
                opacity:
                  0.72,
              }}
            >
              Each completed round appears separately. The Stage column shows whether the score is from 5×5 or 7×7.
            </small>

            {winnersLoading ||
            resultSaving ? (
              <p className="daily-puzzle__winner-panel-message">
                Loading…
              </p>
            ) : leaderboard &&
              leaderboard.top.length >
                0 ? (
                <>
                  <div
                    className="daily-puzzle__recent-winners"
                    style={{
                      fontFamily:
                        "ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, 'Liberation Mono', 'Courier New', monospace",
                      fontVariantNumeric:
                        "tabular-nums",
                    }}
                  >
                    <div
                      aria-hidden="true"
                      style={{
                        display:
                          "grid",
                        gridTemplateColumns:
                          "30px 42px 112px minmax(0,1fr)",
                        gap:
                          "6px",
                        alignItems:
                          "center",
                        padding:
                          "0 0 3px",
                        borderBottom:
                          "1px solid rgba(0,0,0,0.1)",
                        fontSize:
                          "0.56rem",
                        fontWeight:
                          700,
                        opacity:
                          0.62,
                        textTransform:
                          "uppercase",
                      }}
                    >
                      <span />

                      <span
                        style={{
                          textAlign:
                            "center",
                        }}
                      >
                        Stage
                      </span>

                      <span>
                        Name
                      </span>

                      <span>
                        Score
                      </span>
                    </div>

                    {leaderboard.top.map(
                      (
                        entry,
                      ) => {
                        const isYou =
                          finalResultId !==
                            null &&
                          entry.resultId ===
                            finalResultId;

                        const medal =
                          entry.rank === 1
                            ? "🥇"
                            : entry.rank === 2
                              ? "🥈"
                              : entry.rank === 3
                                ? "🥉"
                                : `${entry.rank}.`;

                        return (
                          <div
                            key={
                              `${entry.resultId}-${entry.stage}`
                            }
                            className="daily-puzzle__recent-winner"
                            style={{
                              display:
                                "grid",
                              gridTemplateColumns:
                                "30px 42px 112px minmax(0,1fr)",
                              gap:
                                "6px",
                              alignItems:
                                "center",
                              padding:
                                "5px 4px",
                              borderRadius:
                                "6px",
                              background:
                                isYou
                                  ? "rgba(0, 0, 0, 0.07)"
                                  : "transparent",
                              outline:
                                isYou
                                  ? "1px solid rgba(0, 0, 0, 0.16)"
                                  : "none",
                            }}
                          >
                            <span
                              style={{
                                textAlign:
                                  "center",
                                whiteSpace:
                                  "nowrap",
                              }}
                            >
                              {medal}
                            </span>

                            <span
                              style={{
                                textAlign:
                                  "center",
                                fontSize:
                                  "0.62rem",
                                fontWeight:
                                  700,
                                whiteSpace:
                                  "nowrap",
                                opacity:
                                  0.78,
                              }}
                            >
                              {entry.stage ===
                                "7x7"
                                ? "7×7"
                                : "5×5"}
                            </span>

                            <strong
                              title={
                                entry.name
                              }
                              style={{
                                minWidth:
                                  0,
                                overflow:
                                  "hidden",
                                textOverflow:
                                  "ellipsis",
                                whiteSpace:
                                  "nowrap",
                              }}
                            >
                              {
                                entry.name
                              }
                              {" "}
                              {entry.isBot
                                ? "🤖"
                                : "🌟"}
                            </strong>

                            <span
                              style={{
                                minWidth:
                                  0,
                                overflow:
                                  "hidden",
                                textOverflow:
                                  "ellipsis",
                                whiteSpace:
                                  "nowrap",
                                textAlign:
                                  "left",
                                fontVariantNumeric:
                                  "tabular-nums",
                              }}
                            >
                              <strong>
                                GQ{" "}
                                {
                                  entry.gq
                                }
                              </strong>
                              {" "}
                              {
                                entry.icons.join(
                                  " ",
                                )
                              }
                            </span>
                          </div>
                        );
                      },
                    )}

                    {(leaderboard.yourEntries ?? [])
                      .filter(
                        (entry) =>
                          !leaderboard.top.some(
                            (topEntry) =>
                              topEntry.resultId ===
                                entry.resultId &&
                              topEntry.stage ===
                                entry.stage,
                          ),
                      )
                      .map(
                        (entry) => (
                          <div
                            key={`current-${entry.resultId}-${entry.stage}`}
                            className="daily-puzzle__recent-winner"
                            style={{
                              display:
                                "grid",
                              gridTemplateColumns:
                                "30px 42px 112px minmax(0,1fr)",
                              gap:
                                "6px",
                              alignItems:
                                "center",
                              marginTop:
                                "5px",
                              padding:
                                "5px 4px",
                              borderTop:
                                "1px dashed rgba(0,0,0,0.18)",
                              borderRadius:
                                "6px",
                              background:
                                "rgba(0, 0, 0, 0.07)",
                              outline:
                                "1px solid rgba(0, 0, 0, 0.16)",
                            }}
                          >
                            <span
                              style={{
                                textAlign:
                                  "center",
                                whiteSpace:
                                  "nowrap",
                              }}
                            >
                              {
                                entry.rank <=
                                  10
                                  ? `${entry.rank}.`
                                  : "—"
                              }
                            </span>

                            <span
                              style={{
                                textAlign:
                                  "center",
                                fontSize:
                                  "0.62rem",
                                fontWeight:
                                  700,
                                whiteSpace:
                                  "nowrap",
                                opacity:
                                  0.78,
                              }}
                            >
                              {entry.stage ===
                                "7x7"
                                ? "7×7"
                                : "5×5"}
                            </span>

                            <strong
                              title={entry.name}
                              style={{
                                minWidth:
                                  0,
                                overflow:
                                  "hidden",
                                textOverflow:
                                  "ellipsis",
                                whiteSpace:
                                  "nowrap",
                              }}
                            >
                              {entry.name} 🌟
                            </strong>

                            <span
                              style={{
                                minWidth:
                                  0,
                                overflow:
                                  "hidden",
                                textOverflow:
                                  "ellipsis",
                                whiteSpace:
                                  "nowrap",
                                textAlign:
                                  "left",
                              }}
                            >
                              <strong>
                                GQ {entry.gq}
                              </strong>
                              {" "}
                              {entry.icons.join(
                                " ",
                              )}
                            </span>
                          </div>
                        ),
                      )}
                  </div>

                </>
              ) : (
                <p className="daily-puzzle__winner-panel-message">
                  No 7×7 GQ leaders yet.
                </p>
              )}
          </section>
        </div>
      )}

    </section>
  );
}