import {
  useMemo,
  useRef,
  useState,
} from "react";

import "./PrintOrderPanel.css";

interface PrintOrderPanelProps {
  shopCode?:
    | string
    | null;

  shopName?:
    | string
    | null;

  onClose: () => void;

  onIncreaseLimit:
    () => void;
}

type ColorMode =
  | "black-white"
  | "color";

type PrintSides =
  | "single"
  | "double";

type PaperSize =
  | "a4"
  | "letter"
  | "legal";

type StorageState =
  | "normal"
  | "warning"
  | "stopped";

interface CreatePrintOrderResponse {
  order?: {
    orderNumber: string;
    status: string;
    createdAt: string;
    fileCount?: number;
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

const MAX_TOTAL_FILE_SIZE =
  25 * 1024 * 1024;

const allowedExtensions =
  new Set([
    "pdf",
    "doc",
    "docx",
    "txt",
    "rtf",
    "jpg",
    "jpeg",
    "png",
  ]);

const pricePerPageRupees:
  Record<ColorMode, number> = {
    "black-white": 2,
    color: 10,
  };

function getFileExtension(
  fileName: string,
): string {
  const extension =
    fileName
      .split(".")
      .pop()
      ?.toLowerCase();

  return extension ?? "";
}

function formatFileSize(
  bytes: number,
): string {
  if (bytes < 1024) {
    return `${bytes} B`;
  }

  if (
    bytes <
    1024 * 1024
  ) {
    return `${(
      bytes / 1024
    ).toFixed(1)} KB`;
  }

  return `${(
    bytes /
    (1024 * 1024)
  ).toFixed(1)} MB`;
}

function normalizePhoneNumber(
  value: string,
): string {
  return value.replace(
    /[^\d+]/g,
    "",
  );
}

export default function PrintOrderPanel({
  shopCode,
  shopName,
  onClose,
  onIncreaseLimit,
}: PrintOrderPanelProps) {
  const fileInputRef =
    useRef<HTMLInputElement | null>(
      null,
    );

  const [
    files,
    setFiles,
  ] = useState<File[]>([]);

  const [
    copies,
    setCopies,
  ] = useState(1);

  const [
    estimatedPages,
    setEstimatedPages,
  ] = useState(1);

  const [
    colorMode,
    setColorMode,
  ] = useState<ColorMode>(
    "black-white",
  );

  const [
    printSides,
    setPrintSides,
  ] = useState<PrintSides>(
    "single",
  );

  const [
    paperSize,
    setPaperSize,
  ] = useState<PaperSize>(
    "a4",
  );

  const [
    instructions,
    setInstructions,
  ] = useState("");

  const [
    customerName,
    setCustomerName,
  ] = useState("");

  const [
    phoneNumber,
    setPhoneNumber,
  ] = useState("");

  const [
    emailAddress,
    setEmailAddress,
  ] = useState("");

  const [
    whatsAppNumber,
    setWhatsAppNumber,
  ] = useState("");

  const [
    usePhoneForWhatsApp,
    setUsePhoneForWhatsApp,
  ] = useState(true);

  const [
    whatsAppConsent,
    setWhatsAppConsent,
  ] = useState(true);

  const [
    submitting,
    setSubmitting,
  ] = useState(false);

  const [
    submissionError,
    setSubmissionError,
  ] = useState("");

  const [
    fileError,
    setFileError,
  ] = useState("");

  const [
    createdOrderNumber,
    setCreatedOrderNumber,
  ] = useState<
    string | null
  >(null);

  const [
    storageState,
    setStorageState,
  ] = useState<StorageState>(
    "normal",
  );

  const effectiveWhatsAppNumber =
    usePhoneForWhatsApp
      ? phoneNumber
      : whatsAppNumber;

  const totalFileSize =
    useMemo(
      () =>
        files.reduce(
          (
            total,
            file,
          ) =>
            total +
            file.size,
          0,
        ),
      [files],
    );

  const estimatedTotal =
    useMemo(
      () =>
        estimatedPages *
        copies *
        pricePerPageRupees[
          colorMode
        ],
      [
        estimatedPages,
        copies,
        colorMode,
      ],
    );

  const customerNameValid =
    customerName
      .trim()
      .length >= 2;

  const phoneNumberValid =
    normalizePhoneNumber(
      phoneNumber,
    )
      .replace(/\D/g, "")
      .length >= 10;

  const whatsAppNumberValid =
    usePhoneForWhatsApp ||
    normalizePhoneNumber(
      whatsAppNumber,
    )
      .replace(/\D/g, "")
      .length >= 10;

  const canSubmit =
    Boolean(shopCode) &&
    files.length > 0 &&
    totalFileSize <=
      MAX_TOTAL_FILE_SIZE &&
    customerNameValid &&
    phoneNumberValid &&
    whatsAppNumberValid &&
    storageState !==
      "stopped" &&
    !submitting;

  function addFiles(
    selectedFiles: File[],
  ) {
    setFileError("");
    setSubmissionError("");

    const invalidFiles =
      selectedFiles.filter(
        (file) =>
          !allowedExtensions.has(
            getFileExtension(
              file.name,
            ),
          ),
      );

    if (
      invalidFiles.length > 0
    ) {
      setFileError(
        "Only PDF, Word, TXT, RTF, JPG and PNG files are supported.",
      );

      return;
    }

    const combinedFiles = [
      ...files,
      ...selectedFiles,
    ];

    const uniqueFiles =
      combinedFiles.filter(
        (
          file,
          index,
          allFiles,
        ) =>
          allFiles.findIndex(
            (candidate) =>
              candidate.name ===
                file.name &&
              candidate.size ===
                file.size &&
              candidate.lastModified ===
                file.lastModified,
          ) === index,
      );

    const combinedSize =
      uniqueFiles.reduce(
        (
          total,
          file,
        ) =>
          total +
          file.size,
        0,
      );

    if (
      combinedSize >
      MAX_TOTAL_FILE_SIZE
    ) {
      setFileError(
        "The total upload size cannot exceed 25 MB.",
      );

      return;
    }

    setFiles(
      uniqueFiles,
    );
  }

  function handleFileChange(
    event:
      React.ChangeEvent<HTMLInputElement>,
  ) {
    const selectedFiles =
      Array.from(
        event.target.files ??
          [],
      );

    addFiles(
      selectedFiles,
    );

    event.target.value = "";
  }

  function removeFile(
    fileToRemove: File,
  ) {
    setFiles(
      (currentFiles) =>
        currentFiles.filter(
          (file) =>
            !(
              file.name ===
                fileToRemove.name &&
              file.size ===
                fileToRemove.size &&
              file.lastModified ===
                fileToRemove.lastModified
            ),
        ),
    );

    setFileError("");
    setSubmissionError("");
  }

  async function handleSubmit(
    event:
      React.FormEvent<HTMLFormElement>,
  ) {
    event.preventDefault();

    setSubmissionError("");

    if (!shopCode) {
      setSubmissionError(
        "A shop could not be identified from the URL. Please open GYAN using ?shop=LKMV.",
      );

      return;
    }

    if (
      !customerNameValid
    ) {
      setSubmissionError(
        "Please enter your name.",
      );

      return;
    }

    if (!phoneNumberValid) {
      setSubmissionError(
        "Please enter a valid mobile number.",
      );

      return;
    }

    if (
      !whatsAppNumberValid
    ) {
      setSubmissionError(
        "Please enter a valid WhatsApp number.",
      );

      return;
    }

    if (
      files.length === 0
    ) {
      setSubmissionError(
        "Please add at least one file.",
      );

      return;
    }

    const formData =
      new FormData();

    for (
      const file
      of files
    ) {
      formData.append(
        "files",
        file,
        file.name,
      );
    }

    formData.append(
      "customerName",
      customerName.trim(),
    );

    formData.append(
      "phoneNumber",
      normalizePhoneNumber(
        phoneNumber,
      ),
    );

    formData.append(
      "emailAddress",
      emailAddress.trim(),
    );

    formData.append(
      "whatsAppNumber",
      normalizePhoneNumber(
        effectiveWhatsAppNumber,
      ),
    );

    formData.append(
      "whatsAppConsent",
      String(
        whatsAppConsent,
      ),
    );

    formData.append(
      "estimatedPages",
      String(
        estimatedPages,
      ),
    );

    formData.append(
      "copies",
      String(copies),
    );

    formData.append(
      "colorMode",
      colorMode,
    );

    formData.append(
      "printSides",
      printSides,
    );

    formData.append(
      "paperSize",
      paperSize,
    );

    formData.append(
      "instructions",
      instructions.trim(),
    );

    formData.append(
      "estimatedAmountRupees",
      String(
        estimatedTotal,
      ),
    );

    setSubmitting(true);

    try {
      const response =
        await fetch(
          `/api/shops/${encodeURIComponent(
            shopCode,
          )}/print-requests`,
          {
            method: "POST",
            body: formData,
          },
        );

      const result =
        (await response.json()) as
          CreatePrintOrderResponse;

      setStorageState(
        result.storage?.state ??
          "normal",
      );

      if (
        !response.ok ||
        !result.order
      ) {
        throw new Error(
          result.error ??
            "The print request could not be submitted.",
        );
      }

      setCreatedOrderNumber(
        result.order.orderNumber,
      );
    } catch (error) {
      setSubmissionError(
        error instanceof Error
          ? error.message
          : "The print request could not be submitted.",
      );
    } finally {
      setSubmitting(false);
    }
  }

  function renderStorageMessage() {
    if (
      storageState ===
      "warning"
    ) {
      return (
        <div className="print-panel__storage-warning">
          <strong>
            ⚠ Storage warning
          </strong>

          <span>
            GYAN storage is approaching
            its current limit. Uploads are
            still being accepted.
          </span>

          <button
            type="button"
            onClick={
              onIncreaseLimit
            }
          >
            Increase limit
          </button>
        </div>
      );
    }

    if (
      storageState ===
      "stopped"
    ) {
      return (
        <div className="print-panel__storage-stop">
          <strong>
            ⛔ Uploads paused
          </strong>

          <span>
            New print requests cannot be
            accepted because the configured
            storage limit has been reached.
          </span>

          <button
            type="button"
            onClick={
              onIncreaseLimit
            }
          >
            Increase limit
          </button>
        </div>
      );
    }

    return null;
  }

  if (
    createdOrderNumber
  ) {
    return (
      <div
        className="print-panel-overlay"
        role="presentation"
      >
        <section
          className="print-panel print-panel--success"
          role="dialog"
          aria-modal="true"
          aria-labelledby="print-success-title"
        >
          <div className="print-panel__success-icon">
            ✓
          </div>

          <span className="print-panel__eyebrow">
            GYAN Print
          </span>

          <h2 id="print-success-title">
            Print request submitted
          </h2>

          <p>
            Your request has been
            sent
            {shopName
              ? ` to ${shopName}`
              : " to the selected shop"}
            .
          </p>

          <div className="print-panel__order-number">
            <span>
              Order number
            </span>

            <strong>
              {createdOrderNumber}
            </strong>
          </div>

          <div className="print-panel__summary">
            <span>
              {files.length} file
              {files.length === 1
                ? ""
                : "s"}
            </span>

            <span>
              {copies} cop
              {copies === 1
                ? "y"
                : "ies"}
            </span>

            <span>
              Approx. ₹
              {estimatedTotal.toFixed(
                0,
              )}
            </span>
          </div>

          <p className="print-panel__success-note">
            The shop will review
            the files and confirm
            the final amount before
            printing.
          </p>

          {renderStorageMessage()}

          <button
            type="button"
            className="print-panel__primary"
            onClick={onClose}
          >
            Done
          </button>
        </section>
      </div>
    );
  }

  return (
    <div
      className="print-panel-overlay"
      role="presentation"
    >
      <section
        className="print-panel"
        role="dialog"
        aria-modal="true"
        aria-labelledby="print-order-title"
      >
        <header className="print-panel__header">
          <div>
            <span className="print-panel__eyebrow">
              GYAN Print
            </span>

            <h2 id="print-order-title">
              Send documents for printing
            </h2>

            {shopName && (
              <small className="print-panel__shop">
                {shopName}
              </small>
            )}

            {!shopName &&
              shopCode && (
                <small className="print-panel__shop">
                  Shop {shopCode}
                </small>
              )}
          </div>

          <button
            type="button"
            className="print-panel__close"
            onClick={onClose}
            aria-label="Close print order"
          >
            ×
          </button>
        </header>

        <form
          className="print-panel__form"
          onSubmit={
            handleSubmit
          }
        >
          {!shopCode && (
            <div className="print-panel__notice">
              A shop could not be
              identified. Open GYAN
              using a URL such as
              <strong>
                {" "}
                ?shop=LKMV
              </strong>
              .
            </div>
          )}

          <section className="print-panel__section">
            <div className="print-panel__section-heading">
              <div>
                <span className="print-panel__step">
                  1
                </span>

                <h3>
                  Add documents
                </h3>
              </div>

              <small>
                Maximum 25 MB
              </small>
            </div>

            <label className="print-panel__upload">
              <span className="print-panel__upload-icon">
                📤
              </span>

              <strong>
                Select print files
              </strong>

              <span>
                PDF, Word, TXT, RTF,
                JPG or PNG
              </span>

              <input
                ref={
                  fileInputRef
                }
                type="file"
                multiple
                accept=".pdf,.doc,.docx,.txt,.rtf,.jpg,.jpeg,.png"
                onChange={
                  handleFileChange
                }
              />
            </label>

            {fileError && (
              <p
                className="print-panel__error"
                role="alert"
              >
                {fileError}
              </p>
            )}

            {files.length > 0 && (
              <>
                <div className="print-panel__files">
                  {files.map(
                    (file) => (
                      <div
                        key={`${file.name}-${file.size}-${file.lastModified}`}
                        className="print-panel__file"
                      >
                        <span
                          aria-hidden="true"
                        >
                          📄
                        </span>

                        <div>
                          <strong>
                            {file.name}
                          </strong>

                          <small>
                            {formatFileSize(
                              file.size,
                            )}
                          </small>
                        </div>

                        <button
                          type="button"
                          onClick={() =>
                            removeFile(
                              file,
                            )
                          }
                          aria-label={`Remove ${file.name}`}
                          title="Remove file"
                        >
                          ×
                        </button>
                      </div>
                    ),
                  )}
                </div>

                <div className="print-panel__file-total">
                  <span>
                    {files.length} file
                    {files.length ===
                    1
                      ? ""
                      : "s"}
                  </span>

                  <strong>
                    {formatFileSize(
                      totalFileSize,
                    )}
                  </strong>
                </div>

                <button
                  type="button"
                  className="print-panel__add-files"
                  onClick={() =>
                    fileInputRef.current?.click()
                  }
                >
                  + Add more files
                </button>
              </>
            )}
          </section>

          <section className="print-panel__section">
            <div className="print-panel__section-heading">
              <div>
                <span className="print-panel__step">
                  2
                </span>

                <h3>
                  Contact details
                </h3>
              </div>
            </div>

            <label>
              <span>Name</span>

              <input
                type="text"
                value={
                  customerName
                }
                placeholder="Your name"
                autoComplete="name"
                required
                minLength={2}
                onChange={(
                  event,
                ) =>
                  setCustomerName(
                    event.target.value,
                  )
                }
              />
            </label>

            <label>
              <span>
                Mobile number
              </span>

              <input
                type="tel"
                value={
                  phoneNumber
                }
                placeholder="+91 98765 43210"
                autoComplete="tel"
                required
                onChange={(
                  event,
                ) =>
                  setPhoneNumber(
                    event.target.value,
                  )
                }
              />
            </label>

            <label>
              <span>
                Email address
                <small>
                  Optional
                </small>
              </span>

              <input
                type="email"
                value={
                  emailAddress
                }
                placeholder="name@example.com"
                autoComplete="email"
                onChange={(
                  event,
                ) =>
                  setEmailAddress(
                    event.target.value,
                  )
                }
              />
            </label>

            <label className="print-panel__checkbox">
              <input
                type="checkbox"
                checked={
                  usePhoneForWhatsApp
                }
                onChange={(
                  event,
                ) =>
                  setUsePhoneForWhatsApp(
                    event.target
                      .checked,
                  )
                }
              />

              <span>
                My WhatsApp number
                is the same as my
                mobile number
              </span>
            </label>

            {!usePhoneForWhatsApp && (
              <label>
                <span>
                  WhatsApp number
                </span>

                <input
                  type="tel"
                  value={
                    whatsAppNumber
                  }
                  placeholder="+91 98765 43210"
                  autoComplete="tel"
                  required
                  onChange={(
                    event,
                  ) =>
                    setWhatsAppNumber(
                      event.target
                        .value,
                    )
                  }
                />
              </label>
            )}

            <label className="print-panel__checkbox">
              <input
                type="checkbox"
                checked={
                  whatsAppConsent
                }
                onChange={(
                  event,
                ) =>
                  setWhatsAppConsent(
                    event.target
                      .checked,
                  )
                }
              />

              <span>
                Send order and pickup
                updates through
                WhatsApp
              </span>
            </label>
          </section>

          <section className="print-panel__section">
            <div className="print-panel__section-heading">
              <div>
                <span className="print-panel__step">
                  3
                </span>

                <h3>
                  Print preferences
                </h3>
              </div>
            </div>

            <div className="print-panel__field-grid">
              <label>
                <span>
                  Estimated pages
                </span>

                <input
                  type="number"
                  min="1"
                  max="1000"
                  value={
                    estimatedPages
                  }
                  onChange={(
                    event,
                  ) =>
                    setEstimatedPages(
                      Math.min(
                        1000,
                        Math.max(
                          1,
                          Number(
                            event.target
                              .value,
                          ) || 1,
                        ),
                      ),
                    )
                  }
                />
              </label>

              <label>
                <span>
                  Copies
                </span>

                <input
                  type="number"
                  min="1"
                  max="100"
                  value={
                    copies
                  }
                  onChange={(
                    event,
                  ) =>
                    setCopies(
                      Math.min(
                        100,
                        Math.max(
                          1,
                          Number(
                            event.target
                              .value,
                          ) || 1,
                        ),
                      ),
                    )
                  }
                />
              </label>
            </div>

            <fieldset>
              <legend>
                Color
              </legend>

              <div className="print-panel__choice-row">
                <label>
                  <input
                    type="radio"
                    name="color-mode"
                    checked={
                      colorMode ===
                      "black-white"
                    }
                    onChange={() =>
                      setColorMode(
                        "black-white",
                      )
                    }
                  />

                  <span>
                    Black & white
                  </span>
                </label>

                <label>
                  <input
                    type="radio"
                    name="color-mode"
                    checked={
                      colorMode ===
                      "color"
                    }
                    onChange={() =>
                      setColorMode(
                        "color",
                      )
                    }
                  />

                  <span>
                    Color
                  </span>
                </label>
              </div>
            </fieldset>

            <fieldset>
              <legend>
                Sides
              </legend>

              <div className="print-panel__choice-row">
                <label>
                  <input
                    type="radio"
                    name="print-sides"
                    checked={
                      printSides ===
                      "single"
                    }
                    onChange={() =>
                      setPrintSides(
                        "single",
                      )
                    }
                  />

                  <span>
                    Single-sided
                  </span>
                </label>

                <label>
                  <input
                    type="radio"
                    name="print-sides"
                    checked={
                      printSides ===
                      "double"
                    }
                    onChange={() =>
                      setPrintSides(
                        "double",
                      )
                    }
                  />

                  <span>
                    Double-sided
                  </span>
                </label>
              </div>
            </fieldset>

            <label>
              <span>
                Paper size
              </span>

              <select
                value={
                  paperSize
                }
                onChange={(
                  event,
                ) =>
                  setPaperSize(
                    event.target
                      .value as
                      PaperSize,
                  )
                }
              >
                <option value="a4">
                  A4 — 210 × 297 mm
                </option>

                <option value="letter">
                  Letter — 8.5 × 11 in
                </option>

                <option value="legal">
                  Legal — 8.5 × 14 in
                </option>
              </select>
            </label>

            <label>
              <span>
                Special instructions
                <small>
                  Optional
                </small>
              </span>

              <textarea
                rows={3}
                value={
                  instructions
                }
                maxLength={1000}
                placeholder="Page ranges, stapling, paper preference or pickup notes..."
                onChange={(
                  event,
                ) =>
                  setInstructions(
                    event.target.value,
                  )
                }
              />
            </label>
          </section>

          <div className="print-panel__estimate">
            <div>
              <span>
                Approximate amount
              </span>

              <small>
                The shop will confirm
                the final amount after
                reviewing the files.
              </small>
            </div>

            <strong>
              ₹
              {estimatedTotal.toFixed(
                0,
              )}
            </strong>
          </div>

          {renderStorageMessage()}

          {!canSubmit &&
            files.length > 0 &&
            storageState !==
              "stopped" && (
              <p className="print-panel__helper">
                Enter your name and a
                valid mobile number to
                submit the request.
              </p>
            )}

          {submissionError && (
            <p
              className="print-panel__error print-panel__error--submission"
              role="alert"
            >
              {submissionError}
            </p>
          )}

          <div className="print-panel__actions">
            <button
              type="button"
              className="print-panel__secondary"
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
              className="print-panel__primary"
              disabled={
                !canSubmit
              }
            >
              {submitting
                ? "Submitting…"
                : storageState ===
                    "stopped"
                  ? "Uploads paused"
                  : "Submit print request"}
            </button>
          </div>
        </form>
      </section>
    </div>
  );
}