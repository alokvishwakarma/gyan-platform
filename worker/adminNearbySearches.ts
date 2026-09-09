import {
  getAdminSession,
} from "./adminAuth";


function json(
  body:
    unknown,

  status =
    200,
): Response {
  return new Response(
    JSON.stringify(
      body,
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


async function requireAdmin(
  request:
    Request,

  env:
    Env,
): Promise<Response | null> {
  const session =
    await getAdminSession(
      request,
      env,
    );

  if (session) {
    return null;
  }

  return json(
    {
      error:
        "Administrator authentication is required.",
    },
    401,
  );
}


export async function handleAdminNearbySearchesRoute(
  request:
    Request,

  env:
    Env,

  url:
    URL,
): Promise<Response | null> {
  if (
    !url.pathname.startsWith(
      "/api/admin/nearby-searches",
    )
  ) {
    return null;
  }

  const authError =
    await requireAdmin(
      request,
      env,
    );

  if (authError) {
    return authError;
  }

  if (
    request.method !==
      "GET"
  ) {
    return json(
      {
        error:
          "Method not allowed.",
      },
      405,
    );
  }

  if (
    url.pathname ===
      "/api/admin/nearby-searches"
  ) {
    const recent =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            search_key,
            service_code,
            location_mode,
            city,
            state,
            latitude_bucket,
            longitude_bucket,
            search_count,
            registered_result_count,
            external_result_count,
            first_searched_at,
            last_searched_at,
            expires_at

          FROM nearby_search_cache

          ORDER BY
            last_searched_at DESC

          LIMIT 100
          `,
        )
        .all<{
          search_key:
            string;

          service_code:
            string;

          location_mode:
            string;

          city:
            string | null;

          state:
            string | null;

          latitude_bucket:
            number | null;

          longitude_bucket:
            number | null;

          search_count:
            number;

          registered_result_count:
            number;

          external_result_count:
            number;

          first_searched_at:
            string;

          last_searched_at:
            string;

          expires_at:
            string;
        }>();

    const popular =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            service_code,
            SUM(search_count)
              AS total_searches,
            COUNT(*)
              AS location_count,
            MAX(last_searched_at)
              AS last_searched_at

          FROM nearby_search_cache

          GROUP BY
            service_code

          ORDER BY
            total_searches DESC,
            service_code ASC

          LIMIT 30
          `,
        )
        .all<{
          service_code:
            string;

          total_searches:
            number;

          location_count:
            number;

          last_searched_at:
            string;
        }>();

    const totals =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            COALESCE(
              SUM(search_count),
              0
            ) AS searches,

            COUNT(*) AS search_keys

          FROM nearby_search_cache
          `,
        )
        .first<{
          searches:
            number;

          search_keys:
            number;
        }>();

    const placeTotals =
      await env.gyan_registry
        .prepare(
          `
          SELECT
            COUNT(*) AS places,
            COALESCE(
              SUM(seen_count),
              0
            ) AS appearances

          FROM nearby_discovered_places
          `,
        )
        .first<{
          places:
            number;

          appearances:
            number;
        }>();

    return json({
      totals: {
        searches:
          Number(
            totals?.searches ??
            0,
          ),

        searchKeys:
          Number(
            totals?.search_keys ??
            0,
          ),

        places:
          Number(
            placeTotals?.places ??
            0,
          ),

        placeAppearances:
          Number(
            placeTotals?.appearances ??
            0,
          ),
      },

      popularServices:
        popular.results.map(
          (
            row,
          ) => ({
            serviceCode:
              row.service_code,

            searches:
              Number(
                row.total_searches ??
                0,
              ),

            locations:
              Number(
                row.location_count ??
                0,
              ),

            lastSearchedAt:
              row.last_searched_at,
          }),
        ),

      recentSearches:
        recent.results.map(
          (
            row,
          ) => ({
            searchKey:
              row.search_key,

            serviceCode:
              row.service_code,

            locationMode:
              row.location_mode,

            city:
              row.city,

            state:
              row.state,

            latitudeBucket:
              row.latitude_bucket,

            longitudeBucket:
              row.longitude_bucket,

            searches:
              Number(
                row.search_count ??
                0,
              ),

            registeredResults:
              Number(
                row.registered_result_count ??
                0,
              ),

            externalResults:
              Number(
                row.external_result_count ??
                0,
              ),

            firstSearchedAt:
              row.first_searched_at,

            lastSearchedAt:
              row.last_searched_at,

            expiresAt:
              row.expires_at,
          }),
        ),
    });
  }

  if (
    url.pathname ===
      "/api/admin/nearby-searches/places"
  ) {
    const serviceCode =
      (
        url.searchParams.get(
          "serviceCode",
        ) ??
        ""
      )
        .trim()
        .toUpperCase();

    const params:
      unknown[] = [];

    let whereClause =
      "";

    if (serviceCode) {
      whereClause =
        `
        WHERE ndps.service_code = ?
        `;

      params.push(
        serviceCode,
      );
    }

    const statement =
      env.gyan_registry
        .prepare(
          `
          SELECT
            ndp.provider,
            ndp.provider_place_id,
            ndp.name,
            ndp.address,
            ndp.latitude,
            ndp.longitude,
            ndp.phone_number,
            ndp.website,
            ndp.categories_json,
            ndp.first_seen_at,
            ndp.last_seen_at,
            ndp.seen_count,

            GROUP_CONCAT(
              DISTINCT ndps.service_code
            ) AS service_codes,

            COALESCE(
              SUM(
                ndps.seen_count
              ),
              0
            ) AS service_appearances

          FROM nearby_discovered_places ndp

          LEFT JOIN nearby_discovered_place_services ndps
            ON ndps.provider =
                 ndp.provider
            AND ndps.provider_place_id =
                 ndp.provider_place_id

          ${whereClause}

          GROUP BY
            ndp.provider,
            ndp.provider_place_id,
            ndp.name,
            ndp.address,
            ndp.latitude,
            ndp.longitude,
            ndp.phone_number,
            ndp.website,
            ndp.categories_json,
            ndp.first_seen_at,
            ndp.last_seen_at,
            ndp.seen_count

          ORDER BY
            service_appearances DESC,
            ndp.last_seen_at DESC

          LIMIT 200
          `,
        );

    const result =
      params.length
        ? await statement
            .bind(
              ...params,
            )
            .all<{
              provider:
                string;

              provider_place_id:
                string;

              name:
                string;

              address:
                string;

              latitude:
                number | null;

              longitude:
                number | null;

              phone_number:
                string | null;

              website:
                string | null;

              categories_json:
                string;

              first_seen_at:
                string;

              last_seen_at:
                string;

              seen_count:
                number;

              service_codes:
                string | null;

              service_appearances:
                number;
            }>()
        : await statement
            .all<{
              provider:
                string;

              provider_place_id:
                string;

              name:
                string;

              address:
                string;

              latitude:
                number | null;

              longitude:
                number | null;

              phone_number:
                string | null;

              website:
                string | null;

              categories_json:
                string;

              first_seen_at:
                string;

              last_seen_at:
                string;

              seen_count:
                number;

              service_codes:
                string | null;

              service_appearances:
                number;
            }>();

    return json({
      serviceCode:
        serviceCode ||
        null,

      places:
        result.results.map(
          (
            row,
          ) => ({
            provider:
              row.provider,

            providerPlaceId:
              row.provider_place_id,

            name:
              row.name,

            address:
              row.address,

            latitude:
              row.latitude,

            longitude:
              row.longitude,

            phoneNumber:
              row.phone_number,

            website:
              row.website,

            categories:
              (() => {
                try {
                  const parsed =
                    JSON.parse(
                      row.categories_json,
                    );

                  return Array.isArray(
                    parsed,
                  )
                    ? parsed
                    : [];
                } catch {
                  return [];
                }
              })(),

            firstSeenAt:
              row.first_seen_at,

            lastSeenAt:
              row.last_seen_at,

            seenCount:
              Number(
                row.seen_count ??
                0,
              ),

            serviceCodes:
              row.service_codes
                ?.split(",")
                .map(
                  (
                    value,
                  ) =>
                    value.trim(),
                )
                .filter(
                  Boolean,
                ) ??
              [],

            serviceAppearances:
              Number(
                row.service_appearances ??
                0,
              ),
          }),
        ),
    });
  }

  return json(
    {
      error:
        "Admin nearby search route not found.",
    },
    404,
  );
}
