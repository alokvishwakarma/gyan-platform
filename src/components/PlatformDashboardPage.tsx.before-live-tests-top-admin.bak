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
  onOpenNearbySearches?: () => void;
  onChangeLocation: () => void;
  onOpenEducation: () => void;
}


interface AdminTile {
  icon: string;
  title: string;
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
  onOpenNearbySearches,
  onChangeLocation,
  onOpenEducation,
}: PlatformDashboardPageProps) {
  const tiles: AdminTile[] = [
    {
      icon:
        "🎓",

      title:
        "Students",

      onClick:
        onOpenStudents,
    },

    {
      icon:
        "📨",

      title:
        "Requests",

      onClick:
        onOpenRequests,
    },

    {
      icon:
        "🏬",

      title:
        "Shops",

      onClick:
        onOpenShops,
    },

    {
      icon:
        "🧩",

      title:
        "Services",

      onClick:
        onOpenServices,
    },

    {
      icon:
        "☁️",

      title:
        "Storage",

      onClick:
        onOpenStorage,
    },

    {
      icon:
        "📊",

      title:
        "Analytics",

      onClick:
        onOpenAnalytics,
    },

    {
      icon:
        "🔎",

      title:
        "Searches",

      onClick:
        onOpenNearbySearches,
    },

    {
      icon:
        "📍",

      title:
        "Location",

      onClick:
        onChangeLocation,
    },

    {
      icon:
        "🎓",

      title:
        "Education",

      onClick:
        onOpenEducation,
    },

    {
      icon:
        "➕",

      title:
        "Add shop",

      onClick:
        onAddShop,
    },

    {
      icon:
        "⚙️",

      title:
        "Settings",
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
          onClick={
            onBack
          }
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
          onClick={
            onBack
          }
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
          {
            tiles.map(
              (
                tile,
              ) => {
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

                    <strong
                      className="platform-dashboard__tile-title"
                    >
                      {
                        tile.title
                      }
                    </strong>

                    {!available && (
                      <span
                        className="platform-dashboard__soon"
                      >
                        Soon
                      </span>
                    )}
                  </button>
                );
              },
            )
          }
        </div>
      </section>
    </main>
  );
}
