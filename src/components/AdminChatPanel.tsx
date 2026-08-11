import {
  useCallback,
  useEffect,
  useState,
} from "react";

import "./AdminChatPanel.css";

interface AdminChatPanelProps {
  onClose: () => void;
}

interface AdminThreadSummary {
  requestNumber: string;
  requestStatus: string;
  requestCreatedAt: string;
  customerName: string | null;
  customerEmail: string | null;
  shopCode: string;
  shopName: string;
  serviceName: string;
  threadId: number;
  chatUpdatedAt: string;
  lastMessage: string | null;
}

interface AdminMessage {
  id: number;
  senderType: string;
  message: string;
  createdAt: string;
  mine: boolean;
}

export default function AdminChatPanel({
  onClose,
}: AdminChatPanelProps) {
  const [threads, setThreads] =
    useState<AdminThreadSummary[]>([]);

  const [
    activeRequestNumber,
    setActiveRequestNumber,
  ] =
    useState("");

  const [activeTitle, setActiveTitle] =
    useState("");

  const [messages, setMessages] =
    useState<AdminMessage[]>([]);


  const [
    requestSummary,
    setRequestSummary,
  ] =
    useState("");

  const [draft, setDraft] =
    useState("");

  const [loading, setLoading] =
    useState(true);

  const [sending, setSending] =
    useState(false);

  const [error, setError] =
    useState("");

  const loadThread =
    useCallback(
      async (
        requestNumber: string,
        silent = false,
      ): Promise<void> => {
        if (!silent) {
          setLoading(true);
        }

        try {
          const response =
            await fetch(
              `/api/chat/admin/thread?requestNumber=${encodeURIComponent(
                requestNumber,
              )}`,
              {
                credentials:
                  "include",
              },
            );

          const result =
            (await response.json()) as {
              thread?: {
                requestNumber: string;
                serviceName: string;
                shopName: string;
                shopCode: string;
                requestSummary: string;
              };
              messages?: AdminMessage[];
              error?: string;
            };

          if (
            !response.ok ||
            !result.thread
          ) {
            throw new Error(
              result.error ??
                "Conversation could not be loaded.",
            );
          }

          setActiveRequestNumber(
            result.thread.requestNumber,
          );

          setActiveTitle(
            `${result.thread.serviceName} · ${result.thread.shopName}`,
          );

          setRequestSummary(
            result.thread.requestSummary ??
              "",
          );

          setMessages(
            result.messages ?? [],
          );

          setError("");
        } catch (caughtError) {
          setError(
            caughtError instanceof Error
              ? caughtError.message
              : "Conversation could not be loaded.",
          );
        } finally {
          if (!silent) {
            setLoading(false);
          }
        }
      },
      [],
    );

  const loadThreads =
    useCallback(
      async (): Promise<void> => {
        setLoading(true);

        try {
          const response =
            await fetch(
              "/api/chat/admin/threads",
              {
                credentials:
                  "include",
              },
            );

          const result =
            (await response.json()) as {
              threads?: AdminThreadSummary[];
              error?: string;
            };

          if (!response.ok) {
            throw new Error(
              result.error ??
                "Admin messages could not be loaded.",
            );
          }

          const next =
            result.threads ?? [];

          setThreads(next);
          setError("");

          if (next.length > 0) {
            await loadThread(
              next[0]
                .requestNumber,
            );
          } else {
            setLoading(false);
          }
        } catch (caughtError) {
          setLoading(false);

          setError(
            caughtError instanceof Error
              ? caughtError.message
              : "Admin messages could not be loaded.",
          );
        }
      },
      [loadThread],
    );

  useEffect(
    () => {
      const timer =
        window.setTimeout(
          () => {
            void loadThreads();
          },
          0,
        );

      return () => {
        window.clearTimeout(
          timer,
        );
      };
    },
    [loadThreads],
  );

  useEffect(
    () => {
      if (!activeRequestNumber) {
        return;
      }

      const timer =
        window.setInterval(
          () => {
            void loadThread(
              activeRequestNumber,
              true,
            );
          },
          5000,
        );

      return () =>
        window.clearInterval(
          timer,
        );
    },
    [
      activeRequestNumber,
      loadThread,
    ],
  );

  async function sendMessage():
    Promise<void> {
    const message =
      draft.trim();

    if (
      !message ||
      !activeRequestNumber ||
      sending
    ) {
      return;
    }

    setSending(true);
    setError("");

    try {
      const response =
        await fetch(
          "/api/chat/admin/messages",
          {
            method: "POST",
            credentials:
              "include",
            headers: {
              "content-type":
                "application/json",
            },
            body:
              JSON.stringify({
                requestNumber:
                  activeRequestNumber,
                message,
              }),
          },
        );

      const result =
        (await response.json()) as {
          error?: string;
        };

      if (!response.ok) {
        throw new Error(
          result.error ??
            "Admin reply could not be sent.",
        );
      }

      setDraft("");

      await loadThread(
        activeRequestNumber,
        true,
      );
    } catch (caughtError) {
      setError(
        caughtError instanceof Error
          ? caughtError.message
          : "Admin reply could not be sent.",
      );
    } finally {
      setSending(false);
    }
  }

  return (
    <div
      className="admin-chat__overlay"
      onClick={onClose}
    >
      <section
        className="admin-chat"
        role="dialog"
        aria-modal="true"
        aria-label="GYAN Admin Messages"
        onClick={(event) =>
          event.stopPropagation()
        }
      >
        <header
          className="admin-chat__header"
        >
          <div>
            <small>
              GYAN ADMIN
            </small>
            <h2>
              💬 Messages
            </h2>
          </div>

          <button
            type="button"
            aria-label="Close messages"
            onClick={onClose}
          >
            ×
          </button>
        </header>

        {error && (
          <div
            className="admin-chat__error"
          >
            {error}
          </div>
        )}

        {loading ? (
          <div
            className="admin-chat__state"
          >
            Loading messages…
          </div>
        ) : threads.length === 0 ? (
          <div
            className="admin-chat__state"
          >
            No chat threads yet.
          </div>
        ) : (
          <div
            className="admin-chat__layout"
          >
            <nav
              className="admin-chat__threads"
            >
              {threads.map(
                (thread) => (
                  <button
                    type="button"
                    key={
                      thread.requestNumber
                    }
                    className={
                      thread.requestNumber ===
                      activeRequestNumber
                        ? "admin-chat__thread admin-chat__thread--active"
                        : "admin-chat__thread"
                    }
                    onClick={() =>
                      void loadThread(
                        thread.requestNumber,
                      )
                    }
                  >
                    <strong>
                      {
                        thread.customerName ||
                        thread.customerEmail ||
                        "Customer"
                      }
                    </strong>

                    <span>
                      {thread.serviceName}
                      {" · "}
                      {thread.shopCode}
                    </span>

                    <small>
                      {
                        thread.lastMessage ||
                        thread.requestNumber
                      }
                    </small>
                  </button>
                ),
              )}
            </nav>

            <div
              className="admin-chat__conversation"
            >
              <div
                className="admin-chat__title"
              >
                <strong>
                  {activeTitle}
                </strong>

                <small>
                  {
                    activeRequestNumber
                  }
                </small>

                {requestSummary && (
                  <p
                    className="admin-chat__request-summary"
                  >
                    <b>
                      Requested:
                    </b>
                    {" "}
                    {
                      requestSummary
                    }
                  </p>
                )}
              </div>

              <div
                className="admin-chat__messages"
              >
                {messages.map(
                  (message) => (
                    <div
                      key={message.id}
                      className={
                        message.mine
                          ? "admin-chat__message admin-chat__message--mine"
                          : "admin-chat__message"
                      }
                    >
                      <b>
                        {message.mine
                          ? "GYAN Support"
                          : message.senderType ===
                              "shop"
                            ? "Shop"
                            : "Customer"}
                      </b>

                      <span>
                        {message.message}
                      </span>

                      <small>
                        {message.createdAt}
                      </small>
                    </div>
                  ),
                )}
              </div>

              <div
                className="admin-chat__composer"
              >
                <textarea
                  value={draft}
                  maxLength={2000}
                  rows={2}
                  placeholder="Reply as GYAN Support…"
                  onChange={(event) =>
                    setDraft(
                      event.target.value,
                    )
                  }
                  onKeyDown={(event) => {
                    if (
                      event.key ===
                        "Enter" &&
                      !event.shiftKey
                    ) {
                      event.preventDefault();
                      void sendMessage();
                    }
                  }}
                />

                <button
                  type="button"
                  disabled={
                    sending ||
                    !draft.trim()
                  }
                  onClick={() =>
                    void sendMessage()
                  }
                >
                  {sending
                    ? "Sending…"
                    : "Send"}
                </button>
              </div>
            </div>
          </div>
        )}
      </section>
    </div>
  );
}