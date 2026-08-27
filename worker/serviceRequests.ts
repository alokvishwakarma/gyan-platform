import {
  addStoredBytes,
  assertUploadCapacity,
} from "./storageGuard";

import {
  currentGyanAccountId,
} from "./gyanAccountContext";

import {
  sendServiceRequestNotifications,
} from "./serviceRequestNotifications";

import {
  calculateMagicLinkExpiration,
  createMagicLinkToken,
  createMagicLinkUrl,
} from "./magicLinks";

import type {
  ServiceEmailAction,
  ServiceEmailSection,
} from "./emailTemplates/serviceRequestEmail";

interface ShopRow {
  code: string;
  name: string;
  status: string;

  email_address:
    | string
    | null;
}

interface ServiceRow {
  id: number;
  service_code: string;
  name: string;
  category: string;
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
  section_id: number;

  field_key: string;
  label: string;

  field_type: string;
  requirement: string;

  email_label:
    | string
    | null;

  include_in_shop_email:
    | number
    | boolean;

  include_in_customer_email:
    | number
    | boolean;

  options_json:
    | string
    | null;

  validation_json:
    | string
    | null;

  sort_order: number;
}

interface CreatedRequestRow {
  id: number;

  request_number: string;
  status: string;
  created_at: string;
}

interface NotificationFileRow {
  id: number;
  original_file_name: string;
  file_size: number;
}

interface StoredFile {
  sectionKey: string;
  fieldKey: string;

  file: File;

  storageKey: string;
  contentType: string;
}

type FieldAnswer =
  | string
  | boolean
  | string[];

interface SubmittedAnswer {
  sectionKey?: unknown;
  fieldKey?: unknown;
  value?: unknown;
}

interface SubmittedMetadata {
  answers?: unknown;
}

interface ParsedOption {
  value: string;
  label: string;
}

interface ValidationRules {
  minimum?: unknown;
  maximum?: unknown;

  minimumLength?: unknown;
  maximumLength?: unknown;

  pattern?: unknown;
}

const MAX_TOTAL_FILE_SIZE =
  25 * 1024 * 1024;

const MAX_FILES =
  15;

const MAX_METADATA_LENGTH =
  100_000;

const FILE_RETENTION_DAYS =
  15;

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

function normalizeKey(
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

  return /^[a-z0-9_]{1,50}$/.test(
    normalized,
  )
    ? normalized
    : null;
}


function normalizeFieldIdentity(
  field: FieldRow,
): string {
  return `${field.field_key} ${field.label}`
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, " ");
}

function isCustomerNameField(
  field: FieldRow,
): boolean {
  const identity =
    normalizeFieldIdentity(field);

  return (
    field.field_key === "customer_name" ||
    identity.includes("customer name") ||
    identity === "name"
  );
}

function isEmailField(
  field: FieldRow,
): boolean {
  const identity =
    normalizeFieldIdentity(
      field,
    );

  return (
    field.field_key ===
      "email" ||
    field.field_key ===
      "email_address" ||
    identity.includes(
      "email",
    )
  );
}

function isPhoneLikeField(
  field: FieldRow,
): boolean {
  const identity =
    normalizeFieldIdentity(
      field,
    );

  return (
    field.field_key ===
      "phone" ||
    field.field_key ===
      "phone_number" ||
    field.field_key ===
      "phone_or_whatsapp" ||
    field.field_key ===
      "whatsapp" ||
    field.field_key ===
      "whatsapp_number" ||
    field.field_key ===
      "mobile" ||
    field.field_key ===
      "mobile_number" ||
    identity.includes(
      "phone",
    ) ||
    identity.includes(
      "whatsapp",
    ) ||
    identity.includes(
      "mobile",
    )
  );
}

function isContactField(
  field: FieldRow,
): boolean {
  return (
    isPhoneLikeField(
      field,
    ) ||
    isEmailField(
      field,
    )
  );
}

function isRequestDescriptionField(
  field: FieldRow,
): boolean {
  if (
    field.field_type !== "textarea" &&
    field.field_type !== "text"
  ) {
    return false;
  }

  const identity =
    normalizeFieldIdentity(field);

  return (
    field.field_key === "request_details" ||
    field.field_key === "service_details" ||
    field.field_key === "description" ||
    field.field_key === "notes" ||
    identity.includes("what do you need") ||
    identity.includes("describe") ||
    identity.includes("request details") ||
    identity.includes("service details") ||
    identity.includes("help needed")
  );
}

function safelyParseJson(
  value:
    | string
    | null,
): unknown {
  if (!value) {
    return null;
  }

  try {
    return JSON.parse(
      value,
    );
  } catch {
    return null;
  }
}

function normalizeAnswerValue(
  value: unknown,
): FieldAnswer | null {
  if (
    typeof value ===
    "string"
  ) {
    return value.trim();
  }

  if (
    typeof value ===
    "boolean"
  ) {
    return value;
  }

  if (
    Array.isArray(value) &&
    value.every(
      (item) =>
        typeof item ===
        "string",
    )
  ) {
    return value.map(
      (item) =>
        item.trim(),
    );
  }

  return null;
}


function getStringAnswerByFieldKeys(
  answers:
    Record<string, FieldAnswer>,

  fieldKeys:
    string[],
): string | null {
  const wanted =
    new Set(
      fieldKeys.map(
        (key) =>
          key
            .trim()
            .toLowerCase(),
      ),
    );

  for (
    const [
      answerKey,
      value,
    ]
    of Object.entries(
      answers,
    )
  ) {
    if (
      typeof value !==
        "string"
    ) {
      continue;
    }

    const fieldKey =
      answerKey
        .split(".")
        .at(-1)
        ?.trim()
        .toLowerCase();

    if (
      fieldKey &&
      wanted.has(fieldKey)
    ) {
      const normalized =
        value.trim();

      if (normalized) {
        return normalized;
      }
    }
  }

  return null;
}

function generateRequestNumber(
  shopCode: string,
  serviceCode: string,
): string {
  const now =
    new Date();

  const datePart =
    [
      now.getUTCFullYear(),

      String(
        now.getUTCMonth() +
          1,
      ).padStart(
        2,
        "0",
      ),

      String(
        now.getUTCDate(),
      ).padStart(
        2,
        "0",
      ),
    ].join("");

  const randomPart =
    crypto
      .randomUUID()
      .replaceAll(
        "-",
        "",
      )
      .slice(
        0,
        6,
      )
      .toUpperCase();

  return [
    "SR",
    shopCode,
    serviceCode,
    datePart,
    randomPart,
  ].join("-");
}

function sanitizeFileName(
  fileName: string,
): string {
  const normalized =
    fileName
      .trim()
      .replace(
        /[^A-Za-z0-9._-]+/g,
        "_",
      )
      .replace(
        /^_+|_+$/g,
        "",
      );

  return (
    normalized ||
    "uploaded-file"
  ).slice(
    0,
    180,
  );
}

function createStorageKey(
  shopCode: string,
  requestNumber: string,
  sectionKey: string,
  fieldKey: string,
  file: File,
  index: number,
): string {
  const randomPart =
    crypto
      .randomUUID()
      .replaceAll(
        "-",
        "",
      )
      .slice(
        0,
        10,
      );

  return [
    "service-requests",
    shopCode,
    requestNumber,
    sectionKey,
    fieldKey,

    `${String(
      index + 1,
    ).padStart(
      2,
      "0",
    )}-${randomPart}-${sanitizeFileName(
      file.name,
    )}`,
  ].join("/");
}

function getConfiguredOptions(
  field: FieldRow,
): ParsedOption[] {
  const parsed =
    safelyParseJson(
      field.options_json,
    );

  if (
    !Array.isArray(parsed)
  ) {
    return [];
  }

  const options:
    ParsedOption[] = [];

  for (
    const item
    of parsed
  ) {
    if (
      typeof item !==
        "object" ||
      item === null
    ) {
      continue;
    }

    const candidate =
      item as {
        value?: unknown;
        label?: unknown;
      };

    if (
      typeof candidate.value !==
        "string" ||
      typeof candidate.label !==
        "string"
    ) {
      continue;
    }

    options.push({
      value:
        candidate.value,

      label:
        candidate.label,
    });
  }

  return options;
}

function getValidationRules(
  field: FieldRow,
): ValidationRules {
  const parsed =
    safelyParseJson(
      field.validation_json,
    );

  if (
    typeof parsed !==
      "object" ||
    parsed === null ||
    Array.isArray(parsed)
  ) {
    return {};
  }

  return parsed as
    ValidationRules;
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
          status,
          email_address

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
          s.category,
          s.workflow_type,

          CAST(
            s.enabled AS INTEGER
          ) AS global_enabled,

          ss.enabled
            AS shop_enabled

        FROM services s

        LEFT JOIN shop_services ss
          ON ss.service_id =
            s.id

          AND ss.shop_code = ?

        WHERE
          s.service_code = ?

          AND s.service_type =
            'system'

        LIMIT 1
      `,
    )
    .bind(
      shopCode,
      serviceCode,
    )
    .first<ServiceRow>();
}

async function loadFormSchema(
  env: Env,
  serviceId: number,
): Promise<{
  sections: SectionRow[];
  fields: FieldRow[];
}> {
  const sectionsResult =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            id,
            section_key,
            label,
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
    return {
      sections: [],
      fields: [],
    };
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
            section_id,
            field_key,
            label,
            field_type,
            requirement,
            email_label,
            include_in_shop_email,
            include_in_customer_email,
            options_json,
            validation_json,
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
      .bind(
        ...sectionIds,
      )
      .all<FieldRow>();

  return {
    sections:
      sectionsResult.results,

    fields:
      fieldsResult.results,
  };
}

async function loadNotificationFiles(
  env: Env,
  serviceRequestId: number,
): Promise<NotificationFileRow[]> {
  const result =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            id,
            original_file_name,
            file_size

          FROM service_request_files

          WHERE service_request_id = ?

          ORDER BY id ASC
        `,
      )
      .bind(
        serviceRequestId,
      )
      .all<NotificationFileRow>();

  return result.results;
}

function validateChoiceValue(
  field: FieldRow,
  value: string,
): boolean {
  const configuredOptions =
    getConfiguredOptions(
      field,
    );

  if (
    configuredOptions.length ===
    0
  ) {
    return true;
  }

  return configuredOptions.some(
    (option) =>
      option.value ===
      value,
  );
}

function validateAnswer(
  field: FieldRow,

  value:
    | FieldAnswer
    | undefined,
): string | null {
  const required =
    field.requirement ===
    "mandatory";

  if (
    field.field_type ===
    "checkbox"
  ) {
    if (
      required &&
      value !== true
    ) {
      return `${field.label} is required.`;
    }

    if (
      value !== undefined &&
      typeof value !==
        "boolean"
    ) {
      return `${field.label} contains an invalid value.`;
    }

    return null;
  }

  if (
    field.field_type ===
    "checkbox-group"
  ) {
    if (
      required &&
      (
        !Array.isArray(
          value,
        ) ||
        value.length === 0
      )
    ) {
      return `${field.label} requires at least one selection.`;
    }

    if (
      value !== undefined &&
      !Array.isArray(value)
    ) {
      return `${field.label} contains an invalid value.`;
    }

    if (
      Array.isArray(value)
    ) {
      for (
        const selection
        of value
      ) {
        if (
          !validateChoiceValue(
            field,
            selection,
          )
        ) {
          return `${field.label} contains an invalid selection.`;
        }
      }
    }

    return null;
  }

  if (
    field.field_type ===
    "file"
  ) {
    return null;
  }

  const text =
    typeof value ===
    "string"
      ? value.trim()
      : "";

  if (
    required &&
    !text
  ) {
    return `${field.label} is required.`;
  }

  if (!text) {
    return null;
  }

  if (
    field.field_type ===
      "select" ||
    field.field_type ===
      "radio"
  ) {
    if (
      !validateChoiceValue(
        field,
        text,
      )
    ) {
      return `${field.label} contains an invalid selection.`;
    }
  }

  const rules =
    getValidationRules(
      field,
    );

  if (
    typeof rules.minimumLength ===
      "number" &&
    text.length <
      rules.minimumLength
  ) {
    return `${field.label} must contain at least ${rules.minimumLength} characters.`;
  }

  if (
    typeof rules.maximumLength ===
      "number" &&
    text.length >
      rules.maximumLength
  ) {
    return `${field.label} cannot exceed ${rules.maximumLength} characters.`;
  }

  if (
    field.field_type ===
    "number"
  ) {
    const numericValue =
      Number(text);

    if (
      !Number.isFinite(
        numericValue,
      )
    ) {
      return `${field.label} must be a valid number.`;
    }

    if (
      typeof rules.minimum ===
        "number" &&
      numericValue <
        rules.minimum
    ) {
      return `${field.label} must be at least ${rules.minimum}.`;
    }

    if (
      typeof rules.maximum ===
        "number" &&
      numericValue >
        rules.maximum
    ) {
      return `${field.label} cannot exceed ${rules.maximum}.`;
    }
  }

  if (
    typeof rules.pattern ===
      "string" &&
    rules.pattern
  ) {
    try {
      const expression =
        new RegExp(
          rules.pattern,
        );

      if (
        !expression.test(
          text,
        )
      ) {
        return `${field.label} is not in the expected format.`;
      }
    } catch {
      // Ignore invalid administrator regex.
    }
  }

  return null;
}

function formatAnswerValue(
  field: FieldRow,

  value:
    | FieldAnswer
    | undefined,
): string {
  if (
    value === undefined ||
    value === null ||
    value === ""
  ) {
    return "Not provided";
  }

  if (
    typeof value ===
    "boolean"
  ) {
    return value
      ? "Yes"
      : "No";
  }

  const optionLabels =
    new Map<
      string,
      string
    >(
      getConfiguredOptions(
        field,
      ).map(
        (option) => [
          option.value,
          option.label,
        ],
      ),
    );

  if (
    Array.isArray(value)
  ) {
    if (
      value.length === 0
    ) {
      return "None selected";
    }

    return value
      .map(
        (item) =>
          optionLabels.get(
            item,
          ) ?? item,
      )
      .join(", ");
  }

  return (
    optionLabels.get(
      value,
    ) ?? value
  );
}

function createEmailSections(
  sections: SectionRow[],
  fields: FieldRow[],

  answers:
    Record<
      string,
      FieldAnswer
    >,

  recipient:
    | "shop"
    | "customer",
): ServiceEmailSection[] {
  const sectionMap =
    new Map(
      sections.map(
        (section) => [
          section.id,
          section,
        ],
      ),
    );

  const grouped =
    new Map<
      number,
      ServiceEmailSection
    >();

  for (
    const field
    of fields
  ) {
    const section =
      sectionMap.get(
        field.section_id,
      );

    if (
      !section ||
      section.visibility !==
        "visible" ||
      field.requirement ===
        "hidden"
    ) {
      continue;
    }

    const sectionIncluded =
      recipient === "shop"
        ? Boolean(
            section
              .include_in_shop_email,
          )
        : Boolean(
            section
              .include_in_customer_email,
          );

    const fieldIncluded =
      recipient === "shop"
        ? Boolean(
            field
              .include_in_shop_email,
          )
        : Boolean(
            field
              .include_in_customer_email,
          );

    if (
      !sectionIncluded ||
      !fieldIncluded
    ) {
      continue;
    }

    if (
      section.section_key ===
      "customer"
    ) {
      continue;
    }

    const answerKey =
      `${section.section_key}.${field.field_key}`;

    const existing =
      grouped.get(
        section.id,
      ) ?? {
        label:
          section.label,

        rows: [],
      };

    existing.rows.push({
      label:
        field.email_label
          ?.trim() ||
        field.label,

      value:
        formatAnswerValue(
          field,
          answers[
            answerKey
          ],
        ),
    });

    grouped.set(
      section.id,
      existing,
    );
  }

  return [...sections]
    .sort(
      (
        first,
        second,
      ) =>
        first.sort_order -
        second.sort_order,
    )
    .map(
      (section) =>
        grouped.get(
          section.id,
        ),
    )
    .filter(
      (
        section,
      ): section is
        ServiceEmailSection =>
        Boolean(
          section &&
          section.rows.length >
            0,
        ),
    );
}

async function createRequestAccessAction(
  env: Env,
  origin: string,
  requestNumber: string,
  shopCode: string,
  recipient:
    | "shop"
    | "customer",
  expiresAt: number,
): Promise<ServiceEmailAction> {
  const issuedAt =
    Math.floor(
      Date.now() / 1000,
    );

  const token =
    await createMagicLinkToken(
      env,
      {
        scope:
          "request:read",

        shopCode,
        requestNumber,
        recipient,
        issuedAt,
        expiresAt,
      },
    );

  return {
    label:
      recipient === "shop"
        ? "View request"
        : "View my request",

    url:
      createMagicLinkUrl(
        origin,

        `/shared/requests/${encodeURIComponent(
          requestNumber,
        )}`,

        token,
      ),

    primary: true,
  };
}

async function createShopRequestsAction(
  env: Env,
  origin: string,
  shopCode: string,
  expiresAt: number,
): Promise<ServiceEmailAction> {
  const issuedAt =
    Math.floor(
      Date.now() / 1000,
    );

  const token =
    await createMagicLinkToken(
      env,
      {
        scope:
          "shop-requests:read",

        shopCode,

        recipient:
          "shop",

        issuedAt,
        expiresAt,
      },
    );

  return {
    label:
      "View active requests",

    url:
      createMagicLinkUrl(
        origin,

        `/shared/shops/${encodeURIComponent(
          shopCode,
        )}/requests`,

        token,
      ),
  };
}

async function createFileAccessActions(
  env: Env,
  origin: string,
  requestNumber: string,
  shopCode: string,
  recipient:
    | "shop"
    | "customer",
  files:
    NotificationFileRow[],
  expiresAt: number,
): Promise<ServiceEmailAction[]> {
  const actions:
    ServiceEmailAction[] = [];

  for (
    const file
    of files
  ) {
    const issuedAt =
      Math.floor(
        Date.now() / 1000,
      );

    const token =
      await createMagicLinkToken(
        env,
        {
          scope:
            "file:read",

          shopCode,
          requestNumber,

          fileId:
            file.id,

          recipient,
          issuedAt,
          expiresAt,
        },
      );

    actions.push({
      label:
        `Download ${file.original_file_name}`,

      url:
        createMagicLinkUrl(
          origin,

          `/api/shared/files/${file.id}/download`,

          token,
        ),
    });
  }

  return actions;
}

async function createNotificationActions(
  env: Env,
  origin: string,
  requestNumber: string,
  shopCode: string,
  createdAt: string,
  files:
    NotificationFileRow[],
): Promise<{
  shop:
    ServiceEmailAction[];

  customer:
    ServiceEmailAction[];
}> {
  const expiresAt =
    calculateMagicLinkExpiration(
      createdAt,
      FILE_RETENTION_DAYS,
    );

  const [
    shopRequestAction,
    customerRequestAction,
    shopRequestsAction,
    shopFileActions,
    customerFileActions,
  ] =
    await Promise.all([
      createRequestAccessAction(
        env,
        origin,
        requestNumber,
        shopCode,
        "shop",
        expiresAt,
      ),

      createRequestAccessAction(
        env,
        origin,
        requestNumber,
        shopCode,
        "customer",
        expiresAt,
      ),

      createShopRequestsAction(
        env,
        origin,
        shopCode,
        expiresAt,
      ),

      createFileAccessActions(
        env,
        origin,
        requestNumber,
        shopCode,
        "shop",
        files,
        expiresAt,
      ),

      createFileAccessActions(
        env,
        origin,
        requestNumber,
        shopCode,
        "customer",
        files,
        expiresAt,
      ),
    ]);

  return {
    shop: [
      shopRequestAction,
      shopRequestsAction,
      ...shopFileActions,
    ],

    customer: [
      customerRequestAction,
      ...customerFileActions,
    ],
  };
}

async function deleteStoredFiles(
  env: Env,
  storedFiles:
    StoredFile[],
): Promise<void> {
  if (
    storedFiles.length ===
    0
  ) {
    return;
  }

  try {
    await env
      .GYAN_PRINT_FILES
      .delete(
        storedFiles.map(
          (storedFile) =>
            storedFile
              .storageKey,
        ),
      );
  } catch (error) {
    console.error(
      "Unable to remove service-request files:",
      error,
    );
  }
}

async function deleteCreatedRequest(
  env: Env,
  requestId: number,
): Promise<void> {
  try {
    await env.gyan_registry
      .prepare(
        `
          DELETE FROM
            service_requests

          WHERE id = ?
        `,
      )
      .bind(
        requestId,
      )
      .run();
  } catch (error) {
    console.error(
      "Unable to remove service request:",
      error,
    );
  }
}

async function handleCreateServiceRequest(
  request: Request,
  env: Env,
  shopCode: string,
  serviceCode: string,
): Promise<Response> {
  const requestUrl =
    new URL(
      request.url,
    );

  const publicOrigin =
    requestUrl.origin;

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
    shop.status !==
    "active"
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
          "This service is not currently available.",
      },
      403,
    );
  }

  let formData:
    FormData;

  try {
    formData =
      await request.formData();
  } catch {
    return createJsonResponse(
      {
        error:
          "The submitted form data could not be read.",
      },
      400,
    );
  }

  const metadataValue =
    formData.get(
      "metadata",
    );

  if (
    typeof metadataValue !==
      "string"
  ) {
    return createJsonResponse(
      {
        error:
          "Request metadata is missing.",
      },
      400,
    );
  }

  if (
    metadataValue.length >
    MAX_METADATA_LENGTH
  ) {
    return createJsonResponse(
      {
        error:
          "The submitted request information is too large.",
      },
      400,
    );
  }

  let metadata:
    SubmittedMetadata;

  try {
    metadata =
      JSON.parse(
        metadataValue,
      ) as
        SubmittedMetadata;
  } catch {
    return createJsonResponse(
      {
        error:
          "Request metadata is invalid.",
      },
      400,
    );
  }

  if (
    !Array.isArray(
      metadata.answers,
    )
  ) {
    return createJsonResponse(
      {
        error:
          "Request answers are missing.",
      },
      400,
    );
  }

  const {
    sections,
    fields,
  } =
    await loadFormSchema(
      env,
      service.id,
    );

  if (
    sections.length ===
      0 ||
    fields.length ===
      0
  ) {
    return createJsonResponse(
      {
        error:
          "This service does not have a request form configured.",
      },
      409,
    );
  }

  const visibleSectionMap =
    new Map<
      number,
      string
    >(
      sections
        .filter(
          (section) =>
            section.visibility ===
            "visible",
        )
        .map(
          (section) => [
            section.id,
            section.section_key,
          ],
        ),
    );

  const fieldMap =
    new Map<
      string,
      FieldRow
    >();

  for (
    const field
    of fields
  ) {
    const sectionKey =
      visibleSectionMap.get(
        field.section_id,
      );

    if (
      !sectionKey ||
      field.requirement ===
        "hidden"
    ) {
      continue;
    }

    fieldMap.set(
      `${sectionKey}.${field.field_key}`,
      field,
    );
  }

  const answers:
    Record<
      string,
      FieldAnswer
    > = {};

  for (
    const rawAnswer
    of metadata.answers
  ) {
    if (
      typeof rawAnswer !==
        "object" ||
      rawAnswer === null
    ) {
      return createJsonResponse(
        {
          error:
            "One or more request answers are invalid.",
        },
        400,
      );
    }

    const submittedAnswer =
      rawAnswer as
        SubmittedAnswer;

    const sectionKey =
      normalizeKey(
        submittedAnswer
          .sectionKey,
      );

    const fieldKey =
      normalizeKey(
        submittedAnswer
          .fieldKey,
      );

    const value =
      normalizeAnswerValue(
        submittedAnswer.value,
      );

    if (
      !sectionKey ||
      !fieldKey ||
      value === null
    ) {
      return createJsonResponse(
        {
          error:
            "One or more request answers are invalid.",
        },
        400,
      );
    }

    const answerKey =
      `${sectionKey}.${fieldKey}`;

    if (
      !fieldMap.has(
        answerKey,
      )
    ) {
      return createJsonResponse(
        {
          error:
            `Unknown form field: ${answerKey}`,
        },
        400,
      );
    }

    if (
      Object.hasOwn(
        answers,
        answerKey,
      )
    ) {
      return createJsonResponse(
        {
          error:
            `The field ${answerKey} was submitted more than once.`,
        },
        400,
      );
    }

    answers[
      answerKey
    ] = value;
  }

  const isOnlineRequest =
    service.workflow_type
      ?.trim()
      .toLowerCase() ===
      "online" ||
    service.workflow_type
      ?.trim()
      .toLowerCase() ===
      "remote" ||
    service.category
      ?.trim()
      .toLowerCase() ===
      "online" ||
    service.category
      ?.trim()
      .toLowerCase() ===
      "digital" ||
    service.category
      ?.trim()
      .toLowerCase() ===
      "nearby";

  const compactEmailEntry =
    isOnlineRequest
      ? [...fieldMap.entries()]
          .find(
            ([, field]) =>
              isEmailField(
                field,
              ),
          )
      : undefined;

  const compactEmailValue =
    compactEmailEntry
      ? answers[
          compactEmailEntry[0]
        ]
      : undefined;

  const compactHasValidEmail =
    typeof compactEmailValue ===
      "string" &&
    /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
      compactEmailValue.trim(),
    );

  for (
    const [
      answerKey,
      field,
    ]
    of fieldMap
  ) {
    const validationField =
      isOnlineRequest
        ? {
            ...field,

            requirement:
              isCustomerNameField(
                field,
              )
                ? "mandatory"
                : "optional",

            validation_json:
              compactHasValidEmail &&
              isPhoneLikeField(
                field,
              )
                ? null
                : field
                    .validation_json,
          }
        : field;

    const validationError =
      validateAnswer(
        validationField,
        answers[
          answerKey
        ],
      );

    if (
      validationError
    ) {
      return createJsonResponse(
        {
          error:
            validationError,
        },
        400,
      );
    }
  }

  const submittedFiles:
    {
      sectionKey: string;
      fieldKey: string;
      file: File;
    }[] = [];

  for (
    const [
      formKey,
      formValue,
    ]
    of formData.entries()
  ) {
    if (
      !formKey.startsWith(
        "file:",
      ) ||
      !(
        formValue instanceof
        File
      )
    ) {
      continue;
    }

    if (
      formValue.size ===
      0
    ) {
      continue;
    }

    const keyParts =
      formKey.split(":");

    if (
      keyParts.length !==
      3
    ) {
      return createJsonResponse(
        {
          error:
            "A submitted file field is invalid.",
        },
        400,
      );
    }

    const sectionKey =
      normalizeKey(
        keyParts[1],
      );

    const fieldKey =
      normalizeKey(
        keyParts[2],
      );

    const field =
      sectionKey &&
      fieldKey
        ? fieldMap.get(
            `${sectionKey}.${fieldKey}`,
          )
        : null;

    if (
      !sectionKey ||
      !fieldKey ||
      !field ||
      field.field_type !==
        "file"
    ) {
      return createJsonResponse(
        {
          error:
            "A file was submitted for an invalid field.",
        },
        400,
      );
    }

    submittedFiles.push({
      sectionKey,
      fieldKey,
      file:
        formValue,
    });
  }

  if (isOnlineRequest) {
    const fieldEntries =
      [...fieldMap.entries()];

    const nameEntry =
      fieldEntries.find(
        ([, field]) =>
          isCustomerNameField(
            field,
          ),
      );

    const descriptionEntry =
      fieldEntries.find(
        ([, field]) =>
          isRequestDescriptionField(
            field,
          ),
      );

    const contactEntries =
      fieldEntries.filter(
        ([, field]) =>
          isContactField(
            field,
          ),
      );

    const nameValue =
      nameEntry
        ? answers[
            nameEntry[0]
          ]
        : undefined;

    if (
      typeof nameValue !==
        "string" ||
      !nameValue.trim()
    ) {
      return createJsonResponse(
        {
          error:
            "Your name is required.",
        },
        400,
      );
    }

    const descriptionValue =
      descriptionEntry
        ? answers[
            descriptionEntry[0]
          ]
        : undefined;

    const hasDescription =
      typeof descriptionValue ===
        "string" &&
      descriptionValue.trim()
        .length > 0;

    const hasAttachment =
      submittedFiles.length > 0;

    if (
      !hasDescription &&
      !hasAttachment
    ) {
      return createJsonResponse(
        {
          error:
            "Describe what you need or attach at least one file.",
        },
        400,
      );
    }

    const hasValidEmail =
      contactEntries.some(
        ([
          answerKey,
          field,
        ]) => {
          if (
            !isEmailField(
              field,
            )
          ) {
            return false;
          }

          const value =
            answers[
              answerKey
            ];

          return (
            typeof value ===
              "string" &&
            /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
              value.trim(),
            )
          );
        },
      );

    const hasUsablePhone =
      contactEntries.some(
        ([
          answerKey,
          field,
        ]) => {
          if (
            !isPhoneLikeField(
              field,
            )
          ) {
            return false;
          }

          const value =
            answers[
              answerKey
            ];

          if (
            typeof value !==
              "string"
          ) {
            return false;
          }

          const digits =
            value.replace(
              /\D/g,
              "",
            );

          return (
            digits.length >=
            7
          );
        },
      );

    if (
      !hasValidEmail &&
      !hasUsablePhone
    ) {
      return createJsonResponse(
        {
          error:
            "Provide a valid phone / WhatsApp number or email address.",
        },
        400,
      );
    }
  }

  if (
    submittedFiles.length >
    MAX_FILES
  ) {
    return createJsonResponse(
      {
        error:
          `A request may contain up to ${MAX_FILES} files.`,
      },
      400,
    );
  }

  for (
    const [
      answerKey,
      field,
    ]
    of fieldMap
  ) {
    if (
      field.field_type !==
        "file" ||
      field.requirement !==
        "mandatory" ||
      isOnlineRequest
    ) {
      continue;
    }

    const [
      sectionKey,
      fieldKey,
    ] =
      answerKey.split(".");

    const hasFile =
      submittedFiles.some(
        (item) =>
          item.sectionKey ===
            sectionKey &&
          item.fieldKey ===
            fieldKey,
      );

    if (!hasFile) {
      return createJsonResponse(
        {
          error:
            `${field.label} is required.`,
        },
        400,
      );
    }
  }

  const totalFileSize =
    submittedFiles.reduce(
      (
        total,
        item,
      ) =>
        total +
        item.file.size,
      0,
    );

  if (
    totalFileSize >
    MAX_TOTAL_FILE_SIZE
  ) {
    return createJsonResponse(
      {
        error:
          "The total upload size cannot exceed 25 MB.",
      },
      400,
    );
  }

  const storageCapacity =
    await assertUploadCapacity(
      env,
      totalFileSize,
    );

  if (
    !storageCapacity.allowed
  ) {
    return createJsonResponse(
      {
        error:
          storageCapacity.error,

        storage: {
          state:
            "stopped",

          usedBytes:
            storageCapacity
              .usedBytes,

          projectedBytes:
            storageCapacity
              .projectedBytes,

          stopBytes:
            storageCapacity
              .stopBytes,
        },
      },
      storageCapacity.status,
    );
  }

  const customerName =
    getStringAnswerByFieldKeys(
      answers,
      [
        "customer_name",
        "name",
      ],
    );

  const phoneOrWhatsApp =
    getStringAnswerByFieldKeys(
      answers,
      [
        "phone_or_whatsapp",
      ],
    );

  const phoneNumber =
    getStringAnswerByFieldKeys(
      answers,
      [
        "phone_number",
        "phone",
        "mobile_number",
        "mobile",
      ],
    ) ??
    phoneOrWhatsApp;

  const emailAddress =
    getStringAnswerByFieldKeys(
      answers,
      [
        "email_address",
        "email",
      ],
    );

  const whatsAppNumber =
    getStringAnswerByFieldKeys(
      answers,
      [
        "whatsapp_number",
        "whatsapp",
      ],
    ) ??
    phoneOrWhatsApp;

  const whatsAppConsent =
    Object.entries(
      answers,
    ).some(
      ([
        answerKey,
        value,
      ]) =>
        answerKey
          .split(".")
          .at(-1) ===
          "whatsapp_consent" &&
        value === true,
    );

  const requestNumber =
    generateRequestNumber(
      shopCode,
      serviceCode,
    );

  let createdRequest:
    CreatedRequestRow | null =
      null;

  const gyanAccountId =
    await currentGyanAccountId(
      request,
      env.gyan_registry,
    );

  const storedFiles:
    StoredFile[] = [];

  try {
    createdRequest =
      await env.gyan_registry
        .prepare(
          `
            INSERT INTO service_requests (
              request_number,
              shop_code,
              service_id,
              customer_name,
              phone_number,
              email_address,
              whatsapp_number,
              whatsapp_consent,
              status,
              details_json,
              gyan_account_id
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
              'submitted',
              ?,
              ?
            )

            RETURNING
              id,
              request_number,
              status,
              created_at
          `,
        )
        .bind(
          requestNumber,
          shopCode,
          service.id,
          customerName,
          phoneNumber,
          emailAddress,
          whatsAppNumber,

          whatsAppConsent
            ? 1
            : 0,

          JSON.stringify(
            answers,
          ),

          gyanAccountId,
        )
        .first<CreatedRequestRow>();

    if (!createdRequest) {
      throw new Error(
        "The service request could not be created.",
      );
    }

    for (
      let index = 0;
      index <
        submittedFiles.length;
      index += 1
    ) {
      const item =
        submittedFiles[
          index
        ];

      const contentType =
        item.file.type ||
        "application/octet-stream";

      const storageKey =
        createStorageKey(
          shopCode,
          requestNumber,
          item.sectionKey,
          item.fieldKey,
          item.file,
          index,
        );

      const storedObject =
        await env
          .GYAN_PRINT_FILES
          .put(
            storageKey,
            item.file.stream(),
            {
              httpMetadata: {
                contentType,
              },

              customMetadata: {
                requestNumber,
                shopCode,
                serviceCode,

                sectionKey:
                  item.sectionKey,

                fieldKey:
                  item.fieldKey,

                originalFileName:
                  item.file.name,
              },
            },
          );

      if (!storedObject) {
        throw new Error(
          `The file ${item.file.name} could not be stored.`,
        );
      }

      storedFiles.push({
        ...item,
        storageKey,
        contentType,
      });
    }

    if (
      storedFiles.length >
      0
    ) {
      await env.gyan_registry
        .batch(
          storedFiles.map(
            (storedFile) =>
              env.gyan_registry
                .prepare(
                  `
                    INSERT INTO service_request_files (
                      service_request_id,
                      section_key,
                      field_key,
                      original_file_name,
                      content_type,
                      file_size,
                      storage_key,
                      storage_status
                    )
                    VALUES (
                      ?,
                      ?,
                      ?,
                      ?,
                      ?,
                      ?,
                      ?,
                      'stored'
                    )
                  `,
                )
                .bind(
                  createdRequest!.id,

                  storedFile
                    .sectionKey,

                  storedFile
                    .fieldKey,

                  storedFile
                    .file
                    .name,

                  storedFile
                    .contentType,

                  storedFile
                    .file
                    .size,

                  storedFile
                    .storageKey,
                ),
          ),
        );
    }

    await addStoredBytes(
      env,
      totalFileSize,
    );
  } catch (error) {
    console.error(
      "Service request creation failed:",
      error,
    );

    await deleteStoredFiles(
      env,
      storedFiles,
    );

    if (
      createdRequest
    ) {
      await deleteCreatedRequest(
        env,
        createdRequest.id,
      );
    }

    return createJsonResponse(
      {
        error:
          "The service request or its files could not be stored.",
      },
      500,
    );
  }

  const notificationFileRows =
    await loadNotificationFiles(
      env,
      createdRequest.id,
    );

  const notificationFiles =
    notificationFileRows.map(
      (file) => ({
        name:
          file.original_file_name,

        size:
          file.file_size,
      }),
    );

  const shopEmailSections =
    createEmailSections(
      sections,
      fields,
      answers,
      "shop",
    );

  const customerEmailSections =
    createEmailSections(
      sections,
      fields,
      answers,
      "customer",
    );

  let notificationActions: {
    shop:
      ServiceEmailAction[];

    customer:
      ServiceEmailAction[];
  } = {
    shop: [],
    customer: [],
  };

  try {
    notificationActions =
      await createNotificationActions(
        env,
        publicOrigin,

        createdRequest
          .request_number,

        shop.code,

        createdRequest
          .created_at,

        notificationFileRows,
      );
  } catch (error) {
    console.error(
      "Magic-link creation failed:",
      error,
    );
  }

  let notificationResults:
    Awaited<
      ReturnType<
        typeof sendServiceRequestNotifications
      >
    > = [];

  try {
    notificationResults =
      await sendServiceRequestNotifications(
        env,
        {
          shop: {
            code:
              shop.code,

            name:
              shop.name,

            email:
              shop.email_address,
          },

          service: {
            code:
              service.service_code,

            name:
              service.name,
          },

          request: {
            requestNumber:
              createdRequest
                .request_number,

            status:
              createdRequest
                .status,

            createdAt:
              createdRequest
                .created_at,
          },

          customer: {
            name:
              customerName,

            phone:
              phoneNumber,

            whatsApp:
              whatsAppNumber,

            email:
              emailAddress,
          },

          files:
            notificationFiles,

          sections: {
            shop:
              shopEmailSections,

            customer:
              customerEmailSections,
          },

          shopActions:
            notificationActions.shop,

          customerActions:
            notificationActions.customer,

          adminActions: [
            {
              label:
                "All Requests",

              url:
                `${publicOrigin}/admin`,
            },
            {
              label:
                "All Shops",

              url:
                `${publicOrigin}/admin/shops`,
            },
            {
              label:
                "Manage Services",

              url:
                `${publicOrigin}/admin/services`,
            },
          ],

          retentionDays:
            FILE_RETENTION_DAYS,
        },
      );
  } catch (error) {
    console.error(
      "Service request notifications failed:",
      error,
    );
  }

  return createJsonResponse(
    {
      request: {
        requestNumber:
          createdRequest
            .request_number,

        status:
          createdRequest.status,

        createdAt:
          createdRequest
            .created_at,

        serviceCode:
          service.service_code,

        serviceName:
          service.name,

        fileCount:
          storedFiles.length,
      },

      notifications:
        notificationResults,

      storage: {
        state:
          storageCapacity
            .warningActive
            ? "warning"
            : "normal",

        warningActive:
          storageCapacity
            .warningActive,

        projectedBytes:
          storageCapacity
            .projectedBytes,

        stopBytes:
          storageCapacity
            .stopBytes,
      },
    },
    201,
  );
}

export async function handleServiceRequestsRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  const match =
    url.pathname.match(
      /^\/api\/shops\/([A-Za-z0-9]{4})\/services\/([A-Za-z0-9_]{2,50})\/requests$/,
    );

  if (!match) {
    return null;
  }

  if (
    request.method !==
    "POST"
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

  return handleCreateServiceRequest(
    request,
    env,
    shopCode,
    serviceCode,
  );
}