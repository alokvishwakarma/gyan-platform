import {
  useEffect,
  useMemo,
  useState,
} from "react";

import GyanAboutPanel from "./GyanAboutPanel";

import "./PublicHomePage.css";

interface PublicService {
  code: string;
  name: string;
  catalogName: string;
  description: string;
  icon: string;
  enabled: boolean;
  sortOrder: number;
  homepageOrder?: number | null;
  category?: string;
  subCategory?: string | null;
  workflowType?: string;
}

interface PublicHomePageProps {
  services: PublicService[];
  loading: boolean;
  onOpenShop: (shopCode: string) => void;
  onClaimShop: () => void;
  onOpenAdmin: () => void;
  onStartOnlineService?: (
    serviceCode: string,
    serviceName: string,
  ) => void;
  onOpenOnlineServices?: () => void;
  onOpenNearbyService?: (
    serviceCode: string,
    serviceName: string,
  ) => void;
}


function useResponsiveTileCount(
  maximumTileCount = 6,
): number {
  const [tileCount, setTileCount] =
    useState(5);

  useEffect(() => {
    const updateTileCount = (): void => {
      const viewportWidth =
        window.innerWidth;

      if (viewportWidth < 350) {
        setTileCount(
          Math.min(
            4,
            maximumTileCount,
          ),
        );
        return;
      }

      if (viewportWidth < 600) {
        setTileCount(
          Math.min(
            5,
            maximumTileCount,
          ),
        );
        return;
      }

      setTileCount(
        Math.min(
          6,
          maximumTileCount,
        ),
      );
    };

    updateTileCount();

    window.addEventListener(
      "resize",
      updateTileCount,
    );

    return () => {
      window.removeEventListener(
        "resize",
        updateTileCount,
      );
    };
  }, [maximumTileCount]);

  return tileCount;
}

function isOnlineService(
  service: PublicService,
): boolean {
  const category =
    service.category?.trim().toLowerCase() ?? "";

  const subCategory =
    service.subCategory?.trim().toLowerCase() ?? "";

  const workflowType =
    service.workflowType?.trim().toLowerCase() ?? "";

  return (
    category === "digital" ||
    category === "online" ||
    subCategory === "digital" ||
    subCategory === "online" ||
    workflowType === "online" ||
    workflowType === "remote"
  );
}

export default function PublicHomePage({
  services,
  loading,
  onClaimShop,
  onOpenAdmin,
  onStartOnlineService,
  onOpenOnlineServices,
  onOpenNearbyService,
}: PublicHomePageProps) {
  const [
    gyanAboutOpen,
    setGyanAboutOpen,
  ] = useState(false);

  const onlineTileCount =
    useResponsiveTileCount();

  const nearbyTileCount =
    onlineTileCount;

  const enabledServices = useMemo(
    () =>
      [...services]
        .filter((service) => service.enabled)
        .sort(
          (first, second) =>
            first.sortOrder - second.sortOrder ||
            first.name.localeCompare(second.name),
        ),
    [services],
  );

  const onlineServices = useMemo(
    () =>
      enabledServices
        .filter(isOnlineService)
        .filter(
          (service) =>
            service.homepageOrder != null,
        )
        .sort(
          (first, second) =>
            (first.homepageOrder ??
              first.sortOrder) -
              (second.homepageOrder ??
                second.sortOrder) ||
            first.name.localeCompare(second.name),
        ),
    [enabledServices],
  );

  const popularOnlineServices = useMemo(
    () =>
      onlineServices.slice(
        0,
        Math.max(
          1,
          onlineTileCount - 1,
        ),
      ),
    [
      onlineServices,
      onlineTileCount,
    ],
  );

  const nearbyServices = useMemo(
    () =>
      enabledServices
        .filter(
          (service) =>
            service.category
              ?.trim()
              .toLowerCase() === "nearby",
        )
        .filter(
          (service) =>
            service.homepageOrder != null,
        )
        .sort(
          (first, second) =>
            (first.homepageOrder ??
              first.sortOrder) -
              (second.homepageOrder ??
                second.sortOrder) ||
            first.name.localeCompare(second.name),
        ),
    [enabledServices],
  );

  const mapsService = useMemo(
    () =>
      nearbyServices.find(
        (service) =>
          service.code ===
            "NEARBY_MAPS" ||
          (
            service.catalogName ||
            service.name
          )
            .trim()
            .toLowerCase() ===
            "maps",
      ) ?? null,
    [nearbyServices],
  );

  const visibleNearbyServices = useMemo(
    () => {
      const regularServices =
        nearbyServices.filter(
          (service) =>
            service.code !==
              mapsService?.code,
        );

      const totalSlots =
        nearbyTileCount * 2;

      const regularServiceSlots =
        mapsService
          ? totalSlots - 1
          : totalSlots;

      return regularServices.slice(
        0,
        Math.max(
          1,
          regularServiceSlots,
        ),
      );
    },
    [
      mapsService,
      nearbyServices,
      nearbyTileCount,
    ],
  );


  return (
    <div className="public-home">
      <header className="public-home__header">
        <button
          type="button"
          className="public-home__brand public-home__brand-button"
          onClick={() =>
            setGyanAboutOpen(true)
          }
          aria-label="About GYAN"
          title="About GYAN"
        >
          <span
            className="public-home__brand-icon"
            aria-hidden="true"
          >
            📖
          </span>

          <div className="public-home__brand-text">
            <strong>GYAN</strong>

            <span className="public-home__tagline">
              Your Digital Seva Partner
            </span>

            <span className="public-home__value">
              Order Online • Pick Up When Ready • No Waiting
            </span>
          </div>
        </button>

        <button
          type="button"
          className="public-home__admin-button"
          onClick={onClaimShop}
          aria-label="Register with GYAN"
          title="Register with GYAN"
        >
          Register
        </button>
      </header>

      <main className="public-home__content">
        <section className="public-home__section public-home__section--online">
          <div className="public-home__section-heading">
            <div>
              <span>Available from anywhere</span>
              <h2>Online services request</h2>
            </div>
          </div>

          {loading ? (
            <div className="public-home__state">
              Loading online services…
            </div>
          ) : onlineServices.length > 0 ? (
            <div
              className="public-home__task-grid public-home__task-grid--online public-home__task-grid--responsive"
              style={{
                gridTemplateColumns:
                  `repeat(${onlineTileCount}, minmax(0, 1fr))`,
              }}
            >
              {popularOnlineServices.map((service) => (
                <button
                  type="button"
                  key={service.code}
                  className="public-home__task-card"
                  onClick={() =>
                    onStartOnlineService?.(
                      service.code,
                      service.catalogName ||
                        service.name,
                    )
                  }
                >
                  <span
                    className="public-home__task-icon"
                    aria-hidden="true"
                  >
                    {service.icon || "💻"}
                  </span>

                  <strong>
                    {service.catalogName ||
                      service.name}
                  </strong>
                </button>
              ))}

              <button
                type="button"
                className="public-home__task-card public-home__task-card--other"
                onClick={onOpenOnlineServices}
                disabled={!onOpenOnlineServices}
              >
                <span
                  className="public-home__task-icon"
                  aria-hidden="true"
                >
                  ⋯
                </span>

                <strong>Other</strong>
              </button>
            </div>
          ) : (
            <div className="public-home__state">
              No online services are currently available.
            </div>
          )}
        </section>

        <section className="public-home__section">
          <div className="public-home__section-heading">
            <div>
              <span>Visit a participating shop</span>
              <h2>Nearby services request</h2>
            </div>
          </div>

          {loading ? (
            <div className="public-home__state">
              Loading local services…
            </div>
          ) : nearbyServices.length > 0 ? (
            <div
              className="public-home__task-grid public-home__task-grid--nearby public-home__task-grid--responsive"
              style={{
                gridTemplateColumns:
                  `repeat(${nearbyTileCount}, minmax(0, 1fr))`,
              }}
            >
              {visibleNearbyServices.map(
                (service) => (
                  <button
                    type="button"
                    key={service.code}
                    className="public-home__task-card"
                    onClick={() =>
                      onOpenNearbyService?.(
                        service.code,
                        service.catalogName ||
                          service.name,
                      )
                    }
                    disabled={
                      !onOpenNearbyService
                    }
                  >
                    <span
                      className="public-home__task-icon"
                      aria-hidden="true"
                    >
                      {service.icon || "📍"}
                    </span>

                    <strong>
                      {service.catalogName ||
                        service.name}
                    </strong>
                  </button>
                ),
              )}

              {mapsService && (
                <button
                  type="button"
                  className="public-home__task-card public-home__task-card--maps"
                  onClick={() =>
                    onOpenNearbyService?.(
                      mapsService.code,
                      mapsService.catalogName ||
                        mapsService.name,
                    )
                  }
                  disabled={
                    !onOpenNearbyService
                  }
                >
                  <span
                    className="public-home__task-icon"
                    aria-hidden="true"
                  >
                    {mapsService.icon || "🗺️"}
                  </span>

                  <strong>
                    {mapsService.catalogName ||
                      mapsService.name}
                  </strong>
                </button>
              )}
            </div>
          ) : (
            <div className="public-home__state">
              No nearby services are currently available.
            </div>
          )}
        </section>

      </main>


      {gyanAboutOpen && (
        <GyanAboutPanel
          onClose={() =>
            setGyanAboutOpen(false)
          }
          onOpenAdmin={() => {
            setGyanAboutOpen(false);
            onOpenAdmin();
          }}
        />
      )}
    </div>
  );
}