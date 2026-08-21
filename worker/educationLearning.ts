type EducationQuestionRow = {
  id: number;
  question_key: string;
  difficulty: "easy" | "medium" | "challenge";
  question_text: string;
  choice_a: string;
  choice_b: string;
  choice_c: string;
  choice_d: string;
};

function json(
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

function textParam(
  url: URL,
  name: string,
): string {
  return (
    url.searchParams.get(name) ??
    ""
  )
    .trim()
    .toUpperCase();
}


async function getSubjects(
  env: Env,
  url: URL,
): Promise<Response> {
  const country =
    textParam(
      url,
      "country",
    );

  const grade =
    textParam(
      url,
      "grade",
    );

  if (
    !country ||
    !grade
  ) {
    return json(
      {
        error:
          "country and grade are required.",
      },
      400,
    );
  }

  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          subject_code AS code,
          subject_name AS name
        FROM education_subjects
        WHERE
          country_code = ?
          AND grade_code = ?
          AND enabled = 1
        ORDER BY
          sort_order,
          subject_name
        `,
      )
      .bind(
        country,
        grade,
      )
      .all<{
        code: string;
        name: string;
      }>();

  return json({
    subjects:
      result.results,
  });
}


async function getTopics(
  env: Env,
  url: URL,
): Promise<Response> {
  const country =
    textParam(
      url,
      "country",
    );

  const grade =
    textParam(
      url,
      "grade",
    );

  const subject =
    textParam(
      url,
      "subject",
    );

  if (
    !country ||
    !grade ||
    !subject
  ) {
    return json(
      {
        error:
          "country, grade and subject are required.",
      },
      400,
    );
  }

  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          t.topic_code AS code,
          t.topic_name AS name,

          (
            SELECT COUNT(*)
            FROM education_subtopics st
            WHERE
              st.topic_id = t.id
              AND st.enabled = 1
          ) AS subtopicCount,

          (
            SELECT COUNT(*)
            FROM education_questions q
            JOIN education_subtopics st2
              ON st2.id = q.subtopic_id
            WHERE
              st2.topic_id = t.id
              AND st2.enabled = 1
              AND q.active = 1
          ) AS questionCount

        FROM education_topics t

        JOIN education_subjects s
          ON s.id = t.subject_id

        WHERE
          s.country_code = ?
          AND s.grade_code = ?
          AND s.subject_code = ?
          AND s.enabled = 1
          AND t.enabled = 1

        ORDER BY
          t.sort_order,
          t.topic_name
        `,
      )
      .bind(
        country,
        grade,
        subject,
      )
      .all<{
        code: string;
        name: string;
        subtopicCount: number;
        questionCount: number;
      }>();

  return json({
    topics:
      result.results,
  });
}


async function getSubtopics(
  env: Env,
  url: URL,
): Promise<Response> {
  const country =
    textParam(
      url,
      "country",
    );

  const grade =
    textParam(
      url,
      "grade",
    );

  const subject =
    textParam(
      url,
      "subject",
    );

  const topic =
    textParam(
      url,
      "topic",
    );

  if (
    !country ||
    !grade ||
    !subject ||
    !topic
  ) {
    return json(
      {
        error:
          "country, grade, subject and topic are required.",
      },
      400,
    );
  }

  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          st.subtopic_code AS code,
          st.subtopic_name AS name,

          (
            SELECT COUNT(*)
            FROM education_questions q
            WHERE
              q.subtopic_id = st.id
              AND q.active = 1
          ) AS questionCount

        FROM education_subtopics st

        JOIN education_topics t
          ON t.id = st.topic_id

        JOIN education_subjects s
          ON s.id = t.subject_id

        WHERE
          s.country_code = ?
          AND s.grade_code = ?
          AND s.subject_code = ?
          AND t.topic_code = ?
          AND st.enabled = 1

        ORDER BY
          st.sort_order,
          st.subtopic_name
        `,
      )
      .bind(
        country,
        grade,
        subject,
        topic,
      )
      .all<{
        code: string;
        name: string;
        questionCount: number;
      }>();

  return json({
    subtopics:
      result.results,
  });
}


async function getPractice(
  env: Env,
  url: URL,
): Promise<Response> {
  const country =
    textParam(
      url,
      "country",
    );

  const grade =
    textParam(
      url,
      "grade",
    );

  const subject =
    textParam(
      url,
      "subject",
    );

  const topic =
    textParam(
      url,
      "topic",
    );

  const subtopic =
    textParam(
      url,
      "subtopic",
    );

  if (
    !country ||
    !grade ||
    !subject ||
    !topic
  ) {
    return json(
      {
        error:
          "country, grade, subject and topic are required.",
      },
      400,
    );
  }

  const whereSubtopic =
    subtopic
      ? "AND st.subtopic_code = ?"
      : "";

  const statement =
    env.gyan_registry
      .prepare(
        `
        SELECT
          q.id,
          q.question_key,
          q.difficulty,
          q.question_text,
          q.choice_a,
          q.choice_b,
          q.choice_c,
          q.choice_d

        FROM education_questions q

        JOIN education_subtopics st
          ON st.id = q.subtopic_id

        JOIN education_topics t
          ON t.id = st.topic_id

        JOIN education_subjects s
          ON s.id = t.subject_id

        WHERE
          s.country_code = ?
          AND s.grade_code = ?
          AND s.subject_code = ?
          AND t.topic_code = ?
          ${whereSubtopic}
          AND st.enabled = 1
          AND q.active = 1

        ORDER BY
          RANDOM()

        LIMIT 5
        `,
      );

  const bound =
    subtopic
      ? statement.bind(
          country,
          grade,
          subject,
          topic,
          subtopic,
        )
      : statement.bind(
          country,
          grade,
          subject,
          topic,
        );

  const result =
    await bound
      .all<EducationQuestionRow>();

  return json({
    questions:
      result.results.map(
        (
          row,
        ) => ({
          id:
            row.id,

          key:
            row.question_key,

          difficulty:
            row.difficulty,

          text:
            row.question_text,

          choices: [
            row.choice_a,
            row.choice_b,
            row.choice_c,
            row.choice_d,
          ],
        }),
      ),
  });
}


async function checkAnswer(
  request: Request,
  env: Env,
): Promise<Response> {
  let body:
    {
      questionId?: unknown;
      choice?: unknown;
    };

  try {
    body =
      await request.json() as
        typeof body;
  } catch {
    return json(
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

  const choice =
    String(
      body.choice ??
      "",
    )
      .trim()
      .toUpperCase();

  if (
    !Number.isInteger(
      questionId,
    ) ||
    ![
      "A",
      "B",
      "C",
      "D",
    ].includes(
      choice,
    )
  ) {
    return json(
      {
        error:
          "questionId and choice are required.",
      },
      400,
    );
  }

  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          correct_choice,
          explanation

        FROM education_questions

        WHERE
          id = ?
          AND active = 1

        LIMIT 1
        `,
      )
      .bind(
        questionId,
      )
      .first<{
        correct_choice: string;
        explanation: string;
      }>();

  if (!row) {
    return json(
      {
        error:
          "Question not found.",
      },
      404,
    );
  }

  return json({
    correct:
      row.correct_choice ===
      choice,

    correctChoice:
      row.correct_choice,

    explanation:
      row.explanation,
  });
}


export async function handleEducationLearningRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/education/subjects"
  ) {
    return getSubjects(
      env,
      url,
    );
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/education/topics"
  ) {
    return getTopics(
      env,
      url,
    );
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/education/subtopics"
  ) {
    return getSubtopics(
      env,
      url,
    );
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/education/practice"
  ) {
    return getPractice(
      env,
      url,
    );
  }

  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/education/check-answer"
  ) {
    return checkAnswer(
      request,
      env,
    );
  }

  return null;
}
