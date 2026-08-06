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

interface GeoapifyFeature {
  properties?: {
    place_id?: string;
    name?: string;
    formatted?: string;
    address_line1?: string;
    address_line2?: string;
    city?: string;
    state?: string;
    postcode?: string;
    lat?: number;
    lon?: number;
    distance?: number;
    categories?: string[];
    website?: string;
    contact?: { phone?: string };
  };
}

interface GeoapifyResponse {
  features?: GeoapifyFeature[];
}

interface ExternalPlaceResult {
  id: string;
  name: string;
  address: string;
  latitude: number | null;
  longitude: number | null;
  distanceKm: number | null;
  phoneNumber: string | null;
  website: string | null;
  categories: string[];
}

const SERVICE_SEARCH_TERMS: Record<string, string[]> = {
  NEARBY_PRINT: ["print", "printing", "photocopy", "scan"],
  NEARBY_GROCERY: ["grocery", "vegetable", "daily needs"],
  NEARBY_MEDICAL: ["medical", "medicine", "pharmacy", "clinic"],
  NEARBY_TUITION: ["tuition", "tutor", "coaching", "education"],
  NEARBY_FOOD: ["food", "restaurant", "tiffin", "snack"],
  NEARBY_BANKING: ["banking", "payment", "insurance", "financial"],
  NEARBY_COURIER: ["courier", "parcel", "postal", "delivery"],
  NEARBY_COMPUTER: ["computer", "internet", "accessories", "technology"],
  NEARBY_REPAIR: ["repair", "mobile", "appliance", "computer repair"],
};

const GEOAPIFY_CATEGORIES: Record<string, string[]> = {
  NEARBY_PRINT: ["commercial", "service"],
  NEARBY_GROCERY: ["commercial.food_and_drink", "commercial.supermarket", "commercial.marketplace"],
  NEARBY_MEDICAL: ["healthcare", "healthcare.pharmacy"],
  NEARBY_TUITION: ["education", "office.educational_institution"],
  NEARBY_FOOD: ["catering", "commercial.food_and_drink"],
  NEARBY_BANKING: ["service.financial", "service.financial.bank", "office.insurance"],
  NEARBY_COURIER: ["service.post", "office.logistics"],
  NEARBY_COMPUTER: ["commercial.elektronics", "office.it"],
  NEARBY_REPAIR: ["service.vehicle.repair", "service"],
  NEARBY_MAPS: ["commercial", "service", "office"],
};

function jsonResponse(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: {
      "content-type": "application/json; charset=utf-8",
      "cache-control": "no-store",
    },
  });
}

function getOptionalNumber(rawValue: string | null): number | null {
  if (!rawValue) return null;
  const value = Number(rawValue);
  return Number.isFinite(value) ? value : null;
}

function calculateDistanceKm(
  firstLatitude: number,
  firstLongitude: number,
  secondLatitude: number,
  secondLongitude: number,
): number {
  const earthRadiusKm = 6371;
  const toRadians = (value: number): number => value * Math.PI / 180;
  const latitudeDifference = toRadians(secondLatitude - firstLatitude);
  const longitudeDifference = toRadians(secondLongitude - firstLongitude);
  const firstLatitudeRadians = toRadians(firstLatitude);
  const secondLatitudeRadians = toRadians(secondLatitude);
  const haversine =
    Math.sin(latitudeDifference / 2) ** 2 +
    Math.cos(firstLatitudeRadians) *
      Math.cos(secondLatitudeRadians) *
      Math.sin(longitudeDifference / 2) ** 2;
  return 2 * earthRadiusKm * Math.asin(Math.sqrt(haversine));
}

function normalizeText(value: string | null): string {
  return value?.trim().toLowerCase() ?? "";
}

async function geocodeLocation(
  apiKey: string,
  city: string,
  state: string,
): Promise<{ latitude: number; longitude: number } | null> {
  const searchText = [city, state].filter(Boolean).join(", ");
  if (!searchText) return null;

  const parameters = new URLSearchParams({
    text: searchText,
    format: "json",
    limit: "1",
    apiKey,
  });

  const response = await fetch(
    `https://api.geoapify.com/v1/geocode/search?${parameters.toString()}`,
  );
  if (!response.ok) return null;

  const result = (await response.json()) as {
    results?: Array<{ lat?: number; lon?: number }>;
  };
  const first = result.results?.[0];
  if (typeof first?.lat !== "number" || typeof first?.lon !== "number") {
    return null;
  }

  return { latitude: first.lat, longitude: first.lon };
}

async function loadGeoapifyPlaces(
  apiKey: string,
  serviceCode: string,
  latitude: number,
  longitude: number,
): Promise<ExternalPlaceResult[]> {
  const categories = GEOAPIFY_CATEGORIES[serviceCode] ?? ["commercial", "service"];
  const parameters = new URLSearchParams({
    categories: categories.join(","),
    filter: `circle:${longitude},${latitude},10000`,
    bias: `proximity:${longitude},${latitude}`,
    limit: "10",
    conditions: "named",
    lang: "en",
    apiKey,
  });

  const response = await fetch(
    `https://api.geoapify.com/v2/places?${parameters.toString()}`,
  );
  if (!response.ok) return [];

  const result = (await response.json()) as GeoapifyResponse;
  return (result.features ?? [])
    .map((feature, index): ExternalPlaceResult | null => {
      const properties = feature.properties;
      const name = properties?.name?.trim();
      if (!name) return null;

      const placeLatitude = typeof properties.lat === "number" ? properties.lat : null;
      const placeLongitude = typeof properties.lon === "number" ? properties.lon : null;
      const distanceKm =
        typeof properties.distance === "number"
          ? properties.distance / 1000
          : placeLatitude != null && placeLongitude != null
            ? calculateDistanceKm(latitude, longitude, placeLatitude, placeLongitude)
            : null;

      return {
        id: properties.place_id ?? `geoapify-${index}`,
        name,
        address:
          properties.formatted ??
          [
            properties.address_line1,
            properties.address_line2,
            properties.city,
            properties.state,
            properties.postcode,
          ]
            .filter(Boolean)
            .join(", "),
        latitude: placeLatitude,
        longitude: placeLongitude,
        distanceKm,
        phoneNumber: properties.contact?.phone ?? null,
        website: properties.website ?? null,
        categories: properties.categories ?? [],
      };
    })
    .filter((place): place is ExternalPlaceResult => place !== null);
}

export async function handleNearbyShopsRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (request.method !== "GET" || url.pathname !== "/api/nearby-shops") {
    return null;
  }

  const serviceCode =
    url.searchParams.get("serviceCode")?.trim().toUpperCase() ?? "";
  let latitude = getOptionalNumber(url.searchParams.get("lat"));
  let longitude = getOptionalNumber(url.searchParams.get("lng"));
  const requestedCity = normalizeText(url.searchParams.get("city"));
  const requestedState = normalizeText(url.searchParams.get("state"));
  const terms = SERVICE_SEARCH_TERMS[serviceCode] ?? [];

  const result = await env.gyan_registry
    .prepare(`
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
        COUNT(CASE WHEN ss.enabled = 1 THEN 1 END) AS matching_service_count,
        GROUP_CONCAT(
          CASE WHEN ss.enabled = 1 THEN COALESCE(ss.display_name, s.name) END,
          '||'
        ) AS service_names
      FROM shops sh
      LEFT JOIN shop_services ss ON ss.shop_code = sh.code
      LEFT JOIN services s ON s.id = ss.service_id
      WHERE sh.status = 'active'
      GROUP BY
        sh.code, sh.name, sh.address_line, sh.city, sh.state, sh.postal_code,
        sh.phone_number, sh.whatsapp_number, sh.latitude, sh.longitude
    `)
    .all<NearbyShopRow>();

  const shops: NearbyShopResult[] = result.results.map((row) => {
    const serviceNames =
      row.service_names
        ?.split("||")
        .map((name) => name.trim())
        .filter(Boolean) ?? [];

    const matchingServiceCount =
      terms.length === 0
        ? Number(row.matching_service_count)
        : serviceNames.filter((serviceName) => {
            const normalizedName = serviceName.toLowerCase();
            return terms.some((term) => normalizedName.includes(term));
          }).length;

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
      address: [row.address_line, row.city, row.state, row.postal_code]
        .filter(Boolean)
        .join(", "),
      phoneNumber: row.phone_number,
      whatsappNumber: row.whatsapp_number,
      latitude: row.latitude == null ? null : Number(row.latitude),
      longitude: row.longitude == null ? null : Number(row.longitude),
      distanceKm,
      matchingServiceCount,
      serviceNames,
    };
  });

  shops.sort((first, second) => {
    const firstCityMatch =
      requestedCity && normalizeText(first.address).includes(requestedCity) ? 1 : 0;
    const secondCityMatch =
      requestedCity && normalizeText(second.address).includes(requestedCity) ? 1 : 0;

    if (first.matchingServiceCount !== second.matchingServiceCount) {
      return second.matchingServiceCount - first.matchingServiceCount;
    }
    if (firstCityMatch !== secondCityMatch) {
      return secondCityMatch - firstCityMatch;
    }
    if (first.distanceKm != null && second.distanceKm != null) {
      return first.distanceKm - second.distanceKm;
    }
    return first.name.localeCompare(second.name);
  });

  let externalPlaces: ExternalPlaceResult[] = [];
  const geoapifyApiKey = env.GEOAPIFY_API_KEY?.trim();

  if (geoapifyApiKey && (latitude == null || longitude == null)) {
    const geocoded = await geocodeLocation(
      geoapifyApiKey,
      requestedCity,
      requestedState,
    );
    if (geocoded) {
      latitude = geocoded.latitude;
      longitude = geocoded.longitude;
    }
  }

  if (geoapifyApiKey && latitude != null && longitude != null) {
    externalPlaces = await loadGeoapifyPlaces(
      geoapifyApiKey,
      serviceCode,
      latitude,
      longitude,
    );
  }

  return jsonResponse({
    serviceCode,
    location: {
      latitude,
      longitude,
      city: requestedCity || null,
      state: requestedState || null,
    },
    registeredShops: shops
      .filter((shop) => shop.matchingServiceCount > 0 || terms.length === 0)
      .slice(0, 20),
    externalPlaces,
    externalSearchAvailable: Boolean(geoapifyApiKey),
    attribution:
      externalPlaces.length > 0
        ? "Places data © OpenStreetMap contributors, served by Geoapify"
        : null,
  });
}
