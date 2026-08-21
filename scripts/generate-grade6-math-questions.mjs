import fs from "node:fs";

const OUT =
  process.argv[2] ??
  "migrations/0054_grade6_math_questions.sql";

const COUNTRIES = ["US", "IN"];

const SUBTOPICS = [
  "RATIO_CONCEPTS",
  "EQUIVALENT_RATIOS",
  "UNIT_RATES",
  "RATIO_TABLES",
  "PERCENT",
  "FRACTIONS",
  "DECIMALS",
  "INTEGERS",
  "GCF_LCM",
  "COORDINATE_PLANE",
  "EXPRESSIONS",
  "DISTRIBUTIVE",
  "ONE_STEP_EQUATIONS",
  "INEQUALITIES",
  "DEPENDENT_VARIABLES",
  "AREA_TRIANGLES",
  "AREA_QUADRILATERALS",
  "SURFACE_AREA",
  "VOLUME",
  "MEAN",
  "MEDIAN",
  "MODE",
  "RANGE",
  "DATA_DISPLAYS",
];

function esc(value) {
  return String(value).replaceAll("'", "''");
}

function gcd(a, b) {
  while (b) [a, b] = [b, a % b];
  return Math.abs(a);
}

function lcm(a, b) {
  return Math.abs(a * b) / gcd(a, b);
}

function shuffledChoices(correct, distractors, seed) {
  const values = [...new Set([correct, ...distractors])]
    .map(String);

  while (values.length < 4) {
    values.push(String(Number(correct) + values.length + 1));
  }

  const chosen = values.slice(0, 4);
  const rotate = seed % 4;
  const rotated =
    chosen.slice(rotate).concat(chosen.slice(0, rotate));
  const index = rotated.indexOf(String(correct));

  return {
    choices: rotated,
    correctChoice: ["A", "B", "C", "D"][index],
  };
}

function difficulty(i) {
  if (i < 35) return "easy";
  if (i < 80) return "medium";
  return "challenge";
}

function q(subtopic, i) {
  const a = 2 + (i % 9);
  const b = 3 + ((i * 2) % 8);
  const c = 4 + ((i * 3) % 7);

  let question, correct, distractors, explanation;

  switch (subtopic) {
    case "RATIO_CONCEPTS": {
      const k = 2 + (i % 5);
      const x = a * k;
      const y = b * k;
      question = `A group has ${x} red tiles and ${y} blue tiles. What is the ratio of red tiles to blue tiles in simplest form?`;
      const g = gcd(x, y);
      correct = `${x / g}:${y / g}`;
      distractors = [`${y / g}:${x / g}`, `${x}:${y}`, `${x + y}:${y}`];
      explanation = `Divide both parts of ${x}:${y} by their greatest common factor, ${g}.`;
      break;
    }

    case "EQUIVALENT_RATIOS": {
      const k = 2 + (i % 6);
      question = `Which ratio is equivalent to ${a}:${b}?`;
      correct = `${a * k}:${b * k}`;
      distractors = [
        `${a * k}:${b * (k + 1)}`,
        `${a + k}:${b + k}`,
        `${b * k}:${a * k}`,
      ];
      explanation = `Multiply both parts of a ratio by the same number (${k}).`;
      break;
    }

    case "UNIT_RATES": {
      const units = 2 + (i % 8);
      const rate = 3 + (i % 12);
      const total = units * rate;
      question = `${units} notebooks cost $${total}. What is the cost per notebook?`;
      correct = rate;
      distractors = [total, total - units, rate + units];
      explanation = `$${total} ÷ ${units} = $${rate} per notebook.`;
      break;
    }

    case "RATIO_TABLES": {
      const factor = 2 + (i % 7);
      question = `A ratio table starts with ${a} cups of flour for ${b} batches. How many cups are needed for ${b * factor} batches?`;
      correct = a * factor;
      distractors = [a + factor, a * (factor - 1), b * factor];
      explanation = `The number of batches is multiplied by ${factor}, so multiply the cups by ${factor} too.`;
      break;
    }

    case "PERCENT": {
      const percent = [10, 20, 25, 50, 75][i % 5];
      const base = 20 * (2 + (i % 8));
      question = `What is ${percent}% of ${base}?`;
      correct = base * percent / 100;
      distractors = [
        base * (percent + 10) / 100,
        base - base * percent / 100,
        percent,
      ];
      explanation = `${percent}% = ${percent / 100}. Multiply ${base} by ${percent / 100}.`;
      break;
    }

    case "FRACTIONS": {
      const d = 5 + (i % 7);
      const n1 = 1 + (i % (d - 1));
      const n2 = 1 + ((i * 2) % (d - 1));
      question = `What is ${n1}/${d} + ${n2}/${d}?`;
      const n = n1 + n2;
      const g = gcd(n, d);
      correct = `${n / g}/${d / g}`;
      distractors = [`${n}/${d * 2}`, `${Math.abs(n1 - n2)}/${d}`, `${n + 1}/${d}`];
      explanation = `The denominators are the same, so add the numerators and simplify.`;
      break;
    }

    case "DECIMALS": {
      const x = (10 + (i % 80)) / 10;
      const y = (5 + ((i * 3) % 40)) / 10;
      question = `What is ${x.toFixed(1)} + ${y.toFixed(1)}?`;
      correct = (x + y).toFixed(1);
      distractors = [
        (x + y + 1).toFixed(1),
        Math.abs(x - y).toFixed(1),
        (x + y - 0.1).toFixed(1),
      ];
      explanation = `Align the decimal points and add: ${x.toFixed(1)} + ${y.toFixed(1)} = ${(x + y).toFixed(1)}.`;
      break;
    }

    case "INTEGERS": {
      const x = -1 * (2 + (i % 15));
      const y = 1 + ((i * 2) % 15);
      question = `What is ${x} + ${y}?`;
      correct = x + y;
      distractors = [x - y, Math.abs(x) + y, -(Math.abs(x) + y)];
      explanation = `Adding a positive number moves ${y} units to the right on the number line.`;
      break;
    }

    case "GCF_LCM": {
      const x = 6 + (i % 18);
      const y = 8 + ((i * 2) % 20);
      const useGcf = i % 2 === 0;
      question = useGcf
        ? `What is the greatest common factor of ${x} and ${y}?`
        : `What is the least common multiple of ${x} and ${y}?`;
      correct = useGcf ? gcd(x, y) : lcm(x, y);
      distractors = useGcf
        ? [1, Math.min(x, y), gcd(x, y) + 1]
        : [x * y, Math.max(x, y), lcm(x, y) + Math.min(x, y)];
      explanation = useGcf
        ? `List common factors and choose the greatest.`
        : `List multiples and choose the first common multiple.`;
      break;
    }

    case "COORDINATE_PLANE": {
      const x = -5 + (i % 11);
      const y = -5 + ((i * 3) % 11);
      question = `Which ordered pair has x-coordinate ${x} and y-coordinate ${y}?`;
      correct = `(${x}, ${y})`;
      distractors = [`(${y}, ${x})`, `(${-x}, ${y})`, `(${x}, ${-y})`];
      explanation = `Ordered pairs are written (x, y).`;
      break;
    }

    case "EXPRESSIONS": {
      const x = 2 + (i % 9);
      const m = 2 + ((i * 2) % 6);
      const k = 1 + (i % 5);
      question = `Evaluate ${m}x + ${k} when x = ${x}.`;
      correct = m * x + k;
      distractors = [m + x + k, m * (x + k), m * x - k];
      explanation = `Substitute x = ${x}: ${m}(${x}) + ${k} = ${m * x + k}.`;
      break;
    }

    case "DISTRIBUTIVE": {
      const m = 2 + (i % 8);
      const x = 2 + ((i * 2) % 7);
      const k = 1 + (i % 6);
      question = `What is ${m}(${x} + ${k})?`;
      correct = m * (x + k);
      distractors = [m * x + k, m + x + k, m * x * k];
      explanation = `Multiply ${m} by both terms: ${m}×${x} + ${m}×${k}.`;
      break;
    }

    case "ONE_STEP_EQUATIONS": {
      const answer = 2 + (i % 15);
      const k = 1 + ((i * 3) % 10);
      const sum = answer + k;
      question = `Solve x + ${k} = ${sum}.`;
      correct = answer;
      distractors = [sum + k, sum, Math.abs(answer - k)];
      explanation = `Subtract ${k} from both sides.`;
      break;
    }

    case "INEQUALITIES": {
      const boundary = 4 + (i % 15);
      question = `Which number satisfies x > ${boundary}?`;
      correct = boundary + 2;
      distractors = [boundary, boundary - 1, boundary - 3];
      explanation = `x must be greater than ${boundary}.`;
      break;
    }

    case "DEPENDENT_VARIABLES": {
      const rate = 2 + (i % 8);
      const hours = 1 + ((i * 2) % 6);
      question = `A bike travels ${rate} miles each hour. If h is hours and d is distance, what is d when h = ${hours}?`;
      correct = rate * hours;
      distractors = [rate + hours, rate, hours];
      explanation = `Distance depends on time: d = ${rate}h.`;
      break;
    }

    case "AREA_TRIANGLES": {
      const base = 4 + (i % 12);
      const height = 2 * (2 + ((i * 2) % 8));
      question = `A triangle has base ${base} cm and height ${height} cm. What is its area?`;
      correct = base * height / 2;
      distractors = [base * height, base + height, (base + height) / 2];
      explanation = `Area of a triangle = 1/2 × base × height.`;
      break;
    }

    case "AREA_QUADRILATERALS": {
      const length = 3 + (i % 12);
      const width = 2 + ((i * 2) % 9);
      question = `A rectangle is ${length} cm long and ${width} cm wide. What is its area?`;
      correct = length * width;
      distractors = [2 * (length + width), length + width, length * width + width];
      explanation = `Area of a rectangle = length × width.`;
      break;
    }

    case "SURFACE_AREA": {
      const side = 2 + (i % 8);
      question = `A cube has side length ${side} cm. What is its surface area?`;
      correct = 6 * side * side;
      distractors = [side ** 3, 4 * side * side, 6 * side];
      explanation = `A cube has 6 square faces, each with area ${side * side}.`;
      break;
    }

    case "VOLUME": {
      const l = 2 + (i % 8);
      const w = 2 + ((i * 2) % 7);
      const h = 2 + ((i * 3) % 6);
      question = `A rectangular prism measures ${l} cm by ${w} cm by ${h} cm. What is its volume?`;
      correct = l * w * h;
      distractors = [l * w + h, 2 * (l + w + h), l * w];
      explanation = `Volume = length × width × height.`;
      break;
    }

    case "MEAN": {
      const start = 2 + (i % 8);
      const values = [start, start + 2, start + 4, start + 6, start + 8];
      question = `What is the mean of ${values.join(", ")}?`;
      correct = start + 4;
      distractors = [start + 3, start + 5, start + 8];
      explanation = `Add the 5 values and divide by 5.`;
      break;
    }

    case "MEDIAN": {
      const start = 1 + (i % 10);
      const values = [start, start + 2, start + 4, start + 6, start + 8];
      question = `What is the median of ${values.join(", ")}?`;
      correct = start + 4;
      distractors = [start + 2, start + 6, start + 8];
      explanation = `The median is the middle value when the numbers are ordered.`;
      break;
    }

    case "MODE": {
      const m = 2 + (i % 12);
      const values = [m, m + 1, m, m + 2, m + 3, m];
      question = `What is the mode of ${values.join(", ")}?`;
      correct = m;
      distractors = [m + 1, m + 2, m + 3];
      explanation = `The mode is the value that appears most often.`;
      break;
    }

    case "RANGE": {
      const low = 1 + (i % 10);
      const high = low + 5 + (i % 8);
      const values = [low, low + 2, high - 1, high];
      question = `What is the range of ${values.join(", ")}?`;
      correct = high - low;
      distractors = [high, low, high - low + 1];
      explanation = `Range = greatest value − least value.`;
      break;
    }

    case "DATA_DISPLAYS": {
      const a1 = 2 + (i % 7);
      const a2 = a1 + 2;
      const a3 = a2 + 3;
      question = `A table shows 3 students read ${a1}, ${a2}, and ${a3} books. How many books were read in total?`;
      correct = a1 + a2 + a3;
      distractors = [a3, a2 + a3, a1 + a3];
      explanation = `Add all values represented in the data display.`;
      break;
    }

    default:
      throw new Error(`No generator for ${subtopic}`);
  }

  const { choices, correctChoice } =
    shuffledChoices(correct, distractors, i);

  return {
    question,
    choices,
    correctChoice,
    explanation,
  };
}

let sql = `-- 0054_grade6_math_questions.sql
-- GENERATED by scripts/generate-grade6-math-questions.mjs
-- 100 questions per Grade 6 Math subtopic, per country.
-- Review a sample before applying to production.

`;

for (const country of COUNTRIES) {
  for (const subtopic of SUBTOPICS) {
    for (let i = 0; i < 100; i++) {
      const item = q(subtopic, i);
      const d = difficulty(i);
      const key = `${country}_G6_MATH_${subtopic}_${String(i + 1).padStart(3, "0")}`;

      sql += `INSERT OR IGNORE INTO education_questions
(subtopic_id, question_key, difficulty, question_text, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation, active, source_type)
SELECT st.id,
'${esc(key)}',
'${esc(d)}',
'${esc(item.question)}',
'${esc(item.choices[0])}',
'${esc(item.choices[1])}',
'${esc(item.choices[2])}',
'${esc(item.choices[3])}',
'${esc(item.correctChoice)}',
'${esc(item.explanation)}',
1,
'generated'
FROM education_subtopics st
JOIN education_topics t ON t.id = st.topic_id
JOIN education_subjects s ON s.id = t.subject_id
WHERE s.country_code='${country}'
  AND s.grade_code='GRADE_6'
  AND s.subject_code='MATH'
  AND st.subtopic_code='${subtopic}';

`;
    }
  }
}

fs.writeFileSync(OUT, sql, "utf8");
console.log(`Wrote ${OUT}`);
console.log(`${COUNTRIES.length * SUBTOPICS.length * 100} questions generated.`);
