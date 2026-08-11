export interface GyanLocationOverride {
  latitude: number;
  longitude: number;

  label: string;

  city?: string;
  region?: string;

  countryCode?: string;
  phoneCountryCode?: string;

  postalCode?: string;
}

const STORAGE_KEY =
  "gyan_admin_location";

export const ADMIN_LOCATION_CHANGED_EVENT =
  "gyan-admin-location-changed";

export function getAdminLocationOverride():
  GyanLocationOverride | null {
  try {
    const raw =
      sessionStorage.getItem(
        STORAGE_KEY,
      );

    if (!raw) {
      return null;
    }

    const value =
      JSON.parse(
        raw,
      ) as
        Partial<GyanLocationOverride>;

    if (
      !Number.isFinite(
        value.latitude,
      ) ||
      !Number.isFinite(
        value.longitude,
      )
    ) {
      sessionStorage.removeItem(
        STORAGE_KEY,
      );

      return null;
    }

    return {
      latitude:
        Number(
          value.latitude,
        ),

      longitude:
        Number(
          value.longitude,
        ),

      label:
        String(
          value.label ?? "",
        ).trim(),

      city:
        value.city
          ? String(
              value.city,
            )
          : undefined,

      region:
        value.region
          ? String(
              value.region,
            )
          : undefined,

      countryCode:
        value.countryCode
          ? String(
              value.countryCode,
            )
              .trim()
              .toUpperCase()
          : undefined,

      phoneCountryCode:
        value.phoneCountryCode
          ? String(
              value.phoneCountryCode,
            ).trim()
          : undefined,

      postalCode:
        value.postalCode
          ? String(
              value.postalCode,
            ).trim()
          : undefined,
    };
  } catch {
    return null;
  }
}

export function setAdminLocationOverride(
  location:
    GyanLocationOverride,
): void {
  sessionStorage.setItem(
    STORAGE_KEY,
    JSON.stringify(
      location,
    ),
  );

  window.dispatchEvent(
    new CustomEvent(
      ADMIN_LOCATION_CHANGED_EVENT,
      {
        detail:
          location,
      },
    ),
  );
}

export function clearAdminLocationOverride():
  void {
  sessionStorage.removeItem(
    STORAGE_KEY,
  );

  window.dispatchEvent(
    new CustomEvent(
      ADMIN_LOCATION_CHANGED_EVENT,
      {
        detail:
          null,
      },
    ),
  );
}