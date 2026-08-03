import "./AppHeader.css";

interface AppHeaderProps {
  categoriesExpanded: boolean;
  onToggleCategories: () => void;
  onTrackOrder: () => void;
}

export default function AppHeader({
  categoriesExpanded,
  onToggleCategories,
  onTrackOrder,
}: AppHeaderProps) {
  return (
    <header className="app-header">
      <button
        type="button"
        className="app-header__action"
        onClick={onToggleCategories}
        aria-expanded={categoriesExpanded}
        aria-label={
          categoriesExpanded ? "Collapse categories" : "Expand categories"
        }
      >
        <span className="app-header__icon" aria-hidden="true">
          📖
        </span>

        <span className="app-header__label">
          {categoriesExpanded ? "Collapse" : "Expand"}
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