interface ServiceCatalogRow {
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

  owner_shop_code: string | null;

  effective_enabled: number | boolean;
  effective_sort_order: number;

  display_name: string | null;
  description_override: string | null;
  icon_override: string | null;
  color_override: string | null;

  price_type: string | null;
  price_amount_paise: number | null;
  price_note: string | null;
}

interface ShopExistsRow {
  code: string;
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

  if (
    !/^[A-Z0-9]{4}$/.test(
      normalized,
    )
  ) {
    return null;
  }

  return normalized;
}

function mapServiceRow(
  row: ServiceCatalogRow,
) {
  return {
    id: row.id,
    code: row.service_code,
    type: row.service_type,

    category: row.category,
    subCategory:
      row.sub_category,

    name:
      row.display_name ??
      row.name,

    catalogName:
      row.name,

    description:
      row.description_override ??
      row.description ??
      "",

    icon:
      row.icon_override ??
      row.icon ??
      "🧩",

    color:
      row.color_override ??
      row.color ??
      "#607d8b",

    workflowType:
      row.workflow_type,

    enabled:
      Boolean(
        row.effective_enabled,
      ),

    priceType:
      row.price_type ??
      "contact",

    priceAmountPaise:
      row.price_amount_paise,

    priceNote:
      row.price_note ?? "",

    sortOrder:
      row.effective_sort_order,

    custom:
      row.service_type ===
      "custom",
  };
}

async function getGlobalServices(
  env: Env,
): Promise<Response> {
  const result =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            s.id,
            s.service_code,
            s.service_type,

            s.category,
            s.sub_category,

            s.name,
            s.description,

            s.icon,
            s.color,

            s.workflow_type,
            s.owner_shop_code,

            CAST(
              s.enabled AS INTEGER
            ) AS effective_enabled,

            s.sort_order
              AS effective_sort_order,

            NULL AS display_name,
            NULL AS description_override,
            NULL AS icon_override,
            NULL AS color_override,

            'contact' AS price_type,
            NULL AS price_amount_paise,
            NULL AS price_note

          FROM services s

          WHERE
            s.service_type =
              'system'

          ORDER BY
            s.category ASC,
            s.sort_order ASC,
            s.name ASC
        `,
      )
      .all<ServiceCatalogRow>();

  return createJsonResponse({
    services:
      result.results.map(
        mapServiceRow,
      ),
  });
}

async function getShopServices(
  env: Env,
  rawShopCode: string,
): Promise<Response> {
  const shopCode =
    normalizeShopCode(
      rawShopCode,
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

  const shop =
    await env.gyan_registry
      .prepare(
        `
          SELECT code
          FROM shops
          WHERE code = ?
          LIMIT 1
        `,
      )
      .bind(shopCode)
      .first<ShopExistsRow>();

  if (!shop) {
    return createJsonResponse(
      {
        error:
          "Shop not found.",
      },
      404,
    );
  }

  const result =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            s.id,
            s.service_code,
            s.service_type,

            s.category,
            s.sub_category,

            s.name,
            s.description,

            s.icon,
            s.color,

            s.workflow_type,
            s.owner_shop_code,

            CAST(
              COALESCE(
                ss.enabled,
                s.enabled
              )
              AS INTEGER
            ) AS effective_enabled,

            COALESCE(
              ss.sort_order,
              s.sort_order
            ) AS effective_sort_order,

            ss.display_name,
            ss.description_override,
            ss.icon_override,
            ss.color_override,

            COALESCE(
              ss.price_type,
              'contact'
            ) AS price_type,

            ss.price_amount_paise,
            ss.price_note

          FROM services s

          LEFT JOIN shop_services ss
            ON ss.service_id = s.id
            AND ss.shop_code = ?

          WHERE
            s.service_type =
              'system'

            OR s.owner_shop_code = ?

          ORDER BY
            s.category ASC,
            effective_sort_order ASC,
            s.name ASC
        `,
      )
      .bind(
        shopCode,
        shopCode,
      )
      .all<ServiceCatalogRow>();

  return createJsonResponse({
    shopCode,

    services:
      result.results.map(
        mapServiceRow,
      ),
  });
}

export async function handleServiceCatalogRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    request.method === "GET" &&
    url.pathname ===
      "/api/services"
  ) {
    return getGlobalServices(env);
  }

  const shopServicesMatch =
    url.pathname.match(
      /^\/api\/shops\/([A-Za-z0-9]{4})\/services$/,
    );

  if (
    request.method === "GET" &&
    shopServicesMatch
  ) {
    return getShopServices(
      env,
      shopServicesMatch[1],
    );
  }

  return null;
}