interface Env {
  gyan_registry: D1Database;

  GYAN_PRINT_FILES: R2Bucket;

  ASSETS: Fetcher;

  GYAN_ADMIN_PASSWORD: string;
  ADMIN_AUTH_PEPPER: string;
  RESEND_API_KEY: string;

  SHOP_LINK_SIGNING_SECRET: string;
}