import {
  useEffect,
  useState,
} from "react";
import "./App.css";
import ShopQrPanel from "./components/ShopQrPanel";

import AppFooter from "./components/AppFooter";
import AppHeader from "./components/AppHeader";
import CategoryRow, {
  type ServiceItem,
} from "./components/CategoryRow";
import PrintOrderPanel from "./components/PrintOrderPanel";
import ShopBanner from "./components/ShopBanner";
import ShopRegistrationPanel, {
  type RegisteredShop,
} from "./components/ShopRegistrationPanel";

const documentServices: ServiceItem[] = [
  {
    id: "print",
    title: "Print",
    icon: "🖨️",
    color: "#1565c0",
  },
  {
    id: "scan",
    title: "Scan",
    icon: "📠",
    color: "#1976d2",
  },
  {
    id: "photo",
    title: "Photo",
    icon: "📷",
    color: "#1e88e5",
  },
  {
    id: "lamination",
    title: "Lamination",
    icon: "📄",
    color: "#2196f3",
  },
  {
    id: "binding",
    title: "Binding",
    icon: "📚",
    color: "#42a5f5",
  },
  {
    id: "pdf",
    title: "PDF Tools",
    icon: "📑",
    color: "#64b5f6",
  },
];

const educationServices: ServiceItem[] = [
  {
    id: "forms",
    title: "Forms",
    icon: "📝",
    color: "#2e7d32",
  },
  {
    id: "resume",
    title: "Resume",
    icon: "📋",
    color: "#388e3c",
  },
  {
    id: "certificates",
    title: "Certificates",
    icon: "🎓",
    color: "#43a047",
  },
  {
    id: "admit-card",
    title: "Admit Card",
    icon: "🪪",
    color: "#4caf50",
  },
  {
    id: "applications",
    title: "Applications",
    icon: "✍️",
    color: "#66bb6a",
  },
];

const governmentServices: ServiceItem[] = [
  {
    id: "pan",
    title: "PAN Help",
    icon: "🪪",
    color: "#e65100",
  },
  {
    id: "aadhaar",
    title: "Aadhaar Help",
    icon: "👤",
    color: "#ef6c00",
  },
  {
    id: "passport",
    title: "Passport",
    icon: "🛂",
    color: "#f57c00",
  },
  {
    id: "bill-payment",
    title: "Bill Payment",
    icon: "🧾",
    color: "#fb8c00",
  },
  {
    id: "insurance",
    title: "Insurance",
    icon: "🛡️",
    color: "#ff9800",
  },
  {
    id: "government-forms",
    title: "Govt Forms",
    icon: "🏛️",
    color: "#ffa726",
  },
];

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
   * Backward compatibility for:
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

export default function App() {
  const [shopProfile, setShopProfile] =
    useState<ShopProfile | null>(null);

  const [shopLoading, setShopLoading] =
    useState(false);

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

  useEffect(() => {
    const shopCode = getDetectedShopCode();

    if (!shopCode) {
      return;
    }

    const confirmedShopCode = shopCode;

    const abortController = new AbortController();

    async function loadShop() {
      setShopLoading(true);

      try {
        const response = await fetch(
          `/api/shops/${encodeURIComponent(
            confirmedShopCode,
          )}`,
          {
            signal: abortController.signal,
          },
        );

        const result =
          (await response.json()) as CloudShopResponse;

        if (!response.ok || !result.shop) {
          throw new Error(
            result.error ?? "Shop not found.",
          );
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

        setShopProfile(null);
      } finally {
        if (!abortController.signal.aborted) {
          setShopLoading(false);
        }
      }
    }

    void loadShop();

    return () => {
      abortController.abort();
    };
  }, []);

  function toggleCategory(categoryId: string) {
    setExpandedCategories((current) => {
      const next = new Set(current);

      if (next.has(categoryId)) {
        next.delete(categoryId);
      } else {
        next.add(categoryId);
      }

      return next;
    });
  }

  function collapseExpandedCategories() {
    setExpandedCategories(new Set());
  }

  function handleServiceClick(service: ServiceItem) {
    if (service.id === "print") {
      setPrintPanelOpen(true);
      return;
    }

    console.log(`${service.title} selected`);
  }

  function handleRegisteredShop(
    shop: RegisteredShop,
  ) {
    const profile: ShopProfile = {
      code: shop.code,
      name: shop.name,
      address: `${shop.addressLine}, ${shop.city}`,
    };

    setShopProfile(profile);
    setRegistrationPanelOpen(false);

    window.history.pushState(
      {
        shopCode: shop.code,
      },
      "",
      `/?shop=${encodeURIComponent(shop.code)}`,
    );
  }

  return (
    <main className="app-shell">
      <div className="app-content">
        <AppHeader
  hasExpandedCategories={
    expandedCategories.size > 0
  }
  shopCode={shopProfile?.code}
  onCollapseExpandedCategories={
    collapseExpandedCategories
  }
  onRegisterShop={() =>
    setRegistrationPanelOpen(true)
  }
  onOpenShopQr={() =>
    setShopQrPanelOpen(true)
  }
/>

        <div className="category-list">
          <CategoryRow
            id="documents"
            title="Docs"
            icon="📄"
            services={documentServices}
            expanded={expandedCategories.has(
              "documents",
            )}
            hubBackground="#eff6ff"
            hubTextColor="#17456f"
            hubAccentColor="#1976d2"
            onToggle={() =>
              toggleCategory("documents")
            }
            onServiceClick={handleServiceClick}
          />

          <CategoryRow
            id="education"
            title="Education"
            icon="🎓"
            services={educationServices}
            expanded={expandedCategories.has(
              "education",
            )}
            hubBackground="#effaf1"
            hubTextColor="#24562a"
            hubAccentColor="#43a047"
            onToggle={() =>
              toggleCategory("education")
            }
            onServiceClick={handleServiceClick}
          />

          <CategoryRow
            id="government"
            title="Government"
            icon="🏛️"
            services={governmentServices}
            expanded={expandedCategories.has(
              "government",
            )}
            hubBackground="#fff4e8"
            hubTextColor="#7a3500"
            hubAccentColor="#ef6c00"
            onToggle={() =>
              toggleCategory("government")
            }
            onServiceClick={handleServiceClick}
          />
        </div>

        <ShopBanner
          shopName={
            shopLoading
              ? "Loading shop..."
              : shopProfile?.name
          }
          address={
            shopLoading
              ? "Please wait"
              : shopProfile?.address
          }
          onRegisterShop={() =>
            setRegistrationPanelOpen(true)
          }
        />

        <AppFooter
          onContact={() =>
            console.log("Contact selected")
          }
          onLocation={() =>
            console.log("Location selected")
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
            setRegistrationPanelOpen(false)
          }
          onRegistered={handleRegisteredShop}
        />
      )}

      {shopQrPanelOpen && shopProfile && (
  <ShopQrPanel
    shopCode={shopProfile.code}
    shopName={shopProfile.name}
    address={shopProfile.address}
    onClose={() =>
      setShopQrPanelOpen(false)
    }
  />
)}
    </main>
  );
}