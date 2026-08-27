
import {
  currentGyanAccount,
} from "./gyanAccountContext";


interface GyanActivityEnv {
  gyan_registry: D1Database;
}


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


export async function handleGyanActivityRoute(
  request: Request,
  env: GyanActivityEnv,
  url: URL,
): Promise<Response | null> {
  if (
    url.pathname !==
      "/api/gyan-activity"
  ) {
    return null;
  }

  if (
    request.method !==
      "GET"
  ) {
    return jsonResponse(
      {
        error:
          "Method not allowed.",
      },
      405,
    );
  }

  const account =
    await currentGyanAccount(
      request,
      env.gyan_registry,
    );

  if (!account) {
    return jsonResponse({
      puzzles: [],
      serviceRequests: [],
    });
  }

  const normalizedEmail =
    account.email
      ?.trim()
      .toLowerCase() ??
    "";

  const puzzles =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          dp.puzzle_number,
          dp.puzzle_date,

          MAX(
            CASE
              WHEN pr.stage =
                '5x5'
                THEN 1
              ELSE 0
            END
          ) AS five_solved,

          MAX(
            CASE
              WHEN pr.stage =
                '7x7'
                THEN 1
              ELSE 0
            END
          ) AS seven_solved

        FROM daily_puzzles dp

        LEFT JOIN puzzle_results pr
          ON pr.puzzle_number =
            dp.puzzle_number
          AND (
            pr.gyan_account_id = ?
            OR (
              ? <> ''
              AND pr.claimed = 1
              AND lower(
                COALESCE(
                  pr.email,
                  ''
                )
              ) = ?
            )
          )

        WHERE
          dp.stage = '5x5'
          AND dp.verified = 1
          AND dp.status =
            'published'

        GROUP BY
          dp.puzzle_number,
          dp.puzzle_date

        ORDER BY
          dp.puzzle_date DESC,
          dp.puzzle_number DESC

        LIMIT 10
        `,
      )
      .bind(
        account.id,
        normalizedEmail,
        normalizedEmail,
      )
      .all<{
        puzzle_number: number;
        puzzle_date: string;
        five_solved: number;
        seven_solved: number;
      }>();

  const serviceRequests =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          request_number,
          status,
          created_at

        FROM service_requests

        WHERE
          gyan_account_id = ?
          OR (
            ? <> ''
            AND lower(
              COALESCE(
                email_address,
                ''
              )
            ) = ?
          )

        ORDER BY
          created_at DESC,
          id DESC

        LIMIT 10
        `,
      )
      .bind(
        account.id,
        normalizedEmail,
        normalizedEmail,
      )
      .all<{
        request_number: string;
        status: string;
        created_at: string;
      }>();

  return jsonResponse({
    puzzles:
      puzzles.results.map(
        (
          row,
        ) => ({
          puzzleNumber:
            row.puzzle_number,

          puzzleDate:
            row.puzzle_date,

          fiveSolved:
            Boolean(
              row.five_solved,
            ),

          sevenSolved:
            Boolean(
              row.seven_solved,
            ),
        }),
      ),

    serviceRequests:
      serviceRequests.results.map(
        (
          row,
        ) => ({
          requestNumber:
            row.request_number,

          status:
            row.status,

          createdAt:
            row.created_at,
        }),
      ),
  });
}
