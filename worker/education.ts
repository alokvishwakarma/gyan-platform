import {
  getAdminSession,
} from "./adminAuth";

type EducationCountry =
  | "US"
  | "IN";

interface EducationProgramRow {
  program_code: string;
  program_name: string;
  enabled: number | boolean;
  is_custom: number | boolean;
  sort_order: number;
}

interface EducationSettingsRow {
  country_code: string;
  prek12_enabled: number | boolean;
}

interface EducationProgramInput {
  code?: unknown;
  name?: unknown;
  enabled?: unknown;
  custom?: unknown;
  sortOrder?: unknown;
}

interface UpdateEducationBody {
  preK12Enabled?: unknown;
  programs?: unknown;
}

function jsonResponse(
  data: unknown,
  status = 200,
): Response {
  return new Response(
    JSON.stringify(data),
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

function normalizeCountry(
  value: string | null,
): EducationCountry | null {
  const country =
    value
      ?.trim()
      .toUpperCase();

  return (
    country === "US" ||
    country === "IN"
  )
    ? country
    : null;
}

function normalizeProgramCode(
  value: unknown,
): string | null {
  if (
    typeof value !== "string"
  ) {
    return null;
  }

  const normalized =
    value
      .trim()
      .toUpperCase();

  return /^[A-Z0-9_]{2,50}$/.test(
    normalized,
  )
    ? normalized
    : null;
}

function normalizeProgramName(
  value: unknown,
): string | null {
  if (
    typeof value !== "string"
  ) {
    return null;
  }

  const normalized =
    value.trim();

  if (
    normalized.length < 1 ||
    normalized.length > 80
  ) {
    return null;
  }

  return normalized;
}

function normalizeSortOrder(
  value: unknown,
): number | null {
  if (
    typeof value !== "number" ||
    !Number.isInteger(value) ||
    value < 0 ||
    value > 9999
  ) {
    return null;
  }

  return value;
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

  if (session) {
    return null;
  }

  return jsonResponse(
    {
      error:
        "Administrator authentication is required.",
    },
    401,
  );
}

async function loadEducationConfig(
  env: Env,
  country: EducationCountry,
) {
  const [
    settings,
    programs,
  ] =
    await Promise.all([
      env.gyan_registry
        .prepare(
          `
          SELECT
            country_code,
            prek12_enabled
          FROM education_country_settings
          WHERE country_code = ?
          LIMIT 1
          `,
        )
        .bind(country)
        .first<EducationSettingsRow>(),

      env.gyan_registry
        .prepare(
          `
          SELECT
            program_code,
            program_name,
            enabled,
            is_custom,
            sort_order
          FROM education_programs
          WHERE country_code = ?
          ORDER BY
            sort_order ASC,
            program_name ASC
          `,
        )
        .bind(country)
        .all<EducationProgramRow>(),
    ]);

  return {
    country,

    preK12Enabled:
      settings
        ? Boolean(
            settings.prek12_enabled,
          )
        : true,

    programs:
      programs.results.map(
        (row) => ({
          code:
            row.program_code,

          name:
            row.program_name,

          enabled:
            Boolean(
              row.enabled,
            ),

          custom:
            Boolean(
              row.is_custom,
            ),

          sortOrder:
            Number(
              row.sort_order,
            ),
        }),
      ),
  };
}

async function handleUpdateEducation(
  request: Request,
  env: Env,
  country: EducationCountry,
): Promise<Response> {
  const unauthorized =
    await requireAdmin(
      request,
      env,
    );

  if (unauthorized) {
    return unauthorized;
  }

  let body:
    UpdateEducationBody;

  try {
    body =
      await request.json() as
        UpdateEducationBody;
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid JSON body.",
      },
      400,
    );
  }

  if (
    typeof body.preK12Enabled !==
      "boolean" ||
    !Array.isArray(
      body.programs,
    )
  ) {
    return jsonResponse(
      {
        error:
          "preK12Enabled and programs are required.",
      },
      400,
    );
  }

  if (
    body.programs.length > 50
  ) {
    return jsonResponse(
      {
        error:
          "Too many education programs.",
      },
      400,
    );
  }

  const normalizedPrograms:
    Array<{
      code: string;
      name: string;
      enabled: boolean;
      custom: boolean;
      sortOrder: number;
    }> = [];

  const seenCodes =
    new Set<string>();

  for (
    const raw
    of body.programs as
      EducationProgramInput[]
  ) {
    const code =
      normalizeProgramCode(
        raw.code,
      );

    const name =
      normalizeProgramName(
        raw.name,
      );

    const sortOrder =
      normalizeSortOrder(
        raw.sortOrder,
      );

    if (
      !code ||
      !name ||
      sortOrder === null ||
      typeof raw.enabled !==
        "boolean" ||
      typeof raw.custom !==
        "boolean"
    ) {
      return jsonResponse(
        {
          error:
            "One or more education programs are invalid.",
        },
        400,
      );
    }

    if (
      seenCodes.has(code)
    ) {
      return jsonResponse(
        {
          error:
            `Duplicate program code: ${code}`,
        },
        400,
      );
    }

    seenCodes.add(code);

    normalizedPrograms.push({
      code,
      name,
      enabled:
        raw.enabled,

      custom:
        raw.custom,

      sortOrder,
    });
  }

  const statements = [
    env.gyan_registry
      .prepare(
        `
        INSERT INTO education_country_settings (
          country_code,
          prek12_enabled,
          updated_at
        )
        VALUES (?, ?, CURRENT_TIMESTAMP)

        ON CONFLICT(country_code)
        DO UPDATE SET
          prek12_enabled =
            excluded.prek12_enabled,
          updated_at =
            CURRENT_TIMESTAMP
        `,
      )
      .bind(
        country,
        body.preK12Enabled
          ? 1
          : 0,
      ),

    env.gyan_registry
      .prepare(
        `
        DELETE FROM education_programs
        WHERE country_code = ?
        `,
      )
      .bind(
        country,
      ),

    ...normalizedPrograms.map(
      (program) =>
        env.gyan_registry
          .prepare(
            `
            INSERT INTO education_programs (
              country_code,
              program_code,
              program_name,
              enabled,
              is_custom,
              sort_order,
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
            country,
            program.code,
            program.name,
            program.enabled
              ? 1
              : 0,
            program.custom
              ? 1
              : 0,
            program.sortOrder,
          ),
    ),
  ];

  await env.gyan_registry
    .batch(
      statements,
    );

  return jsonResponse({
    config:
      await loadEducationConfig(
        env,
        country,
      ),

    message:
      "Education configuration saved.",
  });
}

export async function handleEducationRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  const publicMatch =
    url.pathname ===
      "/api/education/config";

  const adminMatch =
    url.pathname ===
      "/api/admin/education/config";

  if (
    !publicMatch &&
    !adminMatch
  ) {
    return null;
  }

  const country =
    normalizeCountry(
      url.searchParams.get(
        "country",
      ),
    );

  if (!country) {
    return jsonResponse(
      {
        error:
          "country must be US or IN.",
      },
      400,
    );
  }

  if (
    publicMatch &&
    request.method ===
      "GET"
  ) {
    const config =
      await loadEducationConfig(
        env,
        country,
      );

    return jsonResponse({
      config: {
        ...config,

        // Public callers need only enabled
        // programs. Disabled Admin choices
        // stay private.
        programs:
          config.programs.filter(
            (program) =>
              program.enabled,
          ),
      },
    });
  }

  if (
    adminMatch &&
    request.method ===
      "GET"
  ) {
    const unauthorized =
      await requireAdmin(
        request,
        env,
      );

    if (unauthorized) {
      return unauthorized;
    }

    return jsonResponse({
      config:
        await loadEducationConfig(
          env,
          country,
        ),
    });
  }

  if (
    adminMatch &&
    request.method ===
      "PUT"
  ) {
    return handleUpdateEducation(
      request,
      env,
      country,
    );
  }

  return jsonResponse(
    {
      error:
        "Method not allowed.",
    },
    405,
  );
}
