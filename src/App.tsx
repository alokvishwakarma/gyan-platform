import "./App.css";
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
];

export default function App() {
  return (
    <main className="app-shell">
      <section className="tile-grid" aria-label="GYAN services">
        <Tile
          id="documents-category"
          title="Docs"
          icon="D"
          width={2}
          color="#2d3e50"
          variant="category"
          onClick={() => console.log("Documents selected")}
        />

        {documentServices.map((service) => (
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

        <Tile
          id="documents-more"
          title="More document services"
          icon="⋮"
          width={1}
          color="#52616b"
          variant="more"
          onClick={() => console.log("More document services selected")}
        />
      </section>
    </main>
  );
}