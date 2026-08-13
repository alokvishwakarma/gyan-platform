import {
  type CSSProperties,
  useEffect,
  useMemo,
  useState,
} from "react";

import ShopFeaturedManager
  from "./ShopFeaturedManager";

import "./ShopHomeContent.css";

export interface ShopHomeService {
  id: number;
  code: string;
  name: string;
  catalogName: string;
  description: string;
  icon: string;
  color: string;
  enabled: boolean;
  sortOrder: number;
}

interface ShopHomeContentProps {
  shopCode?: string;

  role?:
    | "shopper"
    | "admin"
    | null;

  services:
    ShopHomeService[];

  loading: boolean;

  onServiceSelect: (
    service:
      ShopHomeService,
  ) => void;

  onOpenRequests?: () => void;
  onRequestService?: () => void;
}

function getServiceTitle(
  service:
    ShopHomeService,
): string {
  return (
    service.catalogName ||
    service.name
  );
}

function getAccent(
  service:
    ShopHomeService,
): CSSProperties {
  return {
    "--shop-service-accent":
      service.color ||
      "#2187f3",
  } as CSSProperties;
}

export default function ShopHomeContent({
  shopCode = "",
  role = null,
  services,
  loading,
  onServiceSelect,
  onOpenRequests,
  onRequestService,
}: ShopHomeContentProps) {
  const [
    showAll,
    setShowAll,
  ] =
    useState(false);

  const [
    manageFeaturedOpen,
    setManageFeaturedOpen,
  ] =
    useState(false);

  const [
    featuredCodes,
    setFeaturedCodes,
  ] =
    useState<string[]>([]);

  const enabledServices =
    useMemo(
      () =>
        [...services]
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
      if (!shopCode) {
        return undefined;
      }

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

            if (!response.ok) {
              return;
            }

            const result =
              (await response.json()) as {
                serviceCodes?:
                  string[];
              };

            if (
              !controller.signal.aborted
            ) {
              setFeaturedCodes(
                result.serviceCodes ??
                  [],
              );
            }
          } catch (
            error
          ) {
            if (
              error instanceof
                DOMException &&
              error.name ===
                "AbortError"
            ) {
              return;
            }
          }
        }
      )();

      return () =>
        controller.abort();
    },
    [shopCode],
  );

  const configuredFeatured =
    featuredCodes
      .map(
        (code) =>
          enabledServices.find(
            (service) =>
              service.code ===
              code,
          ),
      )
      .filter(
        (
          service,
        ):
          service is
            ShopHomeService =>
              Boolean(
                service,
              ),
      );

  const featuredServices =
    configuredFeatured.length >
      0
      ? configuredFeatured
      : enabledServices.slice(
          0,
          3,
        );

  const featuredSet =
    new Set(
      featuredServices.map(
        (service) =>
          service.code,
      ),
    );

  const otherServices =
    enabledServices.filter(
      (service) =>
        !featuredSet.has(
          service.code,
        ),
    );

  const visibleOtherServices =
    showAll
      ? otherServices
      : otherServices.slice(
          0,
          12,
        );

  if (loading) {
    return (
      <div className="shop-home-content__state">
        <strong>
          Loading shop services…
        </strong>
      </div>
    );
  }

  if (
    enabledServices.length ===
      0
  ) {
    return (
      <div className="shop-home-content__state">
        <strong>
          No services available
        </strong>

        <span>
          This shop has not enabled
          any services yet.
        </span>
      </div>
    );
  }

  return (
    <div className="shop-home-content">
      <section
        className="shop-home-content__section"
      >
        <div
          className="shop-home-content__heading"
        >
          <div>
            <span>
              Available from this shop
            </span>

            <h2>
              ★ Featured services
            </h2>
          </div>

          {role &&
          shopCode ? (
            <div
              className="shop-home-content__manage-actions"
            >
              {onOpenRequests && (
                <button
                  type="button"
                  onClick={
                    onOpenRequests
                  }
                >
                  💬 Requests
                </button>
              )}

              <button
                type="button"
                onClick={() =>
                  setManageFeaturedOpen(
                    true,
                  )
                }
              >
                ⚙ Manage
              </button>
            </div>
          ) : onRequestService ? (
            <div
              className="shop-home-content__public-actions"
            >
              <button
                type="button"
                onClick={
                  onRequestService
                }
              >
                + Request Service
              </button>
            </div>
          ) : null}
        </div>

        <div
          className="shop-home-content__featured-grid"
        >
          {featuredServices.map(
            (service) => (
              <button
                type="button"
                key={
                  service.code
                }
                className="shop-home-content__featured-card"
                style={
                  getAccent(
                    service,
                  )
                }
                onClick={() =>
                  onServiceSelect(
                    service,
                  )
                }
              >
                <span
                  className="shop-home-content__featured-icon"
                  aria-hidden="true"
                >
                  {
                    service.icon ||
                    "🧩"
                  }
                </span>

                <span
                  className="shop-home-content__featured-copy"
                >
                  <strong>
                    {
                      getServiceTitle(
                        service,
                      )
                    }
                  </strong>

                  <small>
                    {
                      service.description ||
                      "Request this service from the shop."
                    }
                  </small>
                </span>

                <span
                  className="shop-home-content__arrow"
                  aria-hidden="true"
                >
                  →
                </span>
              </button>
            ),
          )}
        </div>
      </section>

      <section
        className="shop-home-content__section"
      >
        <div
          className="shop-home-content__heading shop-home-content__heading--row"
        >
          <div>
            <span>
              More from this shop
            </span>

            <h2>
              Other services
            </h2>
          </div>

          {otherServices.length >
            12 && (
            <button
              type="button"
              className="shop-home-content__view-all"
              onClick={() =>
                setShowAll(
                  (current) =>
                    !current,
                )
              }
            >
              {showAll
                ? "Show less"
                : "View all"}
            </button>
          )}
        </div>

        {visibleOtherServices.length >
        0 ? (
          <div
            className="shop-home-content__service-grid"
          >
            {visibleOtherServices.map(
              (service) => (
                <button
                  type="button"
                  key={
                    service.code
                  }
                  className="shop-home-content__service-card"
                  style={
                    getAccent(
                      service,
                    )
                  }
                  onClick={() =>
                    onServiceSelect(
                      service,
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
                      getServiceTitle(
                        service,
                      )
                    }
                  </strong>
                </button>
              ),
            )}
          </div>
        ) : (
          <div
            className="shop-home-content__empty"
          >
            Additional services will
            appear here when enabled.
          </div>
        )}
      </section>

      {manageFeaturedOpen &&
      shopCode && (
        <ShopFeaturedManager
          shopCode={
            shopCode
          }
          services={
            services
          }
          onClose={() =>
            setManageFeaturedOpen(
              false,
            )
          }
          onSaved={(
            serviceCodes,
          ) =>
            setFeaturedCodes(
              serviceCodes,
            )
          }
        />
      )}
    </div>
  );
}