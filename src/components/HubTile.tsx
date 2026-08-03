import type { CSSProperties } from "react";
import "./HubTile.css";

export interface HubTileProps {
  id: string;
  title: string;
  icon: string;
  serviceCount: number;
  visibleServiceCount?: number;
  expanded?: boolean;
  rowSpan?: number;
  backgroundColor?: string;
  textColor?: string;
  accentColor?: string;
  onClick: () => void;
}

export default function HubTile({
  id,
  title,
  icon,
  serviceCount,
  visibleServiceCount = 3,
  expanded = false,
  rowSpan = 1,
  backgroundColor = "#eff6ff",
  textColor = "#1e3a5f",
  accentColor = "#0078d4",
  onClick,
}: HubTileProps) {
  const extraServiceCount = Math.max(
    serviceCount - visibleServiceCount,
    0,
  );

  const style = {
    "--hub-background": backgroundColor,
    "--hub-text": textColor,
    "--hub-accent": accentColor,
    gridRow: `span ${rowSpan}`,
  } as CSSProperties;

  return (
    <button
      id={id}
      type="button"
      className={`hub-tile ${
        expanded ? "hub-tile--expanded" : ""
      }`}
      style={style}
      onClick={onClick}
      aria-expanded={extraServiceCount > 0 ? expanded : undefined}
      aria-label={
        extraServiceCount > 0
          ? `${expanded ? "Collapse" : "Expand"} ${title} services`
          : `Open ${title} services`
      }
    >
      <span className="hub-tile__icon" aria-hidden="true">
        {icon}
      </span>

      <span className="hub-tile__title">{title}</span>

      {extraServiceCount > 0 && (
        <span className="hub-tile__more" aria-hidden="true">
          {expanded ? "⌃" : "⋮"}
        </span>
      )}
    </button>
  );
}