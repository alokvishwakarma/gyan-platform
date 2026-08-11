import {
  useCallback,
  useEffect,
  useState,
} from "react";

import "./ChatPanel.css";

interface ChatPanelProps {
  onClose: () => void;
}

interface ChatThreadSummary {
  requestNumber: string;
  requestStatus: string;
  requestCreatedAt: string;
  serviceName: string;
  shopName: string;
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

interface ThreadResponse {
  thread?: {
    id: number;
    requestNumber: string;
    requestStatus: string;
    serviceName: string;
    shopCode: string;
    shopName: string;
  };
  messages?: ChatMessage[];
  error?: string;
}

export default function ChatPanel({
  onClose,
}: ChatPanelProps) {
  const [threads, setThreads] =
    useState<ChatThreadSummary[]>([]);

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
          const response =
            await fetch(
              `/api/chat/thread?requestNumber=${encodeURIComponent(
                requestNumber,
              )}`,
              {
                credentials:
                  "include",
              },
            );

          const result =
            (await response.json()) as
              ThreadResponse;

          if (
            !response.ok ||
            !result.thread
          ) {
            throw new Error(
              result.error ??
                "Chat could not be loaded.",
            );
          }

          setActiveRequestNumber(
            result.thread.requestNumber,
          );

          setActiveTitle(
            `${result.thread.serviceName} · ${result.thread.shopName}`,
          );

          setMessages(
            result.messages ?? [],
          );

          setError("");
        } catch (caughtError) {
          setError(
            caughtError instanceof Error
              ? caughtError.message
              : "Chat could not be loaded.",
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
              "/api/chat/threads",
              {
                credentials:
                  "include",
              },
            );

          const result =
            (await response.json()) as {
              threads?: ChatThreadSummary[];
              error?: string;
            };

          if (!response.ok) {
            throw new Error(
              result.error ??
                "Chats could not be loaded.",
            );
          }

          const nextThreads =
            result.threads ?? [];

          setThreads(
            nextThreads,
          );

          setError("");

          if (
            nextThreads.length > 0
          ) {
            await loadThread(
              nextThreads[0]
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
              : "Chats could not be loaded.",
          );
        }
      },
      [loadThread],
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
          "/api/chat/messages",
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
            "Message could not be sent.",
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
          : "Message could not be sent.",
      );
    } finally {
      setSending(false);
    }
  }

  return (
    <div
      className="chat-panel__overlay"
      onClick={onClose}
    >
      <section
        className="chat-panel"
        role="dialog"
        aria-modal="true"
        aria-label="GYAN Chat"
        onClick={(event) =>
          event.stopPropagation()
        }
      >
        <header
          className="chat-panel__header"
        >
          <div>
            <small>
              GYAN
            </small>

            <h2>
              Chat
            </h2>
          </div>

          <button
            type="button"
            aria-label="Close chat"
            onClick={onClose}
          >
            ×
          </button>
        </header>

        {error && (
          <div
            className="chat-panel__error"
            role="alert"
          >
            {error}
          </div>
        )}

        {loading ? (
          <div
            className="chat-panel__state"
          >
            Loading chat…
          </div>
        ) : threads.length === 0 ? (
          <div
            className="chat-panel__state"
          >
            <strong>
              No conversations yet
            </strong>

            <span>
              Submit a service request
              using your signed-in email.
              Your conversation will
              appear here.
            </span>
          </div>
        ) : (
          <div
            className="chat-panel__layout"
          >
            <nav
              className="chat-panel__threads"
              aria-label="Conversations"
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
                        ? "chat-panel__thread chat-panel__thread--active"
                        : "chat-panel__thread"
                    }
                    onClick={() =>
                      void loadThread(
                        thread.requestNumber,
                      )
                    }
                  >
                    <strong>
                      {
                        thread.serviceName
                      }
                    </strong>

                    <span>
                      {
                        thread.shopName
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
              className="chat-panel__conversation"
            >
              <div
                className="chat-panel__conversation-title"
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
                className="chat-panel__messages"
              >
                {messages.length ===
                0 ? (
                  <div
                    className="chat-panel__empty"
                  >
                    No messages yet.
                    Send the first message
                    about this request.
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
                            ? "chat-panel__message chat-panel__message--mine"
                            : "chat-panel__message"
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
                className="chat-panel__composer"
              >
                <textarea
                  value={draft}
                  maxLength={2000}
                  rows={2}
                  placeholder="Write a message…"
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
