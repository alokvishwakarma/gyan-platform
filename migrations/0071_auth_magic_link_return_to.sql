-- 0071_auth_magic_link_return_to.sql
-- Persist the destination with the magic link so verification cannot
-- accidentally fall back to the home/puzzle page.

ALTER TABLE auth_magic_links
  ADD COLUMN return_to TEXT;

CREATE INDEX IF NOT EXISTS idx_auth_magic_links_email_return_to
  ON auth_magic_links(
    email,
    return_to,
    used_at,
    created_at
  );
