import "./AppHeader.css";

interface AppHeaderProps {
  hasExpandedCategories: boolean;
  shopCode?: string | null;
  onCollapseExpandedCategories: () => void;
  onRegisterShop: () => void;
  onOpenShopQr: () => void;
}

export default function AppHeader({
  hasExpandedCategories,
  shopCode,
  onCollapseExpandedCategories,
  onRegisterShop,
  onOpenShopQr,
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

      <div
        className="app-header__brand"
        aria-label="GYAN"
      >
        <strong>GYAN</strong>
        <span>gyan.cc</span>
      </div>

      {shopCode ? (
        <button
          type="button"
          className="app-header__shop-code"
          onClick={onOpenShopQr}
          aria-label={`Open QR code for shop ${shopCode}`}
          title="View or download shop QR"
        >
          {shopCode}
        </button>
      ) : (
        <button
          type="button"
          className="app-header__action"
          onClick={onRegisterShop}
          aria-label="Register your shop with GYAN"
          title="Register your shop"
        >
          <span
            className="app-header__icon"
            aria-hidden="true"
          >
            🏪
          </span>
        </button>
      )}
    </header>
  );
}