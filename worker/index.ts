import {
  handleAdminAuthRoute,
} from "./adminAuth";

import {
  handleAdminServicesRoute,
} from "./adminServices";

import {
  handleAdminShopsRoute,
} from "./adminShops";

import {
  handlePrintRequestsRoute,
} from "./printRequests";

import {
  handleServiceCatalogRoute,
} from "./serviceCatalog";

import {
  reconcileExpiredStorage,
} from "./storageGuard";

import {
  handleAdminStorageRoute,
} from "./adminStorage";

interface RegisterShopRequest {
  code?: unknown;
  name?: unknown;
  ownerName?: unknown;
  phoneNumber?: unknown;
  whatsAppNumber?: unknown;
  emailAddress?: unknown;
  addressLine?: unknown;
  city?: unknown;
  state?: unknown;
  postalCode?: unknown;
}

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

  return /^[A-Z0-9]{4}$/.test(
    normalized,
  )
    ? normalized
    : null;
}

function normalizeRequiredText(
  value: unknown,
): string | null {
  if (
    typeof value !== "string"
  ) {
    return null;
  }

  const normalized =
    value.trim();

  return normalized.length > 0
    ? normalized
    : null;
}

function normalizeOptionalText(
  value: unknown,
): string | null {
  if (
    typeof value !== "string"
  ) {
    return null;
  }

  const normalized =
    value.trim();

  return normalized.length > 0
    ? normalized
    : null;
}

function mapShopRow(
  row: ShopRow,
) {
  return {
    code: row.code,
    name: row.name,

    ownerName:
      row.owner_name,

    phoneNumber:
      row.phone_number,

    whatsAppNumber:
      row.whatsapp_number ?? "",

    emailAddress:
      row.email_address ?? "",

    addressLine:
      row.address_line,

    city: row.city,
    state: row.state,

    postalCode:
      row.postal_code,

    status: row.status,

    createdAt:
      row.created_at,

    updatedAt:
      row.updated_at,
  };
}

async function findShopByCode(
  env: Env,
  code: string,
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
    .bind(code)
    .first<ShopRow>();
}

async function handleGetShop(
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
    await findShopByCode(
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

  return createJsonResponse({
    shop:
      mapShopRow(shop),
  });
}

async function handleRegisterShop(
  request: Request,
  env: Env,
): Promise<Response> {
  let requestBody:
    RegisterShopRequest;

  try {
    requestBody =
      (await request.json()) as
        RegisterShopRequest;
  } catch {
    return createJsonResponse(
      {
        error:
          "Request body must be valid JSON.",
      },
      400,
    );
  }

  const code =
    normalizeShopCode(
      requestBody.code,
    );

  const name =
    normalizeRequiredText(
      requestBody.name,
    );

  const ownerName =
    normalizeRequiredText(
      requestBody.ownerName,
    );

  const phoneNumber =
    normalizeRequiredText(
      requestBody.phoneNumber,
    );

  const whatsAppNumber =
    normalizeOptionalText(
      requestBody.whatsAppNumber,
    );

  const emailAddress =
    normalizeOptionalText(
      requestBody.emailAddress,
    );

  const addressLine =
    normalizeRequiredText(
      requestBody.addressLine,
    );

  const city =
    normalizeRequiredText(
      requestBody.city,
    );

  const state =
    normalizeRequiredText(
      requestBody.state,
    );

  const postalCode =
    normalizeRequiredText(
      requestBody.postalCode,
    );

  if (
    !code ||
    !name ||
    !ownerName ||
    !phoneNumber ||
    !addressLine ||
    !city ||
    !state ||
    !postalCode
  ) {
    return createJsonResponse(
      {
        error:
          "Shop code, shop name, owner, phone and address are required.",
      },
      400,
    );
  }

  const existingShop =
    await env.gyan_registry
      .prepare(
        `
          SELECT code

          FROM shops

          WHERE code = ?

          LIMIT 1
        `,
      )
      .bind(code)
      .first<{
        code: string;
      }>();

  if (existingShop) {
    return createJsonResponse(
      {
        error:
          "This shop code is already registered. Please generate another code.",
      },
      409,
    );
  }

  try {
    await env.gyan_registry
      .prepare(
        `
          INSERT INTO shops (
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
            status
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
            'active'
          )
        `,
      )
      .bind(
        code,
        name,
        ownerName,
        phoneNumber,
        whatsAppNumber,
        emailAddress,
        addressLine,
        city,
        state,
        postalCode,
      )
      .run();
  } catch (error) {
    console.error(
      "Shop registration failed:",
      error,
    );

    return createJsonResponse(
      {
        error:
          "The shop could not be registered.",
      },
      500,
    );
  }

  const createdShop =
    await findShopByCode(
      env,
      code,
    );

  if (!createdShop) {
    return createJsonResponse(
      {
        error:
          "The shop was saved but could not be loaded.",
      },
      500,
    );
  }

  return createJsonResponse(
    {
      shop:
        mapShopRow(
          createdShop,
        ),
    },
    201,
  );
}

async function handleApiRequest(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  /*
   * Administrator authentication.
   */
  const adminAuthResponse =
    await handleAdminAuthRoute(
      request,
      env,
      url,
    );

  if (adminAuthResponse) {
    return adminAuthResponse;
  }

  /*
   * Global service administration.
   */
  const adminServicesResponse =
    await handleAdminServicesRoute(
      request,
      env,
      url,
    );

  if (adminServicesResponse) {
    return adminServicesResponse;
  }

  /*
   * Shop administration and overrides.
   */
  const adminShopsResponse =
    await handleAdminShopsRoute(
      request,
      env,
      url,
    );

  if (adminShopsResponse) {
    return adminShopsResponse;
  }

  const adminStorageResponse =
  await handleAdminStorageRoute(
    request,
    env,
    url,
  );

if (adminStorageResponse) {
  return adminStorageResponse;
}

  /*
   * Public service catalogs.
   */
  const serviceCatalogResponse =
    await handleServiceCatalogRoute(
      request,
      env,
      url,
    );

  if (serviceCatalogResponse) {
    return serviceCatalogResponse;
  }

  /*
   * Print-order creation.
   */
  const printRequestsResponse =
    await handlePrintRequestsRoute(
      request,
      env,
      url,
    );

  if (printRequestsResponse) {
    return printRequestsResponse;
  }

  if (
    request.method === "GET" &&
    url.pathname ===
      "/api/health"
  ) {
    return createJsonResponse({
      status: "ok",

      service:
        "GYAN Cloud Shop Registry",
    });
  }

  if (
    request.method === "POST" &&
    url.pathname ===
      "/api/shops"
  ) {
    return handleRegisterShop(
      request,
      env,
    );
  }

  const shopRouteMatch =
    url.pathname.match(
      /^\/api\/shops\/([A-Za-z0-9]{4})$/,
    );

  if (
    request.method === "GET" &&
    shopRouteMatch
  ) {
    return handleGetShop(
      env,
      shopRouteMatch[1],
    );
  }

  return createJsonResponse(
    {
      error:
        "API route not found.",
    },
    404,
  );
}

export default {
  async fetch(
    request: Request,
    env: Env,
  ): Promise<Response> {
    const url =
      new URL(request.url);

    try {
      /*
       * API routes must be handled before
       * the static-asset fallback.
       *
       * Otherwise /api/services may receive
       * index.html from the SPA fallback.
       */
      if (
        url.pathname.startsWith(
          "/api/",
        )
      ) {
        return await handleApiRequest(
          request,
          env,
          url,
        );
      }

      return env.ASSETS.fetch(
        request,
      );
    } catch (error) {
      console.error(
        "Unhandled Worker error:",
        error,
      );

      return createJsonResponse(
        {
          error:
            "An unexpected server error occurred.",
        },
        500,
      );
    }
  },

  async scheduled(
    controller:
      ScheduledController,
    env: Env,
    context:
      ExecutionContext,
  ): Promise<void> {
    context.waitUntil(
      reconcileExpiredStorage(
        env,
      )
        .then((result) => {
          console.log(
            "Storage reconciliation completed:",
            {
              cron:
                controller.cron,

              expiredFileCount:
                result.expiredFileCount,

              removedBytes:
                result.removedBytes,
            },
          );
        })
        .catch((error) => {
          console.error(
            "Storage reconciliation failed:",
            error,
          );
        }),
    );
  },
};