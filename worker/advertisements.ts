interface AdvertisementSubmissionBody {
  businessName?: string;

  service?: string;

  distanceMiles?: number;

  offer?: string;

  discountPercent?:
    | number
    | null;

  phone?: string;

  email?: string;

  latitude?: number;

  longitude?: number;

  durationDays?: number;

  description?: string;
}


interface AdvertisementRow {
  id: number;

  business_name: string;

  service_name: string;

  offer_text:
    | string
    | null;

  discount_percent:
    | number
    | null;

  description:
    | string
    | null;

  latitude: number;

  longitude: number;

  service_radius_km: number;

  phone: string;

  email: string;

  duration_days: number;

  status: string;

  verification_token_hash:
    | string
    | null;

  verification_expires_at:
    | string
    | null;

  admin_review_token_hash:
    | string
    | null;

  admin_review_expires_at:
    | string
    | null;

  featured_promotion_id:
  | number
  | null;

delete_token_hash:
  | string
  | null;

delete_token_expires_at:
  | string
  | null;

deleted_at:
  | string
  | null;
}



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


function bytesToHex(
  bytes:
    Uint8Array,
): string {
  return Array
    .from(
      bytes,
    )
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


  crypto
    .getRandomValues(
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
      .encode(
        value,
      );


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
      "Advertisement email failed:",
      message,
    );


    throw new Error(
      "Email could not be sent.",
    );
  }
}


async function createAdvertisement(
  request: Request,

  env: Env,

  url: URL,
): Promise<Response> {
  let body:
    AdvertisementSubmissionBody;


  try {
    body =
      await request.json<
        AdvertisementSubmissionBody
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


  const businessName =
    cleanText(
      body.businessName,
    );


  const serviceName =
    cleanText(
      body.service,
    );


  const offer =
    cleanText(
      body.offer,
    );


  const phone =
    cleanText(
      body.phone,
    );


  const email =
    cleanText(
      body.email,
    )
      .toLowerCase();


  const description =
    cleanText(
      body.description,
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


  const durationDays =
    30;


  const discountPercent =
    body.discountPercent ==
      null
      ? null
      : Number(
          body.discountPercent,
        );


  if (
    !businessName ||
    !serviceName ||
    !email
  ) {
    return jsonResponse(
      {
        error:
          "Business, service and email are required.",
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
          "Enter a valid service distance.",
      },
      400,
    );
  }


  if (
    discountPercent !=
      null &&
    (
      !Number.isFinite(
        discountPercent,
      ) ||
      discountPercent <
        0 ||
      discountPercent >
        100
    )
  ) {
    return jsonResponse(
      {
        error:
          "Discount must be between 0 and 100.",
      },
      400,
    );
  }


  const ownerToken =
    createToken();


  const ownerTokenHash =
    await sha256(
      ownerToken,
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


  const radiusKm =
    milesToKm(
      distanceMiles,
    );


  const insert =
    await env.gyan_registry
      .prepare(
        `
        INSERT INTO advertisement_submissions (
          business_name,
          service_name,

          offer_text,
          discount_percent,
          description,

          latitude,
          longitude,

          service_radius_km,

          phone,
          email,

          duration_days,

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
          ?,

          ?,

          ?,
          ?
        )
        `,
      )
      .bind(
        businessName,
        serviceName,

        offer ||
          null,

        discountPercent,

        description ||
          null,

        latitude,
        longitude,

        radiusKm,

        phone,
        email,

        durationDays,

        ownerTokenHash,
        verificationExpiresAt,
      )
      .run();


  const submissionId =
    Number(
      insert.meta
        .last_row_id,
    );


  const verifyUrl =
    `${url.origin}/api/advertisements/verify?id=${submissionId}&token=${encodeURIComponent(
      ownerToken,
    )}`;


  try {
    await sendEmail(
      env,

      email,

      "Verify your GYAN advertisement",

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
            Verify your GYAN advertisement
          </h2>

          <p>
            We received an advertisement request for:
          </p>

          <p>
            <strong>
              ${escapeHtml(
                businessName,
              )}
            </strong>
            <br>

            ${escapeHtml(
              serviceName,
            )}
          </p>

          ${
            offer
              ? `
                <p>
                  Offer:
                  <strong>
                    ${escapeHtml(
                      offer,
                    )}
                  </strong>
                </p>
              `
              : ""
          }

          <p>
            Please verify your email before
            the advertisement can be reviewed.
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
              Verify Advertisement
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
            This verification link
            expires in 24 hours.
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

        submissionId,

        error:
          "Submission was saved, but the verification email could not be sent.",
      },
      502,
    );
  }


  return jsonResponse({
    submitted:
      true,

    emailSent:
      true,

    submissionId,
  });
}


async function verifyAdvertisement(
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
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,

          business_name,
          service_name,

          offer_text,
          discount_percent,
          description,

          latitude,
          longitude,

          service_radius_km,

          phone,
          email,

          duration_days,

          status,

          verification_token_hash,
          verification_expires_at,

          admin_review_token_hash,
          admin_review_expires_at

        FROM advertisement_submissions

        WHERE id = ?
        `,
      )
      .bind(
        id,
      )
      .first<
        AdvertisementRow
      >();


  if (
    !row
  ) {
    return new Response(
      "Advertisement submission not found.",
      {
        status:
          404,
      },
    );
  }


  if (
    row.status ===
      "pending_review" ||
    row.status ===
      "approved"
  ) {
    return new Response(
      "Your email has already been verified.",
      {
        headers: {
          "content-type":
            "text/plain; charset=utf-8",
        },
      },
    );
  }


  if (
    !row
      .verification_token_hash ||
    !row
      .verification_expires_at
  ) {
    return new Response(
      "Verification link is no longer valid.",
      {
        status:
          400,
      },
    );
  }


  const verificationExpiry =
    Date.parse(
      row
        .verification_expires_at,
    );


  if (
    !Number.isFinite(
      verificationExpiry,
    ) ||
    Date.now() >
      verificationExpiry
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
    row
      .verification_token_hash
  ) {
    return new Response(
      "Invalid verification link.",
      {
        status:
          403,
      },
    );
  }


  const adminToken =
    createToken();


  const adminTokenHash =
    await sha256(
      adminToken,
    );


  const adminReviewExpiresAt =
    new Date(
      Date.now() +
      15 *
      24 *
      60 *
      60 *
      1000,
    )
      .toISOString();


  await env.gyan_registry
    .prepare(
      `
      UPDATE advertisement_submissions

      SET
        status =
          'pending_review',

        email_verified_at =
          CURRENT_TIMESTAMP,

        verification_token_hash =
          NULL,

        verification_expires_at =
          NULL,

        admin_review_token_hash =
          ?,

        admin_review_expires_at =
          ?,

        updated_at =
          CURRENT_TIMESTAMP

      WHERE id = ?
      `,
    )
    .bind(
      adminTokenHash,
      adminReviewExpiresAt,
      id,
    )
    .run();


  const adminReviewUrl =
    `${url.origin}/api/advertisements/review?id=${row.id}&token=${encodeURIComponent(
      adminToken,
    )}`;


  try {
    await sendEmail(
      env,

      "admin@gyan.cc",

      `Review GYAN advertisement: ${row.business_name}`,

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
            Advertisement ready for review
          </h2>

          <p>
            <strong>
              ${escapeHtml(
                row.business_name,
              )}
            </strong>
          </p>

          <p>
            Service:
            ${escapeHtml(
              row.service_name,
            )}
          </p>

          ${
            row.offer_text
              ? `
                <p>
                  Offer:
                  ${escapeHtml(
                    row.offer_text,
                  )}
                </p>
              `
              : ""
          }

          ${
            row.discount_percent !=
            null
              ? `
                <p>
                  Discount:
                  ${row.discount_percent}%
                </p>
              `
              : ""
          }

          <p>
            Service radius:
            ${row.service_radius_km.toFixed(
              1,
            )}
            km
          </p>

          <p>
            Duration:
            ${row.duration_days}
            days
          </p>

          <p>
            Email:
            ${escapeHtml(
              row.email,
            )}
          </p>

          ${
            row.phone
              ? `
                <p>
                  Phone:
                  ${escapeHtml(
                    row.phone,
                  )}
                </p>
              `
              : ""
          }

          <p>
            <a
              href="${adminReviewUrl}"
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
              Review Advertisement
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
            This secure review link
            is valid for 15 days.
          </p>
        </div>
      `,
    );
  } catch (
    error
  ) {
    console.error(
      "Admin advertisement notification failed:",
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
            GYAN Advertisement Verified
          </title>
        </head>

        <body
          style="
            margin:
              0;

            padding:
              24px;

            font-family:
              Arial,
              sans-serif;

            background:
              #fffdf8;

            color:
              #292720;
          "
        >
          <div
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
              Email verified
            </h2>

            <p>
              Your advertisement for
              <strong>
                ${escapeHtml(
                  row.business_name,
                )}
              </strong>
              has been submitted for
              review.
            </p>

            <p>
              GYAN will publish it
              after approval.
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
          </div>
        </body>
      </html>
    `,

    {
      headers: {
        "content-type":
          "text/html; charset=utf-8",
      },
    },
  );
}


async function loadAuthorizedReview(
  env: Env,

  id: number,

  token: string,
): Promise<
  AdvertisementRow | null
> {
  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,

          business_name,
          service_name,

          offer_text,
          discount_percent,
          description,

          latitude,
          longitude,

          service_radius_km,

          phone,
          email,

          duration_days,

          status,

          verification_token_hash,
          verification_expires_at,

          admin_review_token_hash,
          admin_review_expires_at

        FROM advertisement_submissions

        WHERE id = ?
        `,
      )
      .bind(
        id,
      )
      .first<
        AdvertisementRow
      >();


  if (
    !row ||
    row.status !==
      "pending_review" ||
    !row
      .admin_review_token_hash ||
    !row
      .admin_review_expires_at
  ) {
    return null;
  }


  const expiry =
    Date.parse(
      row
        .admin_review_expires_at,
    );


  if (
    !Number.isFinite(
      expiry,
    ) ||
    Date.now() >
      expiry
  ) {
    return null;
  }


  const suppliedHash =
    await sha256(
      token,
    );


  if (
    suppliedHash !==
    row
      .admin_review_token_hash
  ) {
    return null;
  }


  return row;
}


async function reviewAdvertisement(
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
      "Invalid review link.",
      {
        status:
          400,
      },
    );
  }


  const row =
    await loadAuthorizedReview(
      env,
      id,
      token,
    );


  if (
    !row
  ) {
    return new Response(
      "Review link is invalid, expired, or already used.",
      {
        status:
          403,
      },
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
            Review GYAN Advertisement
          </title>
        </head>

        <body
          style="
            margin:
              0;

            padding:
              20px;

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
                520px;

              margin:
                20px auto;

              padding:
                20px;

              background:
                white;

              border:
                1px solid
                #e5e0d5;

              border-radius:
                16px;
            "
          >
            <h2>
              📣 Review Advertisement
            </h2>

            <h3>
              ${escapeHtml(
                row.business_name,
              )}
            </h3>

            <p>
              <strong>
                Service:
              </strong>

              ${escapeHtml(
                row.service_name,
              )}
            </p>

            ${
              row.offer_text
                ? `
                  <p>
                    <strong>
                      Offer:
                    </strong>

                    ${escapeHtml(
                      row.offer_text,
                    )}
                  </p>
                `
                : ""
            }

            ${
              row.discount_percent !=
              null
                ? `
                  <p>
                    <strong>
                      Discount:
                    </strong>

                    ${row.discount_percent}%
                  </p>
                `
                : ""
            }

            ${
              row.description
                ? `
                  <p>
                    <strong>
                      Description:
                    </strong>

                    ${escapeHtml(
                      row.description,
                    )}
                  </p>
                `
                : ""
            }

            <p>
              <strong>
                Service radius:
              </strong>

              ${row.service_radius_km.toFixed(
                1,
              )}
              km
            </p>

            <p>
              <strong>
                Duration:
              </strong>

              ${row.duration_days}
              days
            </p>

            <p>
              <strong>
                Email:
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

            <div
              style="
                display:
                  grid;

                grid-template-columns:
                  1fr 1fr;

                gap:
                  10px;

                margin-top:
                  20px;
              "
            >
              <form
                method="POST"
                action="/api/advertisements/review-action"
              >
                <input
                  type="hidden"
                  name="id"
                  value="${row.id}"
                >

                <input
                  type="hidden"
                  name="token"
                  value="${escapeHtml(
                    token,
                  )}"
                >

                <input
                  type="hidden"
                  name="action"
                  value="approve"
                >

                <button
                  type="submit"
                  style="
                    width:
                      100%;

                    padding:
                      12px;

                    border:
                      0;

                    border-radius:
                      9px;

                    background:
                      #176b42;

                    color:
                      white;

                    font-weight:
                      700;

                    cursor:
                      pointer;
                  "
                >
                  ✓ Approve
                </button>
              </form>


              <form
                method="POST"
                action="/api/advertisements/review-action"
              >
                <input
                  type="hidden"
                  name="id"
                  value="${row.id}"
                >

                <input
                  type="hidden"
                  name="token"
                  value="${escapeHtml(
                    token,
                  )}"
                >

                <input
                  type="hidden"
                  name="action"
                  value="reject"
                >

                <button
                  type="submit"
                  style="
                    width:
                      100%;

                    padding:
                      12px;

                    border:
                      1px solid #d6d0c5;

                    border-radius:
                      9px;

                    background:
                      white;

                    color:
                      #7b312a;

                    font-weight:
                      700;

                    cursor:
                      pointer;
                  "
                >
                  Reject
                </button>
              </form>
            </div>
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


async function reviewAdvertisementAction(
  request: Request,

  env: Env,

  url: URL,
): Promise<Response> {
  let formData:
    FormData;


  try {
    formData =
      await request.formData();
  } catch {
    return new Response(
      "Invalid request.",
      {
        status:
          400,
      },
    );
  }


  const id =
    Number(
      formData.get(
        "id",
      ),
    );


  const token =
    String(
      formData.get(
        "token",
      ) ??
      "",
    );


  const action =
    String(
      formData.get(
        "action",
      ) ??
      "",
    );


  if (
    !Number.isInteger(
      id,
    ) ||
    id <=
      0 ||
    !token ||
    (
      action !==
        "approve" &&
      action !==
        "reject"
    )
  ) {
    return new Response(
      "Invalid review request.",
      {
        status:
          400,
      },
    );
  }


  const row =
    await loadAuthorizedReview(
      env,
      id,
      token,
    );


  if (
    !row
  ) {
    return new Response(
      "Review link is invalid, expired, or already used.",
      {
        status:
          403,
      },
    );
  }


  if (
    action ===
      "reject"
  ) {
    await env.gyan_registry
      .prepare(
        `
        UPDATE advertisement_submissions

        SET
          status =
            'rejected',

          admin_review_token_hash =
            NULL,

          admin_review_expires_at =
            NULL,

          updated_at =
            CURRENT_TIMESTAMP

        WHERE id = ?
        `,
      )
      .bind(
        id,
      )
      .run();


    return reviewResultPage(
      "Advertisement rejected",
      "The advertisement was not published.",
      "❌",
    );
  }


  const deleteToken =
    createToken();


  const deleteTokenHash =
    await sha256(
      deleteToken,
    );


  const deleteTokenExpiresAt =
    new Date(
      Date.now() +
      30 *
      24 *
      60 *
      60 *
      1000,
    )
      .toISOString();


  const promotionInsert =
    await env.gyan_registry
      .prepare(
        `
        INSERT INTO featured_promotions (
          source_type,

          title,
          description,

          icon,

          cta_label,
          target_url,

          service_code,
          shop_code,

          latitude,
          longitude,

          radius_km,

          starts_at,
          ends_at,

          priority,

          enabled,

          offer_text,
          discount_percent
        )

        VALUES (
          'gyan',

          ?,
          ?,

          '📣',

          'View',
          NULL,

          NULL,
          NULL,

          ?,
          ?,

          ?,

          CURRENT_TIMESTAMP,

          datetime(
            CURRENT_TIMESTAMP,
            '+30 days'
          ),

          100,

          1,

          ?,
          ?
        )
        `,
      )
      .bind(
        row.business_name,

        row.description ||
          row.service_name,

        row.latitude,
        row.longitude,

        row.service_radius_km,

        row.offer_text,

        row.discount_percent,
      )
      .run();


  const promotionId =
    Number(
      promotionInsert
        .meta
        .last_row_id,
    );


  await env.gyan_registry
    .prepare(
      `
      UPDATE advertisement_submissions

      SET
        status =
          'approved',

        approved_at =
          CURRENT_TIMESTAMP,

        featured_promotion_id =
          ?,

        delete_token_hash =
          ?,

        delete_token_expires_at =
          ?,

        admin_review_token_hash =
          NULL,

        admin_review_expires_at =
          NULL,

        updated_at =
          CURRENT_TIMESTAMP

      WHERE id = ?
      `,
    )
    .bind(
      promotionId,

      deleteTokenHash,

      deleteTokenExpiresAt,

      id,
    )
    .run();


  const deleteUrl =
    `${url.origin}/api/advertisements/delete?id=${row.id}&token=${encodeURIComponent(
      deleteToken,
    )}`;


  try {
    await sendEmail(
      env,

      row.email,

      "Your GYAN advertisement is live",

      `
        <div
          style="
            font-family:
              Arial,
              sans-serif;

            line-height:
              1.5;
          "
        >
          <h2>
            Your advertisement is live 🎉
          </h2>

          <p>
            Your advertisement for
            <strong>
              ${escapeHtml(
                row.business_name,
              )}
            </strong>
            has been approved.
          </p>

          <p>
            It may now appear to GYAN users
            within your selected service area.
          </p>

          <div
            style="
              display:
                flex;

              gap:
                10px;

              margin-top:
                16px;

              flex-wrap:
                wrap;
            "
          >
            <a
              href="${url.origin}/"
              style="
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
              Open GYAN
            </a>

            <a
              href="${deleteUrl}"
              style="
                padding:
                  10px 16px;

                background:
                  white;

                color:
                  #8a3128;

                text-decoration:
                  none;

                border:
                  1px solid #d8c9c5;

                border-radius:
                  8px;
              "
            >
              Delete Request
            </a>
          </div>

          <p
            style="
              margin-top:
                16px;

              color:
                #777;

              font-size:
                12px;
            "
          >
            Your free advertisement expires
            automatically after 30 days.
          </p>
        </div>
      `,
    );
  } catch (
    error
  ) {
    console.error(
      "Advertiser approval email failed:",
      error,
    );
  }


  return reviewResultPage(
    "Advertisement approved",
    "The advertisement is now eligible to appear in Featured.",
    "✅",
  );
}


async function loadAuthorizedDelete(
  env: Env,

  id: number,

  token: string,
): Promise<
  AdvertisementRow | null
> {
  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,

          business_name,
          service_name,

          offer_text,
          discount_percent,
          description,

          latitude,
          longitude,

          service_radius_km,

          phone,
          email,

          duration_days,

          status,

          verification_token_hash,
          verification_expires_at,

          admin_review_token_hash,
          admin_review_expires_at,

          featured_promotion_id,
          delete_token_hash,
          delete_token_expires_at,
          deleted_at

        FROM advertisement_submissions

        WHERE id = ?
        `,
      )
      .bind(
        id,
      )
      .first<
        AdvertisementRow
      >();


  if (
    !row ||
    row.status !==
      "approved" ||
    row.deleted_at ||
    !row.delete_token_hash ||
    !row.delete_token_expires_at
  ) {
    return null;
  }


  const expiry =
    Date.parse(
      row.delete_token_expires_at,
    );


  if (
    !Number.isFinite(
      expiry,
    ) ||
    Date.now() >
      expiry
  ) {
    return null;
  }


  const suppliedHash =
    await sha256(
      token,
    );


  if (
    suppliedHash !==
    row.delete_token_hash
  ) {
    return null;
  }


  return row;
}


async function deleteAdvertisementPage(
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
      "Invalid delete link.",
      {
        status:
          400,
      },
    );
  }


  const row =
    await loadAuthorizedDelete(
      env,
      id,
      token,
    );


  if (
    !row
  ) {
    return new Response(
      "Delete link is invalid, expired, or already used.",
      {
        status:
          403,
      },
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
            Delete GYAN Advertisement
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
            "
          >
            <div
              style="
                font-size:
                  36px;
              "
            >
              🗑️
            </div>

            <h2>
              Delete Advertisement?
            </h2>

            <p>
              <strong>
                ${escapeHtml(
                  row.business_name,
                )}
              </strong>
            </p>

            <p>
              Service:
              ${escapeHtml(
                row.service_name,
              )}
            </p>

            <p>
              This will immediately remove
              the advertisement from GYAN Featured.
            </p>

            <div
              style="
                display:
                  grid;

                grid-template-columns:
                  1fr 1fr;

                gap:
                  10px;

                margin-top:
                  20px;
              "
            >
              <a
                href="/"
                style="
                  padding:
                    12px;

                  text-align:
                    center;

                  border:
                    1px solid #d6d0c5;

                  border-radius:
                    9px;

                  color:
                    #333;

                  text-decoration:
                    none;
                "
              >
                Cancel
              </a>

              <form
                method="POST"
                action="/api/advertisements/delete"
              >
                <input
                  type="hidden"
                  name="id"
                  value="${row.id}"
                >

                <input
                  type="hidden"
                  name="token"
                  value="${escapeHtml(
                    token,
                  )}"
                >

                <button
                  type="submit"
                  style="
                    width:
                      100%;

                    padding:
                      12px;

                    border:
                      0;

                    border-radius:
                      9px;

                    background:
                      #9a382f;

                    color:
                      white;

                    font-weight:
                      700;

                    cursor:
                      pointer;
                  "
                >
                  Delete Advertisement
                </button>
              </form>
            </div>
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


async function deleteAdvertisementAction(
  request: Request,

  env: Env,
): Promise<Response> {
  let formData:
    FormData;


  try {
    formData =
      await request.formData();
  } catch {
    return new Response(
      "Invalid request.",
      {
        status:
          400,
      },
    );
  }


  const id =
    Number(
      formData.get(
        "id",
      ),
    );


  const token =
    String(
      formData.get(
        "token",
      ) ??
      "",
    );


  if (
    !Number.isInteger(
      id,
    ) ||
    id <=
      0 ||
    !token
  ) {
    return new Response(
      "Invalid delete request.",
      {
        status:
          400,
      },
    );
  }


  const row =
    await loadAuthorizedDelete(
      env,
      id,
      token,
    );


  if (
    !row
  ) {
    return new Response(
      "Delete link is invalid, expired, or already used.",
      {
        status:
          403,
      },
    );
  }


  if (
    row.featured_promotion_id !=
      null
  ) {
    await env.gyan_registry
      .prepare(
        `
        UPDATE featured_promotions

        SET
          enabled = 0

        WHERE id = ?
        `,
      )
      .bind(
        row.featured_promotion_id,
      )
      .run();
  }


  await env.gyan_registry
    .prepare(
      `
      UPDATE advertisement_submissions

      SET
        deleted_at =
          CURRENT_TIMESTAMP,

        delete_token_hash =
          NULL,

        delete_token_expires_at =
          NULL,

        updated_at =
          CURRENT_TIMESTAMP

      WHERE id = ?
      `,
    )
    .bind(
      id,
    )
    .run();


  return reviewResultPage(
    "Advertisement deleted",
    "Your advertisement has been removed from GYAN Featured.",
    "🗑️",
  );
}


function reviewResultPage(
  title: string,

  message: string,

  icon: string,
): Response {
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
            ${escapeHtml(
              title,
            )}
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
              ${icon}
            </div>

            <h2>
              ${escapeHtml(
                title,
              )}
            </h2>

            <p>
              ${escapeHtml(
                message,
              )}
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
              Open GYAN
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

export async function handleAdvertisementRoute(
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
      "/api/advertisements"
  ) {
    return createAdvertisement(
      request,
      env,
      url,
    );
  }


  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/advertisements/verify"
  ) {
    return verifyAdvertisement(
      env,
      url,
    );
  }


  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/advertisements/review"
  ) {
    return reviewAdvertisement(
      env,
      url,
    );
  }


  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/advertisements/review-action"
  ) {
    return reviewAdvertisementAction(
      request,
      env,
      url,
    );
  }


  if (
    request.method ===
      "GET" &&
    url.pathname ===
      "/api/advertisements/delete"
  ) {
    return deleteAdvertisementPage(
      env,
      url,
    );
  }


  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/advertisements/delete"
  ) {
    return deleteAdvertisementAction(
      request,
      env,
    );
  }


  return null;
}