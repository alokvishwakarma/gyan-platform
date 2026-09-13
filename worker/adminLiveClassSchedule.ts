import {
  getAdminSession,
} from "./adminAuth";


function json(
  body:
    unknown,

  status =
    200,
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


async function requireAdmin(
  request:
    Request,

  env:
    Env,
): Promise<Response | null> {
  const session =
    await getAdminSession(
      request,
      env,
    );

  return session
    ? null
    : json(
        {
          error:
            "Administrator authentication is required.",
        },
        401,
      );
}




async function listClassSchedule(
  env:
    Env,

  url:
    URL,
): Promise<Response> {
  const country =
    (
      url.searchParams
        .get(
          "country",
        ) ??
      "IN"
    )
      .trim()
      .toUpperCase();

  const programs =
    country ===
      "US"
      ? [
          "SAT",
        ]
      : [
          "JEE",
          "NEET",
        ];

  const rows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          schedule_date,
          program_code,
          subject_code,
          topic_code,
          topic_name,
          class_start_local,
          class_end_local,
          schedule_timezone,
          sequence_number

        FROM education_live_class_schedule

        WHERE
          active = 1
          AND program_code IN (?, ?)

        ORDER BY
          schedule_date,
          program_code,
          sequence_number,
          subject_code

        LIMIT 800
        `,
      )
      .bind(
        programs[0],
        programs[1] ??
          "__NONE__",
      )
      .all<{
        schedule_date:
          string;

        program_code:
          string;

        subject_code:
          string;

        topic_code:
          string | null;

        topic_name:
          string;

        class_start_local:
          string;

        class_end_local:
          string;

        schedule_timezone:
          string;

        sequence_number:
          number;
      }>();

  return json({
    classSchedule:
      rows.results.map(
        (
          row,
        ) => {
          return {
            scheduleDate:
              row.schedule_date,

            program:
              row.program_code,

            subject:
              row.subject_code,

            topicCode:
              row.topic_code,

            topicName:
              row.topic_name,

            startLocal:
              row.class_start_local,

            endLocal:
              row.class_end_local,

            scheduleTimezone:
              row.schedule_timezone,

            sequenceNumber:
              Number(
                row.sequence_number,
              ),
          };
        },
      ),
  });
}


async function copyNextBatch(
  request:
    Request,

  env:
    Env,
): Promise<Response> {
  let body:
    {
      action?:
        unknown;

      startYear?:
        unknown;

      startMonth?:
        unknown;
    };

  try {
    body =
      await request.json();
  } catch {
    return json(
      {
        error:
          "Invalid JSON body.",
      },
      400,
    );
  }

  if (
    body.action !==
      "COPY_NEXT"
  ) {
    return json(
      {
        error:
          "Unsupported batch action.",
      },
      400,
    );
  }

  const startYear =
    Number(
      body.startYear,
    );

  const startMonth =
    Number(
      body.startMonth,
    );

  if (
    !Number.isInteger(
      startYear,
    ) ||
    !Number.isInteger(
      startMonth,
    ) ||
    startMonth <
      1 ||
    startMonth >
      12
  ) {
    return json(
      {
        error:
          "A valid batch start year and month are required.",
      },
      400,
    );
  }

  const start =
    `${String(
      startYear,
    ).padStart(
      4,
      "0",
    )}-${String(
      startMonth,
    ).padStart(
      2,
      "0",
    )}-01`;

  const sourceEndDate =
    new Date(
      Date.UTC(
        startYear,
        startMonth - 1 + 2,
        1,
      ),
    );

  const sourceEnd =
    `${sourceEndDate.getUTCFullYear()}-${String(
      sourceEndDate.getUTCMonth() +
        1,
    ).padStart(
      2,
      "0",
    )}-01`;

  const sourceRows =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          schedule_date,
          program_code,
          subject_code,
          topic_code,
          topic_name,
          class_start_local,
          class_end_local,
          schedule_timezone,
          sequence_number,
          active

        FROM education_live_class_schedule

        WHERE
          schedule_date >= ?
          AND schedule_date < ?
          AND active = 1

        ORDER BY
          schedule_date,
          program_code,
          sequence_number
        `,
      )
      .bind(
        start,
        sourceEnd,
      )
      .all<{
        schedule_date:
          string;

        program_code:
          string;

        subject_code:
          string;

        topic_code:
          string | null;

        topic_name:
          string;

        class_start_local:
          string;

        class_end_local:
          string;

        schedule_timezone:
          string;

        sequence_number:
          number;

        active:
          number;
      }>();

  let copied =
    0;

  for (
    const row
    of sourceRows.results
  ) {
    await env.gyan_registry
      .prepare(
        `
        INSERT INTO education_live_class_schedule (
          schedule_date,
          program_code,
          subject_code,
          topic_code,
          topic_name,
          class_start_local,
          class_end_local,
          schedule_timezone,
          sequence_number,
          active
        )
        VALUES (
          date(?, '+2 months'),
          ?, ?, ?, ?, ?, ?, ?, ?, ?
        )

        ON CONFLICT(
          schedule_date,
          program_code,
          subject_code,
          sequence_number
        )
        DO UPDATE SET
          topic_code =
            excluded.topic_code,
          topic_name =
            excluded.topic_name,
          class_start_local =
            excluded.class_start_local,
          class_end_local =
            excluded.class_end_local,
          schedule_timezone =
            excluded.schedule_timezone,
          active =
            excluded.active,
          updated_at =
            CURRENT_TIMESTAMP
        `,
      )
      .bind(
        row.schedule_date,
        row.program_code,
        row.subject_code,
        row.topic_code,
        row.topic_name,
        row.class_start_local,
        row.class_end_local,
        row.schedule_timezone,
        Number(
          row.sequence_number,
        ),
        Number(
          row.active,
        ),
      )
      .run();

    copied +=
      1;
  }

  return json({
    copied,
  });
}


function normalizedEmail(
  value: unknown,
): string | null {
  const email =
    typeof value === "string"
      ? value.trim().toLowerCase()
      : "";

  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    .test(email)
    ? email
    : null;
}


function escapeHtml(
  value: string,
): string {
  return value
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}


async function sendClassInterestEmail(
  env: Env,
  to: string,
  subject: string,
  html: string,
  text: string,
): Promise<boolean> {
  if (!env.RESEND_API_KEY) {
    return false;
  }

  try {
    const response =
      await fetch(
        "https://api.resend.com/emails",
        {
          method: "POST",
          headers: {
            authorization:
              `Bearer ${env.RESEND_API_KEY}`,
            "content-type":
              "application/json",
          },
          body: JSON.stringify({
            from:
              "GYAN Education <admin@gyan.cc>",
            to: [to],
            subject,
            html,
            text,
          }),
        },
      );

    if (!response.ok) {
      console.error(
        "Class-interest email failed:",
        await response.text(),
      );
      return false;
    }

    return true;
  } catch (error) {
    console.error(
      "Class-interest email failed:",
      error,
    );
    return false;
  }
}


async function createClassInterest(
  request: Request,
  env: Env,
): Promise<Response> {
  let body: {
    email?: unknown;
    program?: unknown;
    scheduleDate?: unknown;
    subject?: unknown;
  };

  try {
    body = await request.json();
  } catch {
    return json(
      { error: "Invalid request." },
      400,
    );
  }

  const email =
    normalizedEmail(body.email);

  const program =
    typeof body.program === "string"
      ? body.program.trim().toUpperCase()
      : "";

  const scheduleDate =
    typeof body.scheduleDate === "string"
      ? body.scheduleDate.trim()
      : "";

  const subject =
    typeof body.subject === "string"
      ? body.subject.trim().toUpperCase()
      : "";

  if (!email) {
    return json(
      {
        error:
          "Please enter a valid email address.",
      },
      400,
    );
  }

  if (
    !["JEE", "NEET", "SAT"].includes(program) ||
    !/^\d{4}-\d{2}-\d{2}$/.test(scheduleDate) ||
    !subject
  ) {
    return json(
      {
        error:
          "Class details are incomplete.",
      },
      400,
    );
  }

  const classRow =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          topic_code,
          topic_name,
          class_start_local,
          class_end_local,
          schedule_timezone
        FROM education_live_class_schedule
        WHERE
          active = 1
          AND schedule_date = ?
          AND program_code = ?
          AND subject_code = ?
        ORDER BY sequence_number, id
        LIMIT 1
        `,
      )
      .bind(
        scheduleDate,
        program,
        subject,
      )
      .first<{
        topic_code: string | null;
        topic_name: string;
        class_start_local: string;
        class_end_local: string;
        schedule_timezone: string;
      }>();

  if (!classRow) {
    return json(
      {
        error:
          "This class is no longer available.",
      },
      404,
    );
  }

  const existing =
    await env.gyan_registry
      .prepare(
        `
        SELECT id
        FROM education_class_interests
        WHERE
          email = ?
          AND program_code = ?
          AND schedule_date = ?
          AND subject_code = ?
        LIMIT 1
        `,
      )
      .bind(
        email,
        program,
        scheduleDate,
        subject,
      )
      .first<{ id: number }>();

  // eslint-disable-next-line no-useless-assignment
  let interestId = 0;

  if (existing) {
    interestId =
      Number(existing.id);

    await env.gyan_registry
      .prepare(
        `
        UPDATE education_class_interests
        SET
          topic_code = ?,
          topic_name = ?,
          class_start_local = ?,
          class_end_local = ?,
          schedule_timezone = ?,
          updated_at = CURRENT_TIMESTAMP
        WHERE id = ?
        `,
      )
      .bind(
        classRow.topic_code,
        classRow.topic_name,
        classRow.class_start_local,
        classRow.class_end_local,
        classRow.schedule_timezone,
        interestId,
      )
      .run();
  } else {
    const result =
      await env.gyan_registry
        .prepare(
          `
          INSERT INTO education_class_interests (
            email,
            program_code,
            schedule_date,
            subject_code,
            topic_code,
            topic_name,
            class_start_local,
            class_end_local,
            schedule_timezone,
            status
          )
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'NEW')
          `,
        )
        .bind(
          email,
          program,
          scheduleDate,
          subject,
          classRow.topic_code,
          classRow.topic_name,
          classRow.class_start_local,
          classRow.class_end_local,
          classRow.schedule_timezone,
        )
        .run();

    interestId =
      Number(
        result.meta.last_row_id ?? 0,
      );
  }

  const safeProgram =
    escapeHtml(program);
  const safeTopic =
    escapeHtml(classRow.topic_name);
  const safeDate =
    escapeHtml(scheduleDate);
  const safeTime =
    escapeHtml(
      `${classRow.class_start_local}–${classRow.class_end_local}`,
    );
  const safeZone =
    escapeHtml(classRow.schedule_timezone);

  const studentEmailSent =
    await sendClassInterestEmail(
      env,
      email,
      `GYAN ${program} class · ${classRow.topic_name}`,
      `
      <div style="font-family:Arial,sans-serif;line-height:1.55;color:#17345c">
        <h2 style="margin:0 0 12px">GYAN Class Details</h2>
        <p>Thanks for your interest in <strong>${safeProgram}</strong>.</p>
        <p>
          <strong>${safeTopic}</strong><br>
          ${safeDate}<br>
          ${safeTime} · ${safeZone}
        </p>
        <p>
          Your request has been received. GYAN will send any registration or joining details to this email.
        </p>
        <p style="color:#72839a;font-size:12px">
          GYAN.CC · Learn • Discover • Grow
        </p>
      </div>
      `,
      [
        "GYAN Class Details",
        `${program} · ${classRow.topic_name}`,
        scheduleDate,
        `${classRow.class_start_local}–${classRow.class_end_local} · ${classRow.schedule_timezone}`,
        "",
        "Your request has been received. GYAN will send registration or joining details to this email.",
      ].join("\n"),
    );

  void sendClassInterestEmail(
    env,
    "admin@gyan.cc",
    `New GYAN class interest · ${program} · ${classRow.topic_name}`,
    `
    <div style="font-family:Arial,sans-serif;line-height:1.55;color:#17345c">
      <h2 style="margin:0 0 12px">New Class Interest</h2>
      <p><strong>${escapeHtml(email)}</strong></p>
      <p>
        ${safeProgram} · ${safeTopic}<br>
        ${safeDate}<br>
        ${safeTime} · ${safeZone}
      </p>
      <p>Lead ID: ${interestId}</p>
    </div>
    `,
    [
      "New GYAN class interest",
      email,
      `${program} · ${classRow.topic_name}`,
      scheduleDate,
      `${classRow.class_start_local}–${classRow.class_end_local} · ${classRow.schedule_timezone}`,
      `Lead ID: ${interestId}`,
    ].join("\n"),
  );

  return json({
    ok: true,
    interestId,
    emailSent:
      studentEmailSent,
  });
}


async function publicClassSchedule(
  env:
    Env,

  url:
    URL,
): Promise<Response> {
  const requested =
    (
      url.searchParams
        .get(
          "program",
        ) ??
      "JEE"
    )
      .trim()
      .toUpperCase();

  const program =
    requested ===
      "SAT"
      ? "SAT"
      : requested ===
          "NEET"
        ? "NEET"
        : "JEE";

  const classes =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          schedule_date,
          program_code,
          subject_code,
          topic_code,
          topic_name,
          class_start_local,
          class_end_local,
          schedule_timezone,
          sequence_number

        FROM education_live_class_schedule

        WHERE
          active = 1
          AND program_code = ?

        ORDER BY
          schedule_date,
          sequence_number,
          subject_code

        LIMIT 500
        `,
      )
      .bind(
        program,
      )
      .all<{
        schedule_date:
          string;

        program_code:
          string;

        subject_code:
          string;

        topic_code:
          string | null;

        topic_name:
          string;

        class_start_local:
          string;

        class_end_local:
          string;

        schedule_timezone:
          string;

        sequence_number:
          number;
      }>();

  const tests =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          public_code,
          program_code,
          source_schedule_date,
          starts_at_utc,
          schedule_timezone,
          duration_minutes,
          status

        FROM education_live_tests

        WHERE
          program_code = ?
          AND source_schedule_date IS NOT NULL
          AND status != 'CANCELLED'

        /*
         * Do not filter on visible here.
         * Future batch-generated JEE/NEET/SAT tests belong on
         * the public class calendar before their Live-Test strip
         * visibility window opens.
         */

        ORDER BY
          source_schedule_date,
          public_code

        LIMIT 300
        `,
      )
      .bind(
        program,
      )
      .all<{
        public_code:
          string;

        program_code:
          string;

        source_schedule_date:
          string;

        starts_at_utc:
          string;

        schedule_timezone:
          string;

        duration_minutes:
          number;

        status:
          string;
      }>();

  return json({
    program,

    classes:
      classes.results.map(
        (
          row,
        ) => ({
          scheduleDate:
            row.schedule_date,

          subject:
            row.subject_code,

          topicCode:
            row.topic_code,

          topicName:
            row.topic_name,

          startLocal:
            row.class_start_local,

          endLocal:
            row.class_end_local,

          scheduleTimezone:
            row.schedule_timezone,

          sequenceNumber:
            Number(
              row.sequence_number,
            ),
        }),
      ),

    tests:
      tests.results.map(
        (
          row,
        ) => ({
          code:
            row.public_code,

          scheduleDate:
            row.source_schedule_date,

          startsAtUtc:
            row.starts_at_utc,

          scheduleTimezone:
            row.schedule_timezone,

          durationMinutes:
            Number(
              row.duration_minutes,
            ),

          status:
            row.status,
        }),
      ),
  });
}


async function patchClassSchedule(
  request:
    Request,

  env:
    Env,
): Promise<Response> {
  let body:
    {
      scheduleDate?:
        unknown;

      program?:
        unknown;

      subject?:
        unknown;

      startLocal?:
        unknown;

      endLocal?:
        unknown;
    };

  try {
    body =
      await request.json();
  } catch {
    return json(
      {
        error:
          "Invalid JSON body.",
      },
      400,
    );
  }

  const scheduleDate =
    typeof body.scheduleDate ===
      "string"
      ? body.scheduleDate.trim()
      : "";

  const program =
    typeof body.program ===
      "string"
      ? body.program
          .trim()
          .toUpperCase()
      : "";

  const subject =
    typeof body.subject ===
      "string"
      ? body.subject
          .trim()
          .toUpperCase()
      : "";

  const startLocal =
    typeof body.startLocal ===
      "string"
      ? body.startLocal.trim()
      : "";

  const endLocal =
    typeof body.endLocal ===
      "string"
      ? body.endLocal.trim()
      : "";

  if (
    !/^\\d{4}-\\d{2}-\\d{2}$/
      .test(
        scheduleDate,
      ) ||
    (
      program !==
        "JEE" &&
      program !==
        "NEET" &&
      program !==
        "SAT"
    ) ||
    !subject ||
    !/^\\d{2}:\\d{2}$/
      .test(
        startLocal,
      ) ||
    !/^\\d{2}:\\d{2}$/
      .test(
        endLocal,
      )
  ) {
    return json(
      {
        error:
          "Valid date, program, subject, start and end times are required.",
      },
      400,
    );
  }

  const result =
    await env.gyan_registry
      .prepare(
        `
        UPDATE education_live_class_schedule

        SET
          class_start_local = ?,
          class_end_local = ?,
          updated_at =
            CURRENT_TIMESTAMP

        WHERE
          schedule_date = ?
          AND program_code = ?
          AND subject_code = ?
        `,
      )
      .bind(
        startLocal,
        endLocal,
        scheduleDate,
        program,
        subject,
      )
      .run();

  if (
    Number(
      result.meta.changes ??
      0,
    ) <=
      0
  ) {
    return json(
      {
        error:
          "Class schedule row was not found.",
      },
      404,
    );
  }

  return json({
    saved:
      true,
    scheduleDate,
    program,
    subject,
    startLocal,
    endLocal,
  });
}




async function deleteClassSchedule(
  request:
    Request,

  env:
    Env,
): Promise<Response> {
  let body: {
    scheduleDate?:
      unknown;

    program?:
      unknown;

    subject?:
      unknown;

    sequenceNumber?:
      unknown;
  };

  try {
    body =
      await request.json() as typeof body;
  } catch {
    return json(
      {
        error:
          "Invalid JSON body.",
      },
      400,
    );
  }

  const scheduleDate =
    typeof body.scheduleDate ===
      "string"
      ? body.scheduleDate.trim()
      : "";

  const program =
    typeof body.program ===
      "string"
      ? body.program
          .trim()
          .toUpperCase()
      : "";

  const subject =
    typeof body.subject ===
      "string"
      ? body.subject
          .trim()
          .toUpperCase()
      : "";

  const sequenceNumber =
    Number(
      body.sequenceNumber,
    );

  if (
    !/^\d{4}-\d{2}-\d{2}$/
      .test(
        scheduleDate,
      ) ||
    ![
      "JEE",
      "NEET",
      "SAT",
    ].includes(
      program,
    ) ||
    !subject ||
    !Number.isInteger(
      sequenceNumber,
    ) ||
    sequenceNumber <
      1
  ) {
    return json(
      {
        error:
          "Valid date, program, subject and sequence number are required.",
      },
      400,
    );
  }

  const result =
    await env.gyan_registry
      .prepare(
        `
        DELETE FROM education_live_class_schedule
        WHERE
          schedule_date = ?
          AND program_code = ?
          AND subject_code = ?
          AND sequence_number = ?
        `,
      )
      .bind(
        scheduleDate,
        program,
        subject,
        sequenceNumber,
      )
      .run();

  if (
    Number(
      result.meta.changes ??
      0,
    ) <=
      0
  ) {
    return json(
      {
        error:
          "Class schedule row was not found.",
      },
      404,
    );
  }

  return json({
    deleted:
      true,

    scheduleDate,
    program,
    subject,
    sequenceNumber,
  });
}


async function createClassSchedule(
  request: Request,
  env: Env,
): Promise<Response> {
  let body: {
    scheduleDate?: unknown;
    program?: unknown;
    subject?: unknown;
    topicName?: unknown;
    startLocal?: unknown;
    endLocal?: unknown;
  };

  try {
    body = await request.json() as typeof body;
  } catch {
    return json({ error: "Invalid JSON body." }, 400);
  }

  const scheduleDate =
    typeof body.scheduleDate === "string" ? body.scheduleDate.trim() : "";
  const program =
    typeof body.program === "string" ? body.program.trim().toUpperCase() : "";
  const subject =
    typeof body.subject === "string" ? body.subject.trim().toUpperCase() : "";
  const topicName =
    typeof body.topicName === "string" ? body.topicName.trim() : "";
  const startLocal =
    typeof body.startLocal === "string" ? body.startLocal.trim() : "";
  const endLocal =
    typeof body.endLocal === "string" ? body.endLocal.trim() : "";

  if (!/^\d{4}-\d{2}-\d{2}$/.test(scheduleDate)) {
    return json({ error: "A valid schedule date is required." }, 400);
  }
  if (!["JEE", "NEET", "SAT"].includes(program)) {
    return json({ error: "Unsupported class program." }, 400);
  }
  if (!subject) {
    return json({ error: "Subject is required." }, 400);
  }
  if (!topicName) {
    return json({ error: "Topic name is required." }, 400);
  }
  if (!/^\d{2}:\d{2}$/.test(startLocal) || !/^\d{2}:\d{2}$/.test(endLocal)) {
    return json({ error: "Valid start and end times are required." }, 400);
  }

  const sequence =
    await env.gyan_registry
      .prepare(
        `
        SELECT COALESCE(MAX(sequence_number), 0) + 1 AS next_sequence
        FROM education_live_class_schedule
        WHERE schedule_date = ? AND program_code = ?
        `,
      )
      .bind(scheduleDate, program)
      .first<{ next_sequence: number }>();

  const scheduleTimezone =
    program === "SAT"
      ? "America/New_York"
      : "Asia/Kolkata";

  await env.gyan_registry
    .prepare(
      `
      INSERT INTO education_live_class_schedule (
        schedule_date,
        program_code,
        subject_code,
        topic_code,
        topic_name,
        class_start_local,
        class_end_local,
        schedule_timezone,
        sequence_number,
        active
      )
      VALUES (?, ?, ?, NULL, ?, ?, ?, ?, ?, 1)
      `,
    )
    .bind(
      scheduleDate,
      program,
      subject,
      topicName,
      startLocal,
      endLocal,
      scheduleTimezone,
      Number(sequence?.next_sequence ?? 1),
    )
    .run();

  return json({
    created: true,
    item: {
      scheduleDate,
      program,
      subject,
      topicCode: null,
      topicName,
      startLocal,
      endLocal,
      scheduleTimezone,
      sequenceNumber: Number(sequence?.next_sequence ?? 1),
    },
  }, 201);
}

export async function handleAdminLiveClassScheduleRoute(
  request:
    Request,

  env:
    Env,

  url:
    URL,
): Promise<Response | null> {
  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/live-class-schedule"
  ) {
    return publicClassSchedule(
      env,
      url,
    );
  }


  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/class-interest"
  ) {
    return createClassInterest(
      request,
      env,
    );
  }


  if (
    url.pathname !==
      "/api/admin/live-tests/class-schedule" &&
    url.pathname !==
      "/api/admin/live-tests/class-schedule/batch"
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
      "POST" &&
    url.pathname ===
      "/api/admin/live-tests/class-schedule"
  ) {
    return createClassSchedule(
      request,
      env,
    );
  }


  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/admin/live-tests/class-schedule"
  ) {
    return listClassSchedule(
      env,
      url,
    );
  }

  if (
    request.method ===
      "DELETE" &&
    url.pathname ===
      "/api/admin/live-tests/class-schedule"
  ) {
    return deleteClassSchedule(
      request,
      env,
    );
  }


  if (
    request.method ===
      "PATCH" &&
    url.pathname ===
      "/api/admin/live-tests/class-schedule"
  ) {
    return patchClassSchedule(
      request,
      env,
    );
  }


  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/admin/live-tests/class-schedule/batch"
  ) {
    return copyNextBatch(
      request,
      env,
    );
  }

  return json(
    {
      error:
        "Method or route not allowed.",
    },
    405,
  );
}
