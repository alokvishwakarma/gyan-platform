import {
  useState,
} from "react";

import "./AdminServiceStudioScreen.css";

type StudioSection =
  | "general"
  | "form";

interface AdminServiceStudioScreenProps {
  serviceCode: string;
  serviceName: string;

  onBack: () => void;
  onOpenForm: () => void;
}

export default function AdminServiceStudioScreen({
  serviceCode,
  serviceName,
  onBack,
  onOpenForm,
}: AdminServiceStudioScreenProps) {
  const [
    selectedSection,
    setSelectedSection,
  ] = useState<StudioSection>(
    "general",
  );

  return (
    <main className="admin-service-studio">
      <header className="admin-service-studio__header">
        <button
          type="button"
          onClick={onBack}
          aria-label="Back to services"
          title="Back to services"
        >
          ←
        </button>

        <div>
          <strong>
            GYAN STUDIO
          </strong>

          <span>
            {serviceName}
          </span>
        </div>

        <span className="admin-service-studio__code">
          {serviceCode}
        </span>
      </header>

      <div className="admin-service-studio__layout">
        <nav
          className="admin-service-studio__navigation"
          aria-label={`${serviceName} configuration`}
        >
          <button
            type="button"
            className={
              selectedSection ===
              "general"
                ? "is-active"
                : ""
            }
            onClick={() =>
              setSelectedSection(
                "general",
              )
            }
          >
            <span aria-hidden="true">
              ⚙
            </span>

            <div>
              <strong>
                General
              </strong>

              <small>
                Service identity and behavior
              </small>
            </div>
          </button>

          <button
            type="button"
            className={
              selectedSection ===
              "form"
                ? "is-active"
                : ""
            }
            onClick={() => {
              setSelectedSection(
                "form",
              );

              onOpenForm();
            }}
          >
            <span aria-hidden="true">
              ▤
            </span>

            <div>
              <strong>
                Request Form
              </strong>

              <small>
                Sections, fields and validation
              </small>
            </div>
          </button>

          <div className="admin-service-studio__future">
            <span>
              Future configuration
            </span>
          </div>

          <button
            type="button"
            disabled
          >
            <span aria-hidden="true">
              ✉
            </span>

            <div>
              <strong>
                Email
              </strong>

              <small>
                Customer and shop templates
              </small>
            </div>
          </button>

          <button
            type="button"
            disabled
          >
            <span aria-hidden="true">
              ⇢
            </span>

            <div>
              <strong>
                Workflow
              </strong>

              <small>
                Request statuses and steps
              </small>
            </div>
          </button>

          <button
            type="button"
            disabled
          >
            <span aria-hidden="true">
              ₹
            </span>

            <div>
              <strong>
                Pricing
              </strong>

              <small>
                Estimates and rate rules
              </small>
            </div>
          </button>

          <button
            type="button"
            disabled
          >
            <span aria-hidden="true">
              🔔
            </span>

            <div>
              <strong>
                Notifications
              </strong>

              <small>
                Email, WhatsApp and alerts
              </small>
            </div>
          </button>
        </nav>

        <section className="admin-service-studio__content">
          {selectedSection ===
            "general" && (
            <>
              <div className="admin-service-studio__eyebrow">
                SERVICE CONFIGURATION
              </div>

              <h1>
                {serviceName}
              </h1>

              <p>
                Configure how this service
                appears and behaves across
                GYAN.
              </p>

              <div className="admin-service-studio__summary">
                <div>
                  <span>
                    Service code
                  </span>

                  <strong>
                    {serviceCode}
                  </strong>
                </div>

                <div>
                  <span>
                    Request form
                  </span>

                  <strong>
                    Configurable
                  </strong>
                </div>

                <div>
                  <span>
                    Platform mode
                  </span>

                  <strong>
                    Service definition
                  </strong>
                </div>
              </div>

              <section className="admin-service-studio__card">
                <h2>
                  General settings
                </h2>

                <p>
                  The existing Global
                  Services screen currently
                  controls this service’s
                  enabled status and display
                  order.
                </p>

                <p>
                  In a later step, the
                  service name, description,
                  category, icon, workflow
                  type and other settings can
                  move into this page.
                </p>
              </section>

              <section className="admin-service-studio__card">
                <h2>
                  Request form
                </h2>

                <p>
                  Define visible or hidden
                  sections, mandatory or
                  optional fields, choices,
                  email inclusion and request
                  display settings.
                </p>

                <button
                  type="button"
                  className="admin-service-studio__primary"
                  onClick={onOpenForm}
                >
                  Open form designer
                </button>
              </section>
            </>
          )}
        </section>
      </div>
    </main>
  );
}