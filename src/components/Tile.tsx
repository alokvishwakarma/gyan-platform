import "./Tile.css";

export type TileWidth = 1 | 2 | 3 | 6 | 9 | 12;

export interface TileProps {
  id: string;
  title: string;
  icon: string;
  width?: TileWidth;
  color?: string;
  variant?: "service" | "category" | "more";
  onClick?: () => void;
}

export default function Tile({
  id,
  title,
  icon,
  width = 3,
  color = "#0078d4",
  variant = "service",
  onClick,
}: TileProps) {
  return (
    <button
      id={id}
      type="button"
      className={`tile tile--${variant}`}
      style={{
        backgroundColor: color,
        gridColumn: `span ${width}`,
      }}
      onClick={onClick}
      aria-label={title}
    >
      <span className="tile__icon" aria-hidden="true">
        {icon}
      </span>

      {title && <span className="tile__title">{title}</span>}
    </button>
  );
}