import {
  handleAdminAuthRoute,
} from "./adminAuth";

import {
  handleLittleLearnersRoute,
} from "./littleLearners";

import {
  handleEducationRoute,
} from "./education";

import {
  handleEducationLearningRoute,
} from "./educationLearning";


import {
  handleEducationProgressRoute,
} from "./educationProgress";

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
  handleLocationResolveRoute,
} from "./locationResolve";

import {
  handlePuzzleRoute,
} from "./puzzle/puzzleRoutes";

import {
  handlePuzzleAdminRoute,
} from "./puzzle/puzzleAdminRoutes";

import {
  handlePuzzleCertificateRoute,
} from "./puzzle/puzzleCertificate";

import {
  handleHomeFeaturedRoute,
} from "./homeFeatured";

import {
  handleAdvertisementRoute,
} from "./advertisements";

import {
  handleLocalServiceRequestRoute,
} from "./localServiceRequests";

import {
  handlePublicAuthRoute,
} from "./auth";

import {
  cleanupAnalytics,
  handleAnalyticsRoute,
} from "./analytics";


import {
  handleChatRoute,
} from "./chat";

import {
  assertShopCodeCanRegister,
  getOfflineShopCode,
} from "./offlineShopCodes";


import {
  handleShopFeaturedRoute,
} from "./shopFeatured";

import {
  handleStudentInviteCodeRoute,
} from "./studentInviteCodes";


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

  /*
   * ------------------------------------------------
   * Reserved offline namespace
   *
   * ??R? can never be created through ordinary
   * online registration.
   *
   * A ??R? code is accepted only if GYAN already
   * issued it in offline_shop_codes and it is
   * still reserved.
   * ------------------------------------------------
   */

  let registrationKind:
    | "online"
    | "offline";

  try {
    const codeRegistration =
      await assertShopCodeCanRegister(
        env,
        code,
      );

    registrationKind =
      codeRegistration.kind;
  } catch (
    error
  ) {
    if (
      error instanceof
        Error &&
      error.message ===
        "RESERVED_CODE_NOT_ISSUED"
    ) {
      return createJsonResponse(
        {
          error:
            "This reserved shop code was not issued by GYAN.",
        },
        400,
      );
    }

    if (
      error instanceof
        Error &&
      error.message ===
        "RESERVED_CODE_ALREADY_CLAIMED"
    ) {
      return createJsonResponse(
        {
          error:
            "This GYAN shop QR has already been claimed.",
        },
        409,
      );
    }

    throw error;
  }

  /*
   * A shop code can only become a real shop once.
   */
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
          registrationKind ===
            "offline"
            ? "This GYAN shop QR has already been claimed."
            : "This shop code is already registered. Please generate another code.",
      },
      409,
    );
  }

  const insertShop =
    env.gyan_registry
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
      );

  try {
    if (
      registrationKind ===
        "offline"
    ) {
      /*
       * D1 batch keeps the shop creation and the
       * permanent QR claim together.
       */
      const results =
        await env.gyan_registry
          .batch([
            insertShop,

            env.gyan_registry
              .prepare(
                `
                  UPDATE offline_shop_codes

                  SET
                    status =
                      'claimed',

                    claimed_shop_code =
                      ?,

                    claimed_at =
                      CURRENT_TIMESTAMP

                  WHERE
                    code = ?
                    AND status =
                      'reserved'
                `,
              )
              .bind(
                code,
                code,
              ),
          ]);

      const claimResult =
        results[1];

      if (
        Number(
          claimResult
            ?.meta
            ?.changes ??
          0,
        ) !== 1
      ) {
        /*
         * Extremely unlikely race protection.
         * Remove the shop if the QR claim did
         * not transition from reserved.
         */
        await env.gyan_registry
          .prepare(
            `
              DELETE FROM shops
              WHERE code = ?
            `,
          )
          .bind(
            code,
          )
          .run();

        return createJsonResponse(
          {
            error:
              "This GYAN shop QR could not be claimed. Please refresh and try again.",
          },
          409,
        );
      }
    } else {
      await insertShop.run();
    }
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

      registrationKind,
    },
    201,
  );
}


async function handleOfflineShopCodeLookup(
  env: Env,
  rawCode: string,
): Promise<Response> {
  const code =
    normalizeShopCode(
      rawCode,
    );

  if (
    !code ||
    code[2] !== "R"
  ) {
    return createJsonResponse(
      {
        error:
          "Invalid reserved shop code.",
      },
      400,
    );
  }

  const reservedCode =
    await getOfflineShopCode(
      env,
      code,
    );

  if (!reservedCode) {
    return createJsonResponse(
      {
        error:
          "Reserved shop code not found.",
      },
      404,
    );
  }

  return createJsonResponse({
    code:
      reservedCode.code,

    status:
      reservedCode.status,

    claimable:
      reservedCode.status ===
        "reserved",

    shopCode:
      reservedCode
        .claimed_shop_code,
  });
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
   * Public user authentication
   *
   * Includes:
   * - send magic link
   * - verify magic link
   * - current user
   * - logout
   * ------------------------------------------------
   */

  const publicAuthResponse =
    await handlePublicAuthRoute(
      request,
      env,
      url,
    );

  if (
    publicAuthResponse
  ) {
    return publicAuthResponse;
  }


  /*
   * ------------------------------------------------
   * Customer / shop / admin chat
   * ------------------------------------------------
   */

  const chatResponse =
    await handleChatRoute(
      request,
      env,
      url,
    );

  if (
    chatResponse
  ) {
    return chatResponse;
  }


  const shopFeaturedResponse =
    await handleShopFeaturedRoute(
      request,
      env,
      url,
    );

  if (
    shopFeaturedResponse
  ) {
    return shopFeaturedResponse;
  }


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


  const analyticsResponse =
    await handleAnalyticsRoute(
      request,
      env,
      url,
    );


  if (
    analyticsResponse
  ) {
    return analyticsResponse;
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
   * Manual/admin location resolver
   * ------------------------------------------------
   */

  const locationResolveResponse =
    await handleLocationResolveRoute(
      request,
      url,
    );

  if (
    locationResolveResponse
  ) {
    return locationResolveResponse;
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

const homeFeaturedResponse =
  await handleHomeFeaturedRoute(
    request,
    env,
    url,
  );

if (
  homeFeaturedResponse
) {
  return homeFeaturedResponse;
}

  const studentInviteCodeResponse =
    await handleStudentInviteCodeRoute(
      request,
      env,
      url,
    );

  if (
    studentInviteCodeResponse
  ) {
    return studentInviteCodeResponse;
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
   * Offline/reserved shop QR lookup
   *
   * Used by the SPA when a user scans:
   *   https://gyan.cc/?shop=ABR7
   * ------------------------------------------------
   */

  const offlineShopCodeMatch =
    url.pathname.match(
      /^\/api\/offline-shop-codes\/([A-Za-z0-9]{4})$/,
    );

  if (
    request.method ===
      "GET" &&
    offlineShopCodeMatch
  ) {
    return handleOfflineShopCodeLookup(
      env,
      offlineShopCodeMatch[1],
    );
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

  const advertisementResponse =
  await handleAdvertisementRoute(
    request,
    env,
    url,
  );


if (
  advertisementResponse
) {
  return advertisementResponse;
}

/*
 * ------------------------------------------------
 * Local service requests
 *
 * The existing request handler owns validation,
 * verification email and assignment behavior.
 * After it succeeds, persist the resolved
 * human-readable location snapshot on the row.
 * ------------------------------------------------
 */

let localRequestLocation:
  {
    city?: string;
    region?: string;
    regionCode?: string;
    countryCode?: string;
    postalCode?: string;
  } | null =
    null;

if (
  request.method ===
    "POST" &&
  url.pathname ===
    "/api/local-service-requests"
) {
  try {
    const body =
      (await request.clone().json()) as {
        city?: unknown;
        region?: unknown;
        regionCode?: unknown;
        countryCode?: unknown;
        postalCode?: unknown;
      };

    localRequestLocation = {
      city:
        typeof body.city ===
          "string"
          ? body.city.trim()
          : "",

      region:
        typeof body.region ===
          "string"
          ? body.region.trim()
          : "",

      regionCode:
        typeof body.regionCode ===
          "string"
          ? body.regionCode
              .trim()
              .toUpperCase()
          : "",

      countryCode:
        typeof body.countryCode ===
          "string"
          ? body.countryCode
              .trim()
              .toUpperCase()
          : "",

      postalCode:
        typeof body.postalCode ===
          "string"
          ? body.postalCode.trim()
          : "",
    };
  } catch {
    /*
     * Existing request handler will return the
     * appropriate invalid-body response.
     */
  }
}


const localServiceRequestResponse =
  await handleLocalServiceRequestRoute(
    request,
    env,
    url,
  );


if (
  localServiceRequestResponse
) {
  if (
    localServiceRequestResponse.ok &&
    localRequestLocation
  ) {
    try {
      const result =
        (await localServiceRequestResponse
          .clone()
          .json()) as {
          requestId?: number;
          request?: {
            id?: number;
          };
        };

      const requestId =
        Number(
          result.requestId ??
          result.request?.id,
        );

      if (
        Number.isInteger(
          requestId,
        ) &&
        requestId >
          0
      ) {
        await env.gyan_registry
          .prepare(
            `
            UPDATE local_service_requests

            SET
              city = ?,
              region = ?,
              region_code = ?,
              country_code = ?,
              postal_code = ?

            WHERE id = ?
            `,
          )
          .bind(
            localRequestLocation.city ||
              null,

            localRequestLocation.region ||
              null,

            localRequestLocation.regionCode ||
              null,

            localRequestLocation.countryCode ||
              null,

            localRequestLocation.postalCode ||
              null,

            requestId,
          )
          .run();
      }
    } catch (
      error
    ) {
      console.error(
        "Unable to save service-request location snapshot:",
        error,
      );
    }
  }

  return localServiceRequestResponse;
}

const educationResponse =
  await handleEducationRoute(
    request,
    env,
    url,
  );

if (
  educationResponse
) {
  return educationResponse;
}

const educationLearningResponse =
  await handleEducationLearningRoute(
    request,
    env,
    url,
  );

if (
  educationLearningResponse
) {
  return educationLearningResponse;
}

const littleLearnersResponse =
  await handleLittleLearnersRoute(
    request,
    env,
    url,
  );

if (
  littleLearnersResponse
) {
  return littleLearnersResponse;
}

const educationProgressResponse =
  await handleEducationProgressRoute(
    request,
    env,
    url,
  );

if (
  educationProgressResponse
) {
  return educationProgressResponse;
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
      Promise.all([
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

        cleanupAnalytics(
          env,
        )
          .then(
            () => {
              console.log(
                "Analytics cleanup completed.",
              );
            },
          )
          .catch(
            (error) => {
              console.error(
                "Analytics cleanup failed:",
                error,
              );
            },
          ),
      ]).then(
        () =>
          undefined,
      ),
    );
  },
};