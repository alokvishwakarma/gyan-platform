export interface SafetyResourcesEnv {
  gyan_registry:
    D1Database;
}


type SafetyResourceType =
  | "CERTIFICATE"
  | "LOST_FOUND"
  | "EMERGENCY"
  | "HELP";


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


export async function handleSafetyResourceRoute({
  request,
  env,
  pathname,
}: {
  request: Request;
  env: SafetyResourcesEnv;
  pathname: string;
}): Promise<Response | null> {
  const match =
    pathname.match(
      /^\/api\/safety-resources\/([a-z0-9]{10,12})$/i,
    );

  if (
    !match
  ) {
    return null;
  }

  if (
    request.method !==
      "GET"
  ) {
    return json(
      {
        error:
          "Method not allowed.",
      },
      405,
    );
  }

  const token =
    match[1]
      .toLowerCase();

  const row =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            r.resource_type,
            r.status,
            c.gyan_name
          FROM gyan_safety_resources r
          INNER JOIN calendar_access_codes c
            ON c.id = r.calendar_access_id
          WHERE
            r.public_token = ?
          LIMIT 1
        `,
      )
      .bind(
        token,
      )
      .first<{
        resource_type:
          SafetyResourceType;
        status:
          string;
        gyan_name:
          string;
      }>();

  if (
    !row ||
    row.status !==
      "ACTIVE"
  ) {
    return json(
      {
        error:
          "This GYAN card is not active.",
      },
      404,
    );
  }

  /*
   * Privacy boundary:
   * Do NOT return calendar_access_id, parent slug, email,
   * access code, or any other account credential here.
   */
  return json({
    token,
    type:
      row.resource_type,
    displayName:
      row.gyan_name,
  });
}
