import {
  createMagicLinkToken,
  createMagicLinkUrl,
  verifyMagicLinkToken,
  type MagicLinkPayload,
} from "./magicLinks";

interface RequestRow {
  id: number;
  request_number: string;

  shop_code: string;
  shop_name: string;

  service_code: string;
  service_name: string;

  customer_name:
    | string
    | null;

  phone_number:
    | string
    | null;

  email_address:
    | string
    | null;

  whatsapp_number:
    | string
    | null;

  status: string;
  details_json: string;

  estimated_amount_paise:
    | number
    | null;

  created_at: string;
  updated_at: string;
}

interface RequestFileRow {
  id: number;
  service_request_id: number;

  section_key: string;
  field_key: string;

  original_file_name: string;
  content_type: string;
  file_size: number;

  storage_key: string;
  storage_status: string;

  created_at: string;
}

interface ShopRequestListRow {
  request_number: string;

  service_code: string;
  service_name: string;

  customer_name:
    | string
    | null;

  status: string;

  file_count: number;

  created_at: string;
  updated_at: string;
}

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

function normalizeRequestNumber(
  value: string,
): string | null {
  const normalized =
    value
      .trim()
      .toUpperCase();

  return /^[A-Z0-9_-]{8,120}$/.test(
    normalized,
  )
    ? normalized
    : null;
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

function normalizeFileId(
  value: string,
): number | null {
  if (
    !/^\d+$/.test(value)
  ) {
    return null;
  }

  const id =
    Number(value);

  return (
    Number.isSafeInteger(id) &&
    id > 0
  )
    ? id
    : null;
}

function safelyParseJson(
  value: string,
): Record<
  string,
  unknown
> {
  try {
    const parsed =
      JSON.parse(value);

    if (
      typeof parsed ===
        "object" &&
      parsed !== null &&
      !Array.isArray(parsed)
    ) {
      return parsed as
        Record<
          string,
          unknown
        >;
    }
  } catch {
    // Return an empty object below.
  }

  return {};
}

function calculateExpirationDate(
  createdAt: string,
): Date | null {
  const createdDate =
    new Date(createdAt);

  if (
    Number.isNaN(
      createdDate.getTime(),
    )
  ) {
    return null;
  }

  return new Date(
    createdDate.getTime() +
      FILE_RETENTION_DAYS *
        24 *
        60 *
        60 *
        1000,
  );
}

function requestHasExpired(
  createdAt: string,
): boolean {
  const expirationDate =
    calculateExpirationDate(
      createdAt,
    );

  if (!expirationDate) {
    return true;
  }

  return (
    expirationDate.getTime() <=
    Date.now()
  );
}

function readToken(
  url: URL,
): string | null {
  const token =
    url.searchParams
      .get("token")
      ?.trim();

  return token || null;
}

async function requireMagicLink(
  env: Env,
  url: URL,
): Promise<
  | {
      payload:
        MagicLinkPayload;
    }
  | {
      response:
        Response;
    }
> {
  const token =
    readToken(url);

  if (!token) {
    return {
      response:
        createJsonResponse(
          {
            error:
              "The secure access token is missing.",
          },
          401,
        ),
    };
  }

  const verified =
    await verifyMagicLinkToken(
      env,
      token,
    );

  if (
    !verified.valid ||
    !verified.payload
  ) {
    return {
      response:
        createJsonResponse(
          {
            error:
              verified.error ??
              "The secure access link is invalid.",
          },
          401,
        ),
    };
  }

  return {
    payload:
      verified.payload,
  };
}

async function loadRequest(
  env: Env,
  requestNumber: string,
): Promise<RequestRow | null> {
  return env.gyan_registry
    .prepare(
      `
        SELECT
          sr.id,
          sr.request_number,

          sr.shop_code,
          sh.name AS shop_name,

          s.service_code,
          s.name AS service_name,

          sr.customer_name,
          sr.phone_number,
          sr.email_address,
          sr.whatsapp_number,

          sr.status,
          sr.details_json,

          sr.estimated_amount_paise,

          sr.created_at,
          sr.updated_at

        FROM service_requests sr

        INNER JOIN shops sh
          ON sh.code =
            sr.shop_code

        INNER JOIN services s
          ON s.id =
            sr.service_id

        WHERE
          sr.request_number = ?

        LIMIT 1
      `,
    )
    .bind(
      requestNumber,
    )
    .first<RequestRow>();
}

async function loadRequestFiles(
  env: Env,
  requestId: number,
): Promise<
  RequestFileRow[]
> {
  const result =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            id,
            service_request_id,

            section_key,
            field_key,

            original_file_name,
            content_type,
            file_size,

            storage_key,
            storage_status,

            created_at

          FROM service_request_files

          WHERE
            service_request_id = ?

          ORDER BY
            id ASC
        `,
      )
      .bind(
        requestId,
      )
      .all<RequestFileRow>();

  return result.results;
}

function verifyRequestAccess(
  payload:
    MagicLinkPayload,

  requestRow:
    RequestRow,
): Response | null {
  if (
    payload.scope !==
    "request:read"
  ) {
    return createJsonResponse(
      {
        error:
          "This access link cannot view a request.",
      },
      403,
    );
  }

  if (
    payload.shopCode !==
    requestRow.shop_code
  ) {
    return createJsonResponse(
      {
        error:
          "This access link belongs to another shop.",
      },
      403,
    );
  }

  if (
    payload.requestNumber !==
    requestRow.request_number
  ) {
    return createJsonResponse(
      {
        error:
          "This access link belongs to another request.",
      },
      403,
    );
  }

  return null;
}

async function createSharedFileDownloadUrl(
  env: Env,
  origin: string,

  requestRow:
    RequestRow,

  file:
    RequestFileRow,

  recipient:
    | "shop"
    | "customer",

  expiresAt: number,
): Promise<string> {
  const token =
    await createMagicLinkToken(
      env,
      {
        scope:
          "file:read",

        shopCode:
          requestRow.shop_code,

        requestNumber:
          requestRow.request_number,

        fileId:
          file.id,

        recipient,

        issuedAt:
          Math.floor(
            Date.now() /
              1000,
          ),

        expiresAt,
      },
    );

  return createMagicLinkUrl(
    origin,

    `/api/shared/files/${file.id}/download`,

    token,
  );
}

async function handleGetSharedRequest(
  env: Env,
  url: URL,
  requestNumber: string,
): Promise<Response> {
  const authentication =
    await requireMagicLink(
      env,
      url,
    );

  if (
    "response" in
    authentication
  ) {
    return authentication.response;
  }

  const requestRow =
    await loadRequest(
      env,
      requestNumber,
    );

  if (!requestRow) {
    return createJsonResponse(
      {
        error:
          "Request not found.",
      },
      404,
    );
  }

  const accessError =
    verifyRequestAccess(
      authentication.payload,
      requestRow,
    );

  if (accessError) {
    return accessError;
  }

  const expirationDate =
    calculateExpirationDate(
      requestRow.created_at,
    );

  const files =
    await loadRequestFiles(
      env,
      requestRow.id,
    );

  const filesExpired =
    requestHasExpired(
      requestRow.created_at,
    );

  const expiresAtSeconds =
    authentication
      .payload
      .expiresAt;

  const filesWithDownloadUrls =
    await Promise.all(
      files.map(
        async (
          file,
        ) => {
          const available =
            !filesExpired &&
            file.storage_status ===
              "stored";

          let downloadUrl:
            | string
            | null =
              null;

          if (available) {
            try {
              downloadUrl =
                await createSharedFileDownloadUrl(
                  env,
                  url.origin,
                  requestRow,
                  file,
                  authentication
                    .payload
                    .recipient,
                  expiresAtSeconds,
                );
            } catch (error) {
              console.error(
                "Unable to create shared file link:",
                error,
              );
            }
          }

          return {
            id:
              file.id,

            sectionKey:
              file.section_key,

            fieldKey:
              file.field_key,

            name:
              file.original_file_name,

            contentType:
              file.content_type,

            size:
              file.file_size,

            status:
              filesExpired
                ? "expired"
                : file.storage_status,

            available,

            downloadUrl,
          };
        },
      ),
    );

  return createJsonResponse({
    access: {
      recipient:
        authentication
          .payload
          .recipient,

      readOnly: true,
    },

    request: {
      requestNumber:
        requestRow
          .request_number,

      status:
        requestRow.status,

      createdAt:
        requestRow
          .created_at,

      updatedAt:
        requestRow
          .updated_at,

      estimatedAmountPaise:
        requestRow
          .estimated_amount_paise,

      shop: {
        code:
          requestRow
            .shop_code,

        name:
          requestRow
            .shop_name,
      },

      service: {
        code:
          requestRow
            .service_code,

        name:
          requestRow
            .service_name,
      },

      customer: {
        name:
          requestRow
            .customer_name,

        phone:
          requestRow
            .phone_number,

        email:
          requestRow
            .email_address,

        whatsApp:
          requestRow
            .whatsapp_number,
      },

      answers:
        safelyParseJson(
          requestRow
            .details_json,
        ),

      retention: {
        days:
          FILE_RETENTION_DAYS,

        expiresAt:
          expirationDate
            ?.toISOString() ??
          null,

        filesExpired,
      },

      files:
        filesWithDownloadUrls,
    },
  });
}

async function handleDownloadSharedFile(
  env: Env,
  url: URL,
  fileId: number,
): Promise<Response> {
  const authentication =
    await requireMagicLink(
      env,
      url,
    );

  if (
    "response" in
    authentication
  ) {
    return authentication.response;
  }

  const payload =
    authentication.payload;

  if (
    payload.scope !==
    "file:read"
  ) {
    return createJsonResponse(
      {
        error:
          "This access link cannot download files.",
      },
      403,
    );
  }

  if (
    payload.fileId !==
    fileId
  ) {
    return createJsonResponse(
      {
        error:
          "This access link belongs to another file.",
      },
      403,
    );
  }

  const fileRow =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            srf.id,
            srf.service_request_id,

            srf.section_key,
            srf.field_key,

            srf.original_file_name,
            srf.content_type,
            srf.file_size,

            srf.storage_key,
            srf.storage_status,

            srf.created_at

          FROM service_request_files srf

          WHERE srf.id = ?

          LIMIT 1
        `,
      )
      .bind(
        fileId,
      )
      .first<RequestFileRow>();

  if (!fileRow) {
    return createJsonResponse(
      {
        error:
          "File not found.",
      },
      404,
    );
  }

  const requestRow =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            sr.id,
            sr.request_number,

            sr.shop_code,
            sh.name AS shop_name,

            s.service_code,
            s.name AS service_name,

            sr.customer_name,
            sr.phone_number,
            sr.email_address,
            sr.whatsapp_number,

            sr.status,
            sr.details_json,

            sr.estimated_amount_paise,

            sr.created_at,
            sr.updated_at

          FROM service_requests sr

          INNER JOIN shops sh
            ON sh.code =
              sr.shop_code

          INNER JOIN services s
            ON s.id =
              sr.service_id

          WHERE sr.id = ?

          LIMIT 1
        `,
      )
      .bind(
        fileRow
          .service_request_id,
      )
      .first<RequestRow>();

  if (!requestRow) {
    return createJsonResponse(
      {
        error:
          "The file request no longer exists.",
      },
      404,
    );
  }

  if (
    payload.shopCode !==
      requestRow.shop_code ||
    payload.requestNumber !==
      requestRow.request_number
  ) {
    return createJsonResponse(
      {
        error:
          "This access link belongs to another request.",
      },
      403,
    );
  }

  if (
    requestHasExpired(
      requestRow.created_at,
    )
  ) {
    return createJsonResponse(
      {
        error:
          "This file has expired and is no longer available.",
      },
      410,
    );
  }

  if (
    fileRow.storage_status !==
    "stored"
  ) {
    return createJsonResponse(
      {
        error:
          "This file is no longer available.",
      },
      410,
    );
  }

  const object =
    await env
      .GYAN_PRINT_FILES
      .get(
        fileRow.storage_key,
      );

  if (!object) {
    return createJsonResponse(
      {
        error:
          "This file has expired or could not be found.",
      },
      410,
    );
  }

  const headers =
    new Headers();

  object.writeHttpMetadata(
    headers,
  );

  headers.set(
    "content-type",

    fileRow.content_type ||
      "application/octet-stream",
  );

  headers.set(
    "content-length",

    String(
      fileRow.file_size,
    ),
  );

  headers.set(
    "content-disposition",

    `attachment; filename*=UTF-8''${encodeURIComponent(
      fileRow.original_file_name,
    )}`,
  );

  headers.set(
    "cache-control",
    "private, no-store",
  );

  headers.set(
    "x-content-type-options",
    "nosniff",
  );

  return new Response(
    object.body,
    {
      status: 200,
      headers,
    },
  );
}

async function handleGetShopRequests(
  env: Env,
  url: URL,
  shopCode: string,
): Promise<Response> {
  const authentication =
    await requireMagicLink(
      env,
      url,
    );

  if (
    "response" in
    authentication
  ) {
    return authentication.response;
  }

  const payload =
    authentication.payload;

  if (
    payload.scope !==
    "shop-requests:read"
  ) {
    return createJsonResponse(
      {
        error:
          "This access link cannot view the shop request list.",
      },
      403,
    );
  }

  if (
    payload.recipient !==
    "shop"
  ) {
    return createJsonResponse(
      {
        error:
          "Only the shop owner may use this access link.",
      },
      403,
    );
  }

  if (
    payload.shopCode !==
    shopCode
  ) {
    return createJsonResponse(
      {
        error:
          "This access link belongs to another shop.",
      },
      403,
    );
  }

  const shop =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            code,
            name

          FROM shops

          WHERE code = ?

          LIMIT 1
        `,
      )
      .bind(
        shopCode,
      )
      .first<{
        code: string;
        name: string;
      }>();

  if (!shop) {
    return createJsonResponse(
      {
        error:
          "Shop not found.",
      },
      404,
    );
  }

  const retentionBoundary =
    new Date(
      Date.now() -
        FILE_RETENTION_DAYS *
          24 *
          60 *
          60 *
          1000,
    ).toISOString();

  const result =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            sr.request_number,

            s.service_code,
            s.name AS service_name,

            sr.customer_name,

            sr.status,

            COUNT(
              srf.id
            ) AS file_count,

            sr.created_at,
            sr.updated_at

          FROM service_requests sr

          INNER JOIN services s
            ON s.id =
              sr.service_id

          LEFT JOIN service_request_files srf
            ON srf.service_request_id =
              sr.id

          WHERE
            sr.shop_code = ?

            AND sr.created_at >= ?

          GROUP BY
            sr.id,
            sr.request_number,
            s.service_code,
            s.name,
            sr.customer_name,
            sr.status,
            sr.created_at,
            sr.updated_at

          ORDER BY
            sr.created_at DESC

          LIMIT 200
        `,
      )
      .bind(
        shopCode,
        retentionBoundary,
      )
      .all<ShopRequestListRow>();

  return createJsonResponse({
    shop: {
      code:
        shop.code,

      name:
        shop.name,
    },

    retentionDays:
      FILE_RETENTION_DAYS,

    requests:
      result.results.map(
        (
          requestRow,
        ) => ({
          requestNumber:
            requestRow
              .request_number,

          service: {
            code:
              requestRow
                .service_code,

            name:
              requestRow
                .service_name,
          },

          customerName:
            requestRow
              .customer_name,

          status:
            requestRow.status,

          fileCount:
            Number(
              requestRow
                .file_count,
            ),

          createdAt:
            requestRow
              .created_at,

          updatedAt:
            requestRow
              .updated_at,
        }),
      ),
  });
}

export async function handleSharedRequestsRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  const requestMatch =
    url.pathname.match(
      /^\/api\/shared\/requests\/([A-Za-z0-9_-]{8,120})$/,
    );

  if (requestMatch) {
    if (
      request.method !==
      "GET"
    ) {
      return createJsonResponse(
        {
          error:
            "Method not allowed.",
        },
        405,
      );
    }

    const requestNumber =
      normalizeRequestNumber(
        requestMatch[1],
      );

    if (!requestNumber) {
      return createJsonResponse(
        {
          error:
            "Invalid request number.",
        },
        400,
      );
    }

    return handleGetSharedRequest(
      env,
      url,
      requestNumber,
    );
  }

  const fileMatch =
    url.pathname.match(
      /^\/api\/shared\/files\/(\d+)\/download$/,
    );

  if (fileMatch) {
    if (
      request.method !==
      "GET"
    ) {
      return createJsonResponse(
        {
          error:
            "Method not allowed.",
        },
        405,
      );
    }

    const fileId =
      normalizeFileId(
        fileMatch[1],
      );

    if (!fileId) {
      return createJsonResponse(
        {
          error:
            "Invalid file identifier.",
        },
        400,
      );
    }

    return handleDownloadSharedFile(
      env,
      url,
      fileId,
    );
  }

  const shopMatch =
    url.pathname.match(
      /^\/api\/shared\/shops\/([A-Za-z0-9]{4})\/requests$/,
    );

  if (shopMatch) {
    if (
      request.method !==
      "GET"
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
        shopMatch[1],
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

    return handleGetShopRequests(
      env,
      url,
      shopCode,
    );
  }

  return null;
}