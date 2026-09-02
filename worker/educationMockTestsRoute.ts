type Env = {
  gyan_registry: D1Database;
};

type MockLevel =
  | "MAIN"
  | "ADVANCED"
  | "NEET";

type MockKind =
  | "FULL"
  | "MINI";

function jsonResponse(
  body: unknown,
  status = 200,
): Response {
  return new Response(
    JSON.stringify(body),
    {
      status,
      headers: {
        "content-type":
          "application/json; charset=utf-8",
      },
    },
  );
}

function normalizeCode(
  value: string | null,
): string {
  return (value ?? "")
    .trim()
    .toUpperCase()
    .replace(/[^A-Z0-9_]/g, "");
}

function normalizeKind(
  value: string | null,
): MockKind | null {
  const valueUpper =
    (value ?? "")
      .trim()
      .toUpperCase();

  if (
    valueUpper === "FULL" ||
    valueUpper === "MINI"
  ) {
    return valueUpper;
  }

  return null;
}

function normalizeLevel(
  value: string | null,
): MockLevel | null {
  const valueUpper =
    (value ?? "")
      .trim()
      .toUpperCase();

  if (
    valueUpper === "MAIN" ||
    valueUpper === "ADVANCED" ||
    valueUpper === "NEET"
  ) {
    return valueUpper;
  }

  return null;
}

async function loadFixedTest(
  env: Env,
  url: URL,
): Promise<Response> {
  const program =
    normalizeCode(
      url.searchParams.get("program"),
    );

  const kind =
    normalizeKind(
      url.searchParams.get("kind"),
    );

  const testCode =
    normalizeCode(
      url.searchParams.get("testCode"),
    );

  const level =
    normalizeLevel(
      url.searchParams.get("level"),
    );

  const versionRaw =
    Number(
      url.searchParams.get("version") ??
        "1",
    );

  const version =
    Number.isInteger(versionRaw) &&
    versionRaw > 0
      ? versionRaw
      : 1;

  if (
    !program ||
    !kind ||
    !testCode ||
    !level
  ) {
    return jsonResponse(
      {
        error:
          "Invalid mock-test request.",
      },
      400,
    );
  }

  const test =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          program_code,
          test_kind,
          test_code,
          test_name,
          exam_level,
          version,
          access_mode,
          published
        FROM education_mock_tests
        WHERE program_code = ?
          AND test_kind = ?
          AND test_code = ?
          AND exam_level = ?
          AND version = ?
        LIMIT 1
        `,
      )
      .bind(
        program,
        kind,
        testCode,
        level,
        version,
      )
      .first<{
        id: number;
        program_code: string;
        test_kind: string;
        test_code: string;
        test_name: string;
        exam_level: string;
        version: number;
        access_mode: string;
        published: number;
      }>();

  if (
    !test ||
    Number(test.published) !== 1
  ) {
    return jsonResponse(
      {
        error:
          "This test is not published yet.",
      },
      404,
    );
  }

  if (
    test.access_mode !== "OPEN"
  ) {
    return jsonResponse(
      {
        error:
          "This test requires access.",
      },
      403,
    );
  }

  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          mtq.question_order,
          mtq.section_code,
          mtq.marks_correct,
          mtq.marks_incorrect,
          mtq.marks_unanswered,
          q.id AS question_id,
          q.question_key,
          q.difficulty,
          q.question_text,
          COALESCE(qm.question_format, 'SINGLE_CHOICE') AS question_format,
          q.choice_a,
          q.choice_b,
          q.choice_c,
          q.choice_d
        FROM education_mock_test_questions mtq
        JOIN education_questions q
          ON q.id = mtq.question_id
        LEFT JOIN education_question_metadata qm
          ON qm.question_id = q.id
        WHERE mtq.mock_test_id = ?
          AND q.active = 1
        ORDER BY mtq.question_order
        `,
      )
      .bind(test.id)
      .all<{
        question_order: number;
        section_code: string | null;
        marks_correct: number | null;
        marks_incorrect: number | null;
        marks_unanswered: number | null;
        question_id: number;
        question_key: string;
        difficulty: string;
        question_text: string;
        question_format: string;
        choice_a: string;
        choice_b: string;
        choice_c: string;
        choice_d: string;
      }>();

  const questions =
    result.results.map(
      (row) => ({
        order:
          Number(row.question_order),
        sectionCode:
          row.section_code,
        id:
          Number(row.question_id),
        key:
          row.question_key,
        difficulty:
          row.difficulty,
        text:
          row.question_text,
        questionFormat:
          row.question_format,
        choices: {
          A: row.choice_a,
          B: row.choice_b,
          C: row.choice_c,
          D: row.choice_d,
        },
        marksCorrect:
          Number(
            row.marks_correct ?? 0,
          ),
        marksIncorrect:
          Number(
            row.marks_incorrect ?? 0,
          ),
        marksUnanswered:
          Number(
            row.marks_unanswered ?? 0,
          ),
      }),
    );

  const maximumMarks =
    questions.reduce(
      (total, question) =>
        total +
        question.marksCorrect,
      0,
    );

  return jsonResponse({
    test: {
      id:
        Number(test.id),
      programCode:
        test.program_code,
      kind:
        test.test_kind,
      testCode:
        test.test_code,
      name:
        test.test_name,
      level:
        test.exam_level,
      version:
        Number(test.version),
      questionCount:
        questions.length,
      maximumMarks,
      questions,
    },
  });
}

async function scoreFixedTest(
  request: Request,
  env: Env,
): Promise<Response> {
  let body: {
    program?: unknown;
    kind?: unknown;
    testCode?: unknown;
    level?: unknown;
    version?: unknown;
    answers?: unknown;
  };

  try {
    body =
      (await request.json()) as typeof body;
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid JSON body.",
      },
      400,
    );
  }

  const program =
    normalizeCode(
      typeof body.program === "string"
        ? body.program
        : "",
    );

  const kind =
    normalizeKind(
      typeof body.kind === "string"
        ? body.kind
        : null,
    );

  const testCode =
    normalizeCode(
      typeof body.testCode === "string"
        ? body.testCode
        : "",
    );

  const level =
    normalizeLevel(
      typeof body.level === "string"
        ? body.level
        : null,
    );

  const versionRaw =
    Number(body.version ?? 1);

  const version =
    Number.isInteger(versionRaw) &&
    versionRaw > 0
      ? versionRaw
      : 1;

  const answers =
    body.answers &&
    typeof body.answers === "object" &&
    !Array.isArray(body.answers)
      ? body.answers as
          Record<string, unknown>
      : {};

  if (
    !program ||
    !kind ||
    !testCode ||
    !level
  ) {
    return jsonResponse(
      {
        error:
          "Invalid mock-test submission.",
      },
      400,
    );
  }

  const test =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          test_name,
          access_mode,
          published
        FROM education_mock_tests
        WHERE program_code = ?
          AND test_kind = ?
          AND test_code = ?
          AND exam_level = ?
          AND version = ?
        LIMIT 1
        `,
      )
      .bind(
        program,
        kind,
        testCode,
        level,
        version,
      )
      .first<{
        id: number;
        test_name: string;
        access_mode: string;
        published: number;
      }>();

  if (
    !test ||
    Number(test.published) !== 1
  ) {
    return jsonResponse(
      {
        error:
          "This test is not published yet.",
      },
      404,
    );
  }

  if (
    test.access_mode !== "OPEN"
  ) {
    return jsonResponse(
      {
        error:
          "This test requires access.",
      },
      403,
    );
  }

  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          mtq.question_order,
          mtq.section_code,
          mtq.marks_correct,
          mtq.marks_incorrect,
          mtq.marks_unanswered,
          q.id AS question_id,
          q.correct_choice,
          q.choice_a,
          COALESCE(qm.question_format, 'SINGLE_CHOICE') AS question_format,
          q.explanation
        FROM education_mock_test_questions mtq
        JOIN education_questions q
          ON q.id = mtq.question_id
        LEFT JOIN education_question_metadata qm
          ON qm.question_id = q.id
        WHERE mtq.mock_test_id = ?
          AND q.active = 1
        ORDER BY mtq.question_order
        `,
      )
      .bind(test.id)
      .all<{
        question_order: number;
        section_code: string | null;
        marks_correct: number | null;
        marks_incorrect: number | null;
        marks_unanswered: number | null;
        question_id: number;
        correct_choice: string;
        choice_a: string;
        question_format: string;
        explanation: string;
      }>();

  let score = 0;
  let maximumMarks = 0;
  let correctCount = 0;
  let incorrectCount = 0;
  let unansweredCount = 0;

  const sectionTotals =
    new Map<
      string,
      {
        score: number;
        maximumMarks: number;
        correct: number;
        incorrect: number;
        unanswered: number;
      }
    >();

  const questions =
    result.results.map(
      (row) => {
        const questionId =
          Number(row.question_id);

        const selectedRaw =
          answers[
            String(questionId)
          ];

        const questionFormat =
          row.question_format
            .trim()
            .toUpperCase();

        const isNumerical =
          questionFormat === "NUMERICAL" ||
          questionFormat === "INTEGER";

        const selectedChoice =
          typeof selectedRaw === "string"
            ? isNumerical
              ? selectedRaw.trim()
              : selectedRaw
                  .trim()
                  .toUpperCase()
            : "";

        const correctChoice =
          isNumerical
            ? row.choice_a.trim()
            : row.correct_choice
                .trim()
                .toUpperCase();

        const numericalCorrect =
          isNumerical &&
          selectedChoice !== "" &&
          Number.isFinite(
            Number(selectedChoice),
          ) &&
          Number.isFinite(
            Number(correctChoice),
          ) &&
          Math.abs(
            Number(selectedChoice) -
            Number(correctChoice),
          ) < 1e-9;

        const marksCorrect =
          Number(
            row.marks_correct ?? 0,
          );

        const marksIncorrect =
          Number(
            row.marks_incorrect ?? 0,
          );

        const marksUnanswered =
          Number(
            row.marks_unanswered ?? 0,
          );

        maximumMarks +=
          marksCorrect;

        const sectionCode =
          row.section_code ??
          "GENERAL";

        const section =
          sectionTotals.get(
            sectionCode,
          ) ?? {
            score: 0,
            maximumMarks: 0,
            correct: 0,
            incorrect: 0,
            unanswered: 0,
          };

        section.maximumMarks +=
          marksCorrect;

        let marksAwarded =
          marksUnanswered;

        let correct =
          false;

        if (
          !selectedChoice
        ) {
          unansweredCount += 1;
          section.unanswered += 1;
        } else if (
          isNumerical
            ? numericalCorrect
            : selectedChoice ===
                correctChoice
        ) {
          marksAwarded =
            marksCorrect;
          correct =
            true;
          correctCount += 1;
          section.correct += 1;
        } else {
          marksAwarded =
            marksIncorrect;
          incorrectCount += 1;
          section.incorrect += 1;
        }

        score +=
          marksAwarded;

        section.score +=
          marksAwarded;

        sectionTotals.set(
          sectionCode,
          section,
        );

        return {
          questionId,
          order:
            Number(
              row.question_order,
            ),
          sectionCode,
          selectedChoice:
            selectedChoice || null,
          correctChoice,
          correct,
          marksAwarded,
          explanation:
            row.explanation,
        };
      },
    );

  return jsonResponse({
    result: {
      testId:
        Number(test.id),
      testName:
        test.test_name,
      score,
      maximumMarks,
      correctCount,
      incorrectCount,
      unansweredCount,
      sections:
        Array.from(
          sectionTotals.entries(),
        ).map(
          ([
            sectionCode,
            section,
          ]) => ({
            sectionCode,
            ...section,
          }),
        ),
      questions,
    },
  });
}

export async function handleEducationMockTestsRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    request.method === "GET" &&
    url.pathname ===
      "/api/education/mock-test"
  ) {
    return loadFixedTest(
      env,
      url,
    );
  }

  if (
    request.method === "POST" &&
    url.pathname ===
      "/api/education/mock-test/score"
  ) {
    return scoreFixedTest(
      request,
      env,
    );
  }

  return null;
}
