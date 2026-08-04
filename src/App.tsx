import {
  useEffect,
  useMemo,
  useState,
} from "react";
import "./App.css";

import AboutAdminPanel from "./components/AboutAdminPanel";
import AdminServicesScreen from "./components/AdminServicesScreen";
import AppFooter from "./components/AppFooter";
import AppHeader from "./components/AppHeader";
import CategoryRow, {
  type ServiceItem,
} from "./components/CategoryRow";
import PrintOrderPanel from "./components/PrintOrderPanel";
import ShopBanner from "./components/ShopBanner";
import ShopQrPanel from "./components/ShopQrPanel";
import ShopRegistrationPanel, {
  type RegisteredShop,
} from "./components/ShopRegistrationPanel";
import UnavailableServicePanel from "./components/UnavailableServicePanel";
import AdminShopsScreen
  from "./components/AdminShopsScreen";

import AdminShopServicesScreen
  from "./components/AdminShopServicesScreen";

interface ShopProfile {
  code: string;
  name: string;
  address: string;
}

interface CloudShopResponse {
  shop?: {
    code: string;
    name: string;
    addressLine: string;
    city: string;
  };
  error?: string;
}

interface CloudService {
  id: number;
  code: string;
  type: "system" | "custom";

  category: string;
  subCategory: string | null;

  name: string;
  catalogName: string;
  description: string;

  icon: string;
  color: string;
  workflowType: string;

  enabled: boolean;

  priceType: string;
  priceAmountPaise: number | null;
  priceNote: string;

  sortOrder: number;
  custom: boolean;
}

interface CloudServicesResponse {
  shopCode?: string;
  services?: CloudService[];
  error?: string;
}

interface LoadedServices {
  key: string;
  items: CloudService[];
}

interface CategoryConfiguration {
  id: string;
  title: string;
  icon: string;

  hubBackground: string;
  hubTextColor: string;
  hubAccentColor: string;
}

const categoryConfigurations: CategoryConfiguration[] = [
  {
    id: "documents",
    title: "Docs",
    icon: "📄",
    hubBackground: "#eff6ff",
    hubTextColor: "#17456f",
    hubAccentColor: "#1976d2",
  },
  {
    id: "education",
    title: "Education",
    icon: "🎓",
    hubBackground: "#effaf1",
    hubTextColor: "#24562a",
    hubAccentColor: "#43a047",
  },
  {
    id: "government",
    title: "Government",
    icon: "🏛️",
    hubBackground: "#fff4e8",
    hubTextColor: "#7a3500",
    hubAccentColor: "#ef6c00",
  },
];

function normalizeShopCode(
  value: string | null | undefined,
): string | null {
  const normalizedValue = value
    ?.trim()
    .toUpperCase();

  if (
    !normalizedValue ||
    !/^[A-Z0-9]{4}$/.test(normalizedValue)
  ) {
    return null;
  }

  return normalizedValue;
}

function getDetectedShopCode(): string | null {
  const queryParameters = new URLSearchParams(
    window.location.search,
  );

  const queryShopCode = normalizeShopCode(
    queryParameters.get("shop"),
  );

  if (queryShopCode) {
    return queryShopCode;
  }

  /*
   * Backward compatibility:
   * https://gyan.cc/LKMV
   */
  const pathSegments = window.location.pathname
    .split("/")
    .filter(Boolean);

  if (pathSegments.length !== 1) {
    return null;
  }

  return normalizeShopCode(pathSegments[0]);
}

function mapCloudServiceToTile(
  service: CloudService,
): ServiceItem {
  return {
    id: service.code,
    title: service.name,
    icon: service.icon || "🧩",
    color: service.color || "#607d8b",
    enabled: service.enabled,
  };
}

export default function App() {
  const [activeShopCode, setActiveShopCode] =
    useState<string | null>(() =>
      getDetectedShopCode(),
    );

  const [shopProfile, setShopProfile] =
    useState<ShopProfile | null>(null);

  const [loadedServices, setLoadedServices] =
    useState<LoadedServices | null>(null);

  const [expandedCategories, setExpandedCategories] =
    useState<Set<string>>(new Set());

  const [printPanelOpen, setPrintPanelOpen] =
    useState(false);

  const [
    registrationPanelOpen,
    setRegistrationPanelOpen,
  ] = useState(false);

  const [shopQrPanelOpen, setShopQrPanelOpen] =
    useState(false);

  const [aboutPanelOpen, setAboutPanelOpen] =
    useState(false);

  const [
    adminServicesOpen,
    setAdminServicesOpen,
  ] = useState(
    () =>
      window.location.pathname ===
      "/admin/services",
  );

  const [
    unavailableService,
    setUnavailableService,
  ] = useState<ServiceItem | null>(null);

  const [adminShopsOpen, setAdminShopsOpen] =
  useState(
    () =>
      window.location.pathname ===
      "/admin/shops",
  );

const [
  managedShopCode,
  setManagedShopCode,
] = useState<string | null>(() => {
  const match =
    window.location.pathname.match(
      /^\/admin\/shops\/([A-Za-z0-9]{4})\/services$/,
    );

  return match
    ? match[1].toUpperCase()
    : null;
});

  /*
   * This key identifies which service request
   * the currently loaded service data belongs to.
   */
  const serviceRequestKey =
    activeShopCode ?? "GLOBAL";

  /*
   * Do not display a previously loaded shop while
   * another shop is being loaded.
   */
  const visibleShopProfile =
    activeShopCode &&
    shopProfile?.code === activeShopCode
      ? shopProfile
      : null;

  const shopLoading =
    Boolean(activeShopCode) &&
    visibleShopProfile === null;

  /*
   * Do not display previously loaded services while
   * another shop's service list is being loaded.
   */
  const services =
    loadedServices?.key === serviceRequestKey
      ? loadedServices.items
      : [];

  const servicesLoading =
    loadedServices?.key !== serviceRequestKey;

  /*
   * Load the selected shop profile from D1.
   */
  useEffect(() => {
    if (!activeShopCode) {
      return;
    }

    const confirmedShopCode = activeShopCode;
    const abortController =
      new AbortController();

    async function loadShop() {
      try {
        const response = await fetch(
          `/api/shops/${encodeURIComponent(
            confirmedShopCode,
          )}`,
          {
            signal:
              abortController.signal,
          },
        );

        const result =
          (await response.json()) as
            CloudShopResponse;

        if (
          !response.ok ||
          !result.shop
        ) {
          throw new Error(
            result.error ??
              "Shop not found.",
          );
        }

        if (
          abortController.signal.aborted
        ) {
          return;
        }

        setShopProfile({
          code: result.shop.code,
          name: result.shop.name,
          address:
            `${result.shop.addressLine}, ${result.shop.city}`,
        });
      } catch (error) {
        if (
          error instanceof DOMException &&
          error.name === "AbortError"
        ) {
          return;
        }

        console.error(
          "Unable to load shop:",
          error,
        );

        if (
          !abortController.signal.aborted
        ) {
          setShopProfile(null);
        }
      }
    }

    void loadShop();

    return () => {
      abortController.abort();
    };
  }, [activeShopCode]);

  /*
   * Load services from D1.
   *
   * No selected shop:
   *   GET /api/services
   *
   * Selected shop:
   *   GET /api/shops/:code/services
   *
   * Important:
   * Do not filter disabled services here.
   * They remain visible but unavailable.
   */
  useEffect(() => {
    const confirmedShopCode =
      activeShopCode;

    const requestKey =
      confirmedShopCode ?? "GLOBAL";

    const abortController =
      new AbortController();

    async function loadServices() {
      try {
        const endpoint =
          confirmedShopCode
            ? `/api/shops/${encodeURIComponent(
                confirmedShopCode,
              )}/services`
            : "/api/services";

        const response = await fetch(
          endpoint,
          {
            signal:
              abortController.signal,
          },
        );

        const result =
          (await response.json()) as
            CloudServicesResponse;

        if (
          !response.ok ||
          !result.services
        ) {
          throw new Error(
            result.error ??
              "Services could not be loaded.",
          );
        }

        if (
          abortController.signal.aborted
        ) {
          return;
        }

        const catalogServices =
          [...result.services].sort(
            (first, second) => {
              const categoryComparison =
                first.category.localeCompare(
                  second.category,
                );

              if (
                categoryComparison !== 0
              ) {
                return categoryComparison;
              }

              const orderComparison =
                first.sortOrder -
                second.sortOrder;

              if (
                orderComparison !== 0
              ) {
                return orderComparison;
              }

              return first.name.localeCompare(
                second.name,
              );
            },
          );

        setLoadedServices({
          key: requestKey,
          items: catalogServices,
        });
      } catch (error) {
        if (
          error instanceof DOMException &&
          error.name === "AbortError"
        ) {
          return;
        }

        console.error(
          "Unable to load services:",
          error,
        );

        if (
          !abortController.signal.aborted
        ) {
          setLoadedServices({
            key: requestKey,
            items: [],
          });
        }
      }
    }

    void loadServices();

    return () => {
      abortController.abort();
    };
  }, [activeShopCode]);

  const categoryRows = useMemo(
    () =>
      categoryConfigurations
        .map((category) => {
          const categoryServices =
            services
              .filter(
                (service) =>
                  service.category ===
                  category.id,
              )
              .sort(
                (first, second) => {
                  const orderComparison =
                    first.sortOrder -
                    second.sortOrder;

                  if (
                    orderComparison !== 0
                  ) {
                    return orderComparison;
                  }

                  return first.name.localeCompare(
                    second.name,
                  );
                },
              )
              .map(
                mapCloudServiceToTile,
              );

          return {
            ...category,
            services:
              categoryServices,
          };
        })
        .filter(
          (category) =>
            category.services.length >
            0,
        ),
    [services],
  );

  function toggleCategory(
    categoryId: string,
  ) {
    setExpandedCategories(
      (current) => {
        const next =
          new Set(current);

        if (next.has(categoryId)) {
          next.delete(categoryId);
        } else {
          next.add(categoryId);
        }

        return next;
      },
    );
  }

  function collapseExpandedCategories() {
    setExpandedCategories(
      new Set(),
    );
  }

  function handleServiceClick(
    service: ServiceItem,
  ) {
    if (!service.enabled) {
      setUnavailableService(service);
      return;
    }

    if (service.id === "PRINT") {
      setPrintPanelOpen(true);
      return;
    }

    console.log(
      `${service.title} selected`,
    );
  }

  function handleRegisteredShop(
    shop: RegisteredShop,
  ) {
    const profile: ShopProfile = {
      code: shop.code,
      name: shop.name,
      address:
        `${shop.addressLine}, ${shop.city}`,
    };

    setShopProfile(profile);
    setActiveShopCode(shop.code);
    setRegistrationPanelOpen(false);

    window.history.pushState(
      {
        shopCode: shop.code,
      },
      "",
      `/?shop=${encodeURIComponent(
        shop.code,
      )}`,
    );
  }

  function openAdminServices() {
    setAboutPanelOpen(false);
    setAdminServicesOpen(true);

    window.history.pushState(
      {},
      "",
      "/admin/services",
    );
  }

  function exitAdminServices() {
    setAdminServicesOpen(false);

    window.history.pushState(
      {},
      "",
      activeShopCode
        ? `/?shop=${encodeURIComponent(
            activeShopCode,
          )}`
        : "/",
    );

    /*
     * Force the public catalog to reload after the
     * administrator may have changed global services.
     */
    setLoadedServices(null);
  }

  /*
   * Admin Control Center replaces the customer
   * application while this route is active.
   */
 if (adminServicesOpen) {
  return (
    <AdminServicesScreen
      onExit={exitAdminServices}
      onOpenShops={() => {
        setAdminServicesOpen(false);
        setAdminShopsOpen(true);

        window.history.pushState(
          {},
          "",
          "/admin/shops",
        );
      }}
    />
  );
}

  if (managedShopCode) {
  return (
    <AdminShopServicesScreen
      shopCode={managedShopCode}
      onBack={() => {
        setManagedShopCode(null);
        setAdminShopsOpen(true);

        window.history.pushState(
          {},
          "",
          "/admin/shops",
        );
      }}
    />
  );
}

if (adminShopsOpen) {
  return (
    <AdminShopsScreen
      onBack={() => {
        setAdminShopsOpen(false);
        setAdminServicesOpen(true);

        window.history.pushState(
          {},
          "",
          "/admin/services",
        );
      }}
      onManageShop={(shopCode) => {
        setAdminShopsOpen(false);
        setManagedShopCode(shopCode);

        window.history.pushState(
          {},
          "",
          `/admin/shops/${encodeURIComponent(
            shopCode,
          )}/services`,
        );
      }}
      onLogout={() => {
        void fetch(
          "/api/admin/logout",
          {
            method: "POST",
            credentials: "include",
          },
        ).finally(() => {
          setAdminShopsOpen(false);
          setManagedShopCode(null);

          window.history.pushState(
            {},
            "",
            "/",
          );
        });
      }}
    />
  );
}

  return (
    <main className="app-shell">
      <div className="app-content">
        <AppHeader
          hasExpandedCategories={
            expandedCategories.size >
            0
          }
          shopCode={
            visibleShopProfile?.code
          }
          onCollapseExpandedCategories={
            collapseExpandedCategories
          }
          onRegisterShop={() =>
            setRegistrationPanelOpen(
              true,
            )
          }
          onOpenShopQr={() =>
            setShopQrPanelOpen(true)
          }
          onOpenAbout={() =>
            setAboutPanelOpen(true)
          }
        />

        <div className="category-list">
          {!servicesLoading &&
            categoryRows.map(
              (category) => (
                <CategoryRow
                  key={category.id}
                  id={category.id}
                  title={
                    category.title
                  }
                  icon={category.icon}
                  services={
                    category.services
                  }
                  expanded={expandedCategories.has(
                    category.id,
                  )}
                  hubBackground={
                    category.hubBackground
                  }
                  hubTextColor={
                    category.hubTextColor
                  }
                  hubAccentColor={
                    category.hubAccentColor
                  }
                  onToggle={() =>
                    toggleCategory(
                      category.id,
                    )
                  }
                  onServiceClick={
                    handleServiceClick
                  }
                />
              ),
            )}
        </div>

        <ShopBanner
          shopName={
            shopLoading
              ? "Loading shop..."
              : visibleShopProfile?.name
          }
          address={
            shopLoading
              ? "Please wait"
              : visibleShopProfile?.address
          }
          onRegisterShop={() =>
            setRegistrationPanelOpen(
              true,
            )
          }
        />

        <AppFooter
          onContact={() =>
            console.log(
              "Contact selected",
            )
          }
          onLocation={() =>
            console.log(
              "Location selected",
            )
          }
        />
      </div>

      {printPanelOpen && (
        <PrintOrderPanel
          onClose={() =>
            setPrintPanelOpen(false)
          }
        />
      )}

      {registrationPanelOpen && (
        <ShopRegistrationPanel
          onClose={() =>
            setRegistrationPanelOpen(
              false,
            )
          }
          onRegistered={
            handleRegisteredShop
          }
        />
      )}

      {shopQrPanelOpen &&
        visibleShopProfile && (
          <ShopQrPanel
            shopCode={
              visibleShopProfile.code
            }
            shopName={
              visibleShopProfile.name
            }
            address={
              visibleShopProfile.address
            }
            onClose={() =>
              setShopQrPanelOpen(
                false,
              )
            }
          />
        )}

      {aboutPanelOpen && (
        <AboutAdminPanel
          onClose={() =>
            setAboutPanelOpen(false)
          }
          onAdminAuthenticated={
            openAdminServices
          }
        />
      )}

      {unavailableService && (
        <UnavailableServicePanel
          serviceName={
            unavailableService.title
          }
          shopName={
            visibleShopProfile?.name
          }
          onClose={() =>
            setUnavailableService(null)
          }
        />
      )}
    </main>
  );
}