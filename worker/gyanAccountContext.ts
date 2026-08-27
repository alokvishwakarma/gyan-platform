
function cookieValue(
  request: Request,
  name: string,
): string | null {
  const cookie =
    request.headers.get(
      "cookie",
    ) ?? "";

  for (
    const part
    of cookie.split(";")
  ) {
    const [
      rawName,
      ...rawValue
    ] =
      part
        .trim()
        .split("=");

    if (
      rawName ===
        name
    ) {
      return decodeURIComponent(
        rawValue.join("="),
      );
    }
  }

  return null;
}


async function sha256(
  value: string,
): Promise<string> {
  const bytes =
    new TextEncoder()
      .encode(
        value,
      );

  const digest =
    await crypto.subtle.digest(
      "SHA-256",
      bytes,
    );

  return Array.from(
    new Uint8Array(
      digest,
    ),
  )
    .map(
      (
        byte,
      ) =>
        byte
          .toString(16)
          .padStart(
            2,
            "0",
          ),
    )
    .join("");
}


export async function currentGyanAccount(
  request: Request,
  db: D1Database,
): Promise<{
  id: number;
  code: string;
  displayName: string;
  email: string | null;
} | null> {
  const secret =
    cookieValue(
      request,
      "gyan_anon",
    );

  if (!secret) {
    return null;
  }

  const secretHash =
    await sha256(
      secret,
    );

  return db
    .prepare(
      `
      SELECT
        ga.id,
        ga.code,
        ga.display_name AS displayName,
        ga.email
      FROM gyan_browser_sessions gbs
      INNER JOIN gyan_accounts ga
        ON ga.id =
          gbs.account_id
      WHERE
        gbs.secret_hash = ?
      LIMIT 1
      `,
    )
    .bind(
      secretHash,
    )
    .first<{
      id: number;
      code: string;
      displayName: string;
      email: string | null;
    }>();
}


export async function currentGyanAccountId(
  request: Request,
  db: D1Database,
): Promise<number | null> {
  const account =
    await currentGyanAccount(
      request,
      db,
    );

  return account?.id ??
    null;
}
