import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./AdminShopServicesScreen.css";

interface AdminShopServicesScreenProps {
  shopCode: string;
  onBack: () => void;
}

type ShopMode =
  | "inherit"
  | "enabled"
  | "disabled";

interface ShopDetails {
  code: string;
  name: string;
  addressLine: string;
  city: string;
}

interface ShopService {
  id: number;
  code: string;
  category: string;
  subCategory: string | null;

  name: string;
  description: string;

  icon: string;
  color: string;

  globalEnabled: boolean;
  globalSortOrder: number;

  mode: ShopMode;

  overrideEnabled:
    | boolean
    | null;

  overrideSortOrder:
    | number
    | null;

  effectiveEnabled: boolean;
  effectiveSortOrder: number;
}

interface ShopServicesResponse {
  shop?: ShopDetails;
  services?: ShopService[];
  message?: string;
  error?: string;
}

interface EditableShopService {
  original: ShopService;
  mode: ShopMode;
  sortOrderText: string;
}

function createEditable(
  service: ShopService,
): EditableShopService {
  return {
    original: service,
    mode: service.mode,

    sortOrderText:
      service.overrideSortOrder ===
      null
        ? ""
        : String(
            service.overrideSortOrder,
          ),
  };
}

export default function AdminShopServicesScreen({
  shopCode,
  onBack,
}: AdminShopServicesScreenProps) {
  const [shop, setShop] =
    useState<ShopDetails | null>(
      null,
    );

  const [
    editableServices,
    setEditableServices,
  ] = useState<
    EditableShopService[]
  >([]);

  const [loading, setLoading] =
    useState(true);

  const [saving, setSaving] =
    useState(false);

  const [message, setMessage] =
    useState("");

  const [error, setError] =
    useState("");

  useEffect(() => {
    const controller =
      new AbortController();

    async function load() {
      try {
        const response =
          await fetch(
            `/api/admin/shops/${encodeURIComponent(
              shopCode,
            )}/services`,
            {
              credentials:
                "include",

              signal:
                controller.signal,
            },
          );

        const result =
          (await response.json()) as
            ShopServicesResponse;

        if (
          !response.ok ||
          !result.shop ||
          !result.services
        ) {
          throw new Error(
            result.error ??
              "Shop services could not be loaded.",
          );
        }

        setShop(result.shop);

        setEditableServices(
          result.services.map(
            createEditable,
          ),
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
            : "Shop services could not be loaded.",
        );
      } finally {
        if (
          !controller.signal.aborted
        ) {
          setLoading(false);
        }
      }
    }

    void load();

    return () => {
      controller.abort();
    };
  }, [shopCode]);

  const changedServices =
    useMemo(
      () =>
        editableServices.filter(
          (service) => {
            const originalOrder =
              service.original
                .overrideSortOrder;

            const currentOrder =
              service.sortOrderText
                ? Number(
                    service
                      .sortOrderText,
                  )
                : null;

            return (
              service.mode !==
                service.original
                  .mode ||
              currentOrder !==
                originalOrder
            );
          },
        ),
      [editableServices],
    );

  function updateMode(
    code: string,
    mode: ShopMode,
  ) {
    setEditableServices(
      (current) =>
        current.map(
          (service) =>
            service.original
              .code === code
              ? {
                  ...service,
                  mode,

                  sortOrderText:
                    mode ===
                    "inherit"
                      ? ""
                      : service
                          .sortOrderText,
                }
              : service,
        ),
    );

    setMessage("");
    setError("");
  }

  function updateOrder(
    code: string,
    value: string,
  ) {
    const cleaned =
      value
        .replace(/\D/g, "")
        .slice(0, 4);

    setEditableServices(
      (current) =>
        current.map(
          (service) =>
            service.original
              .code === code
              ? {
                  ...service,
                  sortOrderText:
                    cleaned,
                }
              : service,
        ),
    );

    setMessage("");
    setError("");
  }

  async function save() {
    if (
      changedServices.length === 0
    ) {
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
          )}/services`,
          {
            method: "PUT",

            credentials:
              "include",

            headers: {
              "content-type":
                "application/json",
            },

            body: JSON.stringify({
              services:
                changedServices.map(
                  (service) => ({
                    code:
                      service.original
                        .code,

                    mode:
                      service.mode,

                    sortOrder:
                      service
                        .sortOrderText
                        ? Number(
                            service
                              .sortOrderText,
                          )
                        : null,
                  }),
                ),
            }),
          },
        );

      const result =
        (await response.json()) as
          ShopServicesResponse;

      if (
        !response.ok ||
        !result.services
      ) {
        throw new Error(
          result.error ??
            "Changes could not be saved.",
        );
      }

      setEditableServices(
        result.services.map(
          createEditable,
        ),
      );

      setMessage(
        result.message ??
          "Changes saved.",
      );
    } catch (caughtError) {
      setError(
        caughtError instanceof Error
          ? caughtError.message
          : "Changes could not be saved.",
      );
    } finally {
      setSaving(false);
    }
  }

  return (
    <main className="admin-shop-services">
      <header className="admin-shop-services__header">
        <button
          type="button"
          onClick={onBack}
        >
          ←
        </button>

        <div>
          <strong>
            {shop?.code ??
              shopCode}
          </strong>

          <span>
            {shop?.name ??
              "Shop Services"}
          </span>
        </div>

        <button
          type="button"
          disabled={
            saving ||
            changedServices.length ===
              0
          }
          onClick={() => {
            void save();
          }}
        >
          {saving
            ? "Saving…"
            : "Save"}
        </button>
      </header>

      <section className="admin-shop-services__content">
        {loading && (
          <p>Loading services…</p>
        )}

        {error && (
          <p className="admin-shop-services__error">
            {error}
          </p>
        )}

        {message && (
          <p className="admin-shop-services__success">
            ✓ {message}
          </p>
        )}

        {editableServices.map(
          (service) => {
            const effectiveEnabled =
              service.mode ===
              "inherit"
                ? service.original
                    .globalEnabled
                : service.mode ===
                    "enabled";

            return (
              <article
                key={
                  service.original
                    .code
                }
                className="admin-shop-service"
              >
                <div
                  className="admin-shop-service__icon"
                  style={{
                    backgroundColor:
                      service.original
                        .color,
                  }}
                >
                  {
                    service.original
                      .icon
                  }
                </div>

                <div className="admin-shop-service__details">
                  <strong>
                    {
                      service.original
                        .name
                    }
                  </strong>

                  <span>
                    Global:{" "}
                    {service.original
                      .globalEnabled
                      ? "Enabled"
                      : "Disabled"}
                    {" · "}
                    Effective:{" "}
                    {effectiveEnabled
                      ? "Enabled"
                      : "Disabled"}
                  </span>
                </div>

                <select
                  value={
                    service.mode
                  }
                  aria-label={`Shop setting for ${service.original.name}`}
                  onChange={(
                    event,
                  ) =>
                    updateMode(
                      service.original
                        .code,

                      event.target
                        .value as
                        ShopMode,
                    )
                  }
                >
                  <option value="inherit">
                    Inherit global
                  </option>

                  <option value="enabled">
                    Enable for shop
                  </option>

                  <option value="disabled">
                    Disable for shop
                  </option>
                </select>

                <label>
                  <span>Order</span>

                  <input
                    type="text"
                    inputMode="numeric"
                    value={
                      service
                        .sortOrderText
                    }
                    disabled={
                      service.mode ===
                      "inherit"
                    }
                    placeholder={String(
                      service.original
                        .globalSortOrder,
                    )}
                    onChange={(
                      event,
                    ) =>
                      updateOrder(
                        service.original
                          .code,

                        event.target
                          .value,
                      )
                    }
                  />
                </label>
              </article>
            );
          },
        )}
      </section>
    </main>
  );
}