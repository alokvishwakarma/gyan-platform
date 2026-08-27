/*
worker/gyanIdentity.ts — integration-safe skeleton.

Core contract:
- ABCD is public and NEVER authenticates.
- localStorage remembers ABCD for UI continuity.
- HttpOnly gyan_anon cookie carries a long random secret.
- authenticated email account overrides anonymous browser identity.
- when merging, old ABCD becomes an alias so printed QR links keep working.

Wire this file to your CURRENT auth/session and CURRENT account tables before
enabling it. The exact auth resolver is intentionally not guessed here.
*/

export const GYAN_ANON_COOKIE = "gyan_anon";
export const GYAN_CODE_ALPHABET =
  "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";

export function randomGyanCode(length = 4): string {
  const bytes = crypto.getRandomValues(new Uint8Array(length));

  return Array.from(
    bytes,
    (value) =>
      GYAN_CODE_ALPHABET[
        value % GYAN_CODE_ALPHABET.length
      ],
  ).join("");
}

export function randomGyanSecret(): string {
  const bytes = crypto.getRandomValues(new Uint8Array(24));

  return Array.from(
    bytes,
    (value) => value.toString(16).padStart(2, "0"),
  ).join("");
}

export async function sha256(value: string): Promise<string> {
  const digest = await crypto.subtle.digest(
    "SHA-256",
    new TextEncoder().encode(value),
  );

  return Array.from(
    new Uint8Array(digest),
    (byte) => byte.toString(16).padStart(2, "0"),
  ).join("");
}

/*
Required POST /api/gyan-identity behavior:

1. Resolve current authenticated email/session FIRST.
2. If authenticated:
   a. If email already has GYAN WXYZ:
      merge current anonymous account into WXYZ transactionally.
      INSERT old ABCD into gyan_account_aliases -> WXYZ account_id.
      Reassign Puzzle/Education/Safety ownership to WXYZ.
      Return WXYZ.
   b. If email has no GYAN:
      upgrade current anonymous ABCD in place.
      Do NOT generate WXYZ merely because login occurred.
3. Else resolve gyan_anon HttpOnly cookie.
4. Valid cookie -> return same anonymous ABCD.
5. No valid cookie -> create one anonymous account + one cookie.
6. localStorage browserCode is a public resume hint only; never use it to
   authorize owner edits.

GET /api/gyan-identity/me:
- never creates an account;
- returns current resolved identity;
- may include Access Code only for an authenticated/owner-authorized session.

Recommended cookie:
Set-Cookie: gyan_anon=<secret>; Path=/; HttpOnly; Secure; SameSite=Lax;
            Max-Age=31536000
*/
