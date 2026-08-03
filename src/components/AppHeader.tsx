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
        aria-label="Collapse all expanded categories"
        title={
          hasExpandedCategories
            ? "Collapse all expanded categories"
            : "No expanded categories"
        }
      >
        <span className="app-header__icon" aria-hidden="true">
          📖
        </span>
      </button>

      <div className="app-header__brand" aria-label="GYAN">
        <strong>GYAN</strong>
        <span>gyan.cc</span>
      </div>

      <button
        type="button"
        className="app-header__action"
        onClick={onTrackOrder}
        aria-label="Track order"
        title="Track order"
      >
        <span className="app-header__icon" aria-hidden="true">
          📍
        </span>
      </button>
    </header>
  );
}