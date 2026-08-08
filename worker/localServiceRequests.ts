interface LocalServiceRequestBody {
  service?: string;

  details?: string;

  distanceMiles?: number;

  email?: string;

  phone?: string;

  preferredTime?: string;

  latitude?: number;

  longitude?: number;
}


interface LocalServiceRequestRow {
  id: number;

  service_name: string;

  details:
    | string
    | null;

  latitude: number;

  longitude: number;

  search_radius_km: number;

  email: string;

  phone:
    | string
    | null;

  preferred_time:
    | string
    | null;

  status: string;

  verification_token_hash:
    | string
    | null;

  verification_expires_at:
    | string
    | null;

  assigned_shop_code:
    | string
    | null;
}


interface ShopRow {
  code: string;

  name: string;

  email_address:
    | string
    | null;

  latitude: number;

  longitude: number;
}


function jsonResponse(
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


function cleanText(
  value:
    | string
    | undefined,
): string {
  return (
    value ??
    ""
  ).trim();
}


function isValidEmail(
  email: string,
): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
    email,
  );
}


function milesToKm(
  miles: number,
): number {
  return (
    miles *
    1.609344
  );
}


function toRadians(
  value: number,
): number {
  return (
    value *
    Math.PI /
    180
  );
}


function distanceKm(
  firstLatitude: number,
  firstLongitude: number,
  secondLatitude: number,
  secondLongitude: number,
): number {
  const earthRadiusKm =
    6371;


  const latitudeDifference =
    toRadians(
      secondLatitude -
        firstLatitude,
    );


  const longitudeDifference =
    toRadians(
      secondLongitude -
        firstLongitude,
    );


  const firstLatitudeRadians =
    toRadians(
      firstLatitude,
    );


  const secondLatitudeRadians =
    toRadians(
      secondLatitude,
    );


  const value =
    Math.sin(
      latitudeDifference /
        2,
    ) ** 2 +
    Math.cos(
      firstLatitudeRadians,
    ) *
      Math.cos(
        secondLatitudeRadians,
      ) *
      Math.sin(
        longitudeDifference /
          2,
      ) ** 2;


  return (
    earthRadiusKm *
    2 *
    Math.atan2(
      Math.sqrt(value),
      Math.sqrt(
        1 -
        value,
      ),
    )
  );
}


function bytesToHex(
  bytes:
    Uint8Array,
): string {
  return Array
    .from(bytes)
    .map(
      (
        value,
      ) =>
        value
          .toString(16)
          .padStart(
            2,
            "0",
          ),
    )
    .join("");
}


function createToken(): string {
  const bytes =
    new Uint8Array(
      32,
    );


  crypto.getRandomValues(
    bytes,
  );


  return bytesToHex(
    bytes,
  );
}


async function sha256(
  value: string,
): Promise<string> {
  const encoded =
    new TextEncoder()
      .encode(value);


  const digest =
    await crypto.subtle
      .digest(
        "SHA-256",
        encoded,
      );


  return bytesToHex(
    new Uint8Array(
      digest,
    ),
  );
}


function escapeHtml(
  value: string,
): string {
  return value
    .replaceAll(
      "&",
      "&amp;",
    )
    .replaceAll(
      "<",
      "&lt;",
    )
    .replaceAll(
      ">",
      "&gt;",
    )
    .replaceAll(
      '"',
      "&quot;",
    )
    .replaceAll(
      "'",
      "&#039;",
    );
}


async function sendEmail(
  env: Env,

  to: string,

  subject: string,

  html: string,
): Promise<void> {
  const response =
    await fetch(
      "https://api.resend.com/emails",
      {
        method:
          "POST",

        headers: {
          authorization:
            `Bearer ${env.RESEND_API_KEY}`,

          "content-type":
            "application/json",
        },

        body:
          JSON.stringify({
            from:
              "GYAN <admin@gyan.cc>",

            to: [
              to,
            ],

            subject,

            html,
          }),
      },
    );


  if (
    !response.ok
  ) {
    const message =
      await response.text();


    console.error(
      "Local service request email failed:",
      message,
    );


    throw new Error(
      "Email could not be sent.",
    );
  }
}


async function createLocalServiceRequest(
  request: Request,

  env: Env,

  url: URL,
): Promise<Response> {
  let body:
    LocalServiceRequestBody;


  try {
    body =
      await request.json<
        LocalServiceRequestBody
      >();
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid request.",
      },
      400,
    );
  }


  const service =
    cleanText(
      body.service,
    );


  const details =
    cleanText(
      body.details,
    );


  const email =
    cleanText(
      body.email,
    )
      .toLowerCase();


  const phone =
    cleanText(
      body.phone,
    );


  const preferredTime =
    cleanText(
      body.preferredTime,
    );


  const latitude =
    Number(
      body.latitude,
    );


  const longitude =
    Number(
      body.longitude,
    );


  const distanceMiles =
    Number(
      body.distanceMiles,
    );


  if (
    !service ||
    !email
  ) {
    return jsonResponse(
      {
        error:
          "Service and email are required.",
      },
      400,
    );
  }


  if (
    !isValidEmail(
      email,
    )
  ) {
    return jsonResponse(
      {
        error:
          "Enter a valid email address.",
      },
      400,
    );
  }


  if (
    !Number.isFinite(
      latitude,
    ) ||
    latitude <
      -90 ||
    latitude >
      90 ||
    !Number.isFinite(
      longitude,
    ) ||
    longitude <
      -180 ||
    longitude >
      180
  ) {
    return jsonResponse(
      {
        error:
          "A valid location is required.",
      },
      400,
    );
  }


  if (
    !Number.isFinite(
      distanceMiles,
    ) ||
    distanceMiles <=
      0 ||
    distanceMiles >
      100
  ) {
    return jsonResponse(
      {
        error:
          "Enter a valid search distance.",
      },
      400,
    );
  }


  const verificationToken =
    createToken();


  const verificationTokenHash =
    await sha256(
      verificationToken,
    );


  const verificationExpiresAt =
    new Date(
      Date.now() +
      24 *
      60 *
      60 *
      1000,
    )
      .toISOString();


  const searchRadiusKm =
    milesToKm(
      distanceMiles,
    );


  const insert =
    await env.gyan_registry
      .prepare(
        `
        INSERT INTO local_service_requests (
          service_name,
          details,

          latitude,
          longitude,

          search_radius_km,

          email,
          phone,

          preferred_time,

          verification_token_hash,
          verification_expires_at
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
          ?
        )
        `,
      )
      .bind(
        service,

        details ||
          null,

        latitude,
        longitude,

        searchRadiusKm,

        email,

        phone ||
          null,

        preferredTime ||
          null,

        verificationTokenHash,
        verificationExpiresAt,
      )
      .run();


  const requestId =
    Number(
      insert.meta
        .last_row_id,
    );


  const verifyUrl =
    `${url.origin}/api/local-service-requests/verify?id=${requestId}&token=${encodeURIComponent(
      verificationToken,
    )}`;


  try {
    await sendEmail(
      env,

      email,

      "Verify your GYAN service request",

      `
        <div
          style="
            font-family:
              Arial,
              sans-serif;

            line-height:
              1.5;

            color:
              #222;
          "
        >
          <h2>
            Verify your service request
          </h2>

          <p>
            You requested:
          </p>

          <p>
            <strong>
              ${escapeHtml(
                service,
              )}
            </strong>
          </p>

          ${
            details
              ? `
                <p>
                  ${escapeHtml(
                    details,
                  )}
                </p>
              `
              : ""
          }

          <p>
            Please verify your email so
            GYAN can route your request.
          </p>

          <p>
            <a
              href="${verifyUrl}"
              style="
                display:
                  inline-block;

                padding:
                  10px 16px;

                background:
                  #176b42;

                color:
                  white;

                text-decoration:
                  none;

                border-radius:
                  8px;
              "
            >
              Verify Request
            </a>
          </p>

          <p
            style="
              color:
                #777;

              font-size:
                12px;
            "
          >
            This link expires in 24 hours.
          </p>
        </div>
      `,
    );
  } catch {
    return jsonResponse(
      {
        submitted:
          true,

        emailSent:
          false,

        requestId,

        error:
          "Request was saved, but verification email could not be sent.",
      },
      502,
    );
  }


  return jsonResponse({
    submitted:
      true,

    emailSent:
      true,

    requestId,
  });
}


async function findNearestShop(
  env: Env,

  latitude: number,

  longitude: number,

  searchRadiusKm: number,
): Promise<
  {
    shop:
      ShopRow;

    distanceKm:
      number;
  }
  | null
> {
  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          code,
          name,
          email_address,
          latitude,
          longitude

        FROM shops

        WHERE
          status =
            'active'

          AND code !=
            'SUPP'

          AND latitude
            IS NOT NULL

          AND longitude
            IS NOT NULL
        `,
      )
      .all<
        ShopRow
      >();


  let nearest:
    {
      shop:
        ShopRow;

      distanceKm:
        number;
    }
    | null = null;


  for (
    const shop of
    result.results ??
    []
  ) {
    const distance =
      distanceKm(
        latitude,
        longitude,

        shop.latitude,
        shop.longitude,
      );


    if (
      distance >
      searchRadiusKm
    ) {
      continue;
    }


    if (
      !nearest ||
      distance <
        nearest.distanceKm
    ) {
      nearest = {
        shop,

        distanceKm:
          distance,
      };
    }
  }


  return nearest;
}


async function loadRequest(
  env: Env,

  id: number,
): Promise<
  LocalServiceRequestRow | null
> {
  return env.gyan_registry
    .prepare(
      `
      SELECT
        id,
        service_name,
        details,
        latitude,
        longitude,
        search_radius_km,
        email,
        phone,
        preferred_time,
        status,
        verification_token_hash,
        verification_expires_at,
        assigned_shop_code

      FROM local_service_requests

      WHERE id = ?
      `,
    )
    .bind(
      id,
    )
    .first<
      LocalServiceRequestRow
    >();
}


async function verifyLocalServiceRequest(
  env: Env,

  url: URL,
): Promise<Response> {
  const id =
    Number(
      url.searchParams.get(
        "id",
      ),
    );


  const token =
    url.searchParams.get(
      "token",
    ) ??
    "";


  if (
    !Number.isInteger(
      id,
    ) ||
    id <=
      0 ||
    !token
  ) {
    return new Response(
      "Invalid verification link.",
      {
        status:
          400,
      },
    );
  }


  const row =
    await loadRequest(
      env,
      id,
    );


  if (
    !row
  ) {
    return new Response(
      "Service request not found.",
      {
        status:
          404,
      },
    );
  }


  if (
    row.status !==
      "pending_email_verification"
  ) {
    return new Response(
      "This request has already been verified.",
      {
        headers: {
          "content-type":
            "text/plain; charset=utf-8",
        },
      },
    );
  }


  if (
    !row.verification_token_hash ||
    !row.verification_expires_at
  ) {
    return new Response(
      "Verification link is no longer valid.",
      {
        status:
          400,
      },
    );
  }


  const expiry =
    Date.parse(
      row.verification_expires_at,
    );


  if (
    !Number.isFinite(
      expiry,
    ) ||
    Date.now() >
      expiry
  ) {
    return new Response(
      "Verification link has expired.",
      {
        status:
          400,
      },
    );
  }


  const suppliedHash =
    await sha256(
      token,
    );


  if (
    suppliedHash !==
    row.verification_token_hash
  ) {
    return new Response(
      "Invalid verification link.",
      {
        status:
          403,
      },
    );
  }


  const nearest =
    await findNearestShop(
      env,

      row.latitude,
      row.longitude,

      row.search_radius_km,
    );


  const assignedShopCode =
    nearest
      ? nearest.shop.code
      : "SUPP";


  await env.gyan_registry
    .prepare(
      `
      UPDATE local_service_requests

      SET
        status =
          'active',

        email_verified_at =
          CURRENT_TIMESTAMP,

        verification_token_hash =
          NULL,

        verification_expires_at =
          NULL,

        assigned_shop_code =
          ?,

        updated_at =
          CURRENT_TIMESTAMP

      WHERE id = ?
      `,
    )
    .bind(
      assignedShopCode,
      id,
    )
    .run();


  const destinationEmail =
    nearest?.shop.email_address ||
    "admin@gyan.cc";


  const destinationName =
    nearest?.shop.name ||
    "GYAN Support";


  try {
    await sendEmail(
      env,

      destinationEmail,

      `New GYAN service request: ${row.service_name}`,

      `
        <div
          style="
            font-family:
              Arial,
              sans-serif;

            line-height:
              1.5;

            color:
              #222;
          "
        >
          <h2>
            New service request
          </h2>

          <p>
            Assigned to:
            <strong>
              ${escapeHtml(
                destinationName,
              )}
            </strong>
          </p>

          <p>
            <strong>
              Service:
            </strong>

            ${escapeHtml(
              row.service_name,
            )}
          </p>

          ${
            row.details
              ? `
                <p>
                  <strong>
                    Details:
                  </strong>

                  ${escapeHtml(
                    row.details,
                  )}
                </p>
              `
              : ""
          }

          ${
            row.preferred_time
              ? `
                <p>
                  <strong>
                    Preferred time:
                  </strong>

                  ${escapeHtml(
                    row.preferred_time,
                  )}
                </p>
              `
              : ""
          }

          <p>
            <strong>
              Customer email:
            </strong>

            ${escapeHtml(
              row.email,
            )}
          </p>

          ${
            row.phone
              ? `
                <p>
                  <strong>
                    Phone:
                  </strong>

                  ${escapeHtml(
                    row.phone,
                  )}
                </p>
              `
              : ""
          }

          ${
            nearest
              ? `
                <p>
                  Approximate distance:
                  ${nearest.distanceKm.toFixed(
                    1,
                  )}
                  km
                </p>
              `
              : `
                <p>
                  No participating GYAN shop
                  was found within the requested
                  search radius.
                </p>
              `
          }
        </div>
      `,
    );
  } catch (
    error
  ) {
    console.error(
      "Provider notification failed:",
      error,
    );
  }


  return new Response(
    `
      <!doctype html>

      <html>
        <head>
          <meta
            name="viewport"
            content="width=device-width, initial-scale=1"
          >

          <title>
            GYAN Request Verified
          </title>
        </head>

        <body
          style="
            margin:
              0;

            padding:
              24px;

            background:
              #fffdf8;

            font-family:
              Arial,
              sans-serif;

            color:
              #292720;
          "
        >
          <main
            style="
              max-width:
                480px;

              margin:
                40px auto;

              padding:
                24px;

              background:
                white;

              border:
                1px solid
                #e6e0d4;

              border-radius:
                16px;

              text-align:
                center;
            "
          >
            <div
              style="
                font-size:
                  42px;
              "
            >
              ✅
            </div>

            <h2>
              Request verified
            </h2>

            <p>
              Your request for
              <strong>
                ${escapeHtml(
                  row.service_name,
                )}
              </strong>
              has been received.
            </p>

            <p>
              ${
                nearest
                  ? `It has been routed to ${escapeHtml(
                      nearest.shop.name,
                    )}.`
                  : "GYAN Support will help route your request."
              }
            </p>

            <a
              href="/"
              style="
                display:
                  inline-block;

                margin-top:
                  12px;

                padding:
                  10px 18px;

                background:
                  #176b42;

                color:
                  white;

                border-radius:
                  8px;

                text-decoration:
                  none;
              "
            >
              Return to GYAN
            </a>
          </main>
        </body>
      </html>
    `,

    {
      headers: {
        "content-type":
          "text/html; charset=utf-8",

        "cache-control":
          "no-store",
      },
    },
  );
}


export async function handleLocalServiceRequestRoute(
  request: Request,

  env: Env,

  url: URL,
): Promise<
  Response | null
> {
  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/local-service-requests"
  ) {
    return createLocalServiceRequest(
      request,
      env,
      url,
    );
  }


  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/local-service-requests/verify"
  ) {
    return verifyLocalServiceRequest(
      env,
      url,
    );
  }


  return null;
}