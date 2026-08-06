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
  onRegisterShop,
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

  const featuredService = enabledServices[0];
  const secondaryServices = enabledServices.slice(1);
  const quickServices = secondaryServices.slice(0, 4);

  const popularServices = showAllServices
    ? secondaryServices
    : secondaryServices.slice(4, 12);

  const servicesForPopularSection =
    popularServices.length > 0
      ? popularServices
      : quickServices;

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

      <section className="customer-home__shop-card">
        <span
          className="customer-home__location-icon"
          aria-hidden="true"
        >
          ●
        </span>

        <button
          type="button"
          className="customer-home__shop-identity"
          onClick={
            shopCode ? onOpenShopQr : onRegisterShop
          }
        >
          <strong>
            {shopName || "Choose your service provider"}
          </strong>

          <span>
            {address ||
              "Scan a shop QR code or register a shop"}
          </span>
        </button>

        <span className="customer-home__open-status">
          <span aria-hidden="true">●</span>
          Shop Open
        </span>
      </section>

      {loading && (
        <section className="customer-home__state-card">
          <strong>Loading services…</strong>
          <span>
            Please wait while the catalog is prepared.
          </span>
        </section>
      )}

      {!loading && featuredService && (
        <section
          className="customer-home__hero"
          style={getServiceAccent(featuredService)}
        >
          <span
            className="customer-home__hero-icon"
            aria-hidden="true"
          >
            {featuredService.icon || "🧩"}
          </span>

          <div className="customer-home__hero-copy">
            <span>Featured service</span>

            <h1>{getServiceTitle(featuredService)}</h1>

            <p>
              {featuredService.description ||
                "Send your request before visiting the shop."}
            </p>
          </div>

          <button
            type="button"
            className="customer-home__hero-button"
            onClick={() =>
              onServiceSelect(featuredService)
            }
            aria-label={getActionLabel(featuredService)}
          >
            →
          </button>
        </section>
      )}

      {!loading && !featuredService && (
        <section className="customer-home__state-card">
          <strong>No services available</strong>
          <span>
            Select a shop or enable services from
            administration.
          </span>
        </section>
      )}

      {quickServices.length > 0 && (
        <section
          className="customer-home__quick-grid"
          aria-label="Quick services"
        >
          {quickServices.map((service) => (
            <button
              type="button"
              key={service.code}
              className="customer-home__quick-tile"
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
        </section>
      )}

      <section
        id="popular-services"
        className="customer-home__section"
      >
        <div className="customer-home__section-heading">
          <h2>Popular Services</h2>

          {secondaryServices.length > 4 && (
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

        {servicesForPopularSection.length > 0 ? (
          <div className="customer-home__popular-grid">
            {servicesForPopularSection.map((service) => (
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

          {featuredService && (
            <button
              type="button"
              onClick={() =>
                onServiceSelect(featuredService)
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
