type EducationQuestionRow = {
  id: number;
  subtopic_id: number;
  question_key: string;
  difficulty: "easy" | "medium" | "challenge";
  question_text: string;
  choice_a: string;
  choice_b: string;
  choice_c: string;
  choice_d: string;
};

type PracticeCursorRow = {
  last_subtopic_id: number;
  last_question_id: number;
  completed_cycles: number;
};

type PracticeSubtopicRow = {
  id: number;
};

const PRACTICE_BATCH_SIZE = 5;
const GYAN_GUEST_COOKIE = "gyan_anon";

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

function cookieValue(
  request: Request,
  name: string,
): string {
  const cookie =
    request.headers.get("cookie") ??
    "";

  for (
    const part
    of cookie.split(";")
  ) {
    const [
      key,
      ...rest
    ] =
      part
        .trim()
        .split("=");

    if (key === name) {
      return decodeURIComponent(
        rest.join("="),
      );
    }
  }

  return "";
}

async function sha256Hex(
  value: string,
): Promise<string> {
  const bytes =
    new TextEncoder()
      .encode(value);

  const digest =
    await crypto.subtle.digest(
      "SHA-256",
      bytes,
    );

  return Array.from(
    new Uint8Array(
      digest,
    ),
  )
    .map(
      (byte) =>
        byte
          .toString(16)
          .padStart(2, "0"),
    )
    .join("");
}

/*
 * Resolve the active GYAN card from the existing browser-session cookie.
 *
 * We intentionally do not UPDATE gyan_browser_sessions.last_seen_at here:
 * loading five practice questions should stay read-light and should not
 * create an extra D1 write on every "New 5".
 */
async function currentGyanAccountId(
  request: Request,
  env: Env,
): Promise<number | null> {
  const token =
    cookieValue(
      request,
      GYAN_GUEST_COOKIE,
    );

  if (!token) {
    return null;
  }

  const secretHash =
    await sha256Hex(token);

  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT account_id
        FROM gyan_browser_sessions
        WHERE secret_hash = ?
        LIMIT 1
        `,
      )
      .bind(secretHash)
      .first<{
        account_id: number;
      }>();

  return row
    ? Number(row.account_id)
    : null;
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
          AND s.enabled = 1
          AND t.enabled = 1
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

async function loadSequentialQuestions(
  env: Env,
  subtopicIds: number[],
  startSubtopicId: number,
  startQuestionId: number,
): Promise<{
  questions: EducationQuestionRow[];
  lastSubtopicId: number;
  lastQuestionId: number;
  wrapped: boolean;
}> {
  if (subtopicIds.length === 0) {
    return {
      questions: [],
      lastSubtopicId: 0,
      lastQuestionId: 0,
      wrapped: false,
    };
  }

  let startIndex =
    subtopicIds.indexOf(
      startSubtopicId,
    );

  if (startIndex < 0) {
    startIndex = 0;
    startQuestionId = 0;
  }

  const questions:
    EducationQuestionRow[] = [];

  const seen =
    new Set<number>();

  let subtopicIndex =
    startIndex;

  let afterQuestionId =
    startQuestionId;

  let wrapped =
    false;

  let lastSubtopicId =
    startSubtopicId;

  let lastQuestionId =
    startQuestionId;

  /*
   * At most two passes through the subtopic list:
   *   pass 1 = continue from the saved cursor;
   *   pass 2 = wrap to the beginning if needed.
   *
   * Every question query is an indexed range query:
   *   subtopic_id = ?
   *   active = 1
   *   id > ?
   *   ORDER BY id
   *   LIMIT <= 5
   */
  const maxSubtopicVisits =
    Math.max(
      subtopicIds.length * 2,
      1,
    );

  let visits = 0;

  while (
    questions.length <
      PRACTICE_BATCH_SIZE &&
    visits <
      maxSubtopicVisits
  ) {
    const subtopicId =
      subtopicIds[
        subtopicIndex
      ];

    const remaining =
      PRACTICE_BATCH_SIZE -
      questions.length;

    const result =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            id,
            subtopic_id,
            question_key,
            difficulty,
            question_text,
            choice_a,
            choice_b,
            choice_c,
            choice_d
          FROM education_questions
          WHERE
            subtopic_id = ?
            AND active = 1
            AND id > ?
          ORDER BY id
          LIMIT ?
          `,
        )
        .bind(
          subtopicId,
          afterQuestionId,
          remaining,
        )
        .all<EducationQuestionRow>();

    for (
      const row
      of result.results
    ) {
      if (
        seen.has(row.id)
      ) {
        continue;
      }

      seen.add(row.id);
      questions.push(row);

      lastSubtopicId =
        subtopicId;

      lastQuestionId =
        row.id;

      if (
        questions.length >=
        PRACTICE_BATCH_SIZE
      ) {
        break;
      }
    }

    if (
      questions.length >=
      PRACTICE_BATCH_SIZE
    ) {
      break;
    }

    /*
     * No more usable questions in this subtopic for this pass.
     * Move to the next enabled subtopic and start from its beginning.
     */
    subtopicIndex += 1;
    afterQuestionId = 0;
    visits += 1;

    if (
      subtopicIndex >=
      subtopicIds.length
    ) {
      subtopicIndex = 0;
      wrapped = true;
    }

    /*
     * Once wrapped, duplicate protection above prevents returning the
     * same question twice if a topic contains fewer than five questions.
     */
  }

  return {
    questions,
    lastSubtopicId:
      questions.length > 0
        ? lastSubtopicId
        : 0,
    lastQuestionId:
      questions.length > 0
        ? lastQuestionId
        : 0,
    wrapped,
  };
}

async function getPractice(
  request: Request,
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

  /*
   * Normal page loads / refreshes do NOT advance.
   * Only the explicit "New 5" request sends advance=1.
   */
  const advanceParam =
    url.searchParams.get(
      "advance",
    )
      ?.trim()
      .toLowerCase();

  const advance =
    advanceParam === "1" ||
    advanceParam === "true";

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

  const topicRow =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          t.id AS topicId
        FROM education_topics t

        JOIN education_subjects s
          ON s.id = t.subject_id

        WHERE
          s.country_code = ?
          AND s.grade_code = ?
          AND s.subject_code = ?
          AND t.topic_code = ?
          AND s.enabled = 1
          AND t.enabled = 1
        LIMIT 1
        `,
      )
      .bind(
        country,
        grade,
        subject,
        topic,
      )
      .first<{
        topicId: number;
      }>();

  if (!topicRow) {
    return json(
      {
        error:
          "Topic not found.",
      },
      404,
    );
  }

  const topicId =
    Number(
      topicRow.topicId,
    );

  let subtopicRows:
    PracticeSubtopicRow[];

  if (subtopic) {
    const selected =
      await env.gyan_registry
        .prepare(
          `
          SELECT id
          FROM education_subtopics
          WHERE
            topic_id = ?
            AND subtopic_code = ?
            AND enabled = 1
          LIMIT 1
          `,
        )
        .bind(
          topicId,
          subtopic,
        )
        .first<PracticeSubtopicRow>();

    subtopicRows =
      selected
        ? [selected]
        : [];
  } else {
    const result =
      await env.gyan_registry
        .prepare(
          `
          SELECT id
          FROM education_subtopics
          WHERE
            topic_id = ?
            AND enabled = 1
          ORDER BY
            sort_order,
            id
          `,
        )
        .bind(topicId)
        .all<PracticeSubtopicRow>();

    subtopicRows =
      result.results;
  }

  if (
    subtopicRows.length === 0
  ) {
    return json({
      questions: [],
    });
  }

  const subtopicIds =
    subtopicRows.map(
      (row) =>
        Number(row.id),
    );

  const placeholders =
    subtopicIds
      .map(() => "?")
      .join(", ");

  const totalRow =
    await env.gyan_registry
      .prepare(
        `
        SELECT COUNT(*) AS total
        FROM education_questions
        WHERE
          active = 1
          AND subtopic_id IN (${placeholders})
        `,
      )
      .bind(
        ...subtopicIds,
      )
      .first<{
        total: number;
      }>();

  const totalQuestions =
    Number(
      totalRow?.total ??
      0,
    );

  const scopeKey =
    subtopic
      ? `SUBTOPIC:${subtopicIds[0]}`
      : `TOPIC:${topicId}`;

  const gyanAccountId =
    await currentGyanAccountId(
      request,
      env,
    );

  let cursor:
    PracticeCursorRow | null =
      null;

  if (gyanAccountId) {
    cursor =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            last_subtopic_id,
            last_question_id,
            completed_cycles
          FROM education_practice_cursors
          WHERE
            gyan_account_id = ?
            AND scope_key = ?
          LIMIT 1
          `,
        )
        .bind(
          gyanAccountId,
          scopeKey,
        )
        .first<PracticeCursorRow>();
  }

  /*
   * IMPORTANT CURSOR SEMANTICS
   *
   * The stored cursor means:
   *   "the question immediately BEFORE the currently displayed batch".
   *
   * Therefore:
   *   cursor 0  -> display Q1..Q5
   *   refresh   -> cursor remains 0 -> display Q1..Q5 again
   *   New 5     -> cursor becomes Q5 -> display Q6..Q10
   */
  let batchStartSubtopicId =
    Number(
      cursor?.last_subtopic_id ??
      subtopicIds[0],
    );

  let batchStartQuestionId =
    Number(
      cursor?.last_question_id ??
      0,
    );

  let completedCycles =
    Number(
      cursor?.completed_cycles ??
      0,
    );

  /*
   * If the user explicitly clicked "New 5", first determine the tail
   * of the current batch. That tail becomes the start cursor for the
   * next batch.
   *
   * This costs only one additional indexed <=5-row range walk and
   * avoids accidental advancement on page reloads, retries, or refreshes.
   */
  if (advance) {
    const currentBatch =
      await loadSequentialQuestions(
        env,
        subtopicIds,
        batchStartSubtopicId,
        batchStartQuestionId,
      );

    if (
      currentBatch.questions.length >
      0
    ) {
      batchStartSubtopicId =
        currentBatch.lastSubtopicId;

      batchStartQuestionId =
        currentBatch.lastQuestionId;
    }
  }

  const batch =
    await loadSequentialQuestions(
      env,
      subtopicIds,
      batchStartSubtopicId,
      batchStartQuestionId,
    );

  let startPosition = 0;

  if (
    batch.questions.length > 0
  ) {
    const firstQuestion =
      batch.questions[0];

    const firstSubtopicIndex =
      subtopicIds.indexOf(
        Number(
          firstQuestion.subtopic_id,
        ),
      );

    let questionsBefore = 0;

    if (
      firstSubtopicIndex > 0
    ) {
      const priorSubtopicIds =
        subtopicIds.slice(
          0,
          firstSubtopicIndex,
        );

      const priorPlaceholders =
        priorSubtopicIds
          .map(() => "?")
          .join(", ");

      const priorRow =
        await env.gyan_registry
          .prepare(
            `
            SELECT COUNT(*) AS count
            FROM education_questions
            WHERE
              active = 1
              AND subtopic_id IN (${priorPlaceholders})
            `,
          )
          .bind(
            ...priorSubtopicIds,
          )
          .first<{
            count: number;
          }>();

      questionsBefore =
        Number(
          priorRow?.count ??
          0,
        );
    }

    const withinRow =
      await env.gyan_registry
        .prepare(
          `
          SELECT COUNT(*) AS count
          FROM education_questions
          WHERE
            active = 1
            AND subtopic_id = ?
            AND id <= ?
          `,
        )
        .bind(
          firstQuestion.subtopic_id,
          firstQuestion.id,
        )
        .first<{
          count: number;
        }>();

    startPosition =
      questionsBefore +
      Number(
        withinRow?.count ??
        1,
      );
  }

  const endPosition =
    batch.questions.length > 0
      ? Math.min(
          totalQuestions,
          startPosition +
            batch.questions.length -
            1,
        )
      : 0;

  const hasMore =
    totalQuestions > 0 &&
    endPosition <
      totalQuestions;

  /*
   * Persist only on:
   *   1) first-ever load for this GYAN/scope, so refresh has a stable start;
   *   2) explicit New 5.
   *
   * Ordinary refreshes never move the cursor.
   */
  if (
    gyanAccountId &&
    batch.questions.length > 0 &&
    (
      !cursor ||
      advance
    )
  ) {
    const completedCycleDelta =
      advance &&
      batch.wrapped
        ? 1
        : 0;

    completedCycles +=
      completedCycleDelta;

    await env.gyan_registry
      .prepare(
        `
        INSERT INTO education_practice_cursors (
          gyan_account_id,
          scope_key,
          last_subtopic_id,
          last_question_id,
          completed_cycles,
          updated_at
        )
        VALUES (
          ?, ?, ?, ?, ?,
          CURRENT_TIMESTAMP
        )

        ON CONFLICT(
          gyan_account_id,
          scope_key
        )
        DO UPDATE SET
          last_subtopic_id =
            excluded.last_subtopic_id,
          last_question_id =
            excluded.last_question_id,
          completed_cycles =
            excluded.completed_cycles,
          updated_at =
            CURRENT_TIMESTAMP
        `,
      )
      .bind(
        gyanAccountId,
        scopeKey,
        batchStartSubtopicId,
        batchStartQuestionId,
        completedCycles,
      )
      .run();
  }

  return json({
    questions:
      batch.questions.map(
        (row) => ({
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

    sequence: {
      mode:
        "sequential",
      advanced:
        advance,
      wrapped:
        batch.wrapped,
      completedCycles,
      start:
        startPosition,
      end:
        endPosition,
      total:
        totalQuestions,
      hasMore,
    },
  });
}

async function completePracticeBatch(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  const country = textParam(url, "country");
  const grade = textParam(url, "grade");
  const subject = textParam(url, "subject");
  const topic = textParam(url, "topic");
  const subtopic = textParam(url, "subtopic");

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

  const gyanAccountId =
    await currentGyanAccountId(
      request,
      env,
    );

  if (!gyanAccountId) {
    return json({
      completed: false,
      reason: "No active GYAN session.",
    });
  }

  const topicRow =
    await env.gyan_registry
      .prepare(
        `
        SELECT t.id AS topicId
        FROM education_topics t
        JOIN education_subjects s
          ON s.id = t.subject_id
        WHERE
          s.country_code = ?
          AND s.grade_code = ?
          AND s.subject_code = ?
          AND t.topic_code = ?
          AND s.enabled = 1
          AND t.enabled = 1
        LIMIT 1
        `,
      )
      .bind(
        country,
        grade,
        subject,
        topic,
      )
      .first<{
        topicId: number;
      }>();

  if (!topicRow) {
    return json(
      {
        error:
          "Topic not found.",
      },
      404,
    );
  }

  const topicId =
    Number(topicRow.topicId);

  let subtopicRows:
    PracticeSubtopicRow[];

  if (subtopic) {
    const selected =
      await env.gyan_registry
        .prepare(
          `
          SELECT id
          FROM education_subtopics
          WHERE
            topic_id = ?
            AND subtopic_code = ?
            AND enabled = 1
          LIMIT 1
          `,
        )
        .bind(
          topicId,
          subtopic,
        )
        .first<PracticeSubtopicRow>();

    subtopicRows =
      selected
        ? [selected]
        : [];
  } else {
    const result =
      await env.gyan_registry
        .prepare(
          `
          SELECT id
          FROM education_subtopics
          WHERE
            topic_id = ?
            AND enabled = 1
          ORDER BY
            sort_order,
            id
          `,
        )
        .bind(topicId)
        .all<PracticeSubtopicRow>();

    subtopicRows =
      result.results;
  }

  if (
    subtopicRows.length === 0
  ) {
    return json({
      completed: false,
      reason:
        "No practice questions found.",
    });
  }

  const subtopicIds =
    subtopicRows.map(
      (row) =>
        Number(row.id),
    );

  const scopeKey =
    subtopic
      ? `SUBTOPIC:${subtopicIds[0]}`
      : `TOPIC:${topicId}`;

  const cursor =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          last_subtopic_id,
          last_question_id,
          completed_cycles
        FROM education_practice_cursors
        WHERE
          gyan_account_id = ?
          AND scope_key = ?
        LIMIT 1
        `,
      )
      .bind(
        gyanAccountId,
        scopeKey,
      )
      .first<PracticeCursorRow>();

  const startSubtopicId =
    Number(
      cursor?.last_subtopic_id ??
      subtopicIds[0],
    );

  const startQuestionId =
    Number(
      cursor?.last_question_id ??
      0,
    );

  const currentBatch =
    await loadSequentialQuestions(
      env,
      subtopicIds,
      startSubtopicId,
      startQuestionId,
    );

  if (
    currentBatch.questions.length ===
    0
  ) {
    return json({
      completed: false,
      reason:
        "No practice questions found.",
    });
  }

  const completedCycles =
    Number(
      cursor?.completed_cycles ??
      0,
    ) +
    (
      currentBatch.wrapped
        ? 1
        : 0
    );

  await env.gyan_registry
    .prepare(
      `
      INSERT INTO education_practice_cursors (
        gyan_account_id,
        scope_key,
        last_subtopic_id,
        last_question_id,
        completed_cycles,
        updated_at
      )
      VALUES (
        ?, ?, ?, ?, ?,
        CURRENT_TIMESTAMP
      )

      ON CONFLICT(
        gyan_account_id,
        scope_key
      )
      DO UPDATE SET
        last_subtopic_id =
          excluded.last_subtopic_id,
        last_question_id =
          excluded.last_question_id,
        completed_cycles =
          excluded.completed_cycles,
        updated_at =
          CURRENT_TIMESTAMP
      `,
    )
    .bind(
      gyanAccountId,
      scopeKey,
      currentBatch.lastSubtopicId,
      currentBatch.lastQuestionId,
      completedCycles,
    )
    .run();

  return json({
    completed: true,
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
      request,
      env,
      url,
    );
  }

  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/education/practice/complete"
  ) {
    return completePracticeBatch(
      request,
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
