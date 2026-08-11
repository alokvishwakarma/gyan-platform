import {
  useEffect,
  useMemo,
  useRef,
  useState,
} from "react";

import {
  getAdminLocationOverride,
} from "../location/adminLocation";

import "./NearbyServicePanel.css";

interface NearbyServicePanelProps {
  serviceCode: string;
  serviceName: string;

  onClose: () => void;

  onOpenShop?: (
    shopCode: string,
  ) => void;

  embedded?: boolean;
}


interface LocationHint {
  countryCode?: string;
  region?: string;
  city?: string;
}


interface RegisteredShop {
  code: string;
  name: string;
  address: string;

  distanceKm:
    | number
    | null;
}


interface ExternalPlace {
  id: string;
  name: string;
  address: string;

  distanceKm:
    | number
    | null;
}


interface NearbyResponse {
  registeredShops?:
    RegisteredShop[];

  externalPlaces?:
    ExternalPlace[];

  error?: string;
}


interface SubmitResponse {
  request?: {
    requestNumber?: string;
  };

  requestNumber?: string;

  error?: string;
}


interface NearbyCacheEntry {
  createdAt: number;

  registeredShops:
    RegisteredShop[];

  externalPlaces:
    ExternalPlace[];
}


type SelectedBusiness =
  | {
      kind: "support";

      shopCode: "SUPP";

      name:
        "GYAN Support";

      address: "";
    }
  | {
      kind:
        "registered";

      shopCode: string;

      name: string;

      address: string;
    }
  | {
      kind:
        "external";

      shopCode: "SUPP";

      name: string;

      address: string;
    };


const SUPPORT_BUSINESS:
  SelectedBusiness = {
    kind: "support",

    shopCode: "SUPP",

    name:
      "GYAN Support",

    address: "",
  };


const NEARBY_CACHE_PREFIX =
  "gyan-nearby-v1:";


/*
 * GPS results can change as the
 * user moves, so keep these shorter.
 */
const GPS_CACHE_TTL =
  30 * 60 * 1000;


/*
 * Address/area results are generally
 * stable enough to keep longer.
 */
const ADDRESS_CACHE_TTL =
  4 * 60 * 60 * 1000;


/*
 * ========================================================
 * CACHE
 * ========================================================
 */

function normalizeCacheText(
  value: string,
): string {
  return value
    .trim()
    .toLowerCase()
    .replace(
      /\s+/g,
      " ",
    );
}


function createGpsCacheKey(
  serviceCode: string,
  latitude: number,
  longitude: number,
): string {
  return [
    NEARBY_CACHE_PREFIX,

    "gps:",

    serviceCode
      .trim()
      .toUpperCase(),

    ":",

    latitude.toFixed(
      3,
    ),

    ",",

    longitude.toFixed(
      3,
    ),
  ].join("");
}


function createAddressCacheKey(
  serviceCode: string,
  city: string,
  stateRegion: string,
): string {
  return [
    NEARBY_CACHE_PREFIX,

    "address:",

    serviceCode
      .trim()
      .toUpperCase(),

    ":",

    normalizeCacheText(
      city,
    ),

    "|",

    normalizeCacheText(
      stateRegion,
    ),
  ].join("");
}


function readNearbyCache(
  key: string,
  ttl: number,
):
  | NearbyCacheEntry
  | null {
  try {
    const raw =
      localStorage.getItem(
        key,
      );

    if (!raw) {
      return null;
    }

    const cached =
      JSON.parse(
        raw,
      ) as NearbyCacheEntry;

    if (
      !Number.isFinite(
        cached.createdAt,
      ) ||
      !Array.isArray(
        cached.registeredShops,
      ) ||
      !Array.isArray(
        cached.externalPlaces,
      )
    ) {
      localStorage.removeItem(
        key,
      );

      return null;
    }

    if (
      Date.now() -
        cached.createdAt >
      ttl
    ) {
      localStorage.removeItem(
        key,
      );

      return null;
    }

    return cached;
  } catch {
    return null;
  }
}


function writeNearbyCache(
  key: string,
  registeredShops:
    RegisteredShop[],
  externalPlaces:
    ExternalPlace[],
): void {
  try {
    const entry:
      NearbyCacheEntry = {
      createdAt:
        Date.now(),

      registeredShops,

      externalPlaces,
    };

    localStorage.setItem(
      key,
      JSON.stringify(
        entry,
      ),
    );
  } catch {
    /*
     * Search must continue even
     * when browser storage is unavailable.
     */
  }
}


/*
 * ========================================================
 * GENERAL HELPERS
 * ========================================================
 */

function formatDistance(
  distanceKm:
    | number
    | null,
): string {
  if (
    distanceKm == null
  ) {
    return "";
  }

  return ` — ${distanceKm.toFixed(
    1,
  )} km`;
}


function sanitizePhone(
  value: string,
): string {
  let sanitized =
    value.replace(
      /[^0-9+()\-\s]/g,
      "",
    );

  if (
    sanitized.startsWith(
      "+",
    )
  ) {
    sanitized =
      "+" +
      sanitized
        .slice(1)
        .replace(
          /\+/g,
          "",
        );
  } else {
    sanitized =
      sanitized.replace(
        /\+/g,
        "",
      );
  }

  return sanitized;
}


function getDialCode(
  countryCode?: string,
): string {
  switch (
    countryCode
      ?.trim()
      .toUpperCase()
  ) {
    case "US":
    case "CA":
      return "+1 ";

    case "IN":
      return "+91 ";

    case "GB":
      return "+44 ";

    case "AU":
      return "+61 ";

    default:
      return "";
  }
}


function getRequiredLocalDigits(
  countryCode?: string,
): number {
  switch (
    countryCode
      ?.trim()
      .toUpperCase()
  ) {
    case "US":
    case "CA":
    case "IN":
      return 10;

    default:
      return 7;
  }
}


function hasValidPhoneForCountry(
  value: string,
  countryCode?: string,
): boolean {
  const digits =
    value.replace(
      /\D/g,
      "",
    );

  const dialCodeDigits =
    getDialCode(
      countryCode,
    ).replace(
      /\D/g,
      "",
    );

  const localDigits =
    dialCodeDigits &&
    digits.startsWith(
      dialCodeDigits,
    )
      ? digits.slice(
          dialCodeDigits.length,
        )
      : digits;

  return (
    localDigits.length >=
    getRequiredLocalDigits(
      countryCode,
    )
  );
}


/*
 * ========================================================
 * COMPONENT
 * ========================================================
 */

export default function NearbyServicePanel({
  serviceCode,
  serviceName,
  onClose,
  embedded = false,
}: NearbyServicePanelProps) {
  const [
    detectedCountryCode,
    setDetectedCountryCode,
  ] =
    useState<
      string | undefined
    >(undefined);


  const [
    city,
    setCity,
  ] =
    useState("");


  const [
    stateRegion,
    setStateRegion,
  ] =
    useState("");


  const [
    registeredShops,
    setRegisteredShops,
  ] =
    useState<
      RegisteredShop[]
    >([]);


  const [
    externalPlaces,
    setExternalPlaces,
  ] =
    useState<
      ExternalPlace[]
    >([]);


  const [
    selectedBusiness,
    setSelectedBusiness,
  ] =
    useState<SelectedBusiness>(
      SUPPORT_BUSINESS,
    );


  const [
    requestDetails,
    setRequestDetails,
  ] =
    useState("");


  const [
    customerName,
    setCustomerName,
  ] =
    useState("");


  const [
    phoneOrWhatsApp,
    setPhoneOrWhatsApp,
  ] =
    useState("");


  const [
    email,
    setEmail,
  ] =
    useState("");


  const [
    preferredDate,
    setPreferredDate,
  ] =
    useState("");


  const [
    serviceAddress,
    setServiceAddress,
  ] =
    useState("");


  const [
    additionalNotes,
    setAdditionalNotes,
  ] =
    useState("");


  const [
    showMore,
    setShowMore,
  ] =
    useState(false);


  const [
    files,
    setFiles,
  ] =
    useState<File[]>(
      [],
    );


  const [
    searching,
    setSearching,
  ] =
    useState(false);


  const [
    preciseLocationVerified,
    setPreciseLocationVerified,
  ] =
    useState(false);


  const [
    submitting,
    setSubmitting,
  ] =
    useState(false);


  const [
    error,
    setError,
  ] =
    useState("");


  const [
    searchMessage,
    setSearchMessage,
  ] =
    useState("");


  const [
    successNumber,
    setSuccessNumber,
  ] =
    useState("");


  const fileInputRef =
    useRef<
      HTMLInputElement | null
    >(null);


  /*
   * ========================================================
   * APPROXIMATE LOCATION HINT
   * ========================================================
   */

  useEffect(() => {
    const controller =
      new AbortController();

    async function loadHint():
      Promise<void> {
      const adminLocation =
        getAdminLocationOverride();

      if (adminLocation) {
        setCity(
          adminLocation.city ??
            adminLocation.label ??
            "",
        );

        setStateRegion(
          adminLocation.region ??
            "",
        );

        setDetectedCountryCode(
          adminLocation.countryCode,
        );

        setPhoneOrWhatsApp(
          (current) =>
            current.trim()
              ? current
              : getDialCode(
                  adminLocation.countryCode,
                ),
        );

        return;
      }

      try {
        const response =
          await fetch(
            "/api/location-hint",
            {
              signal:
                controller.signal,

              headers: {
                "x-gyan-timezone":
                  Intl
                    .DateTimeFormat()
                    .resolvedOptions()
                    .timeZone,

                "x-gyan-languages":
                  (
                    navigator.languages ??
                    [
                      navigator.language,
                    ]
                  ).join(
                    ",",
                  ),
              },
            },
          );

        if (
          !response.ok
        ) {
          return;
        }

        const hint =
          (await response.json()) as
            LocationHint;

        if (
          controller.signal
            .aborted
        ) {
          return;
        }

        setCity(
          hint.city ??
            "",
        );

        setStateRegion(
          hint.region ??
            "",
        );

        setDetectedCountryCode(
          hint.countryCode,
        );

        setPhoneOrWhatsApp(
          (current) =>
            current.trim()
              ? current
              : getDialCode(
                  hint.countryCode,
                ),
        );
      } catch {
        /*
         * Manual location search
         * remains available.
         */
      }
    }

    void loadHint();

    return () => {
      controller.abort();
    };
  }, []);


  /*
   * ========================================================
   * DERIVED VALUES
   * ========================================================
   */

  const resultCount =
    registeredShops.length +
    externalPlaces.length;


  const isGeneralRequest =
    serviceCode
      .trim()
      .toUpperCase() ===
    "GENERAL_REQUEST";


  const locationSummary =
    useMemo(
      () =>
        [
          city.trim(),
          stateRegion.trim(),
        ]
          .filter(
            Boolean,
          )
          .join(
            ", ",
          ),
      [
        city,
        stateRegion,
      ],
    );


  /*
   * ========================================================
   * APPLY SEARCH RESULT
   * ========================================================
   */

  function applyNearbyResults(
    shops:
      RegisteredShop[],
    places:
      ExternalPlace[],
    fromCache:
      boolean,
  ): void {
    setRegisteredShops(
      shops,
    );

    setExternalPlaces(
      places,
    );

    /*
     * A new location search should
     * not silently leave an old shop
     * selected.
     */
    setSelectedBusiness(
      SUPPORT_BUSINESS,
    );

    const total =
      shops.length +
      places.length;

    if (
      total === 0
    ) {
      setSearchMessage(
        fromCache
          ? "No nearby results in the saved search."
          : "No nearby businesses found.",
      );

      return;
    }

    setSearchMessage(
      fromCache
        ? `${total} nearby result${
            total === 1
              ? ""
              : "s"
          } loaded from this device.`
        : `${total} nearby result${
            total === 1
              ? ""
              : "s"
          } found.`,
    );
  }


  /*
   * ========================================================
   * SEARCH
   * ========================================================
   */

  async function searchNearby(
    nextLatitude:
      | number
      | null = null,

    nextLongitude:
      | number
      | null = null,
  ): Promise<void> {
    setError(
      "",
    );


    const hasPreciseLocation =
      nextLatitude != null &&
      nextLongitude != null;


    const cacheKey =
      hasPreciseLocation
        ? createGpsCacheKey(
            serviceCode,
            nextLatitude,
            nextLongitude,
          )
        : createAddressCacheKey(
            serviceCode,
            city,
            stateRegion,
          );


    const cacheTtl =
      hasPreciseLocation
        ? GPS_CACHE_TTL
        : ADDRESS_CACHE_TTL;


    const cached =
      readNearbyCache(
        cacheKey,
        cacheTtl,
      );


    if (
      cached
    ) {
      applyNearbyResults(
        cached.registeredShops,
        cached.externalPlaces,
        true,
      );

      return;
    }


    setSearching(
      true,
    );

    setSearchMessage(
      "Searching nearby…",
    );


    try {
      const parameters =
        new URLSearchParams({
          serviceCode,
        });


      if (
        hasPreciseLocation
      ) {
        parameters.set(
          "lat",
          String(
            nextLatitude,
          ),
        );

        parameters.set(
          "lng",
          String(
            nextLongitude,
          ),
        );
      }


      if (
        city.trim()
      ) {
        parameters.set(
          "city",
          city.trim(),
        );
      }


      if (
        stateRegion.trim()
      ) {
        parameters.set(
          "state",
          stateRegion.trim(),
        );
      }


      const response =
        await fetch(
          `/api/nearby-shops?${parameters.toString()}`,
        );


      const result =
        (await response.json()) as
          NearbyResponse;


      if (
        !response.ok
      ) {
        throw new Error(
          result.error ??
            "Nearby shops could not be loaded.",
        );
      }


      const nextShops =
        result.registeredShops ??
        [];


      const nextPlaces =
        result.externalPlaces ??
        [];


      writeNearbyCache(
        cacheKey,
        nextShops,
        nextPlaces,
      );


      applyNearbyResults(
        nextShops,
        nextPlaces,
        false,
      );
    } catch (
      caughtError
    ) {
      setSearchMessage(
        "",
      );

      setError(
        caughtError instanceof
          Error
          ? caughtError.message
          : "Nearby shops could not be loaded.",
      );
    } finally {
      setSearching(
        false,
      );
    }
  }


  /*
   * ========================================================
   * PRECISE LOCATION
   * ========================================================
   */

  function useMyLocation():
    void {
    const adminLocation =
      getAdminLocationOverride();

    if (adminLocation) {
      setCity(
        adminLocation.city ??
          adminLocation.label ??
          "",
      );

      setStateRegion(
        adminLocation.region ??
          "",
      );

      setDetectedCountryCode(
        adminLocation.countryCode,
      );

      setPhoneOrWhatsApp(
        (current) =>
          current.trim()
            ? current
            : getDialCode(
                adminLocation.countryCode,
              ),
      );

      setPreciseLocationVerified(
        true,
      );

      void searchNearby(
        adminLocation.latitude,
        adminLocation.longitude,
      );

      return;
    }

    if (
      !navigator.geolocation
    ) {
      setError(
        "Location is not available in this browser. Search by address or area instead.",
      );

      return;
    }


    setSearching(
      true,
    );

    setError(
      "",
    );

    setSearchMessage(
      "Getting your location…",
    );


    navigator.geolocation
      .getCurrentPosition(
        (
          position,
        ) => {
          const nextLatitude =
            position
              .coords
              .latitude;

          const nextLongitude =
            position
              .coords
              .longitude;


          setPreciseLocationVerified(
            true,
          );

          void searchNearby(
            nextLatitude,
            nextLongitude,
          );
        },

        () => {
          setPreciseLocationVerified(
            false,
          );

          setSearching(
            false,
          );

          setSearchMessage(
            "",
          );

          setError(
            "Location permission was not available. You can continue with the city / state location or search by address / area.",
          );
        },

        {
          enableHighAccuracy:
            false,

          timeout:
            10000,

          /*
           * Browser geolocation
           * can itself reuse a recent
           * location reading.
           */
          maximumAge:
            300000,
        },
      );
  }


  /*
   * ========================================================
   * MANUAL SEARCH
   * ========================================================
   */

  function searchByAddress():
    void {
    setPreciseLocationVerified(
      false,
    );

    if (
      !city.trim() &&
      !stateRegion.trim()
    ) {
      setError(
        "Enter an address, area, city, state or postal code.",
      );

      return;
    }


    /*
     * Manual search should not reuse
     * an earlier GPS position.
     */

    void searchNearby(
      null,
      null,
    );
  }


  /*
   * ========================================================
   * SELECT BUSINESS
   * ========================================================
   */

  function selectBusiness(
    value: string,
  ): void {
    if (
      value ===
      "support"
    ) {
      setSelectedBusiness(
        SUPPORT_BUSINESS,
      );

      return;
    }


    if (
      value.startsWith(
        "gyan:",
      )
    ) {
      const shopCode =
        value.slice(
          5,
        );


      const shop =
        registeredShops.find(
          (item) =>
            item.code ===
            shopCode,
        );


      if (
        shop
      ) {
        setSelectedBusiness({
          kind:
            "registered",

          shopCode:
            shop.code,

          name:
            shop.name,

          address:
            shop.address,
        });
      }

      return;
    }


    if (
      value.startsWith(
        "external:",
      )
    ) {
      const placeId =
        value.slice(
          9,
        );


      const place =
        externalPlaces.find(
          (item) =>
            item.id ===
            placeId,
        );


      if (
        place
      ) {
        setSelectedBusiness({
          kind:
            "external",

          shopCode:
            "SUPP",

          name:
            place.name,

          address:
            place.address,
        });


        if (
          !serviceAddress.trim()
        ) {
          setServiceAddress(
            place.address,
          );
        }
      }
    }
  }


  function getSelectedValue():
    string {
    if (
      selectedBusiness.kind ===
      "support"
    ) {
      return "support";
    }


    if (
      selectedBusiness.kind ===
      "registered"
    ) {
      return `gyan:${selectedBusiness.shopCode}`;
    }


    const matchingPlace =
      externalPlaces.find(
        (place) =>
          place.name ===
            selectedBusiness.name &&
          place.address ===
            selectedBusiness.address,
      );


    return matchingPlace
      ? `external:${matchingPlace.id}`
      : "support";
  }


  /*
   * ========================================================
   * VALIDATION
   * ========================================================
   */

  function validate():
    string | null {
    if (
      !requestDetails.trim() &&
      files.length ===
        0
    ) {
      return "Describe what you need or attach a file.";
    }


    if (
      !customerName.trim()
    ) {
      return "Please enter your name.";
    }


    const hasEmail =
      /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        email.trim(),
      );


    const hasPhone =
      hasValidPhoneForCountry(
        phoneOrWhatsApp,
        detectedCountryCode,
      );


    if (
      !hasPhone &&
      !hasEmail
    ) {
      return (
        detectedCountryCode ===
          "US" ||
        detectedCountryCode ===
          "CA" ||
        detectedCountryCode ===
          "IN"
          ? "Enter a 10-digit phone / WhatsApp number or a valid email address."
          : "Enter a valid phone / WhatsApp number or email address."
      );
    }


    if (
      email.trim() &&
      !hasEmail
    ) {
      return "Please enter a valid email address.";
    }


    return null;
  }


  /*
   * ========================================================
   * SUBMIT
   * ========================================================
   */

  async function submitRequest():
    Promise<void> {
    const validationError =
      validate();


    if (
      validationError
    ) {
      setError(
        validationError,
      );

      return;
    }


    setSubmitting(
      true,
    );

    setError(
      "",
    );


    try {
      const businessContext =
        selectedBusiness.kind ===
          "external"
          ? `Preferred local business: ${selectedBusiness.name}${
              selectedBusiness.address
                ? ` (${selectedBusiness.address})`
                : ""
            }`
          : "";


      const combinedNotes =
        [
          businessContext,

          additionalNotes.trim(),
        ]
          .filter(
            Boolean,
          )
          .join(
            "\n",
          );


      const submittedAnswers =
        [
          {
            sectionKey:
              "service_details",

            fieldKey:
              "request_details",

            value:
              requestDetails.trim(),
          },

          {
            sectionKey:
              "customer_details",

            fieldKey:
              "customer_name",

            value:
              customerName.trim(),
          },

          {
            sectionKey:
              "customer_details",

            fieldKey:
              "phone_or_whatsapp",

            value:
              phoneOrWhatsApp.trim(),
          },

          {
            sectionKey:
              "customer_details",

            fieldKey:
              "email_address",

            value:
              email.trim(),
          },

          ...(
            isGeneralRequest
              ? []
              : [
                  {
                    sectionKey:
                      "additional_details",

                    fieldKey:
                      "preferred_date",

                    value:
                      preferredDate,
                  },

                  {
                    sectionKey:
                      "additional_details",

                    fieldKey:
                      "service_address",

                    value:
                      serviceAddress.trim(),
                  },

                  {
                    sectionKey:
                      "additional_details",

                    fieldKey:
                      "additional_notes",

                    value:
                      combinedNotes,
                  },
                ]
          ),
        ];


      const formData =
        new FormData();


      formData.set(
        "metadata",
        JSON.stringify({
          answers:
            submittedAnswers,
        }),
      );


      for (
        const file of
        files
      ) {
        formData.append(
          "file:service_details:attachments",

          file,

          file.name,
        );
      }


      const endpoint =
        `/api/shops/${encodeURIComponent(
          selectedBusiness.shopCode,
        )}/services/${encodeURIComponent(
          serviceCode,
        )}/requests`;


      const response =
        await fetch(
          endpoint,
          {
            method:
              "POST",

            body:
              formData,
          },
        );


      const result =
        (await response.json()) as
          SubmitResponse;


      if (
        !response.ok
      ) {
        throw new Error(
          result.error ??
            "The request could not be submitted.",
        );
      }


      const requestNumber =
        result.request
          ?.requestNumber ??
        result.requestNumber ??
        "Submitted";


      setSuccessNumber(
        requestNumber,
      );
    } catch (
      caughtError
    ) {
      setError(
        caughtError instanceof
          Error
          ? caughtError.message
          : "The request could not be submitted.",
      );
    } finally {
      setSubmitting(
        false,
      );
    }
  }


  const containerClassName =
    embedded
      ? "nearby-service-embedded"
      : "nearby-service-overlay";


  const dialogProps =
    embedded
      ? {}
      : {
          role:
            "dialog" as const,

          "aria-modal":
            true as const,
        };


  /*
   * ========================================================
   * SUCCESS
   * ========================================================
   */

  if (
    successNumber
  ) {
    return (
      <div
        className={
          containerClassName
        }
      >
        <section
          className="nearby-service-panel nearby-service-panel--compact"
          {...dialogProps}
          aria-labelledby="nearby-success-title"
        >
          <header className="nearby-service-panel__header nearby-service-panel__header--compact">
            <h2 id="nearby-success-title">
              Request submitted
            </h2>

            <button
              type="button"
              onClick={
                onClose
              }
              aria-label="Close"
            >
              ×
            </button>
          </header>


          <div className="nearby-service-panel__success">
            <span
              aria-hidden="true"
            >
              ✓
            </span>

            <strong>
              {
                successNumber
              }
            </strong>

            <p>
              Your request has been
              received. You will be
              contacted by phone,
              WhatsApp, or email.
            </p>

            <button
              type="button"
              onClick={
                onClose
              }
            >
              Done
            </button>
          </div>
        </section>
      </div>
    );
  }


  /*
   * ========================================================
   * UI
   * ========================================================
   */

  return (
    <div
      className={
        containerClassName
      }
    >
      <section
        className="nearby-service-panel nearby-service-panel--compact"
        {...dialogProps}
        aria-labelledby="nearby-service-title"
      >
        <header className="nearby-service-panel__header nearby-service-panel__header--compact">
          <h2 id="nearby-service-title">
            {
              serviceName
            }
          </h2>

          <button
            type="button"
            onClick={
              onClose
            }
            aria-label="Close nearby request"
          >
            ×
          </button>
        </header>


        <div className="nearby-service-panel__content nearby-service-panel__content--compact">

          {/* =============================================
              LOCATION SEARCH — ALWAYS VISIBLE
              ============================================= */}

          <section className="nearby-service-panel__location-search">
            {isGeneralRequest && (
              <p className="nearby-service-panel__routing-hint">
                📍 We will use the available city / state location.
                You do not need to choose a service category.
                Use My Location if you want to share a more precise location.
              </p>
            )}

            <div className="nearby-service-panel__location-search-row">

              <button
                type="button"
                className="nearby-service-panel__use-location"
                disabled={
                  searching
                }
                onClick={
                  useMyLocation
                }
              >
                {searching
                  ? "Searching…"
                  : "📍 Use my location"}
              </button>


              <div className="nearby-service-panel__address-search">
                <input
                  value={
                    city
                  }
                  placeholder="Address / area / city"
                  aria-label="Address, area or city"
                  disabled={
                    searching
                  }
                  onChange={(
                    event,
                  ) => {
                    setCity(
                      event.target
                        .value,
                    );

                    setError(
                      "",
                    );
                  }}
                  onKeyDown={(
                    event,
                  ) => {
                    if (
                      event.key ===
                      "Enter"
                    ) {
                      event.preventDefault();

                      searchByAddress();
                    }
                  }}
                />

                <button
                  type="button"
                  aria-label="Search nearby"
                  title="Search nearby"
                  disabled={
                    searching ||
                    (
                      !city.trim() &&
                      !stateRegion.trim()
                    )
                  }
                  onClick={
                    searchByAddress
                  }
                >
                  🔎
                </button>
              </div>
            </div>


            <div className="nearby-service-panel__state-row">
              <input
                value={
                  stateRegion
                }
                placeholder="State / region (optional)"
                aria-label="State"
                disabled={
                  searching
                }
                onChange={(
                  event,
                ) => {
                  setStateRegion(
                    event.target
                      .value,
                  );

                  setError(
                    "",
                  );
                }}
                onKeyDown={(
                  event,
                ) => {
                  if (
                    event.key ===
                      "Enter"
                  ) {
                    event.preventDefault();

                    searchByAddress();
                  }
                }}
              />
            </div>


            <p className="nearby-service-panel__routing-hint">
              {isGeneralRequest
                ? preciseLocationVerified
                  ? "✓ Precise location shared. Your request will go to GYAN Support."
                  : "Using the available city / state location. You may use My Location for more precision."
                : (
                  <>
                    📍 Select a nearby shop
                    before submitting.
                    {" "}
                    <strong>
                      Otherwise, your request
                      goes to GYAN Support.
                    </strong>
                  </>
                )}
            </p>


            {searchMessage && (
              <small className="nearby-service-panel__search-message">
                {
                  searchMessage
                }
              </small>
            )}
          </section>


          {/* =============================================
              SHOP PICKER
              ============================================= */}

          {!isGeneralRequest && (
          <div className="nearby-service-panel__shop-row">
            <select
              aria-label="Select shop"
              value={
                getSelectedValue()
              }
              onChange={(
                event,
              ) =>
                selectBusiness(
                  event.target
                    .value,
                )
              }
            >
              <option value="support">
                GYAN Support
              </option>


              {registeredShops.length >
                0 && (
                <optgroup label="Participating GYAN shops">
                  {registeredShops.map(
                    (
                      shop,
                    ) => (
                      <option
                        key={
                          shop.code
                        }
                        value={
                          `gyan:${shop.code}`
                        }
                      >
                        ⭐{" "}
                        {
                          shop.name
                        }
                        {
                          formatDistance(
                            shop.distanceKm,
                          )
                        }
                      </option>
                    ),
                  )}
                </optgroup>
              )}


              {externalPlaces.length >
                0 && (
                <optgroup label="Other nearby businesses">
                  {externalPlaces.map(
                    (
                      place,
                    ) => (
                      <option
                        key={
                          place.id
                        }
                        value={
                          `external:${place.id}`
                        }
                      >
                        {
                          place.name
                        }
                        {
                          formatDistance(
                            place.distanceKm,
                          )
                        }
                      </option>
                    ),
                  )}
                </optgroup>
              )}
            </select>
          </div>
          )}


          {resultCount >
            0 &&
            locationSummary && (
              <small className="nearby-service-panel__summary">
                {
                  resultCount
                }
                {" nearby result"}
                {
                  resultCount ===
                  1
                    ? ""
                    : "s"
                }
                {" • "}
                {
                  locationSummary
                }
              </small>
            )}


          {/* =============================================
              REQUEST DETAILS
              ============================================= */}

          <textarea
            className="nearby-service-panel__request"
            rows={
              2
            }
            value={
              requestDetails
            }
            placeholder="What do you need?"
            aria-label="What do you need?"
            onChange={(
              event,
            ) =>
              setRequestDetails(
                event.target
                  .value,
              )
            }
          />


          <button
            type="button"
            className="nearby-service-panel__file-button"
            onClick={() =>
              fileInputRef
                .current
                ?.click()
            }
          >
            <span>
              📎
            </span>

            <strong>
              {files.length >
              0
                ? `${files.length} file${
                    files.length ===
                    1
                      ? ""
                      : "s"
                  } attached`
                : "Attach file"}
            </strong>
          </button>


          <input
            ref={
              fileInputRef
            }
            className="nearby-service-panel__hidden-file"
            type="file"
            multiple
            onChange={(
              event,
            ) =>
              setFiles(
                Array.from(
                  event.target
                    .files ??
                    [],
                ),
              )
            }
          />


          <input
            value={
              customerName
            }
            placeholder="Name"
            aria-label="Name"
            autoComplete="name"
            onChange={(
              event,
            ) =>
              setCustomerName(
                event.target
                  .value,
              )
            }
          />


          <div className="nearby-service-panel__contact-row">
            <input
              value={
                phoneOrWhatsApp
              }
              placeholder="Phone / WhatsApp"
              aria-label="Phone or WhatsApp"
              type="tel"
              inputMode="tel"
              autoComplete="tel"
              onChange={(
                event,
              ) =>
                setPhoneOrWhatsApp(
                  sanitizePhone(
                    event.target
                      .value,
                  ),
                )
              }
            />


            <input
              value={
                email
              }
              placeholder="Email"
              aria-label="Email"
              type="email"
              inputMode="email"
              autoComplete="email"
              onChange={(
                event,
              ) =>
                setEmail(
                  event.target
                    .value,
                )
              }
            />
          </div>


          {!isGeneralRequest && (
          <button
            type="button"
            className="nearby-service-panel__more-button"
            onClick={() =>
              setShowMore(
                (
                  current,
                ) =>
                  !current,
              )
            }
          >
            {showMore
              ? "− Hide details"
              : "+ Add more details"}
          </button>
          )}


          {!isGeneralRequest &&
          showMore && (
            <section className="nearby-service-panel__more-fields">
              <input
                type="date"
                value={
                  preferredDate
                }
                aria-label="Preferred date"
                onChange={(
                  event,
                ) =>
                  setPreferredDate(
                    event.target
                      .value,
                  )
                }
              />


              <input
                value={
                  serviceAddress
                }
                placeholder="Service address or landmark"
                aria-label="Service address or landmark"
                onChange={(
                  event,
                ) =>
                  setServiceAddress(
                    event.target
                      .value,
                  )
                }
              />


              <textarea
                rows={
                  2
                }
                value={
                  additionalNotes
                }
                placeholder="Additional notes"
                aria-label="Additional notes"
                onChange={(
                  event,
                ) =>
                  setAdditionalNotes(
                    event.target
                      .value,
                  )
                }
              />
            </section>
          )}


          {selectedBusiness.kind ===
            "external" && (
<small className="nearby-service-panel__external-note">
  {
    selectedBusiness.name
  }{" "}
  is not a participating
  GYAN shop. GYAN Support
  will receive this request
  and assign it to an
  appropriate shop.
</small>
            )}


          {selectedBusiness.kind ===
            "support" && (
              <small className="nearby-service-panel__support-note">
                No nearby shop selected.
                This request will be sent
                to GYAN Support.
              </small>
            )}


          {error && (
            <p
              className="nearby-service-panel__error"
              role="alert"
            >
              {
                error
              }
            </p>
          )}


          <div className="nearby-service-panel__actions">
            <button
              type="button"
              onClick={
                onClose
              }
            >
              Cancel
            </button>


            <button
              type="button"
              className="nearby-service-panel__submit"
              disabled={
                submitting
              }
              onClick={() =>
                void submitRequest()
              }
            >
              {submitting
                ? "Submitting…"
                : "Submit request"}
            </button>
          </div>
        </div>
      </section>
    </div>
  );
}