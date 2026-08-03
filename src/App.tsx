import "./App.css";
import Tile from "./components/Tile";

export default function App() {
  return (
    <main className="app-shell">
      <section className="tile-grid" aria-label="GYAN services">
        <Tile
          id="print"
          title="Print"
          icon="🖨️"
          width={3}
          color="#0078d4"
          onClick={() => console.log("Print selected")}
        />
      </section>
    </main>
  );
}