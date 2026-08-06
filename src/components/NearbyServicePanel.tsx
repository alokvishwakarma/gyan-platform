import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./NearbyServicePanel.css";

interface NearbyServicePanelProps {
  serviceCode: string;
  serviceName: string;

  onClose: () => void;

  onOpenShop: (
    shopCode: string,
  ) => void;
}

interface LocationHint {
  countryCode?: string;
  country?: string;
  region?: string;
  city?: string;
  postalCode?: string;
}

interface RegisteredShop {
  code: string;
  name: string;
  address: string;

  phoneNumber: string;
  whatsappNumber:
    | string
    | null;

  distanceKm:
    | number
    | null;

  matchingServiceCount: number;
  serviceNames: string[];
}

interface NearbyShopsResponse {
  registeredShops?: RegisteredShop[];
  error?: string;
}

type LocationStatus =
  | "idle"
  | "requesting"
  | "precise"
  | "approximate"
  | "denied"
  | "unavailable";

export default function NearbyServicePanel({
  serviceCode,
  serviceName,
  onClose,
  onOpenShop,
}: NearbyServicePanelProps) {
  const [
    locationStatus,
    setLocationStatus,
  ] =
    useState<LocationStatus>(
      "idle",
    );

  const [
    latitude,
    setLatitude,
  ] =
    useState<number | null>(
      null,
    );

  const [
    longitude,
    setLongitude,
  ] =
    useState<number | null>(
      null,
    );

  const [
    stateRegion,
    setStateRegion,
  ] =
    useState("");

  const [
    city,
    setCity,
  ] =
    useState("");

  const [
    shops,
    setShops,
  ] =
    useState<RegisteredShop[]>(
      [],
    );

  const [
    loading,
    setLoading,
  ] =
    useState(false);

  const [
    error,
    setError,
  ] =
    useState("");

  useEffect(() => {
    const controller =
      new AbortController();

    async function loadHint() {
      try {
        const browserTimezone =
          Intl.DateTimeFormat()
            .resolvedOptions()
            .timeZone;

        const browserLanguages =
          navigator.languages ??
          [navigator.language];

        const response =
          await fetch(
            "/api/location-hint",
            {
              signal:
                controller.signal,

              headers: {
                "x-gyan-timezone":
                  browserTimezone,

                "x-gyan-languages":
                  browserLanguages.join(
                    ",",
                  ),
              },
            },
          );

        if (!response.ok) {
          return;
        }

        const hint =
          (await response.json()) as
            LocationHint;

        if (
          controller.signal.aborted
        ) {
          return;
        }

        setStateRegion(
          hint.region ?? "",
        );

        setCity(
          hint.city ?? "",
        );

        setLocationStatus(
          "approximate",
        );
      } catch {
        // Manual location entry remains available.
      }
    }

    void loadHint();

    return () => {
      controller.abort();
    };
  }, []);

  const locationDescription =
    useMemo(
      () =>
        [
          city.trim(),
          stateRegion.trim(),
        ]
          .filter(Boolean)
          .join(", "),
      [
        city,
        stateRegion,
      ],
    );

  async function loadNearbyShops(
    nextLatitude:
      | number
      | null = latitude,

    nextLongitude:
      | number
      | null = longitude,
  ): Promise<void> {
    setLoading(true);
    setError("");

    try {
      const parameters =
        new URLSearchParams({
          serviceCode,
        });

      if (nextLatitude != null) {
        parameters.set(
          "lat",
          String(nextLatitude),
        );
      }

      if (nextLongitude != null) {
        parameters.set(
          "lng",
          String(nextLongitude),
        );
      }

      if (city.trim()) {
        parameters.set(
          "city",
          city.trim(),
        );
      }

      if (stateRegion.trim()) {
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
          NearbyShopsResponse;

      if (
        !response.ok ||
        !result.registeredShops
      ) {
        throw new Error(
          result.error ??
            "Nearby shops could not be loaded.",
        );
      }

      setShops(
        result.registeredShops,
      );
    } catch (caughtError) {
      setError(
        caughtError instanceof Error
          ? caughtError.message
          : "Nearby shops could not be loaded.",
      );
    } finally {
      setLoading(false);
    }
  }

  function requestPreciseLocation():
    void {
    if (
      !navigator.geolocation
    ) {
      setLocationStatus(
        "unavailable",
      );

      void loadNearbyShops();

      return;
    }

    setLocationStatus(
      "requesting",
    );

    navigator.geolocation
      .getCurrentPosition(
        (position) => {
          const nextLatitude =
            position.coords.latitude;

          const nextLongitude =
            position.coords.longitude;

          setLatitude(
            nextLatitude,
          );

          setLongitude(
            nextLongitude,
          );

          setLocationStatus(
            "precise",
          );

          void loadNearbyShops(
            nextLatitude,
            nextLongitude,
          );
        },

        (positionError) => {
          setLocationStatus(
            positionError.code ===
              positionError.PERMISSION_DENIED
              ? "denied"
              : "unavailable",
          );

          void loadNearbyShops();
        },

        {
          enableHighAccuracy:
            false,

          timeout: 10000,

          maximumAge:
            300000,
        },
      );
  }

  return (
    <div className="nearby-service-overlay">
      <section
        className="nearby-service-panel"
        role="dialog"
        aria-modal="true"
        aria-labelledby="nearby-service-title"
      >
        <header className="nearby-service-panel__header">
          <div>
            <span>
              NEARBY SERVICE
            </span>

            <h2 id="nearby-service-title">
              {serviceName}
            </h2>

            <small>
              Registered GYAN shops are
              shown first.
            </small>
          </div>

          <button
            type="button"
            onClick={onClose}
            aria-label="Close nearby services"
          >
            ×
          </button>
        </header>

        <div className="nearby-service-panel__content">
          <section className="nearby-service-panel__location">
            <div>
              <strong>
                Find services near you
              </strong>

              <small>
                Precise location is used
                only after you allow it.
              </small>
            </div>

            <button
              type="button"
              disabled={
                locationStatus ===
                "requesting"
              }
              onClick={
                requestPreciseLocation
              }
            >
              {locationStatus ===
              "requesting"
                ? "Getting location…"
                : "Use my location"}
            </button>
          </section>

          {(
            locationStatus ===
              "denied" ||
            locationStatus ===
              "unavailable"
          ) && (
            <p className="nearby-service-panel__notice">
              Location was not available.
              Enter your city or state
              below to continue.
            </p>
          )}

          <div className="nearby-service-panel__manual-location">
            <label>
              <span>
                State or region
              </span>

              <input
                value={stateRegion}
                placeholder="State or region"
                onChange={(event) =>
                  setStateRegion(
                    event.target.value,
                  )
                }
              />
            </label>

            <label>
              <span>
                City
              </span>

              <input
                value={city}
                placeholder="City or town"
                onChange={(event) =>
                  setCity(
                    event.target.value,
                  )
                }
              />
            </label>

            <button
              type="button"
              disabled={loading}
              onClick={() =>
                void loadNearbyShops()
              }
            >
              {loading
                ? "Searching…"
                : "Search registered shops"}
            </button>
          </div>

          {locationDescription && (
            <p className="nearby-service-panel__location-summary">
              Searching near{" "}
              <strong>
                {locationDescription}
              </strong>
            </p>
          )}

          {error && (
            <p
              className="nearby-service-panel__error"
              role="alert"
            >
              {error}
            </p>
          )}

          {!loading &&
            shops.length === 0 && (
              <div className="nearby-service-panel__empty">
                <span
                  aria-hidden="true"
                >
                  📍
                </span>

                <strong>
                  No registered shops shown yet
                </strong>

                <p>
                  Share your location or
                  enter a city to search.
                  External map results can
                  be added in the next
                  phase.
                </p>
              </div>
            )}

          {shops.length > 0 && (
            <div className="nearby-service-panel__shops">
              <h3>
                Registered GYAN shops
              </h3>

              {shops.map(
                (shop) => (
                  <article
                    key={shop.code}
                    className="nearby-service-panel__shop"
                  >
                    <div>
                      <strong>
                        {shop.name}
                      </strong>

                      <small>
                        {shop.address}
                      </small>

                      {shop.distanceKm !=
                        null && (
                        <small>
                          {shop.distanceKm.toFixed(
                            1,
                          )}
                          {" km away"}
                        </small>
                      )}

                      {shop.serviceNames
                        .length > 0 && (
                        <small>
                          {shop.serviceNames
                            .slice(0, 4)
                            .join(" • ")}
                        </small>
                      )}
                    </div>

                    <button
                      type="button"
                      onClick={() =>
                        onOpenShop(
                          shop.code,
                        )
                      }
                    >
                      Open shop
                    </button>
                  </article>
                ),
              )}
            </div>
          )}
        </div>

        <footer className="nearby-service-panel__footer">
          <button
            type="button"
            onClick={onClose}
          >
            Close
          </button>
        </footer>
      </section>
    </div>
  );
}
