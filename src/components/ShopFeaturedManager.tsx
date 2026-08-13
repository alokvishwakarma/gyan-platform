import {
  useEffect,
  useMemo,
  useState,
} from "react";

import {
  type ShopHomeService,
} from "./ShopHomeContent";

import "./ShopFeaturedManager.css";

interface ShopFeaturedManagerProps {
  shopCode: string;
  services: ShopHomeService[];
  onClose: () => void;
  onSaved: (
    serviceCodes: string[],
  ) => void;
}

export default function ShopFeaturedManager({
  shopCode,
  services,
  onClose,
  onSaved,
}: ShopFeaturedManagerProps) {
  const [
    selected,
    setSelected,
  ] =
    useState<string[]>([]);

  const [
    loading,
    setLoading,
  ] =
    useState(true);

  const [
    saving,
    setSaving,
  ] =
    useState(false);

  const [
    error,
    setError,
  ] =
    useState("");

  const enabledServices =
    useMemo(
      () =>
        services
          .filter(
            (service) =>
              service.enabled,
          )
          .sort(
            (
              first,
              second,
            ) =>
              first.sortOrder -
                second.sortOrder ||
              first.name.localeCompare(
                second.name,
              ),
          ),
      [services],
    );

  useEffect(
    () => {
      const controller =
        new AbortController();

      void (
        async () => {
          try {
            const response =
              await fetch(
                `/api/shops/${encodeURIComponent(
                  shopCode,
                )}/featured-services`,
                {
                  credentials:
                    "include",

                  signal:
                    controller.signal,
                },
              );

            const result =
              (await response.json()) as {
                serviceCodes?:
                  string[];

                error?:
                  string;
              };

            if (!response.ok) {
              throw new Error(
                result.error ??
                  "Featured services could not be loaded.",
              );
            }

            setSelected(
              result.serviceCodes ??
                [],
            );
          } catch (
            caughtError
          ) {
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
                : "Featured services could not be loaded.",
            );
          } finally {
            if (
              !controller.signal.aborted
            ) {
              setLoading(
                false,
              );
            }
          }
        }
      )();

      return () =>
        controller.abort();
    },
    [shopCode],
  );

  function toggle(
    serviceCode: string,
  ): void {
    setSelected(
      (current) => {
        if (
          current.includes(
            serviceCode,
          )
        ) {
          return current.filter(
            (code) =>
              code !==
              serviceCode,
          );
        }

        if (
          current.length >=
          3
        ) {
          return current;
        }

        return [
          ...current,
          serviceCode,
        ];
      },
    );
  }

  async function save():
    Promise<void> {
    setSaving(true);
    setError("");

    try {
      const response =
        await fetch(
          `/api/shops/${encodeURIComponent(
            shopCode,
          )}/featured-services`,
          {
            method:
              "PUT",

            credentials:
              "include",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                serviceCodes:
                  selected,
              }),
          },
        );

      const result =
        (await response.json()) as {
          serviceCodes?:
            string[];

          error?:
            string;
        };

      if (!response.ok) {
        throw new Error(
          result.error ??
            "Featured services could not be saved.",
        );
      }

      onSaved(
        result.serviceCodes ??
          selected,
      );

      onClose();
    } catch (
      caughtError
    ) {
      setError(
        caughtError instanceof
          Error
          ? caughtError.message
          : "Featured services could not be saved.",
      );
    } finally {
      setSaving(false);
    }
  }

  return (
    <div
      className="shop-featured-manager__overlay"
      onClick={onClose}
    >
      <section
        className="shop-featured-manager"
        role="dialog"
        aria-modal="true"
        aria-label="Manage featured services"
        onClick={(event) =>
          event.stopPropagation()
        }
      >
        <header>
          <div>
            <small>
              SHOP MANAGEMENT
            </small>

            <h2>
              ★ Featured services
            </h2>
          </div>

          <button
            type="button"
            aria-label="Close"
            onClick={onClose}
          >
            ×
          </button>
        </header>

        <p>
          Choose up to three enabled
          services to feature at the top
          of this shop.
        </p>

        {error && (
          <div
            className="shop-featured-manager__error"
          >
            {error}
          </div>
        )}

        {loading ? (
          <div
            className="shop-featured-manager__state"
          >
            Loading…
          </div>
        ) : (
          <div
            className="shop-featured-manager__list"
          >
            {enabledServices.map(
              (service) => {
                const checked =
                  selected.includes(
                    service.code,
                  );

                return (
                  <button
                    type="button"
                    key={
                      service.code
                    }
                    className={
                      checked
                        ? "shop-featured-manager__service shop-featured-manager__service--selected"
                        : "shop-featured-manager__service"
                    }
                    onClick={() =>
                      toggle(
                        service.code,
                      )
                    }
                  >
                    <span
                      aria-hidden="true"
                    >
                      {
                        service.icon ||
                        "🧩"
                      }
                    </span>

                    <strong>
                      {
                        service.catalogName ||
                        service.name
                      }
                    </strong>

                    <b>
                      {checked
                        ? selected.indexOf(
                            service.code,
                          ) + 1
                        : "+"}
                    </b>
                  </button>
                );
              },
            )}
          </div>
        )}

        <footer>
          <span>
            {selected.length}/3 selected
          </span>

          <button
            type="button"
            disabled={
              saving ||
              loading
            }
            onClick={() =>
              void save()
            }
          >
            {saving
              ? "Saving…"
              : "Save featured"}
          </button>
        </footer>
      </section>
    </div>
  );
}
