import {
  type ReactNode,
} from "react";

import "./GyanHeader.css";


interface GyanHeaderProps {
  left?: ReactNode;
  center?: ReactNode;
  right?: ReactNode;
  className?: string;
}


export default function GyanHeader({
  left,
  center,
  right,
  className = "",
}: GyanHeaderProps) {
  return (
    <header
      className={[
        "gyan-header",
        className,
      ]
        .filter(Boolean)
        .join(" ")}
    >
      <div
        className="gyan-header__left"
      >
        {left}
      </div>

      <div
        className="gyan-header__center"
      >
        {center}
      </div>

      <div
        className="gyan-header__right"
      >
        {right}
      </div>
    </header>
  );
}
