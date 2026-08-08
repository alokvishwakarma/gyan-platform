import {
  useEffect,
  useState,
} from "react";

import "./AdminShopInfoScreen.css";

interface AdminShopInfoScreenProps {
  shopCode: string;
  onBack: () => void;
}

interface AdminShopInformation {
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

  status:
    | "active"
    | "inactive";

  createdAt: string;
  updatedAt: string;
}

interface ShopInformationResponse {
  shop?:
    AdminShopInformation;

  message?: string;
  error?: string;
}

function sanitizePhone(
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

export default function AdminShopInfoScreen({
  shopCode,
  onBack,
}: AdminShopInfoScreenProps) {
  const [
    shop,
    setShop,
  ] = useState<
    AdminShopInformation | null
  >(null);

  const [
    loading,
    setLoading,
  ] = useState(true);

  const [
    saving,
    setSaving,
  ] = useState(false);

  const [
    error,
    setError,
  ] = useState("");

  const [
    message,
    setMessage,
  ] = useState("");

  const [
    showMore,
    setShowMore,
  ] = useState(false);

  useEffect(() => {
    const controller =
      new AbortController();

    async function loadShop():
      Promise<void> {
      try {
        const response =
          await fetch(
            `/api/admin/shops/${encodeURIComponent(
              shopCode,
            )}`,
            {
              credentials:
                "include",

              signal:
                controller.signal,
            },
          );

        const result =
          (await response.json()) as
            ShopInformationResponse;

        if (
          !response.ok ||
          !result.shop
        ) {
          throw new Error(
            result.error ??
              "Shop information could not be loaded.",
          );
        }

        setShop(result.shop);
      } catch (caughtError) {
        if (
          caughtError instanceof
            DOMException &&
          caughtError.name ===
            "AbortError"
        ) {
          return;
        }

        setError(
          caughtError instanceof Error
            ? caughtError.message
            : "Shop information could not be loaded.",
        );
      } finally {
        if (
          !controller.signal.aborted
        ) {
          setLoading(false);
        }
      }
    }

    void loadShop();

    return () => {
      controller.abort();
    };
  }, [shopCode]);

  function updateField<
    Key extends keyof
      AdminShopInformation,
  >(
    key: Key,
    value:
      AdminShopInformation[Key],
  ): void {
    setShop(
      (current) =>
        current
          ? {
              ...current,
              [key]: value,
            }
          : current,
    );

    setMessage("");
    setError("");
  }

  async function saveShop():
    Promise<void> {
    if (!shop) {
      return;
    }

    if (
      !shop.name.trim() ||
      !shop.addressLine.trim()
    ) {
      setError(
        "Please enter the shop name and street / area.",
      );

      return;
    }

    const hasPhone =
      shop.phoneNumber
        .replace(
          /\D/g,
          "",
        )
        .length >= 7;

    const hasValidEmail =
      /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        shop.emailAddress.trim(),
      );

    if (
      !hasPhone &&
      !hasValidEmail
    ) {
      setError(
        "Please enter a phone / WhatsApp number or a valid email address.",
      );

      return;
    }

    if (
      shop.emailAddress.trim() &&
      !hasValidEmail
    ) {
      setError(
        "Please enter a valid email address.",
      );

      return;
    }

    setSaving(true);
    setMessage("");
    setError("");

    try {
      const response =
        await fetch(
          `/api/admin/shops/${encodeURIComponent(
            shopCode,
          )}`,
          {
            method: "PUT",

            credentials:
              "include",

            headers: {
              "content-type":
                "application/json",
            },

            body: JSON.stringify({
              name:
                shop.name.trim(),

              ownerName:
                shop.ownerName.trim(),

              phoneNumber:
                shop.phoneNumber.trim(),

              whatsAppNumber:
                shop.whatsAppNumber.trim(),

              emailAddress:
                shop.emailAddress.trim(),

              addressLine:
                shop.addressLine.trim(),

              city:
                shop.city.trim(),

              state:
                shop.state.trim(),

              postalCode:
                shop.postalCode.trim(),

              status:
                shop.status,
            }),
          },
        );

      const result =
        (await response.json()) as
          ShopInformationResponse;

      if (
        !response.ok ||
        !result.shop
      ) {
        throw new Error(
          result.error ??
            "Shop information could not be saved.",
        );
      }

      setShop(result.shop);

      setMessage(
        result.message ??
          "Shop information saved.",
      );
    } catch (caughtError) {
      setError(
        caughtError instanceof Error
          ? caughtError.message
          : "Shop information could not be saved.",
      );
    } finally {
      setSaving(false);
    }
  }

  return (
    <main className="admin-shop-info">
      <header className="admin-shop-info__header">
        <button
          type="button"
          className="admin-shop-info__brand"
          onClick={onBack}
          aria-label="Back to shops"
        >
          <span
            className="admin-shop-info__brand-icon"
            aria-hidden="true"
          >
            📖
          </span>

          <span className="admin-shop-info__brand-copy">
            <strong>
              GYAN
            </strong>

            <small>
              Shop Information
            </small>
          </span>
        </button>

        <span className="admin-shop-info__code">
          {shopCode}
        </span>
      </header>

      <section className="admin-shop-info__content">
        {loading && (
          <p className="admin-shop-info__state">
            Loading shop…
          </p>
        )}

        {error && (
          <p className="admin-shop-info__error">
            {error}
          </p>
        )}

        {shop && (
          <form
            className="admin-shop-info__form"
            onSubmit={(event) => {
              event.preventDefault();

              void saveShop();
            }}
          >
            <div className="admin-shop-info__heading">
              <span>
                Shop administration
              </span>

              <h1>
                {shop.name ||
                  "Shop information"}
              </h1>
            </div>

            <section className="admin-shop-info__compact">
              <input
                type="text"
                value={shop.name}
                placeholder="Shop name"
                aria-label="Shop name"
                maxLength={150}
                onChange={(event) =>
                  updateField(
                    "name",
                    event.target.value,
                  )
                }
              />

              <div className="admin-shop-info__contact-row">
                <input
                  type="tel"
                  inputMode="tel"
                  value={
                    shop.phoneNumber
                  }
                  placeholder="Phone / WhatsApp"
                  aria-label="Phone or WhatsApp"
                  maxLength={40}
                  onChange={(event) =>
                    updateField(
                      "phoneNumber",
                      sanitizePhone(
                        event.target.value,
                      ),
                    )
                  }
                />

                <input
                  type="email"
                  value={
                    shop.emailAddress
                  }
                  placeholder="Email"
                  aria-label="Email"
                  maxLength={254}
                  onChange={(event) =>
                    updateField(
                      "emailAddress",
                      event.target.value,
                    )
                  }
                />
              </div>

              <textarea
                rows={2}
                value={
                  shop.addressLine
                }
                placeholder="Street / area"
                aria-label="Street or area"
                maxLength={250}
                onChange={(event) =>
                  updateField(
                    "addressLine",
                    event.target.value,
                  )
                }
              />

              <select
                value={shop.status}
                aria-label="Shop status"
                onChange={(event) =>
                  updateField(
                    "status",
                    event.target
                      .value as
                      | "active"
                      | "inactive",
                  )
                }
              >
                <option value="active">
                  Active
                </option>

                <option value="inactive">
                  Inactive
                </option>
              </select>
            </section>

            <button
              type="button"
              className="admin-shop-info__more"
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
              <section className="admin-shop-info__more-fields">
                <input
                  type="text"
                  value={
                    shop.ownerName
                  }
                  placeholder="Owner / manager name"
                  aria-label="Owner or manager name"
                  maxLength={150}
                  onChange={(event) =>
                    updateField(
                      "ownerName",
                      event.target.value,
                    )
                  }
                />

                <input
                  type="tel"
                  inputMode="tel"
                  value={
                    shop.whatsAppNumber
                  }
                  placeholder="Separate WhatsApp number"
                  aria-label="Separate WhatsApp number"
                  maxLength={40}
                  onChange={(event) =>
                    updateField(
                      "whatsAppNumber",
                      sanitizePhone(
                        event.target.value,
                      ),
                    )
                  }
                />

                <div className="admin-shop-info__location-row">
                  <input
                    type="text"
                    value={shop.city}
                    placeholder="City"
                    aria-label="City"
                    maxLength={100}
                    onChange={(event) =>
                      updateField(
                        "city",
                        event.target.value,
                      )
                    }
                  />

                  <input
                    type="text"
                    value={shop.state}
                    placeholder="State"
                    aria-label="State"
                    maxLength={100}
                    onChange={(event) =>
                      updateField(
                        "state",
                        event.target.value,
                      )
                    }
                  />

                  <input
                    type="text"
                    value={
                      shop.postalCode
                    }
                    placeholder="PIN / ZIP"
                    aria-label="PIN or ZIP"
                    maxLength={30}
                    onChange={(event) =>
                      updateField(
                        "postalCode",
                        event.target.value,
                      )
                    }
                  />
                </div>

                <div className="admin-shop-info__immutable">
                  <span>
                    Shop code
                  </span>

                  <strong>
                    {shop.code}
                  </strong>

                  <small>
                    Used by QR codes and
                    requests. It cannot be
                    changed.
                  </small>
                </div>
              </section>
            )}

            {message && (
              <p className="admin-shop-info__success">
                ✓ {message}
              </p>
            )}

            <div className="admin-shop-info__actions">
              <button
                type="button"
                disabled={saving}
                onClick={onBack}
              >
                Cancel
              </button>

              <button
                type="submit"
                disabled={saving}
              >
                {saving
                  ? "Saving…"
                  : "Save changes"}
              </button>
            </div>
          </form>
        )}
      </section>
    </main>
  );
}