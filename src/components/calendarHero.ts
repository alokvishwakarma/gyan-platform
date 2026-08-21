export type CalendarMarket =
  | "IN"
  | "US";

export interface CalendarHeroConfig {
  market: CalendarMarket;
  imageSrc: string;
  imageAlt: string;
  eyebrow: string;
  title: string;
  subtitle: string;
}

export const CALENDAR_HERO_IMAGES = {
  IN: "/calendar/maa-saraswati.webp",
  US: "/calendar/us-education.webp",
} as const;

export function getCalendarHeroConfig(
  market: CalendarMarket,
): CalendarHeroConfig {
  if (market === "IN") {
    return {
      market: "IN",
      imageSrc: CALENDAR_HERO_IMAGES.IN,
      imageAlt:
        "Maa Saraswati with books and veena",
      eyebrow: "GYAN",
      title: "माँ सरस्वती",
      subtitle: "विद्या • ज्ञान • अभ्यास",
    };
  }

  return {
    market: "US",
    imageSrc: CALENDAR_HERO_IMAGES.US,
    imageAlt:
      "Students learning with books and technology",
    eyebrow: "GYAN",
    title: "GYAN Learning",
    subtitle: "Learn • Practice • Grow",
  };
}
