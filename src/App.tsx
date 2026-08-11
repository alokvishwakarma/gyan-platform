import {
  useEffect,
  useState,
} from "react";

import "./App.css";
import "./GyanShellPopups.css";
import "./ShopBranding.css";

import AboutAdminPanel from "./components/AboutAdminPanel";
import AdminServiceFormScreen from "./components/AdminServiceFormScreen";
import AdminServicesScreen from "./components/AdminServicesScreen";
import AdminServiceStudioScreen from "./components/AdminServiceStudioScreen";
import AdminShopInfoScreen from "./components/AdminShopInfoScreen";
import AdminShopsScreen from "./components/AdminShopsScreen";
import AdminShopServicesScreen from "./components/AdminShopServicesScreen";
import AdminStoragePanel from "./components/AdminStoragePanel";
import PlatformDashboardPage from "./components/PlatformDashboardPage";
import PublicHomePage from "./components/PublicHomePage";
import ShopDashboardPage from "./components/ShopDashboardPage";
import type { ServiceItem } from "./components/CategoryRow";
import PrintOrderPanel from "./components/PrintOrderPanel";
import ShopQrPanel from "./components/ShopQrPanel";
import ShopRegistrationPanel, {
  type RegisteredShop,
} from "./components/ShopRegistrationPanel";
import UnavailableServicePanel from "./components/UnavailableServicePanel";
import DynamicServiceRequestPanel
  from "./components/DynamicServiceRequestPanel";
import NearbyServicePanel
  from "./components/NearbyServicePanel";
import SharedRequestScreen
  from "./components/SharedRequestScreen";
import AdminAnalyticsScreen
  from "./components/AdminAnalyticsScreen";
import {
  trackDailyVisit,
} from "./analytics/trackDailyVisit";
import CompanyCardPage
  from "./components/CompanyCardPage";

import AboutPage
  from "./components/AboutPage";

import QrPage
  from "./components/QrPage";

import AdminLocationPanel
  from "./components/AdminLocationPanel";

import ChatPanel
  from "./components/ChatPanel";

import ShopChatPanel
  from "./components/ShopChatPanel";

import ShopHomeContent
  from "./components/ShopHomeContent";

import AdminChatPanel
  from "./components/AdminChatPanel";

import {
  clearAdminLocationOverride,
} from "./location/adminLocation";



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

  homepageOrder:
    | number
    | null;

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


type AdminDestination =
  | "services"
  | "storage"
  | "platformDashboard"
  | "shopDashboard";

type DashboardView =
  | "platform"
  | "shop"
  | null;

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

function normalizeServiceCode(
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
    !/^[A-Z0-9_]{2,50}$/.test(
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

function getInitialServiceFormCode():
  string | null {
  const match =
    window.location.pathname.match(
      /^\/admin\/services\/([A-Za-z0-9_]{2,50})\/form$/,
    );

  return match
    ? normalizeServiceCode(
        match[1],
      )
    : null;
}

function getInitialServiceStudioCode():
  string | null {
  const match =
    window.location.pathname.match(
      /^\/admin\/services\/([A-Za-z0-9_]{2,50})$/,
    );

  return match
    ? normalizeServiceCode(
        match[1],
      )
    : null;
}

function getInitialSharedRequest():
  {
    requestNumber: string;
    token: string;
  } | null {
  const match =
    window.location.pathname.match(
      /^\/shared\/requests\/([A-Za-z0-9_-]{8,120})$/,
    );

  if (!match) {
    return null;
  }

  const token =
    new URLSearchParams(
      window.location.search,
    ).get("token");

  if (!token) {
    return null;
  }

  return {
    requestNumber:
      match[1].toUpperCase(),

    token,
  };
}


function getInitialDashboardView(): DashboardView {
  if (window.location.pathname === "/admin") {
    return "platform";
  }

  if (window.location.pathname === "/shop-admin") {
    return "shop";
  }

  return null;
}

const SUPPORT_INTAKE_SHOP_CODE =
  "SUPP";

const SUPPORT_INTAKE_SHOP_NAME =
  "GYAN Support";

export default function App() {


  
  const [
  sharedRequest,
  setSharedRequest,
] = useState(
  () =>
    getInitialSharedRequest(),
);

  const [
    dashboardView,
    setDashboardView,
  ] = useState<DashboardView>(
    () => getInitialDashboardView(),
  );

  const initialServiceFormCode =
    getInitialServiceFormCode();

  const initialServiceStudioCode =
    getInitialServiceStudioCode() ??
    initialServiceFormCode;

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
    dynamicServiceRequest,
    setDynamicServiceRequest,
  ] = useState<{
    code: string;
    name: string;

    shopCode:
      | string
      | null;

    shopName:
      | string
      | null;

    initialFieldValues?:
      Record<string, string>;
  } | null>(null);

  const [
    nearbyServiceRequest,
    setNearbyServiceRequest,
  ] = useState<{
    code: string;
    name: string;
  } | null>(null);

  const [
    loadedServices,
    setLoadedServices,
  ] = useState<
    LoadedServices | null
  >(null);

  const [
    printPanelOpen,
    setPrintPanelOpen,
  ] = useState(false);

  const [
    registrationPanelOpen,
    setRegistrationPanelOpen,
  ] = useState(false);


  const [
    registrationEmail,
    setRegistrationEmail,
  ] = useState("");


  const [
    adminLocationOpen,
    setAdminLocationOpen,
  ] = useState(false);

  const [
    chatOpen,
    setChatOpen,
  ] = useState(false);

  const [
    shopChatOpen,
    setShopChatOpen,
  ] = useState(false);

  const [
    adminChatOpen,
    setAdminChatOpen,
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
    managedServiceStudioCode,
    setManagedServiceStudioCode,
  ] = useState<
    string | null
  >(
    initialServiceStudioCode,
  );

  const [
    managedServiceStudioName,
    setManagedServiceStudioName,
  ] = useState(
    initialServiceStudioCode ??
      "",
  );

  const [
    managedServiceFormCode,
    setManagedServiceFormCode,
  ] = useState<
    string | null
  >(
    initialServiceFormCode,
  );

  const [
    adminStorageOpen,
    setAdminStorageOpen,
  ] = useState(false);

  const [
    adminAnalyticsOpen,
    setAdminAnalyticsOpen,
  ] = useState(
    () =>
      window.location.pathname ===
      "/admin/analytics",
  );

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
    Boolean(
      activeShopCode,
    ) &&
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
    void trackDailyVisit();
  }, []);

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

        const contentType =
          response.headers.get(
            "content-type",
          ) ?? "";

        if (
          !contentType.includes(
            "application/json",
          )
        ) {
          throw new Error(
            `Expected JSON from ${endpoint}, but received ${
              contentType ||
              "an unknown content type"
            }.`,
          );
        }

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

    setDynamicServiceRequest({
      code: service.id,
      name: service.title,

      shopCode:
        activeShopCode,

      shopName:
        visibleShopProfile?.name ??
        null,
    });

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
    setDashboardView(null);

    setAboutPanelOpen(
      false,
    );

    setAdminShopsOpen(
      false,
    );

    setAdminStorageOpen(
      false,
    );

    setAdminAnalyticsOpen(
      false,
    );

    setManagedShopCode(
      null,
    );

    setManagedShopInfoCode(
      null,
    );

    setManagedServiceFormCode(
      null,
    );

    setManagedServiceStudioCode(
      null,
    );

    setManagedServiceStudioName(
      "",
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
    setDashboardView(null);

    setAdminServicesOpen(
      false,
    );

    setManagedServiceFormCode(
      null,
    );

    setManagedServiceStudioCode(
      null,
    );

    setManagedServiceStudioName(
      "",
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
      clearAdminLocationOverride();

      setAdminLocationOpen(
        false,
      );

      setDashboardView(null);

      setAdminServicesOpen(
        false,
      );

      setAdminShopsOpen(
        false,
      );

      setAdminStorageOpen(
        false,
      );

      setAdminAnalyticsOpen(
        false,
      );

      setManagedShopCode(
        null,
      );

      setManagedShopInfoCode(
        null,
      );

      setManagedServiceFormCode(
        null,
      );

      setManagedServiceStudioCode(
        null,
      );

      setManagedServiceStudioName(
        "",
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

if (sharedRequest) {
  return (
    <SharedRequestScreen
      requestNumber={
        sharedRequest.requestNumber
      }
      token={
        sharedRequest.token
      }
      onClose={() => {
        setSharedRequest(
          null,
        );

        window.history.pushState(
          {},
          "",
          "/",
        );
      }}
    />
  );
}


if (
  window.location.pathname ===
  "/card"
) {
  return (
    <CompanyCardPage />
  );
}

if (
  window.location.pathname ===
  "/about"
) {
  return (
    <AboutPage />
  );
}

if (
  window.location.pathname ===
  "/qr"
) {
  return (
    <QrPage />
  );
}

  if (
    managedServiceFormCode
  ) {
    return (
      <AdminServiceFormScreen
        serviceCode={
          managedServiceFormCode
        }
        onBack={() => {
          setManagedServiceFormCode(
            null,
          );

          if (
            managedServiceStudioCode
          ) {
            window.history.pushState(
              {},
              "",
              `/admin/services/${encodeURIComponent(
                managedServiceStudioCode,
              )}`,
            );

            return;
          }

          setAdminServicesOpen(
            true,
          );

          window.history.pushState(
            {},
            "",
            "/admin/services",
          );
        }}
      />
    );
  }

  if (
    managedServiceStudioCode
  ) {
    return (
      <AdminServiceStudioScreen
        serviceCode={
          managedServiceStudioCode
        }
        serviceName={
          managedServiceStudioName ||
          managedServiceStudioCode
        }
        onBack={() => {
          setManagedServiceStudioCode(
            null,
          );

          setManagedServiceStudioName(
            "",
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
        onOpenForm={() => {
          setManagedServiceFormCode(
            managedServiceStudioCode,
          );

          window.history.pushState(
            {},
            "",
            `/admin/services/${encodeURIComponent(
              managedServiceStudioCode,
            )}/form`,
          );
        }}
      />
    );
  }

  if (
    managedShopInfoCode
  ) {
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
        onConfigureService={(
          serviceCode,
          serviceName,
        ) => {
          setAdminServicesOpen(
            false,
          );

          setManagedServiceStudioCode(
            serviceCode,
          );

          setManagedServiceStudioName(
            serviceName,
          );

          window.history.pushState(
            {},
            "",
            `/admin/services/${encodeURIComponent(
              serviceCode,
            )}`,
          );
        }}
      />
    );
  }

  if (adminAnalyticsOpen) {
    return (
      <AdminAnalyticsScreen
        onBack={() => {
          setAdminAnalyticsOpen(
            false,
          );

          setDashboardView(
            "platform",
          );

          window.history.pushState(
            {},
            "",
            "/admin",
          );
        }}
      />
    );
  }

if (
  dashboardView ===
  "platform"
) {
  return (
    <>
      <PlatformDashboardPage
        onBack={() => {
          setDashboardView(
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
        }}

        onAddShop={() =>
          setRegistrationPanelOpen(
            true,
          )
        }

        onChangeLocation={() =>
          setAdminLocationOpen(
            true,
          )
        }

        onOpenShops={() => {
          setDashboardView(
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

        onOpenServices={() => {
          setDashboardView(
            null,
          );

          openAdminServices();
        }}

        onOpenStorage={() => {
          setDashboardView(
            null,
          );

          setAdminStorageOpen(
            true,
          );
        }}

        onOpenAnalytics={() => {
          setDashboardView(
            null,
          );

          setAdminAnalyticsOpen(
            true,
          );

          window.history.pushState(
            {},
            "",
            "/admin/analytics",
          );
        }}
      />

      <button
        type="button"
        aria-label="Open admin messages"
        onClick={() =>
          setAdminChatOpen(
            true,
          )
        }
        style={{
          position:
            "fixed",
          right:
            "14px",
          bottom:
            "14px",
          zIndex:
            2500,
          border:
            "0",
          borderRadius:
            "999px",
          padding:
            "10px 14px",
          background:
            "#5b3ea8",
          color:
            "#fff",
          font:
            "inherit",
          fontSize:
            "0.72rem",
          fontWeight:
            800,
          boxShadow:
            "0 8px 24px rgb(15 23 42 / 20%)",
          cursor:
            "pointer",
        }}
      >
        💬 Messages
      </button>

      {adminChatOpen && (
        <AdminChatPanel
          onClose={() =>
            setAdminChatOpen(
              false,
            )
          }
        />
      )}

      {adminLocationOpen && (
        <AdminLocationPanel
          onClose={() =>
            setAdminLocationOpen(
              false,
            )
          }
        />
      )}

      {registrationPanelOpen && (
        <ShopRegistrationPanel
          initialEmail={
            registrationEmail
          }
          requireRealLocation={
            Boolean(
              registrationEmail,
            )
          }
          onClose={() => {
            setRegistrationPanelOpen(
              false,
            );

            setRegistrationEmail(
              "",
            );
          }}

          onRegistered={
            handleRegisteredShop
          }
        />
      )}
    </>
  );
}

  if (
    dashboardView === "shop" &&
    activeShopCode
  ) {
    return (
      <>
      <ShopDashboardPage
        shopCode={activeShopCode}
        shopName={
          visibleShopProfile?.name ??
          "Your GYAN Shop"
        }
        address={
          visibleShopProfile?.address ??
          "Shop information"
        }
        activeServiceCount={
          services.filter(
            (service) => service.enabled,
          ).length
        }
        onBack={() => {
          setDashboardView(null);
          window.history.pushState(
            {},
            "",
            `/?shop=${encodeURIComponent(activeShopCode)}`,
          );
        }}
        onManageServices={() => {
          setDashboardView(null);
          setManagedShopCode(activeShopCode);
          window.history.pushState(
            {},
            "",
            `/admin/shops/${encodeURIComponent(
              activeShopCode,
            )}/services`,
          );
        }}
        onOpenRequests={() => {
          setShopChatOpen(
            true,
          );
        }}
        onOpenQr={() =>
          setShopQrPanelOpen(true)
        }
        onOpenInformation={() => {
          setDashboardView(null);
          setManagedShopInfoCode(activeShopCode);
          window.history.pushState(
            {},
            "",
            `/admin/shops/${encodeURIComponent(
              activeShopCode,
            )}/information`,
          );
        }}
        

        
      />

      {shopChatOpen && (
        <ShopChatPanel
          shopCode={
            activeShopCode
          }
          shopName={
            visibleShopProfile?.name ??
            "Your GYAN Shop"
          }
          onClose={() =>
            setShopChatOpen(
              false,
            )
          }
        />
      )}
      </>
    );
  }

  return (
    <main className="app-shell">
      <div className="app-content">
        <PublicHomePage
          services={services}
          loading={servicesLoading}

          shopName={
            activeShopCode
              ? (
                  shopLoading
                    ? "Loading shop..."
                    : visibleShopProfile?.name
                )
              : undefined
          }

          shopAddress={
            activeShopCode
              ? (
                  shopLoading
                    ? "Please wait"
                    : visibleShopProfile?.address
                )
              : undefined
          }

          onOpenShop={(shopCode) => {
            setActiveShopCode(shopCode);
            setNearbyServiceRequest(null);
            setDynamicServiceRequest(null);

            window.history.pushState(
              { shopCode },
              "",
              `/?shop=${encodeURIComponent(shopCode)}`,
            );
          }}

          onClaimShop={() => {
            setRegistrationEmail("");
            setRegistrationPanelOpen(true);
          }}

          onOpenAdmin={() => {
            setPendingAdminDestination(
              activeShopCode
                ? "shopDashboard"
                : "platformDashboard",
            );

            setAboutPanelOpen(true);
          }}

          onOpenChat={() => {
            setChatOpen(true);
          }}

          onOpenMyShop={(shopCode) => {
            setActiveShopCode(shopCode);
            setDashboardView("shop");

            window.history.pushState(
              { shopCode },
              "",
              "/shop-admin",
            );
          }}

          onRegisterMyShop={(email) => {
            setRegistrationEmail(email);
            setRegistrationPanelOpen(true);
          }}

          onStartOnlineService={(
            serviceCode: string,
            serviceName: string,
          ) => {
            setNearbyServiceRequest(null);

            setDynamicServiceRequest({
              code: serviceCode,
              name: serviceName,
              shopCode:
                SUPPORT_INTAKE_SHOP_CODE,
              shopName:
                SUPPORT_INTAKE_SHOP_NAME,
            });
          }}

          onOpenOnlineServices={() => {
            console.log(
              "Open online service search wizard",
            );
          }}

          onOpenNearbyService={(
            serviceCode: string,
            serviceName: string,
          ) => {
            setDynamicServiceRequest(null);

            setNearbyServiceRequest({
              code: serviceCode,
              name: serviceName,
            });
          }}

          shellContent={
            nearbyServiceRequest
              ? (
                <NearbyServicePanel
                  embedded
                  serviceCode={
                    nearbyServiceRequest.code
                  }
                  serviceName={
                    nearbyServiceRequest.name
                  }
                  onClose={() =>
                    setNearbyServiceRequest(
                      null,
                    )
                  }
                />
              )
              : dynamicServiceRequest &&
                  dynamicServiceRequest.shopCode
                ? (
                  <DynamicServiceRequestPanel
                    embedded
                    key={
                      `${dynamicServiceRequest.shopCode}:${dynamicServiceRequest.code}`
                    }
                    shopCode={
                      dynamicServiceRequest.shopCode
                    }
                    shopName={
                      dynamicServiceRequest.shopName
                    }
                    serviceCode={
                      dynamicServiceRequest.code
                    }
                    serviceName={
                      dynamicServiceRequest.name
                    }
                    initialFieldValues={
                      dynamicServiceRequest.initialFieldValues
                    }
                    onClose={() =>
                      setDynamicServiceRequest(
                        null,
                      )
                    }
                  />
                )
                : activeShopCode
                  ? (
                    <ShopHomeContent
                      services={services}
                      loading={servicesLoading}
                      onServiceSelect={(service) =>
                        handleServiceClick({
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
                        })
                      }
                    />
                  )
                  : undefined
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

{activeShopCode !== null &&
  dynamicServiceRequest &&
  dynamicServiceRequest
    .shopCode && (
    <DynamicServiceRequestPanel
      key={`${dynamicServiceRequest.shopCode}:${dynamicServiceRequest.code}`}
      shopCode={
        dynamicServiceRequest
          .shopCode
      }
      shopName={
        dynamicServiceRequest
          .shopName
      }
      serviceCode={
        dynamicServiceRequest
          .code
      }
      serviceName={
        dynamicServiceRequest
          .name
      }
      initialFieldValues={
        dynamicServiceRequest
          .initialFieldValues
      }
      onClose={() =>
        setDynamicServiceRequest(
          null,
        )
      }
    />
  )}

      {chatOpen && (
        <ChatPanel
          onClose={() =>
            setChatOpen(
              false,
            )
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
              setAdminStorageOpen(true);
              return;
            }

            if (
              pendingAdminDestination ===
              "platformDashboard"
            ) {
              setDashboardView("platform");
              window.history.pushState(
                {},
                "",
                "/admin",
              );
              return;
            }

            if (
              pendingAdminDestination ===
              "shopDashboard" &&
              activeShopCode
            ) {
              setDashboardView("shop");
              window.history.pushState(
                {},
                "",
                "/shop-admin",
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