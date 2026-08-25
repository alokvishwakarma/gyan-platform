import {
  getAdminSession,
} from "./adminAuth";



function json(
  body: unknown,
  status = 200,
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


function normalizeText(
  value: unknown,
): string {
  return typeof value ===
    "string"
    ? value.trim()
    : "";
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


function classifyStudent(
  status: string,
): "registered" |
   "trial" |
   "issued" |
   "inactive" {
  if (
    status ===
      "CLAIMED"
  ) {
    return "registered";
  }

  if (
    status ===
      "GUEST_ACTIVE"
  ) {
    return "trial";
  }

  if (
    status ===
      "GENERATED" ||
    status ===
      "PRINTED"
  ) {
    return "issued";
  }

  return "inactive";
}


async function requireAdmin(
  request: Request,
  env: Env,
): Promise<Response | null> {
  const session =
    await getAdminSession(
      request,
      env,
    );

  if (
    session
  ) {
    return null;
  }

  return json(
    {
      error:
        "Administrator authentication is required.",
    },
    401,
  );
}


async function loadOne(
  env: Env,
  code: string,
) {
  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          c.slug AS code,
          c.gyan_name AS displayName,
          COALESCE(
            c.email,
            ''
          ) AS email,
          c.status,
          c.guest_started_at AS guestStartedAt,
          c.guest_expires_at AS guestExpiresAt,
          c.claimed_at AS claimedAt,
          c.expires_at AS expiresAt,

          COALESCE(
            (
              SELECT
                COUNT(*)
              FROM education_attempts a
              INNER JOIN education_students s
                ON s.id =
                   a.student_id
              WHERE
                s.student_code =
                  c.slug
            ),
            0
          ) AS attemptCount,

          (
            SELECT
              MAX(
                a.created_at
              )
            FROM education_attempts a
            INNER JOIN education_students s
              ON s.id =
                 a.student_id
            WHERE
              s.student_code =
                c.slug
          ) AS lastAttemptAt

        FROM calendar_access_codes c

        WHERE
          c.slug = ?

        LIMIT 1
        `,
      )
      .bind(
        code,
      )
      .first<{
        code: string;
        displayName: string;
        email: string;
        status: string;
        guestStartedAt: string | null;
        guestExpiresAt: string | null;
        claimedAt: string | null;
        expiresAt: string | null;
        attemptCount: number;
        lastAttemptAt: string | null;
      }>();

  if (!row) {
    return null;
  }

  return {
    ...row,

    attemptCount:
      Number(
        row.attemptCount ??
        0,
      ),

    kind:
      classifyStudent(
        row.status,
      ),
  };
}


export async function handleAdminStudentsRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    !url.pathname.startsWith(
      "/api/admin/students",
    )
  ) {
    return null;
  }

  const authError =
    await requireAdmin(
      request,
      env,
    );

  if (
    authError
  ) {
    return authError;
  }

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/admin/students"
  ) {
    const query =
      normalizeText(
        url.searchParams.get(
          "q",
        ),
      )
        .toLowerCase();

    const filter =
      normalizeText(
        url.searchParams.get(
          "filter",
        ),
      )
        .toLowerCase();

    const validFilter =
      filter === "registered" ||
      filter === "trial" ||
      filter === "issued" ||
      filter === "inactive"
        ? filter
        : "all";

    const likeQuery =
      query
        ? `%${query}%`
        : "%";

    const filterStatus =
      validFilter === "registered"
        ? "CLAIMED"
        : validFilter === "trial"
          ? "GUEST_ACTIVE"
          : validFilter === "issued"
            ? "ISSUED"
            : validFilter === "inactive"
              ? "EXPIRED"
              : "";

    const summaryRows =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            SUM(
              CASE
                WHEN status = 'CLAIMED'
                  THEN 1
                ELSE 0
              END
            ) AS registered,

            SUM(
              CASE
                WHEN status = 'GUEST_ACTIVE'
                  THEN 1
                ELSE 0
              END
            ) AS trial,

            SUM(
              CASE
                WHEN status IN (
                  'GENERATED',
                  'PRINTED'
                )
                  THEN 1
                ELSE 0
              END
            ) AS issued,

            SUM(
              CASE
                WHEN status = 'EXPIRED'
                  THEN 1
                ELSE 0
              END
            ) AS inactive

          FROM calendar_access_codes

          WHERE status IN (
            'GENERATED',
            'PRINTED',
            'GUEST_ACTIVE',
            'CLAIMED',
            'EXPIRED'
          )
          `,
        )
        .first<{
          registered: number | null;
          trial: number | null;
          issued: number | null;
          inactive: number | null;
        }>();

    const rows =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            c.slug AS code,
            c.gyan_name AS displayName,
            COALESCE(
              c.email,
              ''
            ) AS email,
            c.status,
            c.guest_started_at AS guestStartedAt,
            c.guest_expires_at AS guestExpiresAt,
            c.claimed_at AS claimedAt,
            c.expires_at AS expiresAt,

            COALESCE(
              (
                SELECT COUNT(*)
                FROM education_attempts a
                INNER JOIN education_students s
                  ON s.id = a.student_id
                WHERE s.student_code = c.slug
              ),
              0
            ) AS attemptCount,

            (
              SELECT MAX(a.created_at)
              FROM education_attempts a
              INNER JOIN education_students s
                ON s.id = a.student_id
              WHERE s.student_code = c.slug
            ) AS lastAttemptAt

          FROM calendar_access_codes c

          WHERE
            c.status IN (
              'GENERATED',
              'PRINTED',
              'GUEST_ACTIVE',
              'CLAIMED',
              'EXPIRED'
            )

            AND (
              ? = '' OR
              (
                ? = 'ISSUED' AND
                c.status IN (
                  'GENERATED',
                  'PRINTED'
                )
              ) OR
              c.status = ?
            )

            AND (
              LOWER(c.slug) LIKE ? OR
              LOWER(c.gyan_name) LIKE ? OR
              LOWER(COALESCE(c.email, '')) LIKE ?
            )

          ORDER BY
            COALESCE(
              lastAttemptAt,
              c.claimed_at,
              c.guest_started_at,
              c.generated_at
            ) DESC

          LIMIT 300
          `,
        )
        .bind(
          filterStatus,
          filterStatus,
          filterStatus,
          likeQuery,
          likeQuery,
          likeQuery,
        )
        .all<{
          code: string;
          displayName: string;
          email: string;
          status: string;
          guestStartedAt: string | null;
          guestExpiresAt: string | null;
          claimedAt: string | null;
          expiresAt: string | null;
          attemptCount: number;
          lastAttemptAt: string | null;
        }>();

    const students =
      rows.results.map(
        (row) => ({
          ...row,

          attemptCount:
            Number(
              row.attemptCount ??
              0,
            ),

          kind:
            classifyStudent(
              row.status,
            ),
        }),
      );

    return json({
      students,

      summary: {
        registered:
          Number(
            summaryRows?.registered ??
            0,
          ),

        trial:
          Number(
            summaryRows?.trial ??
            0,
          ),

        issued:
          Number(
            summaryRows?.issued ??
            0,
          ),

        inactive:
          Number(
            summaryRows?.inactive ??
            0,
          ),
      },
    });
  }

  const match =
    url.pathname.match(
      /^\/api\/admin\/students\/([A-Za-z0-9]{4,5})$/,
    );

  if (
    request.method ===
      "PATCH" &&
    match
  ) {
    const code =
      normalizeCode(
        match[1],
      );

    const body =
      await request.json() as {
        displayName?: unknown;
        email?: unknown;
      };

    const displayName =
      normalizeText(
        body.displayName,
      );

    const email =
      normalizeEmail(
        body.email,
      );

    if (
      !displayName ||
      displayName.length >
        80
    ) {
      return json(
        {
          error:
            "Display name is required and must be 80 characters or less.",
        },
        400,
      );
    }

    if (
      email &&
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        email,
      )
    ) {
      return json(
        {
          error:
            "Enter a valid email address.",
        },
        400,
      );
    }

    const existing =
      await loadOne(
        env,
        code,
      );

    if (
      !existing
    ) {
      return json(
        {
          error:
            "Student not found.",
        },
        404,
      );
    }

    const educationStudent =
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

    const statements = [
      env.gyan_registry
        .prepare(
          `
          UPDATE calendar_access_codes

          SET
            gyan_name = ?,
            email = ?

          WHERE slug = ?
          `,
        )
        .bind(
          displayName,
          email ||
            null,
          code,
        ),
    ];

    if (
      educationStudent
    ) {
      statements.push(
        env.gyan_registry
          .prepare(
            `
            UPDATE education_students

            SET
              student_name = ?,
              email = ?,
              updated_at =
                CURRENT_TIMESTAMP

            WHERE id = ?
            `,
          )
          .bind(
            displayName,
            email ||
              `guest-${existing.code.toLowerCase()}@guest.gyan.invalid`,
            educationStudent.id,
          ),
      );
    }

    await env.gyan_registry.batch(
      statements,
    );

    return json({
      student:
        await loadOne(
          env,
          code,
        ),
    });
  }

  return json(
    {
      error:
        "Admin students route not found.",
    },
    404,
  );
}