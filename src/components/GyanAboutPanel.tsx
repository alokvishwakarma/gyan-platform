import {
  useEffect,
  useState,
} from "react";

import QRCode from "qrcode";

import "./GyanAboutPanel.css";

interface GyanAboutPanelProps {
  onClose: () => void;
  onOpenAdmin: () => void;
}

const WEBSITE_URL =
  "https://gyan.cc/";

export default function GyanAboutPanel({
  onClose,
  onOpenAdmin,
}: GyanAboutPanelProps) {
  const [
    qrCodeUrl,
    setQrCodeUrl,
  ] = useState("");

  const [
    qrError,
    setQrError,
  ] = useState("");

  useEffect(() => {
    let active = true;

    async function createQrCode():
      Promise<void> {
      try {
        const result =
          await QRCode.toDataURL(
            WEBSITE_URL,
            {
              width: 600,
              margin: 3,
              errorCorrectionLevel:
                "M",
            },
          );

        if (active) {
          setQrCodeUrl(
            result,
          );
        }
      } catch (error) {
        console.error(
          "Unable to create GYAN QR code:",
          error,
        );

        if (active) {
          setQrError(
            "QR code could not be generated.",
          );
        }
      }
    }

    void createQrCode();

    return () => {
      active = false;
    };
  }, []);

  function downloadQrCode():
    void {
    if (!qrCodeUrl) {
      return;
    }

    const link =
      document.createElement(
        "a",
      );

    link.href =
      qrCodeUrl;

    link.download =
      "gyan-website-qr.png";

    document.body.appendChild(
      link,
    );

    link.click();

    link.remove();
  }

  return (
    <div
      className="gyan-about-overlay"
      role="presentation"
      onMouseDown={(event) => {
        if (
          event.target ===
          event.currentTarget
        ) {
          onClose();
        }
      }}
    >
      <section
        className="gyan-about-panel"
        role="dialog"
        aria-modal="true"
        aria-labelledby="gyan-about-title"
      >
        <header className="gyan-about-panel__header">
          <div className="gyan-about-panel__brand">
            <span
              aria-hidden="true"
            >
              📖
            </span>

            <div>
              <strong id="gyan-about-title">
                GYAN
              </strong>

              <small>
                Your Digital Seva Partner
              </small>
            </div>
          </div>

          <button
            type="button"
            onClick={onClose}
            aria-label="Close About GYAN"
          >
            ×
          </button>
        </header>

        <div className="gyan-about-panel__content">
          <div className="gyan-about-panel__qr">
            {qrCodeUrl ? (
              <img
                src={qrCodeUrl}
                alt="QR code for gyan.cc"
              />
            ) : qrError ? (
              <p>
                {qrError}
              </p>
            ) : (
              <p>
                Creating QR code…
              </p>
            )}

            <strong>
              Scan to open GYAN
            </strong>

            <small>
              gyan.cc
            </small>
          </div>

          <div className="gyan-about-panel__details">
            <article>
              <span
                aria-hidden="true"
              >
                🛍️
              </span>

              <div>
                <strong>
                  About
                </strong>

                <p>
                  Order services online,
                  then collect when ready.
                  Save time and avoid
                  waiting at the shop.
                </p>
              </div>
            </article>

            <article>
              <span
                aria-hidden="true"
              >
                📍
              </span>

              <div>
                <strong>
                  Location
                </strong>

                <p>
                  Riverside, California
                </p>
              </div>
            </article>

<article>
  <span
    aria-hidden="true"
  >
    🌐
  </span>

  <div>
    <strong>
      Services
    </strong>

    <p>
      Online Global Services
      <br />
      Nearby Local Services
      <br />
      Powered by ChatGPT
    </p>
  </div>
</article>
          </div>
        </div>

        <footer className="gyan-about-panel__footer">
          <button
            type="button"
            className="gyan-about-panel__download-button"
            onClick={downloadQrCode}
            disabled={!qrCodeUrl}
          >
            Download QR
          </button>

          <button
            type="button"
            className="gyan-about-panel__admin-button"
            onClick={onOpenAdmin}
          >
            Admin
          </button>

          <button
            type="button"
            onClick={onClose}
          >
            Close
          </button>
        </footer>
      </section>
    </div>
  );
}