import type {
  PuzzleMove,
  PuzzleStage,
  PuzzleTile,
} from "./puzzleGenerator";

import {
  getAdminSession,
} from "../adminAuth";

interface AdminPuzzleRow {
  puzzle_date: string;
  puzzle_number: number;
  stage: PuzzleStage;
  board_size: number;
  max_moves: number;
  mystery_count: number;

  start_board_json: string;
  solved_board_json: string;
  solution_moves_json: string;

  verified: number;
  status: string;
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

async function requireAdmin(
  request: Request,
  env: Env,
): Promise<Response | null> {
  const session =
    await getAdminSession(
      request,
      env,
    );

  if (!session) {
    return jsonResponse(
      {
        error:
          "Administrator authentication is required.",
      },
      401,
    );
  }

  return null;
}

function mapAdminPuzzle(
  row: AdminPuzzleRow,
) {
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

    scrambledBoard:
      JSON.parse(
        row.start_board_json,
      ) as PuzzleTile[],

    solvedBoard:
      JSON.parse(
        row.solved_board_json,
      ) as PuzzleTile[],

    solutionMoves:
      JSON.parse(
        row.solution_moves_json,
      ) as PuzzleMove[],

    verified:
      row.verified === 1,

    status:
      row.status,
  };
}

async function loadStage(
  env: Env,
  puzzleNumber: number,
  stage: PuzzleStage,
): Promise<AdminPuzzleRow | null> {
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
        solution_moves_json,
        verified,
        status

      FROM daily_puzzles

      WHERE
        puzzle_number = ?
        AND stage = ?

      LIMIT 1
      `,
    )
    .bind(
      puzzleNumber,
      stage,
    )
    .first<AdminPuzzleRow>();
}

export async function handlePuzzleAdminRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  const match =
    url.pathname.match(
      /^\/api\/admin\/puzzles\/(\d+)$/,
    );

  /*
   * Not our route.
   */
  if (
    request.method !== "GET" ||
    !match
  ) {
    return null;
  }

  /*
   * IMPORTANT:
   * authenticate BEFORE reading
   * solved boards or solutions.
   */
  const unauthorizedResponse =
    await requireAdmin(
      request,
      env,
    );

  if (
    unauthorizedResponse
  ) {
    return unauthorizedResponse;
  }

  const puzzleNumber =
    Number(
      match[1],
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

  const [
    five,
    seven,
  ] =
    await Promise.all([
      loadStage(
        env,
        puzzleNumber,
        "5x5",
      ),

      loadStage(
        env,
        puzzleNumber,
        "7x7",
      ),
    ]);

  if (
    !five &&
    !seven
  ) {
    return jsonResponse(
      {
        error:
          "Puzzle not found.",
      },
      404,
    );
  }

  return jsonResponse({
    puzzleNumber,

    five:
      five
        ? mapAdminPuzzle(
            five,
          )
        : null,

    seven:
      seven
        ? mapAdminPuzzle(
            seven,
          )
        : null,
  });
}