import {
  useEffect,
  useState,
} from "react";

import "./AdminShopsScreen.css";

interface AdminShopsScreenProps {
  onBack: () => void;

  onManageInformation:
    (shopCode: string) =>
      void;

  onManageServices:
    (shopCode: string) =>
      void;

  onLogout: () => void;
}

interface AdminShop {
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
  status: string;
}

interface ShopsResponse {
  shops?: AdminShop[];
  error?: string;
}

export default function AdminShopsScreen({
  onBack,
  onManageInformation,
  onManageServices,
  onLogout,
}: AdminShopsScreenProps) {
  const [
    shops,
    setShops,
  ] = useState<
    AdminShop[]
  >([]);

  const [
    searchText,
    setSearchText,
  ] = useState("");

  const [
    loading,
    setLoading,
  ] = useState(true);

  const [
    error,
    setError,
  ] = useState("");

  useEffect(() => {
    const controller =
      new AbortController();

    async function loadShops() {
      try {
        const response =
          await fetch(
            "/api/admin/shops",
            {
              credentials:
                "include",

              signal:
                controller.signal,
            },
          );

        const result =
          (await response.json()) as
            ShopsResponse;

        if (!response.ok) {
          throw new Error(
            result.error ??
              "Shops could not be loaded.",
          );
        }

        setShops(
          result.shops ?? [],
        );
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
            : "Shops could not be loaded.",
        );
      } finally {
        if (
          !controller.signal.aborted
        ) {
          setLoading(false);
        }
      }
    }

    void loadShops();

    return () => {
      controller.abort();
    };
  }, []);

  const visibleShops =
    shops.filter((shop) => {
      const search =
        searchText
          .trim()
          .toLowerCase();

      if (!search) {
        return true;
      }

      return [
        shop.code,
        shop.name,
        shop.ownerName,
        shop.phoneNumber,
        shop.emailAddress,
        shop.addressLine,
        shop.city,
        shop.state,
        shop.postalCode,
        shop.status,
      ]
        .join(" ")
        .toLowerCase()
        .includes(search);
    });

  return (
    <main className="admin-shops">
      <header className="admin-shops__header">
        <button
          type="button"
          onClick={onBack}
          aria-label="Back"
        >
          ←
        </button>

        <div>
          <strong>
            GYAN CONTROL CENTER
          </strong>

          <span>
            Registered Shops
          </span>
        </div>

        <button
          type="button"
          onClick={onLogout}
        >
          Logout
        </button>
      </header>

      <section className="admin-shops__toolbar">
        <input
          type="search"
          value={searchText}
          placeholder="Search shops…"
          onChange={(event) =>
            setSearchText(
              event.target.value,
            )
          }
        />
      </section>

      <section className="admin-shops__content">
        {loading && (
          <p>
            Loading shops…
          </p>
        )}

        {error && (
          <p className="admin-shops__error">
            {error}
          </p>
        )}

        {!loading &&
          !error &&
          visibleShops.length ===
            0 && (
            <p>
              No matching shops.
            </p>
          )}

        {visibleShops.map(
          (shop) => (
            <article
              key={shop.code}
              className="admin-shop-card"
            >
              <div className="admin-shop-card__code">
                {shop.code}
              </div>

              <div className="admin-shop-card__details">
                <div className="admin-shop-card__title">
                  <strong>
                    {shop.name}
                  </strong>

                  <span
                    className={`admin-shop-card__status admin-shop-card__status--${shop.status}`}
                  >
                    {shop.status}
                  </span>
                </div>

                <span>
                  {shop.addressLine}
                  {shop.city
                    ? `, ${shop.city}`
                    : ""}
                </span>

                <small>
                  {shop.ownerName}
                  {shop.phoneNumber
                    ? ` · ${shop.phoneNumber}`
                    : ""}
                </small>
              </div>

              <div className="admin-shop-card__actions">
                <button
                  type="button"
                  onClick={() =>
                    onManageInformation(
                      shop.code,
                    )
                  }
                >
                  Information
                </button>

                <button
                  type="button"
                  onClick={() =>
                    onManageServices(
                      shop.code,
                    )
                  }
                >
                  Services
                </button>
              </div>
            </article>
          ),
        )}
      </section>
    </main>
  );
}