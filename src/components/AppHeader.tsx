import "./AppHeader.css";

interface AppHeaderProps {
  hasExpandedCategories: boolean;
  shopCode?: string | null;
  onCollapseExpandedCategories: () => void;
  onRegisterShop: () => void;
}

export default function AppHeader({
  hasExpandedCategories,
  shopCode,
  onCollapseExpandedCategories,
  onRegisterShop,
}: AppHeaderProps) {
  return (
    <header className="app-header">
      <button
        type="button"
        className="app-header__action"
        onClick={onCollapseExpandedCategories}
        disabled={!hasExpandedCategories}
        aria-label="Collapse all expanded categories"
        title={
          hasExpandedCategories
            ? "Collapse expanded categories"
            : "Service categories"
        }
      >
        <span
          className="app-header__category-icon"
          aria-hidden="true"
        >
          ▦
        </span>
      </button>

      <div className="app-header__brand" aria-label="GYAN">
        <strong>GYAN</strong>
        <span>gyan.cc</span>
      </div>

      {shopCode ? (
        <div
          className="app-header__shop-code"
          aria-label={`Current shop ${shopCode}`}
          title={`Current shop: ${shopCode}`}
        >
          {shopCode}
        </div>
      ) : (
        <button
          type="button"
          className="app-header__action"
          onClick={onRegisterShop}
          aria-label="Register your shop with GYAN"
          title="Register your shop"
        >
          <span className="app-header__icon" aria-hidden="true">
            🏪
          </span>
        </button>
      )}
    </header>
  );
}