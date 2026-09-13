import fs from "node:fs";
import path from "node:path";

const root = process.cwd();
const workerPath = path.join(root, "worker", "liveTests.ts");
const runnerPath = path.join(root, "src", "components", "LiveTestRunner.tsx");

for (const file of [workerPath, runnerPath]) {
  if (!fs.existsSync(file)) {
    throw new Error(`Missing required file: ${file}`);
  }
}

function backup(file) {
  const backupPath = `${file}.before-question-paper.bak`;
  if (!fs.existsSync(backupPath)) {
    fs.copyFileSync(file, backupPath);
  }
}

function replaceOnce(text, before, after, label) {
  const index = text.indexOf(before);
  if (index < 0) {
    throw new Error(`Patch anchor not found: ${label}`);
  }
  if (text.indexOf(before, index + before.length) >= 0) {
    throw new Error(`Patch anchor is not unique: ${label}`);
  }
  return text.slice(0, index) + after + text.slice(index + before.length);
}

// ============================================================
// worker/liveTests.ts
// ============================================================
let worker = fs.readFileSync(workerPath, "utf8");

if (!worker.includes("unlockLiveTestQuestionPaper")) {
  const functionAnchor = "async function unlockLiveTestReport(";

  const questionPaperFunction = String.raw`
async function unlockLiveTestQuestionPaper(
  request:
    Request,

  env:
    LiveTestsEnv,
): Promise<Response> {
  const questionPaperCost =
    3;

  let body:
    {
      code?:
        unknown;
    };

  try {
    body =
      await request.json() as {
        code?:
          unknown;
      };
  } catch {
    return liveJson(
      {
        error:
          "Invalid request body.",
      },
      400,
    );
  }

  const code =
    typeof body.code ===
      "string"
      ? body.code
          .trim()
          .toUpperCase()
          .replace(
            /^#/,
            "",
          )
      : "";

  if (!code) {
    return liveJson(
      {
        error:
          "Live test code is required.",
      },
      400,
    );
  }

  const owner =
    await currentGyanOwner(
      request,
      env,
    );

  if (!owner) {
    return liveJson(
      {
        error:
          "Open your GYAN Card on this device before viewing the question paper.",
      },
      401,
    );
  }

  const test =
    await env.gyan_registry
      .prepare(
        \`
        SELECT
          id,
          series_number,
          series_suffix,
          public_code,
          program_code,
          starts_at_utc,
          schedule_timezone,
          duration_minutes,
          entry_gem_cost,
          report_gem_cost,
          status,
          test_fraction_percent,
          event_kind,
          source_schedule_date,
          0 AS total_participants,
          0 AS human_participants,
          0 AS synthetic_participants
        FROM education_live_tests
        WHERE upper(public_code) = ?
        LIMIT 1
        \`,
      )
      .bind(
        code,
      )
      .first<LiveTestRow>();

  if (!test) {
    return liveJson(
      {
        error:
          "Live Test not found.",
      },
      404,
    );
  }

  if (
    isAdminTest(
      test,
    )
  ) {
    return liveJson(
      {
        error:
          "Admin Test #101 does not use the paid question-paper route.",
      },
      400,
    );
  }

  const state =
    liveTestState(
      test,
    );

  if (
    state !==
      "OVER"
  ) {
    return liveJson(
      {
        state,
        error:
          state ===
            "NOT_STARTED"
            ? "The question paper becomes available after the Live Test ends."
            : state ===
                "OPEN"
              ? "The question paper becomes available after the Live Test ends."
              : "This Live Test is unavailable.",
      },
      409,
    );
  }

  const questionReason =
    \`LIVE_TEST_QUESTIONS:\${test.public_code}\`;

  const reportReason =
    \`LIVE_TEST_REPORT:\${test.public_code}\`;

  const priorLedgerUnlock =
    await env.gyan_registry
      .prepare(
        \`
        SELECT reason
        FROM gem_transactions
        WHERE
          calendar_access_id = ?
          AND reason IN (?, ?)
        LIMIT 1
        \`,
      )
      .bind(
        owner.calendarAccessId,
        questionReason,
        reportReason,
      )
      .first<{
        reason:
          string;
      }>();

  const priorReportFlag =
    await env.gyan_registry
      .prepare(
        \`
        SELECT report_unlocked_at
        FROM education_live_entries
        WHERE
          live_test_id = ?
          AND participant_type = 'GYAN'
          AND participant_key = ?
          AND report_unlocked_at IS NOT NULL
        LIMIT 1
        \`,
      )
      .bind(
        test.id,
        String(
          owner.accountId,
        ),
      )
      .first<{
        report_unlocked_at:
          string;
      }>();

  let alreadyUnlocked =
    Boolean(
      priorLedgerUnlock,
    ) ||
    Boolean(
      priorReportFlag,
    );

  let gemCharged =
    0;

  if (
    !alreadyUnlocked &&
    questionPaperCost >
      0
  ) {
    const charge =
      await env.gyan_registry
        .prepare(
          \`
          INSERT OR IGNORE INTO gem_transactions (
            calendar_access_id,
            amount,
            reason
          )
          SELECT
            ?,
            ?,
            ?
          WHERE
            (
              SELECT
                COALESCE(
                  SUM(amount),
                  0
                )
              FROM gem_transactions
              WHERE calendar_access_id = ?
            ) >= ?
          \`,
        )
        .bind(
          owner.calendarAccessId,
          -questionPaperCost,
          questionReason,
          owner.calendarAccessId,
          questionPaperCost,
        )
        .run();

    const charged =
      Number(
        charge.meta?.changes ??
        0,
      ) > 0;

    if (
      charged
    ) {
      gemCharged =
        questionPaperCost;
    } else {
      const raceSafePriorCharge =
        await env.gyan_registry
          .prepare(
            \`
            SELECT id
            FROM gem_transactions
            WHERE
              calendar_access_id = ?
              AND reason = ?
            LIMIT 1
            \`,
          )
          .bind(
            owner.calendarAccessId,
            questionReason,
          )
          .first<{
            id:
              number;
          }>();

      if (
        !raceSafePriorCharge
      ) {
        return liveJson(
          {
            error:
              \`You need \${questionPaperCost} Gems to view this Live Test question paper.\`,
            requiredGems:
              questionPaperCost,
            gemBalance:
              await gemBalance(
                env,
                owner.calendarAccessId,
              ),
          },
          402,
        );
      }

      alreadyUnlocked =
        true;
    }
  }

  const rows =
    await env.gyan_registry
      .prepare(
        \`
        SELECT
          lq.question_order,
          lq.section_code,
          q.id AS question_id,
          q.difficulty,
          q.question_text,
          q.choice_a,
          q.choice_b,
          q.choice_c,
          q.choice_d
        FROM education_live_test_questions lq
        JOIN education_questions q
          ON q.id = lq.question_id
        WHERE lq.live_test_id = ?
        ORDER BY lq.question_order
        \`,
      )
      .bind(
        test.id,
      )
      .all<{
        question_order:
          number;
        section_code:
          string | null;
        question_id:
          number;
        difficulty:
          string;
        question_text:
          string;
        choice_a:
          string;
        choice_b:
          string;
        choice_c:
          string;
        choice_d:
          string;
      }>();

  if (
    rows.results.length ===
      0
  ) {
    return liveJson(
      {
        error:
          "Live Test question paper is not available.",
      },
      404,
    );
  }

  return liveJson({
    unlocked:
      true,
    alreadyUnlocked,
    gemCharged,
    gemBalance:
      await gemBalance(
        env,
        owner.calendarAccessId,
      ),
    questionPaperGemCost:
      questionPaperCost,
    liveTest: {
      code:
        test.public_code,
      program:
        test.program_code,
      state:
        "OVER",
      questionCount:
        rows.results.length,
    },
    questions:
      rows.results.map(
        (
          row,
        ) => ({
          questionOrder:
            Number(
              row.question_order,
            ),
          questionId:
            Number(
              row.question_id,
            ),
          section:
            row.section_code,
          difficulty:
            row.difficulty,
          questionText:
            row.question_text,
          choices: {
            A:
              row.choice_a,
            B:
              row.choice_b,
            C:
              row.choice_c,
            D:
              row.choice_d,
          },
        }),
      ),
  });
}


`;

  const index = worker.indexOf(functionAnchor);
  if (index < 0) {
    throw new Error("Patch anchor not found: unlockLiveTestReport function");
  }

  worker =
    worker.slice(0, index) +
    questionPaperFunction +
    worker.slice(index);

  const routeAnchor = `  if (\n    request.method ===\n      "POST" &&\n    url.pathname ===\n      "/api/education/live-tests/report/unlock"\n  ) {\n    return unlockLiveTestReport(\n      request,\n      env,\n    );\n  }\n`;

  const routeBlock = `  if (\n    request.method ===\n      "POST" &&\n    url.pathname ===\n      "/api/education/live-tests/questions/unlock"\n  ) {\n    return unlockLiveTestQuestionPaper(\n      request,\n      env,\n    );\n  }\n\n${routeAnchor}`;

  worker = replaceOnce(
    worker,
    routeAnchor,
    routeBlock,
    "Live Test report unlock route",
  );
}

backup(workerPath);
fs.writeFileSync(workerPath, worker, "utf8");

// ============================================================
// src/components/LiveTestRunner.tsx
// ============================================================
let runner = fs.readFileSync(runnerPath, "utf8");

if (!runner.includes("unlockQuestionPaper")) {
  const stateAnchor = `  const [\n    reportGemCost,\n    setReportGemCost,\n  ] =\n    useState(15);\n`;

  const stateBlock = `${stateAnchor}\n  const [\n    questionPaper,\n    setQuestionPaper,\n  ] =\n    useState<\n      LiveQuestion[] |\n      null\n    >(null);\n\n  const questionPaperGemCost =\n    3;\n`;

  runner = replaceOnce(
    runner,
    stateAnchor,
    stateBlock,
    "reportGemCost state",
  );

  const unlockReportAnchor = "  async function unlockReport():\n    Promise<void> {";
  const unlockReportIndex = runner.indexOf(unlockReportAnchor);
  if (unlockReportIndex < 0) {
    throw new Error("Patch anchor not found: unlockReport function");
  }

  const questionPaperFunction = String.raw`  async function unlockQuestionPaper():
    Promise<void> {
    setLoading(
      true,
    );

    setError("");

    try {
      const response =
        await fetch(
          "/api/education/live-tests/questions/unlock",
          {
            method:
              "POST",

            credentials:
              "include",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                code,
              }),
          },
        );

      const body =
        await response.json() as {
          questions?:
            LiveQuestion[];

          gemCharged?:
            number;

          alreadyUnlocked?:
            boolean;

          error?:
            string;
        };

      if (
        !response.ok ||
        !body.questions
      ) {
        throw new Error(
          body.error ??
          "Live Test question paper could not be opened.",
        );
      }

      setQuestionPaper(
        body.questions,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Live Test question paper could not be opened.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


`;

  runner =
    runner.slice(0, unlockReportIndex) +
    questionPaperFunction +
    runner.slice(unlockReportIndex);

  const submittedAnchor = `  if (\n    submitted\n  ) {`;
  const paperScreen = String.raw`  if (
    questionPaper
  ) {
    return (
      <main className="live-test-runner">
        <header className="live-test-runner__header">
          <button
            type="button"
            onClick={() =>
              setQuestionPaper(
                null,
              )
            }
            aria-label="Back to Live Test"
          >
            ←
          </button>

          <strong>
            👀 Live Test #{code}
          </strong>
        </header>

        {
          error && (
            <div className="live-test-runner__error">
              {error}
            </div>
          )
        }

        <section className="live-test-runner__admin-result">
          <div className="live-test-runner__result-heading">
            <span aria-hidden="true">
              📝
            </span>

            <div>
              <h1>
                Question Paper
              </h1>

              <small>
                {questionPaper.length} questions · questions and choices only
              </small>
            </div>
          </div>

          <p>
            Correct answers, score and explanations remain part of the detailed 💎{reportGemCost} report.
          </p>

          <div className="live-test-runner__questions">
            {
              questionPaper.map(
                (
                  question,
                ) => (
                  <article
                    key={question.questionId}
                    className="live-test-runner__question"
                  >
                    <header>
                      <strong>
                        {question.questionOrder}.
                      </strong>

                      <span>
                        {question.section ?? "Question"}
                      </span>
                    </header>

                    <p>
                      {question.questionText}
                    </p>

                    <div className="live-test-runner__choices">
                      {
                        (
                          [
                            "A",
                            "B",
                            "C",
                            "D",
                          ] as const
                        ).map(
                          (
                            choice,
                          ) => (
                            <div
                              key={choice}
                              className="live-test-runner__choice"
                              style={{
                                cursor:
                                  "default",
                              }}
                            >
                              <b>
                                {choice}
                              </b>

                              <span>
                                {question.choices[choice]}
                              </span>
                            </div>
                          ),
                        )
                      }
                    </div>
                  </article>
                ),
              )
            }
          </div>

          <button
            type="button"
            className="live-test-runner__result-back"
            onClick={() =>
              setQuestionPaper(
                null,
              )
            }
          >
            Back to Live Test
          </button>
        </section>
      </main>
    );
  }


${submittedAnchor}`;

  runner = replaceOnce(
    runner,
    submittedAnchor,
    paperScreen,
    "submitted render",
  );

  const submittedActionsAnchor = `                <div className="live-test-runner__done-actions">\n                  <button\n                    type="button"\n                    disabled={\n                      loading\n                    }\n                    onClick={() =>\n                      void unlockReport()\n                    }\n                  >`;

  const submittedActionsBlock = `                <div className="live-test-runner__done-actions">\n                  {\n                    !isAdminTest && (\n                      <button\n                        type="button"\n                        disabled={\n                          loading\n                        }\n                        onClick={() =>\n                          void unlockQuestionPaper()\n                        }\n                      >\n                        {\n                          loading\n                            ? "Opening…"\n                            : \`View Questions · 💎\${questionPaperGemCost}\`\n                        }\n                      </button>\n                    )\n                  }\n\n                  <button\n                    type="button"\n                    disabled={\n                      loading\n                    }\n                    onClick={() =>\n                      void unlockReport()\n                    }\n                  >`;

  runner = replaceOnce(
    runner,
    submittedActionsAnchor,
    submittedActionsBlock,
    "submitted report actions",
  );

  const endedButtonAnchor = `              </button>\n            </section>\n          )\n          : (`;

  const endedActions = `              </button>\n\n              {\n                isScheduledOver &&\n                !isAdminTest && (\n                  <div className="live-test-runner__done-actions">\n                    <button\n                      type="button"\n                      disabled={\n                        loading\n                      }\n                      onClick={() =>\n                        void unlockQuestionPaper()\n                      }\n                    >\n                      {\n                        loading\n                          ? "Opening…"\n                          : \`View Questions · 💎\${questionPaperGemCost}\`\n                      }\n                    </button>\n\n                    <button\n                      type="button"\n                      className="live-test-runner__secondary"\n                      onClick={\n                        onBack\n                      }\n                    >\n                      Back to Education\n                    </button>\n                  </div>\n                )\n              }\n            </section>\n          )\n          : (`;

  // Use the LAST occurrence before the active-test branch, because an earlier
  // </button></section> sequence exists in the submitted result screen.
  const endedIndex = runner.lastIndexOf(endedButtonAnchor);
  if (endedIndex < 0) {
    throw new Error("Patch anchor not found: ended Live Test button");
  }
  runner =
    runner.slice(0, endedIndex) +
    endedActions +
    runner.slice(endedIndex + endedButtonAnchor.length);
}

backup(runnerPath);
fs.writeFileSync(runnerPath, runner, "utf8");

console.log("Patched:");
console.log("  worker/liveTests.ts");
console.log("  src/components/LiveTestRunner.tsx");
console.log("");
console.log("Feature:");
console.log("  Ended Live Test -> View Questions · 💎3");
console.log("  Permanent unlock via gem transaction reason LIVE_TEST_QUESTIONS:<code>");
console.log("  Existing 💎15 report unlock also grants question-paper access without another charge.");
console.log("  Question paper never returns correct answers, scores, or explanations.");
