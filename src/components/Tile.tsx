import "./Tile.css";

export type TileWidth = 1 | 2 | 3 | 6 | 9 | 12;
export type TileVariant = "service" | "header" | "more";

export interface TileProps {
  id: string;
  title: string;
  icon: string;
  width?: TileWidth;
  color?: string;
  variant?: TileVariant;
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
  const style = {
    backgroundColor: variant === "header" ? "#ffffff" : color,
    gridColumn: `span ${width}`,
  };

  if (variant === "header") {
    return (
      <div
        id={id}
        className="tile tile--header"
        style={style}
        aria-label={title}
      >
        <span className="tile__icon" aria-hidden="true">
          {icon}
        </span>

        <span className="tile__title">{title}</span>
      </div>
    );
  }

  return (
    <button
      id={id}
      type="button"
      className={`tile tile--${variant}`}
      style={style}
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