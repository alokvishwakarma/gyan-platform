import { useState } from "react";
import "./App.css";
import AppHeader from "./components/AppHeader";
import AppFooter from "./components/AppFooter";
import HubTile from "./components/HubTile";
import Tile from "./components/Tile";
import InfoPanel from "./components/InfoPanel";

const documentServices = [
  {
    id: "print",
    title: "Print",
    icon: "🖨️",
    color: "#0078d4",
  },
  {
    id: "scan",
    title: "Scan",
    icon: "📠",
    color: "#10893e",
  },
  {
    id: "photo",
    title: "Photo",
    icon: "📷",
    color: "#8764b8",
  },
  {
    id: "lamination",
    title: "Lamination",
    icon: "📄",
    color: "#d83b01",
  },
  {
    id: "binding",
    title: "Binding",
    icon: "📚",
    color: "#5c2d91",
  },
  {
    id: "pdf",
    title: "PDF Tools",
    icon: "📑",
    color: "#ca5010",
  },
];

const educationServices = [
  {
    id: "forms",
    title: "Forms",
    icon: "📝",
    color: "#038387",
  },
  {
    id: "resume",
    title: "Resume",
    icon: "📋",
    color: "#e3008c",
  },
  {
    id: "certificates",
    title: "Certificates",
    icon: "🎓",
    color: "#498205",
  },
  {
    id: "admit-card",
    title: "Admit Card",
    icon: "🪪",
    color: "#8e562e",
  },
  {
    id: "applications",
    title: "Applications",
    icon: "✍️",
    color: "#4f6bed",
  },
];

export default function App() {
  const [expandedCategories, setExpandedCategories] = useState<Set<string>>(
    new Set(),
  );

  function toggleCategory(categoryId: string) {
    setExpandedCategories((current) => {
      const next = new Set(current);

      if (next.has(categoryId)) {
        next.delete(categoryId);
      } else {
        next.add(categoryId);
      }

      return next;
    });
  }

  function collapseExpandedCategories() {
    setExpandedCategories(new Set());
  }

  function renderCategory(
    categoryId: string,
    title: string,
    icon: string,
    services: typeof documentServices,
  ) {
    const visibleServices = services.slice(0, 3);
    const extraServices = services.slice(3);
    const isExpanded = expandedCategories.has(categoryId);

    return (
      <>
        <HubTile
          id={`${categoryId}-hub`}
          title={title}
          icon={icon}
          serviceCount={services.length}
          onClick={() => toggleCategory(categoryId)}
        />

        {visibleServices.map((service) => (
          <Tile
            key={service.id}
            id={service.id}
            title={service.title}
            icon={service.icon}
            width={3}
            color={service.color}
            onClick={() => console.log(`${service.title} selected`)}
          />
        ))}

        {isExpanded &&
          extraServices.map((service) => (
            <Tile
              key={service.id}
              id={service.id}
              title={service.title}
              icon={service.icon}
              width={3}
              color={service.color}
              onClick={() => console.log(`${service.title} selected`)}
            />
          ))}
      </>
    );
  }

  return (
    <main className="app-shell">
      <div className="app-content">
        <AppHeader
          hasExpandedCategories={expandedCategories.size > 0}
          onCollapseExpandedCategories={collapseExpandedCategories}
          onTrackOrder={() => console.log("Track order selected")}
        />

        <section className="tile-grid" aria-label="GYAN services">
          {renderCategory(
            "documents",
            "Docs",
            "📄",
            documentServices,
          )}

          {renderCategory(
            "education",
            "Education",
            "🎓",
            educationServices,
          )}
        </section>

        <InfoPanel />

        <AppFooter
          onContact={() => console.log("Contact selected")}
          onLocation={() => console.log("Location selected")}
        />
      </div>
    </main>
  );
}