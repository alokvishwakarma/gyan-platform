import {
  getAdminSession,
} from "./adminAuth";

interface ShopRow {
  code: string;
  name: string;
  owner_name: string;
  phone_number: string;
  whatsapp_number: string | null;
  email_address: string | null;
  address_line: string;
  city: string;
  state: string;
  postal_code: string;
  status: string;
  created_at: string;
  updated_at: string;
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

  global_enabled:
    | number
    | boolean;

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

interface UpdateShopInformationRequest {
  name?: unknown;
  ownerName?: unknown;
  phoneNumber?: unknown;
  whatsAppNumber?: unknown;
  emailAddress?: unknown;
  addressLine?: unknown;
  city?: unknown;
  state?: unknown;
  postalCode?: unknown;
  status?: unknown;
}

type ShopServiceMode =
  | "inherit"
  | "enabled"
  | "disabled";

type ShopStatus =
  | "active"
  | "inactive";

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
    value
      .trim()
      .toUpperCase();

  return /^[A-Z0-9]{4}$/.test(
    normalized,
  )
    ? normalized
    : null;
}

function normalizeRequiredText(
  value: unknown,
  maximumLength: number,
): string | null {
  if (
    typeof value !== "string"
  ) {
    return null;
  }

  const normalized =
    value.trim();

  if (
    normalized.length === 0 ||
    normalized.length >
      maximumLength
  ) {
    return null;
  }

  return normalized;
}

function normalizeOptionalText(
  value: unknown,
  maximumLength: number,
): string | null | "invalid" {
  if (
    value === null ||
    value === undefined ||
    value === ""
  ) {
    return null;
  }

  if (
    typeof value !== "string"
  ) {
    return "invalid";
  }

  const normalized =
    value.trim();

  if (!normalized) {
    return null;
  }

  if (
    normalized.length >
    maximumLength
  ) {
    return "invalid";
  }

  return normalized;
}

function normalizeEmail(
  value: unknown,
): string | null | "invalid" {
  const normalized =
    normalizeOptionalText(
      value,
      254,
    );

  if (
    normalized === null ||
    normalized === "invalid"
  ) {
    return normalized;
  }

  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
    normalized,
  )
    ? normalized
    : "invalid";
}

function normalizeStatus(
  value: unknown,
): ShopStatus | null {
  if (
    value === "active" ||
    value === "inactive"
  ) {
    return value;
  }

  return null;
}

function normalizeServiceCode(
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

function mapShop(
  shop: ShopRow,
) {
  return {
    code: shop.code,
    name: shop.name,

    ownerName:
      shop.owner_name,

    phoneNumber:
      shop.phone_number,

    whatsAppNumber:
      shop.whatsapp_number ??
      "",

    emailAddress:
      shop.email_address ??
      "",

    addressLine:
      shop.address_line,

    city: shop.city,
    state: shop.state,

    postalCode:
      shop.postal_code,

    status: shop.status,

    createdAt:
      shop.created_at,

    updatedAt:
      shop.updated_at,
  };
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
          owner_name,
          phone_number,
          whatsapp_number,
          email_address,
          address_line,
          city,
          state,
          postal_code,
          status,
          created_at,
          updated_at

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
        row.override_enabled !==
        null;

      const overrideEnabled =
        hasOverride
          ? Boolean(
              row.override_enabled,
            )
          : null;

      const mode:
        ShopServiceMode =
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
          row.color ??
          "#607d8b",

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
            owner_name,
            phone_number,
            whatsapp_number,
            email_address,
            address_line,
            city,
            state,
            postal_code,
            status,
            created_at,
            updated_at

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
        mapShop,
      ),
  });
}

async function handleGetShopInformation(
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
        error:
          "Shop not found.",
      },
      404,
    );
  }

  return createJsonResponse({
    shop:
      mapShop(shop),
  });
}

async function handleUpdateShopInformation(
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

  const existingShop =
    await loadShop(
      env,
      shopCode,
    );

  if (!existingShop) {
    return createJsonResponse(
      {
        error:
          "Shop not found.",
      },
      404,
    );
  }

  let body:
    UpdateShopInformationRequest;

  try {
    body =
      (await request.json()) as
        UpdateShopInformationRequest;
  } catch {
    return createJsonResponse(
      {
        error:
          "Request body must be valid JSON.",
      },
      400,
    );
  }

  const name =
    normalizeRequiredText(
      body.name,
      150,
    );

  const ownerName =
    normalizeRequiredText(
      body.ownerName,
      150,
    );

  const phoneNumber =
    normalizeRequiredText(
      body.phoneNumber,
      40,
    );

  const whatsAppNumber =
    normalizeOptionalText(
      body.whatsAppNumber,
      40,
    );

  const emailAddress =
    normalizeEmail(
      body.emailAddress,
    );

  const addressLine =
    normalizeRequiredText(
      body.addressLine,
      250,
    );

  const city =
    normalizeRequiredText(
      body.city,
      100,
    );

  const state =
    normalizeRequiredText(
      body.state,
      100,
    );

  const postalCode =
    normalizeRequiredText(
      body.postalCode,
      30,
    );

  const status =
    normalizeStatus(
      body.status,
    );

  if (
    !name ||
    !ownerName ||
    !phoneNumber ||
    whatsAppNumber ===
      "invalid" ||
    emailAddress ===
      "invalid" ||
    !addressLine ||
    !city ||
    !state ||
    !postalCode ||
    !status
  ) {
    return createJsonResponse(
      {
        error:
          "Please provide valid shop, owner, contact, address and status information.",
      },
      400,
    );
  }

  await env.gyan_registry
    .prepare(
      `
        UPDATE shops

        SET
          name = ?,
          owner_name = ?,
          phone_number = ?,
          whatsapp_number = ?,
          email_address = ?,
          address_line = ?,
          city = ?,
          state = ?,
          postal_code = ?,
          status = ?,
          updated_at =
            CURRENT_TIMESTAMP

        WHERE code = ?
      `,
    )
    .bind(
      name,
      ownerName,
      phoneNumber,
      whatsAppNumber,
      emailAddress,
      addressLine,
      city,
      state,
      postalCode,
      status,
      shopCode,
    )
    .run();

  const updatedShop =
    await loadShop(
      env,
      shopCode,
    );

  if (!updatedShop) {
    return createJsonResponse(
      {
        error:
          "The shop was updated but could not be reloaded.",
      },
      500,
    );
  }

  return createJsonResponse({
    message:
      "Shop information saved.",

    shop:
      mapShop(updatedShop),
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
        error:
          "Shop not found.",
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
    shop:
      mapShop(shop),

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
        error:
          "Shop not found.",
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
      rawChange as
        ShopServiceChange;

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
      sortOrder ===
        "invalid"
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

          WHERE
            service_type =
              'system'
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
              DELETE FROM
                shop_services

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
      change.mode ===
      "enabled"
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
    message:
      "Changes saved.",

    shop:
      mapShop(shop),

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

  const servicesMatch =
    url.pathname.match(
      /^\/api\/admin\/shops\/([A-Za-z0-9]{4})\/services$/,
    );

  if (servicesMatch) {
    const shopCode =
      normalizeShopCode(
        servicesMatch[1],
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

    if (
      request.method === "GET"
    ) {
      return handleGetShopServices(
        request,
        env,
        shopCode,
      );
    }

    if (
      request.method === "PUT"
    ) {
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

  const informationMatch =
    url.pathname.match(
      /^\/api\/admin\/shops\/([A-Za-z0-9]{4})$/,
    );

  if (!informationMatch) {
    return null;
  }

  const shopCode =
    normalizeShopCode(
      informationMatch[1],
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

  if (
    request.method === "GET"
  ) {
    return handleGetShopInformation(
      request,
      env,
      shopCode,
    );
  }

  if (
    request.method === "PUT"
  ) {
    return handleUpdateShopInformation(
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