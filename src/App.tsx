import { useState } from "react";
import "./App.css";
import AppHeader from "./components/AppHeader";
import HubTile from "./components/HubTile";
import Tile from "./components/Tile";

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
];

export default function App() {
  const [categoriesExpanded, setCategoriesExpanded] = useState(true);

  return (
    <main className="app-shell">
      <div className="app-content">
        <AppHeader
          categoriesExpanded={categoriesExpanded}
          onToggleCategories={() =>
            setCategoriesExpanded((current) => !current)
          }
          onTrackOrder={() => console.log("Track order selected")}
        />

        {categoriesExpanded && (
          <section className="tile-grid" aria-label="GYAN services">
            <HubTile
              id="documents-hub"
              title="Docs"
              icon="📄"
              serviceCount={documentServices.length}
              onClick={() => console.log("Open all document services")}
            />

            {documentServices.slice(0, 3).map((service) => (
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
          </section>
        )}
      </div>
    </main>
  );
}