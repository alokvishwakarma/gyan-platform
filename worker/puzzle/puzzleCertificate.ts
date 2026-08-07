import QRCode
  from "qrcode";

import {
  revealEligibleMysteries,

  type PuzzleTile,
} from "./puzzleGenerator";

import {
  renderPuzzleCertificateEmail,
} from "../emailTemplates/puzzleCertificateEmail";


interface Position {
  row: number;
  column: number;
}


interface PuzzleMove {
  from: Position;
  to: Position;
}


interface PuzzleRow {
  puzzle_number: number;

  puzzle_date: string;

  board_size: number;

  max_moves: number;

  start_board_json: string;

  verified: number;

  status: string;
}


interface CertificateRequest {
  puzzleNumber?: unknown;

  email?: unknown;

  moves?: unknown;
}


interface ResendResult {
  id?: string;

  message?: string;

  error?: {
    message?: string;
  };
}


const ADMIN_EMAIL =
  "admin@gyan.cc";


/*
 * ========================================================
 * RESPONSE
 * ========================================================
 */

function jsonResponse(
  data: unknown,
  status = 200,
): Response {
  return new Response(
    JSON.stringify(
      data,
    ),
    {
      status,

      headers: {
        "content-type":
          "application/json; charset=utf-8",

        "cache-control":
          "no-store",
      },
    },
  );
}


/*
 * ========================================================
 * INPUT VALIDATION
 * ========================================================
 */

function normalizeEmail(
  value: unknown,
): string | null {
  if (
    typeof value !==
    "string"
  ) {
    return null;
  }

  const normalized =
    value
      .trim()
      .toLowerCase();

  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
    normalized,
  )
    ? normalized
    : null;
}


function normalizePuzzleNumber(
  value: unknown,
): number | null {
  if (
    typeof value !==
      "number" ||
    !Number.isInteger(
      value,
    ) ||
    value <= 0
  ) {
    return null;
  }

  return value;
}


function normalizePosition(
  value: unknown,
): Position | null {
  if (
    typeof value !==
      "object" ||
    value === null ||
    Array.isArray(
      value,
    )
  ) {
    return null;
  }

  const candidate =
    value as {
      row?: unknown;
      column?: unknown;
    };

  if (
    typeof candidate.row !==
      "number" ||
    typeof candidate.column !==
      "number" ||
    !Number.isInteger(
      candidate.row,
    ) ||
    !Number.isInteger(
      candidate.column,
    )
  ) {
    return null;
  }

  return {
    row:
      candidate.row,

    column:
      candidate.column,
  };
}


function normalizeMoves(
  value: unknown,
): PuzzleMove[] | null {
  if (
    !Array.isArray(
      value,
    )
  ) {
    return null;
  }

  const moves:
    PuzzleMove[] = [];

  for (
    const item of value
  ) {
    if (
      typeof item !==
        "object" ||
      item === null ||
      Array.isArray(
        item,
      )
    ) {
      return null;
    }

    const candidate =
      item as {
        from?: unknown;
        to?: unknown;
      };

    const from =
      normalizePosition(
        candidate.from,
      );

    const to =
      normalizePosition(
        candidate.to,
      );

    if (
      !from ||
      !to
    ) {
      return null;
    }

    moves.push({
      from,
      to,
    });
  }

  return moves;
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


function validPosition(
  position: Position,
  size: number,
): boolean {
  return (
    position.row >= 0 &&
    position.row < size &&
    position.column >= 0 &&
    position.column < size
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


/*
 * ========================================================
 * MATCH DETECTION
 * ========================================================
 */

function longestVisibleMatch(
  board: PuzzleTile[],
  size: number,
): number {
  let best = 1;


  /*
   * Horizontal
   */
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


  /*
   * Vertical
   */
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
 * LOAD PUZZLE
 * ========================================================
 */

async function loadPuzzle(
  env: Env,
  puzzleNumber: number,
): Promise<
  PuzzleRow | null
> {
  return env.gyan_registry
    .prepare(
      `
      SELECT
        puzzle_number,
        puzzle_date,
        board_size,
        max_moves,
        start_board_json,
        verified,
        status

      FROM daily_puzzles

      WHERE
        puzzle_number = ?
        AND stage = '5x5'
        AND verified = 1
        AND status = 'published'

      LIMIT 1
      `,
    )
    .bind(
      puzzleNumber,
    )
    .first<PuzzleRow>();
}


/*
 * ========================================================
 * SERVER-SIDE COMPLETION VERIFICATION
 *
 * Never trust React's "qualified" state.
 *
 * Replay the player's submitted moves against
 * the authoritative D1 starting board.
 * ========================================================
 */

function replaySolution(
  row: PuzzleRow,
  moves: PuzzleMove[],
): PuzzleTile[] | null {
  if (
    row.board_size !==
      5 ||
    moves.length ===
      0 ||
    moves.length >
      row.max_moves
  ) {
    return null;
  }

  let board =
    JSON.parse(
      row.start_board_json,
    ) as PuzzleTile[];

  board =
    cloneBoard(
      board,
    );


  for (
    const move of
    moves
  ) {
    if (
      !validPosition(
        move.from,
        row.board_size,
      ) ||
      !validPosition(
        move.to,
        row.board_size,
      ) ||
      !adjacent(
        move.from,
        move.to,
      )
    ) {
      return null;
    }


    board =
      swap(
        board,
        move,
        row.board_size,
      );


    /*
     * Use exactly the same Mystery
     * reveal rules used by the game.
     */
    board =
      revealEligibleMysteries(
        board,
        row.board_size,
      );
  }


  if (
    longestVisibleMatch(
      board,
      row.board_size,
    ) <
    row.board_size
  ) {
    return null;
  }


  return board;
}


/*
 * ========================================================
 * QR MATRIX
 *
 * QRCode.create() is pure JavaScript.
 *
 * It does NOT require Canvas.
 * ========================================================
 */

function createQrModules():
  boolean[][] {
  const qr =
    QRCode.create(
      "https://gyan.cc",
      {
        errorCorrectionLevel:
          "M",
      },
    );

  const modules:
    boolean[][] = [];


  for (
    let row = 0;
    row <
    qr.modules.size;
    row += 1
  ) {
    const moduleRow:
      boolean[] = [];


    for (
      let column = 0;
      column <
      qr.modules.size;
      column += 1
    ) {
moduleRow.push(
  qr.modules.get(
    row,
    column,
  ) === 1,
);
    }


    modules.push(
      moduleRow,
    );
  }


  return modules;
}


/*
 * ========================================================
 * SEND CERTIFICATE
 * ========================================================
 */

async function sendCertificate(
  env: Env,
  email: string,
  row: PuzzleRow,
  solvedBoard:
    PuzzleTile[],
): Promise<{
  sent: boolean;
  reason?: string;
}> {
  if (
    !env.RESEND_API_KEY
  ) {
    return {
      sent: false,

      reason:
        "RESEND_API_KEY is not configured.",
    };
  }


  /*
   * Generate QR as matrix.
   *
   * No canvas / PNG generation.
   */
  const qrModules =
    createQrModules();


  const rendered =
    renderPuzzleCertificateEmail({
      puzzleNumber:
        row.puzzle_number,

      puzzleDate:
        row.puzzle_date,

      board:
        solvedBoard,

      qrModules,
    });


  /*
   * If the certificate itself is
   * being sent to admin@gyan.cc,
   * don't BCC the same address.
   */
  const bcc =
    email ===
      ADMIN_EMAIL
      ? undefined
      : [
          ADMIN_EMAIL,
        ];


  try {
    const response =
      await fetch(
        "https://api.resend.com/emails",
        {
          method:
            "POST",

          headers: {
            authorization:
              `Bearer ${env.RESEND_API_KEY}`,

            "content-type":
              "application/json",
          },

          body:
            JSON.stringify({
              from:
                "GYAN Puzzle <admin@gyan.cc>",

              to: [
                email,
              ],

              bcc,

              subject:
                rendered.subject,

              html:
                rendered.html,

              text:
                rendered.text,
            }),
        },
      );


    const result =
      (await response.json()) as
        ResendResult;


    if (
      !response.ok
    ) {
      return {
        sent: false,

        reason:
          result.message ??
          result.error
            ?.message ??
          "The email provider rejected the message.",
      };
    }


    return {
      sent: true,
    };
  } catch (
    error
  ) {
    return {
      sent: false,

      reason:
        error instanceof
        Error
          ? error.message
          : "Unexpected email error.",
    };
  }
}


/*
 * ========================================================
 * ROUTE
 *
 * POST /api/puzzle/certificate
 * ========================================================
 */

export async function handlePuzzleCertificateRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    request.method !==
      "POST" ||
    url.pathname !==
      "/api/puzzle/certificate"
  ) {
    return null;
  }


  let body:
    CertificateRequest;


  try {
    body =
      (await request.json()) as
        CertificateRequest;
  } catch {
    return jsonResponse(
      {
        sent: false,

        error:
          "Request body must be valid JSON.",
      },
      400,
    );
  }


  const puzzleNumber =
    normalizePuzzleNumber(
      body.puzzleNumber,
    );


  const email =
    normalizeEmail(
      body.email,
    );


  const moves =
    normalizeMoves(
      body.moves,
    );


  if (
    !puzzleNumber
  ) {
    return jsonResponse(
      {
        sent: false,

        error:
          "Invalid puzzle number.",
      },
      400,
    );
  }


  if (
    !email
  ) {
    return jsonResponse(
      {
        sent: false,

        error:
          "Please provide a valid email address.",
      },
      400,
    );
  }


  if (
    !moves
  ) {
    return jsonResponse(
      {
        sent: false,

        error:
          "Invalid puzzle moves.",
      },
      400,
    );
  }


  const row =
    await loadPuzzle(
      env,
      puzzleNumber,
    );


  if (!row) {
    return jsonResponse(
      {
        sent: false,

        error:
          "Puzzle not found.",
      },
      404,
    );
  }


  /*
   * Server independently verifies
   * the submitted solution.
   */
  const solvedBoard =
    replaySolution(
      row,
      moves,
    );


  if (
    !solvedBoard
  ) {
    return jsonResponse(
      {
        sent: false,

        error:
          "Puzzle completion could not be verified.",
      },
      403,
    );
  }


  const delivery =
    await sendCertificate(
      env,
      email,
      row,
      solvedBoard,
    );


  if (
    !delivery.sent
  ) {
    console.error(
      "Puzzle certificate email failed:",
      delivery.reason,
    );

    return jsonResponse(
      {
        sent: false,

        error:
          "Certificate could not be sent.",
      },
      502,
    );
  }


  return jsonResponse({
    sent: true,
  });
}