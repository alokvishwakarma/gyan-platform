import {
  useEffect,
  useMemo,
  useState,
} from "react";

import {
  QRCodeSVG,
} from "qrcode.react";

import "./SafetyResourceLandingPage.css";


type WinkReveal = {
  token: string;
  kind: string;
  message: string;
  senderDisplayName: string;
  senderCode?: string;
  senderOriginalName?: string;
  recipientDisplayName?: string;
  recipientCode?: string;
  createdAt: string;
};


export default function GWinkPage({
  token,
  displayName,
  onBack,
  winkToken,
}: {
  token: string;
  displayName: string;
  onBack: () => void;
  winkToken?: string;
}) {
  const initialWinkToken =
    useMemo(
      () =>
        winkToken ??
        new URLSearchParams(
          window.location.search,
        ).get(
          "wink",
        ) ??
        "",
      [
        winkToken,
      ],
    );

  const [kind, setKind] =
    useState("🎂");
  const [message, setMessage] =
    useState(
      "Happy Birthday! 🎉🥳",
    );

  const [recipientMode, setRecipientMode] =
    useState(false);
  const [recipient, setRecipient] =
    useState("");
  const [addFriend, setAddFriend] =
    useState(false);

  const [emailOpen, setEmailOpen] =
    useState(false);
  const [email, setEmail] =
    useState("");
  const [cc, setCc] =
    useState("");
  const [emailSending, setEmailSending] =
    useState(false);

  const [status, setStatus] =
    useState("");

  const [savedWinkToken, setSavedWinkToken] =
    useState("");
  const [savedFingerprint, setSavedFingerprint] =
    useState("");
  const [shareUrl, setShareUrl] =
    useState(
      `${window.location.origin}/${token}`,
    );

  const [revealLoading, setRevealLoading] =
    useState(
      Boolean(
        initialWinkToken,
      ),
    );

  const [revealError, setRevealError] =
    useState("");

  const [reveal, setReveal] =
    useState<
      WinkReveal | null
    >(
      null,
    );

  const [replyOpen, setReplyOpen] =
    useState(false);
  const [replyMessage, setReplyMessage] =
    useState("");
  const [replySending, setReplySending] =
    useState(false);
  const [replyStatus, setReplyStatus] =
    useState("");

  const [visitorGyanCode, setVisitorGyanCode] =
    useState("");

  const kinds = [
    ["🎂", "Birthday", "Happy Birthday! 🎉🥳"],
    ["🤝", "Friend", "Thinking of you! 😊🤝"],
    ["🏆", "Congrats", "Congratulations! 🏆🎉"],
    ["😂", "Funny", "You are officially OLD now 😂👴🎈"],
    ["❤️", "Thanks", "Thank you! ❤️⭐"],
  ];

  const icons = [
    "🎂",
    "🎉",
    "🥳",
    "😂",
    "👴",
    "🎈",
    "🎁",
    "❤️",
    "⭐",
    "🌈",
    "🚀",
    "🧁",
  ];

  const fingerprint =
    JSON.stringify({
      kind,
      message:
        message.trim(),
      recipient:
        recipientMode
          ? recipient.trim()
          : "",
      addFriend:
        recipientMode &&
        addFriend,
    });


  useEffect(
    () => {
      let cancelled =
        false;

      const browserCode =
        window.localStorage.getItem(
          "gyan_browser_code_v1",
        );

      void fetch(
        "/api/gyan-identity",
        {
          method:
            "POST",

          credentials:
            "include",

          headers: {
            "content-type":
              "application/json",
          },

          body:
            JSON.stringify({
              browserCode:
                browserCode ??
                undefined,
            }),
        },
      )
        .then(
          async (
            response,
          ) => {
            const body =
              await response.json() as {
                identity?: {
                  code: string;
                };
                error?: string;
              };

            if (
              !response.ok ||
              !body.identity
            ) {
              throw new Error(
                body.error ??
                  "GYAN identity could not be prepared.",
              );
            }

            return body.identity;
          },
        )
        .then(
          (
            identity,
          ) => {
            if (
              cancelled
            ) {
              return;
            }

            const code =
              identity.code
                .trim()
                .toUpperCase();

            setVisitorGyanCode(
              code,
            );

            window.localStorage.setItem(
              "gyan_browser_code_v1",
              code,
            );

            const welcomeSeen =
              window.localStorage.getItem(
                `gyan_new_card_welcome_seen_v1:${code}`,
              ) === "1";

            if (
              !welcomeSeen
            ) {
              window.localStorage.setItem(
                "gyan_new_card_welcome_pending_v1",
                code,
              );
            }
          },
        )
        .catch(
          (
            error,
          ) => {
            console.error(
              "G-Wink visitor GYAN initialization failed:",
              error,
            );
          },
        );

      return () => {
        cancelled =
          true;
      };
    },
    [],
  );


  useEffect(
    () => {
      if (
        !initialWinkToken
      ) {
        return;
      }

      const controller =
        new AbortController();

      void fetch(
        `/api/safety-resources/${encodeURIComponent(
          token,
        )}/message/wink?wink=${encodeURIComponent(
          initialWinkToken,
        )}`,
        {
          cache:
            "no-store",
          signal:
            controller.signal,
        },
      )
        .then(
          async (
            response,
          ) => {
            const body =
              await response.json() as {
                wink?:
                  WinkReveal;
                error?:
                  string;
              };

            if (
              !response.ok ||
              !body.wink
            ) {
              throw new Error(
                body.error ??
                  "This G-Wink could not be opened.",
              );
            }

            return body.wink;
          },
        )
        .then(
          (
            value,
          ) => {
            if (
              !controller.signal.aborted
            ) {
              setReveal(
                value,
              );

              window.dispatchEvent(
                new CustomEvent(
                  "gyan-wink-read",
                ),
              );
            }
          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setRevealError(
              caught instanceof Error
                ? caught.message
                : "This G-Wink could not be opened.",
            );
          },
        )
        .finally(
          () => {
            if (
              !controller.signal.aborted
            ) {
              setRevealLoading(
                false,
              );
            }
          },
        );

      return () => {
        controller.abort();
      };
    },
    [
      initialWinkToken,
      token,
    ],
  );


  function addIcon(
    icon: string,
  ): void {
    setMessage(
      (
        current,
      ) =>
        `${current}${current ? " " : ""}${icon}`,
    );
  }


  async function ensureSavedWink():
    Promise<{
      winkToken: string;
      revealUrl: string;
      deliveredToAccount?: {
        id: number;
        code: string;
        displayName: string;
      } | null;
      recipientEmailSent?: boolean;
    }> {
    if (
      savedWinkToken &&
      savedFingerprint ===
        fingerprint
    ) {
      return {
        winkToken:
          savedWinkToken,
        revealUrl:
          shareUrl,
      };
    }

    const response =
      await fetch(
        `/api/safety-resources/${encodeURIComponent(
          token,
        )}/message/winks`,
        {
          method:
            "POST",

          headers: {
            "content-type":
              "application/json",
          },

          body:
            JSON.stringify({
              kind,
              message:
                message.trim(),

              recipient:
                recipientMode
                  ? recipient.trim()
                  : "",

              addFriend:
                recipientMode &&
                addFriend,
            }),
        },
      );

    const body =
      await response.json() as {
        created?: boolean;
        winkToken?: string;
        revealUrl?: string;
        deliveredToAccount?: {
          id: number;
          code: string;
          displayName: string;
        } | null;
        recipientEmailSent?: boolean;
        error?: string;
      };

    if (
      !response.ok ||
      !body.created ||
      !body.winkToken ||
      !body.revealUrl
    ) {
      throw new Error(
        body.error ??
          "G-Wink could not be created.",
      );
    }

    setSavedWinkToken(
      body.winkToken,
    );

    setSavedFingerprint(
      fingerprint,
    );

    setShareUrl(
      body.revealUrl,
    );

    await new Promise<void>(
      (
        resolve,
      ) => {
        requestAnimationFrame(
          () =>
            requestAnimationFrame(
              () =>
                resolve(),
            ),
        );
      },
    );

    return {
      winkToken:
        body.winkToken,
      revealUrl:
        body.revealUrl,
      deliveredToAccount:
        body.deliveredToAccount ??
        null,
      recipientEmailSent:
        body.recipientEmailSent ??
        false,
    };
  }


  async function makeQrPng(
    revealUrl:
      string,
  ):
    Promise<Blob | null> {
    setShareUrl(
      revealUrl,
    );

    await new Promise<void>(
      (
        resolve,
      ) => {
        requestAnimationFrame(
          () =>
            requestAnimationFrame(
              () =>
                resolve(),
            ),
        );
      },
    );

    const svg =
      document.querySelector(
        "#g-wink-qr svg",
      );

    if (
      !(svg instanceof SVGElement)
    ) {
      return null;
    }

    const svgText =
      new XMLSerializer()
        .serializeToString(
          svg,
        );

    const svgUrl =
      URL.createObjectURL(
        new Blob(
          [
            svgText,
          ],
          {
            type:
              "image/svg+xml;charset=utf-8",
          },
        ),
      );

    try {
      const image =
        new Image();

      await new Promise<void>(
        (
          resolve,
          reject,
        ) => {
          image.onload =
            () =>
              resolve();

          image.onerror =
            () =>
              reject(
                new Error(
                  "QR could not be prepared.",
                ),
              );

          image.src =
            svgUrl;
        },
      );

      const canvas =
        document.createElement(
          "canvas",
        );

      canvas.width =
        900;
      canvas.height =
        1080;

      const context =
        canvas.getContext(
          "2d",
        );

      if (!context) {
        return null;
      }

      context.fillStyle =
        "#fffdf8";

      context.fillRect(
        0,
        0,
        900,
        1080,
      );

      context.fillStyle =
        "#1f2937";

      context.textAlign =
        "center";

      context.font =
        "bold 62px sans-serif";

      context.fillText(
        "😉 You got a G-Wink!",
        450,
        110,
      );

      context.font =
        "30px sans-serif";

      context.fillText(
        `from ${displayName}`,
        450,
        165,
      );

      context.drawImage(
        image,
        175,
        230,
        550,
        550,
      );

      context.font =
        "bold 34px sans-serif";

      context.fillText(
        "Scan to reveal",
        450,
        850,
      );

      context.font =
        "22px sans-serif";

      context.fillStyle =
        "#64748b";

      context.fillText(
        "The message is inside the G-Wink — not printed here.",
        450,
        940,
      );

      return await new Promise(
        (
          resolve,
        ) =>
          canvas.toBlob(
            resolve,
            "image/png",
          ),
      );
    } finally {
      URL.revokeObjectURL(
        svgUrl,
      );
    }
  }


  async function blobToBase64(
    blob:
      Blob,
  ):
    Promise<string> {
    return await new Promise(
      (
        resolve,
        reject,
      ) => {
        const reader =
          new FileReader();

        reader.onload =
          () => {
            const value =
              typeof reader.result ===
                "string"
                ? reader.result
                : "";

            resolve(
              value.includes(
                ",",
              )
                ? value.slice(
                    value.indexOf(
                      ",",
                    ) + 1,
                  )
                : value,
            );
          };

        reader.onerror =
          () =>
            reject(
              reader.error ??
                new Error(
                  "QR image could not be encoded.",
                ),
            );

        reader.readAsDataURL(
          blob,
        );
      },
    );
  }


  async function downloadQr():
    Promise<void> {
    try {
      setStatus(
        "Preparing G-Wink…",
      );

      const saved =
        await ensureSavedWink();

      const blob =
        await makeQrPng(
          saved.revealUrl,
        );

      if (!blob) {
        throw new Error(
          "QR could not be prepared.",
        );
      }

      const url =
        URL.createObjectURL(
          blob,
        );

      const link =
        document.createElement(
          "a",
        );

      link.href =
        url;

      link.download =
        "G-Wink.png";

      link.click();

      URL.revokeObjectURL(
        url,
      );

      setStatus(
        "✓ G-Wink downloaded.",
      );
    } catch (
      caught
    ) {
      setStatus(
        caught instanceof Error
          ? caught.message
          : "G-Wink could not be downloaded.",
      );
    }
  }


  async function shareQr():
    Promise<void> {
    try {
      setStatus(
        "Preparing G-Wink…",
      );

      const saved =
        await ensureSavedWink();

      const blob =
        await makeQrPng(
          saved.revealUrl,
        );

      if (!blob) {
        throw new Error(
          "QR could not be prepared.",
        );
      }

      const file =
        new File(
          [
            blob,
          ],
          "G-Wink.png",
          {
            type:
              "image/png",
          },
        );

      if (
        navigator.share &&
        navigator.canShare?.({
          files: [
            file,
          ],
        })
      ) {
        try {
          await navigator.share({
            title:
              "You got a G-Wink!",
            files: [
              file,
            ],
          });

          setStatus(
            "✓ G-Wink shared.",
          );

          return;
        } catch {
          return;
        }
      }

      await downloadQr();
    } catch (
      caught
    ) {
      setStatus(
        caught instanceof Error
          ? caught.message
          : "G-Wink could not be shared.",
      );
    }
  }


  async function whatsapp():
    Promise<void> {
    try {
      const saved =
        await ensureSavedWink();

      const text =
        encodeURIComponent(
          `😉 You got a G-Wink! Open to reveal: ${saved.revealUrl}`,
        );

      window.open(
        `https://wa.me/?text=${text}`,
        "_blank",
        "noopener,noreferrer",
      );

      setStatus(
        "✓ G-Wink ready in WhatsApp.",
      );
    } catch (
      caught
    ) {
      setStatus(
        caught instanceof Error
          ? caught.message
          : "G-Wink could not be prepared.",
      );
    }
  }


  async function sendEmail():
    Promise<void> {
    const recipient =
      email.trim();

    if (!recipient) {
      return;
    }

    setEmailSending(
      true,
    );

    setStatus(
      "Sending G-Wink…",
    );

    try {
      const saved =
        await ensureSavedWink();

      const qrBlob =
        await makeQrPng(
          saved.revealUrl,
        );

      if (!qrBlob) {
        throw new Error(
          "QR could not be prepared.",
        );
      }

      const qrPngBase64 =
        await blobToBase64(
          qrBlob,
        );

      const response =
        await fetch(
          `/api/safety-resources/${encodeURIComponent(
            token,
          )}/message/email`,
          {
            method:
              "POST",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                email:
                  recipient,

                cc:
                  cc.trim(),

                winkToken:
                  saved.winkToken,

                qrPngBase64,
              }),
          },
        );

      const body =
        await response.json() as {
          sent?: boolean;
          error?: string;
        };

      if (
        !response.ok ||
        !body.sent
      ) {
        throw new Error(
          response.status ===
            503
            ? "Temporary network problem. Please press Send again."
            : body.error ??
              "G-Wink email could not be sent.",
        );
      }

      setStatus(
        "✓ G-Wink emailed.",
      );

      setEmailOpen(
        false,
      );
    } catch (
      caught
    ) {
      setStatus(
        caught instanceof Error
          ? caught.message
          : "G-Wink email could not be sent.",
      );
    } finally {
      setEmailSending(
        false,
      );
    }
  }


  async function prepareForGyanRecipient():
    Promise<void> {
    if (
      !recipient.trim()
    ) {
      setStatus(
        "Enter a GYAN display name or ABCD.",
      );

      return;
    }

    try {
      const saved =
        await ensureSavedWink();

      if (
        saved.deliveredToAccount
      ) {
        setStatus(
          saved.recipientEmailSent
            ? `✓ Sent to ${saved.deliveredToAccount.displayName} · ${saved.deliveredToAccount.code}. Email notification sent too.`
            : `✓ Sent to ${saved.deliveredToAccount.displayName} · ${saved.deliveredToAccount.code}. It is waiting in My Activity.`,
        );
      } else {
        setStatus(
          "G-Wink was created, but no GYAN recipient was attached.",
        );
      }
    } catch (
      caught
    ) {
      setStatus(
        caught instanceof Error
          ? caught.message
          : "G-Wink could not be created.",
      );
    }
  }


  function closeGWink():
    void {
    onBack();

    window.setTimeout(
      () => {
        window.dispatchEvent(
          new CustomEvent(
            "gyan-show-welcome-pending",
          ),
        );
      },
      0,
    );
  }


  async function sendReply():
    Promise<void> {
    const value =
      replyMessage.trim();

    if (
      !initialWinkToken ||
      !value
    ) {
      return;
    }

    setReplySending(
      true,
    );

    setReplyStatus(
      "Sending reply…",
    );

    try {
      const response =
        await fetch(
          `/api/safety-resources/${encodeURIComponent(
            token,
          )}/message/reply`,
          {
            method:
              "POST",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                winkToken:
                  initialWinkToken,

                message:
                  value,
              }),
          },
        );

      const body =
        await response.json() as {
          sent?: boolean;
          emailSent?: boolean;
          error?: string;
        };

      if (
        !response.ok ||
        !body.sent
      ) {
        throw new Error(
          body.error ??
            "Reply could not be sent.",
        );
      }

      setReplyMessage(
        "",
      );

      setReplyOpen(
        false,
      );

      setReplyStatus(
        body.emailSent
          ? "✓ Reply sent to the GYAN account and email notification sent."
          : "✓ Reply sent to the GYAN account.",
      );
    } catch (
      caught
    ) {
      setReplyStatus(
        caught instanceof Error
          ? caught.message
          : "Reply could not be sent.",
      );
    } finally {
      setReplySending(
        false,
      );
    }
  }


  const sendActions = (
    <div
      style={{
        display:
          "flex",
        justifyContent:
          "center",
        gap:
          "5px",
      }}
    >
      {[
        {
          icon:
            "🟢",
          label:
            "WhatsApp",
          action:
            () =>
              void whatsapp(),
        },
        {
          icon:
            "📤",
          label:
            "Share",
          action:
            () =>
              void shareQr(),
        },
        {
          icon:
            "✉️",
          label:
            "Email",
          action:
            () =>
              setEmailOpen(
                (
                  current,
                ) =>
                  !current,
              ),
        },
        {
          icon:
            "⬇️",
          label:
            "Download",
          action:
            () =>
              void downloadQr(),
        },
      ].map(
        (
          item,
        ) => (
          <button
            key={
              item.label
            }
            type="button"
            aria-label={
              item.label
            }
            title={
              item.label
            }
            onClick={
              item.action
            }
            style={{
              width:
                "30px",
              height:
                "30px",
              padding:
                0,
              border:
                "1px solid #d6dee8",
              borderRadius:
                "8px",
              background:
                "#fff",
              cursor:
                "pointer",
              fontSize:
                "0.88rem",
              lineHeight:
                1,
            }}
          >
            {
              item.icon
            }
          </button>
        ),
      )}
    </div>
  );


  if (
    initialWinkToken
  ) {
    return (
      <main
        className="g-wink-page"
        style={{
          minHeight:
            "100dvh",
          background:
            "#f8fafc",
        }}
      >
        <header
          style={{
            position:
              "sticky",
            top:
              0,
            zIndex:
              10,
            display:
              "flex",
            alignItems:
              "center",
            justifyContent:
              "space-between",
            minHeight:
              "46px",
            padding:
              "6px 10px",
            borderBottom:
              "1px solid #e2e8f0",
            background:
              "#fff",
          }}
        >
          <div>
            <strong>
              GYAN
            </strong>
            {" · "}
            <strong>
              😉 G-Wink
            </strong>
          </div>

          <button
            type="button"
            aria-label="Close G-Wink"
            onClick={
              closeGWink
            }
          >
            ×
          </button>
        </header>

        <section
          style={{
            width:
              "min(92vw, 560px)",
            margin:
              "12px auto",
            padding:
              "14px",
            border:
              "1px solid #d8dee7",
            borderRadius:
              "14px",
            background:
              "#fffdf8",
          }}
        >
          {
            revealLoading ? (
              <p>
                Opening G-Wink…
              </p>
            ) : revealError ? (
              <p
                style={{
                  color:
                    "#a33131",
                }}
              >
                {
                  revealError
                }
              </p>
            ) : reveal ? (
              <>
                <div
                  style={{
                    textAlign:
                      "center",
                    marginBottom:
                      "12px",
                  }}
                >
                  <div
                    style={{
                      fontSize:
                        "2rem",
                    }}
                  >
                    {
                      reveal.kind ||
                      "😉"
                    }
                  </div>

                  <strong
                    style={{
                      display:
                        "block",
                    }}
                  >
                    You got a G-Wink!
                  </strong>

                  <div
                    style={{
                      display:
                        "flex",
                      flexWrap:
                        "wrap",
                      justifyContent:
                        "center",
                      alignItems:
                        "center",
                      gap:
                        "3px 6px",
                      marginTop:
                        "5px",
                      fontSize:
                        "0.64rem",
                      lineHeight:
                        1.3,
                      color:
                        "#64748b",
                    }}
                  >
                    <span>
                      From:{" "}
                      {
                        reveal.senderCode ? (
                          <a
                            href={`/${reveal.senderCode.toLowerCase()}`}
                            title="Open sender GYAN profile"
                            style={{
                              color:
                                "#285f85",
                              fontWeight:
                                800,
                              textDecoration:
                                "underline",
                            }}
                          >
                            {
                              reveal.senderDisplayName
                            } [{
                              reveal.senderCode
                            }]
                          </a>
                        ) : (
                          <strong>
                            {
                              reveal.senderDisplayName
                            }
                          </strong>
                        )
                      }
                      {
                        reveal.senderOriginalName &&
                        reveal.senderOriginalName !==
                          reveal.senderDisplayName
                          ? ` · ${reveal.senderOriginalName}`
                          : ""
                      }
                    </span>

                    <span
                      aria-hidden="true"
                    >
                      |
                    </span>

                    <span>
                      To:{" "}
                      {
                        reveal.recipientCode ? (
                          <a
                            href={`/${reveal.recipientCode.toLowerCase()}`}
                            title="Open recipient GYAN profile"
                            style={{
                              color:
                                "#285f85",
                              fontWeight:
                                800,
                              textDecoration:
                                "underline",
                            }}
                          >
                            {
                              reveal.recipientDisplayName ??
                              "GYAN"
                            } [{
                              reveal.recipientCode
                            }]
                          </a>
                        ) : (
                          <strong>
                            {
                              reveal.recipientDisplayName ??
                              "Shared link"
                            }
                          </strong>
                        )
                      }
                    </span>

                    <span
                      aria-hidden="true"
                    >
                      |
                    </span>

                    <span>
                      {
                        new Date(
                          reveal.createdAt,
                        ).toLocaleString()
                      }
                    </span>
                  </div>
                </div>

                <label
                  style={{
                    display:
                      "block",
                    marginBottom:
                      "5px",
                    fontSize:
                      "0.68rem",
                    fontWeight:
                      800,
                    color:
                      "#64748b",
                  }}
                >
                  MESSAGE
                </label>

                <div
                  aria-label="G-Wink message"
                  style={{
                    boxSizing:
                      "border-box",
                    width:
                      "100%",
                    minHeight:
                      "92px",
                    border:
                      "1px solid rgb(203 213 225 / 70%)",
                    borderRadius:
                      "10px",
                    padding:
                      "10px",
                    background:
                      "#fffdf8",
                    color:
                      "#1f2937",
                    font:
                      "inherit",
                    fontSize:
                      "1rem",
                    lineHeight:
                      1.45,
                    whiteSpace:
                      "pre-wrap",
                    overflowWrap:
                      "anywhere",
                  }}
                >
                  {
                    reveal.message
                  }
                </div>

                {
                  visitorGyanCode && (
                    <small
                      style={{
                        display:
                          "block",
                        marginTop:
                          "9px",
                        textAlign:
                          "center",
                        color:
                          "#64748b",
                      }}
                    >
                      Reply as GYAN {
                        visitorGyanCode
                      }
                    </small>
                  )
                }

                <div
                  style={{
                    display:
                      "flex",
                    justifyContent:
                      "center",
                    marginTop:
                      "10px",
                  }}
                >
                  <button
                    type="button"
                    onClick={() =>
                      setReplyOpen(
                        (
                          current,
                        ) =>
                          !current,
                      )
                    }
                    style={{
                      minHeight:
                        "36px",
                      padding:
                        "6px 14px",
                      border:
                        "1px solid #cbd5e1",
                      borderRadius:
                        "9px",
                      background:
                        "#fff",
                      fontWeight:
                        800,
                      cursor:
                        "pointer",
                    }}
                  >
                    ↩️ Reply
                  </button>
                </div>

                {
                  replyOpen && (
                    <div
                      style={{
                        marginTop:
                          "9px",
                        padding:
                          "9px",
                        borderRadius:
                          "10px",
                        background:
                          "#f8fafc",
                      }}
                    >
                      <textarea
                        value={
                          replyMessage
                        }
                        onChange={(
                          event,
                        ) =>
                          setReplyMessage(
                            event.target.value,
                          )
                        }
                        rows={
                          3
                        }
                        maxLength={
                          240
                        }
                        placeholder="Write your reply…"
                        style={{
                          boxSizing:
                            "border-box",
                          width:
                            "100%",
                          border:
                            "1px solid #cbd5e1",
                          borderRadius:
                            "9px",
                          padding:
                            "8px",
                          resize:
                            "vertical",
                          font:
                            "inherit",
                        }}
                      />

                      <div
                        style={{
                          display:
                            "flex",
                          justifyContent:
                            "flex-end",
                          marginTop:
                            "6px",
                        }}
                      >
                        <button
                          type="button"
                          disabled={
                            replySending ||
                            !replyMessage.trim()
                          }
                          onClick={() =>
                            void sendReply()
                          }
                          style={{
                            minHeight:
                              "34px",
                            padding:
                              "5px 12px",
                            border:
                              0,
                            borderRadius:
                              "8px",
                            background:
                              "#6d4cc2",
                            color:
                              "#fff",
                            fontWeight:
                              800,
                            cursor:
                              "pointer",
                          }}
                        >
                          {
                            replySending
                              ? "Sending…"
                              : "Send Reply"
                          }
                        </button>
                      </div>
                    </div>
                  )
                }

                {
                  replyStatus && (
                    <small
                      style={{
                        display:
                          "block",
                        marginTop:
                          "8px",
                        textAlign:
                          "center",
                        color:
                          replyStatus.startsWith(
                            "✓",
                          )
                            ? "#166534"
                            : "#a33131",
                      }}
                    >
                      {
                        replyStatus
                      }
                    </small>
                  )
                }

                <small
                  style={{
                    display:
                      "block",
                    marginTop:
                      "9px",
                    textAlign:
                      "center",
                    color:
                      "#64748b",
                  }}
                >
                  Semi-private · anyone with this G-Wink link can read it.
                </small>
              </>
            ) : null
          }
        </section>
      </main>
    );
  }


  return (
    <main
      className="g-wink-page"
      style={{
        minHeight:
          "100dvh",
        background:
          "#f8fafc",
      }}
    >
      <header
        style={{
          position:
            "sticky",
          top:
            0,
          zIndex:
            10,
          display:
            "flex",
          alignItems:
            "center",
          justifyContent:
            "space-between",
          minHeight:
            "46px",
          padding:
            "6px 10px",
          borderBottom:
            "1px solid #e2e8f0",
          background:
            "#fff",
        }}
      >
        <div>
          <strong>
            GYAN
          </strong>
          {" · "}
          <strong>
            😉 G-Wink
          </strong>
        </div>

        <button
          type="button"
          aria-label="Close G-Wink"
          onClick={
            onBack
          }
        >
          ×
        </button>
      </header>

      <div
        style={{
          width:
            "min(96vw, 720px)",
          margin:
            "8px auto 18px",
        }}
      >
        <section
          style={{
            padding:
              "10px",
            border:
              "1px solid #d8dee7",
            borderRadius:
              "12px",
            background:
              "#fffdf8",
          }}
        >
          <div
            style={{
              display:
                "flex",
              alignItems:
                "center",
              justifyContent:
                "space-between",
              gap:
                "8px",
              marginBottom:
                "6px",
            }}
          >
            <div>
              <strong>
                😉 Make a G-Wink
              </strong>

              <small
                style={{
                  display:
                    "block",
                }}
              >
                Write it here. Share only the QR/link.
              </small>
            </div>

            <small>
              {
                message.length
              }/240
            </small>
          </div>

          {
            sendActions
          }

          <div
            style={{
              display:
                "flex",
              flexWrap:
                "wrap",
              gap:
                "4px",
              margin:
                "7px 0",
            }}
          >
            {
              kinds.map(
                (
                  item,
                ) => (
                  <button
                    key={
                      item[1]
                    }
                    type="button"
                    onClick={() => {
                      setKind(
                        item[0],
                      );

                      setMessage(
                        item[2],
                      );
                    }}
                    style={{
                      padding:
                        "3px 6px",
                      border:
                        kind ===
                          item[0]
                          ? "1.5px solid #7c3aed"
                          : "1px solid #cbd5e1",
                      borderRadius:
                        "999px",
                      background:
                        "#fff",
                      fontSize:
                        "0.64rem",
                    }}
                  >
                    {
                      item[0]
                    } {
                      item[1]
                    }
                  </button>
                ),
              )
            }
          </div>

          <textarea
            value={
              message
            }
            onChange={(
              event,
            ) =>
              setMessage(
                event.target.value,
              )
            }
            maxLength={
              240
            }
            rows={
              3
            }
            placeholder="Write your G-Wink…"
            style={{
              boxSizing:
                "border-box",
              width:
                "100%",
              border:
                "1px solid #cbd5e1",
              borderRadius:
                "9px",
              padding:
                "8px",
              resize:
                "vertical",
              font:
                "inherit",
            }}
          />

          <div
            style={{
              display:
                "flex",
              flexWrap:
                "wrap",
              gap:
                "3px",
              margin:
                "5px 0 7px",
            }}
          >
            {
              icons.map(
                (
                  icon,
                ) => (
                  <button
                    key={
                      icon
                    }
                    type="button"
                    onClick={() =>
                      addIcon(
                        icon,
                      )
                    }
                    style={{
                      width:
                        "29px",
                      height:
                        "29px",
                      padding:
                        0,
                      border:
                        "1px solid #e2e8f0",
                      borderRadius:
                        "7px",
                      background:
                        "#fff",
                    }}
                  >
                    {
                      icon
                    }
                  </button>
                ),
              )
            }
          </div>

          <div
            style={{
              display:
                "grid",
              gridTemplateColumns:
                recipientMode
                  ? "auto minmax(120px, 1fr) auto auto auto"
                  : "auto 1fr",
              alignItems:
                "center",
              gap:
                "5px",
              padding:
                "6px 7px",
              borderRadius:
                "9px",
              background:
                "#f8fafc",
            }}
          >
            <label
              style={{
                display:
                  "flex",
                alignItems:
                  "center",
                gap:
                  "5px",
                fontSize:
                  "0.68rem",
                fontWeight:
                  700,
                whiteSpace:
                  "nowrap",
              }}
            >
              <input
                type="checkbox"
                checked={
                  recipientMode
                }
                onChange={(
                  event,
                ) =>
                  setRecipientMode(
                    event.target.checked,
                  )
                }
              />
              Send to a GYAN recipient
            </label>

            {
              recipientMode ? (
                <>
                  <input
                    value={
                      recipient
                    }
                    onChange={(
                      event,
                    ) =>
                      setRecipient(
                        event.target.value,
                      )
                    }
                    placeholder="Display name / ABCD"
                    style={{
                      minWidth:
                        0,
                      height:
                        "30px",
                    }}
                  />

                  <label
                    style={{
                      display:
                        "flex",
                      alignItems:
                        "center",
                      gap:
                        "4px",
                      fontSize:
                        "0.64rem",
                      whiteSpace:
                        "nowrap",
                    }}
                  >
                    <input
                      type="checkbox"
                      checked={
                        addFriend
                      }
                      onChange={(
                        event,
                      ) =>
                        setAddFriend(
                          event.target.checked,
                        )
                      }
                    />
                    Add friend
                  </label>

                  <button
                    type="button"
                    disabled={
                      !recipient.trim()
                    }
                    onClick={() =>
                      void prepareForGyanRecipient()
                    }
                  >
                    Send
                  </button>

                  <button
                    type="button"
                    onClick={() =>
                      setStatus(
                        "Invite flow will be connected next.",
                      )
                    }
                  >
                    Invite
                  </button>
                </>
              ) : (
                <small>
                  Optional
                </small>
              )
            }
          </div>

          {
            emailOpen && (
              <div
                style={{
                  display:
                    "grid",
                  gridTemplateColumns:
                    "minmax(0, 1fr) minmax(0, 1fr) auto",
                  gap:
                    "5px",
                  marginTop:
                    "7px",
                }}
              >
                <input
                  type="email"
                  value={
                    email
                  }
                  onChange={(
                    event,
                  ) =>
                    setEmail(
                      event.target.value,
                    )
                  }
                  placeholder="To email"
                />

                <input
                  type="email"
                  value={
                    cc
                  }
                  onChange={(
                    event,
                  ) =>
                    setCc(
                      event.target.value,
                    )
                  }
                  placeholder="CC (optional)"
                />

                <button
                  type="button"
                  disabled={
                    emailSending ||
                    !email.trim()
                  }
                  onClick={() =>
                    void sendEmail()
                  }
                >
                  {
                    emailSending
                      ? "Sending…"
                      : "Send"
                  }
                </button>
              </div>
            )
          }

          {
            status && (
              <small
                style={{
                  display:
                    "block",
                  margin:
                    "6px 0",
                  textAlign:
                    "center",
                }}
              >
                {
                  status
                }
              </small>
            )
          }

          {
            sendActions
          }

          <a
            id="g-wink-qr"
            href={
              shareUrl
            }
            target="_blank"
            rel="noreferrer"
            title="Open G-Wink"
            style={{
              display:
                "grid",
              placeItems:
                "center",
              marginTop:
                "8px",
              padding:
                "7px",
              borderRadius:
                "10px",
              background:
                "#fff",
              color:
                "inherit",
              textDecoration:
                "none",
            }}
          >
            <QRCodeSVG
              value={
                shareUrl
              }
              size={
                126
              }
              level="M"
              includeMargin
            />

            <strong>
              😉 G-Wink
            </strong>

            <small>
              Tap QR to open · semi-private
            </small>
          </a>
        </section>
      </div>
    </main>
  );
}
