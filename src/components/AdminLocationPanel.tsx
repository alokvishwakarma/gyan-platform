import {
  useState,
} from "react";

import {
  clearAdminLocationOverride,
  getAdminLocationOverride,
  setAdminLocationOverride,
  type GyanLocationOverride,
} from "../location/adminLocation";

import "./AdminLocationPanel.css";

interface AdminLocationPanelProps {
  onClose: () => void;
}

interface ResolveResponse {
  location?:
    GyanLocationOverride;

  error?: string;
}

interface QuickLocation {
  label: string;
  latitude: number;
  longitude: number;
}

const ADMIN_QUICK_LOCATIONS:
  QuickLocation[] = [
  // United States
  { label: "Riverside, CA, US", latitude: 33.9533, longitude: -117.3962 },
  { label: "Los Angeles, CA, US", latitude: 34.0522, longitude: -118.2437 },
  { label: "San Francisco, CA, US", latitude: 37.7749, longitude: -122.4194 },
  { label: "San Diego, CA, US", latitude: 32.7157, longitude: -117.1611 },
  { label: "New York, NY, US", latitude: 40.7128, longitude: -74.0060 },
  { label: "Chicago, IL, US", latitude: 41.8781, longitude: -87.6298 },
  { label: "Houston, TX, US", latitude: 29.7604, longitude: -95.3698 },
  { label: "Dallas, TX, US", latitude: 32.7767, longitude: -96.7970 },
  { label: "Austin, TX, US", latitude: 30.2672, longitude: -97.7431 },
  { label: "Phoenix, AZ, US", latitude: 33.4484, longitude: -112.0740 },
  { label: "Seattle, WA, US", latitude: 47.6062, longitude: -122.3321 },
  { label: "Portland, OR, US", latitude: 45.5152, longitude: -122.6784 },
  { label: "Denver, CO, US", latitude: 39.7392, longitude: -104.9903 },
  { label: "Atlanta, GA, US", latitude: 33.7490, longitude: -84.3880 },
  { label: "Miami, FL, US", latitude: 25.7617, longitude: -80.1918 },
  { label: "Boston, MA, US", latitude: 42.3601, longitude: -71.0589 },
  { label: "Washington, DC, US", latitude: 38.9072, longitude: -77.0369 },

  // India
  { label: "New Delhi, DL, India", latitude: 28.6139, longitude: 77.2090 },
  { label: "Mumbai, MH, India", latitude: 19.0760, longitude: 72.8777 },
  { label: "Bengaluru, KA, India", latitude: 12.9716, longitude: 77.5946 },
  { label: "Hyderabad, TS, India", latitude: 17.3850, longitude: 78.4867 },
  { label: "Chennai, TN, India", latitude: 13.0827, longitude: 80.2707 },
  { label: "Kolkata, WB, India", latitude: 22.5726, longitude: 88.3639 },
  { label: "Pune, MH, India", latitude: 18.5204, longitude: 73.8567 },
  { label: "Ahmedabad, GJ, India", latitude: 23.0225, longitude: 72.5714 },
  { label: "Jaipur, RJ, India", latitude: 26.9124, longitude: 75.7873 },
  { label: "Lucknow, UP, India", latitude: 26.8467, longitude: 80.9462 },
  { label: "Kanpur, UP, India", latitude: 26.4499, longitude: 80.3319 },
  { label: "Varanasi, UP, India", latitude: 25.3176, longitude: 82.9739 },
  { label: "Patna, BR, India", latitude: 25.5941, longitude: 85.1376 },
  { label: "Bhopal, MP, India", latitude: 23.2599, longitude: 77.4126 },
  { label: "Indore, MP, India", latitude: 22.7196, longitude: 75.8577 },
  { label: "Chandigarh, CH, India", latitude: 30.7333, longitude: 76.7794 },
  { label: "Kochi, KL, India", latitude: 9.9312, longitude: 76.2673 },
  { label: "Mysuru, KA, India", latitude: 12.2958, longitude: 76.6394 },
];

export default function AdminLocationPanel({
  onClose,
}: AdminLocationPanelProps) {
  const current =
    getAdminLocationOverride();

  const [
    latitude,
    setLatitude,
  ] =
    useState(
      current
        ? String(
            current.latitude,
          )
        : "",
    );

  const [
    longitude,
    setLongitude,
  ] =
    useState(
      current
        ? String(
            current.longitude,
          )
        : "",
    );

  const [
    label,
    setLabel,
  ] =
    useState(
      current?.label ?? "",
    );

  const [
    city,
    setCity,
  ] =
    useState(
      current?.city ?? "",
    );

  const [
    region,
    setRegion,
  ] =
    useState(
      current?.region ?? "",
    );

  const [
    countryCode,
    setCountryCode,
  ] =
    useState(
      current?.countryCode ??
        "",
    );

  const [
    phoneCountryCode,
    setPhoneCountryCode,
  ] =
    useState(
      current?.phoneCountryCode ??
        "",
    );

  const [
    postalCode,
    setPostalCode,
  ] =
    useState(
      current?.postalCode ??
        "",
    );

  const [
    error,
    setError,
  ] =
    useState("");

  const [
    locating,
    setLocating,
  ] =
    useState(false);

  const [
    resolving,
    setResolving,
  ] =
    useState(false);


  const [
    placeSearch,
    setPlaceSearch,
  ] =
    useState("");

  function applyResolvedLocation(
    location:
      GyanLocationOverride,
  ): void {
    setLatitude(
      String(
        location.latitude,
      ),
    );

    setLongitude(
      String(
        location.longitude,
      ),
    );

    setLabel(
      location.label ?? "",
    );

    setCity(
      location.city ?? "",
    );

    setRegion(
      location.region ?? "",
    );

    setCountryCode(
      location.countryCode ??
        "",
    );

    setPhoneCountryCode(
      location.phoneCountryCode ??
        "",
    );

    setPostalCode(
      location.postalCode ??
        "",
    );
  }

  async function resolveLocation(
    coordinates?: {
      latitude: number;
      longitude: number;
    },
  ): Promise<
    GyanLocationOverride | null
  > {
    setResolving(
      true,
    );

    setError("");

    try {
      const parameters =
        new URLSearchParams();

      if (
        coordinates
      ) {
        parameters.set(
          "lat",
          String(
            coordinates.latitude,
          ),
        );

        parameters.set(
          "lng",
          String(
            coordinates.longitude,
          ),
        );
      } else {
        const latText =
          latitude.trim();

        const lngText =
          longitude.trim();

        if (
          Boolean(
            latText,
          ) !==
          Boolean(
            lngText,
          )
        ) {
          throw new Error(
            "Enter both latitude and longitude.",
          );
        }

        if (
          latText &&
          lngText
        ) {
          parameters.set(
            "lat",
            latText,
          );

          parameters.set(
            "lng",
            lngText,
          );
        } else {
          if (
            !city.trim() ||
            !region.trim()
          ) {
            throw new Error(
              "Enter coordinates or a city and state / region.",
            );
          }

          parameters.set(
            "city",
            city.trim(),
          );

          parameters.set(
            "region",
            region.trim(),
          );

          if (
            countryCode.trim()
          ) {
            parameters.set(
              "country",
              countryCode.trim(),
            );
          }
        }
      }

      const response =
        await fetch(
          `/api/location/resolve?${parameters.toString()}`,
          {
            credentials:
              "include",
          },
        );

      const result =
        (await response.json()) as
          ResolveResponse;

      if (
        !response.ok ||
        !result.location
      ) {
        throw new Error(
          result.error ??
            "Location could not be found.",
        );
      }

      applyResolvedLocation(
        result.location,
      );

      return result.location;
    } catch (
      caughtError
    ) {
      setError(
        caughtError instanceof Error
          ? caughtError.message
          : "Location could not be found.",
      );

      return null;
    } finally {
      setResolving(
        false,
      );
    }
  }

  async function findLocation():
    Promise<void> {
    await resolveLocation();
  }

  function chooseQuickLocation(
    value: string,
  ): void {
    if (!value) {
      return;
    }

    const index =
      Number(value);

    const selected =
      ADMIN_QUICK_LOCATIONS[
        index
      ];

    if (!selected) {
      return;
    }

    setLatitude(
      String(
        selected.latitude,
      ),
    );

    setLongitude(
      String(
        selected.longitude,
      ),
    );

    setPlaceSearch(
      selected.label,
    );

    void resolveLocation({
      latitude:
        selected.latitude,

      longitude:
        selected.longitude,
    });
  }

  async function searchPlace():
    Promise<void> {
    const search =
      placeSearch.trim();

    if (!search) {
      setError(
        "Enter a city, state or place to search.",
      );

      return;
    }

    /*
     * Let the existing resolver perform forward
     * geocoding. A comma-separated value such as
     * "Lucknow, Uttar Pradesh" is split into the
     * city and region fields.
     */
    const parts =
      search
        .split(",")
        .map(
          (part) =>
            part.trim(),
        )
        .filter(Boolean);

    if (
      parts.length < 2
    ) {
      setError(
        "Enter city and state, for example Lucknow, Uttar Pradesh.",
      );

      return;
    }

    setLatitude("");
    setLongitude("");

    setCity(
      parts[0],
    );

    setRegion(
      parts[1],
    );

    if (
      parts[2]
    ) {
      const country =
        parts[2]
          .toUpperCase();

      if (
        country === "INDIA" ||
        country === "IN"
      ) {
        setCountryCode(
          "IN",
        );
      } else if (
        country === "US" ||
        country === "USA" ||
        country ===
          "UNITED STATES"
      ) {
        setCountryCode(
          "US",
        );
      }
    }

    /*
     * State setters are asynchronous, so query
     * the resolver directly from the parsed text.
     */
    setResolving(true);
    setError("");

    try {
      const parameters =
        new URLSearchParams();

      parameters.set(
        "city",
        parts[0],
      );

      parameters.set(
        "region",
        parts[1],
      );

      if (
        parts[2]
      ) {
        parameters.set(
          "country",
          parts[2],
        );
      }

      const response =
        await fetch(
          `/api/location/resolve?${parameters.toString()}`,
          {
            credentials:
              "include",
          },
        );

      const result =
        (await response.json()) as
          ResolveResponse;

      if (
        !response.ok ||
        !result.location
      ) {
        throw new Error(
          result.error ??
            "Location could not be found.",
        );
      }

      applyResolvedLocation(
        result.location,
      );
    } catch (
      caughtError
    ) {
      setError(
        caughtError instanceof Error
          ? caughtError.message
          : "Location could not be found.",
      );
    } finally {
      setResolving(false);
    }
  }


  function useRealLocation():
    void {
    if (
      !navigator.geolocation
    ) {
      setError(
        "Location is not available in this browser.",
      );

      return;
    }

    setLocating(
      true,
    );

    setError("");

    navigator.geolocation
      .getCurrentPosition(
        (
          position,
        ) => {
          void (
            async () => {
              try {
                await resolveLocation({
                  latitude:
                    position
                      .coords
                      .latitude,

                  longitude:
                    position
                      .coords
                      .longitude,
                });
              } finally {
                setLocating(
                  false,
                );
              }
            }
          )();
        },

        () => {
          setLocating(
            false,
          );

          setError(
            "Current location could not be read.",
          );
        },

        {
          enableHighAccuracy:
            false,

          timeout:
            10000,

          maximumAge:
            300000,
        },
      );
  }

  async function save():
    Promise<void> {
    setError("");

    let nextLatitude =
      Number(
        latitude,
      );

    let nextLongitude =
      Number(
        longitude,
      );

    if (
      !latitude.trim() ||
      !longitude.trim() ||
      !Number.isFinite(
        nextLatitude,
      ) ||
      !Number.isFinite(
        nextLongitude,
      )
    ) {
      const resolved =
        await resolveLocation();

      if (
        !resolved
      ) {
        return;
      }

      nextLatitude =
        resolved.latitude;

      nextLongitude =
        resolved.longitude;
    }

    if (
      nextLatitude < -90 ||
      nextLatitude > 90
    ) {
      setError(
        "Enter a latitude from -90 to 90.",
      );

      return;
    }

    if (
      nextLongitude < -180 ||
      nextLongitude > 180
    ) {
      setError(
        "Enter a longitude from -180 to 180.",
      );

      return;
    }

    const effectiveLabel =
      label.trim() ||
      [
        city.trim(),
        region.trim(),
        countryCode
          .trim()
          .toUpperCase(),
      ]
        .filter(Boolean)
        .join(", ") ||
      `${nextLatitude.toFixed(
        4,
      )}, ${nextLongitude.toFixed(
        4,
      )}`;

    setAdminLocationOverride({
      latitude:
        nextLatitude,

      longitude:
        nextLongitude,

      label:
        effectiveLabel,

      city:
        city.trim() ||
        undefined,

      region:
        region.trim() ||
        undefined,

      countryCode:
        countryCode
          .trim()
          .toUpperCase() ||
        undefined,

      phoneCountryCode:
        phoneCountryCode
          .trim() ||
        undefined,

      postalCode:
        postalCode.trim() ||
        undefined,
    });

    onClose();
  }

  function reset():
    void {
    clearAdminLocationOverride();

    onClose();
  }

  return (
    <div
      className="admin-location-overlay"
      onClick={onClose}
    >
      <section
        className="admin-location-panel"
        role="dialog"
        aria-modal="true"
        aria-label="Change admin location"
        onClick={(
          event,
        ) =>
          event.stopPropagation()
        }
      >
        <header>
          <div>
            <small>
              Admin session
            </small>

            <h2>
              Change location
            </h2>
          </div>

          <div className="admin-location-panel__header-actions">
            <button
              type="button"
              className="admin-location-panel__header-save"
              disabled={
                resolving ||
                locating
              }
              onClick={() =>
                void save()
              }
              aria-label="Use this location"
              title="Use this Location"
            >
              ✓
            </button>

            <button
              type="button"
              onClick={onClose}
              aria-label="Close"
              title="Close"
            >
              ×
            </button>
          </div>
        </header>

        <div
          className="admin-location-panel__body"
        >
          <p>
            Enter coordinates or
            city and state. The
            selected location lasts
            until admin logout.
          </p>

          <label>
            Quick city

            <select
              className="admin-location-panel__select"
              defaultValue=""
              disabled={
                resolving ||
                locating
              }
              onChange={(
                event,
              ) =>
                chooseQuickLocation(
                  event.target.value,
                )
              }
            >
              <option value="">
                Select major city…
              </option>

              <optgroup
                label="United States"
              >
                {ADMIN_QUICK_LOCATIONS
                  .map(
                    (
                      location,
                      index,
                    ) => ({
                      location,
                      index,
                    }),
                  )
                  .filter(
                    ({
                      location,
                    }) =>
                      location.label.endsWith(
                        ", US",
                      ),
                  )
                  .map(
                    ({
                      location,
                      index,
                    }) => (
                      <option
                        key={
                          location.label
                        }
                        value={
                          index
                        }
                      >
                        {
                          location.label
                        }
                      </option>
                    ),
                  )}
              </optgroup>

              <optgroup
                label="India"
              >
                {ADMIN_QUICK_LOCATIONS
                  .map(
                    (
                      location,
                      index,
                    ) => ({
                      location,
                      index,
                    }),
                  )
                  .filter(
                    ({
                      location,
                    }) =>
                      location.label.endsWith(
                        ", India",
                      ),
                  )
                  .map(
                    ({
                      location,
                      index,
                    }) => (
                      <option
                        key={
                          location.label
                        }
                        value={
                          index
                        }
                      >
                        {
                          location.label
                        }
                      </option>
                    ),
                  )}
              </optgroup>
            </select>
          </label>

          <div
            className="admin-location-panel__search-row"
          >
            <input
              value={
                placeSearch
              }
              placeholder="City, State"
              aria-label="Search city and state"
              onChange={(
                event,
              ) =>
                setPlaceSearch(
                  event.target.value,
                )
              }
              onKeyDown={(
                event,
              ) => {
                if (
                  event.key ===
                  "Enter"
                ) {
                  event.preventDefault();

                  void searchPlace();
                }
              }}
            />

            <button
              type="button"
              disabled={
                resolving ||
                locating
              }
              onClick={() =>
                void searchPlace()
              }
            >
              Search
            </button>
          </div>

          <button
            type="button"
            className="admin-location-panel__current"
            disabled={
              locating ||
              resolving
            }
            onClick={
              useRealLocation
            }
          >
            {locating
              ? "Getting location…"
              : "📍 Use my real location"}
          </button>

          <div
            className="admin-location-panel__grid"
          >
            <label>
              Latitude

              <input
                value={
                  latitude
                }
                inputMode="decimal"
                placeholder="28.6139"
                onChange={(
                  event,
                ) =>
                  setLatitude(
                    event.target.value,
                  )
                }
              />
            </label>

            <label>
              Longitude

              <input
                value={
                  longitude
                }
                inputMode="decimal"
                placeholder="77.2090"
                onChange={(
                  event,
                ) =>
                  setLongitude(
                    event.target.value,
                  )
                }
              />
            </label>
          </div>

          <button
            type="button"
            className="admin-location-panel__find"
            disabled={
              resolving ||
              locating
            }
            onClick={() =>
              void findLocation()
            }
          >
            {resolving
              ? "Finding…"
              : "🔎 Find location"}
          </button>

          <label>
            Location label

            <input
              value={
                label
              }
              placeholder="New Delhi, Delhi, India"
              onChange={(
                event,
              ) =>
                setLabel(
                  event.target.value,
                )
              }
            />
          </label>

          <div
            className="admin-location-panel__grid"
          >
            <label>
              City

              <input
                value={
                  city
                }
                placeholder="New Delhi"
                onChange={(
                  event,
                ) =>
                  setCity(
                    event.target.value,
                  )
                }
              />
            </label>

            <label>
              State / region

              <input
                value={
                  region
                }
                placeholder="Delhi"
                onChange={(
                  event,
                ) =>
                  setRegion(
                    event.target.value,
                  )
                }
              />
            </label>
          </div>

          <div
            className="admin-location-panel__grid"
          >
            <label>
              Country code

              <input
                value={
                  countryCode
                }
                placeholder="IN"
                maxLength={2}
                onChange={(
                  event,
                ) =>
                  setCountryCode(
                    event.target.value,
                  )
                }
              />
            </label>

            <label>
              Phone code

              <input
                value={
                  phoneCountryCode
                }
                placeholder="+91"
                onChange={(
                  event,
                ) =>
                  setPhoneCountryCode(
                    event.target.value,
                  )
                }
              />
            </label>
          </div>

          <label>
            Postal code

            <input
              value={
                postalCode
              }
              placeholder="110001"
              onChange={(
                event,
              ) =>
                setPostalCode(
                  event.target.value,
                )
              }
            />
          </label>

          {error && (
            <p
              className="admin-location-panel__error"
              role="alert"
            >
              {error}
            </p>
          )}

          <div
            className="admin-location-panel__actions"
          >
            <button
              type="button"
              onClick={
                reset
              }
            >
              Use normal location
            </button>

            <button
              type="button"
              className="admin-location-panel__save"
              disabled={
                resolving ||
                locating
              }
              onClick={() =>
                void save()
              }
            >
              Use this location
            </button>
          </div>
        </div>
      </section>
    </div>
  );
}
