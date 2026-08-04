import {
  useEffect,
  useState,
} from "react";

import "./AdminShopsScreen.css";

interface AdminShopsScreenProps {
  onBack: () => void;
  onManageShop:
    (shopCode: string) =>
      void;
  onLogout: () => void;
}

interface AdminShop {
  code: string;
  name: string;
  addressLine: string;
  city: string;
}

interface ShopsResponse {
  shops?: AdminShop[];
  error?: string;
}

export default function AdminShopsScreen({
  onBack,
  onManageShop,
  onLogout,
}: AdminShopsScreenProps) {
  const [shops, setShops] =
    useState<AdminShop[]>([]);

  const [searchText, setSearchText] =
    useState("");

  const [loading, setLoading] =
    useState(true);

  const [error, setError] =
    useState("");

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
        shop.addressLine,
        shop.city,
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
          <p>Loading shops…</p>
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
                <strong>
                  {shop.name}
                </strong>

                <span>
                  {shop.addressLine}
                  {shop.city
                    ? `, ${shop.city}`
                    : ""}
                </span>
              </div>

              <button
                type="button"
                onClick={() =>
                  onManageShop(
                    shop.code,
                  )
                }
              >
                Manage
              </button>
            </article>
          ),
        )}
      </section>
    </main>
  );
}