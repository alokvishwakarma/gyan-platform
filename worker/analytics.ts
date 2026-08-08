import {
  getAdminSession,
} from "./adminAuth";

interface AnalyticsVisitBody {
  visitorId?: string;
}

type AnalyticsPeriod =
  | "today"
  | "7d"
  | "30d"
  | "1y";

interface CountRow {
  count: number;
}

interface AnalyticsGeoRow {
  country_code: string;
  region: string;
  city: string;
  latitude: number | null;
  longitude: number | null;
  unique_visitors: number;
  visits: number;
}

interface AnalyticsTrendRow {
  analytics_date: string;
  unique_visitors: number;
  visits: number;
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

function cleanString(
  value: unknown,
  fallback = "",
): string {
  return typeof value === "string"
    ? value.trim()
    : fallback;
}

function normalizePeriod(
  value: string | null,
): AnalyticsPeriod {
  switch (value) {
    case "today":
    case "7d":
    case "30d":
    case "1y":
      return value;
    default:
      return "today";
  }
}

function periodDays(
  period: AnalyticsPeriod,
): number {
  switch (period) {
    case "today":
      return 1;
    case "7d":
      return 7;
    case "30d":
      return 30;
    case "1y":
      return 365;
  }
}

function dateModifier(
  days: number,
): string {
  return `-${Math.max(0, days - 1)} days`;
}

function bytesToHex(
  bytes: Uint8Array,
): string {
  return Array.from(bytes)
    .map((value) =>
      value
        .toString(16)
        .padStart(2, "0"),
    )
    .join("");
}

async function sha256(
  value: string,
): Promise<string> {
  const digest =
    await crypto.subtle.digest(
      "SHA-256",
      new TextEncoder().encode(value),
    );

  return bytesToHex(
    new Uint8Array(digest),
  );
}

function getGeo(
  request: Request,
) {
  const cf = request.cf;

  const latitude =
    Number(cf?.latitude);
  const longitude =
    Number(cf?.longitude);

  return {
    countryCode:
      cleanString(
        cf?.country,
        "XX",
      ) || "XX",

    region:
      cleanString(
        cf?.region,
        "Unknown",
      ) || "Unknown",

    city:
      cleanString(
        cf?.city,
        "Unknown",
      ) || "Unknown",

    latitude:
      Number.isFinite(latitude)
        ? latitude
        : null,

    longitude:
      Number.isFinite(longitude)
        ? longitude
        : null,
  };
}

async function recordVisit(
  request: Request,
  env: Env,
): Promise<Response> {
  let body: AnalyticsVisitBody;

  try {
    body =
      await request.json<
        AnalyticsVisitBody
      >();
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid analytics request.",
      },
      400,
    );
  }

  const visitorId =
    cleanString(body.visitorId);

  if (
    !visitorId ||
    visitorId.length > 200
  ) {
    return jsonResponse(
      {
        error:
          "Invalid visitor identifier.",
      },
      400,
    );
  }

  const today =
    new Date()
      .toISOString()
      .slice(0, 10);

  const analyticsEnv =
    env as Env & {
      ANALYTICS_HASH_SALT?: string;
    };

  const salt =
    analyticsEnv
      .ANALYTICS_HASH_SALT ??
    "gyan-analytics-v1";

  // Date-scoped hash prevents long-term
  // server-side tracking of a browser.
  const visitorHash =
    await sha256(
      `${today}|${visitorId}|${salt}`,
    );

  const geo = getGeo(request);

  const dedupeResult =
    await env.gyan_registry
      .prepare(
        `
        INSERT OR IGNORE
        INTO daily_analytics_visitors (
          analytics_date,
          visitor_hash,
          country_code,
          region,
          city
        )
        VALUES (?, ?, ?, ?, ?)
        `,
      )
      .bind(
        today,
        visitorHash,
        geo.countryCode,
        geo.region,
        geo.city,
      )
      .run();

  const isUnique =
    Number(
      dedupeResult.meta.changes ?? 0,
    ) > 0;

  await env.gyan_registry
    .prepare(
      `
      INSERT INTO daily_analytics (
        analytics_date,
        country_code,
        region,
        city,
        latitude,
        longitude,
        unique_visitors,
        visits,
        updated_at
      )
      VALUES (?, ?, ?, ?, ?, ?, ?, 1, CURRENT_TIMESTAMP)
      ON CONFLICT (
        analytics_date,
        country_code,
        region,
        city
      )
      DO UPDATE SET
        visits =
          daily_analytics.visits + 1,
        unique_visitors =
          daily_analytics.unique_visitors +
          excluded.unique_visitors,
        latitude = COALESCE(
          daily_analytics.latitude,
          excluded.latitude
        ),
        longitude = COALESCE(
          daily_analytics.longitude,
          excluded.longitude
        ),
        updated_at = CURRENT_TIMESTAMP
      `,
    )
    .bind(
      today,
      geo.countryCode,
      geo.region,
      geo.city,
      geo.latitude,
      geo.longitude,
      isUnique ? 1 : 0,
    )
    .run();

  return jsonResponse({
    recorded: true,
    uniqueToday: isUnique,
  });
}

async function safeCount(
  env: Env,
  sql: string,
  bindings: unknown[] = [],
): Promise<number> {
  try {
    const row =
      await env.gyan_registry
        .prepare(sql)
        .bind(...bindings)
        .first<CountRow>();

    return Number(row?.count ?? 0);
  } catch (error) {
    console.debug(
      "Optional analytics metric unavailable:",
      error,
    );
    return 0;
  }
}

async function getPuzzleWinCounts(
  env: Env,
  modifier: string,
): Promise<
  Record<string, number>
> {
  try {
    const columns =
      await env.gyan_registry
        .prepare(
          "PRAGMA table_info(puzzle_winners)",
        )
        .all<{ name: string }>();

    if (!columns.results.length) {
      return {};
    }

    const names = new Set(
      columns.results.map(
        (column) => column.name,
      ),
    );

    const sizeColumn =
      [
        "size",
        "puzzle_size",
        "board_size",
        "stage",
      ].find((name) =>
        names.has(name),
      );

    const dateColumn =
      [
        "created_at",
        "won_at",
        "completed_at",
      ].find((name) =>
        names.has(name),
      );

    if (!sizeColumn) {
      return {};
    }

    const where =
      dateColumn
        ? `WHERE date(${dateColumn}) >= date('now', ?)`
        : "";

    const result =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            CAST(${sizeColumn} AS TEXT)
              AS label,
            COUNT(*) AS count
          FROM puzzle_winners
          ${where}
          GROUP BY ${sizeColumn}
          `,
        )
        .bind(
          ...(dateColumn
            ? [modifier]
            : []),
        )
        .all<{
          label: string;
          count: number;
        }>();

    const counts:
      Record<string, number> = {};

    for (const row of result.results) {
      const label =
        String(row.label)
          .trim()
          .toLowerCase();

      if (
        label === "5" ||
        label === "5x5" ||
        label.includes("5x5")
      ) {
        counts["5x5"] =
          Number(row.count);
      } else if (
        label === "7" ||
        label === "7x7" ||
        label.includes("7x7")
      ) {
        counts["7x7"] =
          Number(row.count);
      } else {
        counts[String(row.label)] =
          Number(row.count);
      }
    }

    return counts;
  } catch (error) {
    console.debug(
      "Puzzle analytics unavailable:",
      error,
    );
    return {};
  }
}

async function analyticsReport(
  env: Env,
  url: URL,
): Promise<Response> {
  const period =
    normalizePeriod(
      url.searchParams.get("period"),
    );

  const days = periodDays(period);
  const modifier =
    dateModifier(days);

  const totals =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          COALESCE(SUM(unique_visitors), 0)
            AS unique_visitors,
          COALESCE(SUM(visits), 0)
            AS visits
        FROM daily_analytics
        WHERE analytics_date >=
          date('now', ?)
        `,
      )
      .bind(modifier)
      .first<{
        unique_visitors: number;
        visits: number;
      }>();

  const mapResult =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          country_code,
          region,
          city,
          AVG(latitude) AS latitude,
          AVG(longitude) AS longitude,
          SUM(unique_visitors)
            AS unique_visitors,
          SUM(visits) AS visits
        FROM daily_analytics
        WHERE analytics_date >=
          date('now', ?)
        GROUP BY
          country_code,
          region,
          city
        ORDER BY unique_visitors DESC
        `,
      )
      .bind(modifier)
      .all<AnalyticsGeoRow>();

  const trendResult =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          analytics_date,
          SUM(unique_visitors)
            AS unique_visitors,
          SUM(visits) AS visits
        FROM daily_analytics
        WHERE analytics_date >=
          date('now', ?)
        GROUP BY analytics_date
        ORDER BY analytics_date
        `,
      )
      .bind(modifier)
      .all<AnalyticsTrendRow>();

  const [
    shopsTotal,
    newShops,
    adsSubmitted,
    adsApproved,
    serviceRequests,
    requestsToShops,
    requestsToSupport,
    registeredUsers,
    puzzleWins,
  ] = await Promise.all([
    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM shops
       WHERE code != 'SUPP'`,
    ),

    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM shops
       WHERE code != 'SUPP'
         AND date(created_at) >=
           date('now', ?)`,
      [modifier],
    ),

    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM advertisement_submissions
       WHERE date(created_at) >=
         date('now', ?)`,
      [modifier],
    ),

    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM advertisement_submissions
       WHERE status = 'approved'
         AND date(approved_at) >=
           date('now', ?)`,
      [modifier],
    ),

    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM local_service_requests
       WHERE date(created_at) >=
         date('now', ?)`,
      [modifier],
    ),

    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM local_service_requests
       WHERE assigned_shop_code IS NOT NULL
         AND assigned_shop_code != 'SUPP'
         AND date(created_at) >=
           date('now', ?)`,
      [modifier],
    ),

    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM local_service_requests
       WHERE assigned_shop_code = 'SUPP'
         AND date(created_at) >=
           date('now', ?)`,
      [modifier],
    ),

    // Automatically becomes useful once
    // a real users table exists.
    safeCount(
      env,
      `SELECT COUNT(*) AS count
       FROM users`,
    ),

    getPuzzleWinCounts(
      env,
      modifier,
    ),
  ]);

  return jsonResponse({
    period,
    days,
    summary: {
      uniqueVisitors:
        Number(
          totals?.unique_visitors ?? 0,
        ),
      visits:
        Number(totals?.visits ?? 0),
      registeredUsers,
      registeredShops: shopsTotal,
      newShops,
      adsSubmitted,
      adsApproved,
      serviceRequests,
      requestsToShops,
      requestsToSupport,
      puzzleWins,
    },
    mapPoints:
      mapResult.results.map((row) => ({
        countryCode: row.country_code,
        region: row.region,
        city: row.city,
        latitude:
          row.latitude == null
            ? null
            : Number(row.latitude),
        longitude:
          row.longitude == null
            ? null
            : Number(row.longitude),
        uniqueVisitors:
          Number(row.unique_visitors),
        visits:
          Number(row.visits),
      })),
    trend:
      trendResult.results.map((row) => ({
        date: row.analytics_date,
        uniqueVisitors:
          Number(row.unique_visitors),
        visits:
          Number(row.visits),
      })),
  });
}


type AnalyticsDetailMetric =
  | "visitors"
  | "visits"
  | "users"
  | "shops"
  | "ads"
  | "ads-approved"
  | "requests"
  | "requests-shops"
  | "requests-support"
  | "shops-new"
  | "puzzle-5"
  | "puzzle-7"
  | "location"
  | "trend-date";

interface AnalyticsDetailRow {
  id: string;
  title: string;
  subtitle: string;
  meta: string;
  badge?: string;
}

function valueText(
  value: unknown,
): string {
  if (
    value === null ||
    value === undefined
  ) {
    return "";
  }

  return String(
    value,
  ).trim();
}

function firstValue(
  row:
    Record<string, unknown>,
  names:
    string[],
): string {
  for (
    const name of
    names
  ) {
    const value =
      valueText(
        row[name],
      );

    if (
      value
    ) {
      return value;
    }
  }

  return "";
}

async function requireAnalyticsAdmin(
  request: Request,
  env: Env,
): Promise<Response | null> {
  const session =
    await getAdminSession(
      request,
      env,
    );

  if (
    session
  ) {
    return null;
  }

  return jsonResponse(
    {
      error:
        "Administrator authentication is required.",
    },
    401,
  );
}

function normalizeDetailMetric(
  value:
    string | null,
): AnalyticsDetailMetric | null {
  switch (
    value
  ) {
    case "visitors":
    case "visits":
    case "users":
    case "shops":
    case "ads":
    case "ads-approved":
    case "requests":
    case "requests-shops":
    case "requests-support":
    case "shops-new":
    case "puzzle-5":
    case "puzzle-7":
    case "location":
    case "trend-date":
      return value;

    default:
      return null;
  }
}

async function getPuzzleDetailRows(
  env: Env,
  size:
    "5"
    | "7",
  modifier: string,
): Promise<
  AnalyticsDetailRow[]
> {
  try {
    const columns =
      await env.gyan_registry
        .prepare(
          "PRAGMA table_info(puzzle_winners)",
        )
        .all<{
          name: string;
        }>();

    if (
      !columns.results.length
    ) {
      return [];
    }

    const names =
      new Set(
        columns.results.map(
          (
            column,
          ) =>
            column.name,
        ),
      );

    const sizeColumn =
      [
        "size",
        "puzzle_size",
        "board_size",
        "stage",
      ].find(
        (
          name,
        ) =>
          names.has(
            name,
          ),
      );

    const dateColumn =
      [
        "created_at",
        "won_at",
        "completed_at",
      ].find(
        (
          name,
        ) =>
          names.has(
            name,
          ),
      );

    if (
      !sizeColumn
    ) {
      return [];
    }

    const whereParts =
      [
        `(
          CAST(${sizeColumn} AS TEXT) = ?
          OR lower(CAST(${sizeColumn} AS TEXT)) = ?
        )`,
      ];

    const bindings:
      unknown[] = [
        size,
        `${size}x${size}`,
      ];

    if (
      dateColumn
    ) {
      whereParts.push(
        `date(${dateColumn}) >= date('now', ?)`,
      );

      bindings.push(
        modifier,
      );
    }

    const result =
      await env.gyan_registry
        .prepare(
          `
          SELECT *

          FROM puzzle_winners

          WHERE
            ${whereParts.join(
              "\nAND ",
            )}

          ORDER BY
            ${
              dateColumn ??
              "rowid"
            }
            DESC

          LIMIT 100
          `,
        )
        .bind(
          ...bindings,
        )
        .all<
          Record<
            string,
            unknown
          >
        >();

    return result.results.map(
      (
        row,
        index,
      ) => {
        const winner =
          firstValue(
            row,
            [
              "winner_name",
              "display_name",
              "name",
              "email",
              "player_name",
            ],
          ) ||
          `Winner ${index + 1}`;

        const location =
          [
            firstValue(
              row,
              [
                "city",
              ],
            ),

            firstValue(
              row,
              [
                "region",
                "state",
              ],
            ),

            firstValue(
              row,
              [
                "country",
                "country_code",
              ],
            ),
          ]
            .filter(
              Boolean,
            )
            .join(
              ", ",
            );

        const date =
          dateColumn
            ? valueText(
                row[
                  dateColumn
                ],
              )
            : "";

        const puzzleId =
          firstValue(
            row,
            [
              "puzzle_id",
              "puzzle_number",
              "week_key",
              "week",
            ],
          );

        return {
          id:
            firstValue(
              row,
              [
                "id",
              ],
            ) ||
            `puzzle-${size}-${index}`,

          title:
            winner,

          subtitle:
            location ||
            `${size}×${size} puzzle winner`,

          meta:
            [
              puzzleId
                ? `Puzzle ${puzzleId}`
                : "",

              date,
            ]
              .filter(
                Boolean,
              )
              .join(
                " · ",
              ),

          badge:
            `${size}×${size}`,
        };
      },
    );
  } catch (
    error
  ) {
    console.debug(
      "Puzzle winner details unavailable:",
      error,
    );

    return [];
  }
}

async function analyticsDetails(
  env: Env,
  url: URL,
): Promise<Response> {
  const metric =
    normalizeDetailMetric(
      url.searchParams.get(
        "metric",
      ),
    );

  if (
    !metric
  ) {
    return jsonResponse(
      {
        error:
          "Unknown analytics detail metric.",
      },
      400,
    );
  }

  const period =
    normalizePeriod(
      url.searchParams.get(
        "period",
      ),
    );

  const modifier =
    dateModifier(
      periodDays(
        period,
      ),
    );

  const country =
    cleanString(
      url.searchParams.get(
        "country",
      ),
    );

  const region =
    cleanString(
      url.searchParams.get(
        "region",
      ),
    );

  const city =
    cleanString(
      url.searchParams.get(
        "city",
      ),
    );

  const requestedDate =
    cleanString(
      url.searchParams.get(
        "date",
      ),
    );

  let title =
    "Analytics details";

  let rows:
    AnalyticsDetailRow[] =
      [];

  if (
    metric ===
      "visitors" ||
    metric ===
      "visits"
  ) {
    title =
      metric ===
        "visitors"
        ? "Unique visitors"
        : "Visits";

    const result =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            country_code,
            region,
            city,

            SUM(
              unique_visitors
            ) AS unique_visitors,

            SUM(
              visits
            ) AS visits

          FROM daily_analytics

          WHERE
            analytics_date >=
              date(
                'now',
                ?
              )

          GROUP BY
            country_code,
            region,
            city

          ORDER BY
            ${
              metric ===
                "visitors"
                ? "unique_visitors"
                : "visits"
            }
            DESC

          LIMIT 100
          `,
        )
        .bind(
          modifier,
        )
        .all<{
          country_code: string;
          region: string;
          city: string;
          unique_visitors: number;
          visits: number;
        }>();

    rows =
      result.results.map(
        (
          row,
          index,
        ) => ({
          id:
            `geo-${index}`,

          title:
            row.city ||
            "Unknown city",

          subtitle:
            [
              row.region,
              row.country_code,
            ]
              .filter(
                Boolean,
              )
              .join(
                ", ",
              ),

          meta:
            `${Number(
              row.unique_visitors,
            ).toLocaleString()} visitors · ${Number(
              row.visits,
            ).toLocaleString()} visits`,
        }),
      );
  } else if (
    metric ===
      "shops" ||
    metric ===
      "shops-new"
  ) {
    title =
      metric ===
        "shops-new"
        ? "New shops"
        : "Registered shops";

    const newOnly =
      metric ===
        "shops-new"
        ? `
          AND date(
            created_at
          ) >= date(
            'now',
            ?
          )
        `
        : "";

    const result =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            code,
            name,
            city,
            state,
            status,
            created_at

          FROM shops

          WHERE
            code !=
              'SUPP'

            ${newOnly}

          ORDER BY
            created_at
            DESC

          LIMIT 100
          `,
        )
        .bind(
          ...(
            metric ===
              "shops-new"
              ? [
                  modifier,
                ]
              : []
          ),
        )
        .all<{
          code: string;
          name: string;
          city: string;
          state: string;
          status: string;
          created_at: string;
        }>();

    rows =
      result.results.map(
        (
          row,
        ) => ({
          id:
            row.code,

          title:
            row.name,

          subtitle:
            [
              row.city,
              row.state,
            ]
              .filter(
                Boolean,
              )
              .join(
                ", ",
              ),

          meta:
            `${row.code} · ${row.created_at}`,

          badge:
            row.status,
        }),
      );
  } else if (
    metric ===
      "ads" ||
    metric ===
      "ads-approved"
  ) {
    title =
      metric ===
        "ads-approved"
        ? "Approved advertisements"
        : "Advertisements submitted";

    const approvedOnly =
      metric ===
        "ads-approved"
        ? `
          AND status =
            'approved'

          AND date(
            approved_at
          ) >= date(
            'now',
            ?
          )
        `
        : `
          AND date(
            created_at
          ) >= date(
            'now',
            ?
          )
        `;

    const result =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            id,
            business_name,
            service_name,
            discount_percent,
            email,
            status,
            created_at,
            approved_at

          FROM advertisement_submissions

          WHERE
            1 = 1

            ${approvedOnly}

          ORDER BY
            COALESCE(
              approved_at,
              created_at
            )
            DESC

          LIMIT 100
          `,
        )
        .bind(
          modifier,
        )
        .all<{
          id: number;
          business_name: string;
          service_name: string;
          discount_percent:
            number | null;
          email: string;
          status: string;
          created_at: string;
          approved_at:
            string | null;
        }>();

    rows =
      result.results.map(
        (
          row,
        ) => ({
          id:
            String(
              row.id,
            ),

          title:
            row.business_name,

          subtitle:
            row.service_name,

          meta:
            [
              row.discount_percent !=
                null
                ? `${row.discount_percent}% discount`
                : "",

              row.email,

              row.approved_at ??
              row.created_at,
            ]
              .filter(
                Boolean,
              )
              .join(
                " · ",
              ),

          badge:
            row.status,
        }),
      );
  } else if (
    metric ===
      "requests" ||
    metric ===
      "requests-shops" ||
    metric ===
      "requests-support"
  ) {
    title =
      metric ===
        "requests-shops"
        ? "Requests routed to shops"
        : metric ===
            "requests-support"
          ? "Requests routed to GYAN Support"
          : "Service requests";

    let assignmentClause =
      "";

    if (
      metric ===
        "requests-shops"
    ) {
      assignmentClause =
        `
        AND assigned_shop_code
          IS NOT NULL

        AND assigned_shop_code !=
          'SUPP'
        `;
    } else if (
      metric ===
        "requests-support"
    ) {
      assignmentClause =
        `
        AND assigned_shop_code =
          'SUPP'
        `;
    }

    const result =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            id,
            service_name,
            details,
            email,
            phone,
            preferred_time,
            status,
            assigned_shop_code,
            created_at

          FROM local_service_requests

          WHERE
            date(
              created_at
            ) >= date(
              'now',
              ?
            )

            ${assignmentClause}

          ORDER BY
            created_at
            DESC

          LIMIT 100
          `,
        )
        .bind(
          modifier,
        )
        .all<{
          id: number;
          service_name: string;
          details:
            string | null;
          email: string;
          phone:
            string | null;
          preferred_time:
            string | null;
          status: string;
          assigned_shop_code:
            string | null;
          created_at: string;
        }>();

    rows =
      result.results.map(
        (
          row,
        ) => ({
          id:
            String(
              row.id,
            ),

          title:
            row.service_name,

          subtitle:
            row.details ||
            row.email,

          meta:
            [
              row.assigned_shop_code
                ? `Assigned ${row.assigned_shop_code}`
                : "Not assigned",

              row.preferred_time ||
              "",

              row.created_at,
            ]
              .filter(
                Boolean,
              )
              .join(
                " · ",
              ),

          badge:
            row.status,
        }),
      );
  } else if (
    metric ===
      "users"
  ) {
    title =
      "Registered users";

    try {
      const table =
        await env.gyan_registry
          .prepare(
            `
            SELECT
              COUNT(*) AS count

            FROM sqlite_master

            WHERE
              type =
                'table'

              AND name =
                'users'
            `,
          )
          .first<
            CountRow
          >();

      if (
        Number(
          table?.count ??
          0,
        ) >
        0
      ) {
        const result =
          await env.gyan_registry
            .prepare(
              `
              SELECT *

              FROM users

              ORDER BY
                rowid
                DESC

              LIMIT 100
              `,
            )
            .all<
              Record<
                string,
                unknown
              >
            >();

        rows =
          result.results.map(
            (
              row,
              index,
            ) => ({
              id:
                firstValue(
                  row,
                  [
                    "id",
                    "user_id",
                  ],
                ) ||
                `user-${index}`,

              title:
                firstValue(
                  row,
                  [
                    "name",
                    "display_name",
                    "email",
                    "phone",
                  ],
                ) ||
                `User ${index + 1}`,

              subtitle:
                firstValue(
                  row,
                  [
                    "email",
                    "phone",
                  ],
                ),

              meta:
                firstValue(
                  row,
                  [
                    "created_at",
                    "updated_at",
                  ],
                ),

              badge:
                firstValue(
                  row,
                  [
                    "status",
                    "role",
                  ],
                ) ||
                undefined,
            }),
          );
      }
    } catch (
      error
    ) {
      console.debug(
        "Registered-user details unavailable:",
        error,
      );
    }
  } else if (
    metric ===
      "puzzle-5" ||
    metric ===
      "puzzle-7"
  ) {
    const size =
      metric ===
        "puzzle-5"
        ? "5"
        : "7";

    title =
      `${size}×${size} puzzle winners`;

    rows =
      await getPuzzleDetailRows(
        env,
        size,
        modifier,
      );
  } else if (
    metric ===
      "location"
  ) {
    title =
      [
        city,
        region,
        country,
      ]
        .filter(
          Boolean,
        )
        .join(
          ", ",
        ) ||
      "Location activity";

    const result =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            analytics_date,
            unique_visitors,
            visits

          FROM daily_analytics

          WHERE
            analytics_date >=
              date(
                'now',
                ?
              )

            AND country_code =
              ?

            AND region =
              ?

            AND city =
              ?

          ORDER BY
            analytics_date
            DESC

          LIMIT 100
          `,
        )
        .bind(
          modifier,
          country,
          region,
          city,
        )
        .all<{
          analytics_date: string;
          unique_visitors: number;
          visits: number;
        }>();

    rows =
      result.results.map(
        (
          row,
        ) => ({
          id:
            row.analytics_date,

          title:
            row.analytics_date,

          subtitle:
            `${Number(
              row.unique_visitors,
            ).toLocaleString()} unique visitors`,

          meta:
            `${Number(
              row.visits,
            ).toLocaleString()} visits`,
        }),
      );
  } else if (
    metric ===
      "trend-date"
  ) {
    title =
      requestedDate
        ? `Activity on ${requestedDate}`
        : "Daily activity";

    if (
      requestedDate
    ) {
      const result =
        await env.gyan_registry
          .prepare(
            `
            SELECT
              country_code,
              region,
              city,
              unique_visitors,
              visits

            FROM daily_analytics

            WHERE
              analytics_date =
                ?

            ORDER BY
              unique_visitors
              DESC,
              visits
              DESC

            LIMIT 100
            `,
          )
          .bind(
            requestedDate,
          )
          .all<{
            country_code: string;
            region: string;
            city: string;
            unique_visitors: number;
            visits: number;
          }>();

      rows =
        result.results.map(
          (
            row,
            index,
          ) => ({
            id:
              `day-${index}`,

            title:
              row.city ||
              "Unknown city",

            subtitle:
              [
                row.region,
                row.country_code,
              ]
                .filter(
                  Boolean,
                )
                .join(
                  ", ",
                ),

            meta:
              `${Number(
                row.unique_visitors,
              ).toLocaleString()} visitors · ${Number(
                row.visits,
              ).toLocaleString()} visits`,
          }),
        );
    }
  }

  return jsonResponse({
    metric,
    period,
    title,
    total:
      rows.length,
    rows,
  });
}


export async function cleanupAnalytics(
  env: Env,
): Promise<void> {
  await env.gyan_registry
    .prepare(
      `DELETE FROM daily_analytics_visitors
       WHERE analytics_date <
         date('now', '-30 days')`,
    )
    .run();

  await env.gyan_registry
    .prepare(
      `DELETE FROM daily_analytics
       WHERE analytics_date <
         date('now', '-365 days')`,
    )
    .run();
}

export async function handleAnalyticsRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    request.method ===
      "POST" &&
    url.pathname ===
      "/api/analytics/visit"
  ) {
    return recordVisit(
      request,
      env,
    );
  }

  if (
    request.method ===
      "GET" &&
    (
      url.pathname ===
        "/api/admin/analytics" ||
      url.pathname ===
        "/api/admin/analytics/details"
    )
  ) {
    const authResponse =
      await requireAnalyticsAdmin(
        request,
        env,
      );

    if (
      authResponse
    ) {
      return authResponse;
    }

    if (
      url.pathname ===
        "/api/admin/analytics/details"
    ) {
      return analyticsDetails(
        env,
        url,
      );
    }

    return analyticsReport(
      env,
      url,
    );
  }

  return null;
}