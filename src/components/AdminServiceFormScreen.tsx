import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./AdminServiceFormScreen.css";

type SectionVisibility =
  | "visible"
  | "hidden";

type FieldRequirement =
  | "mandatory"
  | "optional"
  | "hidden";

type FieldType =
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

interface AdminServiceFormScreenProps {
  serviceCode: string;
  onBack: () => void;
}



interface ServiceInformation {
  id: number;
  code: string;
  name: string;
  category?: string;
  subCategory?: string | null;
}

interface FieldOption {
  value: string;
  label: string;
}

interface ServiceField {
  id?: number;

  key: string;
  label: string;
  type: FieldType;

  requirement:
    FieldRequirement;

  placeholder: string;
  helpText: string;
  defaultValue: string;

  options:
    FieldOption[];

  validation:
    Record<string, unknown> | null;

  emailLabel: string;

  includeInShopEmail: boolean;
  includeInCustomerEmail: boolean;
  includeInRequestView: boolean;

  sortOrder: number;
}

interface ServiceSection {
  id?: number;

  key: string;
  label: string;
  description: string;

  visibility:
    SectionVisibility;

  includeInShopEmail: boolean;
  includeInCustomerEmail: boolean;

  sortOrder: number;

  fields:
    ServiceField[];
}

interface ServiceFormResponse {
  service?: ServiceInformation;

  limits?: {
    maximumSections: number;
    maximumFieldsPerSection: number;
  };

  sections?: ServiceSection[];

  message?: string;
  error?: string;
}

const DEFAULT_MAXIMUM_SECTIONS =
  10;

const DEFAULT_MAXIMUM_FIELDS =
  15;

const fieldTypes: {
  value: FieldType;
  label: string;
}[] = [
  {
    value: "text",
    label: "Text",
  },
  {
    value: "textarea",
    label: "Long text",
  },
  {
    value: "number",
    label: "Number",
  },
  {
    value: "email",
    label: "Email",
  },
  {
    value: "tel",
    label: "Telephone",
  },
  {
    value: "date",
    label: "Date",
  },
  {
    value: "select",
    label: "Dropdown",
  },
  {
    value: "radio",
    label: "Radio choices",
  },
  {
    value: "checkbox",
    label: "Checkbox",
  },
  {
    value: "checkbox-group",
    label: "Checkbox choices",
  },
  {
    value: "file",
    label: "File upload",
  },
];

function createKey(
  value: string,
  fallback: string,
): string {
  const generated =
    value
      .trim()
      .toLowerCase()
      .replace(
        /[^a-z0-9_]+/g,
        "_",
      )
      .replace(
        /^_+|_+$/g,
        "",
      )
      .slice(0, 50);

  return generated ||
    fallback;
}

function createSection(
  index: number,
): ServiceSection {
  return {
    key:
      `section_${index}`,

    label:
      `Section ${index}`,

    description: "",

    visibility:
      "visible",

    includeInShopEmail:
      true,

    includeInCustomerEmail:
      true,

    sortOrder:
      index * 10,

    fields: [],
  };
}

function createField(
  index: number,
): ServiceField {
  return {
    key:
      `field_${index}`,

    label:
      `Field ${index}`,

    type:
      "text",

    requirement:
      "optional",

    placeholder: "",
    helpText: "",
    defaultValue: "",

    options: [],

    validation: null,

    emailLabel: "",

    includeInShopEmail:
      true,

    includeInCustomerEmail:
      true,

    includeInRequestView:
      true,

    sortOrder:
      index * 10,
  };
}

function requiresOptions(
  type: FieldType,
): boolean {
  return (
    type === "select" ||
    type === "radio" ||
    type ===
      "checkbox-group"
  );
}

function normalizeSectionsForSave(
  sections:
    ServiceSection[],
): ServiceSection[] {
  return sections.map(
    (
      section,
      sectionIndex,
    ) => ({
      ...section,

      key:
        createKey(
          section.key ||
            section.label,

          `section_${sectionIndex + 1}`,
        ),

      sortOrder:
        (sectionIndex + 1) *
        10,

      fields:
        section.fields.map(
          (
            field,
            fieldIndex,
          ) => ({
            ...field,

            key:
              createKey(
                field.key ||
                  field.label,

                `field_${fieldIndex + 1}`,
              ),

            sortOrder:
              (fieldIndex + 1) *
              10,

            options:
              requiresOptions(
                field.type,
              )
                ? field.options
                    .map(
                      (
                        option,
                        optionIndex,
                      ) => ({
                        value:
                          createKey(
                            option.value ||
                              option.label,

                            `option_${optionIndex + 1}`,
                          ),

                        label:
                          option.label.trim(),
                      }),
                    )
                    .filter(
                      (option) =>
                        option.label,
                    )
                : [],
          }),
        ),
    }),
  );
}

export default function AdminServiceFormScreen({
  serviceCode,
  onBack,
}: AdminServiceFormScreenProps) {
  const [
    service,
    setService,
  ] = useState<
    ServiceInformation | null
  >(null);

  const [
    sections,
    setSections,
  ] = useState<
    ServiceSection[]
  >([]);

  const [
    maximumSections,
    setMaximumSections,
  ] = useState(
    DEFAULT_MAXIMUM_SECTIONS,
  );

  const [
    maximumFieldsPerSection,
    setMaximumFieldsPerSection,
  ] = useState(
    DEFAULT_MAXIMUM_FIELDS,
  );

  const [
    expandedSections,
    setExpandedSections,
  ] = useState<
    Set<number>
  >(new Set());

  const [
    expandedFields,
    setExpandedFields,
  ] = useState<
    Set<string>
  >(new Set());

  const [
    loading,
    setLoading,
  ] = useState(true);

  const [
    saving,
    setSaving,
  ] = useState(false);

  const [
    error,
    setError,
  ] = useState("");

  const [
    message,
    setMessage,
  ] = useState("");

  const totalFieldCount =
    useMemo(
      () =>
        sections.reduce(
          (
            total,
            section,
          ) =>
            total +
            section.fields.length,

          0,
        ),
      [sections],
    );

  useEffect(() => {
    const controller =
      new AbortController();

    async function loadForm() {
      try {
        const response =
          await fetch(
            `/api/admin/services/${encodeURIComponent(
              serviceCode,
            )}/form`,
            {
              credentials:
                "include",

              signal:
                controller.signal,
            },
          );

        const result =
          (await response.json()) as
            ServiceFormResponse;

        if (
          !response.ok ||
          !result.service
        ) {
          throw new Error(
            result.error ??
              "Service form configuration could not be loaded.",
          );
        }

        setService(
          result.service,
        );

        setSections(
          result.sections ??
            [],
        );

        setMaximumSections(
          result.limits
            ?.maximumSections ??
            DEFAULT_MAXIMUM_SECTIONS,
        );

        setMaximumFieldsPerSection(
          result.limits
            ?.maximumFieldsPerSection ??
            DEFAULT_MAXIMUM_FIELDS,
        );

        setExpandedSections(
          new Set(
            (
              result.sections ??
              []
            ).map(
              (
                _section,
                index,
              ) => index,
            ),
          ),
        );
      } catch (caughtError) {
        if (
          caughtError instanceof
            DOMException &&
          caughtError.name ===
            "AbortError"
        ) {
          return;
        }

        setError(
          caughtError instanceof
              Error
            ? caughtError.message
            : "Service form configuration could not be loaded.",
        );
      } finally {
        if (
          !controller.signal
            .aborted
        ) {
          setLoading(false);
        }
      }
    }

    void loadForm();

    return () => {
      controller.abort();
    };
  }, [serviceCode]);

  function clearMessages() {
    setError("");
    setMessage("");
  }

  function toggleSection(
    sectionIndex: number,
  ) {
    setExpandedSections(
      (current) => {
        const next =
          new Set(current);

        if (
          next.has(
            sectionIndex,
          )
        ) {
          next.delete(
            sectionIndex,
          );
        } else {
          next.add(
            sectionIndex,
          );
        }

        return next;
      },
    );
  }

  function toggleField(
    sectionIndex: number,
    fieldIndex: number,
  ) {
    const fieldId =
      `${sectionIndex}-${fieldIndex}`;

    setExpandedFields(
      (current) => {
        const next =
          new Set(current);

        if (
          next.has(fieldId)
        ) {
          next.delete(
            fieldId,
          );
        } else {
          next.add(
            fieldId,
          );
        }

        return next;
      },
    );
  }

  function updateSection(
    sectionIndex: number,
    changes:
      Partial<ServiceSection>,
  ) {
    clearMessages();

    setSections(
      (current) =>
        current.map(
          (
            section,
            index,
          ) =>
            index ===
            sectionIndex
              ? {
                  ...section,
                  ...changes,
                }
              : section,
        ),
    );
  }

  function updateField(
    sectionIndex: number,
    fieldIndex: number,
    changes:
      Partial<ServiceField>,
  ) {
    clearMessages();

    setSections(
      (current) =>
        current.map(
          (
            section,
            currentSectionIndex,
          ) => {
            if (
              currentSectionIndex !==
              sectionIndex
            ) {
              return section;
            }

            return {
              ...section,

              fields:
                section.fields.map(
                  (
                    field,
                    currentFieldIndex,
                  ) =>
                    currentFieldIndex ===
                    fieldIndex
                      ? {
                          ...field,
                          ...changes,
                        }
                      : field,
                ),
            };
          },
        ),
    );
  }

  function addSection() {
    clearMessages();

    if (
      sections.length >=
      maximumSections
    ) {
      setError(
        `A service may contain up to ${maximumSections} sections.`,
      );

      return;
    }

    const nextSection =
      createSection(
        sections.length +
          1,
      );

    setSections(
      (current) => [
        ...current,
        nextSection,
      ],
    );

    setExpandedSections(
      (current) => {
        const next =
          new Set(current);

        next.add(
          sections.length,
        );

        return next;
      },
    );
  }

  function removeSection(
    sectionIndex: number,
  ) {
    clearMessages();

    const section =
      sections[sectionIndex];

    const confirmed =
      window.confirm(
        `Delete "${section.label}" and all of its fields?`,
      );

    if (!confirmed) {
      return;
    }

    setSections(
      (current) =>
        current.filter(
          (
            _section,
            index,
          ) =>
            index !==
            sectionIndex,
        ),
    );

    setExpandedSections(
      new Set(),
    );

    setExpandedFields(
      new Set(),
    );
  }

  function moveSection(
    sectionIndex: number,
    direction:
      -1 | 1,
  ) {
    clearMessages();

    const targetIndex =
      sectionIndex +
      direction;

    if (
      targetIndex < 0 ||
      targetIndex >=
        sections.length
    ) {
      return;
    }

    setSections(
      (current) => {
        const next =
          [...current];

        const temporary =
          next[sectionIndex];

        next[sectionIndex] =
          next[targetIndex];

        next[targetIndex] =
          temporary;

        return next;
      },
    );

    setExpandedSections(
      new Set(),
    );

    setExpandedFields(
      new Set(),
    );
  }

  function addField(
    sectionIndex: number,
  ) {
    clearMessages();

    const section =
      sections[sectionIndex];

    if (
      section.fields.length >=
      maximumFieldsPerSection
    ) {
      setError(
        `A section may contain up to ${maximumFieldsPerSection} fields.`,
      );

      return;
    }

    const nextField =
      createField(
        section.fields.length +
          1,
      );

    updateSection(
      sectionIndex,
      {
        fields: [
          ...section.fields,
          nextField,
        ],
      },
    );

    setExpandedFields(
      (current) => {
        const next =
          new Set(current);

        next.add(
          `${sectionIndex}-${section.fields.length}`,
        );

        return next;
      },
    );
  }

  function removeField(
    sectionIndex: number,
    fieldIndex: number,
  ) {
    clearMessages();

    const field =
      sections[
        sectionIndex
      ].fields[fieldIndex];

    const confirmed =
      window.confirm(
        `Delete field "${field.label}"?`,
      );

    if (!confirmed) {
      return;
    }

    updateSection(
      sectionIndex,
      {
        fields:
          sections[
            sectionIndex
          ].fields.filter(
            (
              _field,
              index,
            ) =>
              index !==
              fieldIndex,
          ),
      },
    );

    setExpandedFields(
      new Set(),
    );
  }

  function moveField(
    sectionIndex: number,
    fieldIndex: number,
    direction:
      -1 | 1,
  ) {
    clearMessages();

    const fields =
      sections[
        sectionIndex
      ].fields;

    const targetIndex =
      fieldIndex +
      direction;

    if (
      targetIndex < 0 ||
      targetIndex >=
        fields.length
    ) {
      return;
    }

    const nextFields =
      [...fields];

    const temporary =
      nextFields[fieldIndex];

    nextFields[fieldIndex] =
      nextFields[targetIndex];

    nextFields[targetIndex] =
      temporary;

    updateSection(
      sectionIndex,
      {
        fields:
          nextFields,
      },
    );

    setExpandedFields(
      new Set(),
    );
  }

  function updateOption(
    sectionIndex: number,
    fieldIndex: number,
    optionIndex: number,
    changes:
      Partial<FieldOption>,
  ) {
    const field =
      sections[
        sectionIndex
      ].fields[fieldIndex];

    const nextOptions =
      field.options.map(
        (
          option,
          currentIndex,
        ) =>
          currentIndex ===
          optionIndex
            ? {
                ...option,
                ...changes,
              }
            : option,
      );

    updateField(
      sectionIndex,
      fieldIndex,
      {
        options:
          nextOptions,
      },
    );
  }

  function addOption(
    sectionIndex: number,
    fieldIndex: number,
  ) {
    const field =
      sections[
        sectionIndex
      ].fields[fieldIndex];

    const optionNumber =
      field.options.length +
      1;

    updateField(
      sectionIndex,
      fieldIndex,
      {
        options: [
          ...field.options,

          {
            value:
              `option_${optionNumber}`,

            label:
              `Option ${optionNumber}`,
          },
        ],
      },
    );
  }

  function removeOption(
    sectionIndex: number,
    fieldIndex: number,
    optionIndex: number,
  ) {
    const field =
      sections[
        sectionIndex
      ].fields[fieldIndex];

    updateField(
      sectionIndex,
      fieldIndex,
      {
        options:
          field.options.filter(
            (
              _option,
              index,
            ) =>
              index !==
              optionIndex,
          ),
      },
    );
  }

  function validateBeforeSave():
    string | null {
    if (
      sections.length >
      maximumSections
    ) {
      return `A service may contain up to ${maximumSections} sections.`;
    }

    const sectionKeys =
      new Set<string>();

    for (
      let sectionIndex = 0;
      sectionIndex <
        sections.length;
      sectionIndex += 1
    ) {
      const section =
        sections[sectionIndex];

      const sectionKey =
        createKey(
          section.key ||
            section.label,

          `section_${sectionIndex + 1}`,
        );

      if (!section.label.trim()) {
        return `Section ${sectionIndex + 1} needs a label.`;
      }

      if (
        sectionKeys.has(
          sectionKey,
        )
      ) {
        return `Section key "${sectionKey}" is used more than once.`;
      }

      sectionKeys.add(
        sectionKey,
      );

      if (
        section.fields.length >
        maximumFieldsPerSection
      ) {
        return `"${section.label}" contains too many fields.`;
      }

      const fieldKeys =
        new Set<string>();

      for (
        let fieldIndex = 0;
        fieldIndex <
          section.fields.length;
        fieldIndex += 1
      ) {
        const field =
          section.fields[
            fieldIndex
          ];

        const fieldKey =
          createKey(
            field.key ||
              field.label,

            `field_${fieldIndex + 1}`,
          );

        if (
          !field.label.trim()
        ) {
          return `Field ${fieldIndex + 1} in "${section.label}" needs a label.`;
        }

        if (
          fieldKeys.has(
            fieldKey,
          )
        ) {
          return `Field key "${fieldKey}" is used more than once in "${section.label}".`;
        }

        fieldKeys.add(
          fieldKey,
        );

        if (
          requiresOptions(
            field.type,
          ) &&
          field.options.filter(
            (option) =>
              option.label.trim(),
          ).length === 0
        ) {
          return `"${field.label}" needs at least one option.`;
        }
      }
    }

    return null;
  }

  async function saveConfiguration() {
    clearMessages();

    const validationError =
      validateBeforeSave();

    if (validationError) {
      setError(
        validationError,
      );

      return;
    }

    setSaving(true);

    try {
      const normalizedSections =
        normalizeSectionsForSave(
          sections,
        );

      const response =
        await fetch(
          `/api/admin/services/${encodeURIComponent(
            serviceCode,
          )}/form`,
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
                sections:
                  normalizedSections,
              }),
          },
        );

      const result =
        (await response.json()) as
          ServiceFormResponse;

      if (
        !response.ok ||
        !result.sections
      ) {
        throw new Error(
          result.error ??
            "Service form configuration could not be saved.",
        );
      }

      setSections(
        result.sections,
      );

      setMessage(
        result.message ??
          "Service form configuration saved.",
      );
    } catch (caughtError) {
      setError(
        caughtError instanceof
            Error
          ? caughtError.message
          : "Service form configuration could not be saved.",
      );
    } finally {
      setSaving(false);
    }
  }

  return (
    <main className="admin-service-form">
      <header className="admin-service-form__header">
        <button
          type="button"
          onClick={onBack}
          aria-label="Back"
        >
          ←
        </button>

        <div>
          <strong>
            GYAN CONTROL CENTER
          </strong>

          <span>
            Service Form Designer
          </span>
        </div>

        <span className="admin-service-form__code">
          {serviceCode}
        </span>
      </header>

      <section className="admin-service-form__content">
        {loading && (
          <p>
            Loading service form…
          </p>
        )}

        {error && (
          <p
            className="admin-service-form__error"
            role="alert"
          >
            {error}
          </p>
        )}

        {message && (
          <p className="admin-service-form__success">
            ✓ {message}
          </p>
        )}

        {!loading &&
          service && (
            <>
              <section className="admin-service-form__summary">
                <div>
                  <span>
                    Service
                  </span>

                  <strong>
                    {service.name}
                  </strong>
                </div>

                <div>
                  <span>
                    Sections
                  </span>

                  <strong>
                    {sections.length}
                    {" / "}
                    {maximumSections}
                  </strong>
                </div>

                <div>
                  <span>
                    Fields
                  </span>

                  <strong>
                    {totalFieldCount}
                  </strong>
                </div>
              </section>

              <section className="admin-service-form__sections">
                {sections.length ===
                  0 && (
                  <div className="admin-service-form__empty">
                    <strong>
                      No form sections yet
                    </strong>

                    <span>
                      Add the first section
                      to begin defining this
                      service request.
                    </span>
                  </div>
                )}

                {sections.map(
                  (
                    section,
                    sectionIndex,
                  ) => {
                    const expanded =
                      expandedSections.has(
                        sectionIndex,
                      );

                    return (
                      <article
                        key={`${section.key}-${sectionIndex}`}
                        className="service-form-section"
                      >
                        <header className="service-form-section__header">
                          <button
                            type="button"
                            className="service-form-section__toggle"
                            onClick={() =>
                              toggleSection(
                                sectionIndex,
                              )
                            }
                            aria-expanded={
                              expanded
                            }
                          >
                            <span>
                              {expanded
                                ? "▾"
                                : "▸"}
                            </span>

                            <div>
                              <strong>
                                {section.label ||
                                  `Section ${sectionIndex + 1}`}
                              </strong>

                              <small>
                                {
                                  section
                                    .fields
                                    .length
                                }
                                {" field"}
                                {section
                                  .fields
                                  .length ===
                                1
                                  ? ""
                                  : "s"}
                                {" · "}
                                {
                                  section.visibility
                                }
                              </small>
                            </div>
                          </button>

                          <div className="service-form-section__header-actions">
                            <button
                              type="button"
                              disabled={
                                sectionIndex ===
                                0
                              }
                              onClick={() =>
                                moveSection(
                                  sectionIndex,
                                  -1,
                                )
                              }
                              title="Move section up"
                            >
                              ▲
                            </button>

                            <button
                              type="button"
                              disabled={
                                sectionIndex ===
                                sections.length -
                                  1
                              }
                              onClick={() =>
                                moveSection(
                                  sectionIndex,
                                  1,
                                )
                              }
                              title="Move section down"
                            >
                              ▼
                            </button>

                            <button
                              type="button"
                              onClick={() =>
                                removeSection(
                                  sectionIndex,
                                )
                              }
                              title="Delete section"
                            >
                              ×
                            </button>
                          </div>
                        </header>

                        {expanded && (
                          <div className="service-form-section__body">
                            <div className="service-form-section__settings">
                              <label>
                                <span>
                                  Section name
                                </span>

                                <input
                                  type="text"
                                  value={
                                    section.key
                                  }
                                  maxLength={50}
                                  onChange={(
                                    event,
                                  ) =>
                                    updateSection(
                                      sectionIndex,
                                      {
                                        key:
                                          event
                                            .target
                                            .value,
                                      },
                                    )
                                  }
                                />
                              </label>

                              <label>
                                <span>
                                  Display label
                                </span>

                                <input
                                  type="text"
                                  value={
                                    section.label
                                  }
                                  maxLength={150}
                                  onChange={(
                                    event,
                                  ) =>
                                    updateSection(
                                      sectionIndex,
                                      {
                                        label:
                                          event
                                            .target
                                            .value,
                                      },
                                    )
                                  }
                                />
                              </label>

                              <label>
                                <span>
                                  Visibility
                                </span>

                                <select
                                  value={
                                    section.visibility
                                  }
                                  onChange={(
                                    event,
                                  ) =>
                                    updateSection(
                                      sectionIndex,
                                      {
                                        visibility:
                                          event
                                            .target
                                            .value as
                                            SectionVisibility,
                                      },
                                    )
                                  }
                                >
                                  <option value="visible">
                                    Visible
                                  </option>

                                  <option value="hidden">
                                    Hidden
                                  </option>
                                </select>
                              </label>

                              <label className="service-form-section__wide">
                                <span>
                                  Description
                                </span>

                                <textarea
                                  rows={2}
                                  value={
                                    section.description
                                  }
                                  maxLength={500}
                                  onChange={(
                                    event,
                                  ) =>
                                    updateSection(
                                      sectionIndex,
                                      {
                                        description:
                                          event
                                            .target
                                            .value,
                                      },
                                    )
                                  }
                                />
                              </label>
                            </div>

                            <div className="service-form-section__email-options">
                              <label>
                                <input
                                  type="checkbox"
                                  checked={
                                    section.includeInShopEmail
                                  }
                                  onChange={(
                                    event,
                                  ) =>
                                    updateSection(
                                      sectionIndex,
                                      {
                                        includeInShopEmail:
                                          event
                                            .target
                                            .checked,
                                      },
                                    )
                                  }
                                />

                                <span>
                                  Include in shop
                                  email
                                </span>
                              </label>

                              <label>
                                <input
                                  type="checkbox"
                                  checked={
                                    section.includeInCustomerEmail
                                  }
                                  onChange={(
                                    event,
                                  ) =>
                                    updateSection(
                                      sectionIndex,
                                      {
                                        includeInCustomerEmail:
                                          event
                                            .target
                                            .checked,
                                      },
                                    )
                                  }
                                />

                                <span>
                                  Include in customer
                                  email
                                </span>
                              </label>
                            </div>

                            <div className="service-form-fields">
                              {section.fields.map(
                                (
                                  field,
                                  fieldIndex,
                                ) => {
                                  const fieldId =
                                    `${sectionIndex}-${fieldIndex}`;

                                  const fieldExpanded =
                                    expandedFields.has(
                                      fieldId,
                                    );

                                  return (
                                    <article
                                      key={`${field.key}-${fieldIndex}`}
                                      className="service-form-field"
                                    >
                                      <header className="service-form-field__header">
                                        <button
                                          type="button"
                                          className="service-form-field__toggle"
                                          onClick={() =>
                                            toggleField(
                                              sectionIndex,
                                              fieldIndex,
                                            )
                                          }
                                        >
                                          <span>
                                            {fieldExpanded
                                              ? "▾"
                                              : "▸"}
                                          </span>

                                          <div>
                                            <strong>
                                              {field.label ||
                                                `Field ${fieldIndex + 1}`}
                                            </strong>

                                            <small>
                                              {
                                                field.type
                                              }
                                              {" · "}
                                              {
                                                field.requirement
                                              }
                                            </small>
                                          </div>
                                        </button>

                                        <div className="service-form-field__actions">
                                          <button
                                            type="button"
                                            disabled={
                                              fieldIndex ===
                                              0
                                            }
                                            onClick={() =>
                                              moveField(
                                                sectionIndex,
                                                fieldIndex,
                                                -1,
                                              )
                                            }
                                          >
                                            ▲
                                          </button>

                                          <button
                                            type="button"
                                            disabled={
                                              fieldIndex ===
                                              section
                                                .fields
                                                .length -
                                                1
                                            }
                                            onClick={() =>
                                              moveField(
                                                sectionIndex,
                                                fieldIndex,
                                                1,
                                              )
                                            }
                                          >
                                            ▼
                                          </button>

                                          <button
                                            type="button"
                                            onClick={() =>
                                              removeField(
                                                sectionIndex,
                                                fieldIndex,
                                              )
                                            }
                                          >
                                            ×
                                          </button>
                                        </div>
                                      </header>

                                      {fieldExpanded && (
                                        <div className="service-form-field__body">
                                          <div className="service-form-field__grid">
                                            <label>
                                              <span>
                                                Field name
                                              </span>

                                              <input
                                                type="text"
                                                value={
                                                  field.key
                                                }
                                                maxLength={50}
                                                onChange={(
                                                  event,
                                                ) =>
                                                  updateField(
                                                    sectionIndex,
                                                    fieldIndex,
                                                    {
                                                      key:
                                                        event
                                                          .target
                                                          .value,
                                                    },
                                                  )
                                                }
                                              />
                                            </label>

                                            <label>
                                              <span>
                                                Display label
                                              </span>

                                              <input
                                                type="text"
                                                value={
                                                  field.label
                                                }
                                                maxLength={150}
                                                onChange={(
                                                  event,
                                                ) =>
                                                  updateField(
                                                    sectionIndex,
                                                    fieldIndex,
                                                    {
                                                      label:
                                                        event
                                                          .target
                                                          .value,
                                                    },
                                                  )
                                                }
                                              />
                                            </label>

                                            <label>
                                              <span>
                                                Type
                                              </span>

                                              <select
                                                value={
                                                  field.type
                                                }
                                                onChange={(
                                                  event,
                                                ) => {
                                                  const nextType =
                                                    event
                                                      .target
                                                      .value as
                                                      FieldType;

                                                  updateField(
                                                    sectionIndex,
                                                    fieldIndex,
                                                    {
                                                      type:
                                                        nextType,

                                                      options:
                                                        requiresOptions(
                                                          nextType,
                                                        )
                                                          ? field.options
                                                          : [],
                                                    },
                                                  );
                                                }}
                                              >
                                                {fieldTypes.map(
                                                  (
                                                    type,
                                                  ) => (
                                                    <option
                                                      key={
                                                        type.value
                                                      }
                                                      value={
                                                        type.value
                                                      }
                                                    >
                                                      {
                                                        type.label
                                                      }
                                                    </option>
                                                  ),
                                                )}
                                              </select>
                                            </label>

                                            <label>
                                              <span>
                                                Requirement
                                              </span>

                                              <select
                                                value={
                                                  field.requirement
                                                }
                                                onChange={(
                                                  event,
                                                ) =>
                                                  updateField(
                                                    sectionIndex,
                                                    fieldIndex,
                                                    {
                                                      requirement:
                                                        event
                                                          .target
                                                          .value as
                                                          FieldRequirement,
                                                    },
                                                  )
                                                }
                                              >
                                                <option value="mandatory">
                                                  Mandatory
                                                </option>

                                                <option value="optional">
                                                  Optional
                                                </option>

                                                <option value="hidden">
                                                  Hidden
                                                </option>
                                              </select>
                                            </label>

                                            <label>
                                              <span>
                                                Placeholder
                                              </span>

                                              <input
                                                type="text"
                                                value={
                                                  field.placeholder
                                                }
                                                maxLength={250}
                                                onChange={(
                                                  event,
                                                ) =>
                                                  updateField(
                                                    sectionIndex,
                                                    fieldIndex,
                                                    {
                                                      placeholder:
                                                        event
                                                          .target
                                                          .value,
                                                    },
                                                  )
                                                }
                                              />
                                            </label>

                                            <label>
                                              <span>
                                                Email label
                                              </span>

                                              <input
                                                type="text"
                                                value={
                                                  field.emailLabel
                                                }
                                                maxLength={150}
                                                placeholder={
                                                  field.label
                                                }
                                                onChange={(
                                                  event,
                                                ) =>
                                                  updateField(
                                                    sectionIndex,
                                                    fieldIndex,
                                                    {
                                                      emailLabel:
                                                        event
                                                          .target
                                                          .value,
                                                    },
                                                  )
                                                }
                                              />
                                            </label>

                                            <label className="service-form-field__wide">
                                              <span>
                                                Help text
                                              </span>

                                              <textarea
                                                rows={2}
                                                value={
                                                  field.helpText
                                                }
                                                maxLength={500}
                                                onChange={(
                                                  event,
                                                ) =>
                                                  updateField(
                                                    sectionIndex,
                                                    fieldIndex,
                                                    {
                                                      helpText:
                                                        event
                                                          .target
                                                          .value,
                                                    },
                                                  )
                                                }
                                              />
                                            </label>
                                          </div>

                                          {requiresOptions(
                                            field.type,
                                          ) && (
                                            <section className="service-form-field__options">
                                              <header>
                                                <strong>
                                                  Choices
                                                </strong>

                                                <button
                                                  type="button"
                                                  onClick={() =>
                                                    addOption(
                                                      sectionIndex,
                                                      fieldIndex,
                                                    )
                                                  }
                                                >
                                                  + Add option
                                                </button>
                                              </header>

                                              {field.options.length ===
                                                0 && (
                                                <p>
                                                  Add at least
                                                  one option.
                                                </p>
                                              )}

                                              {field.options.map(
                                                (
                                                  option,
                                                  optionIndex,
                                                ) => (
                                                  <div
                                                    key={`${option.value}-${optionIndex}`}
                                                    className="service-form-field__option"
                                                  >
                                                    <input
                                                      type="text"
                                                      value={
                                                        option.label
                                                      }
                                                      placeholder="Option label"
                                                      onChange={(
                                                        event,
                                                      ) =>
                                                        updateOption(
                                                          sectionIndex,
                                                          fieldIndex,
                                                          optionIndex,
                                                          {
                                                            label:
                                                              event
                                                                .target
                                                                .value,
                                                          },
                                                        )
                                                      }
                                                    />

                                                    <input
                                                      type="text"
                                                      value={
                                                        option.value
                                                      }
                                                      placeholder="option_key"
                                                      onChange={(
                                                        event,
                                                      ) =>
                                                        updateOption(
                                                          sectionIndex,
                                                          fieldIndex,
                                                          optionIndex,
                                                          {
                                                            value:
                                                              event
                                                                .target
                                                                .value,
                                                          },
                                                        )
                                                      }
                                                    />

                                                    <button
                                                      type="button"
                                                      onClick={() =>
                                                        removeOption(
                                                          sectionIndex,
                                                          fieldIndex,
                                                          optionIndex,
                                                        )
                                                      }
                                                    >
                                                      ×
                                                    </button>
                                                  </div>
                                                ),
                                              )}
                                            </section>
                                          )}

                                          <div className="service-form-field__email-options">
                                            <label>
                                              <input
                                                type="checkbox"
                                                checked={
                                                  field.includeInShopEmail
                                                }
                                                onChange={(
                                                  event,
                                                ) =>
                                                  updateField(
                                                    sectionIndex,
                                                    fieldIndex,
                                                    {
                                                      includeInShopEmail:
                                                        event
                                                          .target
                                                          .checked,
                                                    },
                                                  )
                                                }
                                              />

                                              <span>
                                                Shop email
                                              </span>
                                            </label>

                                            <label>
                                              <input
                                                type="checkbox"
                                                checked={
                                                  field.includeInCustomerEmail
                                                }
                                                onChange={(
                                                  event,
                                                ) =>
                                                  updateField(
                                                    sectionIndex,
                                                    fieldIndex,
                                                    {
                                                      includeInCustomerEmail:
                                                        event
                                                          .target
                                                          .checked,
                                                    },
                                                  )
                                                }
                                              />

                                              <span>
                                                Customer email
                                              </span>
                                            </label>

                                            <label>
                                              <input
                                                type="checkbox"
                                                checked={
                                                  field.includeInRequestView
                                                }
                                                onChange={(
                                                  event,
                                                ) =>
                                                  updateField(
                                                    sectionIndex,
                                                    fieldIndex,
                                                    {
                                                      includeInRequestView:
                                                        event
                                                          .target
                                                          .checked,
                                                    },
                                                  )
                                                }
                                              />

                                              <span>
                                                Request view
                                              </span>
                                            </label>
                                          </div>
                                        </div>
                                      )}
                                    </article>
                                  );
                                },
                              )}

                              <button
                                type="button"
                                className="service-form-fields__add"
                                disabled={
                                  section
                                    .fields
                                    .length >=
                                  maximumFieldsPerSection
                                }
                                onClick={() =>
                                  addField(
                                    sectionIndex,
                                  )
                                }
                              >
                                + Add field
                              </button>
                            </div>
                          </div>
                        )}
                      </article>
                    );
                  },
                )}
              </section>

              <button
                type="button"
                className="admin-service-form__add-section"
                disabled={
                  sections.length >=
                  maximumSections
                }
                onClick={
                  addSection
                }
              >
                + Add section
              </button>

              <footer className="admin-service-form__footer">
                <button
                  type="button"
                  disabled={saving}
                  onClick={onBack}
                >
                  Back
                </button>

                <button
                  type="button"
                  disabled={
                    saving
                  }
                  onClick={() => {
                    void saveConfiguration();
                  }}
                >
                  {saving
                    ? "Saving…"
                    : "Save form configuration"}
                </button>
              </footer>
            </>
          )}
      </section>
    </main>
  );
}