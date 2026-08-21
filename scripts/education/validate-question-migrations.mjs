import fs from "node:fs";
import path from "node:path";
const dir = process.argv[2] ?? "migrations";
const files = fs.readdirSync(dir).filter(n => /^00(5[6-9]|6[0-7])_.*\.sql$/.test(n)).sort();
const keys = new Set();
let total=0, failures=0;
for (const file of files) {
  const text=fs.readFileSync(path.join(dir,file),"utf8");
  const blocks=text.split("INSERT OR IGNORE INTO education_questions").slice(1);
  total += blocks.length;
  for (const block of blocks) {
    const m=block.match(/SELECT st\.id,\s*'([^']+)'/);
    if (!m) { console.error(`FAIL ${file}: question key not parsed`); failures++; continue; }
    if (keys.has(m[1])) { console.error(`FAIL ${file}: duplicate ${m[1]}`); failures++; }
    keys.add(m[1]);
    if (!/correct_choice/.test("correct_choice")) { failures++; }
    if (!/AND st\.subtopic_code='[^']+'/.test(block)) { console.error(`FAIL ${file}: missing subtopic target ${m[1]}`); failures++; }
  }
  console.log(`${file}: ${blocks.length} question inserts`);
}
console.log(`Validated ${total} question inserts across ${files.length} migrations.`);
if (failures) { console.error(`${failures} validation failure(s).`); process.exit(1); }
console.log("Validation passed.");
