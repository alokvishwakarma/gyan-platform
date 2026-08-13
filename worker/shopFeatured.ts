import {
  getAdminSession,
} from "./adminAuth";

const SESSION_COOKIE =
  "gyan_session";

function jsonResponse(
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

function cookieValue(
  request: Request,
  name: string,
): string | null {
  const cookie =
    request.headers.get(
      "cookie",
    );

  if (!cookie) {
    return null;
  }

  for (
    const item
    of cookie.split(";")
  ) {
    const [
      key,
      ...rest
    ] =
      item
        .trim()
        .split("=");

    if (key === name) {
      return decodeURIComponent(
        rest.join("="),
      );
    }
  }

  return null;
}

function bytesToHex(
  bytes: Uint8Array,
): string {
  return Array.from(
    bytes,
  )
    .map(
      (value) =>
        value
          .toString(16)
          .padStart(
            2,
            "0",
          ),
    )
    .join("");
}

async function sha256(
  value: string,
): Promise<string> {
  const encoded =
    new TextEncoder()
      .encode(
        value,
      );

  const digest =
    await crypto.subtle.digest(
      "SHA-256",
      encoded,
    );

  return bytesToHex(
    new Uint8Array(
      digest,
    ),
  );
}

async function currentUserEmail(
  request: Request,
  env: Env,
): Promise<string | null> {
  const sessionToken =
    cookieValue(
      request,
      SESSION_COOKIE,
    );

  if (!sessionToken) {
    return null;
  }

  const tokenHash =
    await sha256(
      sessionToken,
    );

  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          users.email

        FROM user_sessions

        INNER JOIN users
          ON users.id =
            user_sessions.user_id

        WHERE
          user_sessions.token_hash = ?
          AND user_sessions.expires_at >
            CURRENT_TIMESTAMP

        LIMIT 1
        `,
      )
      .bind(
        tokenHash,
      )
      .first<{
        email: string;
      }>();

  return (
    row?.email
      ?.trim()
      .toLowerCase() ??
    null
  );
}

async function canManageShop(
  request: Request,
  env: Env,
  shopCode: string,
): Promise<boolean> {
  /*
   * Platform Admin may manage any shop.
   */
  const adminSession =
    await getAdminSession(
      request,
      env,
    );

  if (adminSession) {
    return true;
  }

  /*
   * Shop owner inherits the normal GYAN
   * authenticated user session.
   */
  const email =
    await currentUserEmail(
      request,
      env,
    );

  if (!email) {
    return false;
  }

  const shop =
    await env.gyan_registry
      .prepare(
        `
        SELECT code

        FROM shops

        WHERE
          code = ?
          AND status = 'active'
          AND lower(
            coalesce(
              email_address,
              ''
            )
          ) = ?

        LIMIT 1
        `,
      )
      .bind(
        shopCode,
        email,
      )
      .first<{
        code: string;
      }>();

  return Boolean(
    shop,
  );
}

async function getFeaturedServices(
  env: Env,
  shopCode: string,
): Promise<Response> {
  const shop =
    await env.gyan_registry
      .prepare(
        `
        SELECT code
        FROM shops
        WHERE
          code = ?
          AND status = 'active'
        LIMIT 1
        `,
      )
      .bind(
        shopCode,
      )
      .first<{
        code: string;
      }>();

  if (!shop) {
    return jsonResponse(
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
          s.service_code,
          s.name,
          s.icon,
          s.color,
          fs.featured_order

        FROM shop_featured_services fs

        INNER JOIN services s
          ON s.id =
            fs.service_id

        INNER JOIN shop_services ss
          ON ss.shop_code =
            fs.shop_code
          AND ss.service_id =
            fs.service_id

        WHERE
          fs.shop_code = ?
          AND ss.enabled = 1
          AND s.enabled = 1

        ORDER BY
          fs.featured_order ASC
        `,
      )
      .bind(
        shopCode,
      )
      .all<{
        service_code: string;
        name: string;
        icon: string | null;
        color: string | null;
        featured_order: number;
      }>();

  return jsonResponse({
    shopCode,

    serviceCodes:
      result.results.map(
        (row) =>
          row.service_code,
      ),

    featured:
      result.results.map(
        (row) => ({
          serviceCode:
            row.service_code,

          name:
            row.name,

          icon:
            row.icon,

          color:
            row.color,

          order:
            row.featured_order,
        }),
      ),
  });
}

async function saveFeaturedServices(
  request: Request,
  env: Env,
  shopCode: string,
): Promise<Response> {
  if (
    !await canManageShop(
      request,
      env,
      shopCode,
    )
  ) {
    return jsonResponse(
      {
        error:
          "You are not authorized to manage this shop.",
      },
      403,
    );
  }

  let body: {
    serviceCodes?:
      unknown;
  };

  try {
    body =
      await request.json();
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid request.",
      },
      400,
    );
  }

  if (
    !Array.isArray(
      body.serviceCodes,
    )
  ) {
    return jsonResponse(
      {
        error:
          "serviceCodes must be an array.",
      },
      400,
    );
  }

  const serviceCodes =
    body.serviceCodes
      .filter(
        (
          value,
        ):
          value is string =>
            typeof value ===
              "string",
      )
      .map(
        (value) =>
          value
            .trim()
            .toUpperCase(),
      )
      .filter(
        (
          value,
          index,
          values,
        ) =>
          value &&
          values.indexOf(
            value,
          ) === index,
      );

  if (
    serviceCodes.length >
      3
  ) {
    return jsonResponse(
      {
        error:
          "Choose at most three featured services.",
      },
      400,
    );
  }

  if (
    serviceCodes.length >
    0
  ) {
    const placeholders =
      serviceCodes
        .map(
          () => "?",
        )
        .join(",");

    /*
     * Featured selection is also the first-step
     * service setup for a new shop.
     *
     * A selected service only needs to exist in
     * the global catalog and be globally enabled.
     * If the shop has no shop_services row yet,
     * we create one. If it exists but is disabled,
     * we enable it.
     */
    const selectedServices =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            id,
            service_code,
            sort_order

          FROM services

          WHERE
            service_code IN (
              ${placeholders}
            )
            AND enabled = 1
          `,
        )
        .bind(
          ...serviceCodes,
        )
        .all<{
          id: number;
          service_code: string;
          sort_order: number;
        }>();

    if (
      selectedServices
        .results
        .length !==
      serviceCodes.length
    ) {
      return jsonResponse(
        {
          error:
            "One or more selected services are not available.",
        },
        400,
      );
    }

    const serviceByCode =
      new Map(
        selectedServices
          .results
          .map(
            (row) => [
              row.service_code,
              row,
            ],
          ),
      );

    const statements:
      D1PreparedStatement[] =
      [
        /*
         * Replace only Featured membership.
         * Removing a service from Featured does
         * NOT disable it for the shop.
         */
        env.gyan_registry
          .prepare(
            `
            DELETE FROM
              shop_featured_services

            WHERE shop_code = ?
            `,
          )
          .bind(
            shopCode,
          ),
      ];

    for (
      let index = 0;
      index <
        serviceCodes.length;
      index += 1
    ) {
      const serviceCode =
        serviceCodes[index];

      const service =
        serviceByCode.get(
          serviceCode,
        );

      if (!service) {
        continue;
      }

      /*
       * Auto-enable the service for this shop.
       *
       * This uses the same shop_services pattern
       * as the existing admin service-management
       * code.
       */
      statements.push(
        env.gyan_registry
          .prepare(
            `
            INSERT INTO
              shop_services (
                shop_code,
                service_id,
                enabled,
                sort_order,
                updated_at
              )

            VALUES (
              ?,
              ?,
              1,
              ?,
              CURRENT_TIMESTAMP
            )

            ON CONFLICT(
              shop_code,
              service_id
            )
            DO UPDATE SET
              enabled = 1,

              sort_order =
                COALESCE(
                  shop_services.sort_order,
                  excluded.sort_order
                ),

              updated_at =
                CURRENT_TIMESTAMP
            `,
          )
          .bind(
            shopCode,
            service.id,
            service.sort_order,
          ),
      );

      statements.push(
        env.gyan_registry
          .prepare(
            `
            INSERT INTO
              shop_featured_services (
                shop_code,
                service_id,
                featured_order,
                updated_at
              )

            VALUES (
              ?,
              ?,
              ?,
              CURRENT_TIMESTAMP
            )
            `,
          )
          .bind(
            shopCode,
            service.id,
            index + 1,
          ),
      );
    }

    await env.gyan_registry
      .batch(
        statements,
      );

  } else {
    await env.gyan_registry
      .prepare(
        `
        DELETE FROM
          shop_featured_services

        WHERE shop_code = ?
        `,
      )
      .bind(
        shopCode,
      )
      .run();
  }

  return getFeaturedServices(
    env,
    shopCode,
  );
}

export async function handleShopFeaturedRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  const match =
    url.pathname.match(
      /^\/api\/shops\/([A-Za-z0-9]{4})\/featured-services$/,
    );

  if (!match) {
    return null;
  }

  const shopCode =
    match[1]
      .trim()
      .toUpperCase();

  if (
    request.method ===
      "GET"
  ) {
    return getFeaturedServices(
      env,
      shopCode,
    );
  }

  if (
    request.method ===
      "PUT"
  ) {
    return saveFeaturedServices(
      request,
      env,
      shopCode,
    );
  }

  return jsonResponse(
    {
      error:
        "Method not allowed.",
    },
    405,
  );
}