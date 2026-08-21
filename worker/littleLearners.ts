import {
  currentUser,
} from "./auth";

function jsonResponse(
  value: unknown,
  status = 200,
): Response {
  return new Response(
    JSON.stringify(value),
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

function normalizeWord(
  value: unknown,
): string {
  return typeof value ===
    "string"
    ? value
        .trim()
        .toLowerCase()
        .replace(
          /\s+/g,
          " ",
        )
    : "";
}


async function getStudentForUser(
  env: Env,
  request: Request,
  studentCode: string,
) {
  const user =
    await currentUser(
      request,
      env,
    );

  if (!user) {
    return null;
  }

  return env.gyan_registry
    .prepare(
      `
      SELECT
        id,
        student_code,
        student_name

      FROM education_students

      WHERE
        student_code = ?
        AND email = ?

      LIMIT 1
      `,
    )
    .bind(
      studentCode,
      user.email,
    )
    .first<{
      id: number;
      student_code: string;
      student_name: string;
    }>();
}


async function getQuestions(
  env: Env,
  url: URL,
): Promise<Response> {
  const level =
    Math.max(
      1,
      Math.min(
        6,
        Number(
          url.searchParams.get(
            "level",
          ) ??
          "2",
        ) || 2,
      ),
    );

  const skill =
    normalizeWord(
      url.searchParams.get(
        "skill",
      ),
    )
      .toUpperCase();

  let statement;

  if (skill) {
    statement =
      env.gyan_registry
        .prepare(
          `
          SELECT
            id,
            skill_code AS skillCode,
            level,
            prompt_text AS promptText,
            question_type AS questionType,
            option_a AS optionA,
            option_b AS optionB,
            option_c AS optionC,
            correct_option AS correctOption,
            accepted_words AS acceptedWords

          FROM education_little_questions

          WHERE
            active = 1
            AND level <= ?
            AND skill_code = ?

          ORDER BY RANDOM()

          LIMIT 5
          `,
        )
        .bind(
          level,
          skill,
        );
  } else {
    statement =
      env.gyan_registry
        .prepare(
          `
          SELECT
            id,
            skill_code AS skillCode,
            level,
            prompt_text AS promptText,
            question_type AS questionType,
            option_a AS optionA,
            option_b AS optionB,
            option_c AS optionC,
            correct_option AS correctOption,
            accepted_words AS acceptedWords

          FROM education_little_questions

          WHERE
            active = 1
            AND level <= ?

          ORDER BY RANDOM()

          LIMIT 5
          `,
        )
        .bind(
          level,
        );
  }

  const result =
    await statement.all<{
      id: number;
      skillCode: string;
      level: number;
      promptText: string;
      questionType:
        | "tap"
        | "speak";
      optionA:
        string |
        null;
      optionB:
        string |
        null;
      optionC:
        string |
        null;
      correctOption:
        string |
        null;
      acceptedWords:
        string |
        null;
    }>();

  return jsonResponse({
    questions:
      result.results.map(
        (
          row,
        ) => ({
          id:
            row.id,

          skillCode:
            row.skillCode,

          level:
            row.level,

          promptText:
            row.promptText,

          questionType:
            row.questionType,

          options:
            [
              row.optionA,
              row.optionB,
              row.optionC,
            ]
              .filter(
                (
                  value,
                ):
                  value is string =>
                    Boolean(
                      value,
                    ),
              ),

          /*
           * V1 returns correctOption to the client so
           * feedback can be instant/offline-ish.
           * Do not use this pattern for scored exams.
           */
          correctOption:
            row.correctOption,

          acceptedWords:
            (
              row.acceptedWords ??
              ""
            )
              .split("|")
              .map(
                (
                  word,
                ) =>
                  word.trim(),
              )
              .filter(
                Boolean,
              ),
        }),
      ),
  });
}


async function saveAttempt(
  request: Request,
  env: Env,
): Promise<Response> {
  let body:
    {
      studentCode?: unknown;
      questionId?: unknown;
      responseType?: unknown;
      responseValue?: unknown;
      correct?: unknown;
    };

  try {
    body =
      await request.json() as
        typeof body;
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid JSON.",
      },
      400,
    );
  }

  const questionId =
    Number(
      body.questionId,
    );

  const studentCode =
    String(
      body.studentCode ??
      "",
    )
      .trim()
      .toUpperCase();

  const responseType =
    String(
      body.responseType ??
      "",
    );

  if (
    !Number.isInteger(
      questionId,
    ) ||
    ![
      "tap",
      "speech",
      "parent",
    ].includes(
      responseType,
    )
  ) {
    return jsonResponse(
      {
        error:
          "Invalid learning attempt.",
      },
      400,
    );
  }

  let studentId:
    number |
    null =
      null;

  if (
    studentCode
  ) {
    const student =
      await getStudentForUser(
        env,
        request,
        studentCode,
      );

    studentId =
      student?.id ??
      null;
  }

  await env.gyan_registry
    .prepare(
      `
      INSERT INTO education_little_attempts (
        student_id,
        question_id,
        response_type,
        response_value,
        correct,
        created_at
      )
      VALUES (
        ?, ?, ?, ?, ?,
        CURRENT_TIMESTAMP
      )
      `,
    )
    .bind(
      studentId,
      questionId,
      responseType,
      String(
        body.responseValue ??
        "",
      )
        .trim()
        .slice(
          0,
          100,
        ),

      body.correct
        ? 1
        : 0,
    )
    .run();

  return jsonResponse({
    saved:
      true,
  });
}


async function listWords(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  const studentCode =
    String(
      url.searchParams.get(
        "student",
      ) ??
      "",
    )
      .trim()
      .toUpperCase();

  const student =
    await getStudentForUser(
      env,
      request,
      studentCode,
    );

  if (!student) {
    return jsonResponse(
      {
        error:
          "Verify the saved email to view words.",
      },
      401,
    );
  }

  const words =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          word,
          status,
          first_observed_at AS firstObservedAt,
          first_independent_at AS firstIndependentAt

        FROM education_child_words

        WHERE student_id = ?

        ORDER BY
          CASE
            WHEN first_independent_at IS NULL
              THEN first_observed_at
            ELSE first_independent_at
          END DESC,
          word
        `,
      )
      .bind(
        student.id,
      )
      .all();

  const monthly =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          strftime(
            '%Y-%m',
            first_independent_at
          ) AS month,

          COUNT(*) AS newWords

        FROM education_child_words

        WHERE
          student_id = ?
          AND first_independent_at IS NOT NULL

        GROUP BY month
        ORDER BY month
        `,
      )
      .bind(
        student.id,
      )
      .all<{
        month: string;
        newWords: number;
      }>();

  let cumulative =
    0;

  return jsonResponse({
    student: {
      code:
        student.student_code,

      name:
        student.student_name,
    },

    words:
      words.results,

    monthly:
      monthly.results.map(
        (
          row,
        ) => {
          cumulative +=
            Number(
              row.newWords,
            );

          return {
            month:
              row.month,

            count:
              cumulative,
          };
        },
      ),
  });
}


async function saveWord(
  request: Request,
  env: Env,
): Promise<Response> {
  let body:
    {
      studentCode?: unknown;
      word?: unknown;
      status?: unknown;
    };

  try {
    body =
      await request.json() as
        typeof body;
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid JSON.",
      },
      400,
    );
  }

  const studentCode =
    String(
      body.studentCode ??
      "",
    )
      .trim()
      .toUpperCase();

  const word =
    String(
      body.word ??
      "",
    )
      .trim()
      .slice(
        0,
        80,
      );

  const normalized =
    normalizeWord(
      word,
    );

  const status =
    String(
      body.status ??
      "",
    );

  if (
    !normalized ||
    ![
      "emerging",
      "independent",
    ].includes(
      status,
    )
  ) {
    return jsonResponse(
      {
        error:
          "Word and status are required.",
      },
      400,
    );
  }

  const student =
    await getStudentForUser(
      env,
      request,
      studentCode,
    );

  if (!student) {
    return jsonResponse(
      {
        error:
          "Verify the saved email before editing words.",
      },
      401,
    );
  }

  const independentAt =
    status ===
      "independent"
      ? new Date()
          .toISOString()
      : null;

  await env.gyan_registry
    .prepare(
      `
      INSERT INTO education_child_words (
        student_id,
        word,
        normalized_word,
        status,
        first_observed_at,
        first_independent_at,
        created_at,
        updated_at
      )
      VALUES (
        ?, ?, ?, ?,
        CURRENT_TIMESTAMP,
        ?,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
      )

      ON CONFLICT(
        student_id,
        normalized_word
      )
      DO UPDATE SET
        word =
          excluded.word,

        status =
          CASE
            WHEN education_child_words.status = 'independent'
              THEN 'independent'
            ELSE excluded.status
          END,

        first_independent_at =
          CASE
            WHEN education_child_words.first_independent_at IS NOT NULL
              THEN education_child_words.first_independent_at
            WHEN excluded.status = 'independent'
              THEN excluded.first_independent_at
            ELSE NULL
          END,

        updated_at =
          CURRENT_TIMESTAMP
      `,
    )
    .bind(
      student.id,
      word,
      normalized,
      status,
      independentAt,
    )
    .run();

  return jsonResponse({
    saved:
      true,
  });
}


export async function handleLittleLearnersRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/education/little/questions"
  ) {
    return getQuestions(
      env,
      url,
    );
  }

  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/education/little/attempt"
  ) {
    return saveAttempt(
      request,
      env,
    );
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/education/little/words"
  ) {
    return listWords(
      request,
      env,
      url,
    );
  }

  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/education/little/words"
  ) {
    return saveWord(
      request,
      env,
    );
  }

  return null;
}
