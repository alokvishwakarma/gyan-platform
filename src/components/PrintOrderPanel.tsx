import { useMemo, useState } from "react";
import "./PrintOrderPanel.css";

interface PrintOrderPanelProps {
  onClose: () => void;
}

type ColorMode = "black-white" | "color";
type PrintSides = "single" | "double";
type PaperSize = "letter" | "a4" | "legal";

const pricePerPage: Record<ColorMode, number> = {
  "black-white": 0.1,
  color: 0.5,
};

export default function PrintOrderPanel({
  onClose,
}: PrintOrderPanelProps) {
  const [files, setFiles] = useState<File[]>([]);
  const [copies, setCopies] = useState(1);
  const [estimatedPages, setEstimatedPages] = useState(1);
  const [colorMode, setColorMode] =
    useState<ColorMode>("black-white");
  const [printSides, setPrintSides] =
    useState<PrintSides>("single");
  const [paperSize, setPaperSize] =
    useState<PaperSize>("letter");
  const [instructions, setInstructions] = useState("");
  const [submitted, setSubmitted] = useState(false);
  const [customerName, setCustomerName] = useState("");
const [phoneNumber, setPhoneNumber] = useState("");
const [emailAddress, setEmailAddress] = useState("");
const [whatsAppNumber, setWhatsAppNumber] = useState("");
const [usePhoneForWhatsApp, setUsePhoneForWhatsApp] =
  useState(true);
const [whatsAppConsent, setWhatsAppConsent] =
  useState(false);
  

  const estimatedTotal = useMemo(() => {
    return (
      estimatedPages *
      copies *
      pricePerPage[colorMode]
    );
  }, [estimatedPages, copies, colorMode]);

  const effectiveWhatsAppNumber = usePhoneForWhatsApp
  ? phoneNumber
  : whatsAppNumber;

  function handleFileChange(
    event: React.ChangeEvent<HTMLInputElement>,
  ) {
    const selectedFiles = Array.from(
      event.target.files ?? [],
    );

    setFiles(selectedFiles);
  }

  function handleSubmit(
    event: React.FormEvent<HTMLFormElement>,
  ) {
    event.preventDefault();

    if (files.length === 0) {
      return;
    }

    setSubmitted(true);
  }

  if (submitted) {
    return (
      <div
        className="print-panel-overlay"
        role="presentation"
      >
        <section
          className="print-panel print-panel--success"
          role="dialog"
          aria-modal="true"
          aria-labelledby="print-success-title"
        >
          <div className="print-panel__success-icon">
            ✅
          </div>

          <h2 id="print-success-title">
            Print request prepared
          </h2>

          <p>
            Your order is ready for backend submission.
            No document has been uploaded yet.
          </p>

          <div className="print-panel__summary">
            <span>
              {files.length} file
              {files.length === 1 ? "" : "s"}
            </span>

            <span>
              {copies} cop
              {copies === 1 ? "y" : "ies"}
            </span>

            <span>
              Estimated ${estimatedTotal.toFixed(2)}
            </span>
          </div>

          <button
            type="button"
            className="print-panel__primary"
            onClick={onClose}
          >
            Done
          </button>
        </section>
      </div>
    );
  }

  return (
    <div
      className="print-panel-overlay"
      role="presentation"
    >
      <section
        className="print-panel"
        role="dialog"
        aria-modal="true"
        aria-labelledby="print-order-title"
      >
        <header className="print-panel__header">
          <div>
            <span className="print-panel__eyebrow">
              GYAN Print
            </span>

            <h2 id="print-order-title">
              Prepare print order
            </h2>
          </div>

          <button
            type="button"
            className="print-panel__close"
            onClick={onClose}
            aria-label="Close print order"
          >
            ×
          </button>
        </header>

        <form
          className="print-panel__form"
          onSubmit={handleSubmit}
        >
          <label className="print-panel__upload">
            <span className="print-panel__upload-icon">
              📤
            </span>

            <strong>Select documents</strong>

            <span>
              PDF, Word, JPG or PNG
            </span>

            <input
              type="file"
              multiple
              accept=".pdf,.doc,.docx,.jpg,.jpeg,.png"
              onChange={handleFileChange}
            />
          </label>

          {files.length > 0 && (
            <div className="print-panel__files">
              {files.map((file) => (
                <div
                  key={`${file.name}-${file.size}`}
                  className="print-panel__file"
                >
                  <span>📄</span>

                  <span>{file.name}</span>

                  <small>
                    {(file.size / 1024).toFixed(1)} KB
                  </small>
                </div>
              ))}
            </div>
          )}

<div className="print-panel__section">
  <h3>Contact details</h3>

  <label>
    <span>Name</span>

    <input
      type="text"
      value={customerName}
      placeholder="Your name"
      autoComplete="name"
      required
      onChange={(event) =>
        setCustomerName(event.target.value)
      }
    />
  </label>

  <label>
    <span>Mobile number</span>

    <input
      type="tel"
      value={phoneNumber}
      placeholder="+91 98765 43210"
      autoComplete="tel"
      required
      onChange={(event) =>
        setPhoneNumber(event.target.value)
      }
    />
  </label>

  <label>
    <span>Email address — optional</span>

    <input
      type="email"
      value={emailAddress}
      placeholder="name@example.com"
      autoComplete="email"
      onChange={(event) =>
        setEmailAddress(event.target.value)
      }
    />
  </label>

  <label className="print-panel__checkbox">
    <input
      type="checkbox"
      checked={usePhoneForWhatsApp}
      onChange={(event) =>
        setUsePhoneForWhatsApp(event.target.checked)
      }
    />

    <span>My WhatsApp number is the same</span>
  </label>

  {!usePhoneForWhatsApp && (
    <label>
      <span>WhatsApp number</span>

      <input
        type="tel"
        value={whatsAppNumber}
        placeholder="+91 98765 43210"
        autoComplete="tel"
        required
        onChange={(event) =>
          setWhatsAppNumber(event.target.value)
        }
      />
    </label>
  )}

  <label className="print-panel__checkbox">
    <input
      type="checkbox"
      checked={whatsAppConsent}
      onChange={(event) =>
        setWhatsAppConsent(event.target.checked)
      }
    />

    <span>
      Send print-request and pickup updates to
      {effectiveWhatsAppNumber
        ? ` ${effectiveWhatsAppNumber}`
        : " my WhatsApp number"}
    </span>
  </label>
</div>
          <div className="print-panel__field-grid">
            <label>
              <span>Estimated pages</span>

              <input
                type="number"
                min="1"
                max="1000"
                value={estimatedPages}
                onChange={(event) =>
                  setEstimatedPages(
                    Math.max(
                      1,
                      Number(event.target.value),
                    ),
                  )
                }
              />
            </label>

            <label>
              <span>Copies</span>

              <input
                type="number"
                min="1"
                max="100"
                value={copies}
                onChange={(event) =>
                  setCopies(
                    Math.max(
                      1,
                      Number(event.target.value),
                    ),
                  )
                }
              />
            </label>
          </div>

          <fieldset>
            <legend>Color</legend>

            <div className="print-panel__choice-row">
              <label>
                <input
                  type="radio"
                  name="color-mode"
                  checked={colorMode === "black-white"}
                  onChange={() =>
                    setColorMode("black-white")
                  }
                />

                <span>Black & white</span>
              </label>

              <label>
                <input
                  type="radio"
                  name="color-mode"
                  checked={colorMode === "color"}
                  onChange={() =>
                    setColorMode("color")
                  }
                />

                <span>Color</span>
              </label>
            </div>
          </fieldset>

          <fieldset>
            <legend>Sides</legend>

            <div className="print-panel__choice-row">
              <label>
                <input
                  type="radio"
                  name="print-sides"
                  checked={printSides === "single"}
                  onChange={() =>
                    setPrintSides("single")
                  }
                />

                <span>Single-sided</span>
              </label>

              <label>
                <input
                  type="radio"
                  name="print-sides"
                  checked={printSides === "double"}
                  onChange={() =>
                    setPrintSides("double")
                  }
                />

                <span>Double-sided</span>
              </label>
            </div>
          </fieldset>

          <label>
            <span>Paper size</span>

            <select
              value={paperSize}
              onChange={(event) =>
                setPaperSize(
                  event.target.value as PaperSize,
                )
              }
            >
              <option value="letter">
                Letter — 8.5 × 11 in
              </option>

              <option value="a4">
                A4 — 210 × 297 mm
              </option>

              <option value="legal">
                Legal — 8.5 × 14 in
              </option>
            </select>
          </label>

          <label>
            <span>Special instructions</span>

            <textarea
              rows={3}
              value={instructions}
              placeholder="Page ranges, stapling, paper preference, pickup notes..."
              onChange={(event) =>
                setInstructions(event.target.value)
              }
            />
          </label>

          <div className="print-panel__estimate">
            <div>
              <span>Estimated total</span>

              <small>
                Final price may change after file review
              </small>
            </div>

            <strong>
              ${estimatedTotal.toFixed(2)}
            </strong>
          </div>

          <div className="print-panel__actions">
            <button
              type="button"
              className="print-panel__secondary"
              onClick={onClose}
            >
              Cancel
            </button>

            <button
              type="submit"
              className="print-panel__primary"
              disabled={files.length === 0}
            >
              Submit print request
            </button>
          </div>
        </form>
      </section>
    </div>
  );
}