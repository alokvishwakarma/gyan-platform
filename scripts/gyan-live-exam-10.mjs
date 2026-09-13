const BASE_URL =
  process.env.GYAN_BASE_URL?.replace(/\/+$/, "") ||
  "https://gyan.cc";

const TEST_CODE =
  (process.env.GYAN_TEST_CODE || "237N")
    .trim()
    .toUpperCase();

const TESTERS = 10;

const sleep = (ms) =>
  new Promise((resolve) =>
    setTimeout(resolve, ms)
  );

function cookieFromResponse(response) {
  const getSetCookie =
    response.headers.getSetCookie?.();

  const raw =
    Array.isArray(getSetCookie) &&
    getSetCookie.length
      ? getSetCookie[0]
      : response.headers.get(
          "set-cookie"
        );

  if (!raw) {
    throw new Error(
      "GYAN identity response did not return a session cookie."
    );
  }

  const match =
    raw.match(
      /(?:^|;\s*)gyan_anon=([^;]+)/
    );

  if (!match) {
    throw new Error(
      "Unable to find gyan_anon in Set-Cookie."
    );
  }

  return `gyan_anon=${match[1]}`;
}

async function jsonFetch(
  path,
  {
    method = "GET",
    cookie = "",
    body,
    headers = {},
  } = {}
) {
  const started =
    performance.now();

  const response =
    await fetch(
      `${BASE_URL}${path}`,
      {
        method,
        cache: "no-store",
        headers: {
          accept:
            "application/json",

          ...(body !== undefined
            ? {
                "content-type":
                  "application/json",
              }
            : {}),

          ...(cookie
            ? {
                cookie,
              }
            : {}),

          "user-agent":
            "GYAN-Load-Test/1.0",

          "x-gyan-load-test":
            "live-exam-10",

          ...headers,
        },

        ...(body !== undefined
          ? {
              body:
                JSON.stringify(
                  body
                ),
            }
          : {}),
      }
    );

  const elapsedMs =
    Math.round(
      performance.now() -
        started
    );

  let payload = null;

  try {
    payload =
      await response.json();
  } catch {
    payload = null;
  }

  return {
    response,
    payload,
    elapsedMs,
  };
}

async function createIdentity(id) {
  const result =
    await jsonFetch(
      "/api/gyan-identity",
      {
        method: "POST",

        body: {
          client: {
            userAgent:
              `GYAN-Load-Test/1.0 tester-${id}`,

            language:
              "en-US",

            languages: [
              "en-US",
            ],

            platform:
              "Node.js",

            touch:
              false,

            screenWidth:
              390,

            screenHeight:
              844,

            viewportWidth:
              390,

            viewportHeight:
              760,

            referrer:
              "GYAN_LOAD_TEST",

            utmSource:
              "load-test",

            utmMedium:
              "synthetic",

            utmCampaign:
              `live-${TEST_CODE}`,
          },
        },
      }
    );

  if (!result.response.ok) {
    throw new Error(
      `identity ${result.response.status}: ` +
      `${
        result.payload?.error ??
        "creation failed"
      }`
    );
  }

  const cookie =
    cookieFromResponse(
      result.response
    );

  const identity =
    result.payload?.identity;

  if (!identity?.code) {
    throw new Error(
      "Identity created but no public code was returned."
    );
  }

  return {
    cookie,

    code:
      String(
        identity.code
      ),

    displayName:
      identity.displayName ??
      `tester-${id}`,

    welcomeGems:
      identity.welcomeGems,

    elapsedMs:
      result.elapsedMs,
  };
}

async function enterTest(cookie) {
  const result =
    await jsonFetch(
      "/api/education/live-tests/enter",
      {
        method: "POST",

        cookie,

        body: {
          code:
            TEST_CODE,
        },
      }
    );

  if (!result.response.ok) {
    throw new Error(
      `enter ${result.response.status}: ` +
      `${
        result.payload?.error ??
        "failed"
      }`
    );
  }

  return {
    ...result.payload,

    elapsedMs:
      result.elapsedMs,
  };
}

async function loadQuestions(cookie) {
  const result =
    await jsonFetch(
      `/api/education/live-tests/questions?code=${encodeURIComponent(
        TEST_CODE
      )}`,
      {
        cookie,
      }
    );

  if (!result.response.ok) {
    throw new Error(
      `questions ${result.response.status}: ` +
      `${
        result.payload?.error ??
        "failed"
      }`
    );
  }

  const questions =
    result.payload?.questions;

  if (
    !Array.isArray(
      questions
    )
  ) {
    throw new Error(
      "Questions response did not contain an array."
    );
  }

  return {
    liveTest:
      result.payload.liveTest,

    questions,

    elapsedMs:
      result.elapsedMs,
  };
}

function answersFor(
  questions,
  testerId
) {
  const choices =
    [
      "A",
      "B",
      "C",
      "D",
    ];

  return questions.map(
    (
      question,
      index
    ) => ({
      questionId:
        question.questionId,

      selectedChoice:
        choices[
          (
            index +
            testerId
          ) %
            choices.length
        ],
    })
  );
}

async function submitTest(
  cookie,
  questions,
  testerId
) {
  await sleep(
    2000 +
      testerId * 350
  );

  const result =
    await jsonFetch(
      "/api/education/live-tests/submit",
      {
        method:
          "POST",

        cookie,

        body: {
          code:
            TEST_CODE,

          answers:
            answersFor(
              questions,
              testerId
            ),
        },
      }
    );

  if (!result.response.ok) {
    throw new Error(
      `submit ${result.response.status}: ` +
      `${
        result.payload?.error ??
        "failed"
      }`
    );
  }

  return {
    ...result.payload,

    elapsedMs:
      result.elapsedMs,
  };
}

async function runTester(id) {
  await sleep(
    (id - 1) *
      120
  );

  const started =
    performance.now();

  const identity =
    await createIdentity(
      id
    );

  console.log(
    `[${String(id).padStart(
      2,
      "0"
    )}] identity ` +
    `${identity.code} · ` +
    `${identity.elapsedMs}ms · ` +
    `welcomeGems=${
      identity.welcomeGems ??
      "?"
    }`
  );

  const entered =
    await enterTest(
      identity.cookie
    );

  console.log(
    `[${String(id).padStart(
      2,
      "0"
    )}] enter    ` +
    `${entered.elapsedMs}ms · ` +
    `balance=${
      entered.gemBalance ??
      "?"
    }`
  );

  const loaded =
    await loadQuestions(
      identity.cookie
    );

  console.log(
    `[${String(id).padStart(
      2,
      "0"
    )}] questions ` +
    `${loaded.elapsedMs}ms · ` +
    `count=${
      loaded.questions.length
    }`
  );

  const submitted =
    await submitTest(
      identity.cookie,
      loaded.questions,
      id
    );

  console.log(
    `[${String(id).padStart(
      2,
      "0"
    )}] submit   ` +
    `${submitted.elapsedMs}ms · ` +
    `answered=${
      submitted.answeredCount ??
      "?"
    }`
  );

  return {
    id,

    code:
      identity.code,

    ok:
      true,

    identityMs:
      identity.elapsedMs,

    enterMs:
      entered.elapsedMs,

    questionsMs:
      loaded.elapsedMs,

    submitMs:
      submitted.elapsedMs,

    questionCount:
      loaded.questions.length,

    wallMs:
      Math.round(
        performance.now() -
          started
      ),
  };
}

async function main() {
  console.log("");

  console.log(
    `GYAN realistic Live Test load test · #${TEST_CODE}`
  );

  console.log(
    `${TESTERS} isolated virtual browsers`
  );

  console.log("");

  const started =
    performance.now();

  const settled =
    await Promise.allSettled(
      Array.from(
        {
          length:
            TESTERS,
        },

        (
          _,
          index
        ) =>
          runTester(
            index + 1
          )
      )
    );

  const passed =
    [];

  const failed =
    [];

  for (
    let index = 0;
    index <
    settled.length;
    index += 1
  ) {
    const row =
      settled[index];

    if (
      row.status ===
      "fulfilled"
    ) {
      passed.push(
        row.value
      );
    } else {
      failed.push({
        id:
          index + 1,

        error:
          row.reason instanceof
          Error
            ? row.reason.message
            : String(
                row.reason
              ),
      });
    }
  }

  console.log("");

  console.log(
    "--- summary ---"
  );

  console.log(
    `Completed: ${passed.length}/${TESTERS}`
  );

  console.log(
    `Failed:    ${failed.length}/${TESTERS}`
  );

  console.log(
    `Wall:      ${Math.round(
      performance.now() -
        started
    )} ms`
  );

  if (
    passed.length
  ) {
    const average =
      (field) =>
        Math.round(
          passed.reduce(
            (
              sum,
              row
            ) =>
              sum +
              Number(
                row[field] ??
                0
              ),

            0
          ) /
            passed.length
        );

    console.log(
      `Avg identity:  ${average(
        "identityMs"
      )} ms`
    );

    console.log(
      `Avg enter:     ${average(
        "enterMs"
      )} ms`
    );

    console.log(
      `Avg questions: ${average(
        "questionsMs"
      )} ms`
    );

    console.log(
      `Avg submit:    ${average(
        "submitMs"
      )} ms`
    );
  }

  if (
    failed.length
  ) {
    console.log("");

    console.log(
      "Failures:"
    );

    for (
      const row
      of failed
    ) {
      console.log(
        `  Tester ${row.id}: ${row.error}`
      );
    }
  }

  const codes =
    passed
      .map(
        (row) =>
          row.code
      )
      .filter(
        Boolean
      );

  console.log("");

  console.log(
    "LOAD-TEST GYAN CODES:"
  );

  console.log(
    codes.join(", ")
  );

  console.log("");

  console.log(
    "IMPORTANT: these entrants are temporarily stored as GYAN by the current Worker."
  );

  console.log(
    "After the run, reclassify these load-test entries as SYNTHETIC."
  );

  if (
    failed.length
  ) {
    process.exitCode =
      1;
  }
}

await main();