type Env = {
  gyan_registry: D1Database;
};

const GUEST_COOKIE =
  "gyan_anon";

function cookieValue(
  request: Request,
  name: string,
): string {
  const cookie =
    request.headers.get(
      "cookie",
    ) ?? "";

  for (const part of cookie.split(";")) {
    const [key, ...rest] =
      part.trim().split("=");

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
    new TextEncoder().encode(
      value,
    );

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

async function currentGyanAccountId(
  request: Request,
  env: Env,
): Promise<number | null> {
  const token =
    cookieValue(
      request,
      GUEST_COOKIE,
    );

  if (!token) {
    return null;
  }

  const secretHash =
    await sha256Hex(
      token,
    );

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
      .bind(
        secretHash,
      )
      .first<{
        account_id: number;
      }>();

  return row
    ? Number(
        row.account_id,
      )
    : null;
}

async function resolveOwnedStudentId(
  request: Request,
  env: Env,
  studentCode: string,
): Promise<number | null> {
  if (!studentCode) {
    return null;
  }

  const accountId =
    await currentGyanAccountId(
      request,
      env,
    );

  if (!accountId) {
    return null;
  }

  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT id
        FROM education_students
        WHERE gyan_account_id = ?
        LIMIT 1
        `,
      )
      .bind(
        accountId,
      )
      .first<{
        id: number;
      }>();

  return row
    ? Number(
        row.id,
      )
    : null;
}

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
          mt.id,
          mt.program_code,
          mt.test_kind,
          mt.test_code,
          mt.test_name,
          mt.exam_level,
          mt.version,
          mt.access_mode,
          mt.published,
          COALESCE(
            pc.canonical_name,
            mt.program_code
          ) AS program_name,
          pc.duration_minutes,
          COALESCE(
            pc.question_palette_columns,
            5
          ) AS question_palette_columns,
          COALESCE(
            pc.result_palette_columns,
            5
          ) AS result_palette_columns
        FROM education_mock_tests mt
        LEFT JOIN education_program_catalog pc
          ON pc.program_code =
            mt.program_code
        WHERE mt.program_code = ?
          AND mt.test_kind = ?
          AND mt.test_code = ?
          AND mt.exam_level = ?
          AND mt.version = ?
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
        program_name: string;
        duration_minutes:
          number | null;
        question_palette_columns:
          number | null;
        result_palette_columns:
          number | null;
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
          COALESCE(
            rd.response_type,
            qm.question_format,
            'SINGLE_CHOICE'
          ) AS response_type,
          COALESCE(
            qm.question_format,
            rd.response_type,
            'SINGLE_CHOICE'
          ) AS question_format,
          q.choice_a,
          q.choice_b,
          q.choice_c,
          q.choice_d,
          rd.stimulus_type,
          rd.stimulus_text,
          rd.directions_text,
          rd.choices_json,
          rd.correct_answers_json,
          rd.blank_count,
          rd.numeric_tolerance,
          rd.calculator_allowed
        FROM education_mock_test_questions mtq
        JOIN education_questions q
          ON q.id = mtq.question_id
        LEFT JOIN education_question_metadata qm
          ON qm.question_id = q.id
        LEFT JOIN education_question_response_details rd
          ON rd.question_id = q.id
        LEFT JOIN education_mock_question_answers mqa
          ON mqa.question_id = q.id
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
        response_type: string;
        question_format: string;
        choice_a: string;
        choice_b: string;
        choice_c: string;
        choice_d: string;
        stimulus_type:
          string | null;
        stimulus_text:
          string | null;
        directions_text:
          string | null;
        choices_json:
          string | null;
        correct_answers_json:
          string | null;
        blank_count:
          number | null;
        numeric_tolerance:
          number | null;
        calculator_allowed:
          number | null;
      }>();

  const questions =
    result.results.map(
      (row) => {
        const letters =
          "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

        // eslint-disable-next-line no-useless-assignment
        let parsedChoices:
          unknown =
          null;

        // eslint-disable-next-line no-useless-assignment
        let parsedCorrect:
          unknown =
          null;

        try {
          parsedChoices =
            row.choices_json
              ? JSON.parse(
                  row.choices_json,
                )
              : null;
        } catch {
          parsedChoices =
            null;
        }

        try {
          parsedCorrect =
            row.correct_answers_json
              ? JSON.parse(
                  row.correct_answers_json,
                )
              : null;
        } catch {
          parsedCorrect =
            null;
        }

        const choices =
          Array.isArray(
            parsedChoices,
          )
            ? parsedChoices
                .map(
                  (
                    value,
                    index,
                  ) => ({
                    key:
                      letters[
                        index
                      ] ??
                      String(
                        index +
                        1,
                      ),
                    text:
                      String(
                        value ??
                        "",
                      ),
                  }),
                )
                .filter(
                  (item) =>
                    item.text !==
                    "",
                )
            : [
                {
                  key: "A",
                  text:
                    row.choice_a,
                },
                {
                  key: "B",
                  text:
                    row.choice_b,
                },
                {
                  key: "C",
                  text:
                    row.choice_c,
                },
                {
                  key: "D",
                  text:
                    row.choice_d,
                },
              ].filter(
                (item) =>
                  item.text !==
                  "",
              );

        const choiceGroups =
          parsedChoices &&
          typeof parsedChoices ===
            "object" &&
          !Array.isArray(
            parsedChoices,
          )
            ? Object.entries(
                parsedChoices as
                  Record<
                    string,
                    unknown
                  >,
              ).map(
                ([
                  groupKey,
                  rawValues,
                ]) => ({
                  key:
                    groupKey,
                  label:
                    groupKey
                      .replace(
                        /_/g,
                        " ",
                      )
                      .replace(
                        /\b\w/g,
                        (letter) =>
                          letter.toUpperCase(),
                      ),
                  choices:
                    Array.isArray(
                      rawValues,
                    )
                      ? rawValues.map(
                          (
                            value,
                            index,
                          ) => ({
                            key:
                              letters[
                                index
                              ] ??
                              String(
                                index +
                                1,
                              ),
                            text:
                              String(
                                value ??
                                "",
                              ),
                          }),
                        )
                      : [],
                }),
              )
            : [];

        const responseType =
          (
            row.response_type ??
            row.question_format ??
            "SINGLE_CHOICE"
          )
            .trim()
            .toUpperCase();

        const correctArray =
          Array.isArray(
            parsedCorrect,
          )
            ? parsedCorrect
            : [];

        const answerMode =
          responseType ===
            "NUMERIC_ENTRY" ||
          responseType ===
            "NUMERICAL" ||
          responseType ===
            "INTEGER"
            ? "NUMERIC"
            : Number(
                  row.blank_count ??
                  0,
                ) >
                1 &&
              responseType ===
                "TEXT_COMPLETION"
              ? "MULTI_BLANK"
              : responseType ===
                  "MULTI_SELECT" ||
                responseType ===
                  "SENTENCE_EQUIVALENCE" ||
                correctArray.length >
                  1
                ? "MULTI_SELECT"
                : "SINGLE_CHOICE";

        return {
          order:
            Number(
              row.question_order,
            ),
          sectionCode:
            row.section_code,
          id:
            Number(
              row.question_id,
            ),
          key:
            row.question_key,
          difficulty:
            row.difficulty,
          text:
            row.question_text,
          questionFormat:
            row.question_format,
          responseType,
          answerMode,
          stimulus: {
            type:
              row.stimulus_type ??
              "NONE",
            text:
              row.stimulus_text ??
              null,
          },
          directionsText:
            row.directions_text ??
            null,
          choices,
          choiceGroups,
          blankCount:
            Number(
              row.blank_count ??
              0,
            ),
          calculatorAllowed:
            Number(
              row.calculator_allowed ??
              0,
            ) ===
            1,
          marksCorrect:
            Number(
              row.marks_correct ??
              0,
            ),
          marksIncorrect:
            Number(
              row.marks_incorrect ??
              0,
            ),
          marksUnanswered:
            Number(
              row.marks_unanswered ??
              0,
            ),
        };
      },
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

      config: {
        programName:
          test.program_name,

        durationMinutes:
          test.duration_minutes ===
            null
            ? null
            : Number(
                test.duration_minutes,
              ),

        questionPaletteColumns:
          Math.max(
            1,
            Number(
              test.question_palette_columns ??
              5,
            ),
          ),

        resultPaletteColumns:
          Math.max(
            1,
            Number(
              test.result_palette_columns ??
              5,
            ),
          ),
      },

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
    studentCode?: unknown;
    elapsedSeconds?: unknown;
    saveCount?: unknown;
    reviewQuestionIds?: unknown;
    guidanceUsage?: unknown;
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

  const studentCode =
    normalizeCode(
      typeof body.studentCode ===
        "string"
        ? body.studentCode
        : "",
    );

  const elapsedSeconds =
    Math.max(
      0,
      Math.floor(
        Number(
          body.elapsedSeconds ??
          0,
        ) || 0,
      ),
    );

  const saveCount =
    Math.max(
      0,
      Math.min(
        5,
        Math.floor(
          Number(
            body.saveCount ??
            0,
          ) || 0,
        ),
      ),
    );

  const reviewQuestionIds =
    new Set(
      Array.isArray(
        body.reviewQuestionIds,
      )
        ? body.reviewQuestionIds
            .map(
              Number,
            )
            .filter(
              Number.isFinite,
            )
        : [],
    );

  const guidanceUsage =
    Array.isArray(
      body.guidanceUsage,
    )
      ? body.guidanceUsage
          .map(
            (
              item,
            ) => {
              if (
                !item ||
                typeof item !==
                  "object"
              ) {
                return null;
              }

              const value =
                item as {
                  questionId?:
                    unknown;
                  kind?:
                    unknown;
                };

              const questionId =
                Number(
                  value.questionId,
                );

              const kind =
                typeof value.kind ===
                  "string"
                  ? value.kind
                      .trim()
                      .toUpperCase()
                  : "";

              if (
                !Number.isInteger(
                  questionId,
                ) ||
                questionId <= 0 ||
                (
                  kind !== "TIP" &&
                  kind !==
                    "FIFTY_FIFTY"
                )
              ) {
                return null;
              }

              return {
                questionId,
                kind:
                  kind as
                    | "TIP"
                    | "FIFTY_FIFTY",
              };
            },
          )
          .filter(
            (
              value,
            ): value is {
              questionId:
                number;
              kind:
                | "TIP"
                | "FIFTY_FIFTY";
            } =>
              value !== null,
          )
      : [];

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
          mqa.answer_key,
          COALESCE(
            rd.response_type,
            qm.question_format,
            'SINGLE_CHOICE'
          ) AS response_type,
          COALESCE(
            qm.question_format,
            rd.response_type,
            'SINGLE_CHOICE'
          ) AS question_format,
          rd.correct_answers_json,
          rd.blank_count,
          rd.numeric_tolerance,
          q.explanation
        FROM education_mock_test_questions mtq
        JOIN education_questions q
          ON q.id = mtq.question_id
        LEFT JOIN education_question_metadata qm
          ON qm.question_id = q.id
        LEFT JOIN education_question_response_details rd
          ON rd.question_id = q.id
        LEFT JOIN education_mock_question_answers mqa
          ON mqa.question_id = q.id
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
        answer_key: string | null;
        response_type: string;
        question_format: string;
        correct_answers_json:
          string | null;
        blank_count:
          number | null;
        numeric_tolerance:
          number | null;
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

        const responseType =
          (
            row.response_type ??
            questionFormat
          )
            .trim()
            .toUpperCase();

        // eslint-disable-next-line no-useless-assignment
        let parsedCorrect:
          unknown =
          null;

        try {
          parsedCorrect =
            row.correct_answers_json
              ? JSON.parse(
                  row.correct_answers_json,
                )
              : null;
        } catch {
          parsedCorrect =
            null;
        }

        const normalizeMultiSelect =
          (
            value: string,
          ): string =>
            Array.from(
              new Set(
                value
                  .trim()
                  .toUpperCase()
                  .replace(
                    /[^A-Z]/g,
                    "",
                  )
                  .split(
                    "",
                  )
                  .filter(
                    Boolean,
                  ),
              ),
            )
              .sort()
              .join("");

        const isNumeric =
          responseType ===
            "NUMERIC_ENTRY" ||
          responseType ===
            "NUMERICAL" ||
          responseType ===
            "INTEGER";

        const isMultiBlank =
          responseType ===
            "TEXT_COMPLETION" &&
          Number(
            row.blank_count ??
            0,
          ) >
            1;

        const correctArray =
          Array.isArray(
            parsedCorrect,
          )
            ? parsedCorrect.map(
                (value) =>
                  String(
                    value,
                  ),
              )
            : [];

        const isMultiSelect =
          responseType ===
            "MULTI_SELECT" ||
          responseType ===
            "SENTENCE_EQUIVALENCE" ||
          (
            !isNumeric &&
            !isMultiBlank &&
            correctArray.length >
              1
          );

        const selectedChoice =
          typeof selectedRaw ===
            "string"
            ? selectedRaw.trim()
            : "";

        // eslint-disable-next-line no-useless-assignment
        let correctChoice =
          "";

        // eslint-disable-next-line no-useless-assignment
        let responseCorrect =
          false;

        if (isNumeric) {
          const accepted =
            correctArray.length
              ? correctArray
              : [
                  row.choice_a.trim(),
                ];

          const selectedNumber =
            Number(
              selectedChoice,
            );

          const tolerance =
            Math.max(
              0,
              Number(
                row.numeric_tolerance ??
                1e-9,
              ),
            );

          responseCorrect =
            selectedChoice !==
              "" &&
            Number.isFinite(
              selectedNumber,
            ) &&
            accepted.some(
              (answer) => {
                const answerNumber =
                  Number(
                    answer,
                  );

                return (
                  Number.isFinite(
                    answerNumber,
                  ) &&
                  Math.abs(
                    selectedNumber -
                    answerNumber,
                  ) <=
                    tolerance
                );
              },
            );

          correctChoice =
            accepted.join(
              " / ",
            );
        } else if (
          isMultiBlank
        ) {
          let selectedObject:
            Record<
              string,
              string
            > =
            {};

          let correctObject:
            Record<
              string,
              string
            > =
            {};

          try {
            selectedObject =
              selectedChoice
                ? JSON.parse(
                    selectedChoice,
                  )
                : {};
          } catch {
            selectedObject =
              {};
          }

          if (
            parsedCorrect &&
            typeof parsedCorrect ===
              "object" &&
            !Array.isArray(
              parsedCorrect,
            )
          ) {
            correctObject =
              Object.fromEntries(
                Object.entries(
                  parsedCorrect as
                    Record<
                      string,
                      unknown
                    >,
                ).map(
                  ([
                    key,
                    value,
                  ]) => [
                    key,
                    String(
                      value,
                    )
                      .trim()
                      .toUpperCase(),
                  ],
                ),
              );
          }

          const correctKeys =
            Object.keys(
              correctObject,
            );

          responseCorrect =
            selectedChoice !==
              "" &&
            correctKeys.length >
              0 &&
            correctKeys.every(
              (key) =>
                String(
                  selectedObject[
                    key
                  ] ??
                  "",
                )
                  .trim()
                  .toUpperCase() ===
                correctObject[
                  key
                ],
            );

          correctChoice =
            JSON.stringify(
              correctObject,
            );
        } else if (
          isMultiSelect
        ) {
          const expected =
            normalizeMultiSelect(
              correctArray.length
                ? correctArray.join(
                    "",
                  )
                : (
                    row.answer_key ??
                    row.correct_choice
                  ),
            );

          const selected =
            normalizeMultiSelect(
              selectedChoice,
            );

          responseCorrect =
            selected !==
              "" &&
            selected ===
              expected;

          correctChoice =
            expected;
        } else {
          const expected =
            (
              correctArray[0] ??
              row.answer_key ??
              row.correct_choice
            )
              .trim()
              .toUpperCase();

          const selected =
            selectedChoice
              .trim()
              .toUpperCase();

          responseCorrect =
            selected !==
              "" &&
            selected ===
              expected;

          correctChoice =
            expected;
        }

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
          responseCorrect
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


  let savedAttempt:
    {
      id: number;
      attemptNumber: number;
    } | null =
      null;

  if (studentCode) {
    const studentId =
      await resolveOwnedStudentId(
        request,
        env,
        studentCode,
      );

    if (studentId) {
      const previous =
        await env.gyan_registry
          .prepare(
            `
            SELECT
              COALESCE(
                MAX(attempt_number),
                0
              ) AS max_attempt
            FROM education_mock_attempts
            WHERE student_id = ?
              AND mock_test_id = ?
            `,
          )
          .bind(
            studentId,
            test.id,
          )
          .first<{
            max_attempt: number;
          }>();

      const attemptNumber =
        Number(
          previous?.max_attempt ??
          0,
        ) + 1;

      const inserted =
        await env.gyan_registry
          .prepare(
            `
            INSERT INTO education_mock_attempts (
              student_id,
              mock_test_id,
              attempt_number,
              elapsed_seconds,
              save_count,
              score,
              max_score,
              correct_count,
              incorrect_count,
              unanswered_count,
              submitted_at
            )
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)
            RETURNING id
            `,
          )
          .bind(
            studentId,
            test.id,
            attemptNumber,
            elapsedSeconds,
            saveCount,
            score,
            maximumMarks,
            correctCount,
            incorrectCount,
            unansweredCount,
          )
          .first<{
            id: number;
          }>();

      if (inserted) {
        const attemptId =
          Number(
            inserted.id,
          );

        const statements =
          questions.map(
            (question) =>
              env.gyan_registry
                .prepare(
                  `
                  INSERT INTO education_mock_attempt_answers (
                    attempt_id,
                    question_id,
                    selected_answer,
                    marked_for_review,
                    correct,
                    marks_awarded
                  )
                  VALUES (?, ?, ?, ?, ?, ?)
                  `,
                )
                .bind(
                  attemptId,
                  question.questionId,
                  question.selectedChoice,
                  reviewQuestionIds.has(
                    question.questionId,
                  )
                    ? 1
                    : 0,
                  question.correct
                    ? 1
                    : 0,
                  question.marksAwarded,
                ),
          );

        if (statements.length) {
          await env.gyan_registry.batch(
            statements,
          );
        }

        const validQuestionIds =
          new Set(
            questions.map(
              (
                question,
              ) =>
                Number(
                  question.questionId,
                ),
            ),
          );

        const guidanceStatements =
          guidanceUsage
            .filter(
              (
                usage,
              ) =>
                validQuestionIds.has(
                  usage.questionId,
                ),
            )
            .map(
              (
                usage,
              ) =>
                env.gyan_registry
                  .prepare(
                    `
                    INSERT OR IGNORE INTO education_ai_tip_attempt_usage (
                      question_id,
                      mock_attempt_id,
                      live_attempt_id,
                      assistance_type
                    )
                    VALUES (?, ?, NULL, ?)
                    `,
                  )
                  .bind(
                    usage.questionId,
                    attemptId,
                    usage.kind,
                  ),
            );

        if (
          guidanceStatements.length
        ) {
          await env.gyan_registry.batch(
            guidanceStatements,
          );
        }

        savedAttempt = {
          id:
            attemptId,
          attemptNumber,
        };
      }
    }
  }

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
      attempt:
        savedAttempt,
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
