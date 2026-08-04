import {
  getAdminSession,
} from "./adminAuth";

interface ShopRow {
  code: string;
  name: string;
  address_line: string;
  city: string;
}

interface ShopServiceRow {
  id: number;
  service_code: string;
  category: string;
  sub_category: string | null;
  name: string;
  description: string | null;
  icon: string | null;
  color: string | null;

  global_enabled: number | boolean;
  global_sort_order: number;

  override_enabled:
    | number
    | boolean
    | null;

  override_sort_order:
    | number
    | null;
}

interface ShopServiceChange {
  code?: unknown;
  mode?: unknown;
  sortOrder?: unknown;
}

interface UpdateShopServicesRequest {
  services?: unknown;
}

type ShopServiceMode =
  | "inherit"
  | "enabled"
  | "disabled";

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

        "cache-control":
          "no-store",
      },
    },
  );
}

function normalizeShopCode(
  value: string,
): string | null {
  const normalized =
    value.trim().toUpperCase();

  return /^[A-Z0-9]{4}$/.test(
    normalized,
  )
    ? normalized
    : null;
}

function normalizeServiceCode(
  value: unknown,
): string | null {
  if (typeof value !== "string") {
    return null;
  }

  const normalized =
    value.trim().toUpperCase();

  return /^[A-Z0-9_]{2,50}$/.test(
    normalized,
  )
    ? normalized
    : null;
}

function normalizeMode(
  value: unknown,
): ShopServiceMode | null {
  if (
    value === "inherit" ||
    value === "enabled" ||
    value === "disabled"
  ) {
    return value;
  }

  return null;
}

function normalizeSortOrder(
  value: unknown,
): number | null | "invalid" {
  if (
    value === null ||
    value === undefined ||
    value === ""
  ) {
    return null;
  }

  if (
    typeof value !== "number" ||
    !Number.isInteger(value) ||
    value < 0 ||
    value > 9999
  ) {
    return "invalid";
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

  return createJsonResponse(
    {
      error:
        "Administrator authentication is required.",
    },
    401,
  );
}

async function loadShop(
  env: Env,
  shopCode: string,
): Promise<ShopRow | null> {
  return env.gyan_registry
    .prepare(
      `
        SELECT
          code,
          name,
          address_line,
          city
        FROM shops
        WHERE code = ?
        LIMIT 1
      `,
    )
    .bind(shopCode)
    .first<ShopRow>();
}

async function loadShopServices(
  env: Env,
  shopCode: string,
) {
  const result =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            s.id,
            s.service_code,
            s.category,
            s.sub_category,
            s.name,
            s.description,
            s.icon,
            s.color,

            CAST(
              s.enabled AS INTEGER
            ) AS global_enabled,

            s.sort_order
              AS global_sort_order,

            ss.enabled
              AS override_enabled,

            ss.sort_order
              AS override_sort_order

          FROM services s

          LEFT JOIN shop_services ss
            ON ss.service_id = s.id
            AND ss.shop_code = ?

          WHERE
            s.service_type = 'system'

          ORDER BY
            s.category ASC,
            COALESCE(
              ss.sort_order,
              s.sort_order
            ) ASC,
            s.name ASC
        `,
      )
      .bind(shopCode)
      .all<ShopServiceRow>();

  return result.results.map(
    (row) => {
      const hasOverride =
        row.override_enabled !== null;

      const overrideEnabled =
        hasOverride
          ? Boolean(
              row.override_enabled,
            )
          : null;

      const mode: ShopServiceMode =
        overrideEnabled === null
          ? "inherit"
          : overrideEnabled
            ? "enabled"
            : "disabled";

      return {
        id: row.id,
        code: row.service_code,
        category: row.category,
        subCategory:
          row.sub_category,

        name: row.name,

        description:
          row.description ?? "",

        icon:
          row.icon ?? "🧩",

        color:
          row.color ?? "#607d8b",

        globalEnabled:
          Boolean(
            row.global_enabled,
          ),

        globalSortOrder:
          row.global_sort_order,

        mode,

        overrideEnabled,

        overrideSortOrder:
          row.override_sort_order,

        effectiveEnabled:
          overrideEnabled ??
          Boolean(
            row.global_enabled,
          ),

        effectiveSortOrder:
          row.override_sort_order ??
          row.global_sort_order,
      };
    },
  );
}

async function handleGetShops(
  request: Request,
  env: Env,
): Promise<Response> {
  const unauthorized =
    await requireAdmin(
      request,
      env,
    );

  if (unauthorized) {
    return unauthorized;
  }

  const result =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            code,
            name,
            address_line,
            city
          FROM shops
          ORDER BY
            name ASC,
            code ASC
        `,
      )
      .all<ShopRow>();

  return createJsonResponse({
    shops:
      result.results.map(
        (shop) => ({
          code: shop.code,
          name: shop.name,

          addressLine:
            shop.address_line,

          city: shop.city,
        }),
      ),
  });
}

async function handleGetShopServices(
  request: Request,
  env: Env,
  shopCode: string,
): Promise<Response> {
  const unauthorized =
    await requireAdmin(
      request,
      env,
    );

  if (unauthorized) {
    return unauthorized;
  }

  const shop =
    await loadShop(
      env,
      shopCode,
    );

  if (!shop) {
    return createJsonResponse(
      {
        error: "Shop not found.",
      },
      404,
    );
  }

  const services =
    await loadShopServices(
      env,
      shopCode,
    );

  return createJsonResponse({
    shop: {
      code: shop.code,
      name: shop.name,

      addressLine:
        shop.address_line,

      city: shop.city,
    },

    services,
  });
}

async function handleUpdateShopServices(
  request: Request,
  env: Env,
  shopCode: string,
): Promise<Response> {
  const unauthorized =
    await requireAdmin(
      request,
      env,
    );

  if (unauthorized) {
    return unauthorized;
  }

  const shop =
    await loadShop(
      env,
      shopCode,
    );

  if (!shop) {
    return createJsonResponse(
      {
        error: "Shop not found.",
      },
      404,
    );
  }

  let body:
    UpdateShopServicesRequest;

  try {
    body =
      (await request.json()) as
        UpdateShopServicesRequest;
  } catch {
    return createJsonResponse(
      {
        error:
          "Request body must be valid JSON.",
      },
      400,
    );
  }

  if (
    !Array.isArray(
      body.services,
    ) ||
    body.services.length === 0
  ) {
    return createJsonResponse(
      {
        error:
          "At least one service change is required.",
      },
      400,
    );
  }

  const normalizedChanges: {
    code: string;
    mode: ShopServiceMode;
    sortOrder: number | null;
  }[] = [];

  const codes =
    new Set<string>();

  for (
    const rawChange
    of body.services
  ) {
    if (
      typeof rawChange !==
        "object" ||
      rawChange === null
    ) {
      return createJsonResponse(
        {
          error:
            "Each service change must be an object.",
        },
        400,
      );
    }

    const change =
      rawChange as ShopServiceChange;

    const code =
      normalizeServiceCode(
        change.code,
      );

    const mode =
      normalizeMode(
        change.mode,
      );

    const sortOrder =
      normalizeSortOrder(
        change.sortOrder,
      );

    if (
      !code ||
      !mode ||
      sortOrder === "invalid"
    ) {
      return createJsonResponse(
        {
          error:
            "Each service requires a valid code, mode and optional order from 0 to 9999.",
        },
        400,
      );
    }

    if (codes.has(code)) {
      return createJsonResponse(
        {
          error:
            `${code} was submitted more than once.`,
        },
        400,
      );
    }

    codes.add(code);

    normalizedChanges.push({
      code,
      mode,
      sortOrder:
        mode === "inherit"
          ? null
          : sortOrder,
    });
  }

  const serviceRows =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            id,
            service_code,
            sort_order
          FROM services
          WHERE service_type = 'system'
        `,
      )
      .all<{
        id: number;
        service_code: string;
        sort_order: number;
      }>();

  const serviceMap =
    new Map(
      serviceRows.results.map(
        (service) => [
          service.service_code,
          service,
        ],
      ),
    );

  const statements:
    D1PreparedStatement[] = [];

  for (
    const change
    of normalizedChanges
  ) {
    const service =
      serviceMap.get(
        change.code,
      );

    if (!service) {
      return createJsonResponse(
        {
          error:
            `Unknown service: ${change.code}`,
        },
        400,
      );
    }

    if (
      change.mode ===
      "inherit"
    ) {
      statements.push(
        env.gyan_registry
          .prepare(
            `
              DELETE FROM shop_services
              WHERE
                shop_code = ?
                AND service_id = ?
            `,
          )
          .bind(
            shopCode,
            service.id,
          ),
      );

      continue;
    }

    const enabled =
      change.mode === "enabled"
        ? 1
        : 0;

    const sortOrder =
      change.sortOrder ??
      service.sort_order;

    statements.push(
      env.gyan_registry
        .prepare(
          `
            INSERT INTO shop_services (
              shop_code,
              service_id,
              enabled,
              sort_order,
              updated_at
            )
            VALUES (
              ?,
              ?,
              ?,
              ?,
              CURRENT_TIMESTAMP
            )

            ON CONFLICT(
              shop_code,
              service_id
            )
            DO UPDATE SET
              enabled =
                excluded.enabled,

              sort_order =
                excluded.sort_order,

              updated_at =
                CURRENT_TIMESTAMP
          `,
        )
        .bind(
          shopCode,
          service.id,
          enabled,
          sortOrder,
        ),
    );
  }

  await env.gyan_registry.batch(
    statements,
  );

  return createJsonResponse({
    message: "Changes saved.",

    shop: {
      code: shop.code,
      name: shop.name,

      addressLine:
        shop.address_line,

      city: shop.city,
    },

    services:
      await loadShopServices(
        env,
        shopCode,
      ),
  });
}

export async function handleAdminShopsRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    request.method === "GET" &&
    url.pathname ===
      "/api/admin/shops"
  ) {
    return handleGetShops(
      request,
      env,
    );
  }

  const match =
    url.pathname.match(
      /^\/api\/admin\/shops\/([A-Za-z0-9]{4})\/services$/,
    );

  if (!match) {
    return null;
  }

  const shopCode =
    normalizeShopCode(
      match[1],
    );

  if (!shopCode) {
    return createJsonResponse(
      {
        error:
          "Invalid shop code.",
      },
      400,
    );
  }

  if (request.method === "GET") {
    return handleGetShopServices(
      request,
      env,
      shopCode,
    );
  }

  if (request.method === "PUT") {
    return handleUpdateShopServices(
      request,
      env,
      shopCode,
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