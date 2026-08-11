-- GYAN Chat MVP
-- One thread per service request.

CREATE TABLE IF NOT EXISTS chat_threads (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  request_id INTEGER NOT NULL UNIQUE,
  customer_user_id INTEGER,
  shop_code TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'active',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (request_id) REFERENCES service_requests(id),
  FOREIGN KEY (customer_user_id) REFERENCES users(id)
);

CREATE INDEX IF NOT EXISTS idx_chat_threads_customer
  ON chat_threads(customer_user_id, updated_at DESC);

CREATE INDEX IF NOT EXISTS idx_chat_threads_shop
  ON chat_threads(shop_code, updated_at DESC);

CREATE TABLE IF NOT EXISTS chat_messages (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  thread_id INTEGER NOT NULL,
  sender_type TEXT NOT NULL,
  sender_user_id INTEGER,
  sender_shop_code TEXT,
  message TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (thread_id) REFERENCES chat_threads(id),
  FOREIGN KEY (sender_user_id) REFERENCES users(id)
);

CREATE INDEX IF NOT EXISTS idx_chat_messages_thread
  ON chat_messages(thread_id, id);