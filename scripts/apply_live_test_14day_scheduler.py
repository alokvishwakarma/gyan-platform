#!/usr/bin/env python3
from pathlib import Path
import re, shutil

ROOT = Path.cwd()
LIVE = ROOT / 'worker' / 'liveTests.ts'
INDEX = ROOT / 'worker' / 'index.ts'
WRANGLER = ROOT / 'wrangler.jsonc'

for path in (LIVE, INDEX, WRANGLER):
    if not path.exists():
        raise SystemExit(f'ERROR: missing {path}')

def backup(path: Path) -> None:
    dest = path.with_name(path.name + '.before-live-scheduler.bak')
    if not dest.exists():
        shutil.copy2(path, dest)

# liveTests.ts: main strip only shows visible tests
text = LIVE.read_text(encoding='utf-8')
original = text
if 'lt.visible = 1' not in text:
    anchor = """        WHERE
          COALESCE(
            lt.event_kind,
            'WEEKDAY'
          ) <> 'ADMIN_TEST'
"""
    replacement = """        WHERE
          COALESCE(
            lt.event_kind,
            'WEEKDAY'
          ) <> 'ADMIN_TEST'

          AND lt.visible = 1
"""
    if anchor not in text:
        raise SystemExit('ERROR: liveTests.ts listLiveTests WHERE anchor not found.')
    text = text.replace(anchor, replacement, 1)
if text != original:
    backup(LIVE)
    LIVE.write_text(text, encoding='utf-8')

# index.ts: import scheduler
text = INDEX.read_text(encoding='utf-8')
original = text
if 'from "./liveTestScheduler"' not in text:
    pattern = re.compile(r'import\s*\{\s*handleLiveTestsRoute\s*,?\s*\}\s*from\s*"\./liveTests";')
    match = pattern.search(text)
    if not match:
        raise SystemExit('ERROR: index.ts liveTests import anchor not found.')
    addition = '''\n\nimport {\n  maintainLiveTestInventory,\n  switchLiveTestVisibility,\n} from "./liveTestScheduler";'''
    text = text[:match.end()] + addition + text[match.end():]

if 'Live Test 14-day inventory.' not in text:
    pattern = re.compile(
        r'(async\s+scheduled\s*\(\s*controller:\s*ScheduledController,\s*env:\s*Env,\s*context:\s*ExecutionContext,\s*\):\s*Promise<void>\s*\{)',
        re.S,
    )
    match = pattern.search(text)
    if not match:
        raise SystemExit('ERROR: index.ts scheduled() anchor not found.')
    block = '''\n\n    /*\n     * Live Test 14-day inventory.\n     * Daily builder: 03:17 UTC.\n     * Hourly switcher: minute 5 of every hour.\n     */\n    if (\n      controller.cron ===\n      "17 3 * * *"\n    ) {\n      context.waitUntil(\n        maintainLiveTestInventory(\n          env,\n          14,\n        ).catch((error) => {\n          console.error(\n            "Live Test 14-day inventory failed:",\n            error,\n          );\n        }),\n      );\n    }\n\n    if (\n      controller.cron ===\n      "5 * * * *"\n    ) {\n      context.waitUntil(\n        switchLiveTestVisibility(\n          env,\n        ).catch((error) => {\n          console.error(\n            "Live Test visibility switch failed:",\n            error,\n          );\n        }),\n      );\n    }\n'''
    text = text[:match.end()] + block + text[match.end():]
if text != original:
    backup(INDEX)
    INDEX.write_text(text, encoding='utf-8')

# wrangler.jsonc: add hourly trigger, preserving existing triggers
text = WRANGLER.read_text(encoding='utf-8')
original = text
if '"5 * * * *"' not in text:
    match = re.search(r'("crons"\s*:\s*\[)(.*?)(\])', text, re.S)
    if not match:
        raise SystemExit('ERROR: wrangler.jsonc crons array not found.')
    values = re.findall(r'"([^"]+)"', match.group(2))
    if '17 3 * * *' not in values:
        raise SystemExit('ERROR: expected existing 17 3 * * * cron not found.')
    values.append('5 * * * *')
    new_inside = '\n    ' + ',\n    '.join(f'"{value}"' for value in values) + '\n  '
    text = text[:match.start(2)] + new_inside + text[match.end(2):]
if text != original:
    backup(WRANGLER)
    WRANGLER.write_text(text, encoding='utf-8')

print('Live Test 14-day scheduler patch applied.')
print('Run: npm run build')
print('Then inspect: git diff -- worker/liveTests.ts worker/index.ts wrangler.jsonc')
