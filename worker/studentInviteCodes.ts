type StudentPrintFormat =
  | "A5"
  | "A6"
  | "A7"
  | "A8"
  | "CREDIT_CARD"
  | "BUSINESS_CARD";

type StudentPrintOrientation =
  | "portrait"
  | "landscape";

interface CreateStudentInviteRequest {
  countryCode?: unknown;
  printFormat?: unknown;
  orientation?: unknown;
  rangeStart?: unknown;
  rangeEnd?: unknown;
}

interface StudentInviteRow {
  code: string;
  country_code: string;
  print_format: StudentPrintFormat;
  orientation: StudentPrintOrientation;
  range_start: string;
  range_end: string;
  scan_count: number;
  registration_count: number;
  created_at: string;
}

const CODE_ALPHABET =
  "23456789ABCDEFGHJKMNPQRSTUVWXYZ";

const CODE_LENGTH =
  4;

function jsonResponse(
  data: unknown,
  status = 200,
): Response {
  return new Response(
    JSON.stringify(
      data,
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

function normalizeCountryCode(
  value: unknown,
): string | null {
  if (
    typeof value !==
    "string"
  ) {
    return null;
  }

  const normalized =
    value
      .trim()
      .toUpperCase();

  return /^[A-Z]{2}$/.test(
    normalized,
  )
    ? normalized
    : null;
}

function normalizePrintFormat(
  value: unknown,
): StudentPrintFormat | null {
  if (
    typeof value !==
    "string"
  ) {
    return null;
  }

  const normalized =
    value
      .trim()
      .toUpperCase();

  const allowed:
    StudentPrintFormat[] =
      [
        "A5",
        "A6",
        "A7",
        "A8",
        "CREDIT_CARD",
        "BUSINESS_CARD",
      ];

  return allowed.includes(
    normalized as
      StudentPrintFormat,
  )
    ? (
        normalized as
          StudentPrintFormat
      )
    : null;
}

function normalizeOrientation(
  value: unknown,
): StudentPrintOrientation | null {
  if (
    value ===
      "portrait" ||
    value ===
      "landscape"
  ) {
    return value;
  }

  return null;
}

function normalizeMonthKey(
  value: unknown,
): string | null {
  if (
    typeof value !==
    "string"
  ) {
    return null;
  }

  const normalized =
    value.trim();

  return /^\d{4}-(0[1-9]|1[0-2])$/.test(
    normalized,
  )
    ? normalized
    : null;
}

function randomCode():
  string {
  const bytes =
    new Uint8Array(
      CODE_LENGTH,
    );

  crypto.getRandomValues(
    bytes,
  );

  let code =
    "";

  for (
    const byte of bytes
  ) {
    code +=
      CODE_ALPHABET[
        byte %
          CODE_ALPHABET.length
      ];
  }

  return code;
}

async function createCode(
  request: Request,
  env: {
    gyan_registry:
      D1Database;
  },
): Promise<Response> {
  let body:
    CreateStudentInviteRequest;

  try {
    body =
      (await request.json()) as
        CreateStudentInviteRequest;
  } catch {
    return jsonResponse(
      {
        error:
          "Request body must be valid JSON.",
      },
      400,
    );
  }

  const countryCode =
    normalizeCountryCode(
      body.countryCode,
    );

  const printFormat =
    normalizePrintFormat(
      body.printFormat,
    );

  const orientation =
    normalizeOrientation(
      body.orientation,
    );

  const rangeStart =
    normalizeMonthKey(
      body.rangeStart,
    );

  const rangeEnd =
    normalizeMonthKey(
      body.rangeEnd,
    );

  if (
    !countryCode ||
    !printFormat ||
    !orientation ||
    !rangeStart ||
    !rangeEnd
  ) {
    return jsonResponse(
      {
        error:
          "Country, format, orientation and calendar range are required.",
      },
      400,
    );
  }

  /*
   * The PRIMARY KEY on code is the final
   * collision guard. A collision simply
   * causes another random code attempt.
   */
  for (
    let attempt = 0;
    attempt < 20;
    attempt += 1
  ) {
    const code =
      randomCode();

    const result =
      await env
        .gyan_registry
        .prepare(
          `
            INSERT OR IGNORE INTO student_invite_codes (
              code,
              country_code,
              print_format,
              orientation,
              range_start,
              range_end
            )
            VALUES (?, ?, ?, ?, ?, ?)
          `,
        )
        .bind(
          code,
          countryCode,
          printFormat,
          orientation,
          rangeStart,
          rangeEnd,
        )
        .run();

    if (
      Number(
        result.meta
          .changes ??
          0,
      ) === 1
    ) {
      return jsonResponse(
        {
          code,

          countryCode,

          printFormat,

          orientation,

          rangeStart,

          rangeEnd,
        },
        201,
      );
    }
  }

  return jsonResponse(
    {
      error:
        "Unable to allocate a unique student code. Please try again.",
    },
    503,
  );
}

async function lookupCode(
  env: {
    gyan_registry:
      D1Database;
  },
  code: string,
): Promise<Response> {
  const normalized =
    code
      .trim()
      .toUpperCase();

  if (
    !/^[23456789ABCDEFGHJKMNPQRSTUVWXYZ]{4}$/.test(
      normalized,
    )
  ) {
    return jsonResponse(
      {
        error:
          "Invalid GYAN student code.",
      },
      400,
    );
  }

  const row =
    await env
      .gyan_registry
      .prepare(
        `
          SELECT
            code,
            country_code,
            print_format,
            orientation,
            range_start,
            range_end,
            scan_count,
            registration_count,
            created_at
          FROM student_invite_codes
          WHERE code = ?
          LIMIT 1
        `,
      )
      .bind(
        normalized,
      )
      .first<StudentInviteRow>();

  if (
    !row
  ) {
    return jsonResponse(
      {
        error:
          "GYAN student code not found.",
      },
      404,
    );
  }

  return jsonResponse({
    code:
      row.code,

    countryCode:
      row.country_code,

    printFormat:
      row.print_format,

    orientation:
      row.orientation,

    rangeStart:
      row.range_start,

    rangeEnd:
      row.range_end,

    scanCount:
      row.scan_count,

    registrationCount:
      row.registration_count,

    createdAt:
      row.created_at,
  });
}

async function recordScan(
  env: {
    gyan_registry:
      D1Database;
  },
  code: string,
): Promise<Response> {
  const normalized =
    code
      .trim()
      .toUpperCase();

  if (
    !/^[23456789ABCDEFGHJKMNPQRSTUVWXYZ]{4}$/.test(
      normalized,
    )
  ) {
    return jsonResponse(
      {
        error:
          "Invalid GYAN student code.",
      },
      400,
    );
  }

  const result =
    await env
      .gyan_registry
      .prepare(
        `
          UPDATE student_invite_codes
          SET
            scan_count =
              scan_count + 1,

            first_scanned_at =
              COALESCE(
                first_scanned_at,
                CURRENT_TIMESTAMP
              ),

            last_scanned_at =
              CURRENT_TIMESTAMP
          WHERE
            code = ?
            AND status = 'active'
        `,
      )
      .bind(
        normalized,
      )
      .run();

  if (
    Number(
      result.meta
        .changes ??
        0,
    ) !== 1
  ) {
    return jsonResponse(
      {
        error:
          "GYAN student code not found.",
      },
      404,
    );
  }

  return jsonResponse({
    ok:
      true,

    code:
      normalized,
  });
}

export async function handleStudentInviteCodeRoute(
  request: Request,
  env: {
    gyan_registry:
      D1Database;
  },
  url: URL,
): Promise<Response | null> {
  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/student-invite-codes"
  ) {
    return createCode(
      request,
      env,
    );
  }

  const lookupMatch =
    url.pathname.match(
      /^\/api\/student-invite-codes\/([A-Za-z0-9]{4})$/,
    );

  if (
    request.method ===
      "GET" &&
    lookupMatch
  ) {
    return lookupCode(
      env,
      lookupMatch[1],
    );
  }

  const scanMatch =
    url.pathname.match(
      /^\/api\/student-invite-codes\/([A-Za-z0-9]{4})\/scan$/,
    );

  if (
    request.method ===
      "POST" &&
    scanMatch
  ) {
    return recordScan(
      env,
      scanMatch[1],
    );
  }

  return null;
}
