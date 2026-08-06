import {
  getAdminSession,
} from "./adminAuth";

const MAX_SECTIONS_PER_SERVICE =
  10;

const MAX_FIELDS_PER_SECTION =
  15;

const allowedFieldTypes =
  new Set([
    "text",
    "textarea",
    "number",
    "email",
    "tel",
    "date",
    "select",
    "radio",
    "checkbox",
    "checkbox-group",
    "file",
  ]);

const allowedRequirements =
  new Set([
    "mandatory",
    "optional",
    "hidden",
  ]);

const allowedVisibility =
  new Set([
    "visible",
    "hidden",
  ]);

interface ServiceRow {
  id: number;
  service_code: string;
  name: string;
  category: string;
  sub_category: string | null;
}

interface SectionRow {
  id: number;
  section_key: string;
  label: string;
  description: string | null;
  visibility: string;
  include_in_shop_email:
    | number
    | boolean;
  include_in_customer_email:
    | number
    | boolean;
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
  email_label: string | null;
  include_in_shop_email:
    | number
    | boolean;
  include_in_customer_email:
    | number
    | boolean;
  include_in_request_view:
    | number
    | boolean;
  sort_order: number;
}

interface RawFieldInput {
  key?: unknown;
  label?: unknown;
  type?: unknown;
  requirement?: unknown;
  placeholder?: unknown;
  helpText?: unknown;
  defaultValue?: unknown;
  options?: unknown;
  validation?: unknown;
  emailLabel?: unknown;
  includeInShopEmail?: unknown;
  includeInCustomerEmail?: unknown;
  includeInRequestView?: unknown;
  sortOrder?: unknown;
}

interface RawSectionInput {
  key?: unknown;
  label?: unknown;
  description?: unknown;
  visibility?: unknown;
  includeInShopEmail?: unknown;
  includeInCustomerEmail?: unknown;
  sortOrder?: unknown;
  fields?: unknown;
}

interface UpdateServiceFormRequest {
  sections?: unknown;
}

interface NormalizedField {
  key: string;
  label: string;
  type: string;
  requirement: string;
  placeholder: string | null;
  helpText: string | null;
  defaultValue: string | null;
  optionsJson: string | null;
  validationJson: string | null;
  emailLabel: string | null;
  includeInShopEmail: boolean;
  includeInCustomerEmail: boolean;
  includeInRequestView: boolean;
  sortOrder: number;
}

interface NormalizedSection {
  key: string;
  label: string;
  description: string | null;
  visibility: string;
  includeInShopEmail: boolean;
  includeInCustomerEmail: boolean;
  sortOrder: number;
  fields: NormalizedField[];
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

function normalizeKey(
  value: unknown,
  maximumLength = 50,
): string | null {
  if (
    typeof value !== "string"
  ) {
    return null;
  }

  const normalized =
    value
      .trim()
      .toLowerCase()
      .replace(
        /[^a-z0-9_]+/g,
        "_",
      )
      .replace(
        /^_+|_+$/g,
        "",
      );

  if (
    !normalized ||
    normalized.length >
      maximumLength
  ) {
    return null;
  }

  return normalized;
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
    !normalized ||
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

function normalizeBoolean(
  value: unknown,
  fallback: boolean,
): boolean {
  return typeof value ===
    "boolean"
    ? value
    : fallback;
}

function normalizeSortOrder(
  value: unknown,
  fallback: number,
): number | null {
  if (
    value === undefined ||
    value === null ||
    value === ""
  ) {
    return fallback;
  }

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

function normalizeJsonValue(
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

  try {
    const json =
      JSON.stringify(value);

    if (
      json.length >
      maximumLength
    ) {
      return "invalid";
    }

    return json;
  } catch {
    return "invalid";
  }
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

async function loadService(
  env: Env,
  serviceCode: string,
): Promise<ServiceRow | null> {
  return env.gyan_registry
    .prepare(
      `
        SELECT
          id,
          service_code,
          name,
          category,
          sub_category

        FROM services

        WHERE service_code = ?

        LIMIT 1
      `,
    )
    .bind(serviceCode)
    .first<ServiceRow>();
}

async function loadServiceForm(
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
            visibility,
            include_in_shop_email,
            include_in_customer_email,
            sort_order

          FROM service_sections

          WHERE service_id = ?

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
            email_label,
            include_in_shop_email,
            include_in_customer_email,
            include_in_request_view,
            sort_order

          FROM service_fields

          WHERE section_id IN (
            ${placeholders}
          )

          ORDER BY
            section_id ASC,
            sort_order ASC,
            id ASC
        `,
      )
      .bind(...sectionIds)
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

  return sectionsResult.results.map(
    (section) => ({
      id: section.id,

      key:
        section.section_key,

      label:
        section.label,

      description:
        section.description ?? "",

      visibility:
        section.visibility,

      includeInShopEmail:
        Boolean(
          section
            .include_in_shop_email,
        ),

      includeInCustomerEmail:
        Boolean(
          section
            .include_in_customer_email,
        ),

      sortOrder:
        section.sort_order,

      fields:
        (
          fieldsBySection.get(
            section.id,
          ) ?? []
        ).map(
          (field) => ({
            id: field.id,

            key:
              field.field_key,

            label:
              field.label,

            type:
              field.field_type,

            requirement:
              field.requirement,

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
              ),

            validation:
              safelyParseJson(
                field.validation_json,
              ),

            emailLabel:
              field.email_label ??
              "",

            includeInShopEmail:
              Boolean(
                field
                  .include_in_shop_email,
              ),

            includeInCustomerEmail:
              Boolean(
                field
                  .include_in_customer_email,
              ),

            includeInRequestView:
              Boolean(
                field
                  .include_in_request_view,
              ),

            sortOrder:
              field.sort_order,
          }),
        ),
    }),
  );
}

function normalizeField(
  rawField: RawFieldInput,
  fallbackSortOrder: number,
): NormalizedField | null {
  const key =
    normalizeKey(
      rawField.key,
    );

  const label =
    normalizeRequiredText(
      rawField.label,
      150,
    );

  const type =
    typeof rawField.type ===
      "string" &&
    allowedFieldTypes.has(
      rawField.type,
    )
      ? rawField.type
      : null;

  const requirement =
    typeof rawField.requirement ===
      "string" &&
    allowedRequirements.has(
      rawField.requirement,
    )
      ? rawField.requirement
      : null;

  const placeholder =
    normalizeOptionalText(
      rawField.placeholder,
      250,
    );

  const helpText =
    normalizeOptionalText(
      rawField.helpText,
      500,
    );

  const defaultValue =
    normalizeOptionalText(
      rawField.defaultValue,
      500,
    );

  const emailLabel =
    normalizeOptionalText(
      rawField.emailLabel,
      150,
    );

  const optionsJson =
    normalizeJsonValue(
      rawField.options,
      10_000,
    );

  const validationJson =
    normalizeJsonValue(
      rawField.validation,
      5_000,
    );

  const sortOrder =
    normalizeSortOrder(
      rawField.sortOrder,
      fallbackSortOrder,
    );

  if (
    !key ||
    !label ||
    !type ||
    !requirement ||
    placeholder === "invalid" ||
    helpText === "invalid" ||
    defaultValue === "invalid" ||
    emailLabel === "invalid" ||
    optionsJson === "invalid" ||
    validationJson === "invalid" ||
    sortOrder === null
  ) {
    return null;
  }

  return {
    key,
    label,
    type,
    requirement,
    placeholder,
    helpText,
    defaultValue,
    optionsJson,
    validationJson,
    emailLabel,

    includeInShopEmail:
      normalizeBoolean(
        rawField
          .includeInShopEmail,
        true,
      ),

    includeInCustomerEmail:
      normalizeBoolean(
        rawField
          .includeInCustomerEmail,
        true,
      ),

    includeInRequestView:
      normalizeBoolean(
        rawField
          .includeInRequestView,
        true,
      ),

    sortOrder,
  };
}

function normalizeSection(
  rawSection: RawSectionInput,
  fallbackSortOrder: number,
): NormalizedSection | null {
  const key =
    normalizeKey(
      rawSection.key,
    );

  const label =
    normalizeRequiredText(
      rawSection.label,
      150,
    );

  const description =
    normalizeOptionalText(
      rawSection.description,
      500,
    );

  const visibility =
    typeof rawSection.visibility ===
      "string" &&
    allowedVisibility.has(
      rawSection.visibility,
    )
      ? rawSection.visibility
      : null;

  const sortOrder =
    normalizeSortOrder(
      rawSection.sortOrder,
      fallbackSortOrder,
    );

  if (
    !key ||
    !label ||
    description === "invalid" ||
    !visibility ||
    sortOrder === null ||
    !Array.isArray(
      rawSection.fields,
    ) ||
    rawSection.fields.length >
      MAX_FIELDS_PER_SECTION
  ) {
    return null;
  }

  const fields:
    NormalizedField[] = [];

  const fieldKeys =
    new Set<string>();

  for (
    let index = 0;
    index <
      rawSection.fields.length;
    index += 1
  ) {
    const rawField =
      rawSection.fields[index];

    if (
      typeof rawField !==
        "object" ||
      rawField === null
    ) {
      return null;
    }

    const normalizedField =
      normalizeField(
        rawField as
          RawFieldInput,

        (index + 1) * 10,
      );

    if (
      !normalizedField ||
      fieldKeys.has(
        normalizedField.key,
      )
    ) {
      return null;
    }

    fieldKeys.add(
      normalizedField.key,
    );

    fields.push(
      normalizedField,
    );
  }

  return {
    key,
    label,
    description,
    visibility,

    includeInShopEmail:
      normalizeBoolean(
        rawSection
          .includeInShopEmail,
        true,
      ),

    includeInCustomerEmail:
      normalizeBoolean(
        rawSection
          .includeInCustomerEmail,
        true,
      ),

    sortOrder,
    fields,
  };
}

async function handleGetServiceForm(
  request: Request,
  env: Env,
  serviceCode: string,
): Promise<Response> {
  const unauthorized =
    await requireAdmin(
      request,
      env,
    );

  if (unauthorized) {
    return unauthorized;
  }

  const service =
    await loadService(
      env,
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

  return createJsonResponse({
    service: {
      id: service.id,

      code:
        service.service_code,

      name:
        service.name,

      category:
        service.category,

      subCategory:
        service.sub_category,
    },

    limits: {
      maximumSections:
        MAX_SECTIONS_PER_SERVICE,

      maximumFieldsPerSection:
        MAX_FIELDS_PER_SECTION,
    },

    sections:
      await loadServiceForm(
        env,
        service.id,
      ),
  });
}

async function handleUpdateServiceForm(
  request: Request,
  env: Env,
  serviceCode: string,
): Promise<Response> {
  const unauthorized =
    await requireAdmin(
      request,
      env,
    );

  if (unauthorized) {
    return unauthorized;
  }

  const service =
    await loadService(
      env,
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

  let body:
    UpdateServiceFormRequest;

  try {
    body =
      (await request.json()) as
        UpdateServiceFormRequest;
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
      body.sections,
    ) ||
    body.sections.length >
      MAX_SECTIONS_PER_SERVICE
  ) {
    return createJsonResponse(
      {
        error:
          `A service may contain up to ${MAX_SECTIONS_PER_SERVICE} sections.`,
      },
      400,
    );
  }

  const sections:
    NormalizedSection[] = [];

  const sectionKeys =
    new Set<string>();

  for (
    let index = 0;
    index <
      body.sections.length;
    index += 1
  ) {
    const rawSection =
      body.sections[index];

    if (
      typeof rawSection !==
        "object" ||
      rawSection === null
    ) {
      return createJsonResponse(
        {
          error:
            "Each section must be an object.",
        },
        400,
      );
    }

    const normalizedSection =
      normalizeSection(
        rawSection as
          RawSectionInput,

        (index + 1) * 10,
      );

    if (!normalizedSection) {
      return createJsonResponse(
        {
          error:
            `Section ${index + 1} contains invalid information or exceeds the field limit.`,
        },
        400,
      );
    }

    if (
      sectionKeys.has(
        normalizedSection.key,
      )
    ) {
      return createJsonResponse(
        {
          error:
            `Section key "${normalizedSection.key}" was used more than once.`,
        },
        400,
      );
    }

    sectionKeys.add(
      normalizedSection.key,
    );

    sections.push(
      normalizedSection,
    );
  }

  const statements:
    D1PreparedStatement[] = [];

  /*
   * Replace the service schema as one
   * logical operation.
   *
   * Deleting sections also deletes
   * their fields because of ON DELETE
   * CASCADE.
   */
  statements.push(
    env.gyan_registry
      .prepare(
        `
          DELETE FROM
            service_sections

          WHERE service_id = ?
        `,
      )
      .bind(service.id),
  );

  for (
    const section
    of sections
  ) {
    statements.push(
      env.gyan_registry
        .prepare(
          `
            INSERT INTO
              service_sections (
                service_id,
                section_key,
                label,
                description,
                visibility,
                include_in_shop_email,
                include_in_customer_email,
                sort_order,
                updated_at
              )
            VALUES (
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              CURRENT_TIMESTAMP
            )
          `,
        )
        .bind(
          service.id,
          section.key,
          section.label,
          section.description,
          section.visibility,

          section
            .includeInShopEmail
            ? 1
            : 0,

          section
            .includeInCustomerEmail
            ? 1
            : 0,

          section.sortOrder,
        ),
    );
  }

  /*
   * D1 batch statements cannot reference
   * newly generated section IDs directly,
   * so execute the section inserts first.
   */
  await env.gyan_registry.batch(
    statements,
  );

  const insertedSections =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            id,
            section_key

          FROM service_sections

          WHERE service_id = ?
        `,
      )
      .bind(service.id)
      .all<{
        id: number;
        section_key: string;
      }>();

  const sectionIdMap =
    new Map(
      insertedSections.results.map(
        (row) => [
          row.section_key,
          row.id,
        ],
      ),
    );

  const fieldStatements:
    D1PreparedStatement[] = [];

  for (
    const section
    of sections
  ) {
    const sectionId =
      sectionIdMap.get(
        section.key,
      );

    if (!sectionId) {
      return createJsonResponse(
        {
          error:
            "The service sections were saved, but one section could not be reloaded.",
        },
        500,
      );
    }

    for (
      const field
      of section.fields
    ) {
      fieldStatements.push(
        env.gyan_registry
          .prepare(
            `
              INSERT INTO
                service_fields (
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
                  email_label,
                  include_in_shop_email,
                  include_in_customer_email,
                  include_in_request_view,
                  sort_order,
                  updated_at
                )
              VALUES (
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                ?,
                CURRENT_TIMESTAMP
              )
            `,
          )
          .bind(
            sectionId,
            field.key,
            field.label,
            field.type,
            field.requirement,
            field.placeholder,
            field.helpText,
            field.defaultValue,
            field.optionsJson,
            field.validationJson,
            field.emailLabel,

            field
              .includeInShopEmail
              ? 1
              : 0,

            field
              .includeInCustomerEmail
              ? 1
              : 0,

            field
              .includeInRequestView
              ? 1
              : 0,

            field.sortOrder,
          ),
      );
    }
  }

  if (
    fieldStatements.length > 0
  ) {
    await env.gyan_registry.batch(
      fieldStatements,
    );
  }

  return createJsonResponse({
    message:
      "Service form configuration saved.",

    service: {
      id: service.id,

      code:
        service.service_code,

      name:
        service.name,
    },

    sections:
      await loadServiceForm(
        env,
        service.id,
      ),
  });
}

export async function handleAdminServiceFormsRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  const match =
    url.pathname.match(
      /^\/api\/admin\/services\/([A-Za-z0-9_]{2,50})\/form$/,
    );

  if (!match) {
    return null;
  }

  const serviceCode =
    normalizeServiceCode(
      match[1],
    );

  if (!serviceCode) {
    return createJsonResponse(
      {
        error:
          "Invalid service code.",
      },
      400,
    );
  }

  if (
    request.method === "GET"
  ) {
    return handleGetServiceForm(
      request,
      env,
      serviceCode,
    );
  }

  if (
    request.method === "PUT"
  ) {
    return handleUpdateServiceForm(
      request,
      env,
      serviceCode,
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