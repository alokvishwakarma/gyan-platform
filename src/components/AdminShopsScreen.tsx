import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./AdminShopsScreen.css";

interface AdminShopsScreenProps {
  onBack: () => void;

  onManageInformation:
    (shopCode: string) => void;

  onManageServices:
    (shopCode: string) => void;

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

function compactParts(
  parts:
    Array<
      string | null | undefined
    >,
): string {
  return parts
    .map(
      (part) =>
        part?.trim() ?? "",
    )
    .filter(Boolean)
    .join(", ");
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
  ] =
    useState<AdminShop[]>(
      [],
    );

  const [
    searchText,
    setSearchText,
  ] =
    useState("");

  const [
    loading,
    setLoading,
  ] =
    useState(true);

  const [
    error,
    setError,
  ] =
    useState("");

  useEffect(() => {
    const controller =
      new AbortController();

    async function loadShops():
      Promise<void> {
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
          caughtError instanceof
            Error
            ? caughtError.message
            : "Shops could not be loaded.",
        );
      } finally {
        if (
          !controller.signal
            .aborted
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
    useMemo(
      () => {
        const search =
          searchText
            .trim()
            .toLowerCase();

        if (!search) {
          return shops;
        }

        return shops.filter(
          (shop) =>
            [
              shop.code,
              shop.name,
              shop.ownerName,
              shop.phoneNumber,
              shop.whatsAppNumber,
              shop.emailAddress,
              shop.addressLine,
              shop.city,
              shop.state,
              shop.postalCode,
              shop.status,
            ]
              .join(" ")
              .toLowerCase()
              .includes(
                search,
              ),
        );
      },
      [
        shops,
        searchText,
      ],
    );

  return (
    <main className="admin-shops">
      <header className="admin-shops__header">
        <button
          type="button"
          className="admin-shops__brand"
          onClick={onBack}
          aria-label="Return to admin"
        >
          <span
            className="admin-shops__brand-icon"
            aria-hidden="true"
          >
            📖
          </span>

          <span className="admin-shops__brand-copy">
            <strong>
              GYAN
            </strong>

            <small>
              Registered Shops
            </small>
          </span>
        </button>

        <button
          type="button"
          className="admin-shops__logout"
          onClick={onLogout}
        >
          Logout
        </button>
      </header>

      <section className="admin-shops__content">
        <div className="admin-shops__heading-row">
          <div>
            <span>
              Platform administration
            </span>

            <h1>
              Shops
            </h1>
          </div>

          <span className="admin-shops__count">
            {visibleShops.length}
          </span>
        </div>

        <div className="admin-shops__search">
          <span
            aria-hidden="true"
          >
            🔎
          </span>

          <input
            type="search"
            value={searchText}
            placeholder="Search shops..."
            aria-label="Search shops"
            onChange={(event) =>
              setSearchText(
                event.target.value,
              )
            }
          />

          {searchText && (
            <button
              type="button"
              aria-label="Clear search"
              onClick={() =>
                setSearchText(
                  "",
                )
              }
            >
              ×
            </button>
          )}
        </div>

        {loading && (
          <p className="admin-shops__state">
            Loading shops…
          </p>
        )}

        {error && (
          <p className="admin-shops__state admin-shops__state--error">
            {error}
          </p>
        )}

        {!loading &&
          !error &&
          visibleShops.length ===
            0 && (
            <p className="admin-shops__state">
              No matching shops.
            </p>
          )}

        <div className="admin-shops__list">
          {visibleShops.map(
            (shop) => {
              const address =
                compactParts([
                  shop.addressLine,
                  shop.city,
                  shop.state,
                  shop.postalCode,
                ]);

              const contact =
                compactParts([
                  shop.ownerName,
                  shop.phoneNumber,
                ]);

              return (
                <article
                  key={shop.code}
                  className="admin-shop-card"
                >
                  <div className="admin-shop-card__top">
                    <div className="admin-shop-card__identity">
                      <span className="admin-shop-card__code">
                        {shop.code}
                      </span>

                      <div className="admin-shop-card__title">
                        <strong>
                          {shop.name}
                        </strong>

                        <span
                          className={`admin-shop-card__status admin-shop-card__status--${shop.status
                            .trim()
                            .toLowerCase()}`}
                        >
                          {shop.status}
                        </span>
                      </div>
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
                        Info
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
                  </div>

                  {(address ||
                    contact ||
                    shop.emailAddress) && (
                    <div className="admin-shop-card__meta">
                      {address && (
                        <span>
                          📍 {address}
                        </span>
                      )}

                      {contact && (
                        <span>
                          👤 {contact}
                        </span>
                      )}

                      {shop.emailAddress && (
                        <span>
                          ✉️{" "}
                          {
                            shop.emailAddress
                          }
                        </span>
                      )}
                    </div>
                  )}
                </article>
              );
            },
          )}
        </div>
      </section>
    </main>
  );
}