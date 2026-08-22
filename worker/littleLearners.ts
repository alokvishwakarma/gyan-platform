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
        5,
        Number(
          url.searchParams.get(
            "level",
          ) ??
          "2",
        ) || 2,
      ),
    );

  const mode =
    url.searchParams.get(
      "mode",
    ) ===
      "upTo"
      ? "upTo"
      : "exact";

  const topic =
    (
      url.searchParams.get(
        "topic",
      ) ??
      ""
    )
      .trim()
      .toUpperCase();

  const subtopic =
    (
      url.searchParams.get(
        "subtopic",
      ) ??
      ""
    )
      .trim()
      .toUpperCase();

  const limit =
    Math.max(
      1,
      Math.min(
        20,
        Number(
          url.searchParams.get(
            "limit",
          ) ??
          "5",
        ) || 5,
      ),
    );

  const clauses:
    string[] = [
    "active = 1",
  ];

  const bindings:
    Array<
      string |
      number
    > = [];

  if (
    mode ===
      "upTo"
  ) {
    clauses.push(
      "level <= ?",
    );

    bindings.push(
      level,
    );
  } else {
    clauses.push(
      "level = ?",
    );

    bindings.push(
      level,
    );
  }

  if (
    topic
  ) {
    clauses.push(
      "topic_code = ?",
    );

    bindings.push(
      topic,
    );
  }

  if (
    subtopic
  ) {
    clauses.push(
      "subtopic_code = ?",
    );

    bindings.push(
      subtopic,
    );
  }

  const result =
    await env.gyan_registry
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

          option_a_scale AS optionAScale,
          option_b_scale AS optionBScale,
          option_c_scale AS optionCScale,

          visual_type AS visualType,
          visual_object AS visualObject,

          correct_option AS correctOption,
          accepted_words AS acceptedWords,

          topic_code AS topicCode,
          topic_name AS topicName,
          subtopic_code AS subtopicCode,
          subtopic_name AS subtopicName

        FROM education_little_questions

        WHERE
          ${clauses.join(
            "\n          AND ",
          )}

        ORDER BY
          RANDOM()

        LIMIT ?
        `,
      )
      .bind(
        ...bindings,
        limit,
      )
      .all<{
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

        optionAScale:
          "small" |
          "medium" |
          "big" |
          null;
        optionBScale:
          "small" |
          "medium" |
          "big" |
          null;
        optionCScale:
          "small" |
          "medium" |
          "big" |
          null;

        visualType:
          string |
          null;
        visualObject:
          string |
          null;

        correctOption:
          string |
          null;

        acceptedWords:
          string |
          null;

        topicCode:
          string |
          null;
        topicName:
          string |
          null;
        subtopicCode:
          string |
          null;
        subtopicName:
          string |
          null;
      }>();

  return jsonResponse({
    questions:
      result.results.map(
        (
          row,
        ) => {
          const rawOptions =
            [
              row.optionA,
              row.optionB,
              row.optionC,
            ];

          const rawScales =
            [
              row.optionAScale,
              row.optionBScale,
              row.optionCScale,
            ];

          const options:
            string[] = [];

          const optionScales:
            Array<
              "small" |
              "medium" |
              "big" |
              null
            > = [];

          rawOptions.forEach(
            (
              value,
              index,
            ) => {
              if (
                value
              ) {
                options.push(
                  value,
                );

                optionScales.push(
                  rawScales[
                    index
                  ],
                );
              }
            },
          );

          return {
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

            options,
            optionScales,

            visualType:
              row.visualType,

            visualObject:
              row.visualObject,

            correctOption:
              row.correctOption,

            acceptedWords:
              (
                row.acceptedWords ??
                ""
              )
                .split(
                  "|",
                )
                .map(
                  (
                    word,
                  ) =>
                    word.trim(),
                )
                .filter(
                  Boolean,
                ),

            topicCode:
              row.topicCode,

            topicName:
              row.topicName,

            subtopicCode:
              row.subtopicCode,

            subtopicName:
              row.subtopicName,
          };
        },
      ),
  });
}


async function resolveLittleStudent(
  request: Request,
  env: Env,
  studentCode:
    string,
): Promise<{
  id: number;
  student_code: string;
} | null> {
  if (
    studentCode
  ) {
    const student =
      await getStudentForUser(
        env,
        request,
        studentCode,
      );

    if (
      student
    ) {
      return {
        id:
          student.id,

        student_code:
          student.student_code,
      };
    }
  }

  /*
   * /aba is intentionally easy to bookmark. On a browser where
   * the remembered 4-character code is missing, an authenticated
   * parent should not silently lose the child's progress.
   *
   * Auto-link only when the signed-in email owns exactly ONE
   * PRE-K student card. If there are multiple PRE-K cards we
   * refuse to guess.
   */
  const user =
    await currentUser(
      request,
      env,
    );

  if (
    !user
  ) {
    return null;
  }

  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          student_code

        FROM education_students

        WHERE
          email = ?
          AND grade_code = 'PREK'

        ORDER BY
          updated_at DESC,
          id DESC

        LIMIT 2
        `,
      )
      .bind(
        user.email,
      )
      .all<{
        id: number;
        student_code: string;
      }>();

  if (
    result.results.length !==
      1
  ) {
    return null;
  }

  return result.results[
    0
  ];
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

  const linkedStudent =
    await resolveLittleStudent(
      request,
      env,
      studentCode,
    );

  const studentId =
    linkedStudent?.id ??
    null;

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

    linked:
      Boolean(
        linkedStudent,
      ),

    studentCode:
      linkedStudent
        ?.student_code,
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



type LittleQuestionRow = {
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

  optionAScale:
    "small" |
    "medium" |
    "big" |
    null;

  optionBScale:
    "small" |
    "medium" |
    "big" |
    null;

  optionCScale:
    "small" |
    "medium" |
    "big" |
    null;

  visualType:
    string |
    null;

  visualObject:
    string |
    null;

  correctOption:
    string |
    null;

  acceptedWords:
    string |
    null;

  topicCode:
    string |
    null;

  topicName:
    string |
    null;

  subtopicCode:
    string |
    null;

  subtopicName:
    string |
    null;
};


function publicLittleQuestion(
  row:
    LittleQuestionRow,
) {
  const rawOptions =
    [
      row.optionA,
      row.optionB,
      row.optionC,
    ];

  const rawScales =
    [
      row.optionAScale,
      row.optionBScale,
      row.optionCScale,
    ];

  const options:
    string[] = [];

  const optionScales:
    Array<
      "small" |
      "medium" |
      "big" |
      null
    > = [];

  rawOptions.forEach(
    (
      value,
      index,
    ) => {
      if (
        value
      ) {
        options.push(
          value,
        );

        optionScales.push(
          rawScales[
            index
          ],
        );
      }
    },
  );

  return {
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

    options,
    optionScales,

    visualType:
      row.visualType,

    visualObject:
      row.visualObject,

    correctOption:
      row.correctOption,

    acceptedWords:
      (
        row.acceptedWords ??
        ""
      )
        .split(
          "|",
        )
        .map(
          (
            word,
          ) =>
            word.trim(),
        )
        .filter(
          Boolean,
        ),

    topicCode:
      row.topicCode,

    topicName:
      row.topicName,

    subtopicCode:
      row.subtopicCode,

    subtopicName:
      row.subtopicName,
  };
}


function masteryState(
  input: {
    latestCorrect:
      boolean;

    recentCorrect:
      number;

    recentAttempts:
      number;

    accuracyPercent:
      number;
  },
):
  | "green"
  | "yellow"
  | "red" {
  /*
   * Green means the skill is not merely a one-off success:
   * at least two of the most recent attempts were correct and
   * the latest response was correct.
   */
  if (
    input.latestCorrect &&
    input.recentCorrect >=
      2
  ) {
    return "green";
  }

  /*
   * Yellow = emerging / inconsistent.
   */
  if (
    input.latestCorrect ||
    input.accuracyPercent >=
      50
  ) {
    return "yellow";
  }

  return "red";
}


async function getAbaProgress(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  const requestedCode =
    String(
      url.searchParams.get(
        "student",
      ) ??
      "",
    )
      .trim()
      .toUpperCase();

  const student =
    await resolveLittleStudent(
      request,
      env,
      requestedCode,
    );

  if (
    !student
  ) {
    return jsonResponse(
      {
        error:
          "Verify the student email or open Words Growing once to select the student card.",
      },
      401,
    );
  }

  const studentDetails =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          student_code,
          student_name

        FROM education_students

        WHERE id = ?

        LIMIT 1
        `,
      )
      .bind(
        student.id,
      )
      .first<{
        student_code: string;
        student_name: string;
      }>();

  if (
    !studentDetails
  ) {
    return jsonResponse(
      {
        error:
          "Student card was not found.",
      },
      404,
    );
  }

  const rows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          q.id AS questionId,
          q.level AS level,
          q.prompt_text AS promptText,

          COALESCE(
            q.topic_code,
            'OTHER'
          ) AS topicCode,

          COALESCE(
            q.topic_name,
            'Other'
          ) AS topicName,

          COALESCE(
            q.subtopic_code,
            ''
          ) AS subtopicCode,

          COALESCE(
            q.subtopic_name,
            ''
          ) AS subtopicName,

          COUNT(
            a.id
          ) AS attempts,

          SUM(
            CASE
              WHEN a.correct = 1
                THEN 1
              ELSE 0
            END
          ) AS correctCount,

          SUM(
            CASE
              WHEN a.correct = 0
                THEN 1
              ELSE 0
            END
          ) AS wrongCount,

          COALESCE(
            (
              SELECT
                latest.correct

              FROM education_little_attempts latest

              WHERE
                latest.student_id = ?
                AND latest.question_id =
                    q.id

              ORDER BY
                latest.created_at DESC,
                latest.id DESC

              LIMIT 1
            ),
            0
          ) AS latestCorrect,

          COALESCE(
            (
              SELECT
                SUM(
                  recent.correct
                )

              FROM (
                SELECT
                  recent_source.correct

                FROM education_little_attempts recent_source

                WHERE
                  recent_source.student_id = ?
                  AND recent_source.question_id =
                      q.id

                ORDER BY
                  recent_source.created_at DESC,
                  recent_source.id DESC

                LIMIT 3
              ) recent
            ),
            0
          ) AS recentCorrect,

          COALESCE(
            (
              SELECT
                COUNT(*)

              FROM (
                SELECT
                  recent_source.id

                FROM education_little_attempts recent_source

                WHERE
                  recent_source.student_id = ?
                  AND recent_source.question_id =
                      q.id

                ORDER BY
                  recent_source.created_at DESC,
                  recent_source.id DESC

                LIMIT 3
              ) recent_count
            ),
            0
          ) AS recentAttempts

        FROM education_little_attempts a

        JOIN education_little_questions q
          ON q.id =
             a.question_id

        WHERE
          a.student_id = ?

        GROUP BY
          q.id,
          q.level,
          q.prompt_text,
          q.topic_code,
          q.topic_name,
          q.subtopic_code,
          q.subtopic_name

        ORDER BY
          MAX(
            a.created_at
          ) DESC,
          q.id DESC
        `,
      )
      .bind(
        student.id,
        student.id,
        student.id,
        student.id,
      )
      .all<{
        questionId: number;
        level: number;
        promptText: string;
        topicCode: string;
        topicName: string;
        subtopicCode: string;
        subtopicName: string;
        attempts: number;
        correctCount: number;
        wrongCount: number;
        latestCorrect: number;
        recentCorrect: number;
        recentAttempts: number;
      }>();

  const questions =
    rows.results.map(
      (
        row,
      ) => {
        const attempts =
          Number(
            row.attempts ??
            0,
          );

        const correctCount =
          Number(
            row.correctCount ??
            0,
          );

        const wrongCount =
          Number(
            row.wrongCount ??
            0,
          );

        const accuracyPercent =
          attempts >
            0
            ? Math.round(
                correctCount *
                100 /
                attempts,
              )
            : 0;

        const latestCorrect =
          Boolean(
            row.latestCorrect,
          );

        const recentCorrect =
          Number(
            row.recentCorrect ??
            0,
          );

        const recentAttempts =
          Number(
            row.recentAttempts ??
            0,
          );

        return {
          questionId:
            row.questionId,

          level:
            row.level,

          promptText:
            row.promptText,

          topicCode:
            row.topicCode,

          topicName:
            row.topicName,

          subtopicCode:
            row.subtopicCode,

          subtopicName:
            row.subtopicName,

          attempts,
          correctCount,
          wrongCount,
          accuracyPercent,
          latestCorrect,
          recentCorrect,
          recentAttempts,

          state:
            masteryState({
              latestCorrect,
              recentCorrect,
              recentAttempts,
              accuracyPercent,
            }),
        };
      },
    );

  const topicMap =
    new Map<
      string,
      {
        code: string;
        name: string;
        attempts: number;
        correctCount: number;
        wrongCount: number;
        greenQuestions: number;
        yellowQuestions: number;
        redQuestions: number;
      }
    >();

  for (
    const question
    of questions
  ) {
    const current =
      topicMap.get(
        question.topicCode,
      ) ?? {
        code:
          question.topicCode,

        name:
          question.topicName,

        attempts:
          0,

        correctCount:
          0,

        wrongCount:
          0,

        greenQuestions:
          0,

        yellowQuestions:
          0,

        redQuestions:
          0,
      };

    current.attempts +=
      question.attempts;

    current.correctCount +=
      question.correctCount;

    current.wrongCount +=
      question.wrongCount;

    if (
      question.state ===
        "green"
    ) {
      current.greenQuestions +=
        1;
    } else if (
      question.state ===
        "yellow"
    ) {
      current.yellowQuestions +=
        1;
    } else {
      current.redQuestions +=
        1;
    }

    topicMap.set(
      question.topicCode,
      current,
    );
  }

  const topics =
    [
      ...topicMap.values(),
    ]
      .map(
        (
          topic,
        ) => {
          const accuracyPercent =
            topic.attempts >
              0
              ? Math.round(
                  topic.correctCount *
                  100 /
                  topic.attempts,
                )
              : 0;

          const state:
            | "green"
            | "yellow"
            | "red" =
              topic.redQuestions >
                topic.greenQuestions
                ? "red"
                : topic.greenQuestions >
                    0 &&
                  topic.redQuestions ===
                    0
                  ? "green"
                  : "yellow";

          return {
            ...topic,
            accuracyPercent,
            state,
          };
        },
      )
      .sort(
        (
          first,
          second,
        ) =>
          second.redQuestions -
            first.redQuestions ||
          second.wrongCount -
            first.wrongCount ||
          first.name.localeCompare(
            second.name,
          ),
      );

  const attempts =
    questions.reduce(
      (
        total,
        question,
      ) =>
        total +
        question.attempts,
      0,
    );

  const correctCount =
    questions.reduce(
      (
        total,
        question,
      ) =>
        total +
        question.correctCount,
      0,
    );

  const wrongCount =
    attempts -
    correctCount;

  return jsonResponse({
    student: {
      code:
        studentDetails
          .student_code,

      name:
        studentDetails
          .student_name,
    },

    summary: {
      attempts,
      correctCount,
      wrongCount,

      accuracyPercent:
        attempts >
          0
          ? Math.round(
              correctCount *
              100 /
              attempts,
            )
          : 0,

      questionsTried:
        questions.length,
    },

    topics,
    questions,
  });
}


async function getAbaReviewQuestions(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  const requestedCode =
    String(
      url.searchParams.get(
        "student",
      ) ??
      "",
    )
      .trim()
      .toUpperCase();

  const limit =
    Math.max(
      1,
      Math.min(
        10,
        Number(
          url.searchParams.get(
            "limit",
          ) ??
          "5",
        ) || 5,
      ),
    );

  const student =
    await resolveLittleStudent(
      request,
      env,
      requestedCode,
    );

  if (
    !student
  ) {
    return jsonResponse(
      {
        error:
          "Student card could not be identified.",
      },
      401,
    );
  }

  /*
   * Priority:
   * 1. Latest answer is wrong.
   * 2. More historical wrong answers.
   * 3. Lower overall accuracy.
   * 4. Recently practiced.
   *
   * The child therefore sees genuine trouble spots first rather
   * than merely another random five questions.
   */
  const ranked =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          q.id,

          COALESCE(
            (
              SELECT
                latest.correct

              FROM education_little_attempts latest

              WHERE
                latest.student_id = ?
                AND latest.question_id =
                    q.id

              ORDER BY
                latest.created_at DESC,
                latest.id DESC

              LIMIT 1
            ),
            0
          ) AS latestCorrect,

          SUM(
            CASE
              WHEN a.correct = 0
                THEN 1
              ELSE 0
            END
          ) AS wrongCount,

          COUNT(
            a.id
          ) AS attempts,

          SUM(
            CASE
              WHEN a.correct = 1
                THEN 1
              ELSE 0
            END
          ) AS correctCount,

          MAX(
            a.created_at
          ) AS lastAttemptAt

        FROM education_little_attempts a

        JOIN education_little_questions q
          ON q.id =
             a.question_id

        WHERE
          a.student_id = ?
          AND q.active = 1

        GROUP BY
          q.id

        HAVING
          wrongCount >
            0

        ORDER BY
          latestCorrect ASC,
          wrongCount DESC,
          (
            correctCount *
            1.0 /
            attempts
          ) ASC,
          lastAttemptAt DESC

        LIMIT ?
        `,
      )
      .bind(
        student.id,
        student.id,
        limit,
      )
      .all<{
        id: number;
      }>();

  let ids =
    ranked.results.map(
      (
        row,
      ) =>
        Number(
          row.id,
        ),
    );

  /*
   * If the child has fewer than five failed questions so far,
   * add fresh questions near the same current skill level.
   */
  if (
    ids.length <
      limit
  ) {
    const remaining =
      limit -
      ids.length;

    const exclusions =
      ids.length >
        0
        ? `AND q.id NOT IN (${
            ids
              .map(
                () =>
                  "?",
              )
              .join(
                ",",
              )
          })`
        : "";

    const fill =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            q.id

          FROM education_little_questions q

          WHERE
            q.active = 1

            ${exclusions}

          ORDER BY
            RANDOM()

          LIMIT ?
          `,
        )
        .bind(
          ...ids,
          remaining,
        )
        .all<{
          id: number;
        }>();

    ids = [
      ...ids,
      ...fill.results.map(
        (
          row,
        ) =>
          Number(
            row.id,
          ),
      ),
    ];
  }

  if (
    ids.length ===
      0
  ) {
    return jsonResponse({
      questions: [],
    });
  }

  const placeholders =
    ids
      .map(
        () =>
          "?",
      )
      .join(
        ",",
      );

  const rows =
    await env.gyan_registry
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

          option_a_scale AS optionAScale,
          option_b_scale AS optionBScale,
          option_c_scale AS optionCScale,

          visual_type AS visualType,
          visual_object AS visualObject,

          correct_option AS correctOption,
          accepted_words AS acceptedWords,

          topic_code AS topicCode,
          topic_name AS topicName,
          subtopic_code AS subtopicCode,
          subtopic_name AS subtopicName

        FROM education_little_questions

        WHERE
          id IN (
            ${placeholders}
          )
          AND active = 1
        `,
      )
      .bind(
        ...ids,
      )
      .all<LittleQuestionRow>();

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
            LittleQuestionRow =>
              Boolean(
                row,
              ),
        )
        .map(
          publicLittleQuestion,
        ),
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
      "/api/education/little/progress"
  ) {
    return getAbaProgress(
      request,
      env,
      url,
    );
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/education/little/review"
  ) {
    return getAbaReviewQuestions(
      request,
      env,
      url,
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
