interface NearbyShopRow {
  code: string;
  name: string;
  address_line: string;
  city: string;
  state: string;
  postal_code: string;

  phone_number: string;
  whatsapp_number: string | null;

  latitude: number | null;
  longitude: number | null;

  matching_service_count: number;
  service_names: string | null;
}

interface NearbyShopResult {
  code: string;
  name: string;
  address: string;

  phoneNumber: string;
  whatsappNumber: string | null;

  latitude: number | null;
  longitude: number | null;

  distanceKm: number | null;

  matchingServiceCount: number;
  serviceNames: string[];
}

const SERVICE_SEARCH_TERMS:
  Record<string, string[]> = {
    NEARBY_PRINT: [
      "print",
      "printing",
      "photocopy",
      "scan",
    ],

    NEARBY_GROCERY: [
      "grocery",
      "vegetable",
      "daily needs",
    ],

    NEARBY_MEDICAL: [
      "medical",
      "medicine",
      "pharmacy",
      "clinic",
    ],

    NEARBY_TUITION: [
      "tuition",
      "tutor",
      "coaching",
      "education",
    ],

    NEARBY_FOOD: [
      "food",
      "restaurant",
      "tiffin",
      "snack",
    ],

    NEARBY_BANKING: [
      "banking",
      "payment",
      "insurance",
      "financial",
    ],

    NEARBY_COURIER: [
      "courier",
      "parcel",
      "postal",
      "delivery",
    ],

    NEARBY_COMPUTER: [
      "computer",
      "internet",
      "accessories",
      "technology",
    ],

    NEARBY_REPAIR: [
      "repair",
      "mobile",
      "appliance",
      "computer repair",
    ],
  };

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

function getOptionalNumber(
  rawValue: string | null,
): number | null {
  if (!rawValue) {
    return null;
  }

  const value =
    Number(rawValue);

  return Number.isFinite(value)
    ? value
    : null;
}

function calculateDistanceKm(
  firstLatitude: number,
  firstLongitude: number,
  secondLatitude: number,
  secondLongitude: number,
): number {
  const earthRadiusKm =
    6371;

  const toRadians = (
    value: number,
  ): number =>
    value * Math.PI / 180;

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

  const haversine =
    Math.sin(
      latitudeDifference / 2,
    ) ** 2 +
    Math.cos(
      firstLatitudeRadians,
    ) *
      Math.cos(
        secondLatitudeRadians,
      ) *
      Math.sin(
        longitudeDifference / 2,
      ) ** 2;

  return (
    2 *
    earthRadiusKm *
    Math.asin(
      Math.sqrt(haversine),
    )
  );
}

function normalizeText(
  value: string | null,
): string {
  return value
    ?.trim()
    .toLowerCase() ?? "";
}

export async function handleNearbyShopsRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    request.method !== "GET" ||
    url.pathname !==
      "/api/nearby-shops"
  ) {
    return null;
  }

  const serviceCode =
    url.searchParams
      .get("serviceCode")
      ?.trim()
      .toUpperCase() ??
    "";

  const latitude =
    getOptionalNumber(
      url.searchParams.get("lat"),
    );

  const longitude =
    getOptionalNumber(
      url.searchParams.get("lng"),
    );

  const requestedCity =
    normalizeText(
      url.searchParams.get("city"),
    );

  const requestedState =
    normalizeText(
      url.searchParams.get("state"),
    );

  const terms =
    SERVICE_SEARCH_TERMS[
      serviceCode
    ] ?? [];

  const result =
    await env.gyan_registry
      .prepare(
        `
          SELECT
            sh.code,
            sh.name,
            sh.address_line,
            sh.city,
            sh.state,
            sh.postal_code,

            sh.phone_number,
            sh.whatsapp_number,

            sh.latitude,
            sh.longitude,

            COUNT(
              CASE
                WHEN ss.enabled = 1
                  THEN 1
              END
            ) AS matching_service_count,

            GROUP_CONCAT(
              CASE
                WHEN ss.enabled = 1
                  THEN COALESCE(
                    ss.display_name,
                    s.name
                  )
              END,
              '||'
            ) AS service_names

          FROM shops sh

          LEFT JOIN shop_services ss
            ON ss.shop_code =
              sh.code

          LEFT JOIN services s
            ON s.id =
              ss.service_id

          WHERE sh.status =
            'active'

          GROUP BY
            sh.code,
            sh.name,
            sh.address_line,
            sh.city,
            sh.state,
            sh.postal_code,
            sh.phone_number,
            sh.whatsapp_number,
            sh.latitude,
            sh.longitude
        `,
      )
      .all<NearbyShopRow>();

  const shops:
    NearbyShopResult[] =
    result.results.map(
      (row) => {
        const serviceNames =
          row.service_names
            ?.split("||")
            .map(
              (name) =>
                name.trim(),
            )
            .filter(Boolean) ??
          [];

        const matchingServiceCount =
          terms.length === 0
            ? Number(
                row.matching_service_count,
              )
            : serviceNames.filter(
                (serviceName) => {
                  const normalizedName =
                    serviceName
                      .toLowerCase();

                  return terms.some(
                    (term) =>
                      normalizedName.includes(
                        term,
                      ),
                  );
                },
              ).length;

        const distanceKm =
          latitude != null &&
          longitude != null &&
          row.latitude != null &&
          row.longitude != null
            ? calculateDistanceKm(
                latitude,
                longitude,
                Number(row.latitude),
                Number(row.longitude),
              )
            : null;

        return {
          code: row.code,
          name: row.name,

          address: [
            row.address_line,
            row.city,
            row.state,
            row.postal_code,
          ]
            .filter(Boolean)
            .join(", "),

          phoneNumber:
            row.phone_number,

          whatsappNumber:
            row.whatsapp_number,

          latitude:
            row.latitude == null
              ? null
              : Number(
                  row.latitude,
                ),

          longitude:
            row.longitude == null
              ? null
              : Number(
                  row.longitude,
                ),

          distanceKm,

          matchingServiceCount,

          serviceNames,
        };
      },
    );

  shops.sort(
    (first, second) => {
      const firstCityMatch =
        requestedCity &&
        normalizeText(
          first.address,
        ).includes(
          requestedCity,
        )
          ? 1
          : 0;

      const secondCityMatch =
        requestedCity &&
        normalizeText(
          second.address,
        ).includes(
          requestedCity,
        )
          ? 1
          : 0;

      if (
        first.matchingServiceCount !==
        second.matchingServiceCount
      ) {
        return (
          second.matchingServiceCount -
          first.matchingServiceCount
        );
      }

      if (
        firstCityMatch !==
        secondCityMatch
      ) {
        return (
          secondCityMatch -
          firstCityMatch
        );
      }

      if (
        first.distanceKm != null &&
        second.distanceKm != null
      ) {
        return (
          first.distanceKm -
          second.distanceKm
        );
      }

      return first.name.localeCompare(
        second.name,
      );
    },
  );

  return jsonResponse({
    serviceCode,

    location: {
      latitude,
      longitude,

      city:
        requestedCity || null,

      state:
        requestedState || null,
    },

    registeredShops:
      shops.slice(0, 20),

    externalSearchAvailable:
      false,
  });
}
