/*
 * worker/liveTestAnswers.ts
 *
 * Autosave/restore current Live Test answers.
 *
 * GET  /api/education/live-tests/answers?code=238N
 * POST /api/education/live-tests/answers
 *
 * POST body:
 * {
 *   code: "238N",
 *   questionId: 123,
 *   selectedChoice: "A"
 * }
 */

type LiveTestAnswersEnv =
  Env;


function json(
  body:
    unknown,

  status =
    200,
): Response {
  return new Response(
    JSON.stringify(
      body,
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


function cookieValue(
  request:
    Request,

  name:
    string,
): string | null {
  const raw =
    request.headers.get(
      "cookie",
    );

  if (!raw) {
    return null;
  }

  for (
    const part
    of raw.split(";")
  ) {
    const [
      key,
      ...rest
    ] =
      part
        .trim()
        .split("=");

    if (
      key ===
      name
    ) {
      return decodeURIComponent(
        rest.join("="),
      );
    }
  }

  return null;
}


function bytesToHex(
  bytes:
    Uint8Array,
): string {
  return Array.from(
    bytes,
  )
    .map(
      (
        value,
      ) =>
        value
          .toString(16)
          .padStart(
            2,
            "0",
          ),
    )
    .join("");
}


async function sha256(
  value:
    string,
): Promise<string> {
  const digest =
    await crypto.subtle.digest(
      "SHA-256",

      new TextEncoder()
        .encode(
          value,
        ),
    );

  return bytesToHex(
    new Uint8Array(
      digest,
    ),
  );
}


async function currentAccountId(
  request:
    Request,

  env:
    LiveTestAnswersEnv,
): Promise<number | null> {
  const secret =
    cookieValue(
      request,
      "gyan_anon",
    );

  if (!secret) {
    return null;
  }

  const secretHash =
    await sha256(
      secret,
    );

  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          account_id

        FROM gyan_browser_sessions

        WHERE secret_hash = ?

        LIMIT 1
        `,
      )
      .bind(
        secretHash,
      )
      .first<{
        account_id:
          number;
      }>();

  return row
    ? Number(
        row.account_id,
      )
    : null;
}


async function currentEntry(
  env:
    LiveTestAnswersEnv,

  accountId:
    number,

  code:
    string,
): Promise<{
  entryId:
    number;

  liveTestId:
    number;

  submittedAt:
    string | null;
} | null> {
  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          le.id AS entry_id,
          le.live_test_id,
          le.submitted_at

        FROM education_live_entries le

        INNER JOIN education_live_tests lt
          ON lt.id =
             le.live_test_id

        WHERE
          UPPER(
            lt.public_code
          ) = ?
          AND le.participant_type =
              'GYAN'
          AND le.participant_key =
              ?

        LIMIT 1
        `,
      )
      .bind(
        code,
        String(
          accountId,
        ),
      )
      .first<{
        entry_id:
          number;

        live_test_id:
          number;

        submitted_at:
          string | null;
      }>();

  if (!row) {
    return null;
  }

  return {
    entryId:
      Number(
        row.entry_id,
      ),

    liveTestId:
      Number(
        row.live_test_id,
      ),

    submittedAt:
      row.submitted_at,
  };
}


export async function handleLiveTestAnswersRoute(
  request:
    Request,

  env:
    LiveTestAnswersEnv,

  url:
    URL,
): Promise<Response | null> {
  if (
    url.pathname !==
      "/api/education/live-tests/answers"
  ) {
    return null;
  }

  if (
    request.method !==
      "GET" &&
    request.method !==
      "POST"
  ) {
    return json(
      {
        error:
          "Method not allowed.",
      },
      405,
    );
  }

  const accountId =
    await currentAccountId(
      request,
      env,
    );

  if (!accountId) {
    return json(
      {
        error:
          "Open your GYAN Card on this device before using Live Test autosave.",
      },
      401,
    );
  }

  if (
    request.method ===
      "GET"
  ) {
    const code =
      (
        url.searchParams
          .get(
            "code",
          ) ??
        ""
      )
        .trim()
        .toUpperCase()
        .replace(
          /^#/,
          "",
        );

    if (!code) {
      return json(
        {
          error:
            "Live Test code is required.",
        },
        400,
      );
    }

    const entry =
      await currentEntry(
        env,
        accountId,
        code,
      );

    if (!entry) {
      return json(
        {
          answers:
            [],
        },
        404,
      );
    }

    const result =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            question_id,
            selected_choice

          FROM education_live_entry_answers

          WHERE
            live_entry_id = ?

          ORDER BY
            question_id
          `,
        )
        .bind(
          entry.entryId,
        )
        .all<{
          question_id:
            number;

          selected_choice:
            string;
        }>();

    return json({
      answers:
        result.results.map(
          (
            row,
          ) => ({
            questionId:
              Number(
                row.question_id,
              ),

            selectedChoice:
              row.selected_choice,
          }),
        ),
    });
  }

  let body: {
    code?:
      unknown;

    questionId?:
      unknown;

    selectedChoice?:
      unknown;
  };

  try {
    body =
      await request.json();
  } catch {
    return json(
      {
        error:
          "Invalid request.",
      },
      400,
    );
  }

  const code =
    typeof body.code ===
      "string"
      ? body.code
          .trim()
          .toUpperCase()
          .replace(
            /^#/,
            "",
          )
      : "";

  const questionId =
    Number(
      body.questionId,
    );

  const selectedChoice =
    typeof body.selectedChoice ===
      "string"
      ? body.selectedChoice
          .trim()
          .toUpperCase()
      : "";

  if (
    !code ||
    !Number.isInteger(
      questionId,
    ) ||
    questionId <=
      0 ||
    ![
      "A",
      "B",
      "C",
      "D",
    ].includes(
      selectedChoice,
    )
  ) {
    return json(
      {
        error:
          "Invalid Live Test answer.",
      },
      400,
    );
  }

  const entry =
    await currentEntry(
      env,
      accountId,
      code,
    );

  if (!entry) {
    return json(
      {
        error:
          "Enter the Live Test before saving answers.",
      },
      403,
    );
  }

  if (
    entry.submittedAt
  ) {
    return json(
      {
        error:
          "This Live Test has already been submitted.",
      },
      409,
    );
  }

  /*
   * Only permit a question frozen into this exact Live Test.
   */
  const frozenQuestion =
    await env.gyan_registry
      .prepare(
        `
        SELECT 1 AS found

        FROM education_live_test_questions

        WHERE
          live_test_id = ?
          AND question_id = ?

        LIMIT 1
        `,
      )
      .bind(
        entry.liveTestId,
        questionId,
      )
      .first<{
        found:
          number;
      }>();

  if (!frozenQuestion) {
    return json(
      {
        error:
          "Question does not belong to this Live Test.",
      },
      400,
    );
  }

  await env.gyan_registry
    .prepare(
      `
      INSERT INTO education_live_entry_answers (
        live_entry_id,
        question_id,
        selected_choice,
        saved_at,
        updated_at
      )
      VALUES (?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)

      ON CONFLICT(
        live_entry_id,
        question_id
      )
      DO UPDATE SET
        selected_choice =
          excluded.selected_choice,

        updated_at =
          CURRENT_TIMESTAMP
      `,
    )
    .bind(
      entry.entryId,
      questionId,
      selectedChoice,
    )
    .run();

  return json({
    saved:
      true,

    questionId,

    selectedChoice,
  });
}
