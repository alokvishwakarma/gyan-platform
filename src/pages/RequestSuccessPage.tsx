import {
  Link,
  useParams,
} from "react-router-dom";

import { currentShop } from "../config/currentShop";
import { services } from "../config/services";
import { getServiceRequestById } from "../services/serviceRequestStorage";

export function RequestSuccessPage() {
  const { requestId } = useParams<{
    requestId: string;
  }>();

  const request = requestId
    ? getServiceRequestById(requestId)
    : undefined;

  const service = request
    ? services[request.serviceId]
    : undefined;

  if (!request || !service) {
    return (
      <main className="success-page">
        <section className="success-card">
          <h1>Request not found</h1>

          <Link to="/">
            Return to home
          </Link>
        </section>
      </main>
    );
  }

  return (
    <main className="success-page">
      <section className="success-card">
        <div className="success-card__icon">
          ✓
        </div>

        <p className="success-card__eyebrow">
          Request submitted
        </p>

        <h1>Thank you, {request.customer.name}</h1>

        <p>
          Your {service.shortTitle.toLowerCase()}{" "}
          request has been sent to{" "}
          <strong>{currentShop.name}</strong>.
        </p>

        <div className="success-card__request-id">
          <span>Request number</span>
          <strong>{request.id}</strong>
        </div>

        <div className="success-card__status">
          <span className="success-card__status-dot" />

          Waiting for shop confirmation
        </div>

        <p className="success-card__note">
          The shop can contact you at{" "}
          <strong>{request.customer.phone}</strong>.
        </p>

        <div className="success-card__actions">
          <Link
            to="/"
            className="success-card__primary-action"
          >
            Return home
          </Link>

          <Link
            to="/requests"
            className="success-card__secondary-action"
          >
            View requests
          </Link>
        </div>
      </section>
    </main>
  );
}