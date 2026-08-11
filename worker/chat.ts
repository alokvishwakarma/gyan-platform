interface ChatUser {
  id: number;
  email: string;
}

interface RequestRow {
  id: number;
  request_number: string;
  shop_code: string;
  email_address: string | null;
  status: string;
  created_at: string;
  service_name: string;
  shop_name: string;
}

interface ThreadRow {
  id: number;
  request_id: number;
  customer_user_id: number | null;
  shop_code: string;
  status: string;
  created_at: string;
  updated_at: string;
}

interface MessageRow {
  id: number;
  sender_type: string;
  sender_user_id: number | null;
  sender_shop_code: string | null;
  message: string;
  created_at: string;
}

const SESSION_COOKIE =
  "gyan_session";

const MAX_MESSAGE_LENGTH =
  2000;

function jsonResponse(
  data: unknown,
  status = 200,
): Response {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type":
          "application/json; charset=utf-8",
        "cache-control":
          "no-store",
      },
    },
  );
}

function cookieValue(
  request: Request,
  name: string,
): string | null {
  const cookie =
    request.headers.get(
      "cookie",
    );

  if (!cookie) {
    return null;
  }

  for (
    const item
    of cookie.split(";")
  ) {
    const [
      key,
      ...rest
    ] =
      item
        .trim()
        .split("=");

    if (key === name) {
      return decodeURIComponent(
        rest.join("="),
      );
    }
  }

  return null;
}

function bytesToHex(
  bytes: Uint8Array,
): string {
  return Array
    .from(bytes)
    .map(
      (value) =>
        value
          .toString(16)
          .padStart(2, "0"),
    )
    .join("");
}

async function sha256(
  value: string,
): Promise<string> {
  const digest =
    await crypto.subtle.digest(
      "SHA-256",
      new TextEncoder()
        .encode(value),
    );

  return bytesToHex(
    new Uint8Array(
      digest,
    ),
  );
}

async function currentUser(
  request: Request,
  env: Env,
): Promise<ChatUser | null> {
  const token =
    cookieValue(
      request,
      SESSION_COOKIE,
    );

  if (!token) {
    return null;
  }

  const hash =
    await sha256(token);

  return env.gyan_registry
    .prepare(
      `
      SELECT
        users.id,
        users.email
      FROM user_sessions
      INNER JOIN users
        ON users.id =
           user_sessions.user_id
      WHERE
        user_sessions.token_hash = ?
        AND user_sessions.expires_at >
            CURRENT_TIMESTAMP
      LIMIT 1
      `,
    )
    .bind(hash)
    .first<ChatUser>();
}

async function loadOwnedRequest(
  env: Env,
  user: ChatUser,
  requestNumber: string,
): Promise<RequestRow | null> {
  return env.gyan_registry
    .prepare(
      `
      SELECT
        sr.id,
        sr.request_number,
        sr.shop_code,
        sr.email_address,
        sr.status,
        sr.created_at,
        s.name AS service_name,
        sh.name AS shop_name
      FROM service_requests sr
      INNER JOIN services s
        ON s.id = sr.service_id
      INNER JOIN shops sh
        ON sh.code = sr.shop_code
      WHERE
        sr.request_number = ?
        AND lower(
          COALESCE(
            sr.email_address,
            ''
          )
        ) = lower(?)
      LIMIT 1
      `,
    )
    .bind(
      requestNumber,
      user.email,
    )
    .first<RequestRow>();
}

async function ensureThread(
  env: Env,
  user: ChatUser,
  serviceRequest: RequestRow,
): Promise<ThreadRow> {
  await env.gyan_registry
    .prepare(
      `
      INSERT INTO chat_threads (
        request_id,
        customer_user_id,
        shop_code
      )
      VALUES (?, ?, ?)
      ON CONFLICT(request_id)
      DO UPDATE SET
        customer_user_id =
          COALESCE(
            chat_threads.customer_user_id,
            excluded.customer_user_id
          ),
        updated_at =
          CURRENT_TIMESTAMP
      `,
    )
    .bind(
      serviceRequest.id,
      user.id,
      serviceRequest.shop_code,
    )
    .run();

  const thread =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          request_id,
          customer_user_id,
          shop_code,
          status,
          created_at,
          updated_at
        FROM chat_threads
        WHERE request_id = ?
        LIMIT 1
        `,
      )
      .bind(
        serviceRequest.id,
      )
      .first<ThreadRow>();

  if (!thread) {
    throw new Error(
      "Chat thread could not be created.",
    );
  }

  return thread;
}

async function listThreads(
  request: Request,
  env: Env,
): Promise<Response> {
  const user =
    await currentUser(
      request,
      env,
    );

  if (!user) {
    return jsonResponse(
      {
        error:
          "Sign in to view your chats.",
      },
      401,
    );
  }

  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          sr.request_number,
          sr.status AS request_status,
          sr.created_at AS request_created_at,
          s.name AS service_name,
          sh.name AS shop_name,
          ct.id AS thread_id,
          ct.updated_at AS chat_updated_at,
          (
            SELECT cm.message
            FROM chat_messages cm
            WHERE cm.thread_id = ct.id
            ORDER BY cm.id DESC
            LIMIT 1
          ) AS last_message
        FROM service_requests sr
        INNER JOIN services s
          ON s.id = sr.service_id
        INNER JOIN shops sh
          ON sh.code = sr.shop_code
        LEFT JOIN chat_threads ct
          ON ct.request_id = sr.id
        WHERE
          lower(
            COALESCE(
              sr.email_address,
              ''
            )
          ) = lower(?)
        ORDER BY
          COALESCE(
            ct.updated_at,
            sr.created_at
          ) DESC
        LIMIT 100
        `,
      )
      .bind(user.email)
      .all<{
        request_number: string;
        request_status: string;
        request_created_at: string;
        service_name: string;
        shop_name: string;
        thread_id: number | null;
        chat_updated_at: string | null;
        last_message: string | null;
      }>();

  return jsonResponse({
    threads:
      result.results.map(
        (row) => ({
          requestNumber:
            row.request_number,
          requestStatus:
            row.request_status,
          requestCreatedAt:
            row.request_created_at,
          serviceName:
            row.service_name,
          shopName:
            row.shop_name,
          threadId:
            row.thread_id,
          chatUpdatedAt:
            row.chat_updated_at,
          lastMessage:
            row.last_message,
        }),
      ),
  });
}

async function getThread(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  const user =
    await currentUser(
      request,
      env,
    );

  if (!user) {
    return jsonResponse(
      {
        error:
          "Sign in to use chat.",
      },
      401,
    );
  }

  const requestNumber =
    (
      url.searchParams.get(
        "requestNumber",
      ) ?? ""
    )
      .trim()
      .toUpperCase();

  if (!requestNumber) {
    return jsonResponse(
      {
        error:
          "Request number is required.",
      },
      400,
    );
  }

  const serviceRequest =
    await loadOwnedRequest(
      env,
      user,
      requestNumber,
    );

  if (!serviceRequest) {
    return jsonResponse(
      {
        error:
          "Request not found or it does not belong to this account.",
      },
      404,
    );
  }

  const thread =
    await ensureThread(
      env,
      user,
      serviceRequest,
    );

  const messages =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          sender_type,
          sender_user_id,
          sender_shop_code,
          message,
          created_at
        FROM chat_messages
        WHERE thread_id = ?
        ORDER BY id ASC
        LIMIT 500
        `,
      )
      .bind(thread.id)
      .all<MessageRow>();

  return jsonResponse({
    thread: {
      id:
        thread.id,
      requestNumber:
        serviceRequest.request_number,
      requestStatus:
        serviceRequest.status,
      serviceName:
        serviceRequest.service_name,
      shopCode:
        serviceRequest.shop_code,
      shopName:
        serviceRequest.shop_name,
    },
    messages:
      messages.results.map(
        (message) => ({
          id:
            message.id,
          senderType:
            message.sender_type,
          message:
            message.message,
          createdAt:
            message.created_at,
          mine:
            message.sender_type ===
              "user" &&
            message.sender_user_id ===
              user.id,
        }),
      ),
  });
}

async function postMessage(
  request: Request,
  env: Env,
): Promise<Response> {
  const user =
    await currentUser(
      request,
      env,
    );

  if (!user) {
    return jsonResponse(
      {
        error:
          "Sign in to send messages.",
      },
      401,
    );
  }

  let body: {
    requestNumber?: unknown;
    message?: unknown;
  };

  try {
    body =
      await request.json();
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid request.",
      },
      400,
    );
  }

  const requestNumber =
    typeof body.requestNumber ===
      "string"
      ? body.requestNumber
          .trim()
          .toUpperCase()
      : "";

  const message =
    typeof body.message ===
      "string"
      ? body.message.trim()
      : "";

  if (
    !message ||
    message.length >
      MAX_MESSAGE_LENGTH
  ) {
    return jsonResponse(
      {
        error:
          `Message must contain 1-${MAX_MESSAGE_LENGTH} characters.`,
      },
      400,
    );
  }

  const serviceRequest =
    await loadOwnedRequest(
      env,
      user,
      requestNumber,
    );

  if (!serviceRequest) {
    return jsonResponse(
      {
        error:
          "Request not found or it does not belong to this account.",
      },
      404,
    );
  }

  const thread =
    await ensureThread(
      env,
      user,
      serviceRequest,
    );

  const inserted =
    await env.gyan_registry
      .prepare(
        `
        INSERT INTO chat_messages (
          thread_id,
          sender_type,
          sender_user_id,
          message
        )
        VALUES (
          ?,
          'user',
          ?,
          ?
        )
        RETURNING
          id,
          sender_type,
          sender_user_id,
          sender_shop_code,
          message,
          created_at
        `,
      )
      .bind(
        thread.id,
        user.id,
        message,
      )
      .first<MessageRow>();

  await env.gyan_registry
    .prepare(
      `
      UPDATE chat_threads
      SET updated_at =
        CURRENT_TIMESTAMP
      WHERE id = ?
      `,
    )
    .bind(thread.id)
    .run();

  return jsonResponse(
    {
      message: inserted
        ? {
            id:
              inserted.id,
            senderType:
              inserted.sender_type,
            message:
              inserted.message,
            createdAt:
              inserted.created_at,
            mine: true,
          }
        : null,
    },
    201,
  );
}


async function listMyShops(
  request: Request,
  env: Env,
): Promise<Response> {
  const user =
    await currentUser(
      request,
      env,
    );

  if (!user) {
    return jsonResponse(
      {
        error:
          "Sign in to view your shops.",
      },
      401,
    );
  }

  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          code,
          name,
          city,
          state,
          state_code
        FROM shops
        WHERE
          lower(
            COALESCE(
              email_address,
              ''
            )
          ) = lower(?)
          AND status = 'active'
        ORDER BY
          name ASC,
          code ASC
        `,
      )
      .bind(
        user.email,
      )
      .all<{
        code: string;
        name: string;
        city: string | null;
        state: string | null;
        state_code: string | null;
      }>();

  return jsonResponse({
    shops:
      result.results.map(
        (shop) => ({
          code:
            shop.code,
          name:
            shop.name,
          city:
            shop.city,
          state:
            shop.state,
          stateCode:
            shop.state_code,
        }),
      ),
  });
}


async function loadOwnedShop(
  env: Env,
  user: ChatUser,
  shopCode: string,
): Promise<{
  code: string;
  name: string;
} | null> {
  return env.gyan_registry
    .prepare(
      `
      SELECT
        code,
        name
      FROM shops
      WHERE
        code = ?
        AND lower(
          COALESCE(
            email_address,
            ''
          )
        ) = lower(?)
        AND status = 'active'
      LIMIT 1
      `,
    )
    .bind(
      shopCode,
      user.email,
    )
    .first<{
      code: string;
      name: string;
    }>();
}


async function listShopThreads(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  const user =
    await currentUser(
      request,
      env,
    );

  if (!user) {
    return jsonResponse(
      {
        error:
          "Sign in with the shop email to view messages.",
      },
      401,
    );
  }

  const shopCode =
    (
      url.searchParams.get(
        "shopCode",
      ) ?? ""
    )
      .trim()
      .toUpperCase();

  if (
    !/^[A-Z0-9]{4}$/.test(
      shopCode,
    )
  ) {
    return jsonResponse(
      {
        error:
          "Invalid shop code.",
      },
      400,
    );
  }

  const shop =
    await loadOwnedShop(
      env,
      user,
      shopCode,
    );

  if (!shop) {
    return jsonResponse(
      {
        error:
          "This account is not authorized for this shop.",
      },
      403,
    );
  }

  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          sr.request_number,
          sr.status AS request_status,
          sr.created_at AS request_created_at,
          sr.customer_name,
          sr.email_address,
          s.name AS service_name,
          ct.id AS thread_id,
          ct.updated_at AS chat_updated_at,
          (
            SELECT cm.message
            FROM chat_messages cm
            WHERE cm.thread_id = ct.id
            ORDER BY cm.id DESC
            LIMIT 1
          ) AS last_message
        FROM service_requests sr
        INNER JOIN services s
          ON s.id = sr.service_id
        LEFT JOIN chat_threads ct
          ON ct.request_id = sr.id
        WHERE sr.shop_code = ?
        ORDER BY
          COALESCE(
            ct.updated_at,
            sr.created_at
          ) DESC
        LIMIT 100
        `,
      )
      .bind(shopCode)
      .all<{
        request_number: string;
        request_status: string;
        request_created_at: string;
        customer_name: string | null;
        email_address: string | null;
        service_name: string;
        thread_id: number | null;
        chat_updated_at: string | null;
        last_message: string | null;
      }>();

  return jsonResponse({
    shop: {
      code:
        shop.code,
      name:
        shop.name,
    },

    threads:
      result.results.map(
        (row) => ({
          requestNumber:
            row.request_number,
          requestStatus:
            row.request_status,
          requestCreatedAt:
            row.request_created_at,
          customerName:
            row.customer_name,
          customerEmail:
            row.email_address,
          serviceName:
            row.service_name,
          threadId:
            row.thread_id,
          chatUpdatedAt:
            row.chat_updated_at,
          lastMessage:
            row.last_message,
        }),
      ),
  });
}


async function getShopThread(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response> {
  const user =
    await currentUser(
      request,
      env,
    );

  if (!user) {
    return jsonResponse(
      {
        error:
          "Sign in with the shop email to view messages.",
      },
      401,
    );
  }

  const shopCode =
    (
      url.searchParams.get(
        "shopCode",
      ) ?? ""
    )
      .trim()
      .toUpperCase();

  const requestNumber =
    (
      url.searchParams.get(
        "requestNumber",
      ) ?? ""
    )
      .trim()
      .toUpperCase();

  const shop =
    await loadOwnedShop(
      env,
      user,
      shopCode,
    );

  if (!shop) {
    return jsonResponse(
      {
        error:
          "This account is not authorized for this shop.",
      },
      403,
    );
  }

  const serviceRequest =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          sr.id,
          sr.request_number,
          sr.shop_code,
          sr.email_address,
          sr.status,
          sr.created_at,
          s.name AS service_name,
          sh.name AS shop_name
        FROM service_requests sr
        INNER JOIN services s
          ON s.id = sr.service_id
        INNER JOIN shops sh
          ON sh.code = sr.shop_code
        WHERE
          sr.request_number = ?
          AND sr.shop_code = ?
        LIMIT 1
        `,
      )
      .bind(
        requestNumber,
        shopCode,
      )
      .first<RequestRow>();

  if (!serviceRequest) {
    return jsonResponse(
      {
        error:
          "Request not found for this shop.",
      },
      404,
    );
  }

  /*
   * A shop may open a conversation before the
   * customer ever opens Chat. Create the thread
   * without assuming a customer user id.
   */
  await env.gyan_registry
    .prepare(
      `
      INSERT INTO chat_threads (
        request_id,
        shop_code
      )
      VALUES (?, ?)
      ON CONFLICT(request_id)
      DO UPDATE SET
        updated_at =
          chat_threads.updated_at
      `,
    )
    .bind(
      serviceRequest.id,
      shopCode,
    )
    .run();

  const thread =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          request_id,
          customer_user_id,
          shop_code,
          status,
          created_at,
          updated_at
        FROM chat_threads
        WHERE request_id = ?
        LIMIT 1
        `,
      )
      .bind(
        serviceRequest.id,
      )
      .first<ThreadRow>();

  if (!thread) {
    return jsonResponse(
      {
        error:
          "Chat could not be opened.",
      },
      500,
    );
  }

  const messages =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          sender_type,
          sender_user_id,
          sender_shop_code,
          message,
          created_at
        FROM chat_messages
        WHERE thread_id = ?
        ORDER BY id ASC
        LIMIT 500
        `,
      )
      .bind(thread.id)
      .all<MessageRow>();

  return jsonResponse({
    thread: {
      id:
        thread.id,
      requestNumber:
        serviceRequest.request_number,
      requestStatus:
        serviceRequest.status,
      serviceName:
        serviceRequest.service_name,
      shopCode:
        shopCode,
      shopName:
        shop.name,
    },

    messages:
      messages.results.map(
        (message) => ({
          id:
            message.id,
          senderType:
            message.sender_type,
          message:
            message.message,
          createdAt:
            message.created_at,
          mine:
            message.sender_type ===
              "shop" &&
            message.sender_shop_code ===
              shopCode,
        }),
      ),
  });
}


async function postShopMessage(
  request: Request,
  env: Env,
): Promise<Response> {
  const user =
    await currentUser(
      request,
      env,
    );

  if (!user) {
    return jsonResponse(
      {
        error:
          "Sign in with the shop email to reply.",
      },
      401,
    );
  }

  let body: {
    shopCode?: unknown;
    requestNumber?: unknown;
    message?: unknown;
  };

  try {
    body =
      await request.json();
  } catch {
    return jsonResponse(
      {
        error:
          "Invalid request.",
      },
      400,
    );
  }

  const shopCode =
    typeof body.shopCode ===
      "string"
      ? body.shopCode
          .trim()
          .toUpperCase()
      : "";

  const requestNumber =
    typeof body.requestNumber ===
      "string"
      ? body.requestNumber
          .trim()
          .toUpperCase()
      : "";

  const message =
    typeof body.message ===
      "string"
      ? body.message.trim()
      : "";

  if (
    !/^[A-Z0-9]{4}$/.test(
      shopCode,
    ) ||
    !requestNumber
  ) {
    return jsonResponse(
      {
        error:
          "Shop and request are required.",
      },
      400,
    );
  }

  if (
    !message ||
    message.length >
      MAX_MESSAGE_LENGTH
  ) {
    return jsonResponse(
      {
        error:
          `Message must contain 1-${MAX_MESSAGE_LENGTH} characters.`,
      },
      400,
    );
  }

  const shop =
    await loadOwnedShop(
      env,
      user,
      shopCode,
    );

  if (!shop) {
    return jsonResponse(
      {
        error:
          "This account is not authorized for this shop.",
      },
      403,
    );
  }

  const serviceRequest =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          sr.id,
          sr.request_number,
          sr.shop_code,
          sr.email_address,
          sr.status,
          sr.created_at,
          s.name AS service_name,
          sh.name AS shop_name
        FROM service_requests sr
        INNER JOIN services s
          ON s.id = sr.service_id
        INNER JOIN shops sh
          ON sh.code = sr.shop_code
        WHERE
          sr.request_number = ?
          AND sr.shop_code = ?
        LIMIT 1
        `,
      )
      .bind(
        requestNumber,
        shopCode,
      )
      .first<RequestRow>();

  if (!serviceRequest) {
    return jsonResponse(
      {
        error:
          "Request not found for this shop.",
      },
      404,
    );
  }

  await env.gyan_registry
    .prepare(
      `
      INSERT INTO chat_threads (
        request_id,
        shop_code
      )
      VALUES (?, ?)
      ON CONFLICT(request_id)
      DO NOTHING
      `,
    )
    .bind(
      serviceRequest.id,
      shopCode,
    )
    .run();

  const thread =
    await env.gyan_registry
      .prepare(
        `
        SELECT id
        FROM chat_threads
        WHERE request_id = ?
        LIMIT 1
        `,
      )
      .bind(
        serviceRequest.id,
      )
      .first<{
        id: number;
      }>();

  if (!thread) {
    return jsonResponse(
      {
        error:
          "Chat thread could not be created.",
      },
      500,
    );
  }

  const inserted =
    await env.gyan_registry
      .prepare(
        `
        INSERT INTO chat_messages (
          thread_id,
          sender_type,
          sender_shop_code,
          message
        )
        VALUES (
          ?,
          'shop',
          ?,
          ?
        )
        RETURNING
          id,
          sender_type,
          sender_user_id,
          sender_shop_code,
          message,
          created_at
        `,
      )
      .bind(
        thread.id,
        shopCode,
        message,
      )
      .first<MessageRow>();

  await env.gyan_registry
    .prepare(
      `
      UPDATE chat_threads
      SET updated_at =
        CURRENT_TIMESTAMP
      WHERE id = ?
      `,
    )
    .bind(thread.id)
    .run();

  return jsonResponse(
    {
      message: inserted
        ? {
            id:
              inserted.id,
            senderType:
              inserted.sender_type,
            message:
              inserted.message,
            createdAt:
              inserted.created_at,
            mine: true,
          }
        : null,
    },
    201,
  );
}


export async function handleChatRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  if (
    request.method === "GET" &&
    url.pathname ===
      "/api/chat/threads"
  ) {
    return listThreads(
      request,
      env,
    );
  }

  if (
    request.method === "GET" &&
    url.pathname ===
      "/api/chat/thread"
  ) {
    return getThread(
      request,
      env,
      url,
    );
  }

  if (
    request.method === "POST" &&
    url.pathname ===
      "/api/chat/messages"
  ) {
    return postMessage(
      request,
      env,
    );
  }

  if (
    request.method === "GET" &&
    url.pathname ===
      "/api/chat/my-shops"
  ) {
    return listMyShops(
      request,
      env,
    );
  }

  if (
    request.method === "GET" &&
    url.pathname ===
      "/api/chat/shop/threads"
  ) {
    return listShopThreads(
      request,
      env,
      url,
    );
  }

  if (
    request.method === "GET" &&
    url.pathname ===
      "/api/chat/shop/thread"
  ) {
    return getShopThread(
      request,
      env,
      url,
    );
  }

  if (
    request.method === "POST" &&
    url.pathname ===
      "/api/chat/shop/messages"
  ) {
    return postShopMessage(
      request,
      env,
    );
  }

  return null;
}