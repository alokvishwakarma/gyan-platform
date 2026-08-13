import {
  useEffect,
  useRef,
  useState,
} from "react";

import QRCode from "qrcode";

import "./Puzzle.css";

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

function calculateStageGq(
  maxMoves: number,
  movesUsed: number,
  stats: PuzzleSkillStats,
  solved: boolean,
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

  /*
   * Efficiency:
   *
   * 7×7:
   * 7 moves = 1.00
   * 6 moves = 1.10
   * 5 or fewer = 1.20
   *
   * 5×5 uses the same "moves saved"
   * idea:
   * 5 = 1.00, 4 = 1.10, 3 or fewer = 1.20.
   *
   * The multiplier applies only to the
   * 50-point completion component, not
   * the entire GQ. This keeps one lucky
   * short solve from dominating GQ.
   */
  const efficiencyMultiplier =
    movesSaved >= 2
      ? 1.2
      : movesSaved === 1
        ? 1.1
        : 1;

  const efficiencyLevel:
    0 | 1 | 2 =
      efficiencyMultiplier >= 1.2
        ? 2
        : efficiencyMultiplier >= 1.1
          ? 1
          : 0;

  const completionBase =
    50;

  const reasoningBase =
    50;

  const efficiencyPoints =
    Math.round(
      completionBase *
      efficiencyMultiplier,
    );

  const revealPoints =
    stats.strategicReveals;

  const doubleRevealPoints =
    stats.doubleReveals *
    2;

  const diagonalPoints =
    stats.diagonalMatches *
    2;

  const edgePoints =
    stats.productiveEdgeSwaps *
    2;

  const mysteryFinishPoints =
    stats.mysteryFinishes >
    0
      ? 5
      : 0;

  const score =
    reasoningBase +
    efficiencyPoints +
    revealPoints +
    doubleRevealPoints +
    diagonalPoints +
    edgePoints +
    mysteryFinishPoints;

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

  for (
    let index = 0;
    index <
      stats.strategicReveals;
    index += 1
  ) {
    icons.push(
      "👁️",
    );
  }

  /*
   * One pair represents each Double Reveal.
   * Keep this separate from ordinary reveal
   * icons so the result tells the story.
   */
  for (
    let index = 0;
    index <
      stats.doubleReveals;
    index += 1
  ) {
    icons.push(
      "👁️👁️",
    );
  }

  for (
    let index = 0;
    index <
      stats.diagonalMatches;
    index += 1
  ) {
    icons.push(
      "◇",
    );
  }

  for (
    let index = 0;
    index <
      stats.productiveEdgeSwaps;
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
    efficiencyMultiplier,
    efficiencyLevel,
    icons,
  };
}

interface PublicPuzzle {
  puzzleDate: string;
  puzzleNumber: number;
  stage: PuzzleStage;
  size: number;
  maxMoves: number;
  mysteryCount: number;
  board: Tile[];
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

interface WinnerClaimResponse {
  claimed: boolean;
  alreadyClaimed: boolean;

  winner: {
    name: string;
  };

  error?: string;
}

interface CertificateEmailResponse {
  sent: boolean;
  error?: string;
}

interface LeaderboardEntry {
  rank: number;
  resultId: string;
  name: string;
  gq: number;
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
}

interface SaveResultResponse {
  saved: boolean;
  resultId: string;
  error?: string;
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
}

interface PuzzleProps {
  onClose?: () => void;
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
  "gyan-d1-puzzle-state-v8";


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
  const rowDifference =
    Math.abs(
      first.row -
        second.row,
    );

  const columnDifference =
    Math.abs(
      first.column -
        second.column,
    );

  /*
   * Normal horizontal / vertical neighbor.
   */
  if (
    rowDifference +
      columnDifference ===
    1
  ) {
    return "normal";
  }

  /*
   * Diagonal neighbor.
   */
  if (
    rowDifference === 1 &&
    columnDifference === 1
  ) {
    return "diagonal";
  }

  /*
   * Horizontal edge neighbors.
   *
   * C1 <-> Csize on the same row.
   */
  if (
    first.row ===
      second.row &&
    (
      (
        first.column === 0 &&
        second.column ===
          size - 1
      ) ||
      (
        second.column === 0 &&
        first.column ===
          size - 1
      )
    )
  ) {
    return "edge";
  }

  /*
   * Vertical edge neighbors.
   *
   * R1 <-> Rsize in the same column.
   */
  if (
    first.column ===
      second.column &&
    (
      (
        first.row === 0 &&
        second.row ===
          size - 1
      ) ||
      (
        second.row === 0 &&
        first.row ===
          size - 1
      )
    )
  ) {
    return "edge";
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


function anonymousNameForResultId(
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
    10 +
    (
      hash %
      90
    );

  return `Anonymous ${number}`;
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


function longestMatch(
  board: Tile[],
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
        sameMatchIdentity(
          previous,
          current,
        )
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
        sameMatchIdentity(
          previous,
          current,
        )
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
    const suffix =
      resultId
        ? `?resultId=${encodeURIComponent(
            resultId,
          )}`
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
}: PuzzleProps) {
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
    certificateError,
    setCertificateError,
  ] =
    useState<
      string | null
    >(null);


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
    finalResultId,
    setFinalResultId,
  ] =
    useState<
      string | null
    >(null);

  const [
    resultSaving,
    setResultSaving,
  ] =
    useState(false);


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
   * LOAD
   * ========================================================
   */

  useEffect(() => {
    let cancelled =
      false;

    async function load() {
      try {
        const loaded =
          await fetchPuzzle(
            "5x5",
          );

        if (cancelled) {
          return;
        }

        const saved =
          loadSavedState();

        setPuzzle(
          loaded,
        );

        setStage(
          "5x5",
        );

        setInitialBoard(
          cloneBoard(
            loaded.board,
          ),
        );

        if (
          saved &&
          saved.puzzleNumber ===
            loaded.puzzleNumber &&
          saved.stage ===
            "5x5"
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

          if (
            saved.qualified
          ) {
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
        }

        setMessage(
          "Swipe or tap two squares to swap. Diagonal and opposite-edge swaps are allowed.",
        );
      } catch {
        setMessage(
          "Puzzle unavailable.",
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


  /*
   * ========================================================
   * SAVE
   * ========================================================
   */

  useEffect(() => {
    if (!puzzle) {
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
        stage ===
          "7x7"
          ? finalResultId
          : null,
      );

    setLeaderboard(
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

      setFinalResultId(
        null,
      );

      setLeaderboard(
        null,
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
    if (
      !puzzle ||
      attemptFinished ||
      medalWon ||
      pendingRevealCount >
        0 ||
      moves >=
        puzzle.maxMoves
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

    const longest =
      longestMatch(
        nextBoard,
        puzzle.size,
      );

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
      longest >= 5
    ) {
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
      longest >= 7
    ) {
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
      nextMove >=
      puzzle.maxMoves
    ) {
      finishAttempt();

      return;
    }

    setMessage(
      `${
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

    if (
      Math.abs(dx) >
      Math.abs(dy)
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

    if (
      row < 0 ||
      row >=
        puzzle.size ||
      column < 0 ||
      column >=
        puzzle.size
    ) {
      return;
    }

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
      if (
        !puzzle ||
        stage !==
          "7x7" ||
        !medalWon
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
        anonymousNameForResultId(
          resultId,
        );

      const currentPuzzle =
        puzzle;

      const gq =
        calculateStageGq(
          currentPuzzle.maxMoves,
          moves,
          skillStats,
          true,
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
                      "7x7",
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
      medalWon,
      stage,
      puzzle,
      moves,
      skillStats,
      finalResultId,
    ],
  );


  /*
   * ========================================================
   * EMAIL CERTIFICATE
   * ========================================================
   */

  async function emailCertificate() {
    if (
      !puzzle ||
      stage !==
        "5x5" ||
      !qualified
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
      !validEmail(
        email,
      )
    ) {
      setCertificateError(
        "Please provide a valid email address.",
      );

      return;
    }

    if (
      moveHistory.length ===
      0
    ) {
      setCertificateError(
        "Completion could not be verified. Please solve the puzzle again.",
      );

      return;
    }

    setCertificateSending(
      true,
    );

    setCertificateError(
      null,
    );

    setCertificateSent(
      false,
    );

    try {
      const response =
        await fetch(
          "/api/puzzle/certificate",
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

                name,

                email,

                moves:
                  moveHistory,
              }),
          },
        );

      const data =
        (await response.json()) as
          CertificateEmailResponse;

      if (
        !response.ok ||
        !data.sent
      ) {
        throw new Error(
          data.error ??
            "Unable to send certificate.",
        );
      }

      setCertificateSent(
        true,
      );

      setMessage(
        "✉️ Certificate sent!",
      );
    } catch (
      error
    ) {
      setCertificateError(
        error instanceof
        Error
          ? error.message
          : "Unable to send certificate.",
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
    if (!puzzle) {
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
      !validEmail(
        email,
      )
    ) {
      setMedalError(
        "Please enter a valid email.",
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
          "/api/puzzle/winner",
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

                name,

                email,

                resultId:
                  finalResultId ??
                  undefined,
              }),
          },
        );

      const data =
        (await response.json()) as
          WinnerClaimResponse;

      if (
        !response.ok
      ) {
        throw new Error(
          data.error ??
            "Unable to claim medal.",
        );
      }

      setMedalClaimed(
        true,
      );

      setMedalClaimName(
        data.winner.name,
      );

      setMessage(
        data.alreadyClaimed
          ? "🏅 This medal was already saved."
          : "🏅 Medal claimed!",
      );

      if (
        stage ===
          "7x7"
      ) {
        const nextLeaderboard =
          await fetchLeaderboard(
            puzzle.puzzleNumber,
            finalResultId,
          );

        setLeaderboard(
          nextLeaderboard,
        );
      }
    } catch (
      error
    ) {
      setMedalError(
        error instanceof
        Error
          ? error.message
          : "Unable to claim medal.",
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


  /*
   * ========================================================
   * EARLY RETURNS
   * ========================================================
   */

  if (!visible) {
    return null;
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

  const currentGq =
    calculateStageGq(
      puzzle.maxMoves,
      moves,
      skillStats,
      solvedStage,
    );


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

      <header className="daily-puzzle__header">
        <span>
          {stage ===
          "5x5"
            ? "Puzzle of the Day"
            : "GYAN Final"}
        </span>

        <strong>
          #
          {
            puzzle.puzzleNumber
          }
          {stage ===
            "5x5"
            ? " (5×5)"
            : ""}
        </strong>
      </header>


      {stage ===
      "5x5" ? (
        <div className="daily-puzzle__winner">
          🎯 Qualifier ·
          5×5 Round
        </div>
      ) : (
        <div className="daily-puzzle__winner">
          🏆 Qualified ·
          7×7 Championship
        </div>
      )}

      <button
        type="button"
        className="daily-puzzle__all-winners"
        onClick={() =>
          void openWinners()
        }
        style={{
          display:
            "block",
          margin:
            "3px auto 6px",
          padding:
            0,
          border:
            0,
          background:
            "transparent",
          font:
            "inherit",
          fontSize:
            "0.7rem",
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



      {!medalWon && (
        <div className="daily-puzzle__board-shell">
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
                    style={
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
                        : undefined
                    }
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


      {!medalWon && (
        <div className="daily-puzzle__moves">
          Move{" "}
          {moves}
          {" / "}
          {
            puzzle.maxMoves
          }
        </div>
      )}

            {stage ===
        "5x5" && (
        <div className="daily-puzzle__attempts-row">
          <strong>
            Attempts
          </strong>

          <div
            className="daily-puzzle__lives"
            aria-label={`${chancesRemaining} attempts remaining`}
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
                />
              ),
            )}
          </div>

          <span className="daily-puzzle__attempts-left">
            {
              chancesRemaining
            }{" "}
            left
          </span>
        </div>
      )}

      <div className="daily-puzzle__message">
        {message}
      </div>


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


      {medalWon && (
        <section className="daily-puzzle__medal">
          <div className="daily-puzzle__medal-icon">
            🏅
          </div>

          {medalClaimed ? (
            <>
              <strong>
                Medal claimed!
              </strong>

              <span>
                GYAN Puzzle #
                {
                  puzzle.puzzleNumber
                }
              </span>

              <p>
                Congratulations{" "}

                <strong>
                  {
                    medalClaimName
                  }
                </strong>
                .
              </p>

              <small>
                Your medal has been saved and your
                leaderboard name has been updated.
              </small>
            </>
          ) : (
            <>
              <strong>
                Medal earned!
              </strong>

              <span>
                GYAN Puzzle #
                {
                  puzzle.puzzleNumber
                }
              </span>

              <p>
                You completed the 7×7 Final.
              </p>

              <div
                className="daily-puzzle__medal-form"
                style={{
                  display:
                    "grid",
                  gridTemplateColumns:
                    "minmax(0, 2fr) minmax(0, 2fr) minmax(76px, 1fr)",
                  gap:
                    "6px",
                  alignItems:
                    "center",
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
                  aria-label="Display name"
                  placeholder="Name"
                  disabled={
                    claimingMedal
                  }
                  onChange={(
                    event,
                  ) => {
                    setWinnerName(
                      event.target
                        .value,
                    );

                    setMedalError(
                      null,
                    );
                  }}
                />

                <input
                  type="email"
                  value={
                    winnerEmail
                  }
                  maxLength={
                    160
                  }
                  autoComplete="email"
                  aria-label="Email"
                  placeholder="Email"
                  disabled={
                    claimingMedal
                  }
                  onChange={(
                    event,
                  ) => {
                    setWinnerEmail(
                      event.target
                        .value,
                    );

                    setMedalError(
                      null,
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

                      void claimMedal();
                    }
                  }}
                />

                <button
                  type="button"
                  disabled={
                    claimingMedal
                  }
                  onClick={() =>
                    void claimMedal()
                  }
                  style={{
                    minWidth:
                      0,
                    padding:
                      "8px 5px",
                    whiteSpace:
                      "nowrap",
                  }}
                >
                  {claimingMedal
                    ? "…"
                    : "🏅 Claim"}
                </button>
              </div>

              {medalError && (
                <div className="daily-puzzle__medal-error">
                  {
                    medalError
                  }
                </div>
              )}

              <small>
                Without claiming, your result remains
                under its Anonymous name. Email stays private.
              </small>
            </>
          )}
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


      <footer className="daily-puzzle__footer">
        <span>
          🗓 New puzzle tomorrow
        </span>

        <span>
          🏅 Medals: 0 / 7
        </span>
      </footer>


      {/* =================================================
          5×5 CERTIFICATE
          ================================================= */}

      {qualified &&
        stage ===
          "5x5" &&
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
              }}
            >

              <div className="daily-puzzle__certificate-top">
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

                    <small>
                      Daily Puzzle
                    </small>
                  </div>
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


              <div className="daily-puzzle__certificate-title">
                <small>
                  CERTIFICATE OF COMPLETION
                </small>

                <strong>
                  🎓 Puzzle Solver
                </strong>

                <span>
                  GYAN Puzzle #
                  {
                    puzzle.puzzleNumber
                  }
                  {" (5×5)"}
                </span>
              </div>


              <div
                className="daily-puzzle__certificate-grid"
                style={{
                  gridTemplateColumns:
                    "repeat(5, 1fr)",
                }}
                aria-label="Solved 5 by 5 puzzle"
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
                      ].join(" ")}
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
                    "10px auto 8px",
                  padding:
                    "9px 10px",
                  border:
                    "1px solid rgba(0,0,0,0.12)",
                  borderRadius:
                    "10px",
                  textAlign:
                    "center",
                  background:
                    "rgba(255,255,255,0.78)",
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
                  5×5 GQ{" "}
                  {
                    currentGq.score
                  }
                </strong>

                {currentGq.icons.length >
                  0 && (
                  <span
                    style={{
                      marginLeft:
                        "6px",
                      fontSize:
                        "0.82rem",
                    }}
                    aria-label="GQ achievement icons"
                  >
                    {
                      currentGq.icons.join(
                        " ",
                      )
                    }
                  </span>
                )}

                <div>
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
                        "5px 9px",
                      borderRadius:
                        "999px",
                      border:
                        "1px solid rgba(0,0,0,0.14)",
                      background:
                        "rgba(255,255,255,0.82)",
                      font:
                        "inherit",
                      fontSize:
                        "0.7rem",
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
                </div>

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
                      "5px",
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
                    👁️ chosen reveal ·
                    👁️👁️ double reveal ·
                    ◇ diagonal match ·
                    ↔ productive edge move ·
                    ❓ mystery finish
                  </div>
                </details>
              </div>

              <div className="daily-puzzle__certificate-actions">
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
                  🏆 Play 7×7 & join winners
                </button>


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
                      "center",
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
                    disabled={
                      certificateSending
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

                      setCertificateSent(
                        false,
                      );
                    }}
                  />

                  <input
                    type="email"
                    value={
                      certificateEmail
                    }
                    maxLength={
                      160
                    }
                    autoComplete="email"
                    placeholder="Email"
                    aria-label="Email address for certificate"
                    disabled={
                      certificateSending
                    }
                    onChange={(
                      event,
                    ) => {
                      setCertificateEmail(
                        event.target
                          .value,
                      );

                      setCertificateError(
                        null,
                      );

                      setCertificateSent(
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

                        void emailCertificate();
                      }
                    }}
                  />

                  <button
                    type="button"
                    className="daily-puzzle__certificate-email-icon"
                    aria-label="Email certificate"
                    title="Email certificate"
                    disabled={
                      certificateSending
                    }
                    onClick={() =>
                      void emailCertificate()
                    }
                    style={{
                      minWidth:
                        0,
                      padding:
                        "8px 5px",
                      whiteSpace:
                        "nowrap",
                    }}
                  >
                    {certificateSending
                      ? "…"
                      : certificateSent
                        ? "✓ Sent"
                        : "✉️ Send"}
                  </button>
                </div>


                {certificateError && (
                  <div className="daily-puzzle__certificate-error">
                    {
                      certificateError
                    }
                  </div>
                )}

                {certificateSent && (
                  <div className="daily-puzzle__certificate-sent">
                    ✓ Certificate sent to{" "}
                    {
                      certificateEmail
                    }
                  </div>
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
              "absolute",
            top:
              "52px",
            left:
              "8px",
            right:
              "8px",
            zIndex:
              40,
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
              margin:
                "0 auto",
              maxWidth:
                "520px",
              maxHeight:
                "70vh",
              overflowY:
                "auto",
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
              🏆 7×7 GQ Leaders
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
              Rankings are based on the 7×7 Championship Final.
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
                  <div className="daily-puzzle__recent-winners">
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
                              entry.resultId
                            }
                            className="daily-puzzle__recent-winner"
                            style={{
                              display:
                                "grid",
                              gridTemplateColumns:
                                "34px minmax(0,1fr) auto",
                              gap:
                                "6px",
                              alignItems:
                                "center",
                              padding:
                                "5px 0",
                            }}
                          >
                            <span>
                              {medal}
                            </span>

                            <strong>
                              {
                                entry.name
                              }
                              {isYou
                                ? " (You)"
                                : ""}
                            </strong>

                            <span
                              style={{
                                textAlign:
                                  "right",
                                whiteSpace:
                                  "nowrap",
                              }}
                            >
                              GQ{" "}
                              {
                                entry.gq
                              }
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
                  </div>

                  {leaderboard.yourRank !==
                    null &&
                    leaderboard.yourScore !==
                      null && (
                    <div
                      className="daily-puzzle__winner-count"
                      style={{
                        marginTop:
                          "8px",
                      }}
                    >
                      Your rank: #
                      {
                        leaderboard.yourRank
                      }
                      {" · GQ "}
                      {
                        leaderboard.yourScore
                      }
                    </div>
                  )}
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