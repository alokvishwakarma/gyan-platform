import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./App.css";

import AboutAdminPanel from "./components/AboutAdminPanel";
import AdminServicesScreen from "./components/AdminServicesScreen";
import AdminShopInfoScreen from "./components/AdminShopInfoScreen";
import AdminShopsScreen from "./components/AdminShopsScreen";
import AdminShopServicesScreen from "./components/AdminShopServicesScreen";
import AdminStoragePanel from "./components/AdminStoragePanel";
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

  type:
    | "system"
    | "custom";

  category: string;

  subCategory:
    | string
    | null;

  name: string;
  catalogName: string;
  description: string;

  icon: string;
  color: string;
  workflowType: string;

  enabled: boolean;

  priceType: string;

  priceAmountPaise:
    | number
    | null;

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

type AdminDestination =
  | "services"
  | "storage";

const categoryConfigurations:
  CategoryConfiguration[] = [
    {
      id: "documents",
      title: "Docs",
      icon: "📄",

      hubBackground:
        "#eff6ff",

      hubTextColor:
        "#17456f",

      hubAccentColor:
        "#1976d2",
    },
    {
      id: "education",
      title: "Education",
      icon: "🎓",

      hubBackground:
        "#effaf1",

      hubTextColor:
        "#24562a",

      hubAccentColor:
        "#43a047",
    },
    {
      id: "government",
      title: "Government",
      icon: "🏛️",

      hubBackground:
        "#fff4e8",

      hubTextColor:
        "#7a3500",

      hubAccentColor:
        "#ef6c00",
    },
  ];

function normalizeShopCode(
  value:
    | string
    | null
    | undefined,
): string | null {
  const normalizedValue =
    value
      ?.trim()
      .toUpperCase();

  if (
    !normalizedValue ||
    !/^[A-Z0-9]{4}$/.test(
      normalizedValue,
    )
  ) {
    return null;
  }

  return normalizedValue;
}

function getDetectedShopCode():
  string | null {
  const queryParameters =
    new URLSearchParams(
      window.location.search,
    );

  return normalizeShopCode(
    queryParameters.get("shop"),
  );
}

function getInitialManagedShopCode():
  string | null {
  const match =
    window.location.pathname.match(
      /^\/admin\/shops\/([A-Za-z0-9]{4})\/services$/,
    );

  return match
    ? normalizeShopCode(
        match[1],
      )
    : null;
}

function getInitialShopInfoCode():
  string | null {
  const match =
    window.location.pathname.match(
      /^\/admin\/shops\/([A-Za-z0-9]{4})\/information$/,
    );

  return match
    ? normalizeShopCode(
        match[1],
      )
    : null;
}

function mapCloudServiceToTile(
  service: CloudService,
): ServiceItem {
  return {
    id: service.code,
    title: service.name,

    icon:
      service.icon ||
      "🧩",

    color:
      service.color ||
      "#607d8b",

    enabled:
      service.enabled,
  };
}

export default function App() {
  const [
    activeShopCode,
    setActiveShopCode,
  ] = useState<
    string | null
  >(
    () =>
      getDetectedShopCode(),
  );

  const [
    shopProfile,
    setShopProfile,
  ] = useState<
    ShopProfile | null
  >(null);

  const [
    loadedServices,
    setLoadedServices,
  ] = useState<
    LoadedServices | null
  >(null);

  const [
    expandedCategories,
    setExpandedCategories,
  ] = useState<
    Set<string>
  >(new Set());

  const [
    printPanelOpen,
    setPrintPanelOpen,
  ] = useState(false);

  const [
    registrationPanelOpen,
    setRegistrationPanelOpen,
  ] = useState(false);

  const [
    shopQrPanelOpen,
    setShopQrPanelOpen,
  ] = useState(false);

  const [
    aboutPanelOpen,
    setAboutPanelOpen,
  ] = useState(false);

  const [
    adminServicesOpen,
    setAdminServicesOpen,
  ] = useState(
    () =>
      window.location.pathname ===
      "/admin/services",
  );

  const [
    adminShopsOpen,
    setAdminShopsOpen,
  ] = useState(
    () =>
      window.location.pathname ===
      "/admin/shops",
  );

  const [
    managedShopCode,
    setManagedShopCode,
  ] = useState<
    string | null
  >(
    () =>
      getInitialManagedShopCode(),
  );

  const [
    managedShopInfoCode,
    setManagedShopInfoCode,
  ] = useState<
    string | null
  >(
    () =>
      getInitialShopInfoCode(),
  );

  const [
    adminStorageOpen,
    setAdminStorageOpen,
  ] = useState(false);

  const [
    pendingAdminDestination,
    setPendingAdminDestination,
  ] = useState<AdminDestination>(
    "services",
  );

  const [
    unavailableService,
    setUnavailableService,
  ] = useState<
    ServiceItem | null
  >(null);

  const serviceRequestKey =
    activeShopCode ??
    "GLOBAL";

  const visibleShopProfile =
    activeShopCode &&
    shopProfile?.code ===
      activeShopCode
      ? shopProfile
      : null;

  const shopLoading =
    Boolean(activeShopCode) &&
    visibleShopProfile ===
      null;

  const services =
    loadedServices?.key ===
    serviceRequestKey
      ? loadedServices.items
      : [];

  const servicesLoading =
    loadedServices?.key !==
    serviceRequestKey;

  useEffect(() => {
    if (!activeShopCode) {
      return;
    }

    const confirmedShopCode =
      activeShopCode;

    const controller =
      new AbortController();

    async function loadShop() {
      try {
        const response =
          await fetch(
            `/api/shops/${encodeURIComponent(
              confirmedShopCode,
            )}`,
            {
              signal:
                controller.signal,
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
          controller.signal.aborted
        ) {
          return;
        }

        setShopProfile({
          code:
            result.shop.code,

          name:
            result.shop.name,

          address:
            `${result.shop.addressLine}, ${result.shop.city}`,
        });
      } catch (error) {
        if (
          error instanceof
            DOMException &&
          error.name ===
            "AbortError"
        ) {
          return;
        }

        console.error(
          "Unable to load shop:",
          error,
        );

        if (
          !controller.signal.aborted
        ) {
          setShopProfile(
            null,
          );
        }
      }
    }

    void loadShop();

    return () => {
      controller.abort();
    };
  }, [activeShopCode]);

  useEffect(() => {
    const confirmedShopCode =
      activeShopCode;

    const requestKey =
      confirmedShopCode ??
      "GLOBAL";

    const controller =
      new AbortController();

    async function loadServices() {
      try {
        const endpoint =
          confirmedShopCode
            ? `/api/shops/${encodeURIComponent(
                confirmedShopCode,
              )}/services`
            : "/api/services";

        const response =
          await fetch(
            endpoint,
            {
              signal:
                controller.signal,
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
          controller.signal.aborted
        ) {
          return;
        }

        const catalogServices =
          [...result.services].sort(
            (
              first,
              second,
            ) => {
              const categoryComparison =
                first.category.localeCompare(
                  second.category,
                );

              if (
                categoryComparison !==
                0
              ) {
                return categoryComparison;
              }

              const orderComparison =
                first.sortOrder -
                second.sortOrder;

              if (
                orderComparison !==
                0
              ) {
                return orderComparison;
              }

              return first.name.localeCompare(
                second.name,
              );
            },
          );

        setLoadedServices({
          key:
            requestKey,

          items:
            catalogServices,
        });
      } catch (error) {
        if (
          error instanceof
            DOMException &&
          error.name ===
            "AbortError"
        ) {
          return;
        }

        console.error(
          "Unable to load services:",
          error,
        );

        if (
          !controller.signal.aborted
        ) {
          setLoadedServices({
            key:
              requestKey,

            items: [],
          });
        }
      }
    }

    void loadServices();

    return () => {
      controller.abort();
    };
  }, [activeShopCode]);

  const categoryRows =
    useMemo(
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
                  (
                    first,
                    second,
                  ) => {
                    const orderComparison =
                      first.sortOrder -
                      second.sortOrder;

                    if (
                      orderComparison !==
                      0
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
              category.services
                .length > 0,
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

        if (
          next.has(
            categoryId,
          )
        ) {
          next.delete(
            categoryId,
          );
        } else {
          next.add(
            categoryId,
          );
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
      setUnavailableService(
        service,
      );

      return;
    }

    if (
      service.id ===
      "PRINT"
    ) {
      setPrintPanelOpen(
        true,
      );

      return;
    }

    console.log(
      `${service.title} selected`,
    );
  }

  function handleRegisteredShop(
    shop: RegisteredShop,
  ) {
    const profile:
      ShopProfile = {
        code:
          shop.code,

        name:
          shop.name,

        address:
          `${shop.addressLine}, ${shop.city}`,
      };

    setShopProfile(
      profile,
    );

    setActiveShopCode(
      shop.code,
    );

    setRegistrationPanelOpen(
      false,
    );

    window.history.pushState(
      {
        shopCode:
          shop.code,
      },
      "",
      `/?shop=${encodeURIComponent(
        shop.code,
      )}`,
    );
  }

  function openAdminServices() {
    setAboutPanelOpen(
      false,
    );

    setAdminShopsOpen(
      false,
    );

    setAdminStorageOpen(
      false,
    );

    setManagedShopCode(
      null,
    );

    setManagedShopInfoCode(
      null,
    );

    setAdminServicesOpen(
      true,
    );

    window.history.pushState(
      {},
      "",
      "/admin/services",
    );
  }

  function exitAdminServices() {
    setAdminServicesOpen(
      false,
    );

    window.history.pushState(
      {},
      "",
      activeShopCode
        ? `/?shop=${encodeURIComponent(
            activeShopCode,
          )}`
        : "/",
    );

    setLoadedServices(
      null,
    );
  }

  async function logoutAdmin() {
    try {
      await fetch(
        "/api/admin/logout",
        {
          method:
            "POST",

          credentials:
            "include",
        },
      );
    } finally {
      setAdminServicesOpen(
        false,
      );

      setAdminShopsOpen(
        false,
      );

      setAdminStorageOpen(
        false,
      );

      setManagedShopCode(
        null,
      );

      setManagedShopInfoCode(
        null,
      );

      window.history.pushState(
        {},
        "",
        activeShopCode
          ? `/?shop=${encodeURIComponent(
              activeShopCode,
            )}`
          : "/",
      );
    }
  }

  if (managedShopInfoCode) {
    return (
      <AdminShopInfoScreen
        shopCode={
          managedShopInfoCode
        }
        onBack={() => {
          const editedShopCode =
            managedShopInfoCode;

          setManagedShopInfoCode(
            null,
          );

          setAdminShopsOpen(
            true,
          );

          window.history.pushState(
            {},
            "",
            "/admin/shops",
          );

          /*
           * Force the public shop profile
           * to reload if the administrator
           * edited the currently selected shop.
           */
          if (
            activeShopCode ===
            editedShopCode
          ) {
            setShopProfile(
              null,
            );
          }
        }}
      />
    );
  }

  if (managedShopCode) {
    return (
      <AdminShopServicesScreen
        shopCode={
          managedShopCode
        }
        onBack={() => {
          setManagedShopCode(
            null,
          );

          setAdminShopsOpen(
            true,
          );

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
          setAdminShopsOpen(
            false,
          );

          setAdminServicesOpen(
            true,
          );

          window.history.pushState(
            {},
            "",
            "/admin/services",
          );
        }}
        onManageInformation={(
          shopCode,
        ) => {
          setAdminShopsOpen(
            false,
          );

          setManagedShopInfoCode(
            shopCode,
          );

          window.history.pushState(
            {},
            "",
            `/admin/shops/${encodeURIComponent(
              shopCode,
            )}/information`,
          );
        }}
        onManageServices={(
          shopCode,
        ) => {
          setAdminShopsOpen(
            false,
          );

          setManagedShopCode(
            shopCode,
          );

          window.history.pushState(
            {},
            "",
            `/admin/shops/${encodeURIComponent(
              shopCode,
            )}/services`,
          );
        }}
        onLogout={() => {
          void logoutAdmin();
        }}
      />
    );
  }

  if (adminServicesOpen) {
    return (
      <AdminServicesScreen
        onExit={
          exitAdminServices
        }
        onOpenShops={() => {
          setAdminServicesOpen(
            false,
          );

          setAdminShopsOpen(
            true,
          );

          window.history.pushState(
            {},
            "",
            "/admin/shops",
          );
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
            setShopQrPanelOpen(
              true,
            )
          }
          onOpenAbout={() => {
            setPendingAdminDestination(
              "services",
            );

            setAboutPanelOpen(
              true,
            );
          }}
        />

        <div className="category-list">
          {!servicesLoading &&
            categoryRows.map(
              (category) => (
                <CategoryRow
                  key={
                    category.id
                  }
                  id={
                    category.id
                  }
                  title={
                    category.title
                  }
                  icon={
                    category.icon
                  }
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
          shopCode={
            activeShopCode
          }
          shopName={
            visibleShopProfile?.name
          }
          onClose={() =>
            setPrintPanelOpen(
              false,
            )
          }
          onIncreaseLimit={() => {
            setPrintPanelOpen(
              false,
            );

            setPendingAdminDestination(
              "storage",
            );

            setAboutPanelOpen(
              true,
            );
          }}
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
          onClose={() => {
            setAboutPanelOpen(
              false,
            );

            setPendingAdminDestination(
              "services",
            );
          }}
          onAdminAuthenticated={() => {
            setAboutPanelOpen(
              false,
            );

            if (
              pendingAdminDestination ===
              "storage"
            ) {
              setAdminStorageOpen(
                true,
              );

              return;
            }

            openAdminServices();
          }}
        />
      )}

      {adminStorageOpen && (
        <AdminStoragePanel
          onClose={() => {
            setAdminStorageOpen(
              false,
            );

            setLoadedServices(
              null,
            );
          }}
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
            setUnavailableService(
              null,
            )
          }
        />
      )}
    </main>
  );
}