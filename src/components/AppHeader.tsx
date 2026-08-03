import "./AppHeader.css";

interface AppHeaderProps {
  hasExpandedCategories: boolean;
  onCollapseExpandedCategories: () => void;
  onTrackOrder: () => void;
}

export default function AppHeader({
  hasExpandedCategories,
  onCollapseExpandedCategories,
  onTrackOrder,
}: AppHeaderProps) {
  return (
    <header className="app-header">
      <button
        type="button"
        className="app-header__action"
        onClick={onCollapseExpandedCategories}
        disabled={!hasExpandedCategories}
        aria-label="Collapse expanded categories"
      >
        <span className="app-header__icon" aria-hidden="true">
          📖
        </span>

        <span className="app-header__label">
          {hasExpandedCategories ? "Collapse" : "Menu"}
        </span>
      </button>

      <div className="app-header__brand">
        <strong>GYAN</strong>
        <span>gyan.cc</span>
      </div>

      <button
        type="button"
        className="app-header__action"
        onClick={onTrackOrder}
        aria-label="Track order"
      >
        <span className="app-header__icon" aria-hidden="true">
          📍
        </span>

        <span className="app-header__label">Track</span>
      </button>
    </header>
  );
}