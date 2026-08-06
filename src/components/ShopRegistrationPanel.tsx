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

  onRegistered: (
    shop: RegisteredShop,
  ) => void;
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

interface LocationHint {
  countryCode?: string;
  region?: string;
  city?: string;
  postalCode?: string;
}

const SHOP_CODE_CHARACTERS =
  "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";

function generateShopCode():
  string {
  const randomValues =
    new Uint32Array(4);

  crypto.getRandomValues(
    randomValues,
  );

  return Array.from(
    randomValues,
  )
    .map(
      (value) =>
        SHOP_CODE_CHARACTERS[
          value %
          SHOP_CODE_CHARACTERS.length
        ],
    )
    .join("");
}

function normalizePhone(
  value: string,
): string {
  let result =
    value.replace(
      /[^0-9+()\-\s]/g,
      "",
    );

  if (
    result.startsWith("+")
  ) {
    result =
      "+" +
      result
        .slice(1)
        .replace(/\+/g, "");
  } else {
    result =
      result.replace(
        /\+/g,
        "",
      );
  }

  return result;
}

function getDialCode(
  countryCode?: string,
): string {
  switch (
    countryCode
      ?.trim()
      .toUpperCase()
  ) {
    case "US":
    case "CA":
      return "+1 ";

    case "IN":
      return "+91 ";

    case "GB":
      return "+44 ";

    case "AU":
      return "+61 ";

    default:
      return "";
  }
}

export default function ShopRegistrationPanel({
  onClose,
  onRegistered,
}: ShopRegistrationPanelProps) {
  const qrCanvasRef =
    useRef<HTMLCanvasElement>(
      null,
    );

  const [
    shopCode,
    setShopCode,
  ] =
    useState(
      generateShopCode,
    );

  const [
    shopName,
    setShopName,
  ] =
    useState("");

  const [
    ownerName,
    setOwnerName,
  ] =
    useState("");

  const [
    phoneNumber,
    setPhoneNumber,
  ] =
    useState("");

  const [
    whatsAppNumber,
    setWhatsAppNumber,
  ] =
    useState("");

  const [
    sameWhatsAppNumber,
    setSameWhatsAppNumber,
  ] =
    useState(true);

  const [
    emailAddress,
    setEmailAddress,
  ] =
    useState("");

  const [
    addressLine,
    setAddressLine,
  ] =
    useState("");

  const [
    city,
    setCity,
  ] =
    useState("");

  const [
    state,
    setState,
  ] =
    useState("");

  const [
    postalCode,
    setPostalCode,
  ] =
    useState("");

  const [
    showMore,
    setShowMore,
  ] =
    useState(false);

  const [
    registrationComplete,
    setRegistrationComplete,
  ] =
    useState(false);

  const [
    errorMessage,
    setErrorMessage,
  ] =
    useState<
      string | null
    >(null);

  const effectiveWhatsAppNumber =
    sameWhatsAppNumber
      ? phoneNumber
      : whatsAppNumber;

  const shopUrl =
    useMemo(
      () =>
        `https://gyan.cc/?shop=${encodeURIComponent(
          shopCode,
        )}`,
      [shopCode],
    );

  useEffect(() => {
    const controller =
      new AbortController();

    async function loadHint():
      Promise<void> {
      try {
        const response =
          await fetch(
            "/api/location-hint",
            {
              signal:
                controller.signal,

              headers: {
                "x-gyan-timezone":
                  Intl.DateTimeFormat()
                    .resolvedOptions()
                    .timeZone,

                "x-gyan-languages":
                  (
                    navigator.languages ??
                    [navigator.language]
                  ).join(","),
              },
            },
          );

        if (!response.ok) {
          return;
        }

        const hint =
          (await response.json()) as
            LocationHint;

        if (
          controller.signal
            .aborted
        ) {
          return;
        }

        setPhoneNumber(
          (current) =>
            current.trim()
              ? current
              : getDialCode(
                  hint.countryCode,
                ),
        );

        setCity(
          (current) =>
            current.trim()
              ? current
              : hint.city ?? "",
        );

        setState(
          (current) =>
            current.trim()
              ? current
              : hint.region ?? "",
        );

        setPostalCode(
          (current) =>
            current.trim()
              ? current
              : hint.postalCode ??
                "",
        );
      } catch {
        // Registration still works
        // without location hints.
      }
    }

    void loadHint();

    return () => {
      controller.abort();
    };
  }, []);

  const drawShopQr =
    useCallback(
      async (
        destinationUrl: string,
      ) => {
        const canvas =
          qrCanvasRef.current;

        if (!canvas) {
          return;
        }

        try {
          await QRCode.toCanvas(
            canvas,
            destinationUrl,
            {
              width: 260,
              margin: 4,

              errorCorrectionLevel:
                "H",

              color: {
                dark: "#17365d",
                light: "#fffdf8",
              },
            },
          );

          const context =
            canvas.getContext(
              "2d",
            );

          if (!context) {
            throw new Error(
              "Canvas is unavailable.",
            );
          }

          const badgeSize =
            54;

          const badgeX =
            canvas.width / 2 -
            badgeSize / 2;

          const badgeY =
            canvas.height / 2 -
            badgeSize / 2;

          context.fillStyle =
            "#fffdf8";

          context.strokeStyle =
            "#17365d";

          context.lineWidth =
            3;

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

          context.fillStyle =
            "#17365d";

          context.font =
            "700 18px Segoe UI, Arial, sans-serif";

          context.textAlign =
            "center";

          context.textBaseline =
            "middle";

          context.fillText(
            "GY",
            canvas.width / 2,
            canvas.height / 2 -
              7,
          );

          context.font =
            "700 9px Consolas, monospace";

          context.fillText(
            shopCode,
            canvas.width / 2,
            canvas.height / 2 +
              13,
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
    if (
      !registrationComplete
    ) {
      return;
    }

    void drawShopQr(
      shopUrl,
    );
  }, [
    registrationComplete,
    shopUrl,
    drawShopQr,
  ]);

  function handleSubmit(
    event:
      React.FormEvent<HTMLFormElement>,
  ): void {
    event.preventDefault();

    setErrorMessage(
      null,
    );

    if (
      !shopName.trim() ||
      !addressLine.trim()
    ) {
      setErrorMessage(
        "Please enter the shop name and street / area.",
      );

      return;
    }

    const hasValidEmail =
      /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        emailAddress.trim(),
      );

    const phoneDigits =
      phoneNumber.replace(
        /\D/g,
        "",
      );

    const dialCodeOnly =
      phoneNumber.trim() ===
        "+1" ||
      phoneNumber.trim() ===
        "+91" ||
      phoneNumber.trim() ===
        "+44" ||
      phoneNumber.trim() ===
        "+61";

    const hasUsablePhone =
      phoneDigits.length >= 7 &&
      !dialCodeOnly;

    if (
      !hasUsablePhone &&
      !hasValidEmail
    ) {
      setErrorMessage(
        "Please enter a phone / WhatsApp number or a valid email address.",
      );

      return;
    }

    if (
      emailAddress.trim() &&
      !hasValidEmail
    ) {
      setErrorMessage(
        "Please enter a valid email address.",
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

    setRegistrationComplete(
      true,
    );
  }

  function regenerateCode():
    void {
    setShopCode(
      generateShopCode(),
    );

    setRegistrationComplete(
      false,
    );

    setErrorMessage(
      null,
    );
  }

  function downloadQr():
    void {
    const canvas =
      qrCanvasRef.current;

    if (!canvas) {
      return;
    }

    const link =
      document.createElement(
        "a",
      );

    link.download =
      `GYAN-${shopCode}-QR.png`;

    link.href =
      canvas.toDataURL(
        "image/png",
      );

    document.body.appendChild(
      link,
    );

    link.click();
    link.remove();
  }

  function finishRegistration():
    void {
    const registeredShop:
      RegisteredShop = {
      code:
        shopCode,

      name:
        shopName.trim(),

      ownerName:
        ownerName.trim(),

      phoneNumber:
        phoneNumber.trim(),

      whatsAppNumber:
        effectiveWhatsAppNumber.trim(),

      emailAddress:
        emailAddress.trim(),

      addressLine:
        addressLine.trim(),

      city:
        city.trim(),

      state:
        state.trim(),

      postalCode:
        postalCode.trim(),
    };

    localStorage.setItem(
      `gyan-shop-${shopCode}`,
      JSON.stringify(
        registeredShop,
      ),
    );

    onRegistered(
      registeredShop,
    );
  }

  if (
    registrationComplete
  ) {
    return (
      <div className="registration-overlay">
        <section
          className="registration-panel registration-panel--complete"
          role="dialog"
          aria-modal="true"
          aria-labelledby="registration-complete-title"
        >
          <header className="registration-panel__header">
            <h2 id="registration-complete-title">
              Shop registered
            </h2>

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
              <span>
                Shop code
              </span>

              <strong>
                {shopCode}
              </strong>
            </div>

            <canvas
              ref={qrCanvasRef}
              className="registration-result__qr"
            />

            <strong className="registration-result__name">
              {shopName}
            </strong>

            <span className="registration-result__address">
              {addressLine},{" "}
              {city},{" "}
              {state}{" "}
              {postalCode}
            </span>

            <div className="registration-result__actions">
              <button
                type="button"
                className="registration-button registration-button--secondary"
                onClick={
                  downloadQr
                }
              >
                Download QR
              </button>

              <button
                type="button"
                className="registration-button registration-button--primary"
                onClick={
                  finishRegistration
                }
              >
                Open shop
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
        className="registration-panel registration-panel--compact"
        role="dialog"
        aria-modal="true"
        aria-labelledby="registration-title"
      >
        <header className="registration-panel__header">
          <h2 id="registration-title">
            Register your shop
          </h2>

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
          className="registration-form registration-form--compact"
          onSubmit={
            handleSubmit
          }
        >
          <input
            type="text"
            value={shopName}
            placeholder="Shop name"
            aria-label="Shop name"
            autoComplete="organization"
            required
            onChange={(event) =>
              setShopName(
                event.target.value,
              )
            }
          />

          <div className="registration-form__contact-row">
            <input
              type="tel"
              inputMode="tel"
              value={
                phoneNumber
              }
              placeholder="Phone / WhatsApp"
              aria-label="Phone or WhatsApp"
              autoComplete="tel"
              onChange={(event) =>
                setPhoneNumber(
                  normalizePhone(
                    event.target
                      .value,
                  ),
                )
              }
            />

            <input
              type="email"
              inputMode="email"
              value={
                emailAddress
              }
              placeholder="Email"
              aria-label="Email"
              autoComplete="email"
              onChange={(event) =>
                setEmailAddress(
                  event.target
                    .value,
                )
              }
            />
          </div>

          <input
            type="text"
            value={
              addressLine
            }
            placeholder="Street / area"
            aria-label="Street or area"
            autoComplete="street-address"
            required
            onChange={(event) =>
              setAddressLine(
                event.target.value,
              )
            }
          />

          <button
            type="button"
            className="registration-form__more"
            onClick={() =>
              setShowMore(
                (current) =>
                  !current,
              )
            }
          >
            {showMore
              ? "− Hide details"
              : "+ Add more details"}
          </button>

          {showMore && (
            <section className="registration-form__more-fields">
              <input
                type="text"
                value={ownerName}
                placeholder="Owner / manager name"
                aria-label="Owner or manager name"
                autoComplete="name"
                onChange={(event) =>
                  setOwnerName(
                    event.target.value,
                  )
                }
              />

              <div className="registration-form__address-row">
                <input
                  type="text"
                  value={city}
                  placeholder="City"
                  aria-label="City"
                  autoComplete="address-level2"
                  onChange={(event) =>
                    setCity(
                      event.target.value,
                    )
                  }
                />

                <input
                  type="text"
                  value={state}
                  placeholder="State"
                  aria-label="State"
                  autoComplete="address-level1"
                  onChange={(event) =>
                    setState(
                      event.target.value,
                    )
                  }
                />

                <input
                  type="text"
                  inputMode="numeric"
                  value={
                    postalCode
                  }
                  placeholder="PIN / ZIP"
                  aria-label="PIN or postal code"
                  autoComplete="postal-code"
                  onChange={(event) =>
                    setPostalCode(
                      event.target.value
                        .replace(
                          /[^A-Za-z0-9 -]/g,
                          "",
                        )
                        .slice(
                          0,
                          12,
                        ),
                    )
                  }
                />
              </div>

              <label className="registration-form__checkbox">
                <input
                  type="checkbox"
                  checked={
                    sameWhatsAppNumber
                  }
                  onChange={(event) =>
                    setSameWhatsAppNumber(
                      event.target
                        .checked,
                    )
                  }
                />

                <span>
                  WhatsApp uses the
                  same phone number
                </span>
              </label>

              {!sameWhatsAppNumber && (
                <input
                  type="tel"
                  inputMode="tel"
                  value={
                    whatsAppNumber
                  }
                  placeholder="WhatsApp number"
                  aria-label="WhatsApp number"
                  onChange={(event) =>
                    setWhatsAppNumber(
                      normalizePhone(
                        event.target
                          .value,
                      ),
                    )
                  }
                />
              )}

              <div className="registration-code">
                <div>
                  <span>
                    Shop code
                  </span>

                  <strong>
                    {shopCode}
                  </strong>
                </div>

                <button
                  type="button"
                  onClick={
                    regenerateCode
                  }
                >
                  Generate another
                </button>
              </div>
            </section>
          )}

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
              onClick={
                onClose
              }
            >
              Cancel
            </button>

            <button
              type="submit"
              className="registration-button registration-button--primary"
            >
              Register shop
            </button>
          </div>
        </form>
      </section>
    </div>
  );
}