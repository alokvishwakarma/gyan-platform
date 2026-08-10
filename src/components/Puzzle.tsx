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
}

interface Position {
  row: number;
  column: number;
}

interface PuzzleMove {
  from: Position;
  to: Position;
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

interface PublicWinner {
  name: string;
  claimedAt: string;
}

interface WinnerSummary {
  puzzleNumber: number;
  count: number;

  firstWinner:
    | PublicWinner
    | null;

  latestWinner:
    | PublicWinner
    | null;

  recentWinners:
    PublicWinner[];
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
  "gyan-d1-puzzle-state-v4";


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

function adjacent(
  first: Position,
  second: Position,
): boolean {
  return (
    Math.abs(
      first.row -
        second.row,
    ) +
      Math.abs(
        first.column -
          second.column,
      ) ===
    1
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


/*
 * ========================================================
 * MATCH DETECTION
 * ========================================================
 */

function findVisibleMatchSignatures(
  board: Tile[],
  size: number,
): Set<string> {
  const matches =
    new Set<string>();

  /*
   * Horizontal runs.
   */
  for (
    let row = 0;
    row < size;
    row += 1
  ) {
    let column = 0;

    while (
      column < size
    ) {
      const start =
        column;

      const first =
        board[
          indexOf(
            row,
            column,
            size,
          )
        ];

      if (
        first.hidden ||
        !first.color
      ) {
        column += 1;
        continue;
      }

      const color =
        first.color;

      column += 1;

      while (
        column < size
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
          current.hidden ||
          current.color !==
            color
        ) {
          break;
        }

        column += 1;
      }

      const length =
        column - start;

      if (
        length >= 3
      ) {
        matches.add(
          [
            "H",
            row,
            start,
            column - 1,
            color,
          ].join(":"),
        );
      }
    }
  }

  /*
   * Vertical runs.
   */
  for (
    let column = 0;
    column < size;
    column += 1
  ) {
    let row = 0;

    while (
      row < size
    ) {
      const start =
        row;

      const first =
        board[
          indexOf(
            row,
            column,
            size,
          )
        ];

      if (
        first.hidden ||
        !first.color
      ) {
        row += 1;
        continue;
      }

      const color =
        first.color;

      row += 1;

      while (
        row < size
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
          current.hidden ||
          current.color !==
            color
        ) {
          break;
        }

        row += 1;
      }

      const length =
        row - start;

      if (
        length >= 3
      ) {
        matches.add(
          [
            "V",
            column,
            start,
            row - 1,
            color,
          ].join(":"),
        );
      }
    }
  }

  return matches;
}


function longestVisibleMatch(
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
        !previous.hidden &&
        !current.hidden &&
        previous.color &&
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
        previous.color &&
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

async function fetchWinnerSummary(
  puzzleNumber: number,
): Promise<
  WinnerSummary | null
> {
  try {
    const response =
      await fetch(
        `/api/puzzle/${puzzleNumber}/winners`,
      );

    if (!response.ok) {
      return null;
    }

    return (
      await response.json()
    ) as WinnerSummary;
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
    justRevealedTileIds,
    setJustRevealedTileIds,
  ] =
    useState<
      number[]
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
    showMedalForm,
    setShowMedalForm,
  ] =
    useState(false);

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
    winnerSummary,
    setWinnerSummary,
  ] =
    useState<
      WinnerSummary | null
    >(null);

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
        }

        const summary =
          await fetchWinnerSummary(
            loaded.puzzleNumber,
          );

        if (!cancelled) {
          setWinnerSummary(
            summary,
          );
        }

        setMessage(
          "Swipe a square to swap with its neighbor.",
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

  async function refreshWinners() {
    if (!puzzle) {
      return;
    }

    setWinnersLoading(
      true,
    );

    const summary =
      await fetchWinnerSummary(
        puzzle.puzzleNumber,
      );

    setWinnerSummary(
      summary,
    );

    setWinnersLoading(
      false,
    );
  }

  async function openWinners() {
    await refreshWinners();

    setWinnersOpen(
      true,
    );
  }


  /*
   * ========================================================
   * SERVER MYSTERY REVEAL
   * ========================================================
   */

  async function checkReveals(
    currentBoard:
      Tile[],
  ): Promise<
    RevealResult
  > {
    if (!puzzle) {
      return {
        board:
          currentBoard,

        count: 0,

        revealedTileIds:
          [],
      };
    }

    const response =
      await fetch(
        "/api/puzzle/check-reveals",
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

            return {
              id:
                tile.id,

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

      setMedalWon(
        false,
      );

      setMedalClaimed(
        false,
      );

      setShowMedalForm(
        false,
      );

      setWinnerName(
        "",
      );

      setWinnerEmail(
        "",
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
      moves >=
        puzzle.maxMoves
    ) {
      return;
    }

    if (
      !adjacent(
        first,
        second,
      )
    ) {
      return;
    }

    const matchesBefore =
      findVisibleMatchSignatures(
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

    const matchesAfter =
      findVisibleMatchSignatures(
        nextBoard,
        puzzle.size,
      );

    const createdNewMatch =
      [...matchesAfter].some(
        (match) =>
          !matchesBefore.has(
            match,
          ),
      );

    const revealResult =
      createdNewMatch
        ? await checkReveals(
            nextBoard,
          )
        : {
            board:
              nextBoard,

            count: 0,

            revealedTileIds:
              [],
          };

    nextBoard =
      revealResult.board;

    const longest =
      longestVisibleMatch(
        nextBoard,
        puzzle.size,
      );

    setBoard(
      nextBoard,
    );

    animateRevealedTiles(
      revealResult
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

    if (
      revealResult.count >
      0
    ) {
      setMessage(
        revealResult.count ===
          1
          ? "✨ Mystery revealed!"
          : `✨ ${revealResult.count} mysteries revealed!`,
      );
    }


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
        "🎉 5×5 complete!",
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
      setMedalWon(
        true,
      );

      setAttemptFinished(
        true,
      );

      setMessage(
        "🏅 Winner! Claim your medal.",
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

    if (
      revealResult.count ===
      0
    ) {
      setMessage(
        `${
          puzzle.maxMoves -
          nextMove
        } moves remaining.`,
      );
    }
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
      adjacent(
        selected,
        clicked,
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
      !puzzle
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

    const email =
      certificateEmail
        .trim()
        .toLowerCase();

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

      setShowMedalForm(
        false,
      );

      setMessage(
        data.alreadyClaimed
          ? "🏅 This medal was already saved."
          : "🏅 Medal claimed!",
      );

      const summary =
        await fetchWinnerSummary(
          puzzle.puzzleNumber,
        );

      setWinnerSummary(
        summary,
      );
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


  /*
   * ========================================================
   * UI
   * ========================================================
   */

  return (
    <section
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
        </strong>
      </header>


      {stage ===
      "5x5" ? (
        <div className="daily-puzzle__winner-row">
          <div className="daily-puzzle__winner">
            {winnerSummary
              ?.latestWinner ? (
              <>
                🏆 Latest Winner:{" "}

                <strong>
                  {
                    winnerSummary
                      .latestWinner
                      .name
                  }
                </strong>
              </>
            ) : (
              <>
                🏆 Be today's first winner!
              </>
            )}
          </div>

          {winnerSummary &&
            winnerSummary.count >
              0 && (
              <button
                type="button"
                className="daily-puzzle__all-winners"
                onClick={() =>
                  void openWinners()
                }
              >
                All winners
              </button>
            )}
        </div>
      ) : (
        <div className="daily-puzzle__winner">
          🏆 Qualified ·
          7×7 Championship
        </div>
      )}





      {!medalWon && (
        <div className="daily-puzzle__board-shell">
          <div
            className={[
              "daily-puzzle__board",

              attemptFinished &&
              !qualified
                ? "daily-puzzle__board--blurred"
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
                    ].join(" ")}
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
                Your medal has been saved.
              </small>
            </>
          ) : !showMedalForm ? (
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

              <button
                type="button"
                onClick={() => {
                  setShowMedalForm(
                    true,
                  );

                  setMedalError(
                    null,
                  );
                }}
              >
                Claim My Medal
              </button>
            </>
          ) : (
            <>
              <strong>
                Claim your medal
              </strong>

              <span>
                Save your GYAN medal.
              </span>

              <div className="daily-puzzle__medal-form">
                <label>
                  <span>
                    Display name
                  </span>

                  <input
                    type="text"
                    value={
                      winnerName
                    }
                    maxLength={
                      80
                    }
                    autoComplete="name"
                    placeholder="Name shown to players"
                    onChange={(
                      event,
                    ) =>
                      setWinnerName(
                        event
                          .target
                          .value,
                      )
                    }
                  />
                </label>

                <label>
                  <span>
                    Email
                  </span>

                  <input
                    type="email"
                    value={
                      winnerEmail
                    }
                    maxLength={
                      160
                    }
                    autoComplete="email"
                    placeholder="you@example.com"
                    onChange={(
                      event,
                    ) =>
                      setWinnerEmail(
                        event
                          .target
                          .value,
                      )
                    }
                  />
                </label>

                {medalError && (
                  <div className="daily-puzzle__medal-error">
                    {
                      medalError
                    }
                  </div>
                )}

                <button
                  type="button"
                  disabled={
                    claimingMedal
                  }
                  onClick={() =>
                    void claimMedal()
                  }
                >
                  {claimingMedal
                    ? "Saving…"
                    : "🏅 Claim Medal"}
                </button>

                <button
                  type="button"
                  className="daily-puzzle__medal-cancel"
                  disabled={
                    claimingMedal
                  }
                  onClick={() => {
                    setShowMedalForm(
                      false,
                    );

                    setMedalError(
                      null,
                    );
                  }}
                >
                  Cancel
                </button>
              </div>

              <small>
                Your display name may appear in the winners list.
                Email stays private.
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

            reveal 1 mystery
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
                  🏆 Play 7×7 Final
                </button>


                <div className="daily-puzzle__certificate-email-row">
                  <input
                    type="email"
                    value={
                      certificateEmail
                    }
                    maxLength={
                      160
                    }
                    autoComplete="email"
                    placeholder="Provide email to send certificate"
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
                  >
                    {certificateSending
                      ? "…"
                      : certificateSent
                        ? "✓"
                        : "✉️"}
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
          WINNERS
          ================================================= */}

      {winnersOpen && (
        <div
          className="daily-puzzle__winner-overlay"
          role="dialog"
          aria-modal="true"
          aria-label="Puzzle winners"
          onClick={() =>
            setWinnersOpen(
              false,
            )
          }
        >
          <section
            className="daily-puzzle__winner-panel"
            onClick={(
              event,
            ) =>
              event.stopPropagation()
            }
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
              Puzzle #
              {
                puzzle.puzzleNumber
              }
              {" "}
              Winners
            </h3>

            {winnersLoading ? (
              <p className="daily-puzzle__winner-panel-message">
                Loading winners…
              </p>
            ) : winnerSummary &&
              winnerSummary.count >
                0 ? (
              <>
                <div className="daily-puzzle__first-winner">
                  <span>
                    🏆 First Winner
                  </span>

                  <strong>
                    {
                      winnerSummary
                        .firstWinner
                        ?.name
                    }
                  </strong>
                </div>

                <div className="daily-puzzle__recent-winners">
                  <span className="daily-puzzle__recent-title">
                    Most recent
                  </span>

                  {winnerSummary
                    .recentWinners
                    .map(
                      (
                        winner,
                        index,
                      ) => (
                        <div
                          key={`${winner.name}-${winner.claimedAt}-${index}`}
                          className="daily-puzzle__recent-winner"
                        >
                          <span>
                            {
                              index +
                              1
                            }.
                          </span>

                          <strong>
                            {
                              winner.name
                            }
                          </strong>
                        </div>
                      ),
                    )}
                </div>

                <div className="daily-puzzle__winner-count">
                  🏅{" "}
                  {
                    winnerSummary.count
                  }{" "}
                  {winnerSummary.count ===
                  1
                    ? "winner"
                    : "winners"}{" "}
                  today
                </div>
              </>
            ) : (
              <p className="daily-puzzle__winner-panel-message">
                No winners yet.
              </p>
            )}
          </section>
        </div>
      )}
    </section>
  );
}