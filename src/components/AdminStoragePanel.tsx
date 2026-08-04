import {
  useEffect,
  useState,
} from "react";

import "./AdminStoragePanel.css";

interface AdminStoragePanelProps {
  onClose: () => void;
}

type StorageState =
  | "normal"
  | "warning"
  | "stopped";

interface StorageDetails {
  state: StorageState;
  warningBytes: number;
  stopBytes: number;
  usedBytes: number;
  uploadsEnabled: boolean;
  retentionDays: number;
}

interface StorageResponse {
  storage?: StorageDetails;
  message?: string;
  error?: string;
}

function bytesToMegabytes(
  bytes: number,
): number {
  return bytes /
    1024 /
    1024;
}

export default function AdminStoragePanel({
  onClose,
}: AdminStoragePanelProps) {
  const [
    storage,
    setStorage,
  ] = useState<
    StorageDetails | null
  >(null);

  const [
    warningMegabytes,
    setWarningMegabytes,
  ] = useState("");

  const [
    stopMegabytes,
    setStopMegabytes,
  ] = useState("");

  const [loading, setLoading] =
    useState(true);

  const [saving, setSaving] =
    useState(false);

  const [message, setMessage] =
    useState("");

  const [error, setError] =
    useState("");

  useEffect(() => {
    const controller =
      new AbortController();

    async function load() {
      try {
        const response =
          await fetch(
            "/api/admin/storage",
            {
              credentials:
                "include",

              signal:
                controller.signal,
            },
          );

        const result =
          (await response.json()) as
            StorageResponse;

        if (
          !response.ok ||
          !result.storage
        ) {
          throw new Error(
            result.error ??
              "Storage settings could not be loaded.",
          );
        }

        setStorage(
          result.storage,
        );

        setWarningMegabytes(
          String(
            Math.round(
              bytesToMegabytes(
                result.storage
                  .warningBytes,
              ),
            ),
          ),
        );

        setStopMegabytes(
          String(
            Math.round(
              bytesToMegabytes(
                result.storage
                  .stopBytes,
              ),
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
          caughtError instanceof Error
            ? caughtError.message
            : "Storage settings could not be loaded.",
        );
      } finally {
        if (
          !controller.signal.aborted
        ) {
          setLoading(false);
        }
      }
    }

    void load();

    return () => {
      controller.abort();
    };
  }, []);

  async function save() {
    setSaving(true);
    setMessage("");
    setError("");

    try {
      const response =
        await fetch(
          "/api/admin/storage",
          {
            method: "PUT",

            credentials:
              "include",

            headers: {
              "content-type":
                "application/json",
            },

            body: JSON.stringify({
              warningMegabytes:
                Number(
                  warningMegabytes,
                ),

              stopMegabytes:
                Number(
                  stopMegabytes,
                ),
            }),
          },
        );

      const result =
        (await response.json()) as
          StorageResponse;

      if (
        !response.ok ||
        !result.storage
      ) {
        throw new Error(
          result.error ??
            "Storage limits could not be updated.",
        );
      }

      setStorage(
        result.storage,
      );

      setMessage(
        result.message ??
          "Storage limits updated.",
      );
    } catch (caughtError) {
      setError(
        caughtError instanceof Error
          ? caughtError.message
          : "Storage limits could not be updated.",
      );
    } finally {
      setSaving(false);
    }
  }

  return (
    <div className="admin-storage-overlay">
      <section
        className="admin-storage-panel"
        role="dialog"
        aria-modal="true"
        aria-labelledby="admin-storage-title"
      >
        <header>
          <div>
            <span>
              GYAN CONTROL CENTER
            </span>

            <h2 id="admin-storage-title">
              Storage limits
            </h2>
          </div>

          <button
            type="button"
            onClick={onClose}
            aria-label="Close storage settings"
          >
            ×
          </button>
        </header>

        {loading && (
          <p>
            Loading storage settings…
          </p>
        )}

        {error && (
          <p className="admin-storage-panel__error">
            {error}
          </p>
        )}

        {storage && (
          <>
            <div
              className={`admin-storage-panel__status admin-storage-panel__status--${storage.state}`}
            >
              <strong>
                {storage.state ===
                "stopped"
                  ? "Uploads paused"
                  : storage.state ===
                      "warning"
                    ? "Storage warning"
                    : "Storage normal"}
              </strong>

              <span>
                {bytesToMegabytes(
                  storage.usedBytes,
                ).toFixed(1)}
                {" MB used"}
              </span>
            </div>

            <label>
              <span>
                Warning limit (MB)
              </span>

              <input
                type="number"
                min="1"
                step="1"
                value={
                  warningMegabytes
                }
                onChange={(event) =>
                  setWarningMegabytes(
                    event.target.value,
                  )
                }
              />
            </label>

            <label>
              <span>
                Stop uploads at (MB)
              </span>

              <input
                type="number"
                min="2"
                step="1"
                value={
                  stopMegabytes
                }
                onChange={(event) =>
                  setStopMegabytes(
                    event.target.value,
                  )
                }
              />
            </label>

            <p className="admin-storage-panel__note">
              Uploaded files are retained
              for approximately{" "}
              {storage.retentionDays} days.
            </p>

            {message && (
              <p className="admin-storage-panel__success">
                ✓ {message}
              </p>
            )}

            <div className="admin-storage-panel__actions">
              <button
                type="button"
                onClick={onClose}
              >
                Cancel
              </button>

              <button
                type="button"
                disabled={saving}
                onClick={() => {
                  void save();
                }}
              >
                {saving
                  ? "Saving…"
                  : "Save limits"}
              </button>
            </div>
          </>
        )}
      </section>
    </div>
  );
}