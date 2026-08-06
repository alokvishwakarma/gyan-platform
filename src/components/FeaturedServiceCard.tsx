import type { CSSProperties } from "react";
import "./FeaturedServiceCard.css";

interface FeaturedServiceCardProps {
  title: string;
  description: string;
  icon: string;
  accentColor: string;
  buttonText: string;
  disabled?: boolean;
  onSelect: () => void;
}

export default function FeaturedServiceCard({
  title,
  description,
  icon,
  accentColor,
  buttonText,
  disabled = false,
  onSelect,
}: FeaturedServiceCardProps) {
  return (
    <section
      className="featured-service-card"
      style={{
        "--featured-service-accent": accentColor,
      } as CSSProperties}
    >
      <div className="featured-service-card__icon" aria-hidden="true">
        {icon || "🧩"}
      </div>

      <div className="featured-service-card__content">
        <p className="featured-service-card__eyebrow">
          Featured service
        </p>

        <h2>{title}</h2>

        <p className="featured-service-card__description">
          {description || "Request this service from the shop."}
        </p>

        <button
          type="button"
          className="featured-service-card__button"
          disabled={disabled}
          onClick={onSelect}
        >
          {disabled ? "Currently unavailable" : buttonText}
          {!disabled && <span aria-hidden="true">→</span>}
        </button>
      </div>
    </section>
  );
}
