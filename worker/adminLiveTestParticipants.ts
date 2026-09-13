import {
  getAdminSession,
} from "./adminAuth";


type ParticipantType =
  | "GYAN"
  | "SYNTHETIC";


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


async function requireAdmin(
  request:
    Request,

  env:
    Env,
): Promise<Response | null> {
  const session =
    await getAdminSession(
      request,
      env,
    );

  return session
    ? null
    : json(
        {
          error:
            "Administrator authentication is required.",
        },
        401,
      );
}


async function testByCode(
  env:
    Env,

  code:
    string,
): Promise<{
  id:
    number;

  public_code:
    string;

  program_code:
    string;
} | null> {
  return env.gyan_registry
    .prepare(
      `
      SELECT
        id,
        public_code,
        program_code

      FROM education_live_tests

      WHERE
        UPPER(public_code) = ?

      LIMIT 1
      `,
    )
    .bind(
      code,
    )
    .first<{
      id:
        number;

      public_code:
        string;

      program_code:
        string;
    }>();
}


async function summary(
  env:
    Env,

  liveTestId:
    number,
): Promise<{
  humanCount:
    number;

  botCount:
    number;

  humanSubmitted:
    number;

  botSubmitted:
    number;
}> {
  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          SUM(
            CASE
              WHEN participant_type = 'GYAN'
              THEN 1
              ELSE 0
            END
          ) AS human_count,

          SUM(
            CASE
              WHEN participant_type = 'SYNTHETIC'
              THEN 1
              ELSE 0
            END
          ) AS bot_count,

          SUM(
            CASE
              WHEN
                participant_type = 'GYAN'
                AND submitted_at IS NOT NULL
              THEN 1
              ELSE 0
            END
          ) AS human_submitted,

          SUM(
            CASE
              WHEN
                participant_type = 'SYNTHETIC'
                AND submitted_at IS NOT NULL
              THEN 1
              ELSE 0
            END
          ) AS bot_submitted

        FROM education_live_entries

        WHERE
          live_test_id = ?
        `,
      )
      .bind(
        liveTestId,
      )
      .first<{
        human_count:
          number | null;

        bot_count:
          number | null;

        human_submitted:
          number | null;

        bot_submitted:
          number | null;
      }>();

  return {
    humanCount:
      Number(
        row?.human_count ??
        0,
      ),

    botCount:
      Number(
        row?.bot_count ??
        0,
      ),

    humanSubmitted:
      Number(
        row?.human_submitted ??
        0,
      ),

    botSubmitted:
      Number(
        row?.bot_submitted ??
        0,
      ),
  };
}


export async function handleAdminLiveTestParticipantsRoute(
  request:
    Request,

  env:
    Env,

  url:
    URL,
): Promise<Response | null> {
  if (
    request.method !==
      "GET"
  ) {
    return null;
  }

  if (
    url.pathname !==
      "/api/admin/live-tests/participants" &&
    url.pathname !==
      "/api/admin/live-tests/participants/result"
  ) {
    return null;
  }

  const adminError =
    await requireAdmin(
      request,
      env,
    );

  if (
    adminError
  ) {
    return adminError;
  }

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

  const test =
    await testByCode(
      env,
      code,
    );

  if (!test) {
    return json(
      {
        error:
          "Live Test not found.",
      },
      404,
    );
  }


  if (
    url.pathname ===
      "/api/admin/live-tests/participants"
  ) {
    const counts =
      await summary(
        env,
        Number(
          test.id,
        ),
      );

    const requestedType =
      (
        url.searchParams
          .get(
            "type",
          ) ??
        ""
      )
        .trim()
        .toUpperCase();

    if (
      !requestedType
    ) {
      return json({
        code:
          test.public_code,

        summary:
          counts,
      });
    }

    if (
      requestedType !==
        "GYAN" &&
      requestedType !==
        "SYNTHETIC"
    ) {
      return json(
        {
          error:
            "Participant type must be GYAN or SYNTHETIC.",
        },
        400,
      );
    }

    const rows =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            le.participant_type,
            le.participant_key,
            le.entered_at,
            le.submitted_at,
            le.attempt_id,

            COALESCE(
              a.question_count,
              0
            ) AS question_count,

            COALESCE(
              a.answered_count,
              0
            ) AS answered_count,

            a.correct_count,
            a.incorrect_count,
            a.unanswered_count

          FROM education_live_entries le

          LEFT JOIN education_live_attempts a
            ON a.id =
               le.attempt_id

          WHERE
            le.live_test_id = ?
            AND le.participant_type = ?

          ORDER BY
            CASE
              WHEN a.correct_count IS NULL
              THEN 1
              ELSE 0
            END,

            a.correct_count DESC,

            a.submitted_at ASC,

            le.entered_at ASC
          `,
        )
        .bind(
          Number(
            test.id,
          ),
          requestedType,
        )
        .all<{
          participant_type:
            ParticipantType;

          participant_key:
            string;

          entered_at:
            string | null;

          submitted_at:
            string | null;

          attempt_id:
            number | null;

          question_count:
            number;

          answered_count:
            number;

          correct_count:
            number | null;

          incorrect_count:
            number | null;

          unanswered_count:
            number | null;
        }>();

    return json({
      code:
        test.public_code,

      summary:
        counts,

      participants:
        rows.results.map(
          (
            row,
          ) => {
            const questionCount =
              Number(
                row.question_count ??
                0,
              );

            const correctCount =
              row.correct_count ===
                null
                ? null
                : Number(
                    row.correct_count,
                  );

            return {
              participantType:
                row.participant_type,

              participantKey:
                String(
                  row.participant_key ??
                  "",
                ),

              enteredAt:
                row.entered_at,

              submittedAt:
                row.submitted_at,

              attemptId:
                row.attempt_id ===
                  null
                  ? null
                  : Number(
                      row.attempt_id,
                    ),

              questionCount,

              answeredCount:
                Number(
                  row.answered_count ??
                  0,
                ),

              correctCount,

              incorrectCount:
                row.incorrect_count ===
                  null
                  ? null
                  : Number(
                      row.incorrect_count,
                    ),

              unansweredCount:
                row.unanswered_count ===
                  null
                  ? null
                  : Number(
                      row.unanswered_count,
                    ),

              scorePercent:
                correctCount ===
                  null ||
                questionCount <=
                  0
                  ? null
                  : Math.round(
                      (
                        correctCount /
                        questionCount
                      ) *
                        100,
                    ),
            };
          },
        ),
    });
  }


  const attemptId =
    Number(
      url.searchParams
        .get(
          "attemptId",
        ),
    );

  if (
    !Number.isInteger(
      attemptId,
    ) ||
    attemptId <=
      0
  ) {
    return json(
      {
        error:
          "A valid attemptId is required.",
      },
      400,
    );
  }

  const attempt =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          participant_type,
          participant_key,
          question_count,
          answered_count,
          correct_count,
          incorrect_count,
          unanswered_count,
          started_at,
          submitted_at

        FROM education_live_attempts

        WHERE
          id = ?
          AND live_test_id = ?

        LIMIT 1
        `,
      )
      .bind(
        attemptId,
        Number(
          test.id,
        ),
      )
      .first<{
        id:
          number;

        participant_type:
          ParticipantType;

        participant_key:
          string;

        question_count:
          number;

        answered_count:
          number;

        correct_count:
          number;

        incorrect_count:
          number;

        unanswered_count:
          number;

        started_at:
          string | null;

        submitted_at:
          string | null;
      }>();

  if (!attempt) {
    return json(
      {
        error:
          "Live Test attempt not found.",
      },
      404,
    );
  }

  const questions =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          aa.question_id,
          aa.question_order,
          aa.section_code,
          aa.selected_choice,
          aa.correct_choice,
          aa.is_correct,

          q.question_text,
          q.choice_a,
          q.choice_b,
          q.choice_c,
          q.choice_d,
          q.explanation

        FROM education_live_attempt_answers aa

        INNER JOIN education_questions q
          ON q.id =
             aa.question_id

        WHERE
          aa.attempt_id = ?

        ORDER BY
          aa.question_order
        `,
      )
      .bind(
        attemptId,
      )
      .all<{
        question_id:
          number;

        question_order:
          number;

        section_code:
          string | null;

        selected_choice:
          string | null;

        correct_choice:
          string;

        is_correct:
          number;

        question_text:
          string;

        choice_a:
          string;

        choice_b:
          string;

        choice_c:
          string;

        choice_d:
          string;

        explanation:
          string | null;
      }>();

  const questionCount =
    Number(
      attempt.question_count ??
      0,
    );

  const correctCount =
    Number(
      attempt.correct_count ??
      0,
    );

  return json({
    test: {
      code:
        test.public_code,

      program:
        test.program_code,
    },

    participant: {
      participantType:
        attempt.participant_type,

      participantKey:
        String(
          attempt.participant_key,
        ),
    },

    attempt: {
      id:
        Number(
          attempt.id,
        ),

      questionCount,

      answeredCount:
        Number(
          attempt.answered_count ??
          0,
        ),

      correctCount,

      incorrectCount:
        Number(
          attempt.incorrect_count ??
          0,
        ),

      unansweredCount:
        Number(
          attempt.unanswered_count ??
          0,
        ),

      scorePercent:
        questionCount >
          0
          ? Math.round(
              (
                correctCount /
                questionCount
              ) *
                100,
            )
          : 0,

      startedAt:
        attempt.started_at,

      submittedAt:
        attempt.submitted_at,
    },

    questions:
      questions.results.map(
        (
          row,
        ) => ({
          questionId:
            Number(
              row.question_id,
            ),

          questionOrder:
            Number(
              row.question_order,
            ),

          section:
            row.section_code,

          questionText:
            row.question_text,

          choices: {
            A:
              row.choice_a,

            B:
              row.choice_b,

            C:
              row.choice_c,

            D:
              row.choice_d,
          },

          selectedChoice:
            row.selected_choice,

          correctChoice:
            row.correct_choice,

          correct:
            Boolean(
              row.is_correct,
            ),

          explanation:
            row.explanation,
        }),
      ),
  });
}
