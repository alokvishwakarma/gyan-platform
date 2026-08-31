import {
  useEffect,
  useState,
} from "react";

import {
  QRCodeSVG,
} from "qrcode.react";

import "./SafetyResourceLandingPage.css";

import GWinkPage
  from "./GWinkPage";


type SafetyResourceType =
  | "MESSAGE"
  | "CERTIFICATE"
  | "LOST_FOUND"
  | "EMERGENCY"
  | "HELP";


type LostFoundProfile = {
  ownerDeliverAt: string;
  ownerContact: string;
  ownerMessage: string;

  finderFoundAt: string;
  finderWillDeliverAt: string;
  finderMessage: string;

  supportRequested: boolean;
};

type EmergencyProfile = {
  emergencyMessage: string;
  primaryContact: string;
  secondaryContact: string;
  medicalNotes: string;
  meetingPlace: string;
};


type EmergencyMessage = {
  id: number;
  message: string;
  contact: string;
  createdAt: string;
};



type SafetyResource = {
  token: string;
  type: SafetyResourceType;
  displayName: string;

  accountUrl?: string;
  recoveryEmailStored?: boolean;
  recoveryEmailVerified?: boolean;
  maskedRecoveryEmail?: string;
  safetyCards?: Array<{
    type: SafetyResourceType;
    token: string;
    publicUrl: string;
  }>;

  lostFound?:
    LostFoundProfile;

  emergency?:
    EmergencyProfile;
};


type ChatMessage = {
  id: number;
  senderRole:
    "FINDER" |
    "OWNER" |
    "SUPPORT";
  message: string;
  createdAt: string;
};


function titleFor(
  type: SafetyResourceType,
): string {
  if (
    type ===
      "MESSAGE"
  ) {
    return "G-Wink";
  }

  if (
    type ===
      "CERTIFICATE"
  ) {
    return "GYAN Certificate";
  }

  if (
    type ===
      "LOST_FOUND"
  ) {
    return "Lost & Found";
  }

  if (
    type ===
      "EMERGENCY"
  ) {
    return "Emergency";
  }

  return "Help";
}


function messageFor(
  type: SafetyResourceType,
): string {
  if (
    type ===
      "MESSAGE"
  ) {
    return "Make a G-Wink. Your message stays behind the QR.";
  }

  if (
    type ===
      "CERTIFICATE"
  ) {
    return "This is a shareable GYAN certificate link. Private learning history is not exposed here.";
  }

  if (
    type ===
      "LOST_FOUND"
  ) {
    return "Use this privacy-friendly GYAN card to help return a found item without asking for a phone number or email.";
  }

  if (
    type ===
      "EMERGENCY"
  ) {
    return "This privacy-friendly GYAN card can show owner-approved emergency options without exposing private contact details.";
  }

  return "Use this privacy-friendly GYAN card to request or offer help without exposing private contact details.";
}


function EmergencyPanel({
  token,
  initial,
}: {
  token: string;
  initial: EmergencyProfile;
}) {
  const [profile, setProfile] =
    useState(initial);

  const [draft, setDraft] =
    useState(initial);

  const [accessCode, setAccessCode] =
    useState("");

  const [editing, setEditing] =
    useState(false);

  const [saving, setSaving] =
    useState(false);

  const [status, setStatus] =
    useState("");

  const [scannerMessage, setScannerMessage] =
    useState("");

  const [lastSentMessage, setLastSentMessage] =
    useState("");

  const [sendingMessage, setSendingMessage] =
    useState(false);

  const [messages, setMessages] =
    useState<EmergencyMessage[]>([]);


  async function sendScannerMessage() {
    const message =
      scannerMessage.trim();

    if (!message) {
      setStatus(
        "Enter a message for the owner.",
      );

      return;
    }

    setSendingMessage(
      true,
    );

    setStatus(
      "",
    );

    try {
      const response =
        await fetch(
          `/api/safety-resources/${encodeURIComponent(
            token,
          )}/emergency/message`,
          {
            method:
              "POST",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                message,

                contact:
                  "",
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
          body.error ??
            "Message could not be sent.",
        );
      }

      setLastSentMessage(
        message,
      );

      setScannerMessage(
        "",
      );

      setStatus(
        "✓ Message sent to the owner.",
      );
    } catch (
      caught
    ) {
      setStatus(
        caught instanceof Error
          ? caught.message
          : "Message could not be sent.",
      );
    } finally {
      setSendingMessage(
        false,
      );
    }
  }


  async function loadMessages() {
    const response =
      await fetch(
        `/api/safety-resources/${encodeURIComponent(
          token,
        )}/emergency/messages`,
        {
          method:
            "POST",

          headers: {
            "content-type":
              "application/json",
          },

          body:
            JSON.stringify({
              accessCode:
                accessCode.trim(),
            }),
        },
      );

    const body =
      await response.json() as {
        messages?:
          EmergencyMessage[];
        error?: string;
      };

    if (
      !response.ok
    ) {
      throw new Error(
        body.error ??
          "Emergency messages could not be loaded.",
      );
    }

    setMessages(
      body.messages ??
        [],
    );
  }


  async function unlock() {
    if (!accessCode.trim()) {
      setStatus(
        "Enter the Access Code to edit emergency details.",
      );
      return;
    }

    const response =
      await fetch(
        `/api/safety-resources/${encodeURIComponent(
          token,
        )}/emergency/verify-owner`,
        {
          method: "POST",

          headers: {
            "content-type":
              "application/json",
          },

          body:
            JSON.stringify({
              accessCode:
                accessCode.trim(),
            }),
        },
      );

    const body =
      await response.json() as {
        verified?: boolean;
        error?: string;
      };

    if (
      !response.ok ||
      !body.verified
    ) {
      setStatus(
        body.error ??
          "Access Code was not accepted.",
      );
      return;
    }

    setEditing(true);

    try {
      await loadMessages();
    } catch (
      caught
    ) {
      setStatus(
        caught instanceof Error
          ? caught.message
          : "Emergency details unlocked, but messages could not be loaded.",
      );

      return;
    }

    setStatus(
      "✓ Emergency details unlocked.",
    );
  }


  async function save() {
    setSaving(true);
    setStatus("");

    try {
      const response =
        await fetch(
          `/api/safety-resources/${encodeURIComponent(
            token,
          )}/emergency/owner`,
          {
            method: "POST",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                accessCode:
                  accessCode.trim(),

                ...draft,
              }),
          },
        );

      const body =
        await response.json() as {
          saved?: boolean;
          emergency?: EmergencyProfile;
          error?: string;
        };

      if (
        !response.ok ||
        !body.saved ||
        !body.emergency
      ) {
        throw new Error(
          body.error ??
            "Emergency details could not be saved.",
        );
      }

      setProfile(
        body.emergency,
      );

      setDraft(
        body.emergency,
      );

      setEditing(false);

      setStatus(
        "✓ Emergency details saved.",
      );
    } catch (caught) {
      setStatus(
        caught instanceof Error
          ? caught.message
          : "Emergency details could not be saved.",
      );
    } finally {
      setSaving(false);
    }
  }


  return (
    <section className="safety-resource__emergency">
      {
        !editing ? (
          <>
            <section className="safety-resource__emergency-card safety-resource__emergency-card--owner">
              <div className="safety-resource__emergency-card-head">
                <strong>
                  🆘 Emergency Card
                </strong>

                <small>
                  Owner-provided information
                </small>
              </div>

              <div className="safety-resource__emergency-public">
              <div>
                <span>
                  Emergency message
                </span>

                <strong>
                  {
                    profile.emergencyMessage ||
                    "No emergency message provided."
                  }
                </strong>
              </div>

              <div>
                <span>
                  Primary contact
                </span>

                <strong>
                  {
                    profile.primaryContact ||
                    "Not provided"
                  }
                </strong>
              </div>

              <div>
                <span>
                  Secondary contact
                </span>

                <strong>
                  {
                    profile.secondaryContact ||
                    "Not provided"
                  }
                </strong>
              </div>

              <div>
                <span>
                  Medical / communication notes
                </span>

                <strong>
                  {
                    profile.medicalNotes ||
                    "Not provided"
                  }
                </strong>
              </div>

              <div>
                <span>
                  Safe meeting / handoff place
                </span>

                <strong>
                  {
                    profile.meetingPlace ||
                    "Not provided"
                  }
                </strong>
              </div>
            </div>

            </section>

            <section className="safety-resource__emergency-card safety-resource__emergency-card--scanner">
              <div className="safety-resource__emergency-card-head">
                <strong>
                  💬 Scanner Message
                </strong>

                <small>
                  Leave a private message for the owner. No name, email or phone is required.
                </small>
              </div>

              <div className="safety-resource__emergency-message-box">

              <textarea
                value={
                  scannerMessage
                }
                onChange={(
                  event,
                ) =>
                  setScannerMessage(
                    event.target.value,
                  )
                }
                rows={
                  2
                }
                maxLength={
                  500
                }
                placeholder="e.g. I am with them at the library. They are safe."
              />

              <button
                type="button"
                disabled={
                  sendingMessage ||
                  !scannerMessage.trim()
                }
                onClick={() =>
                  void sendScannerMessage()
                }
              >
                {
                  sendingMessage
                    ? "Sending…"
                    : "Send message"
                }
              </button>

              {
                lastSentMessage && (
                  <div className="safety-resource__scanner-sent">
                    <strong>
                      ✓ Sent
                    </strong>

                    <span>
                      {
                        lastSentMessage
                      }
                    </span>
                  </div>
                )
              }
            </div>

            </section>

            <div className="safety-resource__emergency-edit">
              <label>
                <span>
                  Access Code
                </span>

                <input
                  type="password"
                  value={
                    accessCode
                  }
                  onChange={(
                    event,
                  ) =>
                    setAccessCode(
                      event.target.value,
                    )
                  }
                  placeholder="ABCDE-FGHIJ"
                  autoComplete="off"
                />
              </label>

              <button
                type="button"
                onClick={() =>
                  void unlock()
                }
              >
                ✏ Edit
              </button>
            </div>

            {
              messages.length > 0 && (
                <div className="safety-resource__emergency-owner-messages safety-resource__emergency-owner-messages--read">
                  <div className="safety-resource__emergency-message-head">
                    <strong>
                      Scanner messages
                    </strong>

                    <small>
                      Private to owner · newest first
                    </small>
                  </div>

                  {
                    messages.map(
                      (
                        item,
                      ) => (
                        <div
                          key={
                            item.id
                          }
                          className="safety-resource__emergency-owner-message"
                        >
                          <span className="safety-resource__emergency-message-line">
                            <strong>
                              {
                                item.message
                              }
                            </strong>

                            <small>
                              {
                                item.createdAt
                              }
                            </small>
                          </span>
                        </div>
                      ),
                    )
                  }
                </div>
              )
            }
          </>
        ) : (
          <div className="safety-resource__emergency-form">
            <div className="safety-resource__emergency-warning">
              <strong>
                Privacy
              </strong>

              <span>
                Only enter information you are comfortable showing to anyone who scans this Emergency QR.
              </span>
            </div>



            <label>
              <span>
                Emergency message
              </span>

              <textarea
                value={
                  draft.emergencyMessage
                }
                onChange={(
                  event,
                ) =>
                  setDraft({
                    ...draft,

                    emergencyMessage:
                      event.target.value,
                  })
                }
                rows={
                  2
                }
                maxLength={
                  300
                }
                placeholder="e.g. Please stay with me and contact my family."
              />
            </label>

            <label className="safety-resource__emergency-field safety-resource__emergency-field--primary">
              <span>
                Primary contact
              </span>

              <input
                value={
                  draft.primaryContact
                }
                onChange={(
                  event,
                ) =>
                  setDraft({
                    ...draft,

                    primaryContact:
                      event.target.value,
                  })
                }
                maxLength={
                  160
                }
                placeholder="Owner-approved contact"
              />

              <small className="safety-resource__field-hint">
                Anything entered here is visible to anyone who scans this Emergency QR.
              </small>
            </label>

            <label className="safety-resource__emergency-field safety-resource__emergency-field--secondary">
              <span>
                Secondary contact
              </span>

              <input
                value={
                  draft.secondaryContact
                }
                onChange={(
                  event,
                ) =>
                  setDraft({
                    ...draft,

                    secondaryContact:
                      event.target.value,
                  })
                }
                maxLength={
                  160
                }
                placeholder="Optional backup contact"
              />
            </label>

            <label className="safety-resource__emergency-field safety-resource__emergency-field--medical">
              <span>
                Medical / communication notes
              </span>

              <textarea
                value={
                  draft.medicalNotes
                }
                onChange={(
                  event,
                ) =>
                  setDraft({
                    ...draft,

                    medicalNotes:
                      event.target.value,
                  })
                }
                rows={
                  3
                }
                maxLength={
                  500
                }
                placeholder="Only information you want visible publicly"
              />
            </label>

            <label className="safety-resource__emergency-field safety-resource__emergency-field--meeting">
              <span>
                Safe meeting / handoff place
              </span>

              <input
                value={
                  draft.meetingPlace
                }
                onChange={(
                  event,
                ) =>
                  setDraft({
                    ...draft,

                    meetingPlace:
                      event.target.value,
                  })
                }
                maxLength={
                  160
                }
                placeholder="Public landmark, city & state"
              />

              <small className="safety-resource__field-hint">
                Recommended: use a public landmark plus city/state instead of a home address. Example: Victoria Ave Library, Riverside, CA.
              </small>
            </label>

            <div className="safety-resource__actions">
              <button
                type="button"
                disabled={
                  saving
                }
                onClick={() =>
                  void save()
                }
              >
                {
                  saving
                    ? "Saving…"
                    : "Save"
                }
              </button>

              <button
                type="button"
                className="safety-resource__button--secondary"
                onClick={() => {
                  setDraft(
                    profile,
                  );

                  setEditing(
                    false,
                  );
                }}
              >
                Cancel
              </button>
            </div>

            <div className="safety-resource__emergency-owner-messages">
              <div className="safety-resource__emergency-message-head">
                <strong>
                  Scanner messages
                </strong>

                <small>
                  Private to the owner · newest first
                </small>
              </div>

              {
                messages.length ===
                  0 ? (
                  <small className="safety-resource__field-hint">
                    No scanner messages yet.
                  </small>
                ) : (
                  messages.map(
                    (
                      item,
                    ) => (
                      <div
                        key={
                          item.id
                        }
                        className="safety-resource__emergency-owner-message"
                      >
                        <span className="safety-resource__emergency-message-line">
                          <strong>
                            {
                              item.message
                            }
                          </strong>

                          <small>
                            {
                              item.createdAt
                            }
                          </small>
                        </span>
                      </div>
                    ),
                  )
                )
              }
            </div>
          </div>
        )
      }

      {
        status && (
          <div className="safety-resource__status">
            {
              status
            }
          </div>
        )
      }
    </section>
  );
}


function LostFoundPanel({
  token,
  displayName,
  initial,
}: {
  token: string;
  displayName: string;
  initial:
    LostFoundProfile;
}) {
  const [
    profile,
    setProfile,
  ] =
    useState(
      initial,
    );

  const [
    finderDraft,
    setFinderDraft,
  ] =
    useState({
      foundAt:
        initial.finderFoundAt,

      willDeliverAt:
        initial.finderWillDeliverAt,

      message:
        initial.finderMessage,
    });

  const [
    ownerDraft,
    setOwnerDraft,
  ] =
    useState({
      deliverAt:
        initial.ownerDeliverAt,

      contact:
        initial.ownerContact,

      message:
        initial.ownerMessage,
    });

  const [
    ownerEditing,
    setOwnerEditing,
  ] =
    useState(false);

  const [
    accessCode,
    setAccessCode,
  ] =
    useState("");

  const [
    savingFinder,
    setSavingFinder,
  ] =
    useState(false);

  const [
    savingOwner,
    setSavingOwner,
  ] =
    useState(false);

  const [
    status,
    setStatus,
  ] =
    useState("");

  const [
    requestingSupport,
    setRequestingSupport,
  ] =
    useState(false);


  const [
    chatOpen,
    setChatOpen,
  ] =
    useState(false);

  const [
    chatRole,
    setChatRole,
  ] =
    useState<
      "FINDER" |
      "OWNER"
    >(
      "FINDER",
    );

  const [
    chatMessages,
    setChatMessages,
  ] =
    useState<
      ChatMessage[]
    >(
      [],
    );

  const [
    chatDraft,
    setChatDraft,
  ] =
    useState("");

  const [
    chatLoading,
    setChatLoading,
  ] =
    useState(false);

  const [
    chatSending,
    setChatSending,
  ] =
    useState(false);


  async function saveFinder() {
    setSavingFinder(
      true,
    );

    setStatus(
      "",
    );

    try {
      const response =
        await fetch(
          `/api/safety-resources/${encodeURIComponent(
            token,
          )}/lost-found/finder`,
          {
            method:
              "POST",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                foundAt:
                  finderDraft.foundAt,

                willDeliverAt:
                  finderDraft.willDeliverAt,

                message:
                  finderDraft.message,
              }),
          },
        );

      const body =
        await response.json() as
          {
            saved?: boolean;
            lostFound?:
              LostFoundProfile;
            error?: string;
          };

      if (
        !response.ok ||
        !body.saved ||
        !body.lostFound
      ) {
        throw new Error(
          body.error ??
            "Unable to save finder details.",
        );
      }

      setProfile(
        body.lostFound,
      );

      setStatus(
        "✓ Finder details saved.",
      );
    } catch (
      error
    ) {
      setStatus(
        error instanceof Error
          ? error.message
          : "Unable to save finder details.",
      );
    } finally {
      setSavingFinder(
        false,
      );
    }
  }


  async function beginOwnerEdit() {
    if (
      !accessCode.trim()
    ) {
      setStatus(
        "Enter the Access Code to edit owner details.",
      );

      return;
    }

    setStatus(
      "",
    );

    const response =
      await fetch(
        `/api/safety-resources/${encodeURIComponent(
          token,
        )}/lost-found/verify-owner`,
        {
          method:
            "POST",

          headers: {
            "content-type":
              "application/json",
          },

          body:
            JSON.stringify({
              accessCode:
                accessCode.trim(),
            }),
        },
      );

    const body =
      await response.json() as
        {
          verified?: boolean;
          error?: string;
        };

    if (
      !response.ok ||
      !body.verified
    ) {
      setStatus(
        body.error ??
          "Access Code was not accepted.",
      );

      return;
    }

    setOwnerEditing(
      true,
    );

    setChatRole(
      "OWNER",
    );

    setStatus(
      "✓ Owner editing unlocked.",
    );
  }


  async function saveOwner() {
    setSavingOwner(
      true,
    );

    setStatus(
      "",
    );

    try {
      const response =
        await fetch(
          `/api/safety-resources/${encodeURIComponent(
            token,
          )}/lost-found/owner`,
          {
            method:
              "POST",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                accessCode:
                  accessCode.trim(),

                deliverAt:
                  ownerDraft.deliverAt,

                contact:
                  ownerDraft.contact,

                message:
                  ownerDraft.message,
              }),
          },
        );

      const body =
        await response.json() as
          {
            saved?: boolean;
            lostFound?:
              LostFoundProfile;
            error?: string;
          };

      if (
        !response.ok ||
        !body.saved ||
        !body.lostFound
      ) {
        throw new Error(
          body.error ??
            "Unable to save owner details.",
        );
      }

      setProfile(
        body.lostFound,
      );

      setOwnerEditing(
        false,
      );

      setStatus(
        "✓ Owner details saved.",
      );
    } catch (
      error
    ) {
      setStatus(
        error instanceof Error
          ? error.message
          : "Unable to save owner details.",
      );
    } finally {
      setSavingOwner(
        false,
      );
    }
  }


  async function requestSupport() {
    setRequestingSupport(
      true,
    );

    setStatus(
      "",
    );

    try {
      const response =
        await fetch(
          `/api/safety-resources/${encodeURIComponent(
            token,
          )}/lost-found/support`,
          {
            method:
              "POST",
          },
        );

      const body =
        await response.json() as
          {
            requested?: boolean;
            lostFound?:
              LostFoundProfile;
            error?: string;
          };

      if (
        !response.ok ||
        !body.requested
      ) {
        throw new Error(
          body.error ??
            "Unable to request GYAN Support.",
        );
      }

      if (
        body.lostFound
      ) {
        setProfile(
          body.lostFound,
        );
      }

      setStatus(
        "✓ GYAN Support has been invited to this chat.",
      );
    } catch (
      error
    ) {
      setStatus(
        error instanceof Error
          ? error.message
          : "Unable to request GYAN Support.",
      );
    } finally {
      setRequestingSupport(
        false,
      );
    }
  }


  async function openChat(
    role:
      "FINDER" |
      "OWNER",
  ) {
    setChatRole(
      role,
    );

    setChatOpen(
      true,
    );

    setChatLoading(
      true,
    );

    try {
      const response =
        await fetch(
          `/api/safety-resources/${encodeURIComponent(
            token,
          )}/lost-found/chat`,
          {
            cache:
              "no-store",
          },
        );

      const body =
        await response.json() as
          {
            messages?:
              ChatMessage[];
            error?: string;
          };

      if (
        !response.ok
      ) {
        throw new Error(
          body.error ??
            "Unable to load chat.",
        );
      }

      setChatMessages(
        body.messages ??
          [],
      );
    } catch (
      error
    ) {
      setStatus(
        error instanceof Error
          ? error.message
          : "Unable to load chat.",
      );
    } finally {
      setChatLoading(
        false,
      );
    }
  }


  async function sendChat() {
    const message =
      chatDraft.trim();

    if (!message) {
      return;
    }

    setChatSending(
      true,
    );

    try {
      const response =
        await fetch(
          `/api/safety-resources/${encodeURIComponent(
            token,
          )}/lost-found/chat`,
          {
            method:
              "POST",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                senderRole:
                  chatRole,

                accessCode:
                  chatRole ===
                    "OWNER"
                    ? accessCode.trim()
                    : undefined,

                message,
              }),
          },
        );

      const body =
        await response.json() as
          {
            message?:
              ChatMessage;
            error?: string;
          };

      if (
        !response.ok ||
        !body.message
      ) {
        throw new Error(
          body.error ??
            "Unable to send chat message.",
        );
      }

      setChatMessages(
        (
          current,
        ) => [
          ...current,
          body.message as
            ChatMessage,
        ],
      );

      setChatDraft(
        "",
      );
    } catch (
      error
    ) {
      setStatus(
        error instanceof Error
          ? error.message
          : "Unable to send chat message.",
      );
    } finally {
      setChatSending(
        false,
      );
    }
  }



  return (
    <>
      <div className="safety-resource__lost-found-grid safety-resource__lost-found-grid--expanded">
        <section className="safety-resource__role-card safety-resource__role-card--owner">
          <div className="safety-resource__role-title">
            🏷 Owner
          </div>

          <div className="safety-resource__owner-hint">
            Access Code is required to edit this section.
          </div>

          {
            !ownerEditing ? (
              <>
                <div className="safety-resource__owner-summary">
                  <div>
                    <strong>
                      Please deliver at
                    </strong>

                    <span>
                      {
                        profile.ownerDeliverAt ||
                        "Not specified"
                      }
                    </span>
                  </div>

                  <div>
                    <strong>
                      My contact
                    </strong>

                    <span>
                      {
                        profile.ownerContact ||
                        "Not provided"
                      }
                    </span>
                  </div>

                  <div>
                    <strong>
                      Message
                    </strong>

                    <span>
                      {
                        profile.ownerMessage ||
                        "No message"
                      }
                    </span>
                  </div>
                </div>

                <label>
                  <span>
                    Access Code
                  </span>

                  <input
                    type="password"
                    value={
                      accessCode
                    }
                    onChange={(
                      event,
                    ) =>
                      setAccessCode(
                        event.target.value,
                      )
                    }
                    placeholder="ABCDE-FGHIJ"
                    autoComplete="off"
                  />
                </label>

                <div className="safety-resource__actions">
                  <button
                    type="button"
                    onClick={() =>
                      void beginOwnerEdit()
                    }
                  >
                    ✏ Edit
                  </button>

                  <button
                    type="button"
                    className="safety-resource__button--secondary"
                    disabled={
                      !accessCode.trim()
                    }
                    onClick={() =>
                      void openChat(
                        "OWNER",
                      )
                    }
                  >
                    💬 Chat
                  </button>
                </div>
              </>
            ) : (
              <>
                <label>
                  <span>
                    Please deliver at
                  </span>

                  <input
                    value={
                      ownerDraft.deliverAt
                    }
                    onChange={(
                      event,
                    ) =>
                      setOwnerDraft(
                        {
                          ...ownerDraft,
                          deliverAt:
                            event.target.value,
                        },
                      )
                    }
                    placeholder="e.g. school front office"
                    maxLength={
                      120
                    }
                  />
                </label>

                <label>
                  <span>
                    My contact
                    <small>
                      OPTIONAL
                    </small>
                  </span>

                  <input
                    value={
                      ownerDraft.contact
                    }
                    onChange={(
                      event,
                    ) =>
                      setOwnerDraft(
                        {
                          ...ownerDraft,
                          contact:
                            event.target.value,
                        },
                      )
                    }
                    placeholder="Optional contact detail"
                    maxLength={
                      120
                    }
                  />
                </label>

                <label>
                  <span>
                    Message
                  </span>

                  <textarea
                    value={
                      ownerDraft.message
                    }
                    onChange={(
                      event,
                    ) =>
                      setOwnerDraft(
                        {
                          ...ownerDraft,
                          message:
                            event.target.value,
                        },
                      )
                    }
                    placeholder="Optional note for the finder"
                    maxLength={
                      300
                    }
                    rows={
                      3
                    }
                  />
                </label>

                <div className="safety-resource__actions">
                  <button
                    type="button"
                    onClick={
                      saveOwner
                    }
                    disabled={
                      savingOwner
                    }
                  >
                    {
                      savingOwner
                        ? "Saving…"
                        : "Save"
                    }
                  </button>

                  <button
                    type="button"
                    className="safety-resource__button--secondary"
                    onClick={() =>
                      setOwnerEditing(
                        false,
                      )
                    }
                  >
                    Cancel
                  </button>

                  <button
                    type="button"
                    className="safety-resource__button--secondary"
                    onClick={() =>
                      void openChat(
                        "OWNER",
                      )
                    }
                  >
                    💬 Chat
                  </button>
                </div>
              </>
            )
          }
        </section>


        <section className="safety-resource__role-card safety-resource__role-card--finder">
          <div className="safety-resource__role-title">
            🔎 Finder
          </div>

          <label>
            <span>
              Found at
            </span>

            <input
              value={
                finderDraft.foundAt
              }
              onChange={(
                event,
              ) =>
                setFinderDraft(
                  {
                    ...finderDraft,
                    foundAt:
                      event.target.value,
                  },
                )
              }
              placeholder="e.g. school library"
              maxLength={
                120
              }
            />
          </label>

          <label>
            <span>
              Will deliver at
            </span>

            <input
              value={
                finderDraft.willDeliverAt
              }
              onChange={(
                event,
              ) =>
                setFinderDraft(
                  {
                    ...finderDraft,
                    willDeliverAt:
                      event.target.value,
                  },
                )
              }
              placeholder="e.g. front office"
              maxLength={
                120
              }
            />
          </label>

          <label>
            <span>
              Message
            </span>

            <textarea
              value={
                finderDraft.message
              }
              onChange={(
                event,
              ) =>
                setFinderDraft(
                  {
                    ...finderDraft,
                    message:
                      event.target.value,
                  },
                )
              }
              placeholder="Optional note for the owner"
              maxLength={
                300
              }
              rows={
                3
              }
            />
          </label>

          <div className="safety-resource__actions">
            <button
              type="button"
              onClick={
                saveFinder
              }
              disabled={
                savingFinder
              }
            >
              {
                savingFinder
                  ? "Saving…"
                  : "Save"
              }
            </button>

            <button
              type="button"
              className="safety-resource__button--secondary"
              onClick={() =>
                void openChat(
                  "FINDER",
                )
              }
            >
              💬 Chat
            </button>
          </div>
        </section>
      </div>

      <div className="safety-resource__support-strip">
        <span>
          GYAN Support
        </span>

        <button
          type="button"
          className="safety-resource__button--secondary"
          onClick={() =>
            void requestSupport()
          }
          disabled={
            requestingSupport ||
            profile.supportRequested
          }
        >
          {
            profile.supportRequested
              ? "✓ Invited"
              : requestingSupport
                ? "Inviting…"
                : "Invite to chat"
          }
        </button>

        <small>
          Support joins only if needed.
        </small>
      </div>

      {
        status && (
          <div className="safety-resource__status">
            {
              status
            }
          </div>
        )
      }

      {
        chatOpen && (
          <section className="safety-resource__chat">
            <div className="safety-resource__chat-head">
              <strong>
                GYAN Chat
              </strong>

              <span>
                {
                  chatRole ===
                    "OWNER"
                    ? `Owner · ${displayName}`
                    : "Finder"
                }
              </span>

              <button
                type="button"
                onClick={() =>
                  setChatOpen(
                    false,
                  )
                }
                aria-label="Close chat"
              >
                ×
              </button>
            </div>

            <div className="safety-resource__chat-messages">
              {
                chatLoading ? (
                  <small>
                    Loading chat…
                  </small>
                ) : chatMessages.length ===
                    0 ? (
                  <small>
                    No messages yet.
                  </small>
                ) : (
                  chatMessages.map(
                    (
                      message,
                    ) => (
                      <div
                        key={
                          message.id
                        }
                        className={`safety-resource__chat-message safety-resource__chat-message--${message.senderRole.toLowerCase()}`}
                      >
                        <strong>
                          {
                            message.senderRole ===
                              "OWNER"
                              ? displayName
                              : message.senderRole ===
                                  "SUPPORT"
                                ? "GYAN Support"
                                : "Finder"
                          }
                        </strong>

                        <span>
                          {
                            message.message
                          }
                        </span>
                      </div>
                    ),
                  )
                )
              }
            </div>

            <div className="safety-resource__chat-compose">
              <textarea
                value={
                  chatDraft
                }
                onChange={(
                  event,
                ) =>
                  setChatDraft(
                    event.target.value,
                  )
                }
                placeholder="Write a message…"
                rows={
                  2
                }
                maxLength={
                  500
                }
              />

              <button
                type="button"
                onClick={
                  sendChat
                }
                disabled={
                  chatSending ||
                  !chatDraft.trim()
                }
              >
                {
                  chatSending
                    ? "…"
                    : "Send"
                }
              </button>
            </div>
          </section>
        )
      }
    </>
  );
}


export default function SafetyResourceLandingPage({
  token,
  onBack,
}: {
  token: string;
  onBack: () => void;
}) {
  const [
    resource,
    setResource,
  ] =
    useState<
      SafetyResource |
      null
    >(
      null,
    );

  const [
    loading,
    setLoading,
  ] =
    useState(
      true,
    );

  const [
    error,
    setError,
  ] =
    useState(
      "",
    );

  const [
    helpDetail,
    setHelpDetail,
  ] =
    useState<
      "DISPLAY_NAME" |
      "ACCESS_CODE" |
      "EMAIL" |
      "ACCOUNT" |
      "LOST_FOUND" |
      "CERTIFICATE" |
      "EMERGENCY" |
      null
    >(
      null,
    );


  const [
    helpAccessCode,
    setHelpAccessCode,
  ] =
    useState(
      "",
    );

  const [
    helpEmail,
    setHelpEmail,
  ] =
    useState(
      "",
    );

  const [
    helpEmailSaving,
    setHelpEmailSaving,
  ] =
    useState(
      false,
    );

  const [
    helpEmailStatus,
    setHelpEmailStatus,
  ] =
    useState(
      "",
    );


  useEffect(
    () => {
      const controller =
        new AbortController();

      void fetch(
        `/api/safety-resources/${encodeURIComponent(
          token,
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
              await response.json() as
                SafetyResource & {
                  error?: string;
                };

            if (
              !response.ok
            ) {
              throw new Error(
                body.error ??
                "This GYAN card could not be opened.",
              );
            }

            return body;
          },
        )
        .then(
          (
            body,
          ) => {
            if (
              !controller.signal.aborted
            ) {
              setResource(
                body,
              );
            }
          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              caught instanceof DOMException &&
              caught.name ===
                "AbortError"
            ) {
              return;
            }

            setError(
              caught instanceof Error
                ? caught.message
                : "This GYAN card could not be opened.",
            );
          },
        )
        .finally(
          () => {
            if (
              !controller.signal.aborted
            ) {
              setLoading(
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
      token,
    ],
  );


  async function saveRecoveryEmail() {
    const accessCode =
      helpAccessCode
        .trim();

    const email =
      helpEmail
        .trim()
        .toLowerCase();

    if (
      !accessCode ||
      !email
    ) {
      setHelpEmailStatus(
        "Enter your Access Code and email.",
      );

      return;
    }

    setHelpEmailSaving(
      true,
    );

    setHelpEmailStatus(
      "",
    );

    try {
      const response =
        await fetch(
          `/api/safety-resources/${encodeURIComponent(
            token,
          )}/help/email`,
          {
            method:
              "POST",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                accessCode,
                email,
              }),
          },
        );

      const body =
        await response.json() as {
          stored?: boolean;
          verificationSent?: boolean;
          maskedEmail?: string;
          error?: string;
        };

      if (
        !response.ok ||
        !body.stored
      ) {
        throw new Error(
          body.error ??
            "Email could not be saved.",
        );
      }

      setResource(
        (current) =>
          current
            ? {
                ...current,

                recoveryEmailStored:
                  true,

                recoveryEmailVerified:
                  false,

                maskedRecoveryEmail:
                  body.maskedEmail ??
                  "",
              }
            : current,
      );

      setHelpAccessCode(
        "",
      );

      setHelpEmail(
        "",
      );

      setHelpEmailStatus(
        body.verificationSent
          ? "✓ Email saved. Check your inbox to verify it. It cannot be used for recovery until verified."
          : "✓ Email saved as unverified. It cannot be used for recovery or authentication until verified.",
      );
    } catch (
      caught
    ) {
      setHelpEmailStatus(
        caught instanceof Error
          ? caught.message
          : "Email could not be saved.",
      );
    } finally {
      setHelpEmailSaving(
        false,
      );
    }
  }


  if (
    !loading &&
    !error &&
    resource?.type ===
      "MESSAGE"
  ) {
    return (
      <GWinkPage
        token={
          token
        }
        displayName={
          resource.displayName
        }
        onBack={
          onBack
        }
      />
    );
  }


  return (
    <main className="safety-resource">
      <section className="safety-resource__card">
        <header className="safety-resource__topbar">
          <div className="safety-resource__brandline">
            <strong>
              GYAN
            </strong>

            <span aria-hidden="true">
              ·
            </span>

            <span className="safety-resource__title-inline">
              {
                resource
                  ? titleFor(
                      resource.type,
                    )
                  : "Safety Card"
              }
            </span>
          </div>

          <button
            type="button"
            onClick={
              onBack
            }
            aria-label="Close"
          >
            ×
          </button>
        </header>

        {
          loading ? (
            <p>
              Opening GYAN card…
            </p>
          ) : error ? (
            <p className="safety-resource__error">
              {
                error
              }
            </p>
          ) : resource ? (
            <>
              <div className="safety-resource__alias safety-resource__alias--compact">
                Known as{" "}
                <strong>
                  {
                    resource.displayName
                  }
                </strong>
              </div>

              <div className="safety-resource__privacy-line">
                {
                  resource.type ===
                    "MESSAGE"
                    ? "Semi-private G-Wink · your message stays behind the QR"
                    : resource.type ===
                        "EMERGENCY"
                      ? "Owner-approved emergency information · Access Code required to edit"
                      : resource.type ===
                          "CERTIFICATE"
                        ? "Shareable certificate card · private learning history is not exposed"
                        : resource.type ===
                            "HELP"
                          ? "Account-specific guide · private credentials are not exposed"
                          : "Private return card · no phone or email exposed"
                }
              </div>

              {
                resource.type !==
                  "MESSAGE" &&
                resource.type !==
                  "LOST_FOUND" &&
                resource.type !==
                  "CERTIFICATE" &&
                resource.type !==
                  "HELP" && (
                  <p
                    className={
                      resource.type ===
                        "EMERGENCY"
                        ? "safety-resource__intro safety-resource__intro--emergency"
                        : "safety-resource__intro"
                    }
                  >
                    {
                      messageFor(
                        resource.type,
                      )
                    }
                  </p>
                )
              }

              {
                resource.type ===
                  "HELP" && (
                  <>
                    <div className="safety-resource__help-section-title">
                      YOUR GYAN
                    </div>

                    <div className="safety-resource__help-cards">
                      <button
                        type="button"
                        onClick={() =>
                          setHelpDetail(
                            "DISPLAY_NAME",
                          )
                        }
                      >
                        <span>
                          Display Name
                        </span>

                        <strong>
                          {
                            resource.displayName
                          }
                        </strong>

                        <small>
                          Your unique public GYAN name
                        </small>
                      </button>

                      <button
                        type="button"
                        onClick={() =>
                          setHelpDetail(
                            "ACCESS_CODE",
                          )
                        }
                      >
                        <span>
                          Access Code
                        </span>

                        <strong>
                          Private
                        </strong>

                        <small>
                          Used for owner edits
                        </small>
                      </button>

                      <button
                        type="button"
                        className={
                          resource.recoveryEmailVerified
                            ? ""
                            : "safety-resource__help-card--next"
                        }
                        onClick={() =>
                          setHelpDetail(
                            "EMAIL",
                          )
                        }
                      >
                        <span>
                          {
                            resource.recoveryEmailVerified
                              ? "Recovery"
                              : resource.recoveryEmailStored
                                ? "Next Step"
                                : "Next Step"
                          }
                        </span>

                        <strong>
                          {
                            resource.recoveryEmailVerified
                              ? "✓ Email Verified"
                              : resource.recoveryEmailStored
                                ? "Verify Email"
                                : "Add Email"
                          }
                        </strong>

                        <small>
                          {
                            resource.recoveryEmailVerified
                              ? resource.maskedRecoveryEmail ||
                                "Recovery enabled"
                              : resource.recoveryEmailStored
                                ? `${resource.maskedRecoveryEmail || "Email saved"} · not usable yet`
                                : "Recover access if code is lost"
                          }
                        </small>
                      </button>
                    </div>

                    <div className="safety-resource__help-section-title">
                      YOUR GYAN CARDS
                    </div>

                    <div className="safety-resource__help-qr-cards">
                      {
                        [
                          {
                            type:
                              "ACCOUNT" as const,

                            label:
                              "ACCOUNT",

                            url:
                              resource.accountUrl ??
                              "",
                          },

                          ...(
                            resource.safetyCards ??
                            []
                          )
                            .filter(
                              (
                                card,
                              ) =>
                                card.type !==
                                  "HELP",
                            )
                            .sort(
                              (
                                first,
                                second,
                              ) => {
                                const order:
                                  Record<
                                    string,
                                    number
                                  > = {
                                    LOST_FOUND:
                                      1,
                                    CERTIFICATE:
                                      2,
                                    EMERGENCY:
                                      3,
                                  };

                                return (
                                  order[
                                    first.type
                                  ] ??
                                  99
                                ) -
                                (
                                  order[
                                    second.type
                                  ] ??
                                  99
                                );
                              },
                            )
                            .map(
                              (
                                card,
                              ) => ({
                                type:
                                  card.type,

                                label:
                                  card.type ===
                                    "LOST_FOUND"
                                    ? "LOST & FOUND"
                                    : card.type,

                                url:
                                  card.publicUrl,
                              }),
                            ),
                        ]
                          .filter(
                            (
                              card,
                            ) =>
                              Boolean(
                                card.url,
                              ),
                          )
                          .map(
                            (
                              card,
                            ) => (
                              <button
                                key={
                                  card.type
                                }
                                type="button"
                                onClick={() =>
                                  setHelpDetail(
                                    card.type as
                                      | "ACCOUNT"
                                      | "LOST_FOUND"
                                      | "CERTIFICATE"
                                      | "EMERGENCY",
                                  )
                                }
                              >
                                <QRCodeSVG
                                  value={
                                    card.url
                                  }
                                  size={
                                    56
                                  }
                                  level="M"
                                  includeMargin
                                />

                                <strong>
                                  {
                                    card.label
                                  }
                                </strong>

                                <small>
                                  {
                                    card.url.replace(
                                      /^https?:\/\//,
                                      "",
                                    )
                                  }
                                </small>
                              </button>
                            ),
                          )
                      }
                    </div>

                    {
                      helpDetail && (
                        <div
                          className="safety-resource__help-modal-backdrop"
                          role="presentation"
                          onClick={() =>
                            setHelpDetail(
                              null,
                            )
                          }
                        >
                          <section
                            className="safety-resource__help-modal"
                            role="dialog"
                            aria-modal="true"
                            aria-label="GYAN Help"
                            onClick={(
                              event,
                            ) =>
                              event.stopPropagation()
                            }
                          >
                            <button
                              type="button"
                              className="safety-resource__help-modal-close"
                              onClick={() =>
                                setHelpDetail(
                                  null,
                                )
                              }
                              aria-label="Close"
                            >
                              ×
                            </button>

                            {
                              helpDetail ===
                                "DISPLAY_NAME" && (
                                <>
                                  <h2>
                                    Display Name
                                  </h2>

                                  <strong>
                                    {
                                      resource.displayName
                                    }
                                  </strong>

                                  <p>
                                    Your unique public GYAN name lets your cards use a recognizable identity without displaying your real name, email or phone number.
                                  </p>
                                </>
                              )
                            }

                            {
                              helpDetail ===
                                "ACCESS_CODE" && (
                                <>
                                  <h2>
                                    Access Code
                                  </h2>

                                  <strong>
                                    Keep it private
                                  </strong>

                                  <p>
                                    Your Access Code is the private key used to edit owner-controlled GYAN information such as Lost &amp; Found and Emergency details.
                                  </p>

                                  <p>
                                    It is not displayed on this public Help card. A verified recovery email can later help if the code is lost.
                                  </p>
                                </>
                              )
                            }

                            {
                              helpDetail ===
                                "EMAIL" && (
                                <>
                                  <h2>
                                    Recovery Email
                                  </h2>

                                  {
                                    resource.recoveryEmailVerified ? (
                                      <>
                                        <strong>
                                          ✓ Email verified
                                        </strong>

                                        <p>
                                          {
                                            resource.maskedRecoveryEmail ||
                                            "A verified recovery email is linked."
                                          }
                                        </p>

                                        <p>
                                          This verified address may be used for future Access Code recovery. It remains private on public GYAN cards.
                                        </p>
                                      </>
                                    ) : (
                                      <>
                                        {
                                          resource.recoveryEmailStored && (
                                            <p>
                                              <strong>
                                                Email saved but not verified: {
                                                  resource.maskedRecoveryEmail ||
                                                  "stored email"
                                                }
                                              </strong>
                                              <br />
                                              It is stored for convenience but cannot be used for authentication or Access Code recovery until verified.
                                            </p>
                                          )
                                        }

                                        <p>
                                          Add or resend an email using your Access Code. GYAN stores the address immediately, then sends a verification link when email delivery is available.
                                        </p>

                                        <label className="safety-resource__help-email-field">
                                          <span>
                                            Access Code
                                          </span>

                                          <input
                                            type="password"
                                            value={
                                              helpAccessCode
                                            }
                                            onChange={(
                                              event,
                                            ) =>
                                              setHelpAccessCode(
                                                event.target.value,
                                              )
                                            }
                                            placeholder="ABCDE-FGHIJ"
                                            autoComplete="off"
                                          />
                                        </label>

                                        <label className="safety-resource__help-email-field">
                                          <span>
                                            Email
                                          </span>

                                          <input
                                            type="email"
                                            value={
                                              helpEmail
                                            }
                                            onChange={(
                                              event,
                                            ) =>
                                              setHelpEmail(
                                                event.target.value,
                                              )
                                            }
                                            placeholder="you@example.com"
                                            autoComplete="email"
                                          />
                                        </label>

                                        <button
                                          type="button"
                                          className="safety-resource__help-email-button"
                                          disabled={
                                            helpEmailSaving
                                          }
                                          onClick={() =>
                                            void saveRecoveryEmail()
                                          }
                                        >
                                          {
                                            helpEmailSaving
                                              ? "Saving…"
                                              : resource.recoveryEmailStored
                                                ? "Save / Resend Verification"
                                                : "Save Email & Verify"
                                          }
                                        </button>

                                        {
                                          helpEmailStatus && (
                                            <small className="safety-resource__help-email-status">
                                              {
                                                helpEmailStatus
                                              }
                                            </small>
                                          )
                                        }

                                        <p>
                                          Your email is private and is never shown in full on public GYAN cards.
                                        </p>
                                      </>
                                    )
                                  }
                                </>
                              )
                            }

                            {
                              helpDetail ===
                                "ACCOUNT" && (
                                <>
                                  <h2>
                                    Account
                                  </h2>
                                  <p>
                                    Your main GYAN account link and entry point to your GYAN identity and resources.
                                  </p>
                                </>
                              )
                            }

                            {
                              helpDetail ===
                                "LOST_FOUND" && (
                                <>
                                  <h2>
                                    Lost &amp; Found
                                  </h2>
                                  <p>
                                    A finder can leave return details or a message without needing your private email or phone number. Owner edits require the Access Code.
                                  </p>
                                </>
                              )
                            }

                            {
                              helpDetail ===
                                "CERTIFICATE" && (
                                <>
                                  <h2>
                                    Certificate
                                  </h2>
                                  <p>
                                    Shows only certificates or achievements the Account Owner chooses to share. Private learning history stays private.
                                  </p>
                                </>
                              )
                            }

                            {
                              helpDetail ===
                                "EMERGENCY" && (
                                <>
                                  <h2>
                                    Emergency
                                  </h2>
                                  <p>
                                    Shows owner-approved emergency information. A scanner may leave a private message; owner edits and private message access require the Access Code.
                                  </p>
                                </>
                              )
                            }
                          </section>
                        </div>
                      )
                    }
                  </>
                )
              }

              {
                resource.type ===
                  "CERTIFICATE" && (
                  <section className="safety-resource__certificate-empty">
                    <strong>
                      Nothing shared by Account Owner
                    </strong>

                    <small>
                      The Account Owner has not shared a certificate or other public achievement here yet.
                    </small>
                  </section>
                )
              }

              {
                resource.type ===
                  "LOST_FOUND" ? (
                  <LostFoundPanel
                    token={
                      token
                    }
                    displayName={
                      resource.displayName
                    }
                    initial={
                      resource.lostFound ?? {
                        ownerDeliverAt:
                          "",
                        ownerContact:
                          "",
                        ownerMessage:
                          "",
                        finderFoundAt:
                          "",
                        finderWillDeliverAt:
                          "",
                        finderMessage:
                          "",

                        supportRequested:
                          false,
                      }
                    }
                  />
                ) : null
              }

              {
                resource.type ===
                  "EMERGENCY" ? (
                  <EmergencyPanel
                    token={
                      token
                    }
                    initial={
                      resource.emergency ?? {
                        emergencyMessage:
                          "",

                        primaryContact:
                          "",

                        secondaryContact:
                          "",

                        medicalNotes:
                          "",

                        meetingPlace:
                          "",
                      }
                    }
                  />
                ) : null
              }

              {
                resource.type !==
                  "MESSAGE" &&
                resource.type !==
                  "CERTIFICATE" && (
                  <small>
                    No parent GYAN code, phone number or email is exposed by this public card.
                  </small>
                )
              }
            </>
          ) : null
        }
      </section>
    </main>
  );
}
