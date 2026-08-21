import {
  useEffect,
  useState,
} from "react";

import {
  loadStudentReport,
  sendStudentAccessLink,
  type StudentReport,
  type StudentReportTopic,
} from "../config/studentProgress";

import "./StudentProgressPage.css";

interface StudentProgressPageProps {
  studentCode: string;
  onBack: () => void;
  onContinueLearning: (
    student: {
      country: string;
      grade: string;
    },
  ) => void;
}

function heatState(
  item: StudentReportTopic,
): "green" | "yellow" | "red" | "none" {
  if (item.scorePercent == null) return "none";
  if (item.scorePercent >= 80) return "green";
  if (item.scorePercent >= 50) return "yellow";
  return "red";
}

function gradeLabel(code: string): string {
  if (code === "PREK") return "Pre-K";
  if (code === "K") return "K";

  const match = code.match(/^GRADE_(\d+)$/);
  return match ? `Grade ${match[1]}` : code;
}

export default function StudentProgressPage({
  studentCode,
  onBack,
  onContinueLearning,
}: StudentProgressPageProps) {
  const [report, setReport] =
    useState<StudentReport | null>(null);

  const [loading, setLoading] =
    useState(true);

  const [requiresSignIn, setRequiresSignIn] =
    useState(false);

  const [email, setEmail] =
    useState("");

  const [sending, setSending] =
    useState(false);

  const [sent, setSent] =
    useState(false);

  const [error, setError] =
    useState("");

  useEffect(() => {
    let active = true;

    setLoading(true);
    setRequiresSignIn(false);
    setError("");

    void loadStudentReport(studentCode)
      .then((value) => {
        if (active) setReport(value);
      })
      .catch((caught) => {
        if (!active) return;

        const status =
          (caught as Error & { status?: number }).status;

        if (status === 401 || status === 404) {
          setRequiresSignIn(true);
          return;
        }

        setError(
          caught instanceof Error
            ? caught.message
            : "Student progress could not be loaded.",
        );
      })
      .finally(() => {
        if (active) setLoading(false);
      });

    return () => {
      active = false;
    };
  }, [studentCode]);

  async function sendAccess(): Promise<void> {
    const normalized =
      email.trim().toLowerCase();

    if (
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        normalized,
      )
    ) {
      setError(
        "Enter the email used to save this GYAN card.",
      );
      return;
    }

    setSending(true);
    setError("");

    try {
      await sendStudentAccessLink(
        normalized,
        studentCode,
      );
      setSent(true);
    } catch (caught) {
      setError(
        caught instanceof Error
          ? caught.message
          : "Verification email could not be sent.",
      );
    } finally {
      setSending(false);
    }
  }

  return (
    <main className="student-progress">
      <header className="student-progress__header">
        <button
          type="button"
          onClick={onBack}
          aria-label="Back"
        >
          ←
        </button>

        <div>
          <strong>🎓 Education</strong>
          <small>
            GYAN Card · {studentCode}
          </small>
        </div>
      </header>

      {loading && (
        <div className="student-progress__state">
          Loading GYAN card…
        </div>
      )}

      {error && (
        <div className="student-progress__error">
          {error}
        </div>
      )}

      {!loading &&
        requiresSignIn &&
        !report && (
          <section className="student-progress__verify">
            <span>🔐</span>

            <h1>Open GYAN Card</h1>

            <p>
              Verify the email used when this student
              card was saved.
            </p>

            {sent ? (
              <div className="student-progress__sent">
                <strong>✉️ Check your email</strong>
                <small>
                  The secure link will return directly
                  to student card {studentCode}.
                </small>
              </div>
            ) : (
              <>
                <input
                  type="email"
                  inputMode="email"
                  autoComplete="email"
                  placeholder="Email"
                  value={email}
                  onChange={(event) =>
                    setEmail(event.target.value)
                  }
                  onKeyDown={(event) => {
                    if (event.key === "Enter") {
                      void sendAccess();
                    }
                  }}
                />

                <button
                  type="button"
                  disabled={sending}
                  onClick={() =>
                    void sendAccess()
                  }
                >
                  {sending
                    ? "Sending…"
                    : "Send Verification Link"}
                </button>
              </>
            )}

            <small className="student-progress__privacy">
              The 4-character code identifies a card;
              it does not unlock saved progress by itself.
            </small>
          </section>
        )}

      {!loading && report && (
        <>
          <section className="student-progress__identity">
            <div>
              <span>Student</span>
              <strong>{report.student.name}</strong>
            </div>

            <div>
              <span>Level</span>
              <strong>
                {gradeLabel(report.student.grade)}
              </strong>
            </div>

            <div>
              <span>Code</span>
              <strong className="student-progress__code">
                {report.student.code}
              </strong>
            </div>
          </section>

          <section className="student-progress__map">
            <div className="student-progress__map-title">
              <h1>Learning Map</h1>
              <small>
                🟢 Strong · 🟡 Developing · 🔴 Needs Practice · ⚪ Not attempted
              </small>
            </div>

            <div className="student-progress__heatmap">
              {report.report.map((item) => (
                <div
                  key={item.code}
                  className={
                    `student-progress__topic student-progress__topic--${heatState(item)}`
                  }
                >
                  <strong>{item.name}</strong>

                  <span>
                    {item.scorePercent == null
                      ? "Not attempted"
                      : `${item.scorePercent}%`}
                  </span>

                  {item.attempts > 0 && (
                    <small>
                      {item.correctAnswers} /{" "}
                      {item.questionsAnswered} correct ·{" "}
                      {item.attempts}{" "}
                      {item.attempts === 1
                        ? "attempt"
                        : "attempts"}
                    </small>
                  )}
                </div>
              ))}
            </div>
          </section>

          <button
            type="button"
            className="student-progress__primary"
            onClick={() =>
              onContinueLearning({
                country: report.student.country,
                grade: report.student.grade,
              })
            }
          >
            Continue Learning
          </button>
        </>
      )}
    </main>
  );
}
