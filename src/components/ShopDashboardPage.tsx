import "./ShopDashboardPage.css";

interface ShopDashboardPageProps {
  shopCode: string;
  shopName: string;
  address: string;
  activeServiceCount: number;
  onBack: () => void;
  onManageServices: () => void;
  onOpenRequests: () => void;
  onOpenQr: () => void;
  onOpenInformation: () => void;
}

export default function ShopDashboardPage({
  shopCode,
  shopName,
  address,
  activeServiceCount,
  onBack,
  onManageServices,
  onOpenRequests,
  onOpenQr,
  onOpenInformation,
}: ShopDashboardPageProps) {
  const hasServices = activeServiceCount > 0;

  return (
    <main className="shop-dashboard">
      <header className="shop-dashboard__header">
        <button type="button" onClick={onBack}>
          ←
        </button>

        <div>
          <span>📖</span>
          <div>
            <strong>{shopName}</strong>
            <small>{shopCode}</small>
          </div>
        </div>
      </header>

      <section className="shop-dashboard__content">
        <div className="shop-dashboard__identity">
          <span>Shop management</span>
          <h1>Welcome back</h1>
          <p>{address}</p>
        </div>

        <section className="shop-dashboard__hero">
          <span aria-hidden="true">🧩</span>

          <div>
            <small>Featured action</small>
            <h2>
              {hasServices
                ? "Manage your service menu"
                : "Add your first service"}
            </h2>
            <p>
              Choose services, activate them, edit their
              forms, and decide what customers see first.
            </p>
          </div>

          <button
            type="button"
            onClick={onManageServices}
          >
            {hasServices
              ? "Manage services"
              : "Choose services"}
          </button>
        </section>

        <section className="shop-dashboard__summary">
          <article>
            <span>Active services</span>
            <strong>{activeServiceCount}</strong>
          </article>

          <article>
            <span>Open requests</span>
            <strong>—</strong>
          </article>

          <article>
            <span>Ready</span>
            <strong>—</strong>
          </article>
        </section>

        <div className="shop-dashboard__grid">
          <button type="button" onClick={onOpenRequests}>
            <span>📨</span>
            <strong>Customer requests</strong>
            <small>Review and process requests</small>
          </button>

          <button type="button" onClick={onManageServices}>
            <span>🧩</span>
            <strong>Services</strong>
            <small>Add, activate, and customize</small>
          </button>

          <button type="button" onClick={onOpenQr}>
            <span>▦</span>
            <strong>Shop QR</strong>
            <small>View or print your QR code</small>
          </button>

          <button
            type="button"
            onClick={onOpenInformation}
          >
            <span>🏪</span>
            <strong>Shop information</strong>
            <small>Edit name and address</small>
          </button>
        </div>
      </section>
    </main>
  );
}
