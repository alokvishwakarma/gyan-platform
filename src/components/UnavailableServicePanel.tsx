import "./UnavailableServicePanel.css";

interface UnavailableServicePanelProps {
  serviceName: string;
  shopName?: string;
  onClose: () => void;
}

export default function UnavailableServicePanel({
  serviceName,
  shopName,
  onClose,
}: UnavailableServicePanelProps) {
  return (
    <div
      className="unavailable-service-overlay"
      onClick={onClose}
    >
      <section
        className="unavailable-service-panel"
        role="dialog"
        aria-modal="true"
        aria-labelledby="unavailable-service-title"
        onClick={(event) => {
          event.stopPropagation();
        }}
      >
        <div
          className="unavailable-service-panel__icon"
          aria-hidden="true"
        >
          ⓘ
        </div>

        <h2 id="unavailable-service-title">
          {serviceName}
        </h2>

        <p>
          This feature is currently
          unavailable
          {shopName
            ? ` at ${shopName}`
            : ""}
          .
        </p>

        <p>
          Please contact the shop
          administrator for assistance.
        </p>

        <button
          type="button"
          onClick={onClose}
        >
          Close
        </button>
      </section>
    </div>
  );
}