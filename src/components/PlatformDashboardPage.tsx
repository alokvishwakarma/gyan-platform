import {
  useState,
} from "react";

import AdminPuzzleScreen
  from "./AdminPuzzleScreen";

import "./PlatformDashboardPage.css";

interface PlatformDashboardPageProps {
  onBack: () => void;
  onAddShop: () => void;
  onOpenShops: () => void;
  onOpenServices: () => void;
  onOpenStorage: () => void;
  onOpenAnalytics?: () => void;
}

export default function PlatformDashboardPage({
  onBack,
  onAddShop,
  onOpenShops,
  onOpenServices,
  onOpenStorage,
  onOpenAnalytics,
}: PlatformDashboardPageProps) {
  const [
    showPuzzles,
    setShowPuzzles,
  ] =
    useState(false);

  /*
   * Keep puzzle administration
   * completely inside the platform
   * dashboard.
   *
   * No App.tsx navigation change
   * is required.
   */
  if (showPuzzles) {
    return (
      <AdminPuzzleScreen
        onBack={() =>
          setShowPuzzles(
            false,
          )
        }
      />
    );
  }

  return (
    <main className="platform-dashboard">
      <header className="platform-dashboard__header">
        <button
          type="button"
          onClick={
            onBack
          }
          aria-label="Back"
        >
          ←
        </button>

        <div>
          <span>
            📖
          </span>

          <strong>
            GYAN Platform
          </strong>
        </div>
      </header>

      <section className="platform-dashboard__content">
        <div className="platform-dashboard__intro">
          <span>
            Platform administration
          </span>

          <h1>
            Build the GYAN network
          </h1>

          <p>
            Add shops and maintain
            the reusable global
            service catalog.
          </p>
        </div>

        <section className="platform-dashboard__hero">
          <span
            aria-hidden="true"
          >
            🏪
          </span>

          <div>
            <small>
              Featured action
            </small>

            <h2>
              Add a new shop
            </h2>

            <p>
              Create a partner
              profile and generate
              its four-character
              GYAN shop code.
            </p>
          </div>

          <button
            type="button"
            onClick={
              onAddShop
            }
          >
            Add shop
          </button>
        </section>

        <div className="platform-dashboard__grid">
          <button
            type="button"
            onClick={
              onOpenShops
            }
          >
            <span>
              🏬
            </span>

            <strong>
              Shops
            </strong>

            <small>
              Manage registered
              shops
            </small>
          </button>

          <button
            type="button"
            onClick={
              onOpenServices
            }
          >
            <span>
              🧩
            </span>

            <strong>
              Global services
            </strong>

            <small>
              Edit templates
              and forms
            </small>
          </button>

          <button
            type="button"
            onClick={
              onOpenStorage
            }
          >
            <span>
              ☁️
            </span>

            <strong>
              Storage
            </strong>

            <small>
              Review usage
              and limits
            </small>
          </button>

          <button
            type="button"
          >
            <span>
              📨
            </span>

            <strong>
              Requests
            </strong>

            <small>
              Platform request
              overview
            </small>
          </button>

          <button
            type="button"
            onClick={() =>
              setShowPuzzles(
                true,
              )
            }
          >
            <span>
              🧠
            </span>

            <strong>
              Daily Puzzles
            </strong>

            <small>
              Review scrambled
              and solved boards
            </small>
          </button>

          <button
  type="button"
  className="platform-dashboard__card"
  onClick={
    onOpenAnalytics
  }
>
  <span
    className="platform-dashboard__card-icon"
    aria-hidden="true"
  >
    📊
  </span>

  <span
    className="platform-dashboard__card-copy"
  >
    <strong>
      Analytics
    </strong>

    <small>
      Visitors, locations, puzzles and activity
    </small>
  </span>

  <span
    aria-hidden="true"
  >
    ›
  </span>
</button>

        </div>
      </section>
    </main>
  );
}