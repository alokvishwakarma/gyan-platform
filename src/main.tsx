import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import "./index.css";

import App from "./App.tsx";
import PosterGenerator from "./components/PosterGenerator.tsx";

const normalizedPath = window.location.pathname
  .replace(/\/+$/, "")
  .toLowerCase();

const isPosterGenerator =
  normalizedPath === "/poster";

createRoot(
  document.getElementById("root")!,
).render(
  <StrictMode>
    {isPosterGenerator ? (
      <PosterGenerator />
    ) : (
      <App />
    )}
  </StrictMode>,
);