import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./AdminServicesScreen.css";

interface AdminServicesScreenProps {
  onExit: () => void;
  onOpenShops: () => void;

  onConfigureService: (
    serviceCode: string,
    serviceName: string,
  ) => void;
}

interface AdminService {
  id: number;
  code: string;

  type:
    | "system"
    | "custom";

  category: string;

  subCategory:
    | string
    | null;

  name: string;
  description: string;

  icon: string;
  color: string;

  workflowType: string;

  enabled: boolean;
  sortOrder: number;

  createdAt: string;
  updatedAt: string;
}

interface AdminServicesResponse {
  services?: AdminService[];
  message?: string;
  error?: string;
}

interface EditableService {
  original: AdminService;
  enabled: boolean;
  sortOrderText: string;
}

type ServiceFilter =
  | "all"
  | "active"
  | "inactive";

function createEditableService(
  service: AdminService,
): EditableService {
  return {
    original: service,
    enabled: service.enabled,

    sortOrderText:
      String(
        service.sortOrder,
      ),
  };
}

function getCategoryTitle(
  category: string,
): string {
  const knownTitles:
    Record<string, string> = {
      documents:
        "Documents",

      education:
        "Education",

      government:
        "Government",
    };

  return (
    knownTitles[category] ??
    category
      .replace(
        /[_-]+/g,
        " ",
      )
      .replace(
        /\b\w/g,
        (character) =>
          character.toUpperCase(),
      )
  );
}

export default function AdminServicesScreen({
  onExit,
  onOpenShops,
  onConfigureService,
}: AdminServicesScreenProps) {
  const [
    editableServices,
    setEditableServices,
  ] = useState<
    EditableService[]
  >([]);

  const [
    searchText,
    setSearchText,
  ] = useState("");

  const [
    filter,
    setFilter,
  ] = useState<ServiceFilter>(
    "all",
  );

  const [
    isLoading,
    setIsLoading,
  ] = useState(true);

  const [
    isSaving,
    setIsSaving,
  ] = useState(false);

  const [
    statusMessage,
    setStatusMessage,
  ] = useState("");

  const [
    errorMessage,
    setErrorMessage,
  ] = useState("");

  useEffect(() => {
    const abortController =
      new AbortController();

    async function loadServices() {
      try {
        const response =
          await fetch(
            "/api/admin/services",
            {
              credentials:
                "include",

              signal:
                abortController.signal,
            },
          );

        const result =
          (await response.json()) as
            AdminServicesResponse;

        if (
          response.status ===
          401
        ) {
          onExit();
          return;
        }

        if (
          !response.ok ||
          !result.services
        ) {
          throw new Error(
            result.error ??
              "Services could not be loaded.",
          );
        }

        setEditableServices(
          result.services.map(
            createEditableService,
          ),
        );
      } catch (error) {
        if (
          error instanceof
            DOMException &&
          error.name ===
            "AbortError"
        ) {
          return;
        }

        setErrorMessage(
          error instanceof Error
            ? error.message
            : "Services could not be loaded.",
        );
      } finally {
        if (
          !abortController
            .signal
            .aborted
        ) {
          setIsLoading(
            false,
          );
        }
      }
    }

    void loadServices();

    return () => {
      abortController.abort();
    };
  }, [onExit]);

  const changedServices =
    useMemo(
      () =>
        editableServices.filter(
          (service) => {
            const parsedOrder =
              Number(
                service
                  .sortOrderText,
              );

            return (
              service.enabled !==
                service.original
                  .enabled ||
              parsedOrder !==
                service.original
                  .sortOrder
            );
          },
        ),
      [editableServices],
    );

  const hasInvalidOrders =
    editableServices.some(
      (service) => {
        if (
          service
            .sortOrderText
            .trim() === ""
        ) {
          return true;
        }

        const order =
          Number(
            service
              .sortOrderText,
          );

        return (
          !Number.isInteger(
            order,
          ) ||
          order < 0 ||
          order > 9999
        );
      },
    );

  const groupedServices =
    useMemo(
      () => {
        const normalizedSearch =
          searchText
            .trim()
            .toLowerCase();

        const filtered =
          editableServices
            .filter(
              (service) => {
                if (
                  filter ===
                    "active" &&
                  !service.enabled
                ) {
                  return false;
                }

                if (
                  filter ===
                    "inactive" &&
                  service.enabled
                ) {
                  return false;
                }

                if (
                  !normalizedSearch
                ) {
                  return true;
                }

                const searchableText =
                  [
                    service
                      .original
                      .name,

                    service
                      .original
                      .code,

                    service
                      .original
                      .category,

                    service
                      .original
                      .subCategory ??
                      "",

                    service
                      .original
                      .description,
                  ]
                    .join(" ")
                    .toLowerCase();

                return searchableText.includes(
                  normalizedSearch,
                );
              },
            )
            .sort(
              (
                first,
                second,
              ) => {
                const categoryComparison =
                  first
                    .original
                    .category
                    .localeCompare(
                      second
                        .original
                        .category,
                    );

                if (
                  categoryComparison !==
                  0
                ) {
                  return categoryComparison;
                }

                const firstOrder =
                  Number(
                    first
                      .sortOrderText,
                  );

                const secondOrder =
                  Number(
                    second
                      .sortOrderText,
                  );

                const orderComparison =
                  firstOrder -
                  secondOrder;

                if (
                  Number.isFinite(
                    orderComparison,
                  ) &&
                  orderComparison !==
                    0
                ) {
                  return orderComparison;
                }

                return first
                  .original
                  .name
                  .localeCompare(
                    second
                      .original
                      .name,
                  );
              },
            );

        const groups =
          new Map<
            string,
            EditableService[]
          >();

        for (
          const service
          of filtered
        ) {
          const category =
            service
              .original
              .category;

          const existing =
            groups.get(
              category,
            ) ?? [];

          existing.push(
            service,
          );

          groups.set(
            category,
            existing,
          );
        }

        return Array.from(
          groups.entries(),
        );
      },
      [
        editableServices,
        searchText,
        filter,
      ],
    );

  function updateEnabled(
    serviceCode: string,
    enabled: boolean,
  ) {
    setEditableServices(
      (current) =>
        current.map(
          (service) =>
            service
              .original
              .code ===
            serviceCode
              ? {
                  ...service,
                  enabled,
                }
              : service,
        ),
    );

    setStatusMessage("");
    setErrorMessage("");
  }

  function updateSortOrder(
    serviceCode: string,
    value: string,
  ) {
    const numericValue =
      value.replace(
        /\D/g,
        "",
      );

    setEditableServices(
      (current) =>
        current.map(
          (service) =>
            service
              .original
              .code ===
            serviceCode
              ? {
                  ...service,

                  sortOrderText:
                    numericValue.slice(
                      0,
                      4,
                    ),
                }
              : service,
        ),
    );

    setStatusMessage("");
    setErrorMessage("");
  }

  function discardChanges() {
    setEditableServices(
      (current) =>
        current.map(
          (service) =>
            createEditableService(
              service.original,
            ),
        ),
    );

    setStatusMessage(
      "Unsaved changes discarded.",
    );

    setErrorMessage("");
  }

  async function saveChanges() {
    if (
      changedServices.length ===
      0
    ) {
      return;
    }

    if (hasInvalidOrders) {
      setErrorMessage(
        "Every order must be a whole number from 0 to 9999.",
      );

      return;
    }

    setIsSaving(true);
    setErrorMessage("");
    setStatusMessage("");

    try {
      const response =
        await fetch(
          "/api/admin/services",
          {
            method: "PUT",

            credentials:
              "include",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                services:
                  changedServices.map(
                    (service) => ({
                      code:
                        service
                          .original
                          .code,

                      enabled:
                        service
                          .enabled,

                      sortOrder:
                        Number(
                          service
                            .sortOrderText,
                        ),
                    }),
                  ),
              }),
          },
        );

      const result =
        (await response.json()) as
          AdminServicesResponse;

      if (
        response.status ===
        401
      ) {
        onExit();
        return;
      }

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
          createEditableService,
        ),
      );

      setStatusMessage(
        result.message ??
          "Changes saved.",
      );
    } catch (error) {
      setErrorMessage(
        error instanceof Error
          ? error.message
          : "Changes could not be saved.",
      );
    } finally {
      setIsSaving(false);
    }
  }

  async function logout() {
    try {
      await fetch(
        "/api/admin/logout",
        {
          method: "POST",

          credentials:
            "include",
        },
      );
    } finally {
      onExit();
    }
  }

  return (
    <main className="admin-services">
      <header className="admin-services__header">
        <button
          type="button"
          className="admin-services__back"
          onClick={onExit}
          aria-label="Return to GYAN"
          title="Return to GYAN"
        >
          ←
        </button>

        <div className="admin-services__title">
          <strong>
            GYAN CONTROL CENTER
          </strong>

          <span>
            Global Services
          </span>
        </div>

        <button
          type="button"
          className="admin-services__logout"
          onClick={() => {
            void logout();
          }}
        >
          Logout
        </button>
      </header>

      <section className="admin-services__toolbar">
        <input
          type="search"
          value={searchText}
          placeholder="Search services…"
          aria-label="Search services"
          onChange={(event) =>
            setSearchText(
              event.target.value,
            )
          }
        />

        <div
          className="admin-services__filters"
          aria-label="Service filters"
        >
          <button
            type="button"
            className={
              filter === "all"
                ? "is-active"
                : ""
            }
            onClick={() =>
              setFilter("all")
            }
          >
            All
          </button>

          <button
            type="button"
            className={
              filter === "active"
                ? "is-active"
                : ""
            }
            onClick={() =>
              setFilter(
                "active",
              )
            }
          >
            Active
          </button>

          <button
            type="button"
            className={
              filter === "inactive"
                ? "is-active"
                : ""
            }
            onClick={() =>
              setFilter(
                "inactive",
              )
            }
          >
            Inactive
          </button>

          <button
            type="button"
            onClick={
              onOpenShops
            }
          >
            Manage Shops
          </button>
        </div>
      </section>

      <section className="admin-services__content">
        {isLoading && (
          <div className="admin-services__state">
            Loading services…
          </div>
        )}

        {!isLoading &&
          errorMessage &&
          editableServices.length ===
            0 && (
            <div className="admin-services__state admin-services__state--error">
              {errorMessage}
            </div>
          )}

        {!isLoading &&
          !errorMessage &&
          groupedServices.length ===
            0 && (
            <div className="admin-services__state">
              No matching services.
            </div>
          )}

        {!isLoading &&
          groupedServices.map(
            ([
              category,
              categoryServices,
            ]) => {
              const activeCount =
                categoryServices.filter(
                  (service) =>
                    service.enabled,
                ).length;

              return (
                <section
                  key={category}
                  className="admin-services__category"
                >
                  <header className="admin-services__category-header">
                    <strong>
                      {getCategoryTitle(
                        category,
                      )}
                    </strong>

                    <span>
                      {activeCount} active
                      {" of "}
                      {
                        categoryServices.length
                      }
                    </span>
                  </header>

                  <div className="admin-services__list">
                    {categoryServices.map(
                      (service) => (
                        <article
                          key={
                            service
                              .original
                              .code
                          }
                          className={
                            service.enabled
                              ? "admin-service-row"
                              : "admin-service-row admin-service-row--inactive"
                          }
                        >
                          <label className="admin-service-row__toggle">
                            <input
                              type="checkbox"
                              checked={
                                service
                                  .enabled
                              }
                              onChange={(
                                event,
                              ) =>
                                updateEnabled(
                                  service
                                    .original
                                    .code,

                                  event
                                    .target
                                    .checked,
                                )
                              }
                            />

                            <span
                              aria-hidden="true"
                            />
                          </label>

                          <div
                            className="admin-service-row__icon"
                            style={{
                              backgroundColor:
                                service
                                  .original
                                  .color,
                            }}
                            aria-hidden="true"
                          >
                            {
                              service
                                .original
                                .icon
                            }
                          </div>

                          <div className="admin-service-row__details">
                            <strong>
                              {
                                service
                                  .original
                                  .name
                              }
                            </strong>

                            <span className="admin-service-row__classification">
                              {
                                service
                                  .original
                                  .category
                              }

                              {service
                                .original
                                .subCategory
                                ? ` · ${
                                    service
                                      .original
                                      .subCategory
                                  }`
                                : ""}
                            </span>

                            {service
                              .original
                              .description && (
                              <p>
                                {
                                  service
                                    .original
                                    .description
                                }
                              </p>
                            )}
                          </div>

                          <div className="admin-service-row__order">
                            <span>
                              Order
                            </span>

                            <input
                              type="text"
                              inputMode="numeric"
                              value={
                                service
                                  .sortOrderText
                              }
                              aria-label={`Order for ${service.original.name}`}
                              onChange={(
                                event,
                              ) =>
                                updateSortOrder(
                                  service
                                    .original
                                    .code,

                                  event
                                    .target
                                    .value,
                                )
                              }
                            />

                            <button
                              type="button"
                              className="admin-service-row__configure"
                              onClick={() =>
                                onConfigureService(
                                  service
                                    .original
                                    .code,

                                  service
                                    .original
                                    .name,
                                )
                              }
                            >
                              Configure
                            </button>
                          </div>
                        </article>
                      ),
                    )}
                  </div>
                </section>
              );
            },
          )}
      </section>

      <footer className="admin-services__save-bar">
        <div>
          {errorMessage && (
            <span className="admin-services__message admin-services__message--error">
              {errorMessage}
            </span>
          )}

          {!errorMessage &&
            statusMessage && (
              <span className="admin-services__message admin-services__message--success">
                ✓ {statusMessage}
              </span>
            )}

          {!errorMessage &&
            !statusMessage && (
              <span className="admin-services__change-count">
                {
                  changedServices.length
                }
                {" unsaved "}
                {changedServices.length ===
                1
                  ? "change"
                  : "changes"}
              </span>
            )}
        </div>

        <div className="admin-services__save-actions">
          <button
            type="button"
            className="admin-services__discard"
            disabled={
              isSaving ||
              changedServices.length ===
                0
            }
            onClick={
              discardChanges
            }
          >
            Discard
          </button>

          <button
            type="button"
            className="admin-services__save"
            disabled={
              isSaving ||
              changedServices.length ===
                0 ||
              hasInvalidOrders
            }
            onClick={() => {
              void saveChanges();
            }}
          >
            {isSaving
              ? "Saving…"
              : "Save changes"}
          </button>
        </div>
      </footer>
    </main>
  );
}