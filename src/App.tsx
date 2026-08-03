import { useState } from "react";
import "./App.css";

import AppFooter from "./components/AppFooter";
import AppHeader from "./components/AppHeader";
import CategoryRow, {
  type ServiceItem,
} from "./components/CategoryRow";
import InfoPanel from "./components/InfoPanel";

const documentServices: ServiceItem[] = [
  {
    id: "print",
    title: "Print",
    icon: "🖨️",
    color: "#1565c0",
  },
  {
    id: "scan",
    title: "Scan",
    icon: "📠",
    color: "#1976d2",
  },
  {
    id: "photo",
    title: "Photo",
    icon: "📷",
    color: "#1e88e5",
  },
  {
    id: "lamination",
    title: "Lamination",
    icon: "📄",
    color: "#2196f3",
  },
  {
    id: "binding",
    title: "Binding",
    icon: "📚",
    color: "#42a5f5",
  },
  {
    id: "pdf",
    title: "PDF Tools",
    icon: "📑",
    color: "#64b5f6",
  },
];

const educationServices: ServiceItem[] = [
  {
    id: "forms",
    title: "Forms",
    icon: "📝",
    color: "#2e7d32",
  },
  {
    id: "resume",
    title: "Resume",
    icon: "📋",
    color: "#388e3c",
  },
  {
    id: "certificates",
    title: "Certificates",
    icon: "🎓",
    color: "#43a047",
  },
  {
    id: "admit-card",
    title: "Admit Card",
    icon: "🪪",
    color: "#4caf50",
  },
  {
    id: "applications",
    title: "Applications",
    icon: "✍️",
    color: "#66bb6a",
  },
];

const governmentServices: ServiceItem[] = [
  {
    id: "pan",
    title: "PAN Help",
    icon: "🪪",
    color: "#e65100",
  },
  {
    id: "aadhaar",
    title: "Aadhaar Help",
    icon: "👤",
    color: "#ef6c00",
  },
  {
    id: "passport",
    title: "Passport",
    icon: "🛂",
    color: "#f57c00",
  },
  {
    id: "bill-payment",
    title: "Bill Payment",
    icon: "🧾",
    color: "#fb8c00",
  },
  {
    id: "insurance",
    title: "Insurance",
    icon: "🛡️",
    color: "#ff9800",
  },
  {
    id: "government-forms",
    title: "Govt Forms",
    icon: "🏛️",
    color: "#ffa726",
  },
];

export default function App() {
  const [expandedCategories, setExpandedCategories] =
    useState<Set<string>>(new Set());

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

  function handleServiceClick(service: ServiceItem) {
    console.log(`${service.title} selected`);
  }

  return (
    <main className="app-shell">
      <div className="app-content">
        <AppHeader
          hasExpandedCategories={expandedCategories.size > 0}
          onCollapseExpandedCategories={
            collapseExpandedCategories
          }
          onTrackOrder={() =>
            console.log("Track order selected")
          }
        />

        <div className="category-list">
          <CategoryRow
            id="documents"
            title="Docs"
            icon="📄"
            services={documentServices}
            expanded={expandedCategories.has("documents")}
            hubBackground="#eff6ff"
            hubTextColor="#17456f"
            hubAccentColor="#1976d2"
            onToggle={() => toggleCategory("documents")}
            onServiceClick={handleServiceClick}
          />

          <CategoryRow
            id="education"
            title="Education"
            icon="🎓"
            services={educationServices}
            expanded={expandedCategories.has("education")}
            hubBackground="#effaf1"
            hubTextColor="#24562a"
            hubAccentColor="#43a047"
            onToggle={() => toggleCategory("education")}
            onServiceClick={handleServiceClick}
          />

          <CategoryRow
            id="government"
            title="Government"
            icon="🏛️"
            services={governmentServices}
            expanded={expandedCategories.has("government")}
            hubBackground="#fff4e8"
            hubTextColor="#7a3500"
            hubAccentColor="#ef6c00"
            onToggle={() => toggleCategory("government")}
            onServiceClick={handleServiceClick}
          />
        </div>

        <InfoPanel />

        <AppFooter
          onContact={() => console.log("Contact selected")}
          onLocation={() => console.log("Location selected")}
        />
      </div>
    </main>
  );
}