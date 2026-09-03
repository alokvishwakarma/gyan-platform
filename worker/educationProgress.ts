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


const GUEST_COOKIE =
  "gyan_anon";


function cookieValue(
  request: Request,
  name: string,
): string {
  const cookie =
    request.headers.get(
      "cookie",
    ) ??
    "";

  for (
    const part
    of cookie.split(";")
  ) {
    const [
      key,
      ...rest
    ] =
      part.trim().split("=");

    if (
      key ===
      name
    ) {
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
      .encode(
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
          .padStart(
            2,
            "0",
          ),
    )
    .join("");
}


type EducationGuest = {
  id: number;
  slug: string;
  gyan_name: string;
  email: string | null;
  status: string;
};


async function currentEducationGuest(
  request: Request,
  env: Env,
): Promise<EducationGuest | null> {
  const token =
    cookieValue(
      request,
      GUEST_COOKIE,
    );

  if (!token) {
    return null;
  }

  const tokenHash =
    await sha256Hex(
      token,
    );

  const identity =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            ga.id,
            ga.code AS slug,
            ga.display_name AS gyan_name,
            ga.email,
            'GUEST_ACTIVE' AS status

          FROM gyan_browser_sessions gbs

          INNER JOIN gyan_accounts ga
            ON ga.id =
               gbs.account_id

          WHERE
            gbs.secret_hash = ?

          LIMIT 1
        `,
      )
      .bind(
        tokenHash,
      )
      .first<EducationGuest>();

  if (!identity) {
    return null;
  }

  await env.gyan_registry
    .prepare(
      `
        UPDATE gyan_browser_sessions
        SET last_seen_at =
          CURRENT_TIMESTAMP
        WHERE secret_hash = ?
      `,
    )
    .bind(
      tokenHash,
    )
    .run();

  return identity;
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


  const activeGuest =
    await currentEducationGuest(
      request,
      env,
    );

  const guestCode =
    normalizeCode(
      activeGuest
        ?.slug,
    );

  const useActiveGuest =
    Boolean(
      activeGuest &&
      guestCode &&
      (
        !requestedStudentCode ||
        requestedStudentCode ===
          guestCode
      ),
    );

  const effectiveStudentName =
    useActiveGuest
      ? normalizeName(
          activeGuest
            ?.gyan_name,
        ) ||
        "GYAN Learner"
      : studentName;

  const protectedGuestEmail =
    normalizeEmail(
      activeGuest
        ?.email,
    );

  const effectiveEmail =
    useActiveGuest
      ? (
          protectedGuestEmail ||
          `guest-${activeGuest!.id}@guest.gyan.invalid`
        )
      : email;

  if (
    effectiveStudentName.length < 1 ||
    effectiveStudentName.length > 80
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
      effectiveEmail,
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
    useActiveGuest &&
    activeGuest
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
            gyan_account_id = ?

          LIMIT 1
          `,
        )
        .bind(
          activeGuest.id,
        )
        .first<{
          id: number;
          student_code: string;
          student_name: string;
          email: string;
        }>();

    if (
      student &&
      student.email !==
        effectiveEmail &&
      !student.email.startsWith(
        `guest-${activeGuest.id}@`,
      )
    ) {
      return jsonResponse(
        {
          error:
            "This GYAN code is already linked to another education record.",
        },
        409,
      );
    }
  } else if (
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
          effectiveEmail,
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
            gyan_account_id,
            country_code,
            grade_code,
            created_at,
            updated_at
          )
          VALUES (
            ?, ?, ?, ?, ?, ?, ?,
            CURRENT_TIMESTAMP,
            CURRENT_TIMESTAMP
          )
          `,
        )
        .bind(
          studentCode,
          effectiveStudentName,
          effectiveEmail,
          user?.id ??
            null,
          useActiveGuest &&
              activeGuest
            ? activeGuest.id
            : null,
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
        effectiveStudentName,

      email:
        effectiveEmail,
    };
  } else {
    await env.gyan_registry
      .prepare(
        `
        UPDATE education_students
        SET
          student_name = ?,
          email = ?,
          user_id =
            COALESCE(
              user_id,
              ?
            ),
          gyan_account_id =
            COALESCE(
              gyan_account_id,
              ?
            ),
          updated_at =
            CURRENT_TIMESTAMP

        WHERE id = ?
        `,
      )
      .bind(
        effectiveStudentName,
        effectiveEmail,
        user?.id ??
          null,
        useActiveGuest &&
            activeGuest
          ? activeGuest.id
          : null,
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

  await env.gyan_registry.batch(
    graded.map(
      (
        answer,
      ) =>
        env.gyan_registry
          .prepare(
            `
            INSERT OR IGNORE INTO education_student_question_history (
              student_id,
              question_id,
              first_attempted_at
            )
            VALUES (
              ?, ?,
              CURRENT_TIMESTAMP
            )
            `,
          )
          .bind(
            student.id,
            answer.questionId,
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
      `/student/${
        useActiveGuest
          ? guestCode
          : student.student_code
      }`,
      url.origin,
    ).toString();

  return jsonResponse({
    saved:
      true,

    student: {
      code:
        useActiveGuest
          ? guestCode
          : student.student_code,

      name:
        effectiveStudentName,

      email:
        useActiveGuest
          ? protectedGuestEmail
          : effectiveEmail,

      cardUrl,
    },

    attempt: {
      correctCount,
      questionCount:
        graded.length,
      scorePercent,
    },

    report,

    protection:
      await educationProtectionStatus(
        env,
        Number(
          student.id,
        ),
        activeGuest
          ?.email ??
        effectiveEmail ??
        null,
      ),
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

type EducationProtectionStatus = {
  answeredCount: number;
  emailProtected: boolean;
  milestone25Shown: boolean;
  milestone50Shown: boolean;
};


async function educationProtectionStatus(
  env: Env,
  studentId: number,
  accountEmail:
    string |
    null |
    undefined,
): Promise<EducationProtectionStatus> {
  const counts =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          (
            SELECT COUNT(*)
            FROM education_attempt_answers aa
            INNER JOIN education_attempts a
              ON a.id = aa.attempt_id
            WHERE a.student_id = ?
              AND aa.selected_choice IS NOT NULL
              AND TRIM(aa.selected_choice) <> ''
          )
          +
          (
            SELECT COUNT(*)
            FROM education_mock_attempt_answers maa
            INNER JOIN education_mock_attempts ma
              ON ma.id = maa.attempt_id
            WHERE ma.student_id = ?
              AND maa.selected_answer IS NOT NULL
              AND TRIM(maa.selected_answer) <> ''
          ) AS answered_count
        `,
      )
      .bind(
        studentId,
        studentId,
      )
      .first<{
        answered_count: number;
      }>();

  const milestones =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          milestone_25_shown,
          milestone_50_shown
        FROM education_protection_milestones
        WHERE student_id = ?
        LIMIT 1
        `,
      )
      .bind(
        studentId,
      )
      .first<{
        milestone_25_shown: number;
        milestone_50_shown: number;
      }>();

  return {
    answeredCount:
      Math.max(
        0,
        Number(
          counts?.answered_count ??
          0,
        ),
      ),

    emailProtected:
      Boolean(
        accountEmail
          ?.trim(),
      ),

    milestone25Shown:
      Number(
        milestones
          ?.milestone_25_shown ??
        0,
      ) === 1,

    milestone50Shown:
      Number(
        milestones
          ?.milestone_50_shown ??
        0,
      ) === 1,
  };
}


async function resolveActiveEducationStudent(
  request: Request,
  env: Env,
  studentCode: string,
): Promise<
  {
    id: number;
    accountEmail: string | null;
  } |
  null
> {
  const activeGuest =
    await currentEducationGuest(
      request,
      env,
    );

  if (
    !activeGuest ||
    normalizeCode(
      activeGuest.slug,
    ) !==
      normalizeCode(
        studentCode,
      )
  ) {
    return null;
  }

  const student =
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
        activeGuest.id,
      )
      .first<{
        id: number;
      }>();

  if (!student) {
    return null;
  }

  return {
    id:
      Number(
        student.id,
      ),
    accountEmail:
      activeGuest.email,
  };
}


async function getProtectionStatus(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
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
    await resolveActiveEducationStudent(
      request,
      env,
      studentCode,
    );

  if (!student) {
    return jsonResponse(
      {
        error:
          "This GYAN is not active in this browser.",
      },
      403,
    );
  }

  return jsonResponse({
    protection:
      await educationProtectionStatus(
        env,
        student.id,
        student.accountEmail,
      ),
  });
}


async function markProtectionMilestone(
  request: Request,
  env: Env,
): Promise<Response> {
  let body:
    {
      studentCode?: unknown;
      milestone?: unknown;
    };

  try {
    body =
      await request.json() as {
        studentCode?: unknown;
        milestone?: unknown;
      };
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid JSON body.",
      },
      400,
    );
  }

  const studentCode =
    normalizeCode(
      body.studentCode,
    );

  const milestone =
    Number(
      body.milestone,
    );

  if (
    milestone !== 25 &&
    milestone !== 50
  ) {
    return jsonResponse(
      {
        error:
          "milestone must be 25 or 50.",
      },
      400,
    );
  }

  const student =
    await resolveActiveEducationStudent(
      request,
      env,
      studentCode,
    );

  if (!student) {
    return jsonResponse(
      {
        error:
          "This GYAN is not active in this browser.",
      },
      403,
    );
  }

  await env.gyan_registry
    .prepare(
      milestone === 25
        ? `
          INSERT INTO education_protection_milestones (
            student_id,
            milestone_25_shown,
            updated_at
          )
          VALUES (?, 1, CURRENT_TIMESTAMP)
          ON CONFLICT(student_id)
          DO UPDATE SET
            milestone_25_shown = 1,
            updated_at = CURRENT_TIMESTAMP
          `
        : `
          INSERT INTO education_protection_milestones (
            student_id,
            milestone_25_shown,
            milestone_50_shown,
            updated_at
          )
          VALUES (?, 1, 1, CURRENT_TIMESTAMP)
          ON CONFLICT(student_id)
          DO UPDATE SET
            milestone_25_shown = 1,
            milestone_50_shown = 1,
            updated_at = CURRENT_TIMESTAMP
          `,
    )
    .bind(
      student.id,
    )
    .run();

  return jsonResponse({
    saved:
      true,
    milestone,
  });
}


async function getReport(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  const activeGuest =
    await currentEducationGuest(
      request,
      env,
    );

  const guestCode =
    normalizeCode(
      activeGuest
        ?.slug,
    );

  const user =
    await currentUser(
      request,
      env,
    );

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

  if (
    activeGuest &&
    guestCode &&
    studentCode !==
      guestCode
  ) {
    return jsonResponse(
      {
        error:
          "This GYAN is not active in this browser.",
      },
      403,
    );
  }

  if (
    !activeGuest &&
    !user
  ) {
    return jsonResponse(
      {
        error:
          "Open this GYAN on its linked device to view saved progress.",
      },
      401,
    );
  }

  const student =
    await env.gyan_registry
      .prepare(
        activeGuest
          ? `
            SELECT
              id,
              student_code,
              student_name,
              email,
              country_code,
              grade_code

            FROM education_students

            WHERE
              gyan_account_id = ?

            LIMIT 1
          `
          : `
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
        ...(
          activeGuest
            ? [
                activeGuest!.id,
              ]
            : [
                studentCode,
                user!.email,
              ]
        ),
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

  const attemptStats =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          COUNT(*) AS totalAttempts

        FROM education_attempts

        WHERE student_id = ?
        `,
      )
      .bind(
        student.id,
      )
      .first<{
        totalAttempts: number;
      }>();

  const recentAttempts =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          subject_code AS subjectCode,
          topic_code AS topicCode,
          question_count AS questionCount,
          correct_count AS correctCount,
          score_percent AS scorePercent,
          created_at AS createdAt

        FROM education_attempts

        WHERE student_id = ?

        ORDER BY
          created_at DESC,
          id DESC

        LIMIT 10
        `,
      )
      .bind(
        student.id,
      )
      .all<{
        id: number;
        subjectCode: string;
        topicCode: string;
        questionCount: number;
        correctCount: number;
        scorePercent: number;
        createdAt: string;
      }>();

  const topicProgress =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          s.subject_code AS subjectCode,
          t.topic_code AS topicCode,
          COUNT(h.question_id) AS uniqueQuestionsAttempted,
          COALESCE(m.questions_answered, 0) AS answersCount,
          COALESCE(m.correct_answers, 0) AS correctAnswers,
          m.score_percent AS scorePercent

        FROM education_student_question_history h

        JOIN education_questions q
          ON q.id = h.question_id

        JOIN education_subtopics st
          ON st.id = q.subtopic_id

        JOIN education_topics t
          ON t.id = st.topic_id

        JOIN education_subjects s
          ON s.id = t.subject_id

        LEFT JOIN education_topic_mastery m
          ON m.student_id = h.student_id
          AND m.subject_code = s.subject_code
          AND m.topic_code = t.topic_code

        WHERE
          h.student_id = ?
          AND q.active = 1

        GROUP BY
          s.subject_code,
          t.topic_code,
          m.questions_answered,
          m.correct_answers,
          m.score_percent

        ORDER BY
          s.subject_code,
          t.topic_code
        `,
      )
      .bind(
        student.id,
      )
      .all<{
        subjectCode: string;
        topicCode: string;
        uniqueQuestionsAttempted: number;
        answersCount: number;
        correctAnswers: number;
        scorePercent: number | null;
      }>();


  const mockAttemptsResult =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          ma.id,
          ma.attempt_number,
          ma.elapsed_seconds,
          ma.save_count,
          ma.score,
          ma.max_score AS maximum_marks,
          ma.correct_count,
          ma.incorrect_count,
          ma.unanswered_count,
          ma.submitted_at,
          mt.id AS test_id,
          mt.test_code,
          mt.test_name,
          mt.test_kind,
          mt.exam_level,
          (
            SELECT COUNT(*)
            FROM education_mock_attempt_answers maa
            WHERE maa.attempt_id = ma.id
          ) AS question_count
        FROM education_mock_attempts ma
        INNER JOIN education_mock_tests mt
          ON mt.id = ma.mock_test_id
        WHERE ma.student_id = ?
        ORDER BY ma.submitted_at DESC, ma.id DESC
        `,
      )
      .bind(
        student.id,
      )
      .all<{
        id: number;
        attempt_number: number;
        elapsed_seconds: number;
        save_count: number;
        score: number;
        maximum_marks: number;
        correct_count: number;
        incorrect_count: number;
        unanswered_count: number;
        submitted_at: string;
        test_id: number;
        test_code: string;
        test_name: string;
        test_kind: string;
        exam_level: string;
        question_count: number;
      }>();

  const mockAttemptIds =
    mockAttemptsResult.results.map(
      (row) =>
        Number(
          row.id,
        ),
    );

  const mockQuestionResults =
    mockAttemptIds.length
      ? await env.gyan_registry
          .prepare(
            `
            SELECT
              maa.attempt_id,
              maa.question_id,
              maa.selected_answer,
              maa.correct,
              mtq.question_order,
              mtq.section_code,
              q.question_text,
              q.choice_a,
              q.choice_b,
              q.choice_c,
              q.choice_d,
              q.correct_choice,
              q.explanation
            FROM education_mock_attempt_answers maa
            INNER JOIN education_mock_attempts ma
              ON ma.id = maa.attempt_id
            INNER JOIN education_mock_test_questions mtq
              ON mtq.mock_test_id = ma.mock_test_id
             AND mtq.question_id = maa.question_id
            INNER JOIN education_questions q
              ON q.id = maa.question_id
            WHERE maa.attempt_id IN (
              ${mockAttemptIds
                .map(() => "?")
                .join(",")}
            )
            ORDER BY maa.attempt_id, mtq.question_order
            `,
          )
          .bind(
            ...mockAttemptIds,
          )
          .all<{
            attempt_id: number;
            question_id: number;
            selected_answer: string | null;
            correct: number;
            question_order: number;
            section_code: string | null;
            question_text: string;
            choice_a: string | null;
            choice_b: string | null;
            choice_c: string | null;
            choice_d: string | null;
            correct_choice: string | null;
            explanation: string | null;
          }>()
      : {
          results:
            [] as Array<{
              attempt_id: number;
              question_id: number;
              selected_answer: string | null;
              correct: number;
              question_order: number;
              section_code: string | null;
              question_text: string;
              choice_a: string | null;
              choice_b: string | null;
              choice_c: string | null;
              choice_d: string | null;
              correct_choice: string | null;
              explanation: string | null;
            }>,
        };

  const mockResultsByAttempt =
    new Map<
      number,
      Array<{
        questionId: number;
        sectionCode: string;
        questionOrder: number;
        status:
          | "correct"
          | "wrong"
          | "unanswered";
        selectedAnswer: string;
        questionText: string;
        choices: {
          A: string;
          B: string;
          C: string;
          D: string;
        };
        correctAnswer: string;
        explanation: string | null;
      }>
    >();

  for (
    const row of
      mockQuestionResults.results
  ) {
    const attemptId =
      Number(
        row.attempt_id,
      );

    const current =
      mockResultsByAttempt.get(
        attemptId,
      ) ?? [];

    current.push({
      questionId:
        Number(
          row.question_id,
        ),

      sectionCode:
        row.section_code ??
        "GENERAL",

      questionOrder:
        Number(
          row.question_order,
        ),

      status:
        !row.selected_answer
          ? "unanswered"
          : Number(
              row.correct,
            ) === 1
            ? "correct"
            : "wrong",

      selectedAnswer:
        row.selected_answer ??
        "",

      questionText:
        row.question_text,

      choices: {
        A:
          row.choice_a ??
          "",
        B:
          row.choice_b ??
          "",
        C:
          row.choice_c ??
          "",
        D:
          row.choice_d ??
          "",
      },

      correctAnswer:
        row.correct_choice ??
        "",

      explanation:
        row.explanation,
    });

    mockResultsByAttempt.set(
      attemptId,
      current,
    );
  }

  const mockAttempts =
    mockAttemptsResult.results.map(
      (row) => {
        const maximumMarks =
          Number(
            row.maximum_marks,
          );

        return {
          id:
            Number(
              row.id,
            ),
          testId:
            Number(
              row.test_id,
            ),
          testCode:
            row.test_code,
          testName:
            row.test_name,
          testKind:
            row.test_kind,
          examLevel:
            row.exam_level,
          attemptNumber:
            Number(
              row.attempt_number,
            ),
          questionCount:
            Number(
              row.question_count,
            ),
          score:
            Number(
              row.score,
            ),
          maximumMarks,
          scorePercent:
            maximumMarks > 0
              ? Math.min(
                  100,
                  Math.round(
                    Number(
                      row.score,
                    ) *
                      100 /
                      maximumMarks,
                  ),
                )
              : 0,
          correctCount:
            Number(
              row.correct_count,
            ),
          incorrectCount:
            Number(
              row.incorrect_count,
            ),
          unansweredCount:
            Number(
              row.unanswered_count,
            ),
          elapsedSeconds:
            Number(
              row.elapsed_seconds,
            ),
          saveCount:
            Number(
              row.save_count,
            ),
          submittedAt:
            row.submitted_at,
          questionResults:
            mockResultsByAttempt.get(
              Number(
                row.id,
              ),
            ) ?? [],
        };
      },
    );

  const protection =
    await educationProtectionStatus(
      env,
      Number(
        student.id,
      ),
      activeGuest
        ?.email ??
      user
        ?.email ??
      null,
    );

  return jsonResponse({
    protection,
    mockAttempts,
    student: {
      code:
        activeGuest
          ? guestCode
          : student.student_code,
      name:
        activeGuest
          ? (
              normalizeName(
                activeGuest.gyan_name,
              ) ||
              student.student_name
            )
          : student.student_name,
      email:
        activeGuest
          ? normalizeEmail(
              activeGuest.email,
            )
          : student.email,
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

    topicProgress:
      topicProgress.results.map(
        (item) => ({
          subjectCode:
            item.subjectCode,
          topicCode:
            item.topicCode,
          uniqueQuestionsAttempted:
            Number(
              item.uniqueQuestionsAttempted ??
              0,
            ),
          answersCount:
            Number(
              item.answersCount ??
              0,
            ),
          correctAnswers:
            Number(
              item.correctAnswers ??
              0,
            ),
          scorePercent:
            item.scorePercent ==
              null
              ? null
              : Number(
                  item.scorePercent,
                ),
        }),
      ),

    attemptSummary: {
      totalAttempts:
        Number(
          attemptStats
            ?.totalAttempts ??
          0,
        ),

      recentAttempts:
        [...recentAttempts.results]
          .reverse()
          .map(
            (attempt) => ({
            id:
              Number(
                attempt.id,
              ),

            subjectCode:
              attempt.subjectCode,

            topicCode:
              attempt.topicCode,

            questionCount:
              Number(
                attempt.questionCount,
              ),

            correctCount:
              Number(
                attempt.correctCount,
              ),

            scorePercent:
              Number(
                attempt.scorePercent,
              ),

              createdAt:
                attempt.createdAt,
            }),
          ),
    },
  });
}


async function getReviewQuestions(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  const activeGuest =
    await currentEducationGuest(
      request,
      env,
    );

  const guestCode =
    normalizeCode(
      activeGuest
        ?.slug,
    );

  const user =
    await currentUser(
      request,
      env,
    );

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

  if (
    activeGuest &&
    guestCode &&
    studentCode !==
      guestCode
  ) {
    return jsonResponse(
      {
        error:
          "This GYAN is not active in this browser.",
      },
      403,
    );
  }

  if (
    !activeGuest &&
    !user
  ) {
    return jsonResponse(
      {
        error:
          "Open this GYAN on its linked device to revise saved work.",
      },
      401,
    );
  }

  const student =
    await env.gyan_registry
      .prepare(
        activeGuest
          ? `
            SELECT
              id,
              country_code,
              grade_code

            FROM education_students

            WHERE
              gyan_account_id = ?

            LIMIT 1
          `
          : `
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
        ...(
          activeGuest
            ? [
                activeGuest!.id,
              ]
            : [
                studentCode,
                user!.email,
              ]
        ),
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



async function getAttemptDetail(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  const activeGuest =
    await currentEducationGuest(
      request,
      env,
    );

  const user =
    await currentUser(
      request,
      env,
    );

  const studentCode =
    normalizeCode(
      url.searchParams.get(
        "student",
      ),
    );

  const attemptId =
    Number(
      url.searchParams.get(
        "attempt",
      ) ??
      0,
    );

  if (
    !studentCode ||
    !Number.isInteger(
      attemptId,
    ) ||
    attemptId <= 0
  ) {
    return jsonResponse(
      {
        error:
          "student and attempt are required.",
      },
      400,
    );
  }

  if (
    !activeGuest &&
    !user
  ) {
    return jsonResponse(
      {
        error:
          "Open this GYAN on its linked device to view saved progress.",
      },
      401,
    );
  }

  const student =
    await env.gyan_registry
      .prepare(
        activeGuest
          ? `
            SELECT
              id,
              student_code

            FROM education_students

            WHERE
              gyan_account_id = ?

            LIMIT 1
          `
          : `
            SELECT
              id,
              student_code

            FROM education_students

            WHERE
              student_code = ?
              AND email = ?

            LIMIT 1
          `,
      )
      .bind(
        ...(
          activeGuest
            ? [
                activeGuest.id,
              ]
            : [
                studentCode,
                user!.email,
              ]
        ),
      )
      .first<{
        id: number;
        student_code: string;
      }>();

  if (!student) {
    return jsonResponse(
      {
        error:
          "Student card not found for this GYAN.",
      },
      404,
    );
  }

  if (
    normalizeCode(
      student.student_code,
    ) !==
      studentCode
  ) {
    return jsonResponse(
      {
        error:
          "This education result does not belong to the active GYAN.",
      },
      403,
    );
  }

  const attempt =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            id,
            subject_code AS subjectCode,
            topic_code AS topicCode,
            question_count AS questionCount,
            correct_count AS correctCount,
            score_percent AS scorePercent,
            created_at AS createdAt

          FROM education_attempts

          WHERE
            id = ?
            AND student_id = ?

          LIMIT 1
        `,
      )
      .bind(
        attemptId,
        student.id,
      )
      .first<{
        id: number;
        subjectCode: string;
        topicCode: string;
        questionCount: number;
        correctCount: number;
        scorePercent: number;
        createdAt: string;
      }>();

  if (!attempt) {
    return jsonResponse(
      {
        error:
          "Education attempt not found.",
      },
      404,
    );
  }

  const answers =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            aa.question_id AS questionId,
            aa.selected_choice AS selectedChoice,
            aa.correct,

            q.question_text AS questionText,
            q.choice_a AS choiceA,
            q.choice_b AS choiceB,
            q.choice_c AS choiceC,
            q.choice_d AS choiceD,
            q.correct_choice AS correctChoice,
            q.explanation

          FROM education_attempt_answers aa

          INNER JOIN education_questions q
            ON q.id =
               aa.question_id

          WHERE
            aa.attempt_id = ?

          ORDER BY
            aa.id ASC
        `,
      )
      .bind(
        attemptId,
      )
      .all<{
        questionId: number;
        selectedChoice: string;
        correct: number;
        questionText: string;
        choiceA: string;
        choiceB: string;
        choiceC: string;
        choiceD: string;
        correctChoice: string;
        explanation: string | null;
      }>();

  return jsonResponse({
    attempt: {
      id:
        Number(
          attempt.id,
        ),

      subjectCode:
        attempt.subjectCode,

      topicCode:
        attempt.topicCode,

      questionCount:
        Number(
          attempt.questionCount,
        ),

      correctCount:
        Number(
          attempt.correctCount,
        ),

      scorePercent:
        Number(
          attempt.scorePercent,
        ),

      createdAt:
        attempt.createdAt,

      questions:
        answers.results.map(
          (
            answer,
          ) => ({
            questionId:
              Number(
                answer.questionId,
              ),

            text:
              answer.questionText,

            choices: {
              A:
                answer.choiceA,
              B:
                answer.choiceB,
              C:
                answer.choiceC,
              D:
                answer.choiceD,
            },

            selectedChoice:
              answer.selectedChoice,

            correctChoice:
              answer.correctChoice,

            correct:
              Boolean(
                answer.correct,
              ),

            explanation:
              answer.explanation,
          }),
        ),
    },
  });
}


type EducationTeacherRow = {
  id: number;
  teacher_name: string;
  email: string;
  subjects: string;
  location: string | null;
  bio: string | null;
  status: string;
};


function envResendApiKey(
  env: Env,
): string {
  return (
    env as Env & {
      RESEND_API_KEY?: string;
    }
  ).RESEND_API_KEY ?? "";
}


async function sendEducationAdminEmail(
  env: Env,
  subject: string,
  text: string,
): Promise<void> {
  const apiKey =
    envResendApiKey(
      env,
    );

  if (!apiKey) {
    throw new Error(
      "Email is not configured.",
    );
  }

  const response =
    await fetch(
      "https://api.resend.com/emails",
      {
        method:
          "POST",
        headers: {
          Authorization:
            `Bearer ${apiKey}`,
          "Content-Type":
            "application/json",
        },
        body:
          JSON.stringify({
            from:
              "GYAN Education <admin@gyan.cc>",
            to: [
              "admin@gyan.cc",
            ],
            subject,
            text,
          }),
      },
    );

  if (!response.ok) {
    const details =
      await response.text();

    console.error(
      "Education admin email failed:",
      response.status,
      details,
    );

    throw new Error(
      "Admin email could not be sent.",
    );
  }
}


async function educationAdminUser(
  request: Request,
  env: Env,
): Promise<
  {
    email: string;
  } |
  null
> {
  const user =
    await currentUser(
      request,
      env,
    );

  const email =
    normalizeEmail(
      (
        user as {
          email?: unknown;
        } |
        null
      )?.email,
    );

  if (
    email !==
      "admin@gyan.cc"
  ) {
    return null;
  }

  return {
    email,
  };
}


async function listEducationTeachers(
  request: Request,
  env: Env,
): Promise<Response> {
  const admin =
    await educationAdminUser(
      request,
      env,
    );

  const rows =
    await env.gyan_registry
      .prepare(
        admin
          ? `
            SELECT
              id,
              teacher_name,
              email,
              subjects,
              location,
              bio,
              status
            FROM education_teachers
            WHERE status <> 'INACTIVE'
            ORDER BY
              CASE status
                WHEN 'APPROVED' THEN 0
                ELSE 1
              END,
              teacher_name
            `
          : `
            SELECT
              id,
              teacher_name,
              email,
              subjects,
              location,
              bio,
              status
            FROM education_teachers
            WHERE status = 'APPROVED'
            ORDER BY teacher_name
            `,
      )
      .all<EducationTeacherRow>();

  return jsonResponse({
    teachers:
      rows.results.map(
        (
          row,
        ) => ({
          id:
            Number(
              row.id,
            ),
          name:
            row.teacher_name,
          email:
            row.email,
          subjects:
            row.subjects,
          location:
            row.location,
          bio:
            row.bio,
          status:
            row.status,
        }),
      ),
  });
}


async function registerEducationTeacher(
  request: Request,
  env: Env,
): Promise<Response> {
  let body:
    {
      name?: unknown;
      email?: unknown;
      subjects?: unknown;
      location?: unknown;
      bio?: unknown;
    };

  try {
    body =
      await request.json() as
        typeof body;
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid JSON body.",
      },
      400,
    );
  }

  const name =
    normalizeName(
      body.name,
    );

  const email =
    normalizeEmail(
      body.email,
    );

  const subjects =
    normalizeName(
      body.subjects,
    );

  const location =
    normalizeName(
      body.location,
    );

  const bio =
    normalizeName(
      body.bio,
    );

  if (
    name.length < 2
  ) {
    return jsonResponse(
      {
        error:
          "Enter your name.",
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
          "Enter a valid email.",
      },
      400,
    );
  }

  if (
    !subjects
  ) {
    return jsonResponse(
      {
        error:
          "Enter at least one subject.",
      },
      400,
    );
  }

  const guest =
    await currentEducationGuest(
      request,
      env,
    );

  await env.gyan_registry
    .prepare(
      `
        INSERT INTO education_teachers (
          gyan_account_id,
          teacher_name,
          email,
          subjects,
          location,
          bio,
          status,
          updated_at
        )
        VALUES (?, ?, ?, ?, ?, ?, 'PENDING', CURRENT_TIMESTAMP)

        ON CONFLICT(email)
        DO UPDATE SET
          gyan_account_id =
            COALESCE(
              excluded.gyan_account_id,
              education_teachers.gyan_account_id
            ),
          teacher_name =
            excluded.teacher_name,
          subjects =
            excluded.subjects,
          location =
            excluded.location,
          bio =
            excluded.bio,
          updated_at =
            CURRENT_TIMESTAMP
      `,
    )
    .bind(
      guest?.id ??
        null,
      name,
      email,
      subjects,
      location ||
        null,
      bio ||
        null,
    )
    .run();

  try {
    await sendEducationAdminEmail(
      env,
      `Teacher registration · ${name}`,
      [
        "A teacher registration was submitted.",
        "",
        `Name: ${name}`,
        `Email: ${email}`,
        `Subjects: ${subjects}`,
        `Location: ${location || "—"}`,
        `GYAN: ${guest?.slug ?? "—"}`,
        "",
        "Status: PENDING",
      ].join(
        "\n",
      ),
    );
  } catch (
    error
  ) {
    console.error(
      "Teacher registration email:",
      error,
    );
  }

  return jsonResponse({
    saved:
      true,
    status:
      "PENDING",
  });
}


async function teacherAssignmentForStudent(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
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
    await resolveActiveEducationStudent(
      request,
      env,
      studentCode,
    );

  if (!student) {
    return jsonResponse(
      {
        error:
          "This GYAN is not active in this browser.",
      },
      403,
    );
  }

  const assignment =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            a.id,
            a.status,
            a.requested_at,
            a.assigned_at,
            t.id AS teacher_id,
            t.teacher_name,
            t.email,
            t.subjects,
            t.location
          FROM education_teacher_assignments a
          LEFT JOIN education_teachers t
            ON t.id = a.teacher_id
          WHERE
            a.student_id = ?
            AND a.status IN ('REQUESTED','ASSIGNED')
          ORDER BY
            CASE a.status
              WHEN 'ASSIGNED' THEN 0
              ELSE 1
            END,
            a.updated_at DESC
          LIMIT 1
        `,
      )
      .bind(
        student.id,
      )
      .first<{
        id: number;
        status: string;
        requested_at: string;
        assigned_at: string | null;
        teacher_id: number | null;
        teacher_name: string | null;
        email: string | null;
        subjects: string | null;
        location: string | null;
      }>();

  return jsonResponse({
    assignment:
      assignment
        ? {
            id:
              Number(
                assignment.id,
              ),
            status:
              assignment.status,
            requestedAt:
              assignment.requested_at,
            assignedAt:
              assignment.assigned_at,
            teacher:
              assignment.teacher_id
                ? {
                    id:
                      Number(
                        assignment.teacher_id,
                      ),
                    name:
                      assignment.teacher_name ??
                      "",
                    email:
                      assignment.email ??
                      "",
                    subjects:
                      assignment.subjects ??
                      "",
                    location:
                      assignment.location,
                  }
                : null,
          }
        : null,
  });
}


async function requestTeacherAssignment(
  request: Request,
  env: Env,
): Promise<Response> {
  let body:
    {
      studentCode?: unknown;
      email?: unknown;
      phone?: unknown;
      subjects?: unknown;
    };

  try {
    body =
      await request.json() as
        typeof body;
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid JSON body.",
      },
      400,
    );
  }

  const studentCode =
    normalizeCode(
      body.studentCode,
    );

  const requestEmail = normalizeEmail(body.email);
  const requestPhone = typeof body.phone === "string" ? body.phone.trim().slice(0, 40) : "";
  const requestSubjects = normalizeName(body.subjects).slice(0, 300);

  if (!validEmail(requestEmail)) {
    return jsonResponse({ error: "Enter a valid email address." }, 400);
  }

  const student =
    await resolveActiveEducationStudent(
      request,
      env,
      studentCode,
    );

  if (!student) {
    return jsonResponse(
      {
        error:
          "This GYAN is not active in this browser.",
      },
      403,
    );
  }

  const studentRow =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            es.student_name,
            ga.code AS gyan_code,
            ga.display_name
          FROM education_students es
          INNER JOIN gyan_accounts ga
            ON ga.id =
               es.gyan_account_id
          WHERE es.id = ?
          LIMIT 1
        `,
      )
      .bind(
        student.id,
      )
      .first<{
        student_name: string;
        gyan_code: string;
        display_name: string;
      }>();

  const existing =
    await env.gyan_registry
      .prepare(
        `
          SELECT id
          FROM education_teacher_assignments
          WHERE
            student_id = ?
            AND status IN ('REQUESTED','ASSIGNED')
          ORDER BY updated_at DESC
          LIMIT 1
        `,
      )
      .bind(
        student.id,
      )
      .first<{
        id: number;
      }>();

  if (!existing) {
    await env.gyan_registry
      .prepare(
        `
          INSERT INTO education_teacher_assignments (
            student_id, status, request_email, request_phone, request_subjects
          )
          VALUES (?, 'REQUESTED', ?, ?, ?)
        `,
      )
      .bind(
        student.id,
        requestEmail,
        requestPhone ||
          null,
        requestSubjects ||
          null,
      )
      .run();
  } else {
    await env.gyan_registry.prepare(`
      UPDATE education_teacher_assignments
      SET request_email = ?, request_phone = ?, request_subjects = ?, updated_at = CURRENT_TIMESTAMP
      WHERE id = ?
    `).bind(requestEmail, requestPhone || null, requestSubjects || null, existing.id).run();
  }

  try {
    await sendEducationAdminEmail(
      env,
      `Assign Teacher request · ${studentRow?.gyan_code ?? studentCode}`,
      [
        "A GYAN learner requested a teacher.",
        "",
        `GYAN: ${studentRow?.gyan_code ?? studentCode}`,
        `Display name: ${studentRow?.display_name ?? "—"}`,
        `Education name: ${studentRow?.student_name ?? "—"}`,
        `Email: ${requestEmail}`,
        `Phone: ${requestPhone || "—"}`,
        `Subjects: ${requestSubjects || "—"}`,
        "",
        "Open GYAN Education as admin and use Teachers → Pending Requests.",
      ].join(
        "\n",
      ),
    );
  } catch (
    error
  ) {
    return jsonResponse(
      {
        error:
          error instanceof
            Error
            ? error.message
            : "Teacher request could not be emailed.",
      },
      500,
    );
  }

  return jsonResponse({
    requested:
      true,
  });
}


async function listTeacherAssignmentRequests(
  request: Request,
  env: Env,
): Promise<Response> {
  const admin =
    await educationAdminUser(
      request,
      env,
    );

  if (!admin) {
    return jsonResponse(
      {
        error:
          "Admin authentication required.",
      },
      403,
    );
  }

  const rows =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            a.id,
            a.requested_at,
            a.request_email,
            a.request_phone,
            a.request_subjects,
            es.student_name,
            ga.code AS gyan_code,
            ga.display_name
          FROM education_teacher_assignments a
          INNER JOIN education_students es
            ON es.id = a.student_id
          INNER JOIN gyan_accounts ga
            ON ga.id =
               es.gyan_account_id
          WHERE a.status = 'REQUESTED'
          ORDER BY a.requested_at ASC
        `,
      )
      .all<{
        id: number;
        requested_at: string;
        request_email: string | null;
        request_phone: string | null;
        request_subjects: string | null;
        student_name: string;
        gyan_code: string;
        display_name: string;
      }>();

  return jsonResponse({
    requests:
      rows.results.map(
        (
          row,
        ) => ({
          id:
            Number(
              row.id,
            ),
          studentCode:
            row.gyan_code,
          studentName:
            row.student_name,
          displayName:
            row.display_name,
          requestedAt:
            row.requested_at,
          email: row.request_email ?? "",
          phone: row.request_phone ?? "",
          subjects: row.request_subjects ?? "",
        }),
      ),
  });
}


async function approveEducationTeacher(
  request: Request,
  env: Env,
): Promise<Response> {
  const admin =
    await educationAdminUser(
      request,
      env,
    );

  if (!admin) {
    return jsonResponse(
      {
        error:
          "Admin authentication required.",
      },
      403,
    );
  }

  let body:
    {
      teacherId?: unknown;
    };

  try {
    body =
      await request.json() as
        typeof body;
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid JSON body.",
      },
      400,
    );
  }

  const teacherId =
    Number(
      body.teacherId,
    );

  if (
    !Number.isInteger(
      teacherId,
    )
  ) {
    return jsonResponse(
      {
        error:
          "Valid teacher is required.",
      },
      400,
    );
  }

  const teacher =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            id,
            teacher_name,
            email
          FROM education_teachers
          WHERE
            id = ?
            AND status = 'PENDING'
          LIMIT 1
        `,
      )
      .bind(
        teacherId,
      )
      .first<{
        id: number;
        teacher_name: string;
        email: string;
      }>();

  if (!teacher) {
    return jsonResponse(
      {
        error:
          "Pending teacher not found.",
      },
      404,
    );
  }

  await env.gyan_registry
    .prepare(
      `
        UPDATE education_teachers
        SET
          status = 'APPROVED',
          updated_at =
            CURRENT_TIMESTAMP
        WHERE id = ?
      `,
    )
    .bind(
      teacherId,
    )
    .run();

  return jsonResponse({
    approved:
      true,
    teacher: {
      id:
        Number(
          teacher.id,
        ),
      name:
        teacher.teacher_name,
      email:
        teacher.email,
    },
  });
}


async function assignEducationTeacher(
  request: Request,
  env: Env,
): Promise<Response> {
  const admin =
    await educationAdminUser(
      request,
      env,
    );

  if (!admin) {
    return jsonResponse(
      {
        error:
          "Admin authentication required.",
      },
      403,
    );
  }

  let body:
    {
      requestId?: unknown;
      teacherId?: unknown;
    };

  try {
    body =
      await request.json() as
        typeof body;
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid JSON body.",
      },
      400,
    );
  }

  const requestId =
    Number(
      body.requestId,
    );

  const teacherId =
    Number(
      body.teacherId,
    );

  if (
    !Number.isInteger(
      requestId,
    ) ||
    !Number.isInteger(
      teacherId,
    )
  ) {
    return jsonResponse(
      {
        error:
          "Valid request and teacher are required.",
      },
      400,
    );
  }

  const teacher =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            id,
            teacher_name,
            email
          FROM education_teachers
          WHERE
            id = ?
            AND status = 'APPROVED'
          LIMIT 1
        `,
      )
      .bind(
        teacherId,
      )
      .first<{
        id: number;
        teacher_name: string;
        email: string;
      }>();

  if (!teacher) {
    return jsonResponse(
      {
        error:
          "Approved teacher not found.",
      },
      404,
    );
  }

  const assignment =
    await env.gyan_registry
      .prepare(
        `
          SELECT id
          FROM education_teacher_assignments
          WHERE
            id = ?
            AND status = 'REQUESTED'
          LIMIT 1
        `,
      )
      .bind(
        requestId,
      )
      .first<{
        id: number;
      }>();

  if (!assignment) {
    return jsonResponse(
      {
        error:
          "Pending request not found.",
      },
      404,
    );
  }

  await env.gyan_registry
    .prepare(
      `
        UPDATE education_teacher_assignments
        SET
          teacher_id = ?,
          status = 'ASSIGNED',
          assigned_at = CURRENT_TIMESTAMP,
          assigned_by_email = ?,
          updated_at = CURRENT_TIMESTAMP
        WHERE id = ?
      `,
    )
    .bind(
      teacherId,
      admin.email,
      requestId,
    )
    .run();

  return jsonResponse({
    assigned:
      true,
    teacher: {
      id:
        Number(
          teacher.id,
        ),
      name:
        teacher.teacher_name,
      email:
        teacher.email,
    },
  });
}


export async function handleEducationProgressRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    request.method === "GET" &&
    url.pathname === "/api/education/teachers"
  ) {
    return listEducationTeachers(
      request,
      env,
    );
  }

  if (
    request.method === "POST" &&
    url.pathname === "/api/education/teachers/register"
  ) {
    return registerEducationTeacher(
      request,
      env,
    );
  }

  if (
    request.method === "GET" &&
    url.pathname === "/api/education/teacher-assignment"
  ) {
    return teacherAssignmentForStudent(
      request,
      env,
      url,
    );
  }

  if (
    request.method === "POST" &&
    url.pathname === "/api/education/teacher-assignment/request"
  ) {
    return requestTeacherAssignment(
      request,
      env,
    );
  }

  if (
    request.method === "GET" &&
    url.pathname === "/api/education/teacher-assignment/requests"
  ) {
    return listTeacherAssignmentRequests(
      request,
      env,
    );
  }

  if (
    request.method === "POST" &&
    url.pathname === "/api/education/teachers/approve"
  ) {
    return approveEducationTeacher(
      request,
      env,
    );
  }

  if (
    request.method === "POST" &&
    url.pathname === "/api/education/teacher-assignment/assign"
  ) {
    return assignEducationTeacher(
      request,
      env,
    );
  }
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
      "/api/education/protection-status"
  ) {
    return getProtectionStatus(
      request,
      env,
      url,
    );
  }

  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/education/protection-milestone"
  ) {
    return markProtectionMilestone(
      request,
      env,
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
      "/api/education/attempt-detail"
  ) {
    return getAttemptDetail(
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
