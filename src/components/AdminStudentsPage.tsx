import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./AdminStudentsPage.css";


type StudentKind =
  | "registered"
  | "trial"
  | "inactive";


interface AdminStudent {
  code: string;
  accessCode: string;
  displayName: string;
  email: string;
  status: string;
  kind: StudentKind;
  guestStartedAt: string | null;
  guestExpiresAt: string | null;
  claimedAt: string | null;
  expiresAt: string | null;
  attemptCount: number;
  lastAttemptAt: string | null;
}


interface AdminStudentsResponse {
  students?: AdminStudent[];
  error?: string;
}


interface AdminStudentsPageProps {
  onBack: () => void;
}


function kindLabel(
  kind: StudentKind,
): string {
  if (
    kind ===
      "registered"
  ) {
    return "Registered";
  }

  if (
    kind ===
      "trial"
  ) {
    return "Trial";
  }

  return "Inactive";
}


export default function AdminStudentsPage({
  onBack,
}: AdminStudentsPageProps) {
  const [
    query,
    setQuery,
  ] =
    useState("");

  const [
    filter,
    setFilter,
  ] =
    useState<
      "all" |
      StudentKind
    >(
      "all",
    );

  const [
    students,
    setStudents,
  ] =
    useState<AdminStudent[]>(
      [],
    );

  const [
    loading,
    setLoading,
  ] =
    useState(false);

  const [
    error,
    setError,
  ] =
    useState("");

  const [
    selected,
    setSelected,
  ] =
    useState<AdminStudent | null>(
      null,
    );

  const [
    editName,
    setEditName,
  ] =
    useState("");

  const [
    editEmail,
    setEditEmail,
  ] =
    useState("");

  const [
    saving,
    setSaving,
  ] =
    useState(false);

  const [
    message,
    setMessage,
  ] =
    useState("");


  useEffect(
    () => {
      const controller =
        new AbortController();

      const timer =
        window.setTimeout(
          () => {
            const parameters =
              new URLSearchParams();

            if (
              query.trim()
            ) {
              parameters.set(
                "q",
                query.trim(),
              );
            }

            if (
              filter !==
                "all"
            ) {
              parameters.set(
                "filter",
                filter,
              );
            }

            setLoading(
              true,
            );

            setError(
              "",
            );

            void fetch(
              `/api/admin/students?${parameters.toString()}`,
              {
                credentials:
                  "include",

                cache:
                  "no-store",

                signal:
                  controller.signal,
              },
            )
              .then(
                async (
                  response,
                ) => {
                  const body =
                    await response.json() as
                      AdminStudentsResponse;

                  if (
                    !response.ok
                  ) {
                    throw new Error(
                      body.error ??
                      "Students could not be loaded.",
                    );
                  }

                  return (
                    body.students ??
                    []
                  );
                },
              )
              .then(
                (
                  loaded,
                ) => {
                  if (
                    controller.signal
                      .aborted
                  ) {
                    return;
                  }

                  setStudents(
                    loaded,
                  );
                },
              )
              .catch(
                (
                  caught,
                ) => {
                  if (
                    caught instanceof
                      DOMException &&
                    caught.name ===
                      "AbortError"
                  ) {
                    return;
                  }

                  setError(
                    caught instanceof
                      Error
                      ? caught.message
                      : "Students could not be loaded.",
                  );
                },
              )
              .finally(
                () => {
                  if (
                    !controller.signal
                      .aborted
                  ) {
                    setLoading(
                      false,
                    );
                  }
                },
              );
          },
          180,
        );

      return () => {
        window.clearTimeout(
          timer,
        );

        controller.abort();
      };
    },
    [
      query,
      filter,
    ],
  );


  const counts =
    useMemo(
      () => ({
        registered:
          students.filter(
            (
              student,
            ) =>
              student.kind ===
              "registered",
          ).length,

        trial:
          students.filter(
            (
              student,
            ) =>
              student.kind ===
              "trial",
          ).length,

        inactive:
          students.filter(
            (
              student,
            ) =>
              student.kind ===
              "inactive",
          ).length,
      }),
      [
        students,
      ],
    );


  function openStudent(
    student:
      AdminStudent,
  ): void {
    setSelected(
      student,
    );

    setEditName(
      student.displayName,
    );

    setEditEmail(
      student.email,
    );

    setMessage(
      "",
    );

    setError(
      "",
    );
  }


  async function saveStudent():
    Promise<void> {
    if (
      !selected
    ) {
      return;
    }

    const email =
      editEmail
        .trim()
        .toLowerCase();

    if (
      email &&
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        email,
      )
    ) {
      setError(
        "Enter a valid email address.",
      );

      return;
    }

    setSaving(
      true,
    );

    setError(
      "",
    );

    setMessage(
      "",
    );

    try {
      const response =
        await fetch(
          `/api/admin/students/${encodeURIComponent(
            selected.code,
          )}`,
          {
            method:
              "PATCH",

            credentials:
              "include",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                displayName:
                  editName.trim(),

                email,
              }),
          },
        );

      const body =
        await response.json() as {
          student?: AdminStudent;
          error?: string;
        };

      if (
        !response.ok ||
        !body.student
      ) {
        throw new Error(
          body.error ??
          "Student could not be updated.",
        );
      }

      setSelected(
        body.student,
      );

      setStudents(
        (
          current,
        ) =>
          current.map(
            (
              student,
            ) =>
              student.code ===
                body.student
                  ?.code
                ? body.student
                : student,
          ),
      );

      setMessage(
        "✓ Student updated.",
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Student could not be updated.",
      );
    } finally {
      setSaving(
        false,
      );
    }
  }


  async function sendVerification():
    Promise<void> {
    if (
      !selected
    ) {
      return;
    }

    const email =
      editEmail
        .trim()
        .toLowerCase();

    if (
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        email,
      )
    ) {
      setError(
        "Save a valid email before sending verification.",
      );

      return;
    }

    setSaving(
      true,
    );

    setError(
      "",
    );

    setMessage(
      "",
    );

    try {
      const response =
        await fetch(
          "/api/auth/magic-link",
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
                email,

                returnTo:
                  `/student/${selected.code}`,
              }),
          },
        );

      const body =
        await response.json() as {
          error?: string;
        };

      if (
        !response.ok
      ) {
        throw new Error(
          body.error ??
          "Verification link could not be sent.",
        );
      }

      setMessage(
        `✉ Verification link sent to ${email}.`,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Verification link could not be sent.",
      );
    } finally {
      setSaving(
        false,
      );
    }
  }


  return (
    <main className="admin-students">
      <header className="admin-students__header">
        <button
          type="button"
          onClick={
            onBack
          }
          aria-label="Back to Admin"
        >
          ←
        </button>

        <div>
          <strong>
            🎓 Students
          </strong>

          <small>
            GYAN learner administration
          </small>
        </div>
      </header>

      <section className="admin-students__toolbar">
        <input
          type="search"
          value={
            query
          }
          placeholder="Search ABCD code, display name or email"
          onChange={(
            event,
          ) =>
            setQuery(
              event.target.value,
            )
          }
        />

        <div className="admin-students__filters">
          {
            (
              [
                [
                  "all",
                  "All",
                ],
                [
                  "registered",
                  "Registered",
                ],
                [
                  "trial",
                  "Trial",
                ],
                [
                  "inactive",
                  "Inactive",
                ],
              ] as const
            ).map(
              (
                [
                  value,
                  label,
                ],
              ) => (
                <button
                  key={
                    value
                  }
                  type="button"
                  className={
                    filter ===
                      value
                      ? "active"
                      : ""
                  }
                  onClick={() =>
                    setFilter(
                      value,
                    )
                  }
                >
                  {label}
                </button>
              ),
            )
          }
        </div>
      </section>

      <section className="admin-students__summary">
        <span>
          Registered {counts.registered}
        </span>

        <span>
          Trial {counts.trial}
        </span>

        <span>
          Inactive {counts.inactive}
        </span>
      </section>

      {
        loading && (
          <div className="admin-students__state">
            Loading students…
          </div>
        )
      }

      {
        error && (
          <div className="admin-students__error">
            {error}
          </div>
        )
      }

      <section className="admin-students__list">
        {
          students.map(
            (
              student,
            ) => (
              <button
                key={
                  student.code
                }
                type="button"
                className="admin-students__row"
                onClick={() =>
                  openStudent(
                    student,
                  )
                }
              >
                <strong>
                  {student.code}
                </strong>

                <span>
                  {student.displayName}
                </span>

                <small>
                  {student.email ||
                    "No email"}
                </small>

                <b
                  className={`admin-students__kind admin-students__kind--${student.kind}`}
                >
                  {kindLabel(
                    student.kind,
                  )}
                </b>

                <em>
                  {student.attemptCount} attempts
                </em>
              </button>
            ),
          )
        }

        {
          !loading &&
          students.length ===
            0 && (
            <div className="admin-students__state">
              No matching students.
            </div>
          )
        }
      </section>

      {
        selected && (
          <div
            className="admin-students__detail-overlay"
            role="presentation"
            onClick={() =>
              setSelected(
                null,
              )
            }
          >
            <section
              className="admin-students__detail"
              role="dialog"
              aria-modal="true"
              aria-label={`Student ${selected.code}`}
              onClick={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <header>
                <div>
                  <strong>
                    {selected.displayName}
                  </strong>

                  <small>
                    GYAN [{selected.code}] · {kindLabel(
                      selected.kind,
                    )}
                  </small>
                </div>

                <button
                  type="button"
                  aria-label="Close"
                  onClick={() =>
                    setSelected(
                      null,
                    )
                  }
                >
                  ×
                </button>
              </header>

              <label>
                Display name
                <input
                  type="text"
                  value={
                    editName
                  }
                  maxLength={
                    80
                  }
                  onChange={(
                    event,
                  ) =>
                    setEditName(
                      event.target.value,
                    )
                  }
                />
              </label>

              <label>
                Recovery email
                <input
                  type="email"
                  value={
                    editEmail
                  }
                  placeholder="Optional during trial"
                  onChange={(
                    event,
                  ) =>
                    setEditEmail(
                      event.target.value,
                    )
                  }
                />
              </label>

              <div className="admin-students__facts">
                <span>
                  Access Code
                  <strong>
                    {selected.accessCode}
                  </strong>
                </span>

                <span>
                  Status
                  <strong>
                    {selected.status}
                  </strong>
                </span>

                <span>
                  Attempts
                  <strong>
                    {selected.attemptCount}
                  </strong>
                </span>

                <span>
                  Trial expires
                  <strong>
                    {selected.guestExpiresAt ||
                      "—"}
                  </strong>
                </span>

                <span>
                  Account expires
                  <strong>
                    {selected.expiresAt ||
                      "—"}
                  </strong>
                </span>
              </div>

              {
                error && (
                  <div className="admin-students__error">
                    {error}
                  </div>
                )
              }

              {
                message && (
                  <div className="admin-students__message">
                    {message}
                  </div>
                )
              }

              <div className="admin-students__actions">
                <button
                  type="button"
                  disabled={
                    saving
                  }
                  onClick={() =>
                    void saveStudent()
                  }
                >
                  {saving
                    ? "Saving…"
                    : "Save Details"}
                </button>

                <button
                  type="button"
                  disabled={
                    saving ||
                    !editEmail.trim()
                  }
                  onClick={() =>
                    void sendVerification()
                  }
                >
                  ✉ Send Verification Link
                </button>
              </div>
            </section>
          </div>
        )
      }
    </main>
  );
}
