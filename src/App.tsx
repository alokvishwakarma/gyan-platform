import "./App.css";
import Tile from "./components/Tile";

const services = [
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
];

export default function App() {
  return (
    <main className="app-shell">
      <section className="tile-grid" aria-label="GYAN services">
        {services.map((service) => (
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
    </main>
  );
}