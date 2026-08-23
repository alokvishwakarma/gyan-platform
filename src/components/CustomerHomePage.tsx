import {
  type CSSProperties,
  useMemo,
  useState,
} from "react";

import "./CustomerHomePage.css";

interface HomeService {
  id: number;
  code: string;
  category: string;
  name: string;
  catalogName: string;
  description: string;
  icon: string;
  color: string;
  enabled: boolean;
  sortOrder: number;

  homepageOrder?: number | null;
}

interface CustomerHomePageProps {
  shopCode?: string;
  shopName?: string;
  address?: string;
  services: HomeService[];
  loading: boolean;
  onServiceSelect: (
    service: HomeService,
  ) => void;
  onRegisterShop: () => void;
  onOpenShopQr: () => void;
  onOpenAdmin: () => void;
}

function getServiceTitle(
  service: HomeService,
): string {
  return service.catalogName || service.name;
}

function getActionLabel(
  service: HomeService,
): string {
  const code = service.code.toUpperCase();

  if (code === "PRINT") {
    return "Upload files";
  }

  if (code.includes("SCAN")) {
    return "Request scan";
  }

  if (code.includes("PRESCRIPTION")) {
    return "Upload prescription";
  }

  if (
    code.includes("VEGETABLE") ||
    code.includes("GROCERY")
  ) {
    return "View available items";
  }

  return `Request ${service.name}`;
}

function getServiceAccent(
  service: HomeService,
): CSSProperties {
  return {
    "--service-accent":
      service.color || "#2187f3",
  } as CSSProperties;
}

export default function CustomerHomePage({
  shopCode,
  shopName,
  address,
  services,
  loading,
  onServiceSelect,
  onOpenShopQr,
  onOpenAdmin,
}: CustomerHomePageProps) {
  const [showAllServices, setShowAllServices] =
    useState(false);

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

  const featuredServices =
    enabledServices.slice(0, 3);

  const otherServices =
    enabledServices.slice(3);

  const visibleOtherServices =
    showAllServices
      ? otherServices
      : otherServices.slice(0, 12);

  function scrollToSection(id: string) {
    document.getElementById(id)?.scrollIntoView({
      behavior: "smooth",
      block: "start",
    });
  }

  return (
    <div className="customer-home">
      <header className="customer-home__header">
        <button
          type="button"
          className="customer-home__brand"
          onClick={() =>
            window.scrollTo({
              top: 0,
              behavior: "smooth",
            })
          }
          aria-label="Go to home"
        >
          <span
            className="customer-home__logo"
            aria-hidden="true"
          >
            <span className="customer-home__book-mark">
              <i />
              <i />
            </span>
          </span>

          <span>
            <strong>GYAN</strong>
            <small>Your Digital Seva Partner</small>
            <small className="customer-home__value">
              Learn • Discover • Grow
            </small>
            {shopName && (
              <small className="customer-home__shop-line">
                {shopName}{address ? ` · ${address}` : ""}
              </small>
            )}
          </span>
        </button>

        <div className="customer-home__header-actions">
          <button
            type="button"
            className="customer-home__icon-button"
            onClick={onOpenShopQr}
            disabled={!shopCode}
            aria-label="Open shop QR code"
          >
            <span aria-hidden="true">⌁</span>
          </button>

          <button
            type="button"
            className="customer-home__icon-button"
            onClick={onOpenAdmin}
            aria-label="Open profile and administration"
          >
            <span aria-hidden="true">♙</span>
          </button>
        </div>
      </header>

      {loading && (
        <section className="customer-home__state-card">
          <strong>Loading services…</strong>
          <span>
            Please wait while the catalog is prepared.
          </span>
        </section>
      )}

      {!loading && featuredServices.length > 0 && (
        <section className="customer-home__featured-section">
          <div className="customer-home__section-heading">
            <h2>Featured at this shop</h2>
          </div>

          <div className="customer-home__featured-grid">
            {featuredServices.map((service) => (
              <button
                type="button"
                key={service.code}
                className="customer-home__featured-card"
                style={getServiceAccent(service)}
                onClick={() => onServiceSelect(service)}
              >
                <span
                  className="customer-home__featured-icon"
                  aria-hidden="true"
                >
                  {service.icon || "🧩"}
                </span>

                <span className="customer-home__featured-copy">
                  <strong>{getServiceTitle(service)}</strong>
                  <small>
                    {service.description ||
                      getActionLabel(service)}
                  </small>
                </span>

                <span
                  className="customer-home__featured-arrow"
                  aria-hidden="true"
                >
                  →
                </span>
              </button>
            ))}
          </div>
        </section>
      )}

      {!loading && featuredServices.length === 0 && (
        <section className="customer-home__state-card">
          <strong>No services available</strong>
          <span>This shop has not enabled services yet.</span>
        </section>
      )}

      <section
        id="popular-services"
        className="customer-home__section"
      >
        <div className="customer-home__section-heading">
          <h2>Other services</h2>

          {otherServices.length > 12 && (
            <button
              type="button"
              onClick={() =>
                setShowAllServices((current) => !current)
              }
            >
              {showAllServices ? "Show less" : "View all services"}
              <span aria-hidden="true">
                {showAllServices ? "⌃" : "›"}
              </span>
            </button>
          )}
        </div>

        {visibleOtherServices.length > 0 ? (
          <div className="customer-home__popular-grid">
            {visibleOtherServices.map((service) => (
              <button
                type="button"
                key={service.code}
                className="customer-home__popular-tile"
                onClick={() => onServiceSelect(service)}
              >
                <span
                  style={getServiceAccent(service)}
                  aria-hidden="true"
                >
                  {service.icon || "🧩"}
                </span>

                <strong>{service.name}</strong>
              </button>
            ))}
          </div>
        ) : (
          <div className="customer-home__empty-inline">
            Additional services will appear here as the
            shop enables them.
          </div>
        )}
      </section>

      <section
        id="current-requests"
        className="customer-home__section customer-home__requests"
      >
        <div className="customer-home__section-heading">
          <h2>Your Current Requests</h2>

          <button
            type="button"
            onClick={() =>
              scrollToSection("current-requests")
            }
          >
            View all
          </button>
        </div>

        <div className="customer-home__request-card">
          <span
            className="customer-home__request-icon"
            aria-hidden="true"
          >
            ✓
          </span>

          <div>
            <strong>No active request</strong>
            <p>
              New requests and their pickup status will
              appear here.
            </p>
          </div>

          {featuredServices[0] && (
            <button
              type="button"
              onClick={() =>
                onServiceSelect(featuredServices[0])
              }
            >
              Start
            </button>
          )}
        </div>
      </section>

      <nav
        className="customer-home__bottom-nav"
        aria-label="Main navigation"
      >
        <button
          type="button"
          className="is-active"
          onClick={() =>
            window.scrollTo({
              top: 0,
              behavior: "smooth",
            })
          }
        >
          <span aria-hidden="true">◆</span>
          Home
        </button>

        <button
          type="button"
          onClick={() =>
            scrollToSection("current-requests")
          }
        >
          <span aria-hidden="true">▤</span>
          Requests
        </button>

        <button
          type="button"
          onClick={() =>
            scrollToSection("popular-services")
          }
        >
          <span aria-hidden="true">▦</span>
          Services
        </button>

        <button type="button" onClick={onOpenAdmin}>
          <span aria-hidden="true">♙</span>
          Profile
        </button>
      </nav>
    </div>
  );
}