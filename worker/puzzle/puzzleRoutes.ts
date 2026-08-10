import type {
  PuzzleStage,
  PuzzleTile,
  TileColor,
} from "./puzzleGenerator";

interface PuzzleRow {
  puzzle_date: string;
  puzzle_number: number;
  stage: PuzzleStage;
  board_size: number;
  max_moves: number;
  mystery_count: number;
  start_board_json: string;
  verified: number;
  status: string;
}

interface PublicBoardTile {
  id: number;
  hidden: boolean;
  color?: TileColor;
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

  const publicBoard:
    PublicBoardTile[] =
    board.map(
      (tile) =>
        tile.hidden
          ? {
              id: tile.id,
              hidden: true,
            }
          : {
              id: tile.id,
              hidden: false,
              color: tile.color,
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

export async function handlePuzzleRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
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

    const row =
      await loadPublishedByDate(
        env,
        localDateKey(),
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
   * Previous-puzzle practice.
   * 5×5 only.
   *
   * /api/puzzle/practice/219
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

    const row =
      await loadByNumber(
        env,
        puzzleNumber,
        "5x5",
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
      return jsonResponse({
        claimed: true,
        alreadyClaimed: true,

        winner: {
          name:
            existing.name,
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

    return jsonResponse({
      claimed: true,
      alreadyClaimed: false,

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