import {
  useCallback,
  useEffect,
  useState,
} from "react";

import "./ShopChatPanel.css";

interface ShopChatPanelProps {
  shopCode: string;
  shopName: string;
  onClose: () => void;
}

interface ShopThreadSummary {
  requestNumber: string;
  requestStatus: string;
  requestCreatedAt: string;
  customerName: string | null;
  customerEmail: string | null;
  serviceName: string;
  threadId: number | null;
  chatUpdatedAt: string | null;
  lastMessage: string | null;
}

interface ChatMessage {
  id: number;
  senderType: string;
  message: string;
  createdAt: string;
  mine: boolean;
}

export default function ShopChatPanel({
  shopCode,
  shopName,
  onClose,
}: ShopChatPanelProps) {
  const [threads, setThreads] =
    useState<ShopThreadSummary[]>([]);

  const [
    activeRequestNumber,
    setActiveRequestNumber,
  ] =
    useState("");

  const [activeTitle, setActiveTitle] =
    useState("");

  const [messages, setMessages] =
    useState<ChatMessage[]>([]);

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
          const params =
            new URLSearchParams({
              shopCode,
              requestNumber,
            });

          const response =
            await fetch(
              `/api/chat/shop/thread?${params.toString()}`,
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
              };
              messages?: ChatMessage[];
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
            result.thread.serviceName,
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
      [shopCode],
    );

  const loadThreads =
    useCallback(
      async (): Promise<void> => {
        setLoading(true);

        try {
          const response =
            await fetch(
              `/api/chat/shop/threads?shopCode=${encodeURIComponent(
                shopCode,
              )}`,
              {
                credentials:
                  "include",
              },
            );

          const result =
            (await response.json()) as {
              threads?: ShopThreadSummary[];
              error?: string;
            };

          if (!response.ok) {
            throw new Error(
              result.error ??
                "Shop messages could not be loaded.",
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
              : "Shop messages could not be loaded.",
          );
        }
      },
      [
        loadThread,
        shopCode,
      ],
    );

  useEffect(
    () => {
      void loadThreads();
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
          "/api/chat/shop/messages",
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
                shopCode,
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
            "Reply could not be sent.",
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
          : "Reply could not be sent.",
      );
    } finally {
      setSending(false);
    }
  }

  return (
    <div
      className="shop-chat__overlay"
      onClick={onClose}
    >
      <section
        className="shop-chat"
        role="dialog"
        aria-modal="true"
        aria-label={`${shopName} messages`}
        onClick={(event) =>
          event.stopPropagation()
        }
      >
        <header
          className="shop-chat__header"
        >
          <div>
            <small>
              {shopCode}
            </small>

            <h2>
              💬 Messages
            </h2>

            <span>
              {shopName}
            </span>
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
            className="shop-chat__error"
            role="alert"
          >
            {error}
          </div>
        )}

        {loading ? (
          <div
            className="shop-chat__state"
          >
            Loading messages…
          </div>
        ) : threads.length === 0 ? (
          <div
            className="shop-chat__state"
          >
            <strong>
              No requests yet
            </strong>

            <span>
              Customer conversations
              will appear here.
            </span>
          </div>
        ) : (
          <div
            className="shop-chat__layout"
          >
            <nav
              className="shop-chat__threads"
              aria-label="Customer conversations"
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
                        ? "shop-chat__thread shop-chat__thread--active"
                        : "shop-chat__thread"
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
                      {
                        thread.serviceName
                      }
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
              className="shop-chat__conversation"
            >
              <div
                className="shop-chat__title"
              >
                <strong>
                  {activeTitle}
                </strong>

                <small>
                  {
                    activeRequestNumber
                  }
                </small>
              </div>

              <div
                className="shop-chat__messages"
              >
                {messages.length ===
                0 ? (
                  <div
                    className="shop-chat__empty"
                  >
                    No messages yet.
                    You can send the first
                    message to this customer.
                  </div>
                ) : (
                  messages.map(
                    (message) => (
                      <div
                        key={
                          message.id
                        }
                        className={
                          message.mine
                            ? "shop-chat__message shop-chat__message--mine"
                            : "shop-chat__message"
                        }
                      >
                        <span>
                          {
                            message.message
                          }
                        </span>

                        <small>
                          {
                            message.createdAt
                          }
                        </small>
                      </div>
                    ),
                  )
                )}
              </div>

              <div
                className="shop-chat__composer"
              >
                <textarea
                  value={draft}
                  maxLength={2000}
                  rows={2}
                  placeholder="Reply to customer…"
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
