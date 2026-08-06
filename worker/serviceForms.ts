interface ShopRow {
  code: string;
  name: string;
  status: string;
}

interface ServiceRow {
  id: number;
  service_code: string;
  name: string;
  description: string | null;
  icon: string | null;
  color: string | null;
  category: string;
  sub_category: string | null;
  workflow_type: string;

  global_enabled:
    | number
    | boolean;

  shop_enabled:
    | number
    | boolean
    | null;
}

interface SectionRow {
  id: number;
  section_key: string;
  label: string;
  description: string | null;
  sort_order: number;
}

interface FieldRow {
  id: number;
  section_id: number;
  field_key: string;
  label: string;
  field_type: string;
  requirement: string;
  placeholder: string | null;
  help_text: string | null;
  default_value: string | null;
  options_json: string | null;
  validation_json: string | null;
  sort_order: number;
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
    value
      .trim()
      .toUpperCase();

  return /^[A-Z0-9]{4}$/.test(
    normalized,
  )
    ? normalized
    : null;
}

function normalizeServiceCode(
  value: string,
): string | null {
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

function safelyParseJson(
  value: string | null,
): unknown {
  if (!value) {
    return null;
  }

  try {
    return JSON.parse(value);
  } catch {
    return null;
  }
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
          status

        FROM shops

        WHERE code = ?

        LIMIT 1
      `,
    )
    .bind(shopCode)
    .first<ShopRow>();
}

async function loadService(
  env: Env,
  shopCode: string,
  serviceCode: string,
): Promise<ServiceRow | null> {
  return env.gyan_registry
    .prepare(
      `
        SELECT
          s.id,
          s.service_code,
          s.name,
          s.description,
          s.icon,
          s.color,
          s.category,
          s.sub_category,
          s.workflow_type,

          CAST(
            s.enabled AS INTEGER
          ) AS global_enabled,

          ss.enabled
            AS shop_enabled

        FROM services s

        LEFT JOIN shop_services ss
          ON ss.service_id = s.id
          AND ss.shop_code = ?

        WHERE
          s.service_code = ?
          AND s.service_type = 'system'

        LIMIT 1
      `,
    )
    .bind(
      shopCode,
      serviceCode,
    )
    .first<ServiceRow>();
}

async function loadPublicSections(
  env: Env,
  serviceId: number,
) {
  const sectionsResult =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            id,
            section_key,
            label,
            description,
            sort_order

          FROM service_sections

          WHERE
            service_id = ?
            AND visibility = 'visible'

          ORDER BY
            sort_order ASC,
            id ASC
        `,
      )
      .bind(serviceId)
      .all<SectionRow>();

  if (
    sectionsResult.results
      .length === 0
  ) {
    return [];
  }

  const sectionIds =
    sectionsResult.results.map(
      (section) =>
        section.id,
    );

  const placeholders =
    sectionIds
      .map(() => "?")
      .join(", ");

  const fieldsResult =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            id,
            section_id,
            field_key,
            label,
            field_type,
            requirement,
            placeholder,
            help_text,
            default_value,
            options_json,
            validation_json,
            sort_order

          FROM service_fields

          WHERE
            section_id IN (
              ${placeholders}
            )
            AND requirement != 'hidden'

          ORDER BY
            section_id ASC,
            sort_order ASC,
            id ASC
        `,
      )
      .bind(
        ...sectionIds,
      )
      .all<FieldRow>();

  const fieldsBySection =
    new Map<
      number,
      FieldRow[]
    >();

  for (
    const field
    of fieldsResult.results
  ) {
    const current =
      fieldsBySection.get(
        field.section_id,
      ) ?? [];

    current.push(field);

    fieldsBySection.set(
      field.section_id,
      current,
    );
  }

  return sectionsResult.results
    .map(
      (section) => ({
        key:
          section.section_key,

        label:
          section.label,

        description:
          section.description ??
          "",

        sortOrder:
          section.sort_order,

        fields:
          (
            fieldsBySection.get(
              section.id,
            ) ?? []
          ).map(
            (field) => ({
              key:
                field.field_key,

              label:
                field.label,

              type:
                field.field_type,

              required:
                field.requirement ===
                "mandatory",

              placeholder:
                field.placeholder ??
                "",

              helpText:
                field.help_text ??
                "",

              defaultValue:
                field.default_value ??
                "",

              options:
                safelyParseJson(
                  field.options_json,
                ) ?? [],

              validation:
                safelyParseJson(
                  field.validation_json,
                ) ?? {},

              sortOrder:
                field.sort_order,
            }),
          ),
      }),
    )
    .filter(
      (section) =>
        section.fields.length >
        0,
    );
}

async function handleGetPublicServiceForm(
  env: Env,
  shopCode: string,
  serviceCode: string,
): Promise<Response> {
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

  if (
    shop.status !== "active"
  ) {
    return createJsonResponse(
      {
        error:
          "Shop is not active.",
      },
      403,
    );
  }

  const service =
    await loadService(
      env,
      shopCode,
      serviceCode,
    );

  if (!service) {
    return createJsonResponse(
      {
        error:
          "Service not found.",
      },
      404,
    );
  }

  const effectiveEnabled =
    service.shop_enabled ===
      null
      ? Boolean(
          service.global_enabled,
        )
      : Boolean(
          service.shop_enabled,
        );

  if (!effectiveEnabled) {
    return createJsonResponse(
      {
        error:
          "This service is not currently available at the selected shop.",
      },
      403,
    );
  }

  const sections =
    await loadPublicSections(
      env,
      service.id,
    );

  return createJsonResponse({
    shop: {
      code:
        shop.code,

      name:
        shop.name,
    },

    service: {
      code:
        service.service_code,

      name:
        service.name,

      description:
        service.description ??
        "",

      icon:
        service.icon ??
        "🧩",

      color:
        service.color ??
        "#607d8b",

      category:
        service.category,

      subCategory:
        service.sub_category,

      workflowType:
        service.workflow_type,
    },

    form: {
      sections,

      hasConfiguration:
        sections.length > 0,
    },
  });
}

export async function handleServiceFormsRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  const match =
    url.pathname.match(
      /^\/api\/shops\/([A-Za-z0-9]{4})\/services\/([A-Za-z0-9_]{2,50})\/form$/,
    );

  if (!match) {
    return null;
  }

  if (
    request.method !== "GET"
  ) {
    return createJsonResponse(
      {
        error:
          "Method not allowed.",
      },
      405,
    );
  }

  const shopCode =
    normalizeShopCode(
      match[1],
    );

  const serviceCode =
    normalizeServiceCode(
      match[2],
    );

  if (
    !shopCode ||
    !serviceCode
  ) {
    return createJsonResponse(
      {
        error:
          "Invalid shop or service code.",
      },
      400,
    );
  }

  return handleGetPublicServiceForm(
    env,
    shopCode,
    serviceCode,
  );
}