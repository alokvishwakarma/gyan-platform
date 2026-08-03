import "./Tile.css";

export type TileWidth = 3 | 6 | 9;

export interface TileProps {
  id: string;
  title: string;
  icon: string;
  width?: TileWidth;
  color?: string;
  onClick?: () => void;
}

export default function Tile({
  id,
  title,
  icon,
  width = 3,
  color = "#0078d4",
  onClick,
}: TileProps) {
  return (
    <button
      id={id}
      type="button"
      className="tile"
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

      <span className="tile__title">{title}</span>
    </button>
  );
}