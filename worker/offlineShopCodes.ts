export interface OfflineShopCodeRow {
  code: string;
  status: "reserved" | "claimed";
  batch_code: string;
  claimed_shop_code: string | null;
  created_at: string;
  claimed_at: string | null;
}

export function isOfflineReservedNamespace(code: string): boolean {
  return code.length === 4 && code[2] === "R";
}

export async function getOfflineShopCode(
  env: { gyan_registry: D1Database },
  code: string,
): Promise<OfflineShopCodeRow | null> {
  if (!isOfflineReservedNamespace(code)) return null;
  return env.gyan_registry.prepare(`
    SELECT code,status,batch_code,claimed_shop_code,created_at,claimed_at
    FROM offline_shop_codes
    WHERE code=?
    LIMIT 1
  `).bind(code).first<OfflineShopCodeRow>();
}

export async function assertShopCodeCanRegister(
  env: { gyan_registry: D1Database },
  code: string,
): Promise<{kind:"online"}|{kind:"offline";row:OfflineShopCodeRow}> {
  if (!isOfflineReservedNamespace(code)) return {kind:"online"};

  const row = await getOfflineShopCode(env, code);
  if (!row) throw new Error("RESERVED_CODE_NOT_ISSUED");
  if (row.status !== "reserved") throw new Error("RESERVED_CODE_ALREADY_CLAIMED");

  return {kind:"offline", row};
}

export async function markOfflineShopCodeClaimed(
  env: { gyan_registry: D1Database },
  code: string,
): Promise<void> {
  const result = await env.gyan_registry.prepare(`
    UPDATE offline_shop_codes
    SET status='claimed',
        claimed_shop_code=?,
        claimed_at=CURRENT_TIMESTAMP
    WHERE code=? AND status='reserved'
  `).bind(code,code).run();

  if (Number(result.meta.changes ?? 0) !== 1) {
    throw new Error("RESERVED_CODE_CLAIM_FAILED");
  }
}
