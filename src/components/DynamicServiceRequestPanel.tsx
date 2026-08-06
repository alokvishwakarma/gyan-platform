import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./DynamicServiceRequestPanel.css";

type DynamicFieldType =
  | "text"
  | "textarea"
  | "number"
  | "email"
  | "tel"
  | "date"
  | "select"
  | "radio"
  | "checkbox"
  | "checkbox-group"
  | "file";

type StorageState =
  | "normal"
  | "warning"
  | "stopped";

interface DynamicFieldOption {
  value: string;
  label: string;
}

interface DynamicFieldValidation {
  minimum?: number;
  maximum?: number;
  minimumLength?: number;
  maximumLength?: number;
}

interface DynamicServiceField {
  key: string;
  label: string;
  type: DynamicFieldType;
  required: boolean;

  placeholder: string;
  helpText: string;
  defaultValue: string;

  options: DynamicFieldOption[];

  validation:
    DynamicFieldValidation;

  sortOrder: number;
}

interface DynamicServiceSection {
  key: string;
  label: string;
  description: string;
  sortOrder: number;

  fields:
    DynamicServiceField[];
}

interface DynamicServiceFormResponse {
  shop?: {
    code: string;
    name: string;
  };

  service?: {
    code: string;
    name: string;
    description: string;
    icon: string;
    color: string;
    category: string;
    subCategory:
      | string
      | null;
    workflowType: string;
  };

  form?: {
    sections:
      DynamicServiceSection[];

    hasConfiguration:
      boolean;
  };

  error?: string;
}

interface LocationHintResponse {
  countryCode?: string;
  country?: string;

  currencyCode?: string;
  currencySymbol?: string;

  region?: string;
  regionCode?: string;
  city?: string;
  postalCode?: string;

  timezone?: string;

  source?: "ip" | "browser" | "unknown";
  approximate?: boolean;

  error?: string;
}

interface CreateServiceRequestResponse {
  request?: {
    requestNumber: string;
    status: string;
    createdAt: string;
    serviceCode: string;
    serviceName: string;
    fileCount: number;
  };

  storage?: {
    state: StorageState;
    warningActive?: boolean;
    usedBytes?: number;
    projectedBytes?: number;
    stopBytes?: number;
  };

  error?: string;
}

interface DynamicServiceRequestPanelProps {
  shopCode: string;
  serviceCode: string;

  serviceName?: string;

  shopName?:
    | string
    | null;

  onClose: () => void;
}

type FieldValue =
  | string
  | boolean
  | string[]
  | File[];

type FormValues =
  Record<string, FieldValue>;

type FieldErrors =
  Record<string, string>;

interface SubmittedAnswer {
  sectionKey: string;
  fieldKey: string;

  value:
    | string
    | boolean
    | string[];
}

function createFieldId(
  sectionKey: string,
  fieldKey: string,
): string {
  return `${sectionKey}.${fieldKey}`;
}

function createInitialValue(
  field: DynamicServiceField,
): FieldValue {
  if (
    field.type ===
    "checkbox"
  ) {
    return (
      field.defaultValue ===
      "true"
    );
  }

  if (
    field.type ===
    "checkbox-group"
  ) {
    return [];
  }

  if (
    field.type ===
    "file"
  ) {
    return [];
  }

  return (
    field.defaultValue ??
    ""
  );
}

function getFileDescription(
  files: File[],
): string {
  if (
    files.length === 0
  ) {
    return "No files selected";
  }

  if (
    files.length === 1
  ) {
    return files[0].name;
  }

  return `${files.length} files selected`;
}

function getFiles(
  value:
    | FieldValue
    | undefined,
): File[] {
  if (
    !Array.isArray(value)
  ) {
    return [];
  }

  return value.filter(
    (
      item,
    ): item is File =>
      item instanceof File,
  );
}

function getStringSelections(
  value:
    | FieldValue
    | undefined,
): string[] {
  if (
    !Array.isArray(value)
  ) {
    return [];
  }

  return value.filter(
    (
      item,
    ): item is string =>
      typeof item ===
      "string",
  );
}

export default function DynamicServiceRequestPanel({
  shopCode,
  serviceCode,
  serviceName,
  shopName,
  onClose,
}: DynamicServiceRequestPanelProps) {
  const [
    responseData,
    setResponseData,
  ] =
    useState<DynamicServiceFormResponse | null>(
      null,
    );

  const [
    values,
    setValues,
  ] =
    useState<FormValues>({});

  const [
    fieldErrors,
    setFieldErrors,
  ] =
    useState<FieldErrors>({});

  const [
    loading,
    setLoading,
  ] =
    useState(true);

  const [
    submitting,
    setSubmitting,
  ] =
    useState(false);

  const [
    loadError,
    setLoadError,
  ] =
    useState("");

  const [
    submissionError,
    setSubmissionError,
  ] =
    useState("");

  const [
    createdRequest,
    setCreatedRequest,
  ] =
    useState<
      CreateServiceRequestResponse["request"] |
        null
    >(null);

  const [
    storageState,
    setStorageState,
  ] =
    useState<StorageState>(
      "normal",
    );

  const [
    showOptionalDetails,
    setShowOptionalDetails,
  ] =
    useState(false);

  const [
    locationHint,
    setLocationHint,
  ] =
    useState<LocationHintResponse | null>(
      null,
    );

  useEffect(() => {
    const controller =
      new AbortController();

    async function loadDefinition() {
      try {
        const response =
          await fetch(
            `/api/shops/${encodeURIComponent(
              shopCode,
            )}/services/${encodeURIComponent(
              serviceCode,
            )}/form`,
            {
              signal:
                controller.signal,
            },
          );

        const result =
          (await response.json()) as
            DynamicServiceFormResponse;

        if (
          !response.ok ||
          !result.service ||
          !result.form
        ) {
          throw new Error(
            result.error ??
              "The service request form could not be loaded.",
          );
        }

        const initialValues:
          FormValues = {};

        for (
          const section
          of result.form.sections
        ) {
          for (
            const field
            of section.fields
          ) {
            initialValues[
              createFieldId(
                section.key,
                field.key,
              )
            ] =
              createInitialValue(
                field,
              );
          }
        }

        setResponseData(
          result,
        );

        setValues(
          initialValues,
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

        setLoadError(
          error instanceof Error
            ? error.message
            : "The service request form could not be loaded.",
        );
      } finally {
        if (
          !controller.signal
            .aborted
        ) {
          setLoading(
            false,
          );
        }
      }
    }

    void loadDefinition();

    return () => {
      controller.abort();
    };
  }, [
    shopCode,
    serviceCode,
  ]);

  useEffect(() => {
    const controller =
      new AbortController();

    function inferBrowserCountry():
      "IN" | "US" | "OTHER" {
      const timezone =
        Intl.DateTimeFormat()
          .resolvedOptions()
          .timeZone
          ?.toLowerCase() ??
        "";

      const languages =
        (
          navigator.languages ??
          [navigator.language]
        )
          .join(",")
          .toLowerCase();

      if (
        timezone ===
          "asia/kolkata" ||
        timezone ===
          "asia/calcutta" ||
        languages.includes(
          "en-in",
        ) ||
        languages.includes(
          "hi-in",
        )
      ) {
        return "IN";
      }

      if (
        timezone.startsWith(
          "america/",
        ) ||
        languages.includes(
          "en-us",
        )
      ) {
        return "US";
      }

      return "OTHER";
    }

    const browserCountry =
      inferBrowserCountry();

    setLocationHint({
      countryCode:
        browserCountry,

      country:
        browserCountry === "IN"
          ? "India"
          : browserCountry === "US"
            ? "United States"
            : "Other",

      currencyCode:
        browserCountry === "IN"
          ? "INR"
          : browserCountry === "US"
            ? "USD"
            : undefined,

      currencySymbol:
        browserCountry === "IN"
          ? "₹"
          : browserCountry === "US"
            ? "$"
            : undefined,

      timezone:
        Intl.DateTimeFormat()
          .resolvedOptions()
          .timeZone,

      source:
        "browser",

      approximate: true,
    });

    async function loadLocationHint() {
      try {
        const browserTimezone =
          Intl.DateTimeFormat()
            .resolvedOptions()
            .timeZone;

        const browserLanguages =
          navigator.languages ??
          [navigator.language];

        const response =
          await fetch(
            "/api/location-hint",
            {
              signal:
                controller.signal,

              headers: {
                "x-gyan-timezone":
                  browserTimezone,

                "x-gyan-languages":
                  browserLanguages.join(
                    ",",
                  ),
              },
            },
          );

        const contentType =
          response.headers.get(
            "content-type",
          ) ?? "";

        if (
          !response.ok ||
          !contentType.includes(
            "application/json",
          )
        ) {
          return;
        }

        const result =
          (await response.json()) as
            LocationHintResponse;

        if (
          controller.signal.aborted
        ) {
          return;
        }

        if (
          result.countryCode
        ) {
          setLocationHint(
            result,
          );
        }
      } catch (error) {
        if (
          error instanceof
            DOMException &&
          error.name ===
            "AbortError"
        ) {
          return;
        }

        console.warn(
          "Using browser country fallback:",
          error,
        );
      }
    }

    void loadLocationHint();

    return () => {
      controller.abort();
    };
  }, []);

  useEffect(() => {
    if (!locationHint) {
      return;
    }

    const countryValue =
      locationHint.countryCode ===
      "IN"
        ? "IN"
        : locationHint.countryCode ===
            "US"
          ? "US"
          : locationHint.countryCode
            ? "OTHER"
            : "";

    setValues(
      (current) => {
        const next = {
          ...current,
        };

        const defaults: Array<
          [string, string | undefined]
        > = [
          [
            "address.country",
            countryValue,
          ],
          [
            "address.state_region",
            locationHint.region,
          ],
          [
            "address.city",
            locationHint.city,
          ],
          [
            "address.postal_code",
            locationHint.postalCode,
          ],
        ];

        let changed = false;

        for (
          const [
            fieldId,
            suggestedValue,
          ] of defaults
        ) {
          if (
            !suggestedValue ||
            !(fieldId in next)
          ) {
            continue;
          }

          const currentValue =
            next[fieldId];

          if (
            typeof currentValue ===
              "string" &&
            currentValue.trim() ===
              ""
          ) {
            next[fieldId] =
              suggestedValue;

            changed = true;
          }
        }

        return changed
          ? next
          : current;
      },
    );
  }, [
    locationHint,
    responseData,
  ]);

  const sections =
    useMemo(
      () =>
        [
          ...(
            responseData
              ?.form
              ?.sections ??
            []
          ),
        ].sort(
          (
            first,
            second,
          ) =>
            first.sortOrder -
            second.sortOrder,
        ),
      [responseData],
    );

  const totalFileCount =
    useMemo(
      () => {
        let count = 0;

        for (
          const section
          of sections
        ) {
          for (
            const field
            of section.fields
          ) {
            if (
              field.type !==
              "file"
            ) {
              continue;
            }

            const fieldId =
              createFieldId(
                section.key,
                field.key,
              );

            count +=
              getFiles(
                values[fieldId],
              ).length;
          }
        }

        return count;
      },
      [
        sections,
        values,
      ],
    );

  function updateValue(
    fieldId: string,
    value: FieldValue,
  ) {
    setValues(
      (current) => ({
        ...current,
        [fieldId]:
          value,
      }),
    );

    setFieldErrors(
      (current) => {
        if (
          !current[fieldId]
        ) {
          return current;
        }

        const next = {
          ...current,
        };

        delete next[
          fieldId
        ];

        return next;
      },
    );

    setSubmissionError(
      "",
    );
  }

  function validateField(
    field:
      DynamicServiceField,

    value:
      | FieldValue
      | undefined,
  ): string | null {
    if (
      field.type ===
      "file"
    ) {
      const files =
        getFiles(value);

      if (
        field.required &&
        files.length === 0
      ) {
        return `${field.label} is required.`;
      }

      return null;
    }

    if (
      field.type ===
      "checkbox-group"
    ) {
      const selections =
        getStringSelections(
          value,
        );

      if (
        field.required &&
        selections.length ===
          0
      ) {
        return `Select at least one option for ${field.label}.`;
      }

      return null;
    }

    if (
      field.type ===
      "checkbox"
    ) {
      if (
        field.required &&
        value !== true
      ) {
        return `${field.label} must be selected.`;
      }

      return null;
    }

    const text =
      typeof value ===
      "string"
        ? value.trim()
        : "";

    if (
      field.required &&
      !text
    ) {
      return `${field.label} is required.`;
    }

    if (!text) {
      return null;
    }

    if (
      field.validation
        .minimumLength !==
        undefined &&
      text.length <
        field.validation
          .minimumLength
    ) {
      return `${field.label} must contain at least ${field.validation.minimumLength} characters.`;
    }

    if (
      field.validation
        .maximumLength !==
        undefined &&
      text.length >
        field.validation
          .maximumLength
    ) {
      return `${field.label} cannot exceed ${field.validation.maximumLength} characters.`;
    }

    if (
      field.type ===
      "number"
    ) {
      const numericValue =
        Number(text);

      if (
        !Number.isFinite(
          numericValue,
        )
      ) {
        return `${field.label} must be a valid number.`;
      }

      if (
        field.validation
          .minimum !==
          undefined &&
        numericValue <
          field.validation
            .minimum
      ) {
        return `${field.label} must be at least ${field.validation.minimum}.`;
      }

      if (
        field.validation
          .maximum !==
          undefined &&
        numericValue >
          field.validation
            .maximum
      ) {
        return `${field.label} cannot exceed ${field.validation.maximum}.`;
      }
    }

    return null;
  }

  function validateForm():
    boolean {
    const nextErrors:
      FieldErrors = {};

    for (
      const section
      of sections
    ) {
      for (
        const field
        of section.fields
      ) {
        const fieldId =
          createFieldId(
            section.key,
            field.key,
          );

        const error =
          validateField(
            field,
            values[fieldId],
          );

        if (error) {
          nextErrors[
            fieldId
          ] = error;
        }
      }
    }

    setFieldErrors(
      nextErrors,
    );

    return (
      Object.keys(
        nextErrors,
      ).length === 0
    );
  }

  function createAnswers():
    SubmittedAnswer[] {
    const answers:
      SubmittedAnswer[] = [];

    for (
      const section
      of sections
    ) {
      for (
        const field
        of section.fields
      ) {
        if (
          field.type ===
          "file"
        ) {
          continue;
        }

        const fieldId =
          createFieldId(
            section.key,
            field.key,
          );

        const value =
          values[fieldId];

        if (
          typeof value ===
            "string" ||
          typeof value ===
            "boolean"
        ) {
          answers.push({
            sectionKey:
              section.key,

            fieldKey:
              field.key,

            value,
          });

          continue;
        }

        const selections =
          getStringSelections(
            value,
          );

        answers.push({
          sectionKey:
            section.key,

          fieldKey:
            field.key,

          value:
            selections,
        });
      }
    }

    return answers;
  }

  function appendFiles(
    formData: FormData,
  ) {
    for (
      const section
      of sections
    ) {
      for (
        const field
        of section.fields
      ) {
        if (
          field.type !==
          "file"
        ) {
          continue;
        }

        const fieldId =
          createFieldId(
            section.key,
            field.key,
          );

        const files =
          getFiles(
            values[fieldId],
          );

        for (
          const file
          of files
        ) {
          formData.append(
            `file:${section.key}:${field.key}`,
            file,
            file.name,
          );
        }
      }
    }
  }

  async function handleSubmit(
    event:
      React.FormEvent<HTMLFormElement>,
  ) {
    event.preventDefault();

    setSubmissionError(
      "",
    );

    if (
      !validateForm()
    ) {
      return;
    }

    const formData =
      new FormData();

    formData.append(
      "metadata",
      JSON.stringify({
        answers:
          createAnswers(),
      }),
    );

    appendFiles(
      formData,
    );

    setSubmitting(
      true,
    );

    try {
      const response =
        await fetch(
          `/api/shops/${encodeURIComponent(
            shopCode,
          )}/services/${encodeURIComponent(
            serviceCode,
          )}/requests`,
          {
            method: "POST",
            body: formData,
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
          "The server returned an unexpected response.",
        );
      }

      const result =
        (await response.json()) as
          CreateServiceRequestResponse;

      setStorageState(
        result.storage
          ?.state ??
          "normal",
      );

      if (
        !response.ok ||
        !result.request
      ) {
        throw new Error(
          result.error ??
            "The service request could not be submitted.",
        );
      }

      setCreatedRequest(
        result.request,
      );
    } catch (error) {
      setSubmissionError(
        error instanceof Error
          ? error.message
          : "The service request could not be submitted.",
      );
    } finally {
      setSubmitting(
        false,
      );
    }
  }

  function renderStorageMessage() {
    if (
      storageState ===
      "warning"
    ) {
      return (
        <div className="dynamic-service-request__storage-warning">
          <strong>
            ⚠ Storage warning
          </strong>

          <span>
            GYAN storage is
            approaching its current
            limit. This request was
            accepted, but future file
            uploads may be paused.
          </span>
        </div>
      );
    }

    if (
      storageState ===
      "stopped"
    ) {
      return (
        <div className="dynamic-service-request__storage-stop">
          <strong>
            ⛔ Uploads paused
          </strong>

          <span>
            This request cannot be
            accepted because the
            configured storage limit
            has been reached.
          </span>
        </div>
      );
    }

    return null;
  }

  function renderField(
    section:
      DynamicServiceSection,

    field:
      DynamicServiceField,
  ) {
    const fieldId =
      createFieldId(
        section.key,
        field.key,
      );

    const value =
      values[fieldId];

    const error =
      fieldErrors[fieldId];

    const commonLabel = (
      <span>
        {field.label}

        {!field.required && (
          <small>
            Optional
          </small>
        )}
      </span>
    );

    if (
      field.type ===
      "textarea"
    ) {
      return (
        <label
          key={fieldId}
          className="dynamic-service-request__field"
        >
          {commonLabel}

          <textarea
            rows={4}
            value={
              typeof value ===
              "string"
                ? value
                : ""
            }
            required={
              field.required
            }
            placeholder={
              field.placeholder
            }
            onChange={(
              event,
            ) =>
              updateValue(
                fieldId,
                event.target
                  .value,
              )
            }
          />

          {field.helpText && (
            <small className="dynamic-service-request__help">
              {field.helpText}
            </small>
          )}

          {error && (
            <small className="dynamic-service-request__field-error">
              {error}
            </small>
          )}
        </label>
      );
    }

    if (
      field.type ===
      "select"
    ) {
      return (
        <label
          key={fieldId}
          className="dynamic-service-request__field"
        >
          {commonLabel}

          <select
            value={
              typeof value ===
              "string"
                ? value
                : ""
            }
            required={
              field.required
            }
            onChange={(
              event,
            ) =>
              updateValue(
                fieldId,
                event.target
                  .value,
              )
            }
          >
            <option value="">
              {field.placeholder ||
                "Select an option"}
            </option>

            {field.options.map(
              (option) => (
                <option
                  key={
                    option.value
                  }
                  value={
                    option.value
                  }
                >
                  {option.label}
                </option>
              ),
            )}
          </select>

          {field.helpText && (
            <small className="dynamic-service-request__help">
              {field.helpText}
            </small>
          )}

          {error && (
            <small className="dynamic-service-request__field-error">
              {error}
            </small>
          )}
        </label>
      );
    }

    if (
      field.type ===
      "radio"
    ) {
      return (
        <fieldset
          key={fieldId}
          className="dynamic-service-request__field"
        >
          <legend>
            {field.label}

            {!field.required && (
              <small>
                Optional
              </small>
            )}
          </legend>

          <div className="dynamic-service-request__choices">
            {field.options.map(
              (option) => (
                <label
                  key={
                    option.value
                  }
                >
                  <input
                    type="radio"
                    name={fieldId}
                    value={
                      option.value
                    }
                    checked={
                      value ===
                      option.value
                    }
                    onChange={() =>
                      updateValue(
                        fieldId,
                        option.value,
                      )
                    }
                  />

                  <span>
                    {option.label}
                  </span>
                </label>
              ),
            )}
          </div>

          {field.helpText && (
            <small className="dynamic-service-request__help">
              {field.helpText}
            </small>
          )}

          {error && (
            <small className="dynamic-service-request__field-error">
              {error}
            </small>
          )}
        </fieldset>
      );
    }

    if (
      field.type ===
      "checkbox"
    ) {
      return (
        <div
          key={fieldId}
          className="dynamic-service-request__field"
        >
          <label className="dynamic-service-request__checkbox">
            <input
              type="checkbox"
              checked={
                value === true
              }
              onChange={(
                event,
              ) =>
                updateValue(
                  fieldId,
                  event.target
                    .checked,
                )
              }
            />

            <span>
              {field.label}
            </span>
          </label>

          {field.helpText && (
            <small className="dynamic-service-request__help">
              {field.helpText}
            </small>
          )}

          {error && (
            <small className="dynamic-service-request__field-error">
              {error}
            </small>
          )}
        </div>
      );
    }

    if (
      field.type ===
      "checkbox-group"
    ) {
      const selections =
        getStringSelections(
          value,
        );

      return (
        <fieldset
          key={fieldId}
          className="dynamic-service-request__field"
        >
          <legend>
            {field.label}

            {!field.required && (
              <small>
                Optional
              </small>
            )}
          </legend>

          <div className="dynamic-service-request__choices">
            {field.options.map(
              (option) => {
                const selected =
                  selections.includes(
                    option.value,
                  );

                return (
                  <label
                    key={
                      option.value
                    }
                  >
                    <input
                      type="checkbox"
                      checked={
                        selected
                      }
                      onChange={() => {
                        const next =
                          selected
                            ? selections.filter(
                                (
                                  current,
                                ) =>
                                  current !==
                                  option.value,
                              )
                            : [
                                ...selections,
                                option.value,
                              ];

                        updateValue(
                          fieldId,
                          next,
                        );
                      }}
                    />

                    <span>
                      {option.label}
                    </span>
                  </label>
                );
              },
            )}
          </div>

          {field.helpText && (
            <small className="dynamic-service-request__help">
              {field.helpText}
            </small>
          )}

          {error && (
            <small className="dynamic-service-request__field-error">
              {error}
            </small>
          )}
        </fieldset>
      );
    }

    if (
      field.type ===
      "file"
    ) {
      const files =
        getFiles(
          value,
        );

      return (
        <label
          key={fieldId}
          className="dynamic-service-request__field"
        >
          {commonLabel}

          <div className="dynamic-service-request__file">
            <strong>
              Choose files
            </strong>

            <span>
              {getFileDescription(
                files,
              )}
            </span>

            <input
              type="file"
              multiple
              required={
                field.required
              }
              onChange={(
                event,
              ) =>
                updateValue(
                  fieldId,
                  Array.from(
                    event.target
                      .files ??
                      [],
                  ),
                )
              }
            />
          </div>

          {field.helpText && (
            <small className="dynamic-service-request__help">
              {field.helpText}
            </small>
          )}

          {error && (
            <small className="dynamic-service-request__field-error">
              {error}
            </small>
          )}
        </label>
      );
    }

    const inputType =
      field.type ===
        "number" ||
      field.type ===
        "email" ||
      field.type ===
        "tel" ||
      field.type ===
        "date"
        ? field.type
        : "text";

    return (
      <label
        key={fieldId}
        className="dynamic-service-request__field"
      >
        {commonLabel}

        <input
          type={inputType}
          value={
            typeof value ===
            "string"
              ? value
              : ""
          }
          required={
            field.required
          }
          placeholder={
            field.placeholder
          }
          min={
            field.type ===
            "number"
              ? field.validation
                  .minimum
              : undefined
          }
          max={
            field.type ===
            "number"
              ? field.validation
                  .maximum
              : undefined
          }
          minLength={
            field.validation
              .minimumLength
          }
          maxLength={
            field.validation
              .maximumLength
          }
          onChange={(
            event,
          ) =>
            updateValue(
              fieldId,
              event.target.value,
            )
          }
        />

        {field.helpText && (
          <small className="dynamic-service-request__help">
            {field.helpText}
          </small>
        )}

        {error && (
          <small className="dynamic-service-request__field-error">
            {error}
          </small>
        )}
      </label>
    );
  }

  function isAlwaysVisibleField(
    section:
      DynamicServiceSection,

    field:
      DynamicServiceField,
  ): boolean {
    if (field.required) {
      return true;
    }

    if (
      section.key === "files" &&
      field.type === "file"
    ) {
      return true;
    }

    return false;
  }

  function getVisibleFields(
    section:
      DynamicServiceSection,
  ): DynamicServiceField[] {
    if (showOptionalDetails) {
      return section.fields;
    }

    return section.fields.filter(
      (field) =>
        isAlwaysVisibleField(
          section,
          field,
        ),
    );
  }

  function shouldShowSection(
    section:
      DynamicServiceSection,
  ): boolean {
    if (showOptionalDetails) {
      return true;
    }

    return getVisibleFields(
      section,
    ).length > 0;
  }

  const shownServiceName =
    responseData
      ?.service
      ?.name ??
    serviceName ??
    serviceCode;

  const shownShopName =
    responseData
      ?.shop
      ?.name ??
    shopName ??
    shopCode;

  if (createdRequest) {
    return (
      <div className="dynamic-service-request-overlay">
        <section
          className="dynamic-service-request dynamic-service-request--success"
          role="dialog"
          aria-modal="true"
          aria-labelledby="dynamic-request-success-title"
        >
          <div className="dynamic-service-request__success-icon">
            ✓
          </div>

          <span className="dynamic-service-request__success-eyebrow">
            GYAN SERVICE
          </span>

          <h2 id="dynamic-request-success-title">
            Request submitted
          </h2>

          <p>
            Your {shownServiceName} request
            has been sent to{" "}
            <strong>
              {shownShopName}
            </strong>
            .
          </p>

          <div className="dynamic-service-request__request-number">
            <span>
              Request number
            </span>

            <strong>
              {
                createdRequest.requestNumber
              }
            </strong>
          </div>

          <div className="dynamic-service-request__request-summary">
            <span>
              Status:{" "}
              {createdRequest.status}
            </span>

            <span>
              {createdRequest.fileCount}
              {" file"}
              {createdRequest.fileCount ===
              1
                ? ""
                : "s"}
            </span>
          </div>

          <p className="dynamic-service-request__retention">
            Uploaded files are retained
            for 15 days and are then
            automatically deleted.
          </p>

          {renderStorageMessage()}

          <button
            type="button"
            className="dynamic-service-request__done"
            onClick={onClose}
          >
            Done
          </button>
        </section>
      </div>
    );
  }

  return (
    <div className="dynamic-service-request-overlay">
      <section
        className="dynamic-service-request"
        role="dialog"
        aria-modal="true"
        aria-labelledby="dynamic-service-request-title"
      >
        <header className="dynamic-service-request__header">
          <div>
            <span>
              GYAN SERVICE
            </span>

            <h2 id="dynamic-service-request-title">
              {shownServiceName}
            </h2>

            <small>
              {shownShopName}
            </small>
          </div>

          <button
            type="button"
            onClick={onClose}
            aria-label="Close service request"
          >
            ×
          </button>
        </header>

        <div className="dynamic-service-request__content">
          {loading && (
            <p>
              Loading request form…
            </p>
          )}

          {loadError && (
            <p className="dynamic-service-request__error">
              {loadError}
            </p>
          )}

          {!loading &&
            !loadError &&
            !responseData
              ?.form
              ?.hasConfiguration && (
              <p className="dynamic-service-request__notice">
                This service does not yet
                have a request form
                configured.
              </p>
            )}

          {!loading &&
            !loadError &&
            responseData
              ?.form
              ?.hasConfiguration && (
              <form
                className="dynamic-service-request__form"
                onSubmit={
                  handleSubmit
                }
              >
                {responseData
                  .service
                  ?.description && (
                  <p className="dynamic-service-request__description">
                    {
                      responseData
                        .service
                        .description
                    }
                  </p>
                )}

                {locationHint
                  ?.countryCode && (
                  <div className="dynamic-service-request__location-hint">
                    <span
                      aria-hidden="true"
                    >
                      📍
                    </span>

                    <div>
                      <strong>
                        Location suggested
                      </strong>

                      <small>
                        {[
                          locationHint.city,
                          locationHint.region,
                          locationHint.country,
                        ]
                          .filter(Boolean)
                          .join(", ")}

                        {
                          ". Please verify it before submitting."
                        }
                      </small>
                    </div>
                  </div>
                )}

                {sections
                  .filter(
                    shouldShowSection,
                  )
                  .map(
                  (section) => (
                    <section
                      key={
                        section.key
                      }
                      className="dynamic-service-request__section"
                    >
                      <header>
                        <h3>
                          {
                            section.label
                          }
                        </h3>

                        {section.description && (
                          <p>
                            {
                              section.description
                            }
                          </p>
                        )}
                      </header>

                      <div className="dynamic-service-request__fields">
                        {[
                          ...getVisibleFields(
                            section,
                          ),
                        ]
                          .sort(
                            (
                              first,
                              second,
                            ) =>
                              first.sortOrder -
                              second.sortOrder,
                          )
                          .map(
                            (field) =>
                              renderField(
                                section,
                                field,
                              ),
                          )}
                      </div>
                    </section>
                  ),
                )}

                <button
                  type="button"
                  className="dynamic-service-request__optional-toggle"
                  aria-expanded={
                    showOptionalDetails
                  }
                  onClick={() =>
                    setShowOptionalDetails(
                      (current) =>
                        !current,
                    )
                  }
                >
                  <span
                    aria-hidden="true"
                  >
                    {showOptionalDetails
                      ? "−"
                      : "+"}
                  </span>

                  {showOptionalDetails
                    ? "Hide optional details"
                    : "Add more details"}
                </button>

                <p className="dynamic-service-request__retention-notice">
                  Uploaded files will be
                  retained for 15 days and
                  then automatically deleted.
                </p>

                {renderStorageMessage()}

                {submissionError && (
                  <p
                    className="dynamic-service-request__error"
                    role="alert"
                  >
                    {submissionError}
                  </p>
                )}

                <div className="dynamic-service-request__actions">
                  <button
                    type="button"
                    disabled={
                      submitting
                    }
                    onClick={
                      onClose
                    }
                  >
                    Cancel
                  </button>

                  <button
                    type="submit"
                    disabled={
                      submitting ||
                      storageState ===
                        "stopped"
                    }
                  >
                    {submitting
                      ? "Submitting…"
                      : storageState ===
                          "stopped"
                        ? "Uploads paused"
                        : `Submit request${
                            totalFileCount >
                            0
                              ? ` (${totalFileCount} files)`
                              : ""
                          }`}
                  </button>
                </div>
              </form>
            )}
        </div>
      </section>
    </div>
  );
}