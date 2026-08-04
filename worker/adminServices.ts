import {
  getAdminSession,
} from "./adminAuth";

interface GlobalServiceRow {
  id: number;
  service_code: string;
  service_type: "system" | "custom";
  category: string;
  sub_category: string | null;
  name: string;
  description: string | null;
  icon: string | null;
  color: string | null;
  workflow_type: string;
  enabled: number;
  sort_order: number;
  created_at: string;
  updated_at: string;
}

interface UpdateGlobalServiceItem {
  code?: unknown;
  enabled?: unknown;
  sortOrder?: unknown;
}

interface UpdateGlobalServicesRequest {
  services?: unknown;
}

function createJsonResponse(
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
        "cache-control": "no-store",
      },
    },
  );
}

function normalizeServiceCode(
  value: unknown,
): string | null {
  if (typeof value !== "string") {
    return null;
  }

  const normalized = value
    .trim()
    .toUpperCase();

  if (
    !/^[A-Z0-9_]{2,50}$/.test(normalized)
  ) {
    return null;
  }

  return normalized;
}

function normalizeEnabled(
  value: unknown,
): boolean | null {
  if (typeof value !== "boolean") {
    return null;
  }

  return value;
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

function mapGlobalService(
  row: GlobalServiceRow,
) {
  return {
    id: row.id,
    code: row.service_code,
    type: row.service_type,

    category: row.category,
    subCategory: row.sub_category,

    name: row.name,
    description:
      row.description ?? "",

    icon:
      row.icon ?? "🧩",

    color:
      row.color ?? "#607d8b",

    workflowType:
      row.workflow_type,

    enabled:
      row.enabled === 1,

    sortOrder:
      row.sort_order,

    createdAt:
      row.created_at,

    updatedAt:
      row.updated_at,
  };
}

async function loadGlobalServices(
  env: Env,
): Promise<ReturnType<
  typeof mapGlobalService
>[]> {
  const result = await env.gyan_registry
    .prepare(
      `
        SELECT
          id,
          service_code,
          service_type,
          category,
          sub_category,
          name,
          description,
          icon,
          color,
          workflow_type,
          enabled,
          sort_order,
          created_at,
          updated_at
        FROM services
        WHERE service_type = 'system'
        ORDER BY
          category ASC,
          sort_order ASC,
          name ASC
      `,
    )
    .all<GlobalServiceRow>();

  return result.results.map(
    mapGlobalService,
  );
}

async function requireAdmin(
  request: Request,
  env: Env,
): Promise<Response | null> {
  const session = await getAdminSession(
    request,
    env,
  );

  if (!session) {
    return createJsonResponse(
      {
        error:
          "Administrator authentication is required.",
      },
      401,
    );
  }

  return null;
}

async function handleGetGlobalServices(
  request: Request,
  env: Env,
): Promise<Response> {
  const unauthorizedResponse =
    await requireAdmin(request, env);

  if (unauthorizedResponse) {
    return unauthorizedResponse;
  }

  const services =
    await loadGlobalServices(env);

  return createJsonResponse({
    services,
  });
}

async function handleUpdateGlobalServices(
  request: Request,
  env: Env,
): Promise<Response> {
  const unauthorizedResponse =
    await requireAdmin(request, env);

  if (unauthorizedResponse) {
    return unauthorizedResponse;
  }

  let body: UpdateGlobalServicesRequest;

  try {
    body =
      (await request.json()) as
        UpdateGlobalServicesRequest;
  } catch {
    return createJsonResponse(
      {
        error:
          "Request body must be valid JSON.",
      },
      400,
    );
  }

  if (!Array.isArray(body.services)) {
    return createJsonResponse(
      {
        error:
          "A services array is required.",
      },
      400,
    );
  }

  if (body.services.length === 0) {
    return createJsonResponse(
      {
        error:
          "At least one service change is required.",
      },
      400,
    );
  }

  if (body.services.length > 200) {
    return createJsonResponse(
      {
        error:
          "Too many service changes were submitted.",
      },
      400,
    );
  }

  const normalizedChanges: {
    code: string;
    enabled: boolean;
    sortOrder: number;
  }[] = [];

  const submittedCodes = new Set<string>();

  for (const item of body.services) {
    if (
      typeof item !== "object" ||
      item === null
    ) {
      return createJsonResponse(
        {
          error:
            "Each service change must be an object.",
        },
        400,
      );
    }

    const typedItem =
      item as UpdateGlobalServiceItem;

    const code = normalizeServiceCode(
      typedItem.code,
    );

    const enabled = normalizeEnabled(
      typedItem.enabled,
    );

    const sortOrder = normalizeSortOrder(
      typedItem.sortOrder,
    );

    if (
      !code ||
      enabled === null ||
      sortOrder === null
    ) {
      return createJsonResponse(
        {
          error:
            "Each service requires a valid code, enabled value and order from 0 to 9999.",
        },
        400,
      );
    }

    if (submittedCodes.has(code)) {
      return createJsonResponse(
        {
          error:
            `Service ${code} was submitted more than once.`,
        },
        400,
      );
    }

    submittedCodes.add(code);

    normalizedChanges.push({
      code,
      enabled,
      sortOrder,
    });
  }

  const placeholders =
    normalizedChanges
      .map(() => "?")
      .join(", ");

  const existingResult =
    await env.gyan_registry
      .prepare(
        `
          SELECT service_code
          FROM services
          WHERE
            service_type = 'system'
            AND service_code IN (
              ${placeholders}
            )
        `,
      )
      .bind(
        ...normalizedChanges.map(
          (change) => change.code,
        ),
      )
      .all<{
        service_code: string;
      }>();

  const existingCodes = new Set(
    existingResult.results.map(
      (row) => row.service_code,
    ),
  );

  const missingCodes =
    normalizedChanges
      .map((change) => change.code)
      .filter(
        (code) =>
          !existingCodes.has(code),
      );

  if (missingCodes.length > 0) {
    return createJsonResponse(
      {
        error:
          `Unknown global service: ${missingCodes.join(
            ", ",
          )}`,
      },
      400,
    );
  }

  const statements =
    normalizedChanges.map(
      (change) =>
        env.gyan_registry
          .prepare(
            `
              UPDATE services
              SET
                enabled = ?,
                sort_order = ?,
                updated_at =
                  CURRENT_TIMESTAMP
              WHERE
                service_code = ?
                AND service_type = 'system'
            `,
          )
          .bind(
            change.enabled ? 1 : 0,
            change.sortOrder,
            change.code,
          ),
    );

  await env.gyan_registry.batch(
    statements,
  );

  const services =
    await loadGlobalServices(env);

  return createJsonResponse({
    message: "Changes saved.",
    services,
  });
}

export async function handleAdminServicesRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    url.pathname !==
      "/api/admin/services"
  ) {
    return null;
  }

  if (request.method === "GET") {
    return handleGetGlobalServices(
      request,
      env,
    );
  }

  if (request.method === "PUT") {
    return handleUpdateGlobalServices(
      request,
      env,
    );
  }

  return createJsonResponse(
    {
      error:
        "Method not allowed.",
    },
    405,
  );
}