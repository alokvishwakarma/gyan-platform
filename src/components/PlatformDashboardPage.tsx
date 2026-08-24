import "./PlatformDashboardPage.css";

interface PlatformDashboardPageProps {
  onBack: () => void;
  onAddShop: () => void;
  onOpenShops: () => void;
  onOpenServices: () => void;
  onOpenStorage: () => void;
  onOpenStudents?: () => void;
  onOpenRequests?: () => void;
  onOpenAnalytics?: () => void;
  onChangeLocation: () => void;
}

interface AdminTile {
  icon: string;
  title: string;
  description: string;
  onClick?: () => void;
}

export default function PlatformDashboardPage({
  onBack,
  onAddShop,
  onOpenShops,
  onOpenServices,
  onOpenStorage,
  onOpenStudents,
  onOpenRequests,
  onOpenAnalytics,
  onChangeLocation,
}: PlatformDashboardPageProps) {
  const tiles: AdminTile[] = [
    {
      icon: "🎓",
      title: "Students",
      description:
        "Search, review and manage GYAN learners",
      onClick:
        onOpenStudents,
    },
    {
      icon: "📨",
      title: "Requests",
      description:
        "View and update service requests",
      onClick:
        onOpenRequests,
    },
    {
      icon: "🏬",
      title: "Shops",
      description:
        "Registered GYAN shops",
      onClick:
        onOpenShops,
    },
    {
      icon: "🧩",
      title: "Services",
      description:
        "Catalog, forms and templates",
      onClick:
        onOpenServices,
    },
    {
      icon: "☁️",
      title: "Storage",
      description:
        "Files, usage and retention",
      onClick:
        onOpenStorage,
    },
    {
      icon: "📊",
      title: "Analytics",
      description:
        "Platform activity and visitors",
      onClick:
        onOpenAnalytics,
    },
    {
      icon: "📍",
      title: "Location",
      description:
        "Change admin working location",
      onClick:
        onChangeLocation,
    },
    {
      icon: "➕",
      title: "Add shop",
      description:
        "Register a new shop",
      onClick:
        onAddShop,
    },
    {
      icon: "⚙️",
      title: "Settings",
      description:
        "Platform settings",
    },
  ];

  return (
    <main
      className="platform-dashboard"
    >
      <header
        className="platform-dashboard__header"
      >
        <button
          type="button"
          className="platform-dashboard__brand"
          onClick={onBack}
          aria-label="Return to GYAN"
          title="Return to GYAN"
        >
          <span
            className="platform-dashboard__brand-icon"
            aria-hidden="true"
          >
            📖
          </span>

          <span
            className="platform-dashboard__brand-copy"
          >
            <strong>
              GYAN
            </strong>

            <small>
              Your Digital Seva Partner
            </small>
          </span>
        </button>

        <button
          type="button"
          className="platform-dashboard__home"
          onClick={onBack}
        >
          Home
        </button>
      </header>

      <section
        className="platform-dashboard__content"
      >
        <div
          className="platform-dashboard__heading"
        >
          <span>
            Platform administration
          </span>

          <h1>
            Admin
          </h1>
        </div>

        <div
          className="platform-dashboard__grid"
        >
          {tiles.map(
            (tile) => {
              const available =
                Boolean(
                  tile.onClick,
                );

              return (
                <button
                  type="button"
                  key={
                    tile.title
                  }
                  className={
                    available
                      ? "platform-dashboard__tile"
                      : "platform-dashboard__tile platform-dashboard__tile--disabled"
                  }
                  disabled={
                    !available
                  }
                  onClick={
                    tile.onClick
                  }
                >
                  <span
                    className="platform-dashboard__tile-icon"
                    aria-hidden="true"
                  >
                    {
                      tile.icon
                    }
                  </span>

                  <span
                    className="platform-dashboard__tile-copy"
                  >
                    <strong>
                      {
                        tile.title
                      }
                    </strong>

                    <small>
                      {
                        tile.description
                      }
                    </small>
                  </span>

                  {available ? (
                    <span
                      className="platform-dashboard__tile-arrow"
                      aria-hidden="true"
                    >
                      ›
                    </span>
                  ) : (
                    <span
                      className="platform-dashboard__soon"
                    >
                      Soon
                    </span>
                  )}
                </button>
              );
            },
          )}
        </div>

        <button
          type="button"
          className="platform-dashboard__featured"
          onClick={
            onAddShop
          }
        >
          <span
            aria-hidden="true"
          >
            ➕
          </span>

          <span>
            <strong>
              Add a new shop
            </strong>

            <small>
              Create a partner
              profile and GYAN
              shop code
            </small>
          </span>

          <span
            aria-hidden="true"
          >
            ›
          </span>
        </button>
      </section>
    </main>
  );
}
