interface CountryDetails {
  code:
    | "IN"
    | "US"
    | "OTHER";

  name:
    | "India"
    | "United States"
    | "Other";

  currencyCode:
    | "INR"
    | "USD"
    | null;

  currencySymbol:
    | "₹"
    | "$"
    | null;
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
          "private, max-age=900",
      },
    },
  );
}

function getOptionalString(
  value: unknown,
): string | undefined {
  return typeof value === "string"
    ? value
    : undefined;
}

function getCountryDetails(
  countryCode:
    | string
    | undefined,
): CountryDetails {
  const normalizedCode =
    countryCode
      ?.trim()
      .toUpperCase() ??
    "";

  if (normalizedCode === "IN") {
    return {
      code: "IN",
      name: "India",
      currencyCode: "INR",
      currencySymbol: "₹",
    };
  }

  if (normalizedCode === "US") {
    return {
      code: "US",
      name: "United States",
      currencyCode: "USD",
      currencySymbol: "$",
    };
  }

  return {
    code: "OTHER",
    name: "Other",
    currencyCode: null,
    currencySymbol: null,
  };
}

function inferCountryCode(
  cloudflareCountry:
    | string
    | undefined,

  browserTimezone:
    | string
    | null,

  browserLanguages:
    | string
    | null,
): "IN" | "US" | "OTHER" {
  const cfCountry =
    cloudflareCountry
      ?.trim()
      .toUpperCase();

  if (
    cfCountry === "IN" ||
    cfCountry === "US"
  ) {
    return cfCountry;
  }

  const timezone =
    browserTimezone
      ?.trim()
      .toLowerCase() ??
    "";

  if (
    timezone ===
      "asia/kolkata" ||
    timezone ===
      "asia/calcutta"
  ) {
    return "IN";
  }

  if (
    timezone.startsWith(
      "america/",
    )
  ) {
    return "US";
  }

  const languages =
    browserLanguages
      ?.toLowerCase() ??
    "";

  if (
    languages.includes(
      "en-in",
    ) ||
    languages.includes(
      "hi-in",
    )
  ) {
    return "IN";
  }

  if (
    languages.includes(
      "en-us",
    )
  ) {
    return "US";
  }

  return "OTHER";
}

export function handleLocationHintRoute(
  request: Request,
  url: URL,
): Response | null {
  if (
    request.method !== "GET" ||
    url.pathname !==
      "/api/location-hint"
  ) {
    return null;
  }

  const cf =
    request.cf;

  const browserTimezone =
    request.headers.get(
      "x-gyan-timezone",
    );

  const browserLanguages =
    request.headers.get(
      "x-gyan-languages",
    );

  const cfCountry =
    getOptionalString(
      cf?.country,
    );

  const cfRegion =
    getOptionalString(
      cf?.region,
    );

  const cfRegionCode =
    getOptionalString(
      cf?.regionCode,
    );

  const cfCity =
    getOptionalString(
      cf?.city,
    );

  const cfPostalCode =
    getOptionalString(
      cf?.postalCode,
    );

  const cfTimezone =
    getOptionalString(
      cf?.timezone,
    );

  const inferredCountryCode =
    inferCountryCode(
      cfCountry,
      browserTimezone,
      browserLanguages,
    );

  const country =
    getCountryDetails(
      inferredCountryCode,
    );

  return jsonResponse({
    countryCode:
      country.code,

    country:
      country.name,

    currencyCode:
      country.currencyCode,

    currencySymbol:
      country.currencySymbol,

    region:
      cfRegion ?? "",

    regionCode:
      cfRegionCode ?? "",

    city:
      cfCity ?? "",

    postalCode:
      cfPostalCode ?? "",

    timezone:
      cfTimezone ??
      browserTimezone ??
      "",

    source:
      cfCountry
        ? "ip"
        : "browser",

    approximate: true,
  });
}