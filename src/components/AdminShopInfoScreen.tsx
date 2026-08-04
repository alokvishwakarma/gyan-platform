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

  useEffect(() => {
    const controller =
      new AbortController();

    async function loadShop() {
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
  ) {
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

  async function saveShop() {
    if (!shop) {
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
                shop.name,

              ownerName:
                shop.ownerName,

              phoneNumber:
                shop.phoneNumber,

              whatsAppNumber:
                shop.whatsAppNumber,

              emailAddress:
                shop.emailAddress,

              addressLine:
                shop.addressLine,

              city:
                shop.city,

              state:
                shop.state,

              postalCode:
                shop.postalCode,

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
          onClick={onBack}
          aria-label="Back to shops"
        >
          ←
        </button>

        <div>
          <strong>
            GYAN CONTROL CENTER
          </strong>

          <span>
            Shop Information
          </span>
        </div>

        <span className="admin-shop-info__code">
          {shopCode}
        </span>
      </header>

      <section className="admin-shop-info__content">
        {loading && (
          <p>
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
            <section>
              <h2>
                Identity
              </h2>

              <label>
                <span>
                  Shop code
                </span>

                <input
                  type="text"
                  value={shop.code}
                  disabled
                />

                <small>
                  The shop code cannot be
                  changed because it is used
                  by QR codes and orders.
                </small>
              </label>

              <label>
                <span>
                  Shop name
                </span>

                <input
                  type="text"
                  value={shop.name}
                  required
                  maxLength={150}
                  onChange={(event) =>
                    updateField(
                      "name",
                      event.target.value,
                    )
                  }
                />
              </label>

              <label>
                <span>
                  Owner name
                </span>

                <input
                  type="text"
                  value={
                    shop.ownerName
                  }
                  required
                  maxLength={150}
                  onChange={(event) =>
                    updateField(
                      "ownerName",
                      event.target.value,
                    )
                  }
                />
              </label>

              <label>
                <span>
                  Status
                </span>

                <select
                  value={shop.status}
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
              </label>
            </section>

            <section>
              <h2>
                Contact
              </h2>

              <label>
                <span>
                  Mobile number
                </span>

                <input
                  type="tel"
                  value={
                    shop.phoneNumber
                  }
                  required
                  maxLength={40}
                  onChange={(event) =>
                    updateField(
                      "phoneNumber",
                      event.target.value,
                    )
                  }
                />
              </label>

              <label>
                <span>
                  WhatsApp number
                </span>

                <input
                  type="tel"
                  value={
                    shop.whatsAppNumber
                  }
                  maxLength={40}
                  placeholder="919876543210"
                  onChange={(event) =>
                    updateField(
                      "whatsAppNumber",
                      event.target.value,
                    )
                  }
                />
              </label>

              <label>
                <span>
                  Email address
                </span>

                <input
                  type="email"
                  value={
                    shop.emailAddress
                  }
                  maxLength={254}
                  placeholder="shop@example.com"
                  onChange={(event) =>
                    updateField(
                      "emailAddress",
                      event.target.value,
                    )
                  }
                />
              </label>
            </section>

            <section>
              <h2>
                Address
              </h2>

              <label>
                <span>
                  Address line
                </span>

                <textarea
                  rows={2}
                  value={
                    shop.addressLine
                  }
                  required
                  maxLength={250}
                  onChange={(event) =>
                    updateField(
                      "addressLine",
                      event.target.value,
                    )
                  }
                />
              </label>

              <div className="admin-shop-info__grid">
                <label>
                  <span>
                    City
                  </span>

                  <input
                    type="text"
                    value={shop.city}
                    required
                    maxLength={100}
                    onChange={(event) =>
                      updateField(
                        "city",
                        event.target.value,
                      )
                    }
                  />
                </label>

                <label>
                  <span>
                    State
                  </span>

                  <input
                    type="text"
                    value={shop.state}
                    required
                    maxLength={100}
                    onChange={(event) =>
                      updateField(
                        "state",
                        event.target.value,
                      )
                    }
                  />
                </label>
              </div>

              <label>
                <span>
                  Postal code
                </span>

                <input
                  type="text"
                  value={
                    shop.postalCode
                  }
                  required
                  maxLength={30}
                  onChange={(event) =>
                    updateField(
                      "postalCode",
                      event.target.value,
                    )
                  }
                />
              </label>
            </section>

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
                  : "Save shop information"}
              </button>
            </div>
          </form>
        )}
      </section>
    </main>
  );
}