const BASE_URL = "https://gyan.cc";

const TESTERS = 10;
const REQUESTS_PER_TESTER = 3;
const PAUSE_MS = 1500;

const sleep = (ms) =>
  new Promise((resolve) =>
    setTimeout(resolve, ms)
  );

async function requestOnce(tester, requestNo) {
  const started = performance.now();

  try {
    const response = await fetch(
      `${BASE_URL}/api/education/live-tests`,
      {
        cache: "no-store",
        headers: {
          accept: "application/json",
          "x-gyan-load-test": "10-testers",
        },
      }
    );

    const elapsedMs =
      Math.round(
        performance.now() - started
      );

    const body =
      await response.json();

    return {
      tester,
      requestNo,
      status: response.status,
      ok: response.ok,
      elapsedMs,
      tests: Array.isArray(body.liveTests)
        ? body.liveTests.length
        : 0,
    };
  } catch (error) {
    return {
      tester,
      requestNo,
      status: 0,
      ok: false,
      elapsedMs: Math.round(
        performance.now() - started
      ),
      tests: 0,
      error:
        error instanceof Error
          ? error.message
          : String(error),
    };
  }
}

async function runTester(id) {
  await sleep((id - 1) * 75);

  const results = [];

  for (
    let requestNo = 1;
    requestNo <= REQUESTS_PER_TESTER;
    requestNo += 1
  ) {
    const result =
      await requestOnce(
        id,
        requestNo
      );

    results.push(result);

    console.log(
      `Tester ${String(id).padStart(2, "0")} ` +
      `/ ${requestNo}: ` +
      `${result.status || "ERR"} · ` +
      `${result.elapsedMs} ms · ` +
      `tests=${result.tests}`
    );

    if (
      requestNo <
      REQUESTS_PER_TESTER
    ) {
      await sleep(PAUSE_MS);
    }
  }

  return results;
}

const started =
  performance.now();

const results =
  (
    await Promise.all(
      Array.from(
        { length: TESTERS },
        (_, index) =>
          runTester(index + 1)
      )
    )
  ).flat();

const successful =
  results.filter(
    (result) => result.ok
  );

const failed =
  results.filter(
    (result) => !result.ok
  );

const times =
  successful
    .map(
      (result) =>
        result.elapsedMs
    )
    .sort(
      (a, b) => a - b
    );

function percentile(value) {
  if (times.length === 0) {
    return 0;
  }

  const index =
    Math.min(
      times.length - 1,
      Math.ceil(
        times.length * value
      ) - 1
    );

  return times[index];
}

const average =
  times.length > 0
    ? Math.round(
        times.reduce(
          (sum, value) =>
            sum + value,
          0
        ) / times.length
      )
    : 0;

console.log("");
console.log(
  "--- GYAN 10-tester summary ---"
);

console.log(
  `Success: ${successful.length}/${results.length}`
);

console.log(
  `Failed:  ${failed.length}/${results.length}`
);

console.log(
  `Average: ${average} ms`
);

console.log(
  `p50:     ${percentile(0.50)} ms`
);

console.log(
  `p95:     ${percentile(0.95)} ms`
);

console.log(
  `Max:     ${times.at(-1) ?? 0} ms`
);

console.log(
  `Wall:    ${Math.round(
    performance.now() - started
  )} ms`
);

if (failed.length > 0) {
  process.exitCode = 1;
}