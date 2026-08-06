export type MagicLinkScope =
  | "request:read"
  | "file:read"
  | "shop-requests:read";

export interface MagicLinkPayload {
  scope: MagicLinkScope;

  shopCode: string;

  requestNumber?: string;
  fileId?: number;

  recipient:
    | "shop"
    | "customer";

  issuedAt: number;
  expiresAt: number;
}

export interface VerifiedMagicLink {
  valid: boolean;
  payload?: MagicLinkPayload;
  error?: string;
}

const TOKEN_VERSION = "v1";

const TEXT_ENCODER =
  new TextEncoder();

function encodeBase64Url(
  bytes: Uint8Array,
): string {
  let binary = "";

  for (const byte of bytes) {
    binary += String.fromCharCode(
      byte,
    );
  }

  return btoa(binary)
    .replaceAll("+", "-")
    .replaceAll("/", "_")
    .replaceAll("=", "");
}

function decodeBase64Url(
  value: string,
): Uint8Array | null {
  try {
    const base64 =
      value
        .replaceAll("-", "+")
        .replaceAll("_", "/")
        .padEnd(
          Math.ceil(value.length / 4) *
            4,
          "=",
        );

    const binary =
      atob(base64);

    const bytes =
      new Uint8Array(
        binary.length,
      );

    for (
      let index = 0;
      index < binary.length;
      index += 1
    ) {
      bytes[index] =
        binary.charCodeAt(index);
    }

    return bytes;
  } catch {
    return null;
  }
}

function encodeJson(
  value: unknown,
): string {
  return encodeBase64Url(
    TEXT_ENCODER.encode(
      JSON.stringify(value),
    ),
  );
}

function decodeJson(
  value: string,
): unknown {
  const bytes =
    decodeBase64Url(value);

  if (!bytes) {
    return null;
  }

  try {
    return JSON.parse(
      new TextDecoder().decode(
        bytes,
      ),
    );
  } catch {
    return null;
  }
}

async function importSigningKey(
  secret: string,
): Promise<CryptoKey> {
  return crypto.subtle.importKey(
    "raw",
    TEXT_ENCODER.encode(secret),
    {
      name: "HMAC",
      hash: "SHA-256",
    },
    false,
    [
      "sign",
      "verify",
    ],
  );
}

async function createSignature(
  value: string,
  secret: string,
): Promise<string> {
  const key =
    await importSigningKey(
      secret,
    );

  const signature =
    await crypto.subtle.sign(
      "HMAC",
      key,
      TEXT_ENCODER.encode(value),
    );

  return encodeBase64Url(
    new Uint8Array(signature),
  );
}

async function verifySignature(
  value: string,
  signature: string,
  secret: string,
): Promise<boolean> {
  const signatureBytes =
    decodeBase64Url(signature);

  if (!signatureBytes) {
    return false;
  }

  const key =
    await importSigningKey(
      secret,
    );

  return crypto.subtle.verify(
    "HMAC",
    key,
    signatureBytes,
    TEXT_ENCODER.encode(value),
  );
}

function isMagicLinkScope(
  value: unknown,
): value is MagicLinkScope {
  return (
    value === "request:read" ||
    value === "file:read" ||
    value === "shop-requests:read"
  );
}

function isRecipient(
  value: unknown,
): value is
  | "shop"
  | "customer" {
  return (
    value === "shop" ||
    value === "customer"
  );
}

function normalizePayload(
  value: unknown,
): MagicLinkPayload | null {
  if (
    typeof value !== "object" ||
    value === null ||
    Array.isArray(value)
  ) {
    return null;
  }

  const candidate =
    value as Partial<
      MagicLinkPayload
    >;

  if (
    !isMagicLinkScope(
      candidate.scope,
    ) ||
    !isRecipient(
      candidate.recipient,
    ) ||
    typeof candidate.shopCode !==
      "string" ||
    !/^[A-Z0-9]{4}$/.test(
      candidate.shopCode,
    ) ||
    typeof candidate.issuedAt !==
      "number" ||
    !Number.isInteger(
      candidate.issuedAt,
    ) ||
    typeof candidate.expiresAt !==
      "number" ||
    !Number.isInteger(
      candidate.expiresAt,
    )
  ) {
    return null;
  }

  if (
    candidate.scope ===
      "request:read" &&
    (
      typeof candidate.requestNumber !==
        "string" ||
      !candidate.requestNumber
    )
  ) {
    return null;
  }

  if (
    candidate.scope ===
      "file:read" &&
    (
      typeof candidate.requestNumber !==
        "string" ||
      !candidate.requestNumber ||
      typeof candidate.fileId !==
        "number" ||
      !Number.isInteger(
        candidate.fileId,
      ) ||
      candidate.fileId <= 0
    )
  ) {
    return null;
  }

  return {
    scope:
      candidate.scope,

    shopCode:
      candidate.shopCode,

    requestNumber:
      candidate.requestNumber,

    fileId:
      candidate.fileId,

    recipient:
      candidate.recipient,

    issuedAt:
      candidate.issuedAt,

    expiresAt:
      candidate.expiresAt,
  };
}

export function calculateMagicLinkExpiration(
  createdAt: string,
  retentionDays = 15,
): number {
  const createdDate =
    new Date(createdAt);

  if (
    Number.isNaN(
      createdDate.getTime(),
    )
  ) {
    throw new Error(
      "Request creation date is invalid.",
    );
  }

  return Math.floor(
    (
      createdDate.getTime() +
      retentionDays *
        24 *
        60 *
        60 *
        1000
    ) / 1000,
  );
}

export async function createMagicLinkToken(
  env: Env,
  payload: MagicLinkPayload,
): Promise<string> {
  if (
    !env.SHOP_LINK_SIGNING_SECRET
  ) {
    throw new Error(
      "SHOP_LINK_SIGNING_SECRET is not configured.",
    );
  }

  const encodedPayload =
    encodeJson(payload);

  const signedValue =
    `${TOKEN_VERSION}.${encodedPayload}`;

  const signature =
    await createSignature(
      signedValue,
      env.SHOP_LINK_SIGNING_SECRET,
    );

  return [
    TOKEN_VERSION,
    encodedPayload,
    signature,
  ].join(".");
}

export async function verifyMagicLinkToken(
  env: Env,
  token: string,
): Promise<VerifiedMagicLink> {
  if (
    !env.SHOP_LINK_SIGNING_SECRET
  ) {
    return {
      valid: false,
      error:
        "Magic-link signing is not configured.",
    };
  }

  const parts =
    token.split(".");

  if (
    parts.length !== 3
  ) {
    return {
      valid: false,
      error:
        "The access link is invalid.",
    };
  }

  const [
    version,
    encodedPayload,
    signature,
  ] = parts;

  if (
    version !== TOKEN_VERSION
  ) {
    return {
      valid: false,
      error:
        "The access-link version is not supported.",
    };
  }

  const signedValue =
    `${version}.${encodedPayload}`;

  const validSignature =
    await verifySignature(
      signedValue,
      signature,
      env.SHOP_LINK_SIGNING_SECRET,
    );

  if (!validSignature) {
    return {
      valid: false,
      error:
        "The access-link signature is invalid.",
    };
  }

  const payload =
    normalizePayload(
      decodeJson(
        encodedPayload,
      ),
    );

  if (!payload) {
    return {
      valid: false,
      error:
        "The access-link contents are invalid.",
    };
  }

  const currentTime =
    Math.floor(
      Date.now() / 1000,
    );

  if (
    payload.expiresAt <=
    currentTime
  ) {
    return {
      valid: false,
      error:
        "This access link has expired.",
    };
  }

  if (
    payload.issuedAt >
    currentTime + 300
  ) {
    return {
      valid: false,
      error:
        "The access link is not yet valid.",
    };
  }

  return {
    valid: true,
    payload,
  };
}

export function createMagicLinkUrl(
  origin: string,
  pathname: string,
  token: string,
): string {
  const url =
    new URL(
      pathname,
      origin,
    );

  url.searchParams.set(
    "token",
    token,
  );

  return url.toString();
}