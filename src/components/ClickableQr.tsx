import { type ReactNode } from "react";
import "./ClickableQr.css";

interface ClickableQrProps {
  url: string;
  children: ReactNode;
  className?: string;
  label?: string;
}

export default function ClickableQr({
  url,
  children,
  className = "",
  label = "Open GYAN link",
}: ClickableQrProps) {
  return (
    <a
      className={["gyan-clickable-qr", className]
        .filter(Boolean)
        .join(" ")}
      href={url}
      aria-label={label}
      title={url}
    >
      {children}
    </a>
  );
}
