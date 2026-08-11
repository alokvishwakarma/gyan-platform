import {
  useEffect,
  useState,
} from "react";

import {
  getAdminLocationOverride,
} from "../location/adminLocation";

import "./FeaturedServiceCard.css";


interface FeaturedItem {
  id?: number;

  source:
    | "gyan"
    | "shop"
    | "groupon"
    | "woot"
    | "affiliate"
    | "default";

  title: string;
  description: string;
  icon: string;

  imageUrl:
    | string
    | null;

  ctaLabel: string;

  targetUrl:
    | string
    | null;

  serviceCode:
    | string
    | null;

  shopCode:
    | string
    | null;

  shopName:
    | string
    | null;

  offerText?:
    | string
    | null;

  discountPercent?:
    | number
    | null;

  distanceKm:
    | number
    | null;
}


interface FeaturedResponse {
  mode:
    | "local_ads"
    | "fallback";

  physicalAds:
    FeaturedItem[];

  onlineFallback:
    | FeaturedItem
    | null;

  showGyanTile:
    boolean;

  otherCount:
    number;

  totalPhysicalAds:
    number;

  fallback:
    | FeaturedItem
    | null;
}


interface FeaturedServiceCardProps {
  onStartService?: (
    serviceCode: string,
    serviceName: string,
  ) => void;

  onOpenAdvertise?:
    () => void;

  onOpenRequestService?:
    () => void;
}


interface Coordinates {
  latitude: number;
  longitude: number;
}


interface ResolvedActionLocation {
  city: string;
  region: string;
  regionCode: string;
  countryCode: string;
  postalCode: string;
}


type ActionMode =
  | "advertise"
  | "request"
  | null;


interface AdvertisementSubmitResponse {
  submitted?: boolean;
  emailSent?: boolean;
  submissionId?: number;
  error?: string;
}


interface LocalRequestSubmitResponse {
  submitted?: boolean;
  emailSent?: boolean;
  requestId?: number;
  error?: string;
}


async function fetchFeatured(
  coordinates?: Coordinates,
  limit = 3,
): Promise<FeaturedResponse> {
  const params =
    new URLSearchParams();

  params.set(
    "limit",
    String(limit),
  );

  if (
    coordinates
  ) {
    params.set(
      "lat",
      String(
        coordinates.latitude,
      ),
    );

    params.set(
      "lng",
      String(
        coordinates.longitude,
      ),
    );
  }

  const response =
    await fetch(
      `/api/home-featured?${params.toString()}`,
    );

  if (
    !response.ok
  ) {
    throw new Error(
      "Unable to load featured services.",
    );
  }

  return (
    await response.json()
  ) as FeaturedResponse;
}


function formatDistance(
  distanceKm:
    | number
    | null,
): string | null {
  if (
    distanceKm == null
  ) {
    return null;
  }

  if (
    distanceKm <
    0.05
  ) {
    return "Nearby";
  }

  if (
    distanceKm <
    1
  ) {
    return `${Math.round(
      distanceKm *
        1000,
    )} m away`;
  }

  return `${distanceKm.toFixed(
    1,
  )} km away`;
}


function getSourceLabel(
  item:
    FeaturedItem,
): string {
  switch (
    item.source
  ) {
    case "shop":
      return item.shopName
        ? `Featured by ${item.shopName}`
        : "Featured nearby";

    case "groupon":
      return "Groupon deal";

    case "woot":
      return "Woot deal";

    case "affiliate":
      return "Featured deal";

    case "gyan":
      return "Featured near you";

    default:
      return "Featured";
  }
}


export default function FeaturedServiceCard({
  onStartService,
  onOpenAdvertise,
  onOpenRequestService,
}: FeaturedServiceCardProps) {
  const [
    data,
    setData,
  ] =
    useState<FeaturedResponse | null>(
      null,
    );

  const [
    loading,
    setLoading,
  ] =
    useState(true);

  const [
    coordinates,
    setCoordinates,
  ] =
    useState<Coordinates | null>(
      null,
    );

  const [
    selectedAd,
    setSelectedAd,
  ] =
    useState<FeaturedItem | null>(
      null,
    );

  const [
    moreAds,
    setMoreAds,
  ] =
    useState<FeaturedItem[]>(
      [],
    );

  const [
    moreOpen,
    setMoreOpen,
  ] =
    useState(false);

  const [
    moreLoading,
    setMoreLoading,
  ] =
    useState(false);

  const [
    actionMode,
    setActionMode,
  ] =
    useState<ActionMode>(
      null,
    );

  const [
    actionCoordinates,
    setActionCoordinates,
  ] =
    useState<Coordinates | null>(
      null,
    );


  const [
    actionLocationLabel,
    setActionLocationLabel,
  ] =
    useState("");


  const [
    actionLocationDetails,
    setActionLocationDetails,
  ] =
    useState<
      ResolvedActionLocation | null
    >(null);

  const [
    locationLoading,
    setLocationLoading,
  ] =
    useState(false);

  const [
    locationError,
    setLocationError,
  ] =
    useState("");

  const [
    advertiseSubmitting,
    setAdvertiseSubmitting,
  ] =
    useState(false);

  const [
    advertiseError,
    setAdvertiseError,
  ] =
    useState("");

  const [
    advertiseSubmitted,
    setAdvertiseSubmitted,
  ] =
    useState(false);

  const [
    requestMoreOpen,
    setRequestMoreOpen,
  ] =
    useState(false);

  const [
    requestSubmitting,
    setRequestSubmitting,
  ] =
    useState(false);

  const [
    requestSubmitted,
    setRequestSubmitted,
  ] =
    useState(false);

  const [
    requestError,
    setRequestError,
  ] =
    useState("");


  useEffect(
    () => {
      let cancelled =
        false;

      async function load() {
        try {
          const adminLocation =
            getAdminLocationOverride();

          if (adminLocation) {
            const adminCoordinates = {
              latitude:
                adminLocation.latitude,

              longitude:
                adminLocation.longitude,
            };

            setCoordinates(
              adminCoordinates,
            );

            const localData =
              await fetchFeatured(
                adminCoordinates,
                3,
              );

            if (!cancelled) {
              setData(
                localData,
              );
            }

            return;
          }

          const initial =
            await fetchFeatured();

          if (
            !cancelled
          ) {
            setData(
              initial,
            );
          }

          if (
            !navigator.permissions ||
            !navigator.geolocation
          ) {
            return;
          }

          const permission =
            await navigator.permissions.query({
              name:
                "geolocation",
            });

          if (
            permission.state !==
            "granted"
          ) {
            return;
          }

          navigator.geolocation
            .getCurrentPosition(
              (
                position,
              ) => {
                void (
                  async () => {
                    const currentCoordinates =
                      {
                        latitude:
                          position
                            .coords
                            .latitude,

                        longitude:
                          position
                            .coords
                            .longitude,
                      };

                    if (
                      !cancelled
                    ) {
                      setCoordinates(
                        currentCoordinates,
                      );
                    }

                    try {
                      const localData =
                        await fetchFeatured(
                          currentCoordinates,
                          3,
                        );

                      if (
                        !cancelled
                      ) {
                        setData(
                          localData,
                        );
                      }
                    } catch (
                      error
                    ) {
                      console.error(
                        "Unable to load location featured services:",
                        error,
                      );
                    }
                  }
                )();
              },

              (
                error,
              ) => {
                console.debug(
                  "Featured location unavailable:",
                  error.message,
                );
              },

              {
                enableHighAccuracy:
                  false,

                timeout:
                  5000,

                maximumAge:
                  10 *
                  60 *
                  1000,
              },
            );
        } catch (
          error
        ) {
          console.error(
            "Unable to load featured services:",
            error,
          );
        } finally {
          if (
            !cancelled
          ) {
            setLoading(
              false,
            );
          }
        }
      }

      void load();

      return () => {
        cancelled =
          true;
      };
    },

    [],
  );


  function openItem(
    item:
      FeaturedItem,
  ): void {
    if (
      item.targetUrl
    ) {
      window.open(
        item.targetUrl,
        "_blank",
        "noopener,noreferrer",
      );

      return;
    }

    if (
      item.serviceCode &&
      onStartService
    ) {
      onStartService(
        item.serviceCode,
        item.title,
      );

      return;
    }

    setSelectedAd(
      item,
    );
  }


  async function openMore(): Promise<void> {
    setMoreOpen(
      true,
    );

    setMoreLoading(
      true,
    );

    try {
      const result =
        await fetchFeatured(
          coordinates ??
            undefined,

          10,
        );

      setMoreAds(
        result.physicalAds,
      );
    } catch (
      error
    ) {
      console.error(
        "Unable to load more local offers:",
        error,
      );

      setMoreAds(
        data?.physicalAds ??
          [],
      );
    } finally {
      setMoreLoading(
        false,
      );
    }
  }


  async function resolveActionLocation(
    location:
      Coordinates,
  ): Promise<void> {
    try {
      const parameters =
        new URLSearchParams();

      parameters.set(
        "lat",
        String(
          location.latitude,
        ),
      );

      parameters.set(
        "lng",
        String(
          location.longitude,
        ),
      );

      const response =
        await fetch(
          `/api/location/resolve?${parameters.toString()}`,
        );

      const result =
        (await response.json()) as {
          location?: {
            city?: string;
            region?: string;
            regionCode?: string;
            countryCode?: string;
            postalCode?: string;
          };

          error?: string;
        };

      if (
        !response.ok ||
        !result.location
      ) {
        setActionLocationLabel(
          "",
        );

        setActionLocationDetails(
          null,
        );

        return;
      }

      setActionLocationLabel(
        [
          result.location.city,
          result.location.regionCode ||
            result.location.region,
        ]
          .filter(Boolean)
          .join(", "),
      );

      setActionLocationDetails({
        city:
          result.location.city ??
          "",

        region:
          result.location.region ??
          "",

        regionCode:
          result.location.regionCode ??
          "",

        countryCode:
          result.location.countryCode ??
          "",

        postalCode:
          result.location.postalCode ??
          "",
      });
    } catch {
      /*
       * Coordinates remain authoritative
       * even if reverse lookup fails.
       */
      setActionLocationLabel(
        "",
      );

      setActionLocationDetails(
        null,
      );
    }
  }


  function captureActionLocation(): void {
    const adminLocation =
      getAdminLocationOverride();

    if (adminLocation) {
      const captured = {
        latitude:
          adminLocation.latitude,

        longitude:
          adminLocation.longitude,
      };

      setActionCoordinates(
        captured,
      );

      setCoordinates(
        captured,
      );

      void resolveActionLocation(
        captured,
      );

      setLocationLoading(
        false,
      );

      setLocationError(
        "",
      );

      void (
        async () => {
          try {
            const localData =
              await fetchFeatured(
                captured,
                3,
              );

            setData(
              localData,
            );
          } catch (
            error
          ) {
            console.error(
              "Unable to refresh featured services:",
              error,
            );
          }
        }
      )();

      return;
    }

    if (
      !navigator.geolocation
    ) {
      setLocationError(
        "Location is not available on this device.",
      );

      return;
    }

    setLocationLoading(
      true,
    );

    setLocationError(
      "",
    );

    navigator.geolocation
      .getCurrentPosition(
        (
          position,
        ) => {
          const captured =
            {
              latitude:
                position
                  .coords
                  .latitude,

              longitude:
                position
                  .coords
                  .longitude,
            };

          setActionCoordinates(
            captured,
          );

          setCoordinates(
            captured,
          );

          setLocationLoading(
            false,
          );

          void (
            async () => {
              try {
                const localData =
                  await fetchFeatured(
                    captured,
                    3,
                  );

                setData(
                  localData,
                );
              } catch (
                error
              ) {
                console.error(
                  "Unable to refresh featured services:",
                  error,
                );
              }
            }
          )();
        },

        (
          error,
        ) => {
          setLocationLoading(
            false,
          );

          setLocationError(
            error.message ||
              "Location permission is required.",
          );
        },

        {
          enableHighAccuracy:
            false,

          timeout:
            10000,

          maximumAge:
            5 *
            60 *
            1000,
        },
      );
  }


  function openAdvertise(): void {
    if (
      onOpenAdvertise
    ) {
      onOpenAdvertise();

      return;
    }

    const adminLocation =
      getAdminLocationOverride();

    const nextActionCoordinates =
      adminLocation
        ? {
            latitude:
              adminLocation.latitude,

            longitude:
              adminLocation.longitude,
          }
        : coordinates;

    setActionCoordinates(
      nextActionCoordinates,
    );

    setActionLocationLabel(
      "",
    );

    setActionLocationDetails(
      null,
    );

    if (
      nextActionCoordinates
    ) {
      void resolveActionLocation(
        nextActionCoordinates,
      );
    }

    setLocationError(
      "",
    );

    setAdvertiseError(
      "",
    );

    setAdvertiseSubmitted(
      false,
    );

    setActionMode(
      "advertise",
    );
  }


  function openRequestService(): void {
    if (
      onOpenRequestService
    ) {
      onOpenRequestService();

      return;
    }

    const adminLocation =
      getAdminLocationOverride();

    const nextActionCoordinates =
      adminLocation
        ? {
            latitude:
              adminLocation.latitude,

            longitude:
              adminLocation.longitude,
          }
        : coordinates;

    setActionCoordinates(
      nextActionCoordinates,
    );

    setActionLocationLabel(
      "",
    );

    setActionLocationDetails(
      null,
    );

    if (
      nextActionCoordinates
    ) {
      void resolveActionLocation(
        nextActionCoordinates,
      );
    }

    setLocationError(
      "",
    );

    setRequestMoreOpen(
      false,
    );

    setRequestSubmitted(
      false,
    );

    setRequestError(
      "",
    );

    setActionMode(
      "request",
    );
  }


  async function submitAdvertisement(
    form:
      HTMLFormElement,
  ): Promise<void> {
    if (
      !actionCoordinates ||
      advertiseSubmitting
    ) {
      return;
    }

    const formData =
      new FormData(
        form,
      );

    const discountValue =
      String(
        formData.get(
          "discountPercent",
        ) ??
        "",
      ).trim();

    setAdvertiseSubmitting(
      true,
    );

    setAdvertiseError(
      "",
    );

    try {
      let resolvedLocation =
        actionLocationDetails;

      if (
        !resolvedLocation
      ) {
        try {
          const parameters =
            new URLSearchParams();

          parameters.set(
            "lat",
            String(
              actionCoordinates.latitude,
            ),
          );

          parameters.set(
            "lng",
            String(
              actionCoordinates.longitude,
            ),
          );

          const locationResponse =
            await fetch(
              `/api/location/resolve?${parameters.toString()}`,
            );

          const locationResult =
            (await locationResponse.json()) as {
              location?: {
                city?: string;
                region?: string;
                regionCode?: string;
                countryCode?: string;
                postalCode?: string;
              };
            };

          if (
            locationResponse.ok &&
            locationResult.location
          ) {
            resolvedLocation = {
              city: locationResult.location.city ?? "",
              region: locationResult.location.region ?? "",
              regionCode: locationResult.location.regionCode ?? "",
              countryCode: locationResult.location.countryCode ?? "",
              postalCode: locationResult.location.postalCode ?? "",
            };
          }
        } catch {
          // Coordinates remain authoritative.
        }
      }

      const response =
        await fetch(
          "/api/advertisements",
          {
            method:
              "POST",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                businessName:
                  String(
                    formData.get(
                      "businessName",
                    ) ??
                    "",
                  ),

                service:
                  String(
                    formData.get(
                      "service",
                    ) ??
                    "",
                  ),

                distanceMiles:
                  Number(
                    formData.get(
                      "distance",
                    ),
                  ),

                offer:
                  String(
                    formData.get(
                      "offer",
                    ) ??
                    "",
                  ),

                discountPercent:
                  discountValue
                    ? Number(
                        discountValue,
                      )
                    : null,

                phone:
                  String(
                    formData.get(
                      "phone",
                    ) ??
                    "",
                  ),

                email:
                  String(
                    formData.get(
                      "email",
                    ) ??
                    "",
                  ),

                latitude:
                  actionCoordinates
                    .latitude,

                longitude:
                  actionCoordinates
                    .longitude,

                city:
                  resolvedLocation?.city ?? "",

                region:
                  resolvedLocation?.region ?? "",

                regionCode:
                  resolvedLocation?.regionCode ?? "",

                countryCode:
                  resolvedLocation?.countryCode ?? "",

                postalCode:
                  resolvedLocation?.postalCode ?? "",
              }),
          },
        );

      const result =
        await response.json() as
          AdvertisementSubmitResponse;

      if (
        !response.ok
      ) {
        throw new Error(
          result.error ??
          "Advertisement could not be submitted.",
        );
      }

      setAdvertiseSubmitted(
        true,
      );
    } catch (
      error
    ) {
      setAdvertiseError(
        error instanceof
          Error
          ? error.message
          : "Advertisement could not be submitted.",
      );
    } finally {
      setAdvertiseSubmitting(
        false,
      );
    }
  }


  async function submitLocalServiceRequest(
    form:
      HTMLFormElement,
  ): Promise<void> {
    if (
      !actionCoordinates ||
      requestSubmitting
    ) {
      return;
    }

    const formData =
      new FormData(
        form,
      );

    setRequestSubmitting(
      true,
    );

    setRequestError(
      "",
    );

    try {
      let resolvedLocation =
        actionLocationDetails;

      if (
        !resolvedLocation
      ) {
        await resolveActionLocation(
          actionCoordinates,
        );

        /*
         * React state updates are asynchronous, so
         * fetch the resolver directly for the submit
         * path when details are still unavailable.
         */
        try {
          const parameters =
            new URLSearchParams();

          parameters.set(
            "lat",
            String(
              actionCoordinates.latitude,
            ),
          );

          parameters.set(
            "lng",
            String(
              actionCoordinates.longitude,
            ),
          );

          const locationResponse =
            await fetch(
              `/api/location/resolve?${parameters.toString()}`,
            );

          const locationResult =
            (await locationResponse.json()) as {
              location?: {
                city?: string;
                region?: string;
                regionCode?: string;
                countryCode?: string;
                postalCode?: string;
              };
            };

          if (
            locationResponse.ok &&
            locationResult.location
          ) {
            resolvedLocation = {
              city:
                locationResult.location.city ??
                "",

              region:
                locationResult.location.region ??
                "",

              regionCode:
                locationResult.location.regionCode ??
                "",

              countryCode:
                locationResult.location.countryCode ??
                "",

              postalCode:
                locationResult.location.postalCode ??
                "",
            };
          }
        } catch {
          /*
           * Location text is useful but should not
           * block a valid coordinate-based request.
           */
        }
      }

      const response =
        await fetch(
          "/api/local-service-requests",
          {
            method:
              "POST",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                service:
                  String(
                    formData.get(
                      "service",
                    ) ??
                    "",
                  ),

                details:
                  String(
                    formData.get(
                      "details",
                    ) ??
                    "",
                  ),

                distanceMiles:
                  Number(
                    formData.get(
                      "distance",
                    ),
                  ),

                email:
                  String(
                    formData.get(
                      "email",
                    ) ??
                    "",
                  ),

                phone:
                  String(
                    formData.get(
                      "phone",
                    ) ??
                    "",
                  ),

                preferredTime:
                  String(
                    formData.get(
                      "preferredTime",
                    ) ??
                    "",
                  ),

                latitude:
                  actionCoordinates
                    .latitude,

                longitude:
                  actionCoordinates
                    .longitude,

                city:
                  resolvedLocation
                    ?.city ??
                  "",

                region:
                  resolvedLocation
                    ?.region ??
                  "",

                regionCode:
                  resolvedLocation
                    ?.regionCode ??
                  "",

                countryCode:
                  resolvedLocation
                    ?.countryCode ??
                  "",

                postalCode:
                  resolvedLocation
                    ?.postalCode ??
                  "",
              }),
          },
        );

      const result =
        await response.json() as
          LocalRequestSubmitResponse;

      if (
        !response.ok
      ) {
        throw new Error(
          result.error ??
          "Service request could not be submitted.",
        );
      }

      setRequestSubmitted(
        true,
      );
    } catch (
      error
    ) {
      setRequestError(
        error instanceof
          Error
          ? error.message
          : "Service request could not be submitted.",
      );
    } finally {
      setRequestSubmitting(
        false,
      );
    }
  }


  if (
    loading &&
    !data
  ) {
    return (
      <section
        className="featured-service"
        aria-label="Featured services"
      >
        <div
          className="featured-service__loading"
        >
          Loading featured
          services…
        </div>
      </section>
    );
  }


  if (
    !data
  ) {
    return null;
  }


  const ads =
    data.physicalAds;

  const firstAd =
    ads[0] ??
    null;

  const secondAd =
    ads[1] ??
    null;

  const thirdAd =
    ads[2] ??
    null;


  function renderActions() {
    return (
      <div
        className="featured-service__actions"
      >
        <button
          type="button"
          aria-label="Advertise"
          title="Advertise"
          onClick={
            openAdvertise
          }
        >
          <span
            aria-hidden="true"
          >
            📣
          </span>

          <strong>
            Advertise
          </strong>
        </button>

        <button
          type="button"
          aria-label="Request Service"
          title="Request Service"
          onClick={
            openRequestService
          }
        >
          <span
            aria-hidden="true"
          >
            🙋
          </span>

          <strong>
            Request
          </strong>
        </button>
      </div>
    );
  }


  function renderAdTile(
    item:
      FeaturedItem,

    variant:
      | "primary"
      | "secondary",
  ) {
    const distance =
      formatDistance(
        item.distanceKm,
      );

    return (
      <button
        type="button"
        className={
          variant ===
          "primary"
            ? "featured-service__ad featured-service__ad--primary"
            : "featured-service__ad featured-service__ad--secondary"
        }
        onClick={() =>
          openItem(
            item,
          )
        }
      >
        <span
          className="featured-service__ad-icon"
          aria-hidden="true"
        >
          {
            item.icon ||
            "⭐"
          }
        </span>

        <span
          className="featured-service__ad-body"
        >
          <strong>
            {
              item.title
            }
          </strong>

          {
            item.offerText &&
            (
              <span
                className="featured-service__ad-offer"
              >
                {
                  item.offerText
                }
              </span>
            )
          }

          {
            distance &&
            (
              <small>
                {
                  distance
                }
              </small>
            )
          }
        </span>

        {
          variant ===
            "primary" &&
          (
            <span
              className="featured-service__ad-action"
            >
              {
                item.ctaLabel ||
                "View"
              }
            </span>
          )
        }
      </button>
    );
  }


  function renderSmallTile(
    item:
      FeaturedItem,
  ) {
    return (
      <button
        type="button"
        className="featured-service__small-tile featured-service__small-tile--online"
        onClick={() =>
          openItem(
            item,
          )
        }
      >
        <span
          aria-hidden="true"
          className="featured-service__small-icon"
        >
          {
            item.icon ||
            "💻"
          }
        </span>

        <strong>
          {
            item.title
          }
        </strong>

        <small>
          Online
        </small>
      </button>
    );
  }


  function renderFallbackContent(
    fallback:
      FeaturedItem,
  ) {
    const distance =
      formatDistance(
        fallback.distanceKm,
      );

    return (
      <button
        type="button"
        className="featured-service__fallback"
        onClick={() =>
          openItem(
            fallback,
          )
        }
      >
        <span
          className="featured-service__fallback-icon"
          aria-hidden="true"
        >
          {
            fallback.icon ||
            "⭐"
          }
        </span>

        <span
          className="featured-service__fallback-text"
        >
          <small>
            ⭐{" "}
            {
              getSourceLabel(
                fallback,
              )
            }
          </small>

          <strong>
            {
              fallback.title
            }
          </strong>

          {
            fallback.description &&
            (
              <span>
                {
                  fallback.description
                }
              </span>
            )
          }

          {
            distance &&
            (
              <em>
                {
                  distance
                }
              </em>
            )
          }
        </span>

        <span
          className="featured-service__fallback-action"
        >
          {
            fallback.ctaLabel ||
            "Open"
          }
        </span>
      </button>
    );
  }


  const fallback =
    data.fallback ??
    data.onlineFallback;


  return (
    <>
      <section
        className="featured-service"
        aria-label="Featured offers"
      >
        <div
          className="featured-service__heading"
        >
          <strong>
            ⭐ Featured near you
          </strong>
        </div>

        <div
          className="featured-service__primary-row"
        >
          <div
            className="featured-service__primary-slot"
          >
            {
              firstAd
                ? renderAdTile(
                    firstAd,
                    "primary",
                  )
                : fallback
                  ? renderFallbackContent(
                      fallback,
                    )
                  : null
            }
          </div>

          {
            renderActions()
          }
        </div>

        {
          ads.length >=
            3 &&
          (
            <div
              className="featured-service__secondary-row"
            >
              {
                secondAd &&
                (
                  <div
                    className="featured-service__secondary-slot"
                  >
                    {
                      renderAdTile(
                        secondAd,
                        "secondary",
                      )
                    }
                  </div>
                )
              }

              {
                thirdAd &&
                (
                  <div
                    className="featured-service__secondary-slot"
                  >
                    {
                      renderAdTile(
                        thirdAd,
                        "secondary",
                      )
                    }
                  </div>
                )
              }

              <button
                type="button"
                className="featured-service__more"
                onClick={() => {
                  void openMore();
                }}
              >
                <strong>
                  {
                    data.otherCount >
                    0
                      ? `+${data.otherCount}`
                      : "..."
                  }
                </strong>

                <span>
                  More
                </span>
              </button>
            </div>
          )
        }

        {
          ads.length ===
            2 &&
          (
            <div
              className="featured-service__half-row"
            >
              {
                secondAd &&
                renderAdTile(
                  secondAd,
                  "secondary",
                )
              }

              {
                data.onlineFallback &&
                renderSmallTile(
                  data.onlineFallback,
                )
              }
            </div>
          )
        }

        {
          ads.length ===
            1 &&
          (
            <div
              className="featured-service__half-row"
            >
              {
                data.onlineFallback &&
                renderSmallTile(
                  data.onlineFallback,
                )
              }

              {
                data.showGyanTile &&
                (
                  <button
                    type="button"
                    className="featured-service__small-tile featured-service__small-tile--gyan"
                  >
                    <span
                      className="featured-service__small-icon"
                      aria-hidden="true"
                    >
                      ▶️
                    </span>

                    <strong>
                      Discover GYAN
                    </strong>

                    <small>
                      1 min
                    </small>
                  </button>
                )
              }
            </div>
          )
        }
      </section>


      {
        selectedAd &&
        (
          <div
            className="featured-service__overlay"
            role="presentation"
            onClick={() =>
              setSelectedAd(
                null,
              )
            }
          >
            <section
              className="featured-service__detail"
              role="dialog"
              aria-modal="true"
              aria-label="Featured offer details"
              onClick={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <button
                type="button"
                className="featured-service__close"
                aria-label="Close"
                onClick={() =>
                  setSelectedAd(
                    null,
                  )
                }
              >
                ×
              </button>

              <div
                className="featured-service__detail-icon"
                aria-hidden="true"
              >
                {
                  selectedAd.icon ||
                  "⭐"
                }
              </div>

              <h3>
                {
                  selectedAd.title
                }
              </h3>

              {
                selectedAd.offerText &&
                (
                  <div
                    className="featured-service__detail-offer"
                  >
                    🎁{" "}
                    {
                      selectedAd.offerText
                    }
                  </div>
                )
              }

              {
                selectedAd.description &&
                (
                  <p>
                    {
                      selectedAd.description
                    }
                  </p>
                )
              }

              {
                formatDistance(
                  selectedAd.distanceKm,
                ) &&
                (
                  <small>
                    📍{" "}
                    {
                      formatDistance(
                        selectedAd.distanceKm,
                      )
                    }
                  </small>
                )
              }

              <button
                type="button"
                className="featured-service__detail-done"
                onClick={() =>
                  setSelectedAd(
                    null,
                  )
                }
              >
                Close
              </button>
            </section>
          </div>
        )
      }


      {
        moreOpen &&
        (
          <div
            className="featured-service__overlay"
            role="presentation"
            onClick={() =>
              setMoreOpen(
                false,
              )
            }
          >
            <section
              className="featured-service__more-panel"
              role="dialog"
              aria-modal="true"
              aria-label="Offers near you"
              onClick={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <header
                className="featured-service__more-header"
              >
                <div>
                  <strong>
                    Offers near you
                  </strong>

                  <small>
                    Top local offers
                  </small>
                </div>

                <button
                  type="button"
                  aria-label="Close"
                  onClick={() =>
                    setMoreOpen(
                      false,
                    )
                  }
                >
                  ×
                </button>
              </header>

              {
                moreLoading
                  ? (
                    <div
                      className="featured-service__more-loading"
                    >
                      Loading offers…
                    </div>
                  )
                  : (
                    <div
                      className="featured-service__more-list"
                    >
                      {
                        moreAds.map(
                          (
                            item,
                            index,
                          ) => (
                            <button
                              type="button"
                              key={
                                item.id ??
                                `${item.title}-${index}`
                              }
                              onClick={() => {
                                setMoreOpen(
                                  false,
                                );

                                openItem(
                                  item,
                                );
                              }}
                            >
                              <span
                                aria-hidden="true"
                              >
                                {
                                  item.icon ||
                                  "⭐"
                                }
                              </span>

                              <span>
                                <strong>
                                  {
                                    item.title
                                  }
                                </strong>

                                {
                                  item.offerText &&
                                  (
                                    <small>
                                      {
                                        item.offerText
                                      }
                                    </small>
                                  )
                                }
                              </span>

                              <em>
                                {
                                  formatDistance(
                                    item.distanceKm,
                                  ) ??
                                  ""
                                }
                              </em>
                            </button>
                          ),
                        )
                      }
                    </div>
                  )
              }
            </section>
          </div>
        )
      }


      {
        actionMode ===
          "advertise" &&
        (
          <div
            className="featured-service__action-overlay"
            role="presentation"
            onClick={() =>
              setActionMode(
                null,
              )
            }
          >
            <section
              className="featured-service__advertise-panel"
              role="dialog"
              aria-modal="true"
              aria-labelledby="advertise-title"
              onClick={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <header
                className="featured-service__advertise-header"
              >
                <div
                  className="featured-service__advertise-heading"
                >
                  <span
                    className="featured-service__advertise-icon"
                    aria-hidden="true"
                  >
                    📣
                  </span>

                  <div>
                    <h3
                      id="advertise-title"
                    >
                      Advertise for Free
                    </h3>

                    <p>
                      Reach customers
                      near your business.
                    </p>
                  </div>
                </div>

                <button
                  type="button"
                  className="featured-service__advertise-close"
                  aria-label="Close"
                  onClick={() =>
                    setActionMode(
                      null,
                    )
                  }
                >
                  ×
                </button>
              </header>

              {
                !actionCoordinates
                  ? (
                    <div
                      className="featured-service__advertise-location"
                    >
                      <div
                        className="featured-service__advertise-location-icon"
                        aria-hidden="true"
                      >
                        📍
                      </div>

                      <strong>
                        Share your location
                      </strong>

                      <p>
                        Your location is
                        required so GYAN can
                        show the advertisement
                        to nearby customers.
                      </p>

                      <button
                        type="button"
                        className="featured-service__location-button"
                        onClick={
                          captureActionLocation
                        }
                        disabled={
                          locationLoading
                        }
                      >
                        {
                          locationLoading
                            ? "Getting location…"
                            : "📍 Use my location"
                        }
                      </button>

                      {
                        locationError &&
                        (
                          <div
                            className="featured-service__location-error"
                          >
                            {
                              locationError
                            }
                          </div>
                        )
                      }
                    </div>
                  )
                  : (
                    <form
                      className="featured-service__advertise-form"
                      onSubmit={(
                        event,
                      ) => {
                        event.preventDefault();

                        void submitAdvertisement(
                          event.currentTarget,
                        );
                      }}
                    >
                      <div
                        className="featured-service__location-confirmed"
                        title={
                          actionCoordinates
                            ? `Location verified${actionLocationLabel ? ` · ${actionLocationLabel}` : ""} · ${actionCoordinates.latitude.toFixed(4)}, ${actionCoordinates.longitude.toFixed(4)}`
                            : "Location verified"
                        }
                      >
                        <span>
                          ✓ Location verified
                        </span>

                        {
                          actionLocationLabel &&
                          (
                            <>
                              <span>
                                ·
                              </span>

                              <span>
                                {
                                  actionLocationLabel
                                }
                              </span>
                            </>
                          )
                        }

                        {
                          actionCoordinates &&
                          (
                            <>
                              <span>
                                ·
                              </span>

                              <span>
                                {
                                  actionCoordinates.latitude.toFixed(
                                    4,
                                  )
                                }
                                {", "}
                                {
                                  actionCoordinates.longitude.toFixed(
                                    4,
                                  )
                                }
                              </span>
                            </>
                          )
                        }
                      </div>

                      <label>
                        <span>
                          Business / Shop *
                        </span>

                        <input
                          required
                          name="businessName"
                          autoComplete="organization"
                          placeholder="Business name"
                          disabled={
                            advertiseSubmitted
                          }
                        />
                      </label>

                      <label>
                        <span>
                          Service *
                        </span>

                        <input
                          required
                          name="service"
                          placeholder="Pizza, printing, repair..."
                          disabled={
                            advertiseSubmitted
                          }
                        />
                      </label>

                      <div
                        className="featured-service__advertise-two-columns"
                      >
                        <label>
                          <span>
                            Service area *
                          </span>

                          <select
                            required
                            name="distance"
                            defaultValue="5"
                            disabled={
                              advertiseSubmitted
                            }
                          >
                            <option value="1">
                              1 mile
                            </option>

                            <option value="2">
                              2 miles
                            </option>

                            <option value="5">
                              5 miles
                            </option>

                            <option value="10">
                              10 miles
                            </option>

                            <option value="20">
                              20 miles
                            </option>

                            <option value="50">
                              50 miles
                            </option>
                          </select>
                        </label>

                        <label>
                          <span>
                            Discount %
                          </span>

                          <input
                            name="discountPercent"
                            type="number"
                            min="0"
                            max="100"
                            inputMode="decimal"
                            placeholder="Optional"
                            disabled={
                              advertiseSubmitted
                            }
                          />
                        </label>
                      </div>

                      <label>
                        <span>
                          GYAN Offer
                        </span>

                        <input
                          name="offer"
                          placeholder="10% off, free delivery..."
                          disabled={
                            advertiseSubmitted
                          }
                        />
                      </label>

                      <div
                        className="featured-service__advertise-two-columns"
                      >
                        <label>
                          <span>
                            Phone
                          </span>

                          <input
                            name="phone"
                            type="tel"
                            autoComplete="tel"
                            placeholder="Optional"
                            disabled={
                              advertiseSubmitted
                            }
                          />
                        </label>

                        <label>
                          <span>
                            Email *
                          </span>

                          <input
                            required
                            name="email"
                            type="email"
                            autoComplete="email"
                            placeholder="Email"
                            disabled={
                              advertiseSubmitted
                            }
                          />
                        </label>
                      </div>

                      <p
                        className="featured-service__advertise-note"
                      >
                        We will verify your
                        email before the
                        advertisement can be
                        published.
                      </p>

                      {
                        advertiseError &&
                        (
                          <div
                            className="featured-service__location-error"
                          >
                            {
                              advertiseError
                            }
                          </div>
                        )
                      }

                      {
                        advertiseSubmitted &&
                        (
                          <div
                            className="featured-service__advertise-success"
                          >
                            ✉️ Verification
                            email sent.
                            Please check your
                            inbox.
                          </div>
                        )
                      }

                      <button
                        type="submit"
                        className="featured-service__advertise-submit"
                        disabled={
                          advertiseSubmitting ||
                          advertiseSubmitted
                        }
                      >
                        {
                          advertiseSubmitting
                            ? "Submitting…"
                            : advertiseSubmitted
                              ? "Verification email sent"
                              : "Advertise for Free"
                        }
                      </button>
                    </form>
                  )
              }
            </section>
          </div>
        )
      }


      {
        actionMode ===
          "request" &&
        (
          <div
            className="featured-service__action-overlay"
            role="presentation"
            onClick={() =>
              setActionMode(
                null,
              )
            }
          >
            <section
              className="featured-service__request-panel"
              role="dialog"
              aria-modal="true"
              aria-labelledby="request-service-title"
              onClick={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <header
                className="featured-service__request-header"
              >
                <div
                  className="featured-service__request-heading"
                >
                  <span
                    className="featured-service__request-icon"
                    aria-hidden="true"
                  >
                    🙋
                  </span>

                  <div>
                    <h3
                      id="request-service-title"
                    >
                      Request Service
                    </h3>

                    <p>
                      Tell nearby providers
                      what you need.
                    </p>
                  </div>
                </div>

                <button
                  type="button"
                  className="featured-service__request-close"
                  aria-label="Close"
                  onClick={() =>
                    setActionMode(
                      null,
                    )
                  }
                >
                  ×
                </button>
              </header>

              {
                !actionCoordinates
                  ? (
                    <div
                      className="featured-service__request-location"
                    >
                      <div
                        className="featured-service__request-location-icon"
                        aria-hidden="true"
                      >
                        📍
                      </div>

                      <strong>
                        Share your location
                      </strong>

                      <p>
                        GYAN uses your location
                        to find participating
                        providers nearby.
                      </p>

                      <button
                        type="button"
                        className="featured-service__location-button"
                        onClick={
                          captureActionLocation
                        }
                        disabled={
                          locationLoading
                        }
                      >
                        {
                          locationLoading
                            ? "Getting location…"
                            : "📍 Use my location"
                        }
                      </button>

                      {
                        locationError &&
                        (
                          <div
                            className="featured-service__location-error"
                          >
                            {
                              locationError
                            }
                          </div>
                        )
                      }
                    </div>
                  )
                  : (
                    <form
                      className="featured-service__request-form"
                      onSubmit={(
                        event,
                      ) => {
                        event.preventDefault();

                        void submitLocalServiceRequest(
                          event.currentTarget,
                        );
                      }}
                    >
                      <div
                        className="featured-service__location-confirmed"
                        title={
                          actionCoordinates
                            ? `Location verified${actionLocationLabel ? ` · ${actionLocationLabel}` : ""} · ${actionCoordinates.latitude.toFixed(4)}, ${actionCoordinates.longitude.toFixed(4)}`
                            : "Location verified"
                        }
                      >
                        <span>
                          ✓ Location verified
                        </span>

                        {
                          actionLocationLabel &&
                          (
                            <>
                              <span>
                                ·
                              </span>

                              <span>
                                {
                                  actionLocationLabel
                                }
                              </span>
                            </>
                          )
                        }

                        {
                          actionCoordinates &&
                          (
                            <>
                              <span>
                                ·
                              </span>

                              <span>
                                {
                                  actionCoordinates.latitude.toFixed(
                                    4,
                                  )
                                }
                                {", "}
                                {
                                  actionCoordinates.longitude.toFixed(
                                    4,
                                  )
                                }
                              </span>
                            </>
                          )
                        }
                      </div>

                      <label>
                        <span>
                          What do you need? *
                        </span>

                        <input
                          required
                          name="service"
                          placeholder="Pizza delivery, printing, repair..."
                          disabled={
                            requestSubmitted
                          }
                        />
                      </label>

                      <label>
                        <span>
                          Search area *
                        </span>

                        <select
                          required
                          name="distance"
                          defaultValue="10"
                          disabled={
                            requestSubmitted
                          }
                        >
                          <option value="1">
                            1 mile
                          </option>

                          <option value="2">
                            2 miles
                          </option>

                          <option value="5">
                            5 miles
                          </option>

                          <option value="10">
                            10 miles
                          </option>

                          <option value="20">
                            20 miles
                          </option>

                          <option value="50">
                            50 miles
                          </option>
                        </select>
                      </label>

                      <label>
                        <span>
                          Email *
                        </span>

                        <input
                          required
                          name="email"
                          type="email"
                          autoComplete="email"
                          placeholder="Email"
                          disabled={
                            requestSubmitted
                          }
                        />
                      </label>

                      {
                        !requestSubmitted &&
                        (
                          <button
                            type="button"
                            className="featured-service__request-more"
                            onClick={() =>
                              setRequestMoreOpen(
                                (
                                  current,
                                ) =>
                                  !current,
                              )
                            }
                          >
                            {
                              requestMoreOpen
                                ? "− Fewer fields"
                                : "+ More fields"
                            }
                          </button>
                        )
                      }

                      {
                        requestMoreOpen &&
                        !requestSubmitted &&
                        (
                          <div
                            className="featured-service__request-extra"
                          >
                            <label>
                              <span>
                                Details
                              </span>

                              <textarea
                                name="details"
                                rows={3}
                                placeholder="Anything the provider should know?"
                              />
                            </label>

                            <label>
                              <span>
                                Phone
                              </span>

                              <input
                                name="phone"
                                type="tel"
                                autoComplete="tel"
                                placeholder="Optional"
                              />
                            </label>

                            <label>
                              <span>
                                Preferred time
                              </span>

                              <input
                                name="preferredTime"
                                placeholder="Today evening, tomorrow morning..."
                              />
                            </label>
                          </div>
                        )
                      }

                      {
                        requestError &&
                        (
                          <div
                            className="featured-service__location-error"
                          >
                            {
                              requestError
                            }
                          </div>
                        )
                      }

                      {
                        requestSubmitted &&
                        (
                          <div
                            className="featured-service__request-success"
                          >
                            <div
                              aria-hidden="true"
                            >
                              ✉️
                            </div>

                            <strong>
                              Check your email
                            </strong>

                            <span>
                              Verify your email so
                              GYAN can route your
                              request to a nearby
                              provider or GYAN Support.
                            </span>
                          </div>
                        )
                      }

                      <button
                        type="submit"
                        className="featured-service__request-submit"
                        disabled={
                          requestSubmitting ||
                          requestSubmitted
                        }
                      >
                        {
                          requestSubmitting
                            ? "Submitting…"
                            : requestSubmitted
                              ? "Verification email sent"
                              : "Request Service"
                        }
                      </button>
                    </form>
                  )
              }
            </section>
          </div>
        )
      }
    </>
  );
}