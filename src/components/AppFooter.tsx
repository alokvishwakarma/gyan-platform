import "./AppFooter.css";

interface AppFooterProps {
  onContact: () => void;
  onLocation: () => void;
}

export default function AppFooter({
  onContact,
  onLocation,
}: AppFooterProps) {
  return (
    <footer className="app-footer">
      <button
        type="button"
        className="app-footer__action"
        onClick={onContact}
        aria-label="Contact the service center"
      >
        <span className="app-footer__icon" aria-hidden="true">
          💬
        </span>

        <span className="app-footer__label">Contact</span>
      </button>

      <div className="app-footer__status">
        <strong>Send from home</strong>
        <span>Collect when ready</span>
      </div>

      <button
        type="button"
        className="app-footer__action"
        onClick={onLocation}
        aria-label="View service center location"
      >
        <span className="app-footer__icon" aria-hidden="true">
          📍
        </span>

        <span className="app-footer__label">Location</span>
      </button>
    </footer>
  );
}