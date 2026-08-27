import {
  sendPuzzleCompletionEmail,
} from "./puzzleCompletionEmail";

import {
  currentGyanAccount,
} from "../gyanAccountContext";

import {
  generateDailyPuzzlePair,
  puzzleModeFor,

  type GeneratedPuzzle,
  type PuzzleStage,
  type PuzzleTile,
  type TileColor,
} from "./puzzleGenerator";

interface PuzzleRow {
  puzzle_date: string;
  puzzle_number: number;
  stage: PuzzleStage;
  board_size: number;
  max_moves: number;
  mystery_count: number;
  start_board_json: string;
  solved_board_json: string;
  verified: number;
  status: string;
}

interface PublicBoardTile {
  id: number;
  hidden: boolean;
  color?: TileColor;

  /*
   * Opaque equality identity.
   *
   * This is intentionally not a security
   * boundary. It hides literal secret color
   * names from casual inspection while
   * allowing the browser to compare tiles.
   */
  matchCode: string;
}

interface ClientBoardTile {
  id: number;
  hidden: boolean;
  color?: TileColor;
}

function jsonResponse(
  data: unknown,
  status = 200,
): Response {
  return new Response(
    JSON.stringify(data),
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

function mapPublicPuzzle(
  row: PuzzleRow,
) {
  const board =
    JSON.parse(
      row.start_board_json,
    ) as PuzzleTile[];

  /*
   * Generate a fresh opaque equality code for
   * each color every time the puzzle payload
   * is created.
   *
   * The browser can compare codes, including
   * on mystery tiles, without receiving the
   * literal hidden color.
   *
   * NOTE:
   * This is client-side obfuscation, not
   * cryptographic anti-cheat. Hybrid/server
   * validation can replace it later without
   * changing the Puzzle UI contract.
   */
  const matchCodes =
    new Map<
      TileColor,
      string
    >();

  for (
    const tile of board
  ) {
    if (
      !matchCodes.has(
        tile.color,
      )
    ) {
      matchCodes.set(
        tile.color,
        crypto.randomUUID(),
      );
    }
  }

  const publicBoard:
    PublicBoardTile[] =
    board.map(
      (tile) => {
        const matchCode =
          matchCodes.get(
            tile.color,
          );

        if (!matchCode) {
          throw new Error(
            "Unable to build puzzle match identity.",
          );
        }

        return tile.hidden
          ? {
              id: tile.id,
              hidden: true,
              matchCode,
            }
          : {
              id: tile.id,
              hidden: false,
              color: tile.color,
              matchCode,
            };
      },
    );

  return {
    puzzleDate:
      row.puzzle_date,

    puzzleNumber:
      row.puzzle_number,

    stage:
      row.stage,

    size:
      row.board_size,

    maxMoves:
      row.max_moves,

    mysteryCount:
      row.mystery_count,

    mode:
      puzzleModeFor(
        row.puzzle_date,
        row.puzzle_number,
      ),

    board:
      publicBoard,
  };
}


async function loadByNumber(
  env: Env,
  puzzleNumber: number,
  stage: PuzzleStage,
): Promise<PuzzleRow | null> {
  return env.gyan_registry
    .prepare(
      `
      SELECT
        puzzle_date,
        puzzle_number,
        stage,
        board_size,
        max_moves,
        mystery_count,
        start_board_json,
        solved_board_json,
        verified,
        status

      FROM daily_puzzles

      WHERE
        puzzle_number = ?
        AND stage = ?
        AND verified = 1
        AND status = 'published'
        AND puzzle_date <= ?

      LIMIT 1
      `,
    )
    .bind(
      puzzleNumber,
      stage,
      localDateKey(),
    )
    .first<PuzzleRow>();
}

async function loadPublishedByDate(
  env: Env,
  puzzleDate: string,
  stage: PuzzleStage,
): Promise<PuzzleRow | null> {
  return env.gyan_registry
    .prepare(
      `
      SELECT
        puzzle_date,
        puzzle_number,
        stage,
        board_size,
        max_moves,
        mystery_count,
        start_board_json,
        solved_board_json,
        verified,
        status

      FROM daily_puzzles

      WHERE
        puzzle_date = ?
        AND stage = ?
        AND verified = 1
        AND status = 'published'

      LIMIT 1
      `,
    )
    .bind(
      puzzleDate,
      stage,
    )
    .first<PuzzleRow>();
}

function localDateKey(): string {
  const now =
    new Date();

  const year =
    now.getFullYear();

  const month =
    String(
      now.getMonth() + 1,
    ).padStart(
      2,
      "0",
    );

  const day =
    String(
      now.getDate(),
    ).padStart(
      2,
      "0",
    );

  return `${year}-${month}-${day}`;
}



async function nextPuzzleNumber(
  env: Env,
): Promise<number> {
  const row =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            MAX(puzzle_number) AS maximum
          FROM daily_puzzles
        `,
      )
      .first<{
        maximum:
          number | null;
      }>();

  return (
    Number(
      row?.maximum ??
        218,
    ) + 1
  );
}


function insertGeneratedPuzzle(
  env: Env,
  puzzle: GeneratedPuzzle,
): D1PreparedStatement {
  return env.gyan_registry
    .prepare(
      `
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
          status,
          created_at,
          updated_at
        )
        VALUES (
          ?, ?, ?, ?, ?, ?,
          ?, ?, ?, ?,
          1,
          'published',
          CURRENT_TIMESTAMP,
          CURRENT_TIMESTAMP
        )
      `,
    )
    .bind(
      puzzle.puzzleDate,
      puzzle.puzzleNumber,
      puzzle.stage,
      puzzle.size,
      puzzle.maxMoves,
      puzzle.mysteryCount,
      JSON.stringify(
        puzzle.startBoard,
      ),
      JSON.stringify(
        puzzle.solvedBoard,
      ),
      JSON.stringify(
        puzzle.solutionMoves,
      ),
      JSON.stringify(
        puzzle.mysteryRevealOrder,
      ),
    );
}


async function ensureDailyPuzzlePair(
  env: Env,
  puzzleDate: string,
): Promise<void> {
  const existing =
    await env.gyan_registry
      .prepare(
        `
          SELECT stage
          FROM daily_puzzles
          WHERE
            puzzle_date = ?
            AND verified = 1
            AND status = 'published'
            AND stage IN (
              '5x5',
              '7x7'
            )
        `,
      )
      .bind(
        puzzleDate,
      )
      .all<{
        stage: PuzzleStage;
      }>();

  const stages =
    new Set(
      existing.results.map(
        (row) =>
          row.stage,
      ),
    );

  if (
    stages.has("5x5") &&
    stages.has("7x7")
  ) {
    return;
  }

  if (stages.size > 0) {
    throw new Error(
      `Puzzle date ${puzzleDate} has only one published stage.`,
    );
  }

  const puzzleNumber =
    await nextPuzzleNumber(
      env,
    );

  const pair =
    generateDailyPuzzlePair(
      puzzleDate,
      puzzleNumber,
    );

  try {
    await env.gyan_registry.batch([
      insertGeneratedPuzzle(
        env,
        pair.five,
      ),
      insertGeneratedPuzzle(
        env,
        pair.seven,
      ),
    ]);
  } catch (error) {
    /*
     * If two first visitors race, unique
     * constraints let only one pair win.
     */
    const five =
      await loadPublishedByDate(
        env,
        puzzleDate,
        "5x5",
      );

    const seven =
      await loadPublishedByDate(
        env,
        puzzleDate,
        "7x7",
      );

    if (five && seven) {
      return;
    }

    throw error;
  }
}


function buildAuthoritativeBoard(
  storedBoard: PuzzleTile[],
  clientBoard: ClientBoardTile[],
): PuzzleTile[] {
  const byId =
    new Map(
      storedBoard.map(
        (tile) => [
          tile.id,
          tile,
        ],
      ),
    );

  const seen =
    new Set<number>();

  return clientBoard.map(
    (clientTile) => {
      const stored =
        byId.get(
          clientTile.id,
        );

      if (
        !stored ||
        seen.has(
          clientTile.id,
        )
      ) {
        throw new Error(
          "Invalid tile.",
        );
      }

      seen.add(
        clientTile.id,
      );

      /*
       * The server always restores
       * the authoritative secret color.
       *
       * A tile may remain revealed once
       * the client legitimately received
       * its color.
       */
      return {
        id:
          stored.id,

        color:
          stored.color,

        hidden:
          clientTile.hidden,
      };
    },
  );
}


function randomVerificationToken():
  string {
  const bytes =
    crypto.getRandomValues(
      new Uint8Array(
        24,
      ),
    );

  return Array.from(
    bytes,
    (
      value,
    ) =>
      value
        .toString(16)
        .padStart(
          2,
          "0",
        ),
  ).join("");
}


async function verificationSha256(
  value: string,
): Promise<string> {
  const digest =
    await crypto.subtle.digest(
      "SHA-256",
      new TextEncoder()
        .encode(
          value,
        ),
    );

  return Array.from(
    new Uint8Array(
      digest,
    ),
  )
    .map(
      (
        byte,
      ) =>
        byte
          .toString(16)
          .padStart(
            2,
            "0",
          ),
    )
    .join("");
}


async function sendGyanEmailVerification({
  env,
  email,
  displayName,
  verifyUrl,
}: {
  env: Env;
  email: string;
  displayName: string;
  verifyUrl: string;
}): Promise<void> {
  const apiKey =
    (
      env as Env & {
        RESEND_API_KEY?:
          string;
      }
    ).RESEND_API_KEY;

  if (!apiKey) {
    throw new Error(
      "Email verification is not configured.",
    );
  }

  const response =
    await fetch(
      "https://api.resend.com/emails",
      {
        method:
          "POST",

        headers: {
          Authorization:
            `Bearer ${apiKey}`,

          "Content-Type":
            "application/json",
        },

        body:
          JSON.stringify({
            from:
              "GYAN <admin@gyan.cc>",

            to: [
              email,
            ],

            subject:
              "Verify your GYAN email",

            text: [
              `Hi ${displayName},`,
              "",
              "Please verify this email for your GYAN account:",
              verifyUrl,
              "",
              "If you did not request this, you can ignore this email.",
            ].join(
              "\n",
            ),

            html:
              `<p>Hi ${displayName},</p>` +
              `<p>Please verify this email for your GYAN account.</p>` +
              `<p><a href="${verifyUrl}">Verify email</a></p>` +
              `<p>If you did not request this, you can ignore this email.</p>`,
          }),
      },
    );

  if (
    !response.ok
  ) {
    const details =
      await response.text();

    throw new Error(
      `Verification email failed (${response.status}): ${details}`,
    );
  }
}


async function sendMedalEmail(
  env: Env,
  email: string,
  name: string,
  puzzleNumber: number,
  gqScore: number | null,
  icons: string[],
): Promise<boolean> {
  const result =
    await sendPuzzleCompletionEmail({
      env,
      email,
      name,
      puzzleNumber,
      stage:
        "7x7",
      gqScore,
      icons,
    });

  if (
    !result.sent
  ) {
    console.error(
      "Puzzle completion email failed:",
      result.reason,
    );
  }

  return result.sent;
}


export async function handlePuzzleRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {

  /*
   * ----------------------------------------
   * Verify pending GYAN email.
   *
   * GET /api/gyan-account/email/verify?token=...
   * ----------------------------------------
   */
  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/gyan-account/email/verify"
  ) {
    const token =
      String(
        url.searchParams.get(
          "token",
        ) ?? "",
      ).trim();

    if (!token) {
      return Response.redirect(
        new URL(
          "/account?email=invalid",
          url.origin,
        ).toString(),
        302,
      );
    }

    const tokenHash =
      await verificationSha256(
        token,
      );

    const pending =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            account_id,
            email
          FROM gyan_account_email_verifications
          WHERE
            token_hash = ?
            AND verified_at IS NULL
            AND expires_at >
              CURRENT_TIMESTAMP
          LIMIT 1
          `,
        )
        .bind(
          tokenHash,
        )
        .first<{
          account_id: number;
          email: string;
        }>();

    if (!pending) {
      return Response.redirect(
        new URL(
          "/account?email=invalid",
          url.origin,
        ).toString(),
        302,
      );
    }

    await env.gyan_registry.batch([
      env.gyan_registry
        .prepare(
          `
          UPDATE gyan_accounts
          SET
            email = ?,
            updated_at =
              CURRENT_TIMESTAMP
          WHERE id = ?
          `,
        )
        .bind(
          pending.email,
          pending.account_id,
        ),

      env.gyan_registry
        .prepare(
          `
          UPDATE gyan_account_email_verifications
          SET
            verified_at =
              CURRENT_TIMESTAMP,
            updated_at =
              CURRENT_TIMESTAMP
          WHERE
            account_id = ?
            AND token_hash = ?
          `,
        )
        .bind(
          pending.account_id,
          tokenHash,
        ),

      env.gyan_registry
        .prepare(
          `
          UPDATE puzzle_results
          SET
            email = ?,
            updated_at =
              CURRENT_TIMESTAMP
          WHERE
            gyan_account_id = ?
          `,
        )
        .bind(
          pending.email,
          pending.account_id,
        ),
    ]);

    return Response.redirect(
      new URL(
        "/account?email=verified",
        url.origin,
      ).toString(),
      302,
    );
  }


  /*
   * ----------------------------------------
   * GET recent published puzzles
   *
   * /api/puzzle/recent?stage=5x5&limit=14
   * ----------------------------------------
   */
  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/puzzle/recent"
  ) {
    const rawStage =
      url.searchParams.get(
        "stage",
      );

    const stage:
      PuzzleStage =
      rawStage ===
        "7x7"
        ? "7x7"
        : "5x5";

    const requestedLimit =
      Number(
        url.searchParams.get(
          "limit",
        ) ??
        14,
      );

    const limit =
      Math.max(
        1,
        Math.min(
          30,
          Number.isFinite(
            requestedLimit,
          )
            ? Math.trunc(
                requestedLimit,
              )
            : 14,
        ),
      );

    const rows =
      await env.gyan_registry
        .prepare(
          `
            SELECT
              puzzle_date,
              puzzle_number,
              stage,
              board_size,
              max_moves,
              mystery_count
            FROM daily_puzzles
            WHERE
              stage = ?
              AND verified = 1
              AND status = 'published'
            ORDER BY
              puzzle_date DESC,
              puzzle_number DESC
            LIMIT ?
          `,
        )
        .bind(
          stage,
          limit,
        )
        .all<{
          puzzle_date: string;
          puzzle_number: number;
          stage: PuzzleStage;
          board_size: number;
          max_moves: number;
          mystery_count: number;
        }>();

    return jsonResponse({
      puzzles:
        rows.results.map(
          (
            row,
          ) => ({
            puzzleDate:
              row.puzzle_date,

            puzzleNumber:
              row.puzzle_number,

            stage:
              row.stage,

            size:
              row.board_size,

            maxMoves:
              row.max_moves,

            mysteryCount:
              row.mystery_count,

            mode:
              puzzleModeFor(
                row.puzzle_date,
                row.puzzle_number,
              ),
          }),
        ),
    });
  }


  /*
   * ----------------------------------------
   * GET specific puzzle
   *
   * /api/puzzle/219/5x5
   * /api/puzzle/219/7x7
   * ----------------------------------------
   */
  const numbered =
    url.pathname.match(
      /^\/api\/puzzle\/(\d+)\/(5x5|7x7)$/,
    );

  if (
    request.method ===
      "GET" &&
    numbered
  ) {
    const puzzleNumber =
      Number(
        numbered[1],
      );

    const stage =
      numbered[2] as
        PuzzleStage;

    const row =
      await loadByNumber(
        env,
        puzzleNumber,
        stage,
      );

    if (!row) {
      return jsonResponse(
        {
          error:
            "Puzzle not found.",
        },
        404,
      );
    }

    return jsonResponse({
      puzzle:
        mapPublicPuzzle(
          row,
        ),
    });
  }

  /*
   * ----------------------------------------
   * GET today's puzzle
   *
   * /api/puzzle/today?stage=5x5
   * /api/puzzle/today?stage=7x7
   * ----------------------------------------
   */
  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/puzzle/today"
  ) {
    const rawStage =
      url.searchParams.get(
        "stage",
      );

    const stage:
      PuzzleStage =
      rawStage ===
        "7x7"
        ? "7x7"
        : "5x5";

    const today =
      localDateKey();

    try {
      await ensureDailyPuzzlePair(
        env,
        today,
      );
    } catch (error) {
      console.error(
        "Unable to ensure today's puzzle:",
        error,
      );

      return jsonResponse(
        {
          error:
            "Today's puzzle could not be generated.",
        },
        500,
      );
    }

    const row =
      await loadPublishedByDate(
        env,
        today,
        stage,
      );

    if (!row) {
      return jsonResponse(
        {
          error:
            "Today's puzzle is not available.",
        },
        404,
      );
    }

    return jsonResponse({
      puzzle:
        mapPublicPuzzle(
          row,
        ),
    });
  }

  /*
   * ----------------------------------------
   * Previous-puzzle solution.
   * Today remains protected.
   *
   * /api/puzzle/solution/234
   * ----------------------------------------
   */
  const solutionMatch =
    url.pathname.match(
      /^\/api\/puzzle\/solution\/(\d+)$/,
    );

  if (
    request.method ===
      "GET" &&
    solutionMatch
  ) {
    const puzzleNumber =
      Number(
        solutionMatch[1],
      );

    const requestedStage =
      url.searchParams.get(
        "stage",
      );

    const solutionStage:
      PuzzleStage =
      requestedStage ===
        "7x7"
        ? "7x7"
        : "5x5";

    const row =
      await loadByNumber(
        env,
        puzzleNumber,
        solutionStage,
      );

    if (!row) {
      return jsonResponse(
        {
          error:
            "Puzzle not found.",
        },
        404,
      );
    }

    if (
      row.puzzle_date >=
        localDateKey()
    ) {
      return jsonResponse(
        {
          error:
            "Today's solution is not available yet.",
        },
        403,
      );
    }

    const solvedBoard =
      JSON.parse(
        row.solved_board_json,
      ) as PuzzleTile[];

    return jsonResponse({
      puzzleNumber:
        row.puzzle_number,

      puzzleDate:
        row.puzzle_date,

      size:
        row.board_size,

      mode:
        puzzleModeFor(
          row.puzzle_date,
          row.puzzle_number,
        ),

      solvedBoard:
        solvedBoard.map(
          (
            tile,
          ) => ({
            id:
              tile.id,

            color:
              tile.color,

            hidden:
              false,
          }),
        ),
    });
  }


  /*
   * ----------------------------------------
   * Previous-puzzle practice.
   * Supports 5×5 and 7×7.
   *
   * /api/puzzle/practice/219?stage=7x7
   * ----------------------------------------
   */
  const practice =
    url.pathname.match(
      /^\/api\/puzzle\/practice\/(\d+)$/,
    );

  if (
    request.method ===
      "GET" &&
    practice
  ) {
    const puzzleNumber =
      Number(
        practice[1],
      );

    const requestedStage =
      url.searchParams.get(
        "stage",
      );

    const practiceStage:
      PuzzleStage =
      requestedStage ===
        "7x7"
        ? "7x7"
        : "5x5";

    const row =
      await loadByNumber(
        env,
        puzzleNumber,
        practiceStage,
      );

    if (!row) {
      return jsonResponse(
        {
          error:
            "Practice puzzle not found.",
        },
        404,
      );
    }

    return jsonResponse({
      practice: true,

      puzzle:
        mapPublicPuzzle(
          row,
        ),
    });
  }

  /*
   * ----------------------------------------
   * Reveal one or more specific mystery tiles.
   *
   * POST /api/puzzle/reveal
   *
   * Build C uses this for:
   * - mystery tiles that participate in a
   *   newly-created Match-3+
   * - the player's chosen earned reveal
   *
   * The response exposes only the requested
   * tile colors.
   * ----------------------------------------
   */
  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/puzzle/reveal"
  ) {
    const body =
      await request.json<{
        puzzleNumber: number;
        stage: PuzzleStage;
        board: ClientBoardTile[];
        tileIds: number[];
      }>();

    if (
      !Number.isInteger(
        body.puzzleNumber,
      ) ||
      (
        body.stage !==
          "5x5" &&
        body.stage !==
          "7x7"
      ) ||
      !Array.isArray(
        body.board,
      ) ||
      !Array.isArray(
        body.tileIds,
      )
    ) {
      return jsonResponse(
        {
          error:
            "Invalid reveal request.",
        },
        400,
      );
    }

    const tileIds =
      Array.from(
        new Set(
          body.tileIds.map(
            (
              value,
            ) =>
              Number(
                value,
              ),
          ),
        ),
      );

    /*
     * A normal chosen reveal requests one tile.
     * A Match-3 containing mysteries may need
     * to uncover several participating tiles.
     *
     * Keep a conservative upper bound.
     */
    if (
      tileIds.length ===
        0 ||
      tileIds.length >
        7 ||
      tileIds.some(
        (
          tileId,
        ) =>
          !Number.isInteger(
            tileId,
          ) ||
          tileId <= 0,
      )
    ) {
      return jsonResponse(
        {
          error:
            "Invalid mystery selection.",
        },
        400,
      );
    }

    const row =
      await loadByNumber(
        env,
        body.puzzleNumber,
        body.stage,
      );

    if (!row) {
      return jsonResponse(
        {
          error:
            "Puzzle not found.",
        },
        404,
      );
    }

    const storedBoard =
      JSON.parse(
        row.start_board_json,
      ) as PuzzleTile[];

    if (
      body.board.length !==
      storedBoard.length
    ) {
      return jsonResponse(
        {
          error:
            "Invalid board size.",
        },
        400,
      );
    }

    let authoritative:
      PuzzleTile[];

    try {
      authoritative =
        buildAuthoritativeBoard(
          storedBoard,
          body.board,
        );
    } catch {
      return jsonResponse(
        {
          error:
            "Invalid board.",
        },
        400,
      );
    }

    const requested =
      new Set(
        tileIds,
      );

    const revealed =
      authoritative
        .filter(
          (
            tile,
          ) =>
            tile.hidden &&
            requested.has(
              tile.id,
            ),
        )
        .map(
          (
            tile,
          ) => ({
            id:
              tile.id,

            color:
              tile.color,
          }),
        );

    if (
      revealed.length !==
      requested.size
    ) {
      return jsonResponse(
        {
          error:
            "One or more selected tiles are not available mysteries.",
        },
        400,
      );
    }

    return jsonResponse({
      revealed,
    });
  }


  /*
   * ----------------------------------------
   * Automatic Mystery reveal check.
   *
   * POST /api/puzzle/check-reveals
   * ----------------------------------------
   */
  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/puzzle/check-reveals"
  ) {
    const body =
      await request.json<{
        puzzleNumber: number;
        stage: PuzzleStage;
        board: ClientBoardTile[];
      }>();

    if (
      !Number.isInteger(
        body.puzzleNumber,
      ) ||
      (
        body.stage !==
          "5x5" &&
        body.stage !==
          "7x7"
      ) ||
      !Array.isArray(
        body.board,
      )
    ) {
      return jsonResponse(
        {
          error:
            "Invalid reveal request.",
        },
        400,
      );
    }

    const row =
      await loadByNumber(
        env,
        body.puzzleNumber,
        body.stage,
      );

    if (!row) {
      return jsonResponse(
        {
          error:
            "Puzzle not found.",
        },
        404,
      );
    }

    const storedBoard =
      JSON.parse(
        row.start_board_json,
      ) as PuzzleTile[];

    if (
      body.board.length !==
      storedBoard.length
    ) {
      return jsonResponse(
        {
          error:
            "Invalid board size.",
        },
        400,
      );
    }

    let authoritative:
      PuzzleTile[];

    try {
      authoritative =
        buildAuthoritativeBoard(
          storedBoard,
          body.board,
        );
    } catch {
      return jsonResponse(
        {
          error:
            "Invalid board.",
        },
        400,
      );
    }

const hiddenTile =
  authoritative.find(
    (
      tile,
    ) =>
      tile.hidden,
  );


if (
  !hiddenTile
) {
  return jsonResponse({
    revealed: [],
  });
}


/*
 * The client only calls this endpoint
 * after a successful Match-3+ move.
 *
 * Reveal exactly one remaining mystery
 * tile per successful matching move.
 */
hiddenTile.hidden =
  false;


return jsonResponse({
  revealed: [
    {
      id:
        hiddenTile.id,

      color:
        hiddenTile.color,
    },
  ],
});

  }

  /*
   * ----------------------------------------
   * Save / update a puzzle result.
   *
   * POST /api/puzzle/result
   *
   * The result is anonymous until the player
   * claims the medal. Re-submitting the same
   * result_id updates the same row.
   * ----------------------------------------
   */
  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/puzzle/result"
  ) {
    const body =
      await request.json<{
        resultId: string;
        anonymousName: string;
        puzzleNumber: number;
        stage: PuzzleStage;
        gqScore: number;
        movesUsed: number;
        icons: string[];
        skillStats: unknown;
      }>();

    const resultId =
      String(
        body.resultId ?? "",
      ).trim();

    const anonymousName =
      String(
        body.anonymousName ?? "",
      ).trim();

    const puzzleNumber =
      Number(
        body.puzzleNumber,
      );

    const gqScore =
      Number(
        body.gqScore,
      );

    const movesUsed =
      Number(
        body.movesUsed,
      );

    if (
      resultId.length <
        8 ||
      resultId.length >
        100 ||
      !Number.isInteger(
        puzzleNumber,
      ) ||
      puzzleNumber <= 0 ||
      (
        body.stage !==
          "5x5" &&
        body.stage !==
          "7x7"
      ) ||
      !Number.isInteger(
        gqScore,
      ) ||
      gqScore < 0 ||
      gqScore > 500 ||
      !Number.isInteger(
        movesUsed,
      ) ||
      movesUsed < 0 ||
      movesUsed > 20 ||
      !Array.isArray(
        body.icons,
      )
    ) {
      return jsonResponse(
        {
          error:
            "Invalid puzzle result.",
        },
        400,
      );
    }

    const row =
      await loadByNumber(
        env,
        puzzleNumber,
        body.stage,
      );

    if (!row) {
      return jsonResponse(
        {
          error:
            "Puzzle not found.",
        },
        404,
      );
    }

    const knownIdentity =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            name,
            email,
            claimed

          FROM puzzle_results

          WHERE
            puzzle_number = ?
            AND result_id = ?
            AND claimed = 1

          ORDER BY
            CASE
              WHEN stage = '7x7'
                THEN 1
              ELSE 0
            END DESC,
            updated_at DESC

          LIMIT 1
          `,
        )
        .bind(
          puzzleNumber,
          resultId,
        )
        .first<{
          name: string;
          email: string | null;
          claimed: number;
        }>();

    const gyanAccount =
      await currentGyanAccount(
        request,
        env.gyan_registry,
      );

    const allocatedGuestName =
      knownIdentity ||
      gyanAccount
        ? null
        : await allocateGuestName(
            env,
            puzzleNumber,
            resultId,
          );

    const storedName =
      knownIdentity?.name ??
      gyanAccount?.displayName ??
      allocatedGuestName ??
      anonymousName;

    const storedEmail =
      knownIdentity?.email ??
      gyanAccount?.email ??
      null;

    /*
     * A browser-owned unified GYAN is already a stable
     * identity, so solving automatically joins the
     * leaderboard with the current display name.
     */
    const storedClaimed =
      knownIdentity ||
      gyanAccount
        ? 1
        : 0;

    const gyanAccountId =
      gyanAccount?.id ??
      null;

    try {
      await env.gyan_registry
        .prepare(
          `
          INSERT INTO puzzle_results (
            result_id,
            puzzle_number,
            puzzle_date,
            stage,
            gq_score,
            moves_used,
            icons_json,
            skill_stats_json,
            name,
            email,
            claimed,
            gyan_account_id
          )
          VALUES (
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?,
            ?
          )

          ON CONFLICT (
            puzzle_number,
            stage,
            result_id
          )
          DO UPDATE SET
            gq_score =
              excluded.gq_score,
            moves_used =
              excluded.moves_used,
            icons_json =
              excluded.icons_json,
            skill_stats_json =
              excluded.skill_stats_json,
            name =
              CASE
                WHEN puzzle_results.claimed = 1
                  THEN puzzle_results.name
                ELSE excluded.name
              END,
            email =
              CASE
                WHEN puzzle_results.claimed = 1
                  THEN puzzle_results.email
                ELSE excluded.email
              END,
            claimed =
              CASE
                WHEN puzzle_results.claimed = 1
                  THEN puzzle_results.claimed
                ELSE excluded.claimed
              END,
            gyan_account_id =
              COALESCE(
                puzzle_results.gyan_account_id,
                excluded.gyan_account_id
              ),
            updated_at =
              CURRENT_TIMESTAMP
          `,
        )
        .bind(
          resultId,
          puzzleNumber,
          row.puzzle_date,
          body.stage,
          gqScore,
          movesUsed,
          JSON.stringify(
            body.icons.slice(
              0,
              30,
            ),
          ),
          JSON.stringify(
            body.skillStats ??
              {},
          ),

          storedName,
          storedEmail,
          storedClaimed,
          gyanAccountId,
        )
        .run();
    } catch (
      error
    ) {
      console.error(
        "Unable to save puzzle result:",
        error,
      );

      return jsonResponse(
        {
          error:
            "Unable to save puzzle result.",
        },
        500,
      );
    }

    return jsonResponse({
      saved: true,
      resultId,
      name:
        storedName,
    });
  }


  /*
   * ----------------------------------------
   * Update leaderboard / GYAN identity.
   *
   * POST /api/puzzle/result/claim
   *
   * Name is required.
   * Email is optional. When supplied it remains
   * pending until the verification link is clicked.
   * ----------------------------------------
   */
  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/puzzle/result/claim"
  ) {
    const body =
      await request.json<{
        puzzleNumber: number;
        resultId: string;
        name: string;
        email?: string;
      }>();

    const puzzleNumber =
      Number(
        body.puzzleNumber,
      );

    const resultId =
      String(
        body.resultId ?? "",
      ).trim();

    const name =
      String(
        body.name ?? "",
      ).trim();

    const email =
      String(
        body.email ?? "",
      )
        .trim()
        .toLowerCase();

    const emailPattern =
      /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (
      !Number.isInteger(
        puzzleNumber,
      ) ||
      puzzleNumber <= 0 ||
      resultId.length < 8 ||
      resultId.length > 100 ||
      name.length < 2 ||
      name.length > 80 ||
      (
        email.length >
          0 &&
        !emailPattern.test(
          email,
        )
      )
    ) {
      return jsonResponse(
        {
          error:
            "Please provide a valid result and display name. Email is optional.",
        },
        400,
      );
    }

    const gyanAccount =
      await currentGyanAccount(
        request,
        env.gyan_registry,
      );

    if (!gyanAccount) {
      return jsonResponse(
        {
          error:
            "Your GYAN account could not be loaded.",
        },
        401,
      );
    }

    const ownedResult =
      await env.gyan_registry
        .prepare(
          `
          SELECT id
          FROM puzzle_results
          WHERE
            puzzle_number = ?
            AND result_id = ?
            AND gyan_account_id = ?
          LIMIT 1
          `,
        )
        .bind(
          puzzleNumber,
          resultId,
          gyanAccount.id,
        )
        .first<{
          id: number;
        }>();

    if (!ownedResult) {
      return jsonResponse(
        {
          error:
            "Puzzle result was not found for this GYAN account.",
        },
        404,
      );
    }

    /*
     * The new display name becomes the unified GYAN name
     * and updates this account's existing puzzle rows too.
     */
    await env.gyan_registry.batch([
      env.gyan_registry
        .prepare(
          `
          UPDATE gyan_accounts
          SET
            display_name = ?,
            updated_at =
              CURRENT_TIMESTAMP
          WHERE id = ?
          `,
        )
        .bind(
          name,
          gyanAccount.id,
        ),

      env.gyan_registry
        .prepare(
          `
          UPDATE puzzle_results
          SET
            name = ?,
            claimed = 1,
            updated_at =
              CURRENT_TIMESTAMP
          WHERE
            gyan_account_id = ?
          `,
        )
        .bind(
          name,
          gyanAccount.id,
        ),
    ]);

    let emailStatus:
      "none" |
      "pending" |
      "verified" =
        gyanAccount.email
          ? "verified"
          : "none";

    if (
      email.length >
        0
    ) {
      if (
        gyanAccount.email &&
        gyanAccount.email
          .trim()
          .toLowerCase() ===
            email
      ) {
        emailStatus =
          "verified";
      } else {
        const token =
          randomVerificationToken();

        const tokenHash =
          await verificationSha256(
            token,
          );

        await env.gyan_registry
          .prepare(
            `
            INSERT INTO gyan_account_email_verifications (
              account_id,
              email,
              token_hash,
              expires_at
            )
            VALUES (
              ?,
              ?,
              ?,
              datetime(
                'now',
                '+30 minutes'
              )
            )
            ON CONFLICT(account_id)
            DO UPDATE SET
              email =
                excluded.email,
              token_hash =
                excluded.token_hash,
              expires_at =
                excluded.expires_at,
              verified_at =
                NULL,
              updated_at =
                CURRENT_TIMESTAMP
            `,
          )
          .bind(
            gyanAccount.id,
            email,
            tokenHash,
          )
          .run();

        const verifyUrl =
          new URL(
            "/api/gyan-account/email/verify",
            url.origin,
          );

        verifyUrl.searchParams.set(
          "token",
          token,
        );

        try {
          await sendGyanEmailVerification({
            env,
            email,
            displayName:
              name,
            verifyUrl:
              verifyUrl.toString(),
          });

          emailStatus =
            "pending";
        } catch (
          error
        ) {
          console.error(
            "Unable to send GYAN email verification:",
            error,
          );

          return jsonResponse(
            {
              error:
                "Your name was updated, but the verification email could not be sent.",
            },
            500,
          );
        }
      }
    }

    return jsonResponse({
      claimed: true,

      result: {
        name,
      },

      emailStatus,
    });
  }


  /*
   * ----------------------------------------
   * GQ leaders.
   *
   * GET /api/puzzle/225/leaderboard
   * GET /api/puzzle/225/leaderboard?resultId=...
   * ----------------------------------------
   */
  const leaderboardMatch =
    url.pathname.match(
      /^\/api\/puzzle\/(\d+)\/leaderboard$/,
    );

  if (
    request.method ===
      "GET" &&
    leaderboardMatch
  ) {
    const puzzleNumber =
      Number(
        leaderboardMatch[1],
      );

    const resultId =
      String(
        url.searchParams.get(
          "resultId",
        ) ?? "",
      ).trim();

    if (
      !Number.isInteger(
        puzzleNumber,
      ) ||
      puzzleNumber <= 0
    ) {
      return jsonResponse(
        {
          error:
            "Invalid puzzle number.",
        },
        400,
      );
    }

    /*
     * Every completed human round remains a real
     * puzzle_results row.
     *
     * To keep a quiet daily board lively, we also
     * add transparent virtual AI Bot rows at read
     * time. They are NEVER stored as Guest/human
     * results and are always labeled AI Bot ####.
     *
     * Cadence: one bot every 3 hours, capped at 6.
     * Once 10 real round-results exist, no bots are
     * shown. This keeps bots from crowding humans.
     */
    const humanRowsResult =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            result_id,
            stage,
            name,
            gq_score,
            moves_used,
            icons_json,
            created_at

          FROM puzzle_results

          WHERE
            puzzle_number = ?
          `,
        )
        .bind(
          puzzleNumber,
        )
        .all<{
          result_id: string;
          stage: "5x5" | "7x7";
          name: string;
          gq_score: number;
          moves_used: number;
          icons_json: string;
          created_at: string;
        }>();

    const humanRows =
      humanRowsResult.results ??
      [];

    const puzzleDateRow =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            puzzle_date

          FROM daily_puzzles

          WHERE
            puzzle_number = ?

          LIMIT 1
          `,
        )
        .bind(
          puzzleNumber,
        )
        .first<{
          puzzle_date: string;
        }>();

    const mapIcons =
      (
        iconsJson: string,
      ): string[] => {
        try {
          const parsed =
            JSON.parse(
              iconsJson,
            );

          return Array.isArray(
            parsed,
          )
            ? parsed.map(
                (value) =>
                  String(
                    value,
                  ),
              )
            : [];
        } catch {
          return [];
        }
      };

    type RankedEntry = {
      resultId: string;
      stage: "5x5" | "7x7";
      name: string;
      gq: number;
      moves: number;
      icons: string[];
      createdAt: string;
      isBot: boolean;
      rank?: number;
    };

    const entries:
      RankedEntry[] =
      humanRows.map(
        (item) => ({
          resultId:
            item.result_id,
          stage:
            item.stage,
          name:
            item.name,
          gq:
            item.gq_score,
          moves:
            item.moves_used,
          icons:
            mapIcons(
              item.icons_json,
            ),
          createdAt:
            item.created_at,
          isBot:
            false,
        }),
      );

    if (
      puzzleDateRow
        ?.puzzle_date
    ) {
      const puzzleStart =
        new Date(
          `${puzzleDateRow.puzzle_date}T00:00:00Z`,
        ).getTime();

      const elapsedHours =
        Math.max(
          0,
          Math.floor(
            (
              Date.now() -
              puzzleStart
            ) /
              3600000,
          ),
        );

      const uniqueHumanCount =
        new Set(
          humanRows.map(
            (item) =>
              item.result_id,
          ),
        ).size;

      /*
       * Keep the board lively without letting bots
       * overwhelm real players.
       *
       * - Always allow at least 1 transparent AI Bot.
       * - Never show more than (2 × humans) + 1 bots.
       * - Never show more than 10 bots total.
       * - Keep the existing gradual 3-hour cadence.
       *
       * Count humans by result_id, not by round, so a
       * player who completes both 5×5 and 7×7 still
       * counts as one human player.
       */
      const timeBasedBotCount =
        Math.floor(
          elapsedHours /
            3,
        ) +
        1;

      const humanBasedBotCap =
        uniqueHumanCount *
          2 +
        1;

      const botCount =
        Math.max(
          1,
          Math.min(
            10,
            humanBasedBotCap,
            timeBasedBotCount,
          ),
        );

      const botIcons =
        [
          ["⚡", "👁️"],
          ["👁️", "◇"],
          ["⏱", "👁️", "↔"],
          ["⚡", "⏱", "◇"],
          ["👁️", "👁️👁️", "❓"],
          ["⚡", "👁️", "◇", "↔"],
        ];

      for (
        let index = 0;
        index < botCount;
        index += 1
      ) {
        const seed =
          (
            puzzleNumber *
              7919 +
            index *
              104729
          ) >>>
          0;

        const botNumber =
          1000 +
          (
            seed %
            9000
          );

        const stage:
          "5x5" | "7x7" =
          index %
              2 ===
            0
            ? "5x5"
            : "7x7";

        const baseBonus =
          17 +
          (
            seed %
            18
          );

        const adjustedBonus =
          stage ===
            "7x7"
            ? Math.round(
                baseBonus *
                  Math.sqrt(
                    7 / 5,
                  ),
              )
            : baseBonus;

        entries.push({
          resultId:
            `ai-${puzzleNumber}-${index}`,
          stage,
          name:
            `AI Bot ${String(
              botNumber,
            ).padStart(
              4,
              "0",
            )}`,
          gq:
            Math.min(
              150,
              100 +
                adjustedBonus,
            ),
          moves:
            stage ===
              "7x7"
              ? 7
              : 5,
          icons:
            botIcons[
              index %
                botIcons.length
            ],
          createdAt:
            new Date(
              puzzleStart +
                index *
                  3 *
                  3600000,
            ).toISOString(),
          isBot:
            true,
        });
      }
    }

    entries.sort(
      (
        left,
        right,
      ) =>
        right.gq -
          left.gq ||
        (
          right.stage ===
            "7x7"
            ? 1
            : 0
        ) -
          (
            left.stage ===
              "7x7"
              ? 1
              : 0
          ) ||
        left.moves -
          right.moves ||
        left.createdAt.localeCompare(
          right.createdAt,
        ) ||
        left.resultId.localeCompare(
          right.resultId,
        ),
    );

    entries.forEach(
      (
        entry,
        index,
      ) => {
        entry.rank =
          index +
          1;
      },
    );

    const toApiEntry =
      (
        entry: RankedEntry,
      ) => ({
        rank:
          entry.rank ??
          0,
        resultId:
          entry.resultId,
        name:
          entry.name,
        stage:
          entry.stage,
        gq:
          entry.gq,
        fiveGq:
          entry.stage ===
            "5x5"
            ? entry.gq
            : null,
        sevenGq:
          entry.stage ===
            "7x7"
            ? entry.gq
            : null,
        moves:
          entry.moves,
        icons:
          entry.icons,
        isBot:
          entry.isBot,
      });

    const top =
      entries
        .slice(
          0,
          10,
        )
        .map(
          toApiEntry,
        );

    const yourEntries =
      resultId
        ? entries
            .filter(
              (entry) =>
                !entry.isBot &&
                entry.resultId ===
                  resultId,
            )
            .map(
              toApiEntry,
            )
        : [];

    const yours =
      yourEntries.find(
        (entry) =>
          entry.stage ===
          "7x7",
      ) ??
      yourEntries[0] ??
      null;

    return jsonResponse({
      puzzleNumber,

      top,

      yourRank:
        yours?.rank ??
        null,

      yourScore:
        yours?.gq ??
        null,

      yourEntries,
    });
  }


  /*
   * ----------------------------------------
   * Medal claim
   *
   * POST /api/puzzle/winner
   * ----------------------------------------
   */
  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/puzzle/winner"
  ) {
    const body =
      await request.json<{
        puzzleNumber: number;
        name: string;
        email: string;
        resultId?: string;
      }>();

    const puzzleNumber =
      Number(
        body.puzzleNumber,
      );

    const name =
      String(
        body.name ?? "",
      ).trim();

    const email =
      String(
        body.email ?? "",
      )
        .trim()
        .toLowerCase();

    const resultId =
      String(
        body.resultId ?? "",
      ).trim();

    if (
      !Number.isInteger(
        puzzleNumber,
      ) ||
      puzzleNumber <= 0
    ) {
      return jsonResponse(
        {
          error:
            "Invalid puzzle number.",
        },
        400,
      );
    }

    if (
      name.length < 2 ||
      name.length > 80
    ) {
      return jsonResponse(
        {
          error:
            "Please enter your display name.",
        },
        400,
      );
    }

    const emailPattern =
      /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (
      !emailPattern.test(
        email,
      )
    ) {
      return jsonResponse(
        {
          error:
            "Please enter a valid email address.",
        },
        400,
      );
    }

    const puzzle =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            puzzle_date,
            puzzle_number

          FROM daily_puzzles

          WHERE
            puzzle_number = ?
            AND stage = '7x7'
            AND verified = 1

          LIMIT 1
          `,
        )
        .bind(
          puzzleNumber,
        )
        .first<{
          puzzle_date: string;
          puzzle_number: number;
        }>();

    if (!puzzle) {
      return jsonResponse(
        {
          error:
            "Puzzle not found.",
        },
        404,
      );
    }

    if (resultId) {
      try {
        await env.gyan_registry
          .prepare(
            `
            UPDATE puzzle_results

            SET
              name = ?,
              email = ?,
              claimed = 1,
              updated_at =
                CURRENT_TIMESTAMP

            WHERE
              puzzle_number = ?
              AND result_id = ?
            `,
          )
          .bind(
            name,
            email,
            puzzleNumber,
            resultId,
          )
          .run();
      } catch {
        return jsonResponse(
          {
            error:
              "Unable to attach your name to the puzzle result.",
          },
          500,
        );
      }
    }

    const existing =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            id,
            name

          FROM puzzle_winners

          WHERE
            puzzle_number = ?
            AND email = ?

          LIMIT 1
          `,
        )
        .bind(
          puzzleNumber,
          email,
        )
        .first<{
          id: number;
          name: string;
        }>();

    if (existing) {
      /*
       * Same puzzle + same email:
       * the latest explicit claim name wins.
       *
       * This is useful for corrected display names,
       * testing, and future improved-score attempts.
       */
      await env.gyan_registry
        .prepare(
          `
          UPDATE puzzle_winners

          SET
            name = ?

          WHERE
            id = ?
          `,
        )
        .bind(
          name,
          existing.id,
        )
        .run();

      /*
       * Keep puzzle_results aligned with the latest
       * claim identity for this resultId.
       */
      if (resultId) {
        await env.gyan_registry
          .prepare(
            `
            UPDATE puzzle_results

            SET
              name = ?,
              email = ?,
              claimed = 1,
              updated_at =
                CURRENT_TIMESTAMP

            WHERE
              puzzle_number = ?
              AND result_id = ?
            `,
          )
          .bind(
            name,
            email,
            puzzleNumber,
            resultId,
          )
          .run();
      }

      let existingGq:
        number | null =
          null;

      let existingIcons:
        string[] = [];

      if (resultId) {
        try {
          const resultRow =
            await env.gyan_registry
              .prepare(
                `
                SELECT
                  gq_score,
                  icons_json

                FROM puzzle_results

                WHERE
                  puzzle_number = ?
                  AND stage = '7x7'
                  AND result_id = ?

                LIMIT 1
                `,
              )
              .bind(
                puzzleNumber,
                resultId,
              )
              .first<{
                gq_score: number;
                icons_json: string;
              }>();

          if (resultRow) {
            existingGq =
              resultRow.gq_score;

            try {
              const parsed =
                JSON.parse(
                  resultRow.icons_json,
                );

              if (
                Array.isArray(
                  parsed,
                )
              ) {
                existingIcons =
                  parsed
                    .slice(
                      0,
                      30,
                    )
                    .map(
                      (
                        value,
                      ) =>
                        String(
                          value,
                        ),
                    );
              }
            } catch {
              existingIcons = [];
            }
          }
        } catch (
          error
        ) {
          console.error(
            "Unable to load existing medal GQ for email:",
            error,
          );
        }
      }

      const repeatedEmailSent =
        await sendMedalEmail(
          env,
          email,
          name,
          puzzleNumber,
          existingGq,
          existingIcons,
        );

      return jsonResponse({
        claimed: true,
        alreadyClaimed: true,

        emailSent:
          repeatedEmailSent,

        winner: {
          name,
        },
      });
    }

    try {
      await env.gyan_registry
        .prepare(
          `
          INSERT INTO puzzle_winners (
            puzzle_number,
            puzzle_date,
            name,
            email
          )
          VALUES (
            ?,
            ?,
            ?,
            ?
          )
          `,
        )
        .bind(
          puzzleNumber,
          puzzle.puzzle_date,
          name,
          email,
        )
        .run();
    } catch {
      return jsonResponse(
        {
          error:
            "Unable to save medal.",
        },
        500,
      );
    }

    /*
     * Medal/result is already saved at this point.
     * Email is a secondary notification: a delivery
     * failure must never undo the medal claim.
     *
     * Rank is intentionally excluded because it can
     * change as more players complete the puzzle.
     */
    let medalGq:
      number | null =
        null;

    let medalIcons:
      string[] = [];

    if (resultId) {
      try {
        const resultRow =
          await env.gyan_registry
            .prepare(
              `
              SELECT
                gq_score,
                icons_json

              FROM puzzle_results

              WHERE
                puzzle_number = ?
                AND stage = '7x7'
                AND result_id = ?

              LIMIT 1
              `,
            )
            .bind(
              puzzleNumber,
              resultId,
            )
            .first<{
              gq_score: number;
              icons_json: string;
            }>();

        if (resultRow) {
          medalGq =
            resultRow.gq_score;

          try {
            const parsed =
              JSON.parse(
                resultRow.icons_json,
              );

            if (
              Array.isArray(
                parsed,
              )
            ) {
              medalIcons =
                parsed
                  .slice(
                    0,
                    30,
                  )
                  .map(
                    (
                      value,
                    ) =>
                      String(
                        value,
                      ),
                  );
            }
          } catch {
            medalIcons = [];
          }
        }
      } catch (
        error
      ) {
        console.error(
          "Unable to load medal GQ for email:",
          error,
        );
      }
    }

    const medalEmailSent =
      await sendMedalEmail(
        env,
        email,
        name,
        puzzleNumber,
        medalGq,
        medalIcons,
      );

    return jsonResponse({
      claimed: true,
      alreadyClaimed: false,

      emailSent:
        medalEmailSent,

      winner: {
        name,
      },
    });
  }

  /*
   * ----------------------------------------
   * Public winner summary
   *
   * GET /api/puzzle/219/winners
   *
   * Never returns email.
   * ----------------------------------------
   */
  const winnersMatch =
    url.pathname.match(
      /^\/api\/puzzle\/(\d+)\/winners$/,
    );

  if (
    request.method ===
      "GET" &&
    winnersMatch
  ) {
    const puzzleNumber =
      Number(
        winnersMatch[1],
      );

    if (
      !Number.isInteger(
        puzzleNumber,
      ) ||
      puzzleNumber <= 0
    ) {
      return jsonResponse(
        {
          error:
            "Invalid puzzle number.",
        },
        400,
      );
    }

    const firstWinner =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            name,
            created_at

          FROM puzzle_winners

          WHERE
            puzzle_number = ?

          ORDER BY
            created_at ASC,
            id ASC

          LIMIT 1
          `,
        )
        .bind(
          puzzleNumber,
        )
        .first<{
          name: string;
          created_at: string;
        }>();

    const latestWinner =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            name,
            created_at

          FROM puzzle_winners

          WHERE
            puzzle_number = ?

          ORDER BY
            created_at DESC,
            id DESC

          LIMIT 1
          `,
        )
        .bind(
          puzzleNumber,
        )
        .first<{
          name: string;
          created_at: string;
        }>();

    const recentResult =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            name,
            created_at

          FROM puzzle_winners

          WHERE
            puzzle_number = ?

          ORDER BY
            created_at DESC,
            id DESC

          LIMIT 5
          `,
        )
        .bind(
          puzzleNumber,
        )
        .all<{
          name: string;
          created_at: string;
        }>();

    const countResult =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            COUNT(*) AS count

          FROM puzzle_winners

          WHERE
            puzzle_number = ?
          `,
        )
        .bind(
          puzzleNumber,
        )
        .first<{
          count: number;
        }>();

    return jsonResponse({
      puzzleNumber,

      count:
        countResult?.count ??
        0,

      firstWinner:
        firstWinner
          ? {
              name:
                firstWinner.name,

              claimedAt:
                firstWinner.created_at,
            }
          : null,

      latestWinner:
        latestWinner
          ? {
              name:
                latestWinner.name,

              claimedAt:
                latestWinner.created_at,
            }
          : null,

      recentWinners:
        (
          recentResult.results ??
          []
        ).map(
          (winner) => ({
            name:
              winner.name,

            claimedAt:
              winner.created_at,
          }),
        ),
    });
  }

  return null;
}