import "./InfoPanel.css";

export default function InfoPanel() {
  return (
    <section className="info-panel" aria-label="GYAN information">
      <span className="info-panel__icon" aria-hidden="true">
        📤
      </span>

      <div className="info-panel__text">
        <strong>Send documents from home</strong>
        <span>Collect after receiving the ready message</span>
      </div>
    </section>
  );
}