import {
  useCallback,
  useEffect,
  useMemo,
  useRef,
  useState,
} from "react";
import QRCode from "qrcode";
import "./ShopRegistrationPanel.css";

interface ShopRegistrationPanelProps {
  onClose: () => void;
  onRegistered: (shop: RegisteredShop) => void;
}

export interface RegisteredShop {
  code: string;
  name: string;
  ownerName: string;
  phoneNumber: string;
  whatsAppNumber: string;
  emailAddress: string;
  addressLine: string;
  city: string;
  state: string;
  postalCode: string;
}

const SHOP_CODE_CHARACTERS =
  "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";

function generateShopCode(): string {
  const randomValues = new Uint32Array(4);

  crypto.getRandomValues(randomValues);

  return Array.from(randomValues)
    .map(
      (value) =>
        SHOP_CODE_CHARACTERS[
          value % SHOP_CODE_CHARACTERS.length
        ],
    )
    .join("");
}

function normalizePhone(value: string): string {
  return value.replace(/[^\d+()\-\s]/g, "");
}

export default function ShopRegistrationPanel({
  onClose,
  onRegistered,
}: ShopRegistrationPanelProps) {
  const qrCanvasRef = useRef<HTMLCanvasElement>(null);

  const [shopCode, setShopCode] = useState(
    generateShopCode,
  );

  const [shopName, setShopName] = useState("");
  const [ownerName, setOwnerName] = useState("");
  const [phoneNumber, setPhoneNumber] = useState("");

  const [whatsAppNumber, setWhatsAppNumber] =
    useState("");

  const [sameWhatsAppNumber, setSameWhatsAppNumber] =
    useState(true);

  const [emailAddress, setEmailAddress] =
    useState("");

  const [addressLine, setAddressLine] =
    useState("");

  const [city, setCity] = useState("");
  const [state, setState] = useState("");
  const [postalCode, setPostalCode] =
    useState("");

  const [
    registrationComplete,
    setRegistrationComplete,
  ] = useState(false);

  const [errorMessage, setErrorMessage] =
    useState<string | null>(null);

  const effectiveWhatsAppNumber =
    sameWhatsAppNumber
      ? phoneNumber
      : whatsAppNumber;

  const shopUrl = useMemo(
    () =>
      `https://gyan.cc/?shop=${encodeURIComponent(
        shopCode,
      )}`,
    [shopCode],
  );

  const drawShopQr = useCallback(
    async (destinationUrl: string) => {
      const canvas = qrCanvasRef.current;

      if (!canvas) {
        return;
      }

      try {
        await QRCode.toCanvas(
          canvas,
          destinationUrl,
          {
            width: 320,
            margin: 4,
            errorCorrectionLevel: "H",
            color: {
              dark: "#5a3218",
              light: "#fffaf0",
            },
          },
        );

        const context = canvas.getContext("2d");

        if (!context) {
          throw new Error(
            "Canvas is unavailable.",
          );
        }

        const badgeSize = 58;

        const badgeX =
          canvas.width / 2 - badgeSize / 2;

        const badgeY =
          canvas.height / 2 - badgeSize / 2;

        context.fillStyle = "#fffaf0";
        context.strokeStyle = "#5a3218";
        context.lineWidth = 3;

        context.fillRect(
          badgeX,
          badgeY,
          badgeSize,
          badgeSize,
        );

        context.strokeRect(
          badgeX,
          badgeY,
          badgeSize,
          badgeSize,
        );

        context.fillStyle = "#111111";

        context.font =
          "700 19px Segoe UI, Arial, sans-serif";

        context.textAlign = "center";
        context.textBaseline = "middle";

        context.fillText(
          "GY",
          canvas.width / 2,
          canvas.height / 2 - 7,
        );

        context.fillStyle = "#5a3218";

        context.font =
          "700 10px Consolas, monospace";

        context.fillText(
          shopCode,
          canvas.width / 2,
          canvas.height / 2 + 14,
        );
      } catch (error) {
        console.error(
          "QR generation failed:",
          error,
        );

        setErrorMessage(
          error instanceof Error
            ? error.message
            : "Unable to generate the QR code.",
        );
      }
    },
    [shopCode],
  );

  useEffect(() => {
    if (!registrationComplete) {
      return;
    }

    void drawShopQr(shopUrl);
  }, [
    registrationComplete,
    shopUrl,
    drawShopQr,
  ]);

  function handleSubmit(
    event: React.FormEvent<HTMLFormElement>,
  ) {
    event.preventDefault();
    setErrorMessage(null);

    if (
      !shopName.trim() ||
      !ownerName.trim() ||
      !phoneNumber.trim() ||
      !addressLine.trim() ||
      !city.trim() ||
      !state.trim() ||
      !postalCode.trim()
    ) {
      setErrorMessage(
        "Please complete all required fields.",
      );

      return;
    }

    if (
      !sameWhatsAppNumber &&
      !whatsAppNumber.trim()
    ) {
      setErrorMessage(
        "Please enter the WhatsApp number.",
      );

      return;
    }

    setRegistrationComplete(true);
  }

  function regenerateCode() {
    setShopCode(generateShopCode());
    setRegistrationComplete(false);
    setErrorMessage(null);
  }

  function downloadQr() {
    const canvas = qrCanvasRef.current;

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

  function finishRegistration() {
    const registeredShop: RegisteredShop = {
      code: shopCode,
      name: shopName.trim(),
      ownerName: ownerName.trim(),
      phoneNumber: phoneNumber.trim(),
      whatsAppNumber:
        effectiveWhatsAppNumber.trim(),
      emailAddress: emailAddress.trim(),
      addressLine: addressLine.trim(),
      city: city.trim(),
      state: state.trim(),
      postalCode: postalCode.trim(),
    };

    localStorage.setItem(
      `gyan-shop-${shopCode}`,
      JSON.stringify(registeredShop),
    );

    onRegistered(registeredShop);
  }

  if (registrationComplete) {
    return (
      <div className="registration-overlay">
        <section
          className="registration-panel registration-panel--complete"
          role="dialog"
          aria-modal="true"
          aria-labelledby="registration-complete-title"
        >
          <header className="registration-panel__header">
            <div>
              <span>GYAN Shop Registration</span>

              <h2 id="registration-complete-title">
                Shop identity created
              </h2>
            </div>

            <button
              type="button"
              className="registration-panel__close"
              onClick={onClose}
              aria-label="Close registration"
            >
              ×
            </button>
          </header>

          <div className="registration-result">
            <div className="registration-result__shop">
              <span>Shop code</span>
              <strong>{shopCode}</strong>
            </div>

            <canvas
              ref={qrCanvasRef}
              className="registration-result__qr"
            />

            <strong className="registration-result__name">
              {shopName.toUpperCase()}
            </strong>

            <span className="registration-result__address">
              {addressLine}, {city}, {state}{" "}
              {postalCode}
            </span>

            <div className="registration-result__url">
              {shopUrl}
            </div>

            <p>
              This QR opens GYAN with your shop
              selected automatically.
            </p>

            <div className="registration-result__actions">
              <button
                type="button"
                className="registration-button registration-button--secondary"
                onClick={downloadQr}
              >
                Download QR
              </button>

              <button
                type="button"
                className="registration-button registration-button--primary"
                onClick={finishRegistration}
              >
                Open registered shop
              </button>
            </div>
          </div>
        </section>
      </div>
    );
  }

  return (
    <div className="registration-overlay">
      <section
        className="registration-panel"
        role="dialog"
        aria-modal="true"
        aria-labelledby="registration-title"
      >
        <header className="registration-panel__header">
          <div>
            <span>Join the GYAN network</span>

            <h2 id="registration-title">
              Register your shop
            </h2>
          </div>

          <button
            type="button"
            className="registration-panel__close"
            onClick={onClose}
            aria-label="Close registration"
          >
            ×
          </button>
        </header>

        <form
          className="registration-form"
          onSubmit={handleSubmit}
        >
          <section className="registration-section">
            <div className="registration-section__heading">
              <h3>Shop identity</h3>
              <span>Required</span>
            </div>

            <label>
              <span>Shop name</span>

              <input
                type="text"
                value={shopName}
                placeholder="Vishwakarma Cyber Cafe"
                autoComplete="organization"
                required
                onChange={(event) =>
                  setShopName(event.target.value)
                }
              />
            </label>

            <label>
              <span>Owner or manager name</span>

              <input
                type="text"
                value={ownerName}
                placeholder="Owner name"
                autoComplete="name"
                required
                onChange={(event) =>
                  setOwnerName(event.target.value)
                }
              />
            </label>

            <div className="registration-code">
              <div>
                <span>Proposed shop code</span>
                <strong>{shopCode}</strong>
              </div>

              <button
                type="button"
                onClick={regenerateCode}
              >
                Generate another
              </button>
            </div>
          </section>

          <section className="registration-section">
            <div className="registration-section__heading">
              <h3>Contact details</h3>
              <span>Phone required</span>
            </div>

            <label>
              <span>Mobile number</span>

              <input
                type="tel"
                value={phoneNumber}
                placeholder="+91 98765 43210"
                autoComplete="tel"
                required
                onChange={(event) =>
                  setPhoneNumber(
                    normalizePhone(
                      event.target.value,
                    ),
                  )
                }
              />
            </label>

            <label className="registration-checkbox">
              <input
                type="checkbox"
                checked={sameWhatsAppNumber}
                onChange={(event) =>
                  setSameWhatsAppNumber(
                    event.target.checked,
                  )
                }
              />

              <span>
                WhatsApp number is the same
              </span>
            </label>

            {!sameWhatsAppNumber && (
              <label>
                <span>WhatsApp number</span>

                <input
                  type="tel"
                  value={whatsAppNumber}
                  placeholder="+91 98765 43210"
                  required
                  onChange={(event) =>
                    setWhatsAppNumber(
                      normalizePhone(
                        event.target.value,
                      ),
                    )
                  }
                />
              </label>
            )}

            <label>
              <span>Email address — optional</span>

              <input
                type="email"
                value={emailAddress}
                placeholder="shop@example.com"
                autoComplete="email"
                onChange={(event) =>
                  setEmailAddress(
                    event.target.value,
                  )
                }
              />
            </label>
          </section>

          <section className="registration-section">
            <div className="registration-section__heading">
              <h3>Shop address</h3>
              <span>Required</span>
            </div>

            <label>
              <span>Street or area</span>

              <input
                type="text"
                value={addressLine}
                placeholder="Manas Nagar"
                autoComplete="street-address"
                required
                onChange={(event) =>
                  setAddressLine(
                    event.target.value,
                  )
                }
              />
            </label>

            <div className="registration-form__two-columns">
              <label>
                <span>City</span>

                <input
                  type="text"
                  value={city}
                  placeholder="Lucknow"
                  autoComplete="address-level2"
                  required
                  onChange={(event) =>
                    setCity(event.target.value)
                  }
                />
              </label>

              <label>
                <span>State</span>

                <input
                  type="text"
                  value={state}
                  placeholder="Uttar Pradesh"
                  autoComplete="address-level1"
                  required
                  onChange={(event) =>
                    setState(event.target.value)
                  }
                />
              </label>
            </div>

            <label>
              <span>PIN or postal code</span>

              <input
                type="text"
                inputMode="numeric"
                value={postalCode}
                placeholder="226023"
                autoComplete="postal-code"
                required
                onChange={(event) =>
                  setPostalCode(
                    event.target.value
                      .replace(/\D/g, "")
                      .slice(0, 10),
                  )
                }
              />
            </label>
          </section>

          {errorMessage && (
            <p
              className="registration-error"
              role="alert"
            >
              {errorMessage}
            </p>
          )}

          <div className="registration-form__actions">
            <button
              type="button"
              className="registration-button registration-button--secondary"
              onClick={onClose}
            >
              Cancel
            </button>

            <button
              type="submit"
              className="registration-button registration-button--primary"
            >
              Register and generate QR
            </button>
          </div>

          <p className="registration-disclaimer">
            This MVP saves registration only on this
            device. Cloud registration will be added
            next.
          </p>
        </form>
      </section>
    </div>
  );
}