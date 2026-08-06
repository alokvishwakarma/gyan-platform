import {
  type FormEvent,
  useMemo,
  useState,
} from "react";
import {
  Link,
  useNavigate,
  useParams,
} from "react-router-dom";

import { RequestFieldRenderer } from "../components/RequestFieldRenderer";
import { currentShop } from "../config/currentShop";
import { services } from "../config/services";
import { saveServiceRequest } from "../services/serviceRequestStorage";
import type { RequestField } from "../types/shop";
import { createRequestId } from "../utils/createRequestId";

type FieldValue = string | number;

interface CustomerForm {
  name: string;
  phone: string;
  email: string;
}

export function ServiceRequestPage() {
  const { serviceId } = useParams<{
    serviceId: string;
  }>();

  const navigate = useNavigate();

  const service = serviceId
    ? services[serviceId]
    : undefined;

  const [customer, setCustomer] =
    useState<CustomerForm>({
      name: "",
      phone: "",
      email: "",
    });

  const [values, setValues] = useState<
    Record<string, FieldValue>
  >({});

  const [files, setFiles] = useState<
    Record<string, File[]>
  >({});

  const [requestedDate, setRequestedDate] =
    useState("");

  const [requestedTime, setRequestedTime] =
    useState("");

  const [errors, setErrors] = useState<
    Record<string, string>
  >({});

  const requestFields = useMemo(
    () => service?.requestFields ?? [],
    [service],
  );

  function updateCustomer(
    field: keyof CustomerForm,
    value: string,
  ) {
    setCustomer((currentCustomer) => ({
      ...currentCustomer,
      [field]: value,
    }));
  }

  function updateValue(
    fieldId: string,
    value: FieldValue,
  ) {
    setValues((currentValues) => ({
      ...currentValues,
      [fieldId]: value,
    }));
  }

  function validateField(
    field: RequestField,
  ): string | undefined {
    if (!field.required) {
      return undefined;
    }

    if (field.type === "FILE") {
      const selectedFiles =
        files[field.id] ?? [];

      return selectedFiles.length === 0
        ? `${field.label} is required.`
        : undefined;
    }

    const value = values[field.id];

    if (
      value === undefined ||
      value === null ||
      String(value).trim() === ""
    ) {
      return `${field.label} is required.`;
    }

    return undefined;
  }

  function validateForm(): boolean {
    const nextErrors: Record<string, string> =
      {};

    if (!customer.name.trim()) {
      nextErrors.customerName =
        "Customer name is required.";
    }

    if (!customer.phone.trim()) {
      nextErrors.customerPhone =
        "Phone number is required.";
    } else if (
      !/^[0-9+\-\s]{8,15}$/.test(
        customer.phone.trim(),
      )
    ) {
      nextErrors.customerPhone =
        "Enter a valid phone number.";
    }

    for (const field of requestFields) {
      const fieldError = validateField(field);

      if (fieldError) {
        nextErrors[field.id] = fieldError;
      }
    }

    setErrors(nextErrors);

    return Object.keys(nextErrors).length === 0;
  }

  function handleSubmit(
    event: FormEvent<HTMLFormElement>,
  ) {
    event.preventDefault();

    if (!service || !validateForm()) {
      return;
    }

    const fileNames = Object.values(files)
      .flat()
      .map((file) => file.name);

    const requestId = createRequestId();

    saveServiceRequest({
      id: requestId,
      shopId: currentShop.id,
      serviceId: service.id,
      status: "SUBMITTED",

      customer: {
        name: customer.name.trim(),
        phone: customer.phone.trim(),
        email:
          customer.email.trim() || undefined,
      },

      requestedDate:
        requestedDate || undefined,

      requestedTime:
        requestedTime || undefined,

      values,
      fileNames,
      createdAt: new Date().toISOString(),
    });

    navigate(`/request-success/${requestId}`);
  }

  if (!service) {
    return (
      <main className="request-page">
        <Link
          to="/"
          className="request-page__back"
        >
          ← Back to home
        </Link>

        <section className="request-card">
          <h1>Service not found</h1>

          <p>
            This service is not configured for the
            current shop.
          </p>
        </section>
      </main>
    );
  }

  return (
    <main className="request-page">
      <Link
        to="/"
        className="request-page__back"
      >
        ← Back to home
      </Link>

      <header className="request-header">
        <div className="request-header__icon">
          {service.icon}
        </div>

        <div>
          <p className="request-header__shop">
            {currentShop.name}
          </p>

          <h1>{service.title}</h1>

          <p>{service.description}</p>
        </div>
      </header>

      <form
        className="request-form"
        onSubmit={handleSubmit}
        noValidate
      >
        <section className="request-card">
          <div className="request-section-heading">
            <span>1</span>

            <div>
              <h2>Your details</h2>
              <p>
                We will use these details to confirm
                the request.
              </p>
            </div>
          </div>

          <div className="request-field">
            <label htmlFor="customerName">
              Name
              <span className="request-field__required">
                {" "}
                *
              </span>
            </label>

            <input
              id="customerName"
              type="text"
              value={customer.name}
              placeholder="Enter your name"
              onChange={(event) =>
                updateCustomer(
                  "name",
                  event.target.value,
                )
              }
            />

            {errors.customerName && (
              <p className="request-field__error">
                {errors.customerName}
              </p>
            )}
          </div>

          <div className="request-field">
            <label htmlFor="customerPhone">
              Phone number
              <span className="request-field__required">
                {" "}
                *
              </span>
            </label>

            <input
              id="customerPhone"
              type="tel"
              inputMode="tel"
              value={customer.phone}
              placeholder="Enter your phone number"
              onChange={(event) =>
                updateCustomer(
                  "phone",
                  event.target.value,
                )
              }
            />

            {errors.customerPhone && (
              <p className="request-field__error">
                {errors.customerPhone}
              </p>
            )}
          </div>

          <div className="request-field">
            <label htmlFor="customerEmail">
              Email
            </label>

            <input
              id="customerEmail"
              type="email"
              value={customer.email}
              placeholder="Optional"
              onChange={(event) =>
                updateCustomer(
                  "email",
                  event.target.value,
                )
              }
            />
          </div>
        </section>

        <section className="request-card">
          <div className="request-section-heading">
            <span>2</span>

            <div>
              <h2>Request details</h2>
              <p>
                Tell the shop what you need.
              </p>
            </div>
          </div>

          {requestFields.map((field) => (
            <RequestFieldRenderer
              key={field.id}
              field={field}
              value={values[field.id] ?? ""}
              error={errors[field.id]}
              onValueChange={updateValue}
              setFiles={setFiles}
            />
          ))}
        </section>

        {currentShop.pickupEnabled && (
          <section className="request-card">
            <div className="request-section-heading">
              <span>3</span>

              <div>
                <h2>Preferred pickup</h2>

                <p>
                  The shop will confirm the final
                  pickup time.
                </p>
              </div>
            </div>

            <div className="request-form__row">
              <div className="request-field">
                <label htmlFor="requestedDate">
                  Preferred date
                </label>

                <input
                  id="requestedDate"
                  type="date"
                  value={requestedDate}
                  onChange={(event) =>
                    setRequestedDate(
                      event.target.value,
                    )
                  }
                />
              </div>

              <div className="request-field">
                <label htmlFor="requestedTime">
                  Preferred time
                </label>

                <input
                  id="requestedTime"
                  type="time"
                  value={requestedTime}
                  onChange={(event) =>
                    setRequestedTime(
                      event.target.value,
                    )
                  }
                />
              </div>
            </div>
          </section>
        )}

        {service.id ===
          "prescriptionUpload" && (
          <aside className="request-notice">
            <strong>Pharmacy review required</strong>

            <p>
              Uploading a prescription does not
              guarantee availability or approval.
              The pharmacy will review the request
              before confirming it.
            </p>
          </aside>
        )}

        <button
          type="submit"
          className="request-submit-button"
        >
          Submit request
          <span aria-hidden="true">→</span>
        </button>
      </form>
    </main>
  );
}