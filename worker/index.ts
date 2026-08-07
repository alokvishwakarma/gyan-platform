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

import {
  handleAdminServiceFormsRoute,
} from "./adminServiceForms";

import {
  handleServiceFormsRoute,
} from "./serviceForms";

import {
  handleServiceRequestsRoute,
} from "./serviceRequests";

import {
  handleSharedRequestsRoute,
} from "./sharedRequests";

import {
  handleNearbyShopsRoute,
} from "./nearbyShops";

import {
  handleLocationHintRoute,
} from "./locationHint";

import {
  handlePuzzleRoute,
} from "./puzzle/puzzleRoutes";

import {
  handlePuzzleAdminRoute,
} from "./puzzle/puzzleAdminRoutes";

import {
  handlePuzzleCertificateRoute,
} from "./puzzle/puzzleCertificate";


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

  whatsapp_number:
    | string
    | null;

  email_address:
    | string
    | null;

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
    JSON.stringify(
      data,
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


function normalizeShopCode(
  value: unknown,
): string | null {
  if (
    typeof value !==
    "string"
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
    typeof value !==
    "string"
  ) {
    return null;
  }

  const normalized =
    value.trim();

  return normalized.length >
    0
    ? normalized
    : null;
}


function normalizeOptionalText(
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

  return normalized.length >
    0
    ? normalized
    : null;
}


function mapShopRow(
  row: ShopRow,
) {
  return {
    code:
      row.code,

    name:
      row.name,

    ownerName:
      row.owner_name,

    phoneNumber:
      row.phone_number,

    whatsAppNumber:
      row.whatsapp_number ??
      "",

    emailAddress:
      row.email_address ??
      "",

    addressLine:
      row.address_line,

    city:
      row.city,

    state:
      row.state,

    postalCode:
      row.postal_code,

    status:
      row.status,

    createdAt:
      row.created_at,

    updatedAt:
      row.updated_at,
  };
}


async function findShopByCode(
  env: Env,
  code: string,
): Promise<
  ShopRow | null
> {
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
    .bind(
      code,
    )
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

  return createJsonResponse({
    shop:
      mapShopRow(
        shop,
      ),
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
          SELECT
            code

          FROM shops

          WHERE code = ?

          LIMIT 1
        `,
      )
      .bind(
        code,
      )
      .first<{
        code: string;
      }>();

  if (
    existingShop
  ) {
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
  } catch (
    error
  ) {
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

  if (
    !createdShop
  ) {
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


/*
 * ========================================================
 * API ROUTING
 * ========================================================
 */

async function handleApiRequest(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {

  /*
   * ------------------------------------------------
   * Administrator authentication
   * ------------------------------------------------
   */

  const adminAuthResponse =
    await handleAdminAuthRoute(
      request,
      env,
      url,
    );

  if (
    adminAuthResponse
  ) {
    return adminAuthResponse;
  }


  /*
   * ------------------------------------------------
   * Puzzle administration
   *
   * Authentication is enforced again inside
   * puzzleAdminRoutes before solved boards or
   * solution moves are returned.
   * ------------------------------------------------
   */

  const puzzleAdminResponse =
    await handlePuzzleAdminRoute(
      request,
      env,
      url,
    );

  if (
    puzzleAdminResponse
  ) {
    return puzzleAdminResponse;
  }


  /*
   * ------------------------------------------------
   * Global service administration
   * ------------------------------------------------
   */

  const adminServicesResponse =
    await handleAdminServicesRoute(
      request,
      env,
      url,
    );

  if (
    adminServicesResponse
  ) {
    return adminServicesResponse;
  }


  const adminServiceFormsResponse =
    await handleAdminServiceFormsRoute(
      request,
      env,
      url,
    );

  if (
    adminServiceFormsResponse
  ) {
    return adminServiceFormsResponse;
  }


  /*
   * ------------------------------------------------
   * Shop administration
   * ------------------------------------------------
   */

  const adminShopsResponse =
    await handleAdminShopsRoute(
      request,
      env,
      url,
    );

  if (
    adminShopsResponse
  ) {
    return adminShopsResponse;
  }


  const adminStorageResponse =
    await handleAdminStorageRoute(
      request,
      env,
      url,
    );

  if (
    adminStorageResponse
  ) {
    return adminStorageResponse;
  }


  /*
   * ------------------------------------------------
   * Public puzzle APIs
   *
   * Includes:
   * - today's puzzle
   * - numbered/practice puzzles
   * - mystery reveal
   * - medal winner
   * - winner list
   * ------------------------------------------------
   */

  const puzzleResponse =
    await handlePuzzleRoute(
      request,
      env,
      url,
    );

  if (
    puzzleResponse
  ) {
    return puzzleResponse;
  }


  /*
   * ------------------------------------------------
   * Puzzle certificate email
   *
   * This route independently replays the submitted
   * 5×5 moves before sending a certificate.
   * ------------------------------------------------
   */

  const puzzleCertificateResponse =
    await handlePuzzleCertificateRoute(
      request,
      env,
      url,
    );

  if (
    puzzleCertificateResponse
  ) {
    return puzzleCertificateResponse;
  }


  /*
   * ------------------------------------------------
   * Public service catalog
   * ------------------------------------------------
   */

  const serviceCatalogResponse =
    await handleServiceCatalogRoute(
      request,
      env,
      url,
    );

  if (
    serviceCatalogResponse
  ) {
    return serviceCatalogResponse;
  }


  /*
   * ------------------------------------------------
   * Browser location hint
   * ------------------------------------------------
   */

  const locationHintResponse =
    handleLocationHintRoute(
      request,
      url,
    );

  if (
    locationHintResponse
  ) {
    return locationHintResponse;
  }


  /*
   * ------------------------------------------------
   * Nearby registered shops
   * ------------------------------------------------
   */

  const nearbyShopsResponse =
    await handleNearbyShopsRoute(
      request,
      env,
      url,
    );

  if (
    nearbyShopsResponse
  ) {
    return nearbyShopsResponse;
  }


  /*
   * ------------------------------------------------
   * Public service forms
   * ------------------------------------------------
   */

  const serviceFormResponse =
    await handleServiceFormsRoute(
      request,
      env,
      url,
    );

  if (
    serviceFormResponse
  ) {
    return serviceFormResponse;
  }


  /*
   * ------------------------------------------------
   * Service requests
   * ------------------------------------------------
   */

  const serviceRequestResponse =
    await handleServiceRequestsRoute(
      request,
      env,
      url,
    );

  if (
    serviceRequestResponse
  ) {
    return serviceRequestResponse;
  }


  /*
   * ------------------------------------------------
   * Shared requests
   * ------------------------------------------------
   */

  const sharedRequestResponse =
    await handleSharedRequestsRoute(
      request,
      env,
      url,
    );

  if (
    sharedRequestResponse
  ) {
    return sharedRequestResponse;
  }


  /*
   * ------------------------------------------------
   * Print orders
   * ------------------------------------------------
   */

  const printRequestsResponse =
    await handlePrintRequestsRoute(
      request,
      env,
      url,
    );

  if (
    printRequestsResponse
  ) {
    return printRequestsResponse;
  }


  /*
   * ------------------------------------------------
   * Health
   * ------------------------------------------------
   */

  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/health"
  ) {
    return createJsonResponse({
      status:
        "ok",

      service:
        "GYAN Cloud Shop Registry",
    });
  }


  /*
   * ------------------------------------------------
   * Register shop
   * ------------------------------------------------
   */

  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/shops"
  ) {
    return handleRegisterShop(
      request,
      env,
    );
  }


  /*
   * ------------------------------------------------
   * Public shop lookup
   * ------------------------------------------------
   */

  const shopRouteMatch =
    url.pathname.match(
      /^\/api\/shops\/([A-Za-z0-9]{4})$/,
    );

  if (
    request.method ===
      "GET" &&
    shopRouteMatch
  ) {
    return handleGetShop(
      env,
      shopRouteMatch[
        1
      ],
    );
  }


  /*
   * MUST remain last.
   */
  return createJsonResponse(
    {
      error:
        "API route not found.",
    },
    404,
  );
}


/*
 * ========================================================
 * WORKER
 * ========================================================
 */

export default {
  async fetch(
    request: Request,
    env: Env,
  ): Promise<Response> {
    const url =
      new URL(
        request.url,
      );

    try {
      /*
       * API routes must be handled before
       * static assets.
       *
       * Otherwise the SPA fallback can return
       * index.html for an API request.
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
    } catch (
      error
    ) {
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
        .then(
          (result) => {
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
          },
        )
        .catch(
          (error) => {
            console.error(
              "Storage reconciliation failed:",
              error,
            );
          },
        ),
    );
  },
};