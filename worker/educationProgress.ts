import {
  currentUser,
} from "./auth";

const STUDENT_CODE_ALPHABET =
  "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";

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

function normalizeEmail(
  value: unknown,
): string {
  return typeof value ===
    "string"
    ? value
        .trim()
        .toLowerCase()
    : "";
}

function validEmail(
  value: string,
): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
    value,
  );
}

function normalizeName(
  value: unknown,
): string {
  return typeof value ===
    "string"
    ? value.trim()
    : "";
}

function normalizeCode(
  value: unknown,
): string {
  return typeof value ===
    "string"
    ? value
        .trim()
        .toUpperCase()
    : "";
}

function randomCode():
  string {
  const bytes =
    new Uint8Array(4);

  crypto.getRandomValues(
    bytes,
  );

  return Array.from(
    bytes,
    (
      value,
    ) =>
      STUDENT_CODE_ALPHABET[
        value %
        STUDENT_CODE_ALPHABET.length
      ],
  ).join("");
}

async function createUniqueStudentCode(
  env: Env,
): Promise<string> {
  for (
    let attempt = 0;
    attempt < 20;
    attempt += 1
  ) {
    const code =
      randomCode();

    const existing =
      await env.gyan_registry
        .prepare(
          `
          SELECT id
          FROM education_students
          WHERE student_code = ?
          LIMIT 1
          `,
        )
        .bind(
          code,
        )
        .first<{
          id: number;
        }>();

    if (!existing) {
      return code;
    }
  }

  throw new Error(
    "Unable to create a unique student code.",
  );
}

type SaveAnswerInput = {
  questionId?: unknown;
  selectedChoice?: unknown;
};

type SaveProgressBody = {
  studentName?: unknown;
  email?: unknown;
  country?: unknown;
  grade?: unknown;
  subject?: unknown;
  topic?: unknown;
  answers?: unknown;
  studentCode?: unknown;
};

async function saveProgress(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  let body:
    SaveProgressBody;

  try {
    body =
      await request.json() as
        SaveProgressBody;
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid JSON body.",
      },
      400,
    );
  }

  const studentName =
    normalizeName(
      body.studentName,
    );

  const email =
    normalizeEmail(
      body.email,
    );

  const country =
    normalizeCode(
      body.country,
    );

  const grade =
    normalizeCode(
      body.grade,
    );

  const subject =
    normalizeCode(
      body.subject,
    );

  const topic =
    normalizeCode(
      body.topic,
    );

  const requestedStudentCode =
    normalizeCode(
      body.studentCode,
    );

  if (
    studentName.length < 1 ||
    studentName.length > 80
  ) {
    return jsonResponse(
      {
        error:
          "Enter the student's name.",
      },
      400,
    );
  }

  if (
    !validEmail(
      email,
    )
  ) {
    return jsonResponse(
      {
        error:
          "Enter a valid email address.",
      },
      400,
    );
  }

  if (
    ![
      "US",
      "IN",
    ].includes(
      country,
    ) ||
    !grade ||
    !subject ||
    !topic
  ) {
    return jsonResponse(
      {
        error:
          "Education selection is incomplete.",
      },
      400,
    );
  }

  if (
    !Array.isArray(
      body.answers,
    ) ||
    body.answers.length !==
      5
  ) {
    return jsonResponse(
      {
        error:
          "Exactly 5 answers are required.",
      },
      400,
    );
  }

  const answers =
    body.answers as
      SaveAnswerInput[];

  const normalizedAnswers:
    Array<{
      questionId: number;
      selectedChoice:
        "A" |
        "B" |
        "C" |
        "D";
    }> = [];

  const questionIds =
    new Set<number>();

  for (
    const answer
    of answers
  ) {
    const questionId =
      Number(
        answer.questionId,
      );

    const selectedChoice =
      normalizeCode(
        answer.selectedChoice,
      );

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
        selectedChoice,
      ) ||
      questionIds.has(
        questionId,
      )
    ) {
      return jsonResponse(
        {
          error:
            "One or more saved answers are invalid.",
        },
        400,
      );
    }

    questionIds.add(
      questionId,
    );

    normalizedAnswers.push({
      questionId,
      selectedChoice:
        selectedChoice as
          "A" |
          "B" |
          "C" |
          "D",
    });
  }

  const placeholders =
    normalizedAnswers
      .map(
        () =>
          "?",
      )
      .join(",");

  const rows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          q.id,
          q.correct_choice,
          t.topic_code,
          s.subject_code,
          s.grade_code,
          s.country_code

        FROM education_questions q

        JOIN education_subtopics st
          ON st.id =
             q.subtopic_id

        JOIN education_topics t
          ON t.id =
             st.topic_id

        JOIN education_subjects s
          ON s.id =
             t.subject_id

        WHERE
          q.id IN (
            ${placeholders}
          )
          AND q.active = 1
        `,
      )
      .bind(
        ...normalizedAnswers.map(
          (
            answer,
          ) =>
            answer.questionId,
        ),
      )
      .all<{
        id: number;
        correct_choice: string;
        topic_code: string;
        subject_code: string;
        grade_code: string;
        country_code: string;
      }>();

  if (
    rows.results.length !==
      5 ||
    rows.results.some(
      (
        row,
      ) =>
        row.topic_code !==
          topic ||
        row.subject_code !==
          subject ||
        row.grade_code !==
          grade ||
        row.country_code !==
          country,
    )
  ) {
    return jsonResponse(
      {
        error:
          "The questions do not match this topic.",
      },
      400,
    );
  }

  const correctById =
    new Map(
      rows.results.map(
        (
          row,
        ) => [
          row.id,
          row.correct_choice,
        ],
      ),
    );

  const graded =
    normalizedAnswers.map(
      (
        answer,
      ) => ({
        ...answer,

        correct:
          correctById.get(
            answer.questionId,
          ) ===
          answer.selectedChoice,
      }),
    );

  const correctCount =
    graded.filter(
      (
        answer,
      ) =>
        answer.correct,
    ).length;

  const scorePercent =
    Math.round(
      (
        correctCount /
        graded.length
      ) *
      100,
    );

  const user =
    await currentUser(
      request,
      env,
    );

  let student:
    {
      id: number;
      student_code: string;
      student_name: string;
      email: string;
    } |
    null =
      null;

  if (
    requestedStudentCode
  ) {
    student =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            id,
            student_code,
            student_name,
            email

          FROM education_students

          WHERE
            student_code = ?
            AND email = ?

          LIMIT 1
          `,
        )
        .bind(
          requestedStudentCode,
          email,
        )
        .first<{
          id: number;
          student_code: string;
          student_name: string;
          email: string;
        }>();

    if (!student) {
      return jsonResponse(
        {
          error:
            "Student card could not be matched to this email.",
        },
        403,
      );
    }
  }

  if (!student) {
    const studentCode =
      await createUniqueStudentCode(
        env,
      );

    const insert =
      await env.gyan_registry
        .prepare(
          `
          INSERT INTO education_students (
            student_code,
            student_name,
            email,
            user_id,
            country_code,
            grade_code,
            created_at,
            updated_at
          )
          VALUES (
            ?, ?, ?, ?, ?, ?,
            CURRENT_TIMESTAMP,
            CURRENT_TIMESTAMP
          )
          `,
        )
        .bind(
          studentCode,
          studentName,
          email,
          user?.id ??
            null,
          country,
          grade,
        )
        .run();

    student = {
      id:
        Number(
          insert.meta
            .last_row_id,
        ),

      student_code:
        studentCode,

      student_name:
        studentName,

      email,
    };
  } else {
    await env.gyan_registry
      .prepare(
        `
        UPDATE education_students
        SET
          student_name = ?,
          user_id =
            COALESCE(
              user_id,
              ?
            ),
          updated_at =
            CURRENT_TIMESTAMP

        WHERE id = ?
        `,
      )
      .bind(
        studentName,
        user?.id ??
          null,
        student.id,
      )
      .run();
  }

  const attemptInsert =
    await env.gyan_registry
      .prepare(
        `
        INSERT INTO education_attempts (
          student_id,
          subject_code,
          topic_code,
          question_count,
          correct_count,
          score_percent,
          created_at
        )
        VALUES (
          ?, ?, ?, ?, ?, ?,
          CURRENT_TIMESTAMP
        )
        `,
      )
      .bind(
        student.id,
        subject,
        topic,
        graded.length,
        correctCount,
        scorePercent,
      )
      .run();

  const attemptId =
    Number(
      attemptInsert.meta
        .last_row_id,
    );

  await env.gyan_registry.batch(
    graded.map(
      (
        answer,
      ) =>
        env.gyan_registry
          .prepare(
            `
            INSERT INTO education_attempt_answers (
              attempt_id,
              question_id,
              selected_choice,
              correct
            )
            VALUES (
              ?, ?, ?, ?
            )
            `,
          )
          .bind(
            attemptId,
            answer.questionId,
            answer.selectedChoice,
            answer.correct
              ? 1
              : 0,
          ),
    ),
  );

  await env.gyan_registry
    .prepare(
      `
      INSERT INTO education_topic_mastery (
        student_id,
        subject_code,
        topic_code,
        attempts,
        questions_answered,
        correct_answers,
        score_percent,
        updated_at
      )
      VALUES (
        ?, ?, ?, 1, ?, ?, ?,
        CURRENT_TIMESTAMP
      )

      ON CONFLICT(
        student_id,
        subject_code,
        topic_code
      )
      DO UPDATE SET
        attempts =
          education_topic_mastery.attempts +
          1,

        questions_answered =
          education_topic_mastery.questions_answered +
          excluded.questions_answered,

        correct_answers =
          education_topic_mastery.correct_answers +
          excluded.correct_answers,

        score_percent =
          ROUND(
            (
              education_topic_mastery.correct_answers +
              excluded.correct_answers
            ) *
            100.0 /
            (
              education_topic_mastery.questions_answered +
              excluded.questions_answered
            )
          ),

        updated_at =
          CURRENT_TIMESTAMP
      `,
    )
    .bind(
      student.id,
      subject,
      topic,
      graded.length,
      correctCount,
      scorePercent,
    )
    .run();

  const report =
    await loadReport(
      env,
      student.id,
      country,
      grade,
      subject,
    );

  const cardUrl =
    new URL(
      `/student/${student.student_code}`,
      url.origin,
    ).toString();

  return jsonResponse({
    saved:
      true,

    student: {
      code:
        student.student_code,

      name:
        studentName,

      email,

      cardUrl,
    },

    attempt: {
      correctCount,
      questionCount:
        graded.length,
      scorePercent,
    },

    report,
  });
}

async function loadReport(
  env: Env,
  studentId: number,
  country: string,
  grade: string,
  subject: string,
) {
  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          t.topic_code AS code,
          t.topic_name AS name,

          m.attempts,
          m.questions_answered AS questionsAnswered,
          m.correct_answers AS correctAnswers,

          COALESCE(
            (
              SELECT
                a.score_percent

              FROM education_attempts a

              WHERE
                a.student_id = ?
                AND a.subject_code =
                    s.subject_code
                AND a.topic_code =
                    t.topic_code

              ORDER BY
                a.created_at DESC,
                a.id DESC

              LIMIT 1
            ),
            m.score_percent
          ) AS scorePercent

        FROM education_topics t

        JOIN education_subjects s
          ON s.id =
             t.subject_id

        LEFT JOIN education_topic_mastery m
          ON m.student_id = ?
          AND m.subject_code =
              s.subject_code
          AND m.topic_code =
              t.topic_code

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
        studentId,
        studentId,
        country,
        grade,
        subject,
      )
      .all<{
        code: string;
        name: string;
        attempts: number | null;
        questionsAnswered: number | null;
        correctAnswers: number | null;
        scorePercent: number | null;
      }>();

  return result.results.map(
    (
      row,
    ) => ({
      code:
        row.code,

      name:
        row.name,

      attempts:
        Number(
          row.attempts ??
          0,
        ),

      questionsAnswered:
        Number(
          row.questionsAnswered ??
          0,
        ),

      correctAnswers:
        Number(
          row.correctAnswers ??
          0,
        ),

      scorePercent:
        row.scorePercent ==
          null
          ? null
          : Number(
              row.scorePercent,
            ),
    }),
  );
}

async function getReport(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  const user =
    await currentUser(
      request,
      env,
    );

  if (!user) {
    return jsonResponse(
      {
        error:
          "Sign in with the verified email to view saved progress.",
      },
      401,
    );
  }

  const studentCode =
    normalizeCode(
      url.searchParams.get(
        "student",
      ),
    );

  if (!studentCode) {
    return jsonResponse(
      {
        error:
          "student is required.",
      },
      400,
    );
  }

  const student =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          student_code,
          student_name,
          email,
          country_code,
          grade_code

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
        email: string;
        country_code: string;
        grade_code: string;
      }>();

  if (!student) {
    return jsonResponse(
      {
        error:
          "Student card not found for this account.",
      },
      404,
    );
  }

  const subject =
    normalizeCode(
      url.searchParams.get(
        "subject",
      ) ??
      "MATH",
    );

  return jsonResponse({
    student: {
      code:
        student.student_code,
      name:
        student.student_name,
      email:
        student.email,
      country:
        student.country_code,
      grade:
        student.grade_code,
    },

    report:
      await loadReport(
        env,
        student.id,
        student.country_code,
        student.grade_code,
        subject,
      ),
  });
}


async function getReviewQuestions(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  const user =
    await currentUser(
      request,
      env,
    );

  if (!user) {
    return jsonResponse(
      {
        error:
          "Sign in with the verified email to revise saved work.",
      },
      401,
    );
  }

  const studentCode =
    normalizeCode(
      url.searchParams.get(
        "student",
      ),
    );

  const subject =
    normalizeCode(
      url.searchParams.get(
        "subject",
      ) ??
      "MATH",
    );

  const topic =
    normalizeCode(
      url.searchParams.get(
        "topic",
      ),
    );

  if (
    !studentCode ||
    !subject ||
    !topic
  ) {
    return jsonResponse(
      {
        error:
          "student, subject and topic are required.",
      },
      400,
    );
  }

  const student =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          country_code,
          grade_code

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
        country_code: string;
        grade_code: string;
      }>();

  if (!student) {
    return jsonResponse(
      {
        error:
          "Student card not found for this account.",
      },
      404,
    );
  }

  /*
   * Latest response for each previously seen question.
   * Only questions whose latest saved response is still wrong
   * are considered unresolved.
   */
  const wrong =
    await env.gyan_registry
      .prepare(
        `
        WITH ranked AS (
          SELECT
            aa.question_id,
            aa.correct,

            ROW_NUMBER() OVER (
              PARTITION BY aa.question_id
              ORDER BY
                a.created_at DESC,
                aa.id DESC
            ) AS rn

          FROM education_attempt_answers aa

          JOIN education_attempts a
            ON a.id =
               aa.attempt_id

          JOIN education_questions q
            ON q.id =
               aa.question_id

          JOIN education_subtopics st
            ON st.id =
               q.subtopic_id

          JOIN education_topics t
            ON t.id =
               st.topic_id

          JOIN education_subjects s
            ON s.id =
               t.subject_id

          WHERE
            a.student_id = ?
            AND a.subject_code = ?
            AND a.topic_code = ?
            AND s.country_code = ?
            AND s.grade_code = ?
            AND q.active = 1
        )

        SELECT
          question_id

        FROM ranked

        WHERE
          rn = 1
          AND correct = 0

        LIMIT 5
        `,
      )
      .bind(
        student.id,
        subject,
        topic,
        student.country_code,
        student.grade_code,
      )
      .all<{
        question_id: number;
      }>();

  const wrongIds =
    wrong.results.map(
      (
        row,
      ) =>
        Number(
          row.question_id,
        ),
    );

  const remaining =
    Math.max(
      0,
      5 -
      wrongIds.length,
    );

  let fillIds:
    number[] = [];

  if (
    remaining >
      0
  ) {
    const exclusions =
      wrongIds.length >
        0
        ? `AND q.id NOT IN (${
            wrongIds
              .map(
                () =>
                  "?",
              )
              .join(",")
          })`
        : "";

    const fill =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            q.id

          FROM education_questions q

          JOIN education_subtopics st
            ON st.id =
               q.subtopic_id

          JOIN education_topics t
            ON t.id =
               st.topic_id

          JOIN education_subjects s
            ON s.id =
               t.subject_id

          WHERE
            s.country_code = ?
            AND s.grade_code = ?
            AND s.subject_code = ?
            AND t.topic_code = ?
            AND q.active = 1

            ${exclusions}

          ORDER BY
            RANDOM()

          LIMIT ?
          `,
        )
        .bind(
          student.country_code,
          student.grade_code,
          subject,
          topic,
          ...wrongIds,
          remaining,
        )
        .all<{
          id: number;
        }>();

    fillIds =
      fill.results.map(
        (
          row,
        ) =>
          Number(
            row.id,
          ),
      );
  }

  const ids =
    [
      ...wrongIds,
      ...fillIds,
    ]
      .slice(
        0,
        5,
      );

  if (
    ids.length ===
      0
  ) {
    return jsonResponse({
      questions: [],
      unresolvedWrongCount:
        wrongIds.length,
    });
  }

  const placeholders =
    ids
      .map(
        () =>
          "?",
      )
      .join(",");

  const rows =
    await env.gyan_registry
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

        WHERE
          q.id IN (
            ${placeholders}
          )
          AND q.active = 1
        `,
      )
      .bind(
        ...ids,
      )
      .all<{
        id: number;
        question_key: string;
        difficulty:
          | "easy"
          | "medium"
          | "challenge";
        question_text: string;
        choice_a: string;
        choice_b: string;
        choice_c: string;
        choice_d: string;
      }>();

  const byId =
    new Map(
      rows.results.map(
        (
          row,
        ) => [
          row.id,
          row,
        ],
      ),
    );

  return jsonResponse({
    unresolvedWrongCount:
      wrongIds.length,

    questions:
      ids
        .map(
          (
            id,
          ) =>
            byId.get(
              id,
            ),
        )
        .filter(
          (
            row,
          ): row is
            NonNullable<
              typeof row
            > =>
              Boolean(
                row,
              ),
        )
        .map(
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


export async function handleEducationProgressRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/education/save-progress"
  ) {
    return saveProgress(
      request,
      env,
      url,
    );
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/education/report"
  ) {
    return getReport(
      request,
      env,
      url,
    );
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/education/review-questions"
  ) {
    return getReviewQuestions(
      request,
      env,
      url,
    );
  }

  return null;
}
