interface GeocoderAddress {
  city?: string;
  town?: string;
  village?: string;
  municipality?: string;
  county?: string;

  state?: string;
  state_district?: string;

  postcode?: string;

  country?: string;
  country_code?: string;
}

interface GeocoderResult {
  lat: string;
  lon: string;

  display_name?: string;

  address?:
    GeocoderAddress;
}

interface ResolvedLocation {
  latitude: number;
  longitude: number;

  label: string;

  city: string;
  region: string;
  regionCode: string;

  countryCode: string;
  phoneCountryCode: string;

  postalCode: string;
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

function getPhoneCountryCode(
  countryCode: string,
): string {
  const map:
    Record<string, string> = {
    US: "+1",
    CA: "+1",

    IN: "+91",

    GB: "+44",
    IE: "+353",

    AU: "+61",
    NZ: "+64",

    FR: "+33",
    DE: "+49",
    IT: "+39",
    ES: "+34",
    PT: "+351",
    NL: "+31",
    BE: "+32",
    CH: "+41",
    AT: "+43",

    SE: "+46",
    NO: "+47",
    DK: "+45",
    FI: "+358",

    PL: "+48",
    CZ: "+420",
    GR: "+30",
    RO: "+40",
    HU: "+36",

    AE: "+971",
    SA: "+966",
    QA: "+974",
    KW: "+965",
    OM: "+968",
    BH: "+973",

    SG: "+65",
    MY: "+60",
    ID: "+62",
    PH: "+63",
    TH: "+66",
    VN: "+84",

    JP: "+81",
    KR: "+82",
    CN: "+86",
    HK: "+852",
    TW: "+886",

    PK: "+92",
    BD: "+880",
    LK: "+94",
    NP: "+977",

    ZA: "+27",
    NG: "+234",
    KE: "+254",
    EG: "+20",

    MX: "+52",
    BR: "+55",
    AR: "+54",
    CL: "+56",
    CO: "+57",
    PE: "+51",
  };

  return map[
    countryCode
      .trim()
      .toUpperCase()
  ] ?? "";
}

function getRegionCode(
  region: string,
  countryCode: string,
): string {
  const normalizedRegion =
    region
      .trim()
      .toLowerCase();

  const normalizedCountry =
    countryCode
      .trim()
      .toUpperCase();

  const usStates:
    Record<string, string> = {
    alabama: "AL",
    alaska: "AK",
    arizona: "AZ",
    arkansas: "AR",
    california: "CA",
    colorado: "CO",
    connecticut: "CT",
    delaware: "DE",
    florida: "FL",
    georgia: "GA",
    hawaii: "HI",
    idaho: "ID",
    illinois: "IL",
    indiana: "IN",
    iowa: "IA",
    kansas: "KS",
    kentucky: "KY",
    louisiana: "LA",
    maine: "ME",
    maryland: "MD",
    massachusetts: "MA",
    michigan: "MI",
    minnesota: "MN",
    mississippi: "MS",
    missouri: "MO",
    montana: "MT",
    nebraska: "NE",
    nevada: "NV",
    "new hampshire": "NH",
    "new jersey": "NJ",
    "new mexico": "NM",
    "new york": "NY",
    "north carolina": "NC",
    "north dakota": "ND",
    ohio: "OH",
    oklahoma: "OK",
    oregon: "OR",
    pennsylvania: "PA",
    "rhode island": "RI",
    "south carolina": "SC",
    "south dakota": "SD",
    tennessee: "TN",
    texas: "TX",
    utah: "UT",
    vermont: "VT",
    virginia: "VA",
    washington: "WA",
    "west virginia": "WV",
    wisconsin: "WI",
    wyoming: "WY",
    "district of columbia": "DC",
  };

  const indiaStates:
    Record<string, string> = {
    "andhra pradesh": "AP",
    "arunachal pradesh": "AR",
    assam: "AS",
    bihar: "BR",
    chhattisgarh: "CG",
    goa: "GA",
    gujarat: "GJ",
    haryana: "HR",
    "himachal pradesh": "HP",
    jharkhand: "JH",
    karnataka: "KA",
    kerala: "KL",
    "madhya pradesh": "MP",
    maharashtra: "MH",
    manipur: "MN",
    meghalaya: "ML",
    mizoram: "MZ",
    nagaland: "NL",
    odisha: "OD",
    punjab: "PB",
    rajasthan: "RJ",
    sikkim: "SK",
    "tamil nadu": "TN",
    telangana: "TS",
    tripura: "TR",
    "uttar pradesh": "UP",
    uttarakhand: "UK",
    "west bengal": "WB",
    delhi: "DL",
    chandigarh: "CH",
    puducherry: "PY",
    "jammu and kashmir": "JK",
    ladakh: "LA",
    "andaman and nicobar islands": "AN",
    "dadra and nagar haveli and daman and diu": "DN",
    lakshadweep: "LD",
  };

  if (
    normalizedCountry ===
      "US"
  ) {
    return (
      usStates[
        normalizedRegion
      ] ?? ""
    );
  }

  if (
    normalizedCountry ===
      "IN"
  ) {
    return (
      indiaStates[
        normalizedRegion
      ] ?? ""
    );
  }

  /*
   * If the geocoder already returns a short
   * region-like value, keep it.
   */
  if (
    region.trim().length >= 2 &&
    region.trim().length <= 3
  ) {
    return region
      .trim()
      .toUpperCase();
  }

  return "";
}


function cityFromAddress(
  address:
    GeocoderAddress,
): string {
  return (
    address.city ??
    address.town ??
    address.village ??
    address.municipality ??
    address.county ??
    ""
  );
}

function regionFromAddress(
  address:
    GeocoderAddress,
): string {
  return (
    address.state ??
    address.state_district ??
    ""
  );
}

function mapResult(
  result:
    GeocoderResult,
): ResolvedLocation | null {
  const latitude =
    Number(
      result.lat,
    );

  const longitude =
    Number(
      result.lon,
    );

  if (
    !Number.isFinite(
      latitude,
    ) ||
    !Number.isFinite(
      longitude,
    )
  ) {
    return null;
  }

  const address =
    result.address ?? {};

  const city =
    cityFromAddress(
      address,
    );

  const region =
    regionFromAddress(
      address,
    );

  const countryCode =
    String(
      address.country_code ??
        "",
    )
      .trim()
      .toUpperCase();

  const regionCode =
    getRegionCode(
      region,
      countryCode,
    );

  const label =
    [
      city,
      region,
      address.country,
    ]
      .filter(Boolean)
      .join(", ") ||
    result.display_name ||
    `${latitude.toFixed(
      4,
    )}, ${longitude.toFixed(
      4,
    )}`;

  return {
    latitude,
    longitude,

    label,

    city,
    region,
    regionCode,

    countryCode,

    phoneCountryCode:
      getPhoneCountryCode(
        countryCode,
      ),

    postalCode:
      address.postcode ??
      "",
  };
}

async function geocoderFetch(
  url: URL,
): Promise<Response> {
  return fetch(
    url.toString(),
    {
      headers: {
        "user-agent":
          "GYAN/1.0 (https://gyan.cc)",

        accept:
          "application/json",
      },
    },
  );
}

async function reverseGeocode(
  latitude: number,
  longitude: number,
): Promise<
  ResolvedLocation | null
> {
  const endpoint =
    new URL(
      "https://nominatim.openstreetmap.org/reverse",
    );

  endpoint.searchParams.set(
    "format",
    "jsonv2",
  );

  endpoint.searchParams.set(
    "addressdetails",
    "1",
  );

  endpoint.searchParams.set(
    "lat",
    String(
      latitude,
    ),
  );

  endpoint.searchParams.set(
    "lon",
    String(
      longitude,
    ),
  );

  const response =
    await geocoderFetch(
      endpoint,
    );

  if (
    !response.ok
  ) {
    return null;
  }

  const result =
    (await response.json()) as
      GeocoderResult;

  return mapResult(
    result,
  );
}

async function forwardGeocode(
  city: string,
  region: string,
  country: string,
): Promise<
  ResolvedLocation | null
> {
  const endpoint =
    new URL(
      "https://nominatim.openstreetmap.org/search",
    );

  endpoint.searchParams.set(
    "format",
    "jsonv2",
  );

  endpoint.searchParams.set(
    "addressdetails",
    "1",
  );

  endpoint.searchParams.set(
    "limit",
    "1",
  );

  endpoint.searchParams.set(
    "q",
    [
      city,
      region,
      country,
    ]
      .filter(Boolean)
      .join(", "),
  );

  const response =
    await geocoderFetch(
      endpoint,
    );

  if (
    !response.ok
  ) {
    return null;
  }

  const results =
    (await response.json()) as
      GeocoderResult[];

  if (
    results.length ===
    0
  ) {
    return null;
  }

  return mapResult(
    results[0],
  );
}

export async function handleLocationResolveRoute(
  request: Request,
  url: URL,
): Promise<Response | null> {
  if (
    request.method !==
      "GET" ||
    url.pathname !==
      "/api/location/resolve"
  ) {
    return null;
  }

  const rawLat =
    url.searchParams.get(
      "lat",
    );

  const rawLng =
    url.searchParams.get(
      "lng",
    );

  const city =
    (
      url.searchParams.get(
        "city",
      ) ?? ""
    ).trim();

  const region =
    (
      url.searchParams.get(
        "region",
      ) ?? ""
    ).trim();

  const country =
    (
      url.searchParams.get(
        "country",
      ) ?? ""
    ).trim();

  const hasLat =
    rawLat !== null &&
    rawLat.trim() !== "";

  const hasLng =
    rawLng !== null &&
    rawLng.trim() !== "";

  if (
    hasLat !==
    hasLng
  ) {
    return jsonResponse(
      {
        error:
          "Enter both latitude and longitude.",
      },
      400,
    );
  }

  try {
    let resolved:
      ResolvedLocation | null =
        null;

    if (
      hasLat &&
      hasLng
    ) {
      const latitude =
        Number(
          rawLat,
        );

      const longitude =
        Number(
          rawLng,
        );

      if (
        !Number.isFinite(
          latitude,
        ) ||
        latitude < -90 ||
        latitude > 90 ||
        !Number.isFinite(
          longitude,
        ) ||
        longitude < -180 ||
        longitude > 180
      ) {
        return jsonResponse(
          {
            error:
              "Enter valid latitude and longitude values.",
          },
          400,
        );
      }

      resolved =
        await reverseGeocode(
          latitude,
          longitude,
        );
    } else {
      if (
        !city ||
        !region
      ) {
        return jsonResponse(
          {
            error:
              "Enter coordinates or a city and state / region.",
          },
          400,
        );
      }

      resolved =
        await forwardGeocode(
          city,
          region,
          country,
        );
    }

    if (
      !resolved
    ) {
      return jsonResponse(
        {
          error:
            "Location could not be found. Check the city/state or enter coordinates.",
        },
        404,
      );
    }

    return jsonResponse({
      location:
        resolved,
    });
  } catch (
    error
  ) {
    console.error(
      "Location resolution failed:",
      error,
    );

    return jsonResponse(
      {
        error:
          "Location lookup is temporarily unavailable.",
      },
      502,
    );
  }
}