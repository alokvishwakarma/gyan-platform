import {
  useEffect,
  useRef,
  useState,
} from "react";
import QRCode from "qrcode";
import "./ShopQrPanel.css";

interface ShopQrPanelProps {
  shopCode: string;
  shopName: string;
  address: string;
  onClose: () => void;
}

export default function ShopQrPanel({
  shopCode,
  shopName,
  address,
  onClose,
}: ShopQrPanelProps) {
  const canvasRef = useRef<HTMLCanvasElement>(null);

  const [errorMessage, setErrorMessage] =
    useState<string | null>(null);

  const shopUrl =
    `https://gyan.cc/?shop=${encodeURIComponent(
      shopCode,
    )}`;

  useEffect(() => {
    const canvas = canvasRef.current;

    if (!canvas) {
      return;
    }

    async function generateQr() {
      try {
        await QRCode.toCanvas(
          canvas,
          shopUrl,
          {
            width: 340,
            margin: 5,
            errorCorrectionLevel: "H",
            color: {
              dark: "#5a3218",
              light: "#fffaf0",
            },
          },
        );
      } catch (error) {
        console.error(
          "Unable to generate shop QR:",
          error,
        );

        setErrorMessage(
          "Unable to generate the QR code.",
        );
      }
    }

    void generateQr();
  }, [shopUrl]);

  function downloadQr() {
    const canvas = canvasRef.current;

    if (!canvas) {
      return;
    }

    const link = document.createElement("a");

    link.download = `GYAN-${shopCode}-QR.png`;
    link.href = canvas.toDataURL("image/png");

    document.body.appendChild(link);
    link.click();
    link.remove();
  }

  return (
    <div className="shop-qr-overlay">
      <section
        className="shop-qr-panel"
        role="dialog"
        aria-modal="true"
        aria-labelledby="shop-qr-title"
      >
        <header className="shop-qr-panel__header">
          <div>
            <span>GYAN Shop QR</span>

            <h2 id="shop-qr-title">
              {shopCode}
            </h2>
          </div>

          <button
            type="button"
            className="shop-qr-panel__close"
            onClick={onClose}
            aria-label="Close shop QR"
          >
            ×
          </button>
        </header>

        <div className="shop-qr-panel__content">
          <canvas
            ref={canvasRef}
            className="shop-qr-panel__canvas"
          />

          <strong>
            {shopName.toUpperCase()}
          </strong>

          <span>{address}</span>

          <code>{shopUrl}</code>

          {errorMessage && (
            <p
              className="shop-qr-panel__error"
              role="alert"
            >
              {errorMessage}
            </p>
          )}

          <div className="shop-qr-panel__actions">
            <button
              type="button"
              className="shop-qr-panel__secondary"
              onClick={onClose}
            >
              Close
            </button>

            <button
              type="button"
              className="shop-qr-panel__primary"
              onClick={downloadQr}
              disabled={Boolean(errorMessage)}
            >
              Download QR
            </button>
          </div>
        </div>
      </section>
    </div>
  );
}