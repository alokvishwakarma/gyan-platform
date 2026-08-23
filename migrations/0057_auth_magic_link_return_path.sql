-- 0057_auth_magic_link_return_path.sql
-- Allows magic-link sign-in to return to the scanned GYAN calendar URL.

ALTER TABLE auth_magic_links
ADD COLUMN return_path TEXT;
