import "./HubTile.css";

export interface HubTileProps {
  id: string;
  title: string;
  icon: string;
  serviceCount: number;
  visibleServiceCount?: number;
  onClick: () => void;
}

export default function HubTile({
  id,
  title,
  icon,
  serviceCount,
  visibleServiceCount = 3,
  onClick,
}: HubTileProps) {
  const extraServiceCount = Math.max(
    serviceCount - visibleServiceCount,
    0,
  );

  return (
    <button
      id={id}
      type="button"
      className="hub-tile"
      onClick={onClick}
      aria-label={`Open ${title} services`}
    >
      <span className="hub-tile__icon" aria-hidden="true">
        {icon}
      </span>

      <span className="hub-tile__title">{title}</span>

      {extraServiceCount > 0 && (
        <span
          className="hub-tile__more"
          aria-hidden="true"
          title={`${extraServiceCount} more services`}
        >
          ⋮
        </span>
      )}
    </button>
  );
}