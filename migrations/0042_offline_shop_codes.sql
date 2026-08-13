-- 0042_offline_shop_codes.sql
CREATE TABLE IF NOT EXISTS offline_shop_codes (
  code TEXT PRIMARY KEY,
  status TEXT NOT NULL DEFAULT 'reserved'
    CHECK (status IN ('reserved','claimed')),
  batch_code TEXT NOT NULL,
  claimed_shop_code TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  claimed_at TEXT,
  CHECK (length(code)=4),
  CHECK (substr(code,3,1)='R')
);

CREATE INDEX IF NOT EXISTS idx_offline_shop_codes_status
ON offline_shop_codes(status);

CREATE INDEX IF NOT EXISTS idx_offline_shop_codes_batch
ON offline_shop_codes(batch_code);

INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('2ZRR','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('39R7','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('3BRE','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('3KRJ','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('3MR4','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('4DRS','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('56RB','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('5LRQ','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('5TR4','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('5ZR8','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('65RC','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('6YRQ','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('6ZRY','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('78RU','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('7CRE','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('7KR5','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('7SRV','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('83RR','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('8LRM','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('8YR5','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('9MRJ','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('9QRP','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('A8RN','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('B7R8','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('B7RA','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('BPRM','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('BTRX','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('BWR6','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('BYRM','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('C2R4','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('CLR5','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('CLR8','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('CYRW','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('DQRS','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('DVRA','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('DXR5','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('E3RH','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('EGR9','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('EHR6','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('EYRY','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('F3RC','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('GCRR','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('GKRS','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('GWRQ','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('H2RD','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('H4RZ','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('HGRT','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('HHRJ','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('HMRR','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('J2RQ','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('JSRE','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('JWRG','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('JWRR','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('KHRK','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('KMRE','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('KTRV','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('L3RH','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('L8R4','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('LCRG','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('LFRL','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('LMRQ','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('LNR5','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('LUR5','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('MBR2','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('MSRG','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('MYR6','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('NRRG','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('NRRV','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('NURZ','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('PCRL','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('PDRS','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('PHRN','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('QQRL','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('QXRV','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('RAR8','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('RARP','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('RKR7','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('SUR5','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('TWRR','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('UARK','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('ULR9','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('ULRM','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('URRP','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('UTR5','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('UTR7','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('VGRD','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('VMR7','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('W3RS','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('WNRV','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('WTRJ','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('WYRA','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('XURB','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('XVRP','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('Y4RA','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('YERP','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('YNR9','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('Z6RZ','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('ZCRW','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('ZRRC','reserved','SHOP-R-001');
INSERT OR IGNORE INTO offline_shop_codes (code,status,batch_code) VALUES ('ZSRS','reserved','SHOP-R-001');