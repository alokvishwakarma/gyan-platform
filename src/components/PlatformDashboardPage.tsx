import "./PlatformDashboardPage.css";

interface PlatformDashboardPageProps {
  onBack: () => void;
  onAddShop: () => void;
  onOpenShops: () => void;
  onOpenServices: () => void;
  onOpenStorage: () => void;
}

export default function PlatformDashboardPage({
  onBack,
  onAddShop,
  onOpenShops,
  onOpenServices,
  onOpenStorage,
}: PlatformDashboardPageProps) {
  return (
    <main className="platform-dashboard">
      <header className="platform-dashboard__header">
        <button type="button" onClick={onBack}>
          ←
        </button>

        <div>
          <span>📖</span>
          <strong>GYAN Platform</strong>
        </div>
      </header>

      <section className="platform-dashboard__content">
        <div className="platform-dashboard__intro">
          <span>Platform administration</span>
          <h1>Build the GYAN network</h1>
          <p>
            Add shops and maintain the reusable global
            service catalog.
          </p>
        </div>

        <section className="platform-dashboard__hero">
          <span aria-hidden="true">🏪</span>

          <div>
            <small>Featured action</small>
            <h2>Add a new shop</h2>
            <p>
              Create a partner profile and generate its
              four-character GYAN shop code.
            </p>
          </div>

          <button type="button" onClick={onAddShop}>
            Add shop
          </button>
        </section>

        <div className="platform-dashboard__grid">
          <button type="button" onClick={onOpenShops}>
            <span>🏬</span>
            <strong>Shops</strong>
            <small>Manage registered shops</small>
          </button>

          <button type="button" onClick={onOpenServices}>
            <span>🧩</span>
            <strong>Global services</strong>
            <small>Edit templates and forms</small>
          </button>

          <button type="button" onClick={onOpenStorage}>
            <span>☁️</span>
            <strong>Storage</strong>
            <small>Review usage and limits</small>
          </button>

          <button type="button">
            <span>📨</span>
            <strong>Requests</strong>
            <small>Platform request overview</small>
          </button>
        </div>
      </section>
    </main>
  );
}
