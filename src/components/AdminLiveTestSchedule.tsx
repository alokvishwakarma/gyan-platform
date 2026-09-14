import {
  useCallback,
  useEffect,
  useState,
  type MouseEvent,
} from "react";

import "./AdminLiveTestSchedule.css";
import "./AdminLiveTestSchedule.batch.css";


type Program =
  | "JEE"
  | "NEET"
  | "SAT";


type VisibilityMode =
  | "AUTO"
  | "SHOW"
  | "HIDE";


type AdminLiveTestItem = {
  id: number;
  code: string;
  program: string;
  scheduleDate: string | null;
  scheduleTimezone: string;
  localDate: string;
  localTime: string;
  startsAtUtc: string;
  durationMinutes: number;
  visible: boolean;
  visibilityMode: VisibilityMode;
  status: string;
  frozenQuestions: number;
  expectedQuestions: number;
  ready: boolean;
  eventKind?: string | null;
  createdAt: string;
  adminModifiedAt: string | null;
};


type AdminLiveClassItem = {
  scheduleDate:
    string;

  program:
    Program;

  subject:
    string;

  topicCode:
    string | null;

  topicName:
    string;

  startLocal:
    string;

  endLocal:
    string;

  scheduleTimezone:
    string;

  sequenceNumber:
    number;

  createdAt:
    string;

  adminModifiedAt:
    string | null;
};


type AdminLiveTestPolicy = {
  program:
    Program;

  country:
    "IN" |
    "US";

  scheduleTimezone:
    string;

  localTime:
    string;

  durationMinutes:
    number;

  questionCount:
    number;

  testFractionPercent:
    number;

  active:
    boolean;
};


type BatchExam =
  | 'JEE'
  | 'NEET'
  | 'SAT'
  | 'GRE'
  | 'OLSAT';


type TestBatchDefinition = {
  batch_code: string;
  label: string;
  start_date: string;
  end_date: string;
  sort_order: number;
  active: number;
};


type BatchProgramStatus = {
  program: BatchExam;
  configured: boolean;
  active: boolean;
  note: string | null;
};


type TestBatchPreview = {
  program: string;
  batchCode: string;
  label: string;
  startDate: string;
  endDate: string;
  configured: boolean;
  weekdayTests: number;
  saturdayTests: number;
  sundayTests: number;
  plannedTests: number;
  missingScheduleDays: number;
  existingAutoTests: number;
  adminTests: number;
};


type ClassBatchPreview = {
  program: string;
  batchCode: string;
  label: string;
  startDate: string;
  endDate: string;
  configured: boolean;
  templateCode: string | null;
  templateLabel: string | null;
  teachingDays: number;
  eligibleDays: number;
  revisionDays: number;
  scheduledDays: number;
  completedTeachingDays: number;
  completedScheduleDays: number;
  normalizedRows: number;
  needsNormalization: boolean;
  subjectCount: number;
  expectedRows: number;
  existingRows: number;
  missingRows: number;
  blackoutDays: number;
};


type AdminLiveTestReviewQuestion = {
  order:
    number;

  questionId:
    number;

  questionKey:
    string;

  section:
    string | null;

  subject:
    string | null;

  topic:
    string | null;

  selectionReason:
    string;

  difficulty:
    string;

  questionText:
    string;

  choices: {
    A:
      string;

    B:
      string;

    C:
      string;

    D:
      string;
  };

  correctChoice:
    string;

  explanation:
    string | null;
};


type AdminLiveTestReview = {
  test: {
    id:
      number;

    code:
      string;

    program:
      string;

    scheduleDate:
      string | null;

    startsAtUtc:
      string;

    scheduleTimezone:
      string;

    durationMinutes:
      number;

    visible:
      boolean;

    visibilityMode:
      VisibilityMode;
  };

  questions:
    AdminLiveTestReviewQuestion[];
};



type ParticipantType =
  | "GYAN"
  | "SYNTHETIC";


type AdminLiveParticipant = {
  participantType:
    ParticipantType;

  participantKey:
    string;

  enteredAt:
    string | null;

  submittedAt:
    string | null;

  attemptId:
    number | null;

  questionCount:
    number;

  answeredCount:
    number;

  correctCount:
    number | null;

  incorrectCount:
    number | null;

  unansweredCount:
    number | null;

  scorePercent:
    number | null;
};


type AdminLiveParticipantSummary = {
  humanCount:
    number;

  botCount:
    number;

  humanSubmitted:
    number;

  botSubmitted:
    number;
};


type AdminLiveParticipantResult = {
  test: {
    code:
      string;

    program:
      string;
  };

  participant: {
    participantType:
      ParticipantType;

    participantKey:
      string;
  };

  attempt: {
    id:
      number;

    questionCount:
      number;

    answeredCount:
      number;

    correctCount:
      number;

    incorrectCount:
      number;

    unansweredCount:
      number;

    scorePercent:
      number;

    startedAt:
      string | null;

    submittedAt:
      string | null;
  };

  questions: {
    questionId:
      number;

    questionOrder:
      number;

    section:
      string | null;

    questionText:
      string;

    choices: {
      A:
        string;

      B:
        string;

      C:
        string;

      D:
        string;
    };

    selectedChoice:
      string | null;

    correctChoice:
      string;

    correct:
      boolean;

    explanation:
      string | null;
  }[];
};


type AdminLiveTestScheduleProps = {
  onBack:
    () => void;
};


function prettyDate(
  value:
    string | null,
): string {
  if (!value) {
    return "—";
  }

  const [
    year,
    month,
    day,
  ] =
    value
      .split("-")
      .map(Number);

  return new Intl.DateTimeFormat(
    undefined,
    {
      month:
        "short",
      day:
        "numeric",
      weekday:
        "short",
    },
  ).format(
    new Date(
      year,
      month - 1,
      day,
    ),
  );
}


export default function AdminLiveTestSchedule({
  onBack,
}: AdminLiveTestScheduleProps) {
  const [
    browserTimezone,
  ] =
    useState(
      () => {
        try {
          return (
            Intl.DateTimeFormat()
              .resolvedOptions()
              .timeZone ||
            "America/Los_Angeles"
          );
        } catch {
          return "America/Los_Angeles";
        }
      },
    );

  const ADMIN_CALENDAR_TIMEZONE_KEY =
    "gyan_admin_calendar_timezone_v1";

  const [
    adminTimezone,
    setAdminTimezone,
  ] =
    useState(
      () => {
        try {
          const saved =
            window.localStorage.getItem(
              ADMIN_CALENDAR_TIMEZONE_KEY,
            );

          if (
            saved &&
            (
              saved.startsWith(
                "America/",
              ) ||
              saved ===
                "Asia/Kolkata"
            )
          ) {
            return saved;
          }
        } catch {
          // Fall back to the browser timezone.
        }

        return browserTimezone;
      },
    );


  function saveAdminTimezone(
    timezone:
      string,
  ): void {
    setAdminTimezone(
      timezone,
    );

    try {
      window.localStorage.setItem(
        ADMIN_CALENDAR_TIMEZONE_KEY,
        timezone,
      );
    } catch {
      // localStorage may be unavailable.
    }
  }


  function locationLabelForTimezone(
    timezone:
      string,
  ): string {
    const known:
      Record<
        string,
        string
      > = {
        "America/Los_Angeles":
          "Riverside, CA",
        "America/New_York":
          "New York, NY",
        "America/Chicago":
          "Chicago, IL",
        "America/Denver":
          "Denver, CO",
        "America/Phoenix":
          "Phoenix, AZ",
        "Asia/Kolkata":
          "India",
        "Asia/Calcutta":
          "India",
      };

    return (
      known[
        timezone
      ] ??
      timezone
        .split("/")
        .pop()
        ?.replaceAll(
          "_",
          " ",
        ) ??
      "Local"
    );
  }

  const [
    country,
    setCountry,
  ] =
    useState<
      "IN" |
      "US"
    >(
      () =>
        browserTimezone ===
          "Asia/Kolkata" ||
        browserTimezone ===
          "Asia/Calcutta"
          ? "IN"
          : "US",
    );

  const [
    tests,
    setTests,
  ] =
    useState<
      AdminLiveTestItem[]
    >([]);


  const [
    policies,
    setPolicies,
  ] =
    useState<
      AdminLiveTestPolicy[]
    >([]);


  const [
    classSchedule,
    setClassSchedule,
  ] =
    useState<
      AdminLiveClassItem[]
    >([]);


  const [
    selectedClass,
    setSelectedClass,
  ] =
    useState<
      AdminLiveClassItem |
      null
    >(null);

  const [
    classDraftStart,
    setClassDraftStart,
  ] =
    useState("");

  const [
    classDraftEnd,
    setClassDraftEnd,
  ] =
    useState("");

  const [
    classSaving,
    setClassSaving,
  ] =
    useState(false);

  const [
    classSaveMessage,
    setClassSaveMessage,
  ] =
    useState("");


  const [
    addEventDraft,
    setAddEventDraft,
  ] = useState<{
    scheduleDate: string;
    program: Program;
    type: "TEST" | "CLASS";
    startLocal: string;
    endLocal: string;
    durationMinutes: number;
    fractionPercent: number;
    subject: string;
    topicName: string;
  } | null>(null);

  const [
    addEventSaving,
    setAddEventSaving,
  ] = useState(false);

  const [
    addEventMessage,
    setAddEventMessage,
  ] = useState("");

  const [
    batchDialogOpen,
    setBatchDialogOpen,
  ] =
    useState(false);

  const [
    testBatchDialogOpen,
    setTestBatchDialogOpen,
  ] =
    useState(false);

  const [
    batchCopying,
    setBatchCopying,
  ] =
    useState(false);

  const [
    batchMessage,
    setBatchMessage,
  ] =
    useState("");

  const [
    loading,
    setLoading,
  ] =
    useState(false);

  const [
    message,
    setMessage,
  ] =
    useState("");

  const [
    testBatches,
    setTestBatches,
  ] = useState<TestBatchDefinition[]>([]);

  const [
    batchPrograms,
    setBatchPrograms,
  ] = useState<BatchProgramStatus[]>([]);

  const [
    batchExam,
    setBatchExam,
  ] = useState<BatchExam>('JEE');

  const [
    selectedTestBatchCode,
    setSelectedTestBatchCode,
  ] = useState('2026_SEP_OCT');


  const [
    calendarBatchStartDate,
    setCalendarBatchStartDate,
  ] = useState<string | null>(
    null,
  );

  const [
    testBatchPreview,
    setTestBatchPreview,
  ] = useState<TestBatchPreview | null>(null);

  const [
    testBatchBusy,
    setTestBatchBusy,
  ] = useState(false);

  const [
    testBatchMessage,
    setTestBatchMessage,
  ] = useState('');


  const [
    classBatchPreview,
    setClassBatchPreview,
  ] = useState<ClassBatchPreview | null>(null);

  const [
    classBatchBusy,
    setClassBatchBusy,
  ] = useState(false);

  const [
    classBatchMessage,
    setClassBatchMessage,
  ] = useState('');


  const [
    nowMs,
    setNowMs,
  ] =
    useState(() =>
      Date.now(),
    );


  const [
    countryPickerOpen,
    setCountryPickerOpen,
  ] =
    useState(false);


  useEffect(
    () => {
      const timer =
        window.setInterval(
          () => {
            setNowMs(
              Date.now(),
            );
          },
          30_000,
        );

      return () => {
        window.clearInterval(
          timer,
        );
      };
    },
    [],
  );

  const [
    savingCode,
    setSavingCode,
  ] =
    useState<
      string | null
    >(null);


  const [
    selectedCode,
    setSelectedCode,
  ] =
    useState<
      string | null
    >(null);


  const [
    review,
    setReview,
  ] =
    useState<
      AdminLiveTestReview |
      null
    >(null);

  const [
    reviewLoading,
    setReviewLoading,
  ] =
    useState(false);

  const [
    reviewError,
    setReviewError,
  ] =
    useState("");


  const [
    participantSummary,
    setParticipantSummary,
  ] =
    useState<
      AdminLiveParticipantSummary |
      null
    >(null);

  const [
    participantSummaryLoading,
  ] =
    useState(false);

  const [
    participantListType,
    setParticipantListType,
  ] =
    useState<
      ParticipantType |
      null
    >(null);

  const [
    participants,
    setParticipants,
  ] =
    useState<
      AdminLiveParticipant[]
    >([]);

  const [
    participantsLoading,
    setParticipantsLoading,
  ] =
    useState(false);

  const [
    participantsError,
    setParticipantsError,
  ] =
    useState("");

  const [
    participantResult,
    setParticipantResult,
  ] =
    useState<
      AdminLiveParticipantResult |
      null
    >(null);

  const [
    participantResultLoading,
    setParticipantResultLoading,
  ] =
    useState(false);

  const [
    participantResultError,
    setParticipantResultError,
  ] =
    useState("");


  const load =
    useCallback(
      async () => {
        setLoading(
          true,
        );

        setMessage(
          "",
        );

        try {
          const response =
            await fetch(
              "/api/admin/live-tests/schedule",
              {
                credentials:
                  "include",

                cache:
                  "no-store",
              },
            );

          const body =
            await response.json() as {
              tests?:
                AdminLiveTestItem[];

              policies?:
                AdminLiveTestPolicy[];

              error?:
                string;
            };

          if (!response.ok) {
            throw new Error(
              body.error ||
              "Unable to load Live Test schedule.",
            );
          }

          setTests(
            Array.isArray(
              body.tests,
            )
              ? body.tests
              : [],
          );

          setPolicies(
            Array.isArray(
              body.policies,
            )
              ? body.policies
              : [],
          );
        } catch (
          error
        ) {
          setTests(
            [],
          );

          setMessage(
            error instanceof
              Error
              ? error.message
              : "Unable to load Live Test schedule.",
          );
        } finally {
          setLoading(
            false,
          );
        }
      },
      [],
    );


  useEffect(
  () => {
    const controller =
      new AbortController();

    void fetch(
      "/api/admin/live-tests/schedule",
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
            await response.json() as {
              tests?:
                AdminLiveTestItem[];

              policies?:
                AdminLiveTestPolicy[];

              error?:
                string;
            };

          if (!response.ok) {
            throw new Error(
              body.error ||
              "Unable to load Live Test schedule.",
            );
          }

          return body;
        },
      )
      .then(
        (
          body,
        ) => {
          if (
            controller.signal.aborted
          ) {
            return;
          }

          setTests(
            Array.isArray(
              body.tests,
            )
              ? body.tests
              : [],
          );

          setPolicies(
            Array.isArray(
              body.policies,
            )
              ? body.policies
              : [],
          );
        },
      )
      .catch(
        (
          error,
        ) => {
          if (
            controller.signal.aborted
          ) {
            return;
          }

          setTests(
            [],
          );

          setMessage(
            error instanceof
              Error
              ? error.message
              : "Unable to load Live Test schedule.",
          );
        },
      );

    return () => {
      controller.abort();
    };
  },
  [],
);


  useEffect(
    () => {
      const controller =
        new AbortController();

      void fetch(
        `/api/admin/live-tests/class-schedule?country=${encodeURIComponent(
          country,
        )}`,
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
              await response.json() as {
                classSchedule?:
                  AdminLiveClassItem[];

                error?:
                  string;
              };

            if (!response.ok) {
              throw new Error(
                body.error ??
                "Class schedule could not be loaded.",
              );
            }

            return body;
          },
        )
        .then(
          (
            body,
          ) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setClassSchedule(
              Array.isArray(
                body.classSchedule,
              )
                ? body.classSchedule
                : [],
            );
          },
        )
        .catch(
          (
            error,
          ) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setClassSchedule(
              [],
            );

            setMessage(
              error instanceof
                Error
                ? error.message
                : "Class schedule could not be loaded.",
            );
          },
        );

      return () => {
        controller.abort();
      };
    },
    [
      country,
    ],
  );


  function updateDraft(
    code:
      string,

    patch:
      Partial<
        AdminLiveTestItem
      >,
  ): void {
    setTests(
      (
        current,
      ) =>
        current.map(
          (
            test,
          ) =>
            test.code ===
              code
              ? {
                  ...test,
                  ...patch,
                }
              : test,
        ),
    );
  }


  async function viewQuestions(
    test:
      AdminLiveTestItem,
  ): Promise<void> {
    setReviewLoading(
      true,
    );

    setReviewError(
      "",
    );

    setReview(
      null,
    );

    try {
      const response =
        await fetch(
          `/api/admin/live-tests/schedule/${encodeURIComponent(
            test.code,
          )}/questions`,
          {
            credentials:
              "include",

            cache:
              "no-store",
          },
        );

      const body =
        await response.json() as
          AdminLiveTestReview & {
            error?:
              string;
          };

      if (!response.ok) {
        throw new Error(
          body.error ||
          "Unable to load frozen questions.",
        );
      }

      setReview(
        body,
      );
    } catch (
      error
    ) {
      setReviewError(
        error instanceof
          Error
          ? error.message
          : "Unable to load frozen questions.",
      );
    } finally {
      setReviewLoading(
        false,
      );
    }
  }


  async function save(
    test:
      AdminLiveTestItem,
  ): Promise<void> {
    setSavingCode(
      test.code,
    );

    setMessage(
      "",
    );

    try {
      const response =
        await fetch(
          `/api/admin/live-tests/schedule/${encodeURIComponent(
            test.code,
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
                visibilityMode:
                  test
                    .visibilityMode,

                localTime:
                  test
                    .localTime,

                durationMinutes:
                  test
                    .durationMinutes,
              }),
          },
        );

      const body =
        await response.json() as {
          error?:
            string;
        };

      if (!response.ok) {
        throw new Error(
          body.error ||
          "Live Test could not be updated.",
        );
      }

      setMessage(
        `✓ ${test.code} saved`,
      );

      await load();
    } catch (
      error
    ) {
      setMessage(
        error instanceof
          Error
          ? error.message
          : "Live Test could not be updated.",
      );
    } finally {
      setSavingCode(
        null,
      );
    }
  }






  async function openParticipants(
    test:
      AdminLiveTestItem,

    type:
      ParticipantType,
  ): Promise<void> {
    setParticipantListType(
      type,
    );

    setParticipants(
      [],
    );

    setParticipantsError(
      "",
    );

    setParticipantsLoading(
      true,
    );

    try {
      const response =
        await fetch(
          `/api/admin/live-tests/participants?code=${encodeURIComponent(
            test.code,
          )}&type=${encodeURIComponent(
            type,
          )}`,
          {
            credentials:
              "include",

            cache:
              "no-store",
          },
        );

      const body =
        await response.json() as {
          participants?:
            AdminLiveParticipant[];

          summary?:
            AdminLiveParticipantSummary;

          error?:
            string;
        };

      if (!response.ok) {
        throw new Error(
          body.error ??
          "Participants could not be loaded.",
        );
      }

      setParticipants(
        Array.isArray(
          body.participants,
        )
          ? body.participants
          : [],
      );

      if (
        body.summary
      ) {
        setParticipantSummary(
          body.summary,
        );
      }
    } catch (
      error
    ) {
      setParticipantsError(
        error instanceof
          Error
          ? error.message
          : "Participants could not be loaded.",
      );
    } finally {
      setParticipantsLoading(
        false,
      );
    }
  }


  async function openParticipantResult(
    test:
      AdminLiveTestItem,

    participant:
      AdminLiveParticipant,
  ): Promise<void> {
    if (
      !participant.attemptId
    ) {
      return;
    }

    setParticipantResult(
      null,
    );

    setParticipantResultError(
      "",
    );

    setParticipantResultLoading(
      true,
    );

    try {
      const response =
        await fetch(
          `/api/admin/live-tests/participants/result?code=${encodeURIComponent(
            test.code,
          )}&attemptId=${encodeURIComponent(
            String(
              participant.attemptId,
            ),
          )}`,
          {
            credentials:
              "include",

            cache:
              "no-store",
          },
        );

      const body =
        await response.json() as
          AdminLiveParticipantResult & {
            error?:
              string;
          };

      if (
        !response.ok ||
        !body.attempt
      ) {
        throw new Error(
          body.error ??
          "Participant result could not be loaded.",
        );
      }

      setParticipantResult(
        body,
      );
    } catch (
      error
    ) {
      setParticipantResultError(
        error instanceof
          Error
          ? error.message
          : "Participant result could not be loaded.",
      );
    } finally {
      setParticipantResultLoading(
        false,
      );
    }
  }


  function parseDatabaseTimestamp(
  rawValue: string,
): Date | null {
  if (!rawValue) {
    return null;
  }

  const normalized =
    /Z$|[+-]\d\d:\d\d$/.test(
      rawValue,
    )
      ? rawValue
      : `${rawValue.replace(
          " ",
          "T",
        )}Z`;

  const value =
    new Date(
      normalized,
    );

  return Number.isNaN(
    value.getTime(),
  )
    ? null
    : value;
}


function createdTimeText(
  rawValue: string,
): string {
  const value =
    parseDatabaseTimestamp(
      rawValue,
    );

  if (!value) {
    return rawValue;
  }

  return new Intl.DateTimeFormat(
    undefined,
    {
      month: "short",
      day: "numeric",
      year: "numeric",
      hour: "numeric",
      minute: "2-digit",
      timeZoneName: "short",
    },
  ).format(
    value,
  );
}


function participantLabel(
    participant:
      AdminLiveParticipant,
  ): string {
    return participant.participantType ===
      "GYAN"
      ? `GYAN #${participant.participantKey}`
      : participant.participantKey ||
        "Synthetic";
  }


  function hasEnded(
    test:
      AdminLiveTestItem,

    nowMs:
      number,
  ): boolean {
    const normalized =
      /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/
        .test(
          test.startsAtUtc,
        )
        ? `${test.startsAtUtc.replace(
            " ",
            "T",
          )}Z`
        : test.startsAtUtc;

    const start =
      Date.parse(
        normalized,
      );

    if (
      !Number.isFinite(
        start,
      )
    ) {
      return false;
    }

    return nowMs >=
      start +
        Math.max(
          1,
          test.durationMinutes,
        ) *
          60 *
          1000;
  }


  const visiblePrograms:
    Program[] =
      country ===
        "IN"
        ? [
            "JEE",
            "NEET",
          ]
        : [
            "SAT",
          ];


  const scheduleDates =
    Array.from(
      new Set(
        [
          ...tests
            .filter(
              (
                test,
              ) =>
                (
                  country ===
                    "IN" &&
                  (
                    test.program ===
                      "JEE" ||
                    test.program ===
                      "NEET"
                  )
                ) ||
                (
                  country ===
                    "US" &&
                  test.program ===
                    "SAT"
                ),
            )
            .map(
              (
                test,
              ) =>
                test.scheduleDate,
            ),

          ...classSchedule
            .filter(
              (
                item,
              ) =>
                visiblePrograms.includes(
                  item.program,
                ),
            )
            .map(
              (
                item,
              ) =>
                item.scheduleDate,
            ),
        ]
          .filter(
            (
              value,
            ): value is string =>
              Boolean(
                value,
              ),
          ),
      ),
    )
      .sort();


  const fallbackDates =
    country ===
      "US"
      ? Array.from(
          new Set(
            tests
              .filter(
                (
                  test,
                ) =>
                  test.program ===
                    "JEE" ||
                  test.program ===
                    "NEET",
              )
              .map(
                (
                  test,
                ) =>
                  test.scheduleDate,
              )
              .filter(
                (
                  value,
                ): value is string =>
                  Boolean(
                    value,
                  ),
              ),
          ),
        )
          .sort()
      : scheduleDates;


  const displayDates = (() => {
    /*
     * Show every day in the active two-month batch, including Sundays.
     *
     * Put the useful window first:
     *   today - 3 days → batch end
     * then append the earlier dates from this same batch.
     *
     * Example on Sep 12:
     *   Sep 09 ... Oct 31, then Sep 01 ... Sep 08.
     */
    const reference =
      calendarBatchStartDate ??
      scheduleDates[0] ??
      fallbackDates[0] ??
      localNowParts(
        countryTimezone(),
      ).date;

    const [
      year,
      month,
    ] =
      reference
        .split("-")
        .map(Number);

    const startMonth =
      month % 2 ===
        0
        ? month - 1
        : month;

    const first =
      new Date(
        Date.UTC(
          year,
          startMonth - 1,
          1,
        ),
      );

    const last =
      new Date(
        Date.UTC(
          year,
          startMonth + 1,
          0,
        ),
      );

    const allDates:
      string[] = [];

    for (
      const cursor =
        new Date(first);
      cursor <= last;
      cursor.setUTCDate(
        cursor.getUTCDate() +
          1,
      )
    ) {
      allDates.push(
        cursor
          .toISOString()
          .slice(
            0,
            10,
          ),
      );
    }

    if (
      calendarBatchStartDate
    ) {
      return allDates;
    }

    const today =
      localNowParts(
        countryTimezone(),
      ).date;

    const todayDate =
      new Date(
        `${today}T12:00:00Z`,
      );

    todayDate.setUTCDate(
      todayDate.getUTCDate() -
        3,
    );

    const preferredStart =
      todayDate
        .toISOString()
        .slice(
          0,
          10,
        );

    const rotateAt =
      allDates.findIndex(
        (
          date,
        ) =>
          date >=
          preferredStart,
      );

    if (
      rotateAt <=
        0
    ) {
      return allDates;
    }

    return [
      ...allDates.slice(
        rotateAt,
      ),
      ...allDates.slice(
        0,
        rotateAt,
      ),
    ];
  })();



  function clockTextFromMinutes(
    rawMinutes: number,
  ): string {
    const rounded = Math.min(
      23 * 60 + 45,
      Math.max(0, Math.round(rawMinutes / 15) * 15),
    );
    const hour = Math.floor(rounded / 60);
    const minute = rounded % 60;
    return `${String(hour).padStart(2, "0")}:${String(minute).padStart(2, "0")}`;
  }


  function clockFromTrackDoubleClick(
    event: MouseEvent<HTMLDivElement>,
  ): string {
    const rect = event.currentTarget.getBoundingClientRect();
    const ratio = Math.min(
      1,
      Math.max(0, (event.clientX - rect.left) / Math.max(1, rect.width)),
    );
    const column = ratio * 13;
    const minutes =
      column <= 1
        ? column * 720
        : 720 + (column - 1) * 60;
    return clockTextFromMinutes(minutes);
  }


  function defaultFractionForDate(
    scheduleDate: string,
  ): number {
    const day = new Date(`${scheduleDate}T12:00:00Z`).getUTCDay();
    return day === 6 ? 20 : 10;
  }


  function durationForFraction(
    program: Program,
    fractionPercent: number,
  ): number {
    const policy = policies.find(
      (item) => item.program === program,
    );

    const baseDuration =
      Math.max(1, Number(policy?.durationMinutes ?? 18));
    const baseFraction =
      Math.max(1, Number(policy?.testFractionPercent ?? 10));

    return Math.max(
      1,
      Math.round(
        baseDuration *
        fractionPercent /
        baseFraction,
      ),
    );
  }


  function openAddEvent(
    scheduleDate: string,
    program: Program,
    startLocal: string,
  ): void {
    const startMinutes = minutesFromClock(startLocal);
    const fractionPercent =
      defaultFractionForDate(
        scheduleDate,
      );

    setAddEventDraft({
      scheduleDate,
      program,
      type: "CLASS",
      startLocal,
      endLocal: clockTextFromMinutes(startMinutes + 30),
      durationMinutes: durationForFraction(program, fractionPercent),
      fractionPercent,
      subject: program === "JEE" ? "PHYSICS" : program === "NEET" ? "BIOLOGY" : "MATH",
      topicName: "",
    });
    setAddEventMessage("");
  }


  async function createLiveEvent(): Promise<void> {
    if (!addEventDraft) return;

    setAddEventSaving(true);
    setAddEventMessage("");

    try {
      if (addEventDraft.type === "CLASS") {
        const response = await fetch(
          "/api/admin/live-tests/class-schedule",
          {
            method: "POST",
            credentials: "include",
            headers: { "content-type": "application/json" },
            body: JSON.stringify({
              scheduleDate: addEventDraft.scheduleDate,
              program: addEventDraft.program,
              subject: addEventDraft.subject,
              topicName: addEventDraft.topicName,
              startLocal: addEventDraft.startLocal,
              endLocal: addEventDraft.endLocal,
            }),
          },
        );
        const body = await response.json() as {
          item?: AdminLiveClassItem;
          error?: string;
        };
        if (!response.ok || !body.item) {
          throw new Error(body.error ?? "Class could not be created.");
        }
        setClassSchedule((current) => [...current, body.item!]);
        setAddEventMessage("✓ Class added to the shared Admin/Public schedule.");
      } else {
        const response = await fetch(
          "/api/admin/live-tests/schedule",
          {
            method: "POST",
            credentials: "include",
            headers: { "content-type": "application/json" },
            body: JSON.stringify({
              scheduleDate: addEventDraft.scheduleDate,
              program: addEventDraft.program,
              localTime: addEventDraft.startLocal,
              durationMinutes: addEventDraft.durationMinutes,
              fractionPercent: addEventDraft.fractionPercent,
            }),
          },
        );
        const body = await response.json() as {
          code?: string;
          frozenQuestions?: number;
          expectedQuestions?: number;
          durationMinutes?: number;
          error?: string;
        };
        if (!response.ok) {
          throw new Error(body.error ?? "Live Test could not be created.");
        }
        setAddEventMessage(
          `✓ Live Test #${body.code ?? ""} created with ${body.frozenQuestions ?? 0}/${body.expectedQuestions ?? 0} frozen questions · ${body.durationMinutes ?? addEventDraft.durationMinutes} min.`,
        );
        await load();
      }
    } catch (error) {
      setAddEventMessage(
        error instanceof Error ? error.message : "Event could not be created.",
      );
    } finally {
      setAddEventSaving(false);
    }
  }


  const loadTestBatchPreview =
    useCallback(
      async (
        program: BatchExam,
        batchCode: string,
      ) => {
        if (!batchCode) {
          setTestBatchPreview(null);
          return;
        }
        const response = await fetch(
          `/api/admin/live-tests/batches/preview?program=${encodeURIComponent(program)}&batchCode=${encodeURIComponent(batchCode)}`,
          {
            credentials: 'include',
            cache: 'no-store',
          },
        );
        const body = await response.json() as TestBatchPreview & { error?: string };
        if (!response.ok) {
          throw new Error(body.error ?? 'Batch preview could not be loaded.');
        }
        setTestBatchPreview(body);
      },
      [],
    );


  const loadClassBatchPreview =
    useCallback(
      async (
        program: BatchExam,
        batchCode: string,
      ) => {
        if (
          !batchCode ||
          (
            program !== "JEE" &&
            program !== "NEET" &&
            program !== "SAT"
          )
        ) {
          setClassBatchPreview(null);
          return;
        }

        const response = await fetch(
          `/api/admin/live-tests/batches/classes/preview?program=${encodeURIComponent(program)}&batchCode=${encodeURIComponent(batchCode)}`,
          {
            credentials: "include",
            cache: "no-store",
          },
        );

        const body = await response.json() as
          ClassBatchPreview & {
            error?: string;
          };

        if (!response.ok) {
          throw new Error(
            body.error ??
            "Class batch preview could not be loaded.",
          );
        }

        setClassBatchPreview(body);
      },
      [],
    );


  async function runClassBatch(): Promise<void> {
    if (
      batchExam !== "JEE" &&
      batchExam !== "NEET" &&
      batchExam !== "SAT"
    ) {
      return;
    }

    const recreate =
      Boolean(
        classBatchPreview &&
        classBatchPreview.missingRows === 0 &&
        !classBatchPreview.needsNormalization,
      );

    if (
      recreate &&
      classBatchPreview &&
      !window.confirm(
        `Recreate ${batchExam} · ${classBatchPreview.label} classes?\n\nThe template-managed CORE/REVISION class rows for this batch will be deleted and rebuilt from ${classBatchPreview.templateLabel ?? classBatchPreview.templateCode ?? "the active template"}.\n\nHistorical class rows and manual class rows are preserved. Only today/future template-managed rows are rebuilt.`,
      )
    ) {
      return;
    }

    setClassBatchBusy(true);
    setClassBatchMessage("");

    try {
      const response = await fetch(
        "/api/admin/live-tests/batches/classes/generate",
        {
          method: "POST",
          credentials: "include",
          headers: {
            "content-type": "application/json",
          },
          body: JSON.stringify({
            program: batchExam,
            batchCode: selectedTestBatchCode,
            recreate,
          }),
        },
      );

      const body = await response.json() as {
        inserted?: number;
        preserved?: number;
        templateCode?: string;
        teachingDays?: number;
        revisionDays?: number;
        scheduledDays?: number;
        expectedRows?: number;
        completedTeachingDays?: number;
        completedScheduleDays?: number;
        updatedRevisionRows?: number;
        error?: string;
      };

      if (!response.ok) {
        throw new Error(
          body.error ??
          "Class batch generation failed.",
        );
      }

      setClassBatchMessage(
        `✓ ${batchExam} class batch complete · ${body.teachingDays ?? 0} core + ${body.revisionDays ?? 0} revision days · ${body.inserted ?? 0} added · ${body.updatedRevisionRows ?? 0} revision rows normalized · ${body.preserved ?? 0} core rows preserved.`,
      );

      if (classBatchPreview?.startDate) {
        setCalendarBatchStartDate(
          classBatchPreview.startDate,
        );
      }

      await loadClassBatchPreview(
        batchExam,
        selectedTestBatchCode,
      );

      const classResponse = await fetch(
        `/api/admin/live-tests/class-schedule?country=${encodeURIComponent(country)}`,
        {
          credentials: "include",
          cache: "no-store",
        },
      );

      const classBody = await classResponse.json() as {
        classSchedule?: AdminLiveClassItem[];
        error?: string;
      };

      if (classResponse.ok) {
        setClassSchedule(
          Array.isArray(classBody.classSchedule)
            ? classBody.classSchedule
            : [],
        );
      }

      await loadTestBatchPreview(
        batchExam,
        selectedTestBatchCode,
      );
    } catch (error) {
      setClassBatchMessage(
        error instanceof Error
          ? error.message
          : "Class batch generation failed.",
      );
    } finally {
      setClassBatchBusy(false);
    }
  }


  async function runTestBatch(): Promise<void> {
    if (!testBatchPreview) return;

    const recreate =
      testBatchPreview.existingAutoTests > 0;

    if (
      recreate &&
      !window.confirm(
        `Recreate ${batchExam} · ${testBatchPreview.label}?\n\n${testBatchPreview.existingAutoTests} automatic Live Tests and their frozen questions/results will be deleted and rebuilt using the CURRENT rules.\n\nHistorical automatic tests and admin-created tests will be preserved. Only today/future automatic tests are rebuilt.`,
      )
    ) {
      return;
    }

    setTestBatchBusy(true);
    setTestBatchMessage('');

    try {
      const response = await fetch(
        '/api/admin/live-tests/batches/generate',
        {
          method: 'POST',
          credentials: 'include',
          headers: { 'content-type': 'application/json' },
          body: JSON.stringify({
            program: batchExam,
            batchCode: selectedTestBatchCode,
            recreate,
          }),
        },
      );
      const body = await response.json() as {
        ready?: number;
        incomplete?: number;
        skipped?: number;
        errors?: number;
        error?: string;
      };
      if (!response.ok) {
        throw new Error(body.error ?? 'Batch generation failed.');
      }
      setTestBatchMessage(
        `✓ ${batchExam} batch complete · ${body.ready ?? 0} ready · ${body.incomplete ?? 0} incomplete · ${body.skipped ?? 0} skipped · ${body.errors ?? 0} errors.`,
      );

      if (testBatchPreview.startDate) {
        setCalendarBatchStartDate(
          testBatchPreview.startDate,
        );
      }

      await loadTestBatchPreview(batchExam, selectedTestBatchCode);
      await load();
    } catch (error) {
      setTestBatchMessage(
        error instanceof Error ? error.message : 'Batch generation failed.',
      );
    } finally {
      setTestBatchBusy(false);
    }
  }


  useEffect(
    () => {
      const controller = new AbortController();
      void fetch('/api/admin/live-tests/batches', {
        credentials: 'include',
        cache: 'no-store',
        signal: controller.signal,
      })
        .then(async (response) => {
          const body = await response.json() as {
            batches?: TestBatchDefinition[];
            programs?: BatchProgramStatus[];
            error?: string;
          };
          if (!response.ok) throw new Error(body.error ?? 'Test batches could not be loaded.');
          return body;
        })
        .then((body) => {
          if (controller.signal.aborted) return;
          setTestBatches(Array.isArray(body.batches) ? body.batches : []);
          setBatchPrograms(Array.isArray(body.programs) ? body.programs : []);
        })
        .catch((error) => {
          if (controller.signal.aborted) return;
          setTestBatchMessage(error instanceof Error ? error.message : 'Test batches could not be loaded.');
        });
      return () => controller.abort();
    },
    [],
  );


  useEffect(
    () => {
      if (
        calendarBatchStartDate ||
        testBatches.length ===
          0
      ) {
        return;
      }

      const today =
        localNowParts(
          countryTimezone(),
        ).date;

      const current =
        testBatches.find(
          (
            batch,
          ) =>
            batch.active ===
              1 &&
            batch.start_date <=
              today &&
            batch.end_date >=
              today,
        ) ??
        testBatches.find(
          (
            batch,
          ) =>
            batch.active ===
            1,
        );

      if (current) {
        setCalendarBatchStartDate(
          current.start_date,
        );

        setSelectedTestBatchCode(
          current.batch_code,
        );
      }
    },
    [
      calendarBatchStartDate,
      testBatches,
      country,
      adminTimezone,
      browserTimezone,
    ],
  );


  useEffect(
    () => {
      const controller = new AbortController();
      if (!selectedTestBatchCode) return () => controller.abort();
      void fetch(
        `/api/admin/live-tests/batches/preview?program=${encodeURIComponent(batchExam)}&batchCode=${encodeURIComponent(selectedTestBatchCode)}`,
        {
          credentials: 'include',
          cache: 'no-store',
          signal: controller.signal,
        },
      )
        .then(async (response) => {
          const body = await response.json() as TestBatchPreview & { error?: string };
          if (!response.ok) throw new Error(body.error ?? 'Batch preview could not be loaded.');
          return body;
        })
        .then((body) => {
          if (!controller.signal.aborted) setTestBatchPreview(body);
        })
        .catch((error) => {
          if (controller.signal.aborted) return;
          setTestBatchPreview(null);
          setTestBatchMessage(error instanceof Error ? error.message : 'Batch preview could not be loaded.');
        });
      return () => controller.abort();
    },
    [batchExam, selectedTestBatchCode],
  );


  useEffect(
    () => {
      const controller =
        new AbortController();

      if (
        !selectedTestBatchCode ||
        (
          batchExam !== "JEE" &&
          batchExam !== "NEET" &&
          batchExam !== "SAT"
        )
      ) {
        return () =>
          controller.abort();
      }

      void fetch(
        `/api/admin/live-tests/batches/classes/preview?program=${encodeURIComponent(
          batchExam,
        )}&batchCode=${encodeURIComponent(
          selectedTestBatchCode,
        )}`,
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
                ClassBatchPreview & {
                  error?:
                    string;
                };

            if (
              !response.ok
            ) {
              throw new Error(
                body.error ??
                "Class batch preview could not be loaded.",
              );
            }

            return body;
          },
        )
        .then(
          (
            body,
          ) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setClassBatchPreview(
              body,
            );

            setClassBatchMessage(
              "",
            );
          },
        )
        .catch(
          (
            error,
          ) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setClassBatchPreview(
              null,
            );

            setClassBatchMessage(
              error instanceof
                Error
                ? error.message
                : "Class batch preview could not be loaded.",
            );
          },
        );

      return () =>
        controller.abort();
    },
    [
      batchExam,
      selectedTestBatchCode,
    ],
  );


  function openClassEditor(
    item:
      AdminLiveClassItem,
  ): void {
    setSelectedClass(
      item,
    );

    setClassDraftStart(
      item.startLocal,
    );

    setClassDraftEnd(
      item.endLocal,
    );

    setClassSaveMessage(
      "",
    );
  }


  async function saveClassTime():
    Promise<void> {
    if (
      !selectedClass
    ) {
      return;
    }

    setClassSaving(
      true,
    );

    setClassSaveMessage(
      "",
    );

    try {
      const response =
        await fetch(
          "/api/admin/live-tests/class-schedule",
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
                scheduleDate:
                  selectedClass.scheduleDate,

                program:
                  selectedClass.program,

                subject:
                  selectedClass.subject,

                startLocal:
                  classDraftStart,

                endLocal:
                  classDraftEnd,
              }),
          },
        );

      const body =
        await response.json() as {
          error?:
            string;
        };

      if (
        !response.ok
      ) {
        throw new Error(
          body.error ??
          "Class time could not be saved.",
        );
      }

      setClassSchedule(
        (
          current,
        ) =>
          current.map(
            (
              item,
            ) =>
              item.scheduleDate ===
                selectedClass.scheduleDate &&
              item.program ===
                selectedClass.program &&
              item.subject ===
                selectedClass.subject
                ? {
                    ...item,
                    startLocal:
                      classDraftStart,
                    endLocal:
                      classDraftEnd,
                  }
                : item,
          ),
      );

      setSelectedClass(
        {
          ...selectedClass,
          startLocal:
            classDraftStart,
          endLocal:
            classDraftEnd,
        },
      );

      setClassSaveMessage(
        "✓ Saved. Public Class schedule will use the same time.",
      );
    } catch (
      error
    ) {
      setClassSaveMessage(
        error instanceof
          Error
          ? error.message
          : "Class time could not be saved.",
      );
    } finally {
      setClassSaving(
        false,
      );
    }
  }



  async function deleteClass(
    item:
      AdminLiveClassItem,
  ): Promise<void> {
    const today =
      localNowParts(
        item.scheduleTimezone,
      ).date;

    if (
      item.scheduleDate < today
    ) {
      setClassSaveMessage(
        "Historical classes are protected and cannot be deleted.",
      );
      return;
    }

    const confirmed =
      window.confirm(
        `Delete ${item.program} ${item.subject} class on ${item.scheduleDate}?\n\n${item.topicName}\n${item.startLocal}–${item.endLocal}\n\nThis removes the class schedule row. Existing Live Tests are not deleted automatically.`,
      );

    if (!confirmed) {
      return;
    }

    setClassSaving(
      true,
    );

    setClassSaveMessage(
      "",
    );

    try {
      const response =
        await fetch(
          "/api/admin/live-tests/class-schedule",
          {
            method:
              "DELETE",

            credentials:
              "include",

            headers: {
              "content-type":
                "application/json",
            },

            body:
              JSON.stringify({
                scheduleDate:
                  item.scheduleDate,

                program:
                  item.program,

                subject:
                  item.subject,

                sequenceNumber:
                  item.sequenceNumber,
              }),
          },
        );

      const body =
        await response.json() as {
          error?:
            string;
        };

      if (!response.ok) {
        throw new Error(
          body.error ??
          "Class could not be deleted.",
        );
      }

      setClassSchedule(
        (
          current,
        ) =>
          current.filter(
            (
              currentItem,
            ) =>
              !(
                currentItem.scheduleDate ===
                  item.scheduleDate &&
                currentItem.program ===
                  item.program &&
                currentItem.subject ===
                  item.subject &&
                currentItem.sequenceNumber ===
                  item.sequenceNumber
              ),
          ),
      );

      setSelectedClass(
        null,
      );

      setMessage(
        "✓ Class deleted.",
      );
    } catch (
      error
    ) {
      setClassSaveMessage(
        error instanceof
          Error
          ? error.message
          : "Class could not be deleted.",
      );
    } finally {
      setClassSaving(
        false,
      );
    }
  }


  async function deleteLiveTest(
    test:
      AdminLiveTestItem,
  ): Promise<void> {
    const today =
      localNowParts(
        test.scheduleTimezone,
      ).date;

    if (
      test.scheduleDate &&
      test.scheduleDate < today
    ) {
      setMessage(
        "Historical Live Tests are protected and cannot be deleted.",
      );
      return;
    }

    if (
      test.eventKind !==
        "ADMIN_AD_HOC"
    ) {
      setMessage(
        "Only admin-created sample/ad-hoc Live Tests can be deleted here. Recreate batch-generated tests from Live Test Batch settings.",
      );
      return;
    }

    const confirmed =
      window.confirm(
        `Delete Live Test #${test.code}?\n\n${test.program} · ${test.scheduleDate ?? ""} · ${test.localTime}\n\nFrozen questions and any test attempts/results attached to this sample test will also be deleted.`,
      );

    if (!confirmed) {
      return;
    }

    setSavingCode(
      test.code,
    );

    setMessage(
      "",
    );

    try {
      const response =
        await fetch(
          `/api/admin/live-tests/schedule/${encodeURIComponent(
            test.code,
          )}`,
          {
            method:
              "DELETE",

            credentials:
              "include",
          },
        );

      const body =
        await response.json() as {
          error?:
            string;
        };

      if (!response.ok) {
        throw new Error(
          body.error ??
          "Live Test could not be deleted.",
        );
      }

      setSelectedCode(
        null,
      );

      setTests(
        (
          current,
        ) =>
          current.filter(
            (
              currentTest,
            ) =>
              currentTest.code !==
              test.code,
          ),
      );

      setMessage(
        `✓ Live Test #${test.code} deleted.`,
      );
    } catch (
      error
    ) {
      setMessage(
        error instanceof
          Error
          ? error.message
          : "Live Test could not be deleted.",
      );
    } finally {
      setSavingCode(
        null,
      );
    }
  }


  function classesFor(
    date:
      string,

    program:
      Program,
  ): AdminLiveClassItem[] {
    return classSchedule
      .filter(
        (
          item,
        ) =>
          item.scheduleDate ===
            date &&
          item.program ===
            program,
      )
      .sort(
        (
          first,
          second,
        ) =>
          first.sequenceNumber -
          second.sequenceNumber,
      );
  }


  function minutesFromClock(
    value:
      string,
  ): number {
    const match =
      /^(\d{1,2}):(\d{2})$/
        .exec(
          value,
        );

    if (!match) {
      return 0;
    }

    return Math.min(
      1440,
      Math.max(
        0,
        Number(
          match[1],
        ) *
          60 +
        Number(
          match[2],
        ),
      ),
    );
  }


  function timelinePercent(
    minutes:
      number,
  ): number {
    const safe =
      Math.min(
        1440,
        Math.max(
          0,
          minutes,
        ),
      );

    if (
      safe <=
      720
    ) {
      return (
        (
          safe /
          720
        ) /
        13
      ) *
        100;
    }

    return (
      (
        1 +
        (
          safe -
          720
        ) /
          60
      ) /
      13
    ) *
      100;
  }


  function rangeTimelinePosition(
    startMinutes:
      number,

    endMinutes:
      number,
  ): {
    left:
      string;

    width:
      string;
  } {
    const left =
      timelinePercent(
        startMinutes,
      );

    const right =
      timelinePercent(
        Math.max(
          startMinutes +
            1,
          endMinutes,
        ),
      );

    return {
      left:
        `${left}%`,

      width:
        `${Math.max(
          0.35,
          right -
            left,
        )}%`,
    };
  }


  function classTimelinePosition(
    item:
      AdminLiveClassItem,
  ): {
    left:
      string;

    width:
      string;
  } {
    const displayed =
      displayClassTimes(
        item,
      );

    const start =
      minutesFromClock(
        displayed.start,
      );

    const end =
      minutesFromClock(
        displayed.end,
      );

    return rangeTimelinePosition(
      start,
      end > start
        ? end
        : start +
            30,
    );
  }


  function subjectClass(
    subject:
      string,
  ): string {
    const normalized =
      subject
        .trim()
        .toUpperCase();

    if (
      normalized ===
      "PHYSICS"
    ) {
      return "is-physics";
    }

    if (
      normalized ===
      "CHEMISTRY"
    ) {
      return "is-chemistry";
    }

    if (
      normalized ===
        "MATH" ||
      normalized ===
        "MATHEMATICS"
    ) {
      return "is-math";
    }

    if (
      normalized ===
      "BIOLOGY"
    ) {
      return "is-biology";
    }

    return "is-subject";
  }


  function countryTimezone():
    string {
    if (
      country ===
      "IN"
    ) {
      return "Asia/Kolkata";
    }

    if (
      adminTimezone.startsWith(
        "America/",
      )
    ) {
      return adminTimezone;
    }

    if (
      browserTimezone.startsWith(
        "America/",
      )
    ) {
      return browserTimezone;
    }

    return "America/Los_Angeles";
  }


  function timezoneShortName(
    timezone:
      string,
  ): string {
    try {
      const part =
        new Intl.DateTimeFormat(
          "en-US",
          {
            timeZone:
              timezone,
            timeZoneName:
              "short",
          },
        )
          .formatToParts(
            new Date(
              nowMs,
            ),
          )
          .find(
            (
              item,
            ) =>
              item.type ===
              "timeZoneName",
          );

      return (
        part?.value ??
        timezone
      );
    } catch {
      return timezone;
    }
  }


  function scheduleLocationLabel():
    string {
    if (
      country ===
      "IN"
    ) {
      return "India";
    }

    return locationLabelForTimezone(
      countryTimezone(),
    );
  }


  function localDateTimeToUtcMs(
    date:
      string,

    time:
      string,

    timezone:
      string,
  ): number | null {
    const dateMatch =
      /^(\d{4})-(\d{2})-(\d{2})$/
        .exec(
          date,
        );

    const timeMatch =
      /^(\d{1,2}):(\d{2})$/
        .exec(
          time,
        );

    if (
      !dateMatch ||
      !timeMatch
    ) {
      return null;
    }

    const desired =
      Date.UTC(
        Number(
          dateMatch[1],
        ),
        Number(
          dateMatch[2],
        ) - 1,
        Number(
          dateMatch[3],
        ),
        Number(
          timeMatch[1],
        ),
        Number(
          timeMatch[2],
        ),
        0,
      );

    let guess =
      desired;

    const formatter =
      new Intl.DateTimeFormat(
        "en-CA",
        {
          timeZone:
            timezone,
          year:
            "numeric",
          month:
            "2-digit",
          day:
            "2-digit",
          hour:
            "2-digit",
          minute:
            "2-digit",
          second:
            "2-digit",
          hourCycle:
            "h23",
        },
      );

    for (
      let pass = 0;
      pass < 3;
      pass += 1
    ) {
      const parts =
        formatter.formatToParts(
          new Date(
            guess,
          ),
        );

      const read =
        (
          type:
            Intl.DateTimeFormatPartTypes,
        ): number =>
          Number(
            parts.find(
              (
                item,
              ) =>
                item.type ===
                type,
            )?.value ??
            0,
          );

      const represented =
        Date.UTC(
          read(
            "year",
          ),
          read(
            "month",
          ) - 1,
          read(
            "day",
          ),
          read(
            "hour",
          ),
          read(
            "minute",
          ),
          read(
            "second",
          ),
        );

      const correction =
        desired -
        represented;

      if (
        Math.abs(
          correction,
        ) <
        1000
      ) {
        break;
      }

      guess +=
        correction;
    }

    return guess;
  }


  function clockInTimezone(
    utcMs:
      number,

    timezone:
      string,
  ): string {
    if (
      !Number.isFinite(
        utcMs,
      )
    ) {
      return "";
    }

    return new Intl.DateTimeFormat(
      "en-US",
      {
        timeZone:
          timezone,
        hour:
          "2-digit",
        minute:
          "2-digit",
        hourCycle:
          "h23",
      },
    ).format(
      new Date(
        utcMs,
      ),
    );
  }


  function displayClassTimes(
    item:
      AdminLiveClassItem,
  ): {
    start:
      string;
    end:
      string;
  } {
    const targetTimezone =
      countryTimezone();

    const startUtc =
      localDateTimeToUtcMs(
        item.scheduleDate,
        item.startLocal,
        item.scheduleTimezone,
      );

    const endUtc =
      localDateTimeToUtcMs(
        item.scheduleDate,
        item.endLocal,
        item.scheduleTimezone,
      );

    return {
      start:
        startUtc ===
          null
          ? item.startLocal
          : clockInTimezone(
              startUtc,
              targetTimezone,
            ),

      end:
        endUtc ===
          null
          ? item.endLocal
          : clockInTimezone(
              endUtc,
              targetTimezone,
            ),
    };
  }


  function displayTestTime(
    test:
      AdminLiveTestItem,
  ): string {
    const normalized =
      /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/
        .test(
          test.startsAtUtc,
        )
        ? `${test.startsAtUtc.replace(
            " ",
            "T",
          )}Z`
        : test.startsAtUtc;

    const utcMs =
      Date.parse(
        normalized,
      );

    return Number.isFinite(
      utcMs,
    )
      ? clockInTimezone(
          utcMs,
          countryTimezone(),
        )
      : test.localTime;
  }


  function localNowParts(
    timezone:
      string,
  ): {
    date:
      string;

    minutes:
      number;
  } {
    const parts =
      new Intl.DateTimeFormat(
        "en-CA",
        {
          timeZone:
            timezone,
          year:
            "numeric",
          month:
            "2-digit",
          day:
            "2-digit",
          hour:
            "2-digit",
          minute:
            "2-digit",
          hourCycle:
            "h23",
        },
      ).formatToParts(
        new Date(
          nowMs,
        ),
      );

    const byType =
      new Map(
        parts.map(
          (
            part,
          ) => [
            part.type,
            part.value,
          ],
        ),
      );

    const year =
      byType.get(
        "year",
      ) ?? "0000";

    const month =
      byType.get(
        "month",
      ) ?? "00";

    const day =
      byType.get(
        "day",
      ) ?? "00";

    const hour =
      Number(
        byType.get(
          "hour",
        ) ??
        0,
      );

    const minute =
      Number(
        byType.get(
          "minute",
        ) ??
        0,
      );

    return {
      date:
        `${year}-${month}-${day}`,

      minutes:
        hour *
          60 +
        minute,
    };
  }


  function currentHalfHourPosition():
    string {
    const local =
      localNowParts(
        countryTimezone(),
      );

    const bucketStart =
      Math.floor(
        local.minutes /
          30,
      ) *
      30;

    const center =
      bucketStart +
      15;

    return `${timelinePercent(
      center,
    )}%`;
  }


  function isCurrentDate(
    date:
      string,
  ): boolean {
    return (
      localNowParts(
        countryTimezone(),
      ).date ===
      date
    );
  }


  function batchRange():
    {
      startYear:
        number;

      startMonth:
        number;

      endYear:
        number;

      endMonth:
        number;
    } {
    const reference =
      displayDates[0] ??
      localNowParts(
        countryTimezone(),
      ).date;

    const [
      year,
      month,
    ] =
      reference
        .split("-")
        .map(Number);

    const startMonth =
      month % 2 ===
        0
        ? month - 1
        : month;

    const endMonth =
      startMonth + 1;

    return {
      startYear:
        year,
      startMonth,
      endYear:
        year,
      endMonth,
    };
  }


  function nextBatchLabel():
    string {
    const range =
      batchRange();

    const start =
      new Date(
        range.startYear,
        range.startMonth - 1,
        1,
      );

    start.setMonth(
      start.getMonth() +
        2,
    );

    const end =
      new Date(
        start.getFullYear(),
        start.getMonth() +
          1,
        1,
      );

    const format =
      (
        value:
          Date,
      ): string =>
        new Intl.DateTimeFormat(
          "en-US",
          {
            month:
              "short",
            year:
              "numeric",
          },
        ).format(
          value,
        );

    return `${format(
      start,
    )} – ${format(
      end,
    )}`;
  }


  async function copyToNextBatch():
    Promise<void> {
    setBatchCopying(
      true,
    );

    setBatchMessage(
      "",
    );

    try {
      const range =
        batchRange();

      const response =
        await fetch(
          "/api/admin/live-tests/class-schedule/batch",
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
                action:
                  "COPY_NEXT",

                startYear:
                  range.startYear,

                startMonth:
                  range.startMonth,
              }),
          },
        );

      const body =
        await response.json() as {
          copied?:
            number;

          error?:
            string;
        };

      if (!response.ok) {
        throw new Error(
          body.error ??
          "Batch schedule could not be copied.",
        );
      }

      setBatchMessage(
        `✓ ${
          body.copied ??
          0
        } class schedule rows copied to ${
          nextBatchLabel()
        }.`,
      );
    } catch (
      error
    ) {
      setBatchMessage(
        error instanceof
          Error
          ? error.message
          : "Batch schedule could not be copied.",
      );
    } finally {
      setBatchCopying(
        false,
      );
    }
  }


  function testFor(
    date:
      string,

    program:
      Program,
  ):
    AdminLiveTestItem |
    undefined {
    return tests.find(
      (
        test,
      ) =>
        test.scheduleDate ===
          date &&
        test.program ===
          program,
    );
  }




  function dateLabel(
    value:
      string,
  ): string {
    const [
      year,
      month,
      day,
    ] =
      value
        .split("-")
        .map(Number);

    return new Intl.DateTimeFormat(
      "en-US",
      {
        month:
          "short",
        day:
          "numeric",
      },
    ).format(
      new Date(
        year,
        month - 1,
        day,
      ),
    );
  }


  function dayLabel(
    value:
      string,
  ): string {
    const [
      year,
      month,
      day,
    ] =
      value
        .split("-")
        .map(Number);

    return new Intl.DateTimeFormat(
      "en-US",
      {
        weekday:
          "short",
      },
    )
      .format(
        new Date(
          year,
          month - 1,
          day,
        ),
      )
      .toUpperCase();
  }


  function testNumberFor(
    date:
      string,
  ): string {
    const test =
      visiblePrograms
        .map(
          (
            program,
          ) =>
            testFor(
              date,
              program,
            ),
        )
        .find(
          Boolean,
        );

    return test
      ?.code
      .replace(
        /[A-Za-z]+$/,
        "",
      ) ??
      "";
  }


  function batchButtonLabel(
    batch:
      TestBatchDefinition,
  ): string {
    const start =
      new Date(
        `${batch.start_date}T12:00:00Z`,
      );

    const end =
      new Date(
        `${batch.end_date}T12:00:00Z`,
      );

    const month =
      (
        value:
          Date,
      ): string =>
        new Intl.DateTimeFormat(
          "en-US",
          {
            month:
              "short",
          },
        ).format(
          value,
        );

    return `${month(
      start,
    )} ${start.getUTCFullYear()} – ${month(
      end,
    )} ${end.getUTCFullYear()}`;
  }


  const calendarBatchOptions =
    testBatches
      .filter(
        (
          batch,
        ) =>
          batch.active ===
          1,
      )
      .slice(
        0,
        2,
      );


  function selectCalendarBatch(
    batch:
      TestBatchDefinition,
  ): void {
    setSelectedTestBatchCode(
      batch.batch_code,
    );

    setCalendarBatchStartDate(
      batch.start_date,
    );

    setTestBatchMessage(
      "",
    );

    setClassBatchMessage(
      "",
    );
  }


  function batchTitle():
    string {
    const range =
      batchRange();

    const first =
      new Date(
        range.startYear,
        range.startMonth - 1,
        1,
      );

    const last =
      new Date(
        range.endYear,
        range.endMonth - 1,
        1,
      );

    const month =
      (
        value:
          Date,
      ): string =>
        new Intl.DateTimeFormat(
          "en-US",
          {
            month:
              "short",
          },
        ).format(
          value,
        );

    return `Batch: ${month(
      first,
    )} ${range.startYear} – ${month(
      last,
    )} ${range.endYear}`;
  }


  function timelinePosition(
    test:
      AdminLiveTestItem,
  ): {
    left:
      string;

    width:
      string;
  } {
    const match =
      /^(\d{2}):(\d{2})$/
        .exec(
          displayTestTime(
            test,
          ),
        );

    const start =
      match
        ? Number(
            match[1],
          ) *
            60 +
          Number(
            match[2],
          )
        : 0;

    const duration =
      Math.max(
        1,
        Number(
          test.durationMinutes,
        ) ||
        18,
      );

    return rangeTimelinePosition(
      start,
      Math.min(
        1440,
        start +
          duration,
      ),
    );
  }


  function timelineStatusClass(
    test:
      AdminLiveTestItem,
  ): string {
    const status =
      test.status
        .trim()
        .toUpperCase();

    if (
      status.includes(
        "COMPLETE",
      ) ||
      status.includes(
        "ENDED",
      ) ||
      status.includes(
        "FINISH",
      )
    ) {
      return "is-complete";
    }

    if (
      !test.ready
    ) {
      return "is-problem";
    }

    if (
      test.visibilityMode ===
        "HIDE"
    ) {
      return "is-hidden";
    }

    return "is-ready";
  }


  const selectedTest =
    selectedCode
      ? tests.find(
          (
            test,
          ) =>
            test.code ===
            selectedCode,
        ) ??
        null
      : null;


  const pmTimelineHours =
    Array.from(
      {
        length:
          13,
      },
      (
        _,
        index,
      ) =>
        12 +
        index,
    );


  return (
    <main className="admin-live-tests">
      <header className="admin-live-tests__header">
        <button
          type="button"
          aria-label="Back"
          onClick={
            onBack
          }
        >
          ←
        </button>

        <div className="admin-live-tests__batch-heading">
          <div
            style={{
              display:
                "flex",
              gap:
                "6px",
              flexWrap:
                "wrap",
              alignItems:
                "center",
            }}
          >
            {
              calendarBatchOptions.map(
                (
                  batch,
                ) => (
                  <button
                    key={
                      batch.batch_code
                    }
                    type="button"
                    onClick={() =>
                      selectCalendarBatch(
                        batch,
                      )
                    }
                    style={{
                      padding:
                        "3px 7px",
                      border:
                        calendarBatchStartDate ===
                          batch.start_date
                          ? "1px solid #38bdf8"
                          : "1px solid #bae6fd",
                      borderRadius:
                        "7px",
                      background:
                        "#e0f2fe",
                      fontSize:
                        "0.68rem",
                      fontWeight:
                        calendarBatchStartDate ===
                          batch.start_date
                          ? 800
                          : 600,
                      cursor:
                        "pointer",
                    }}
                  >
                    {
                      batchButtonLabel(
                        batch,
                      )
                    }
                  </button>
                ),
              )
            }

            <button
              type="button"
              className="admin-live-tests__batch-edit admin-live-tests__batch-edit--tests"
              aria-label="Edit Live Test batch"
              title="Live Test batch settings"
              onClick={() => {
                setTestBatchMessage(
                  "",
                );

                setTestBatchDialogOpen(
                  true,
                );
              }}
            >
              ✎
            </button>
          </div>

          <small>
            Schedule · {
              country
            } ({
              scheduleLocationLabel()
            }) {
              timezoneShortName(
                countryTimezone(),
              )
            }
          </small>
        </div>

        <button
          type="button"
          className="admin-live-tests__country-trigger"
          aria-label="Change country"
          title="Change country"
          onClick={() =>
            setCountryPickerOpen(
              true,
            )
          }
        >
          {
            country
          }
        </button>
      </header>

      <div className="admin-live-tests__schedule-legend">
        <span className="is-physics">
          <i />
          Physics
        </span>

        <span className="is-chemistry">
          <i />
          Chemistry
        </span>

        <span className="is-math">
          <i />
          Mathematics
        </span>

        <span className="is-biology">
          <i />
          Biology
        </span>

        <span className="is-live-test">
          <i />
          Live Test
        </span>

        <span className="is-now">
          ★
          Current 30 min
        </span>


        <span className="is-am-compressed">
          <i />
          12a–12p compressed
        </span>


        {
          country ===
            "IN"
            ? (
                <span className="admin-live-tests__schedule-note">
                  JEE classes 3:30–5:00 · Test 9:15 PM · NEET classes 3:30–5:30 · Test 8:30 PM IST
                </span>
              )
            : (
                <span className="admin-live-tests__schedule-note">
                  Times shown in {
                    timezoneShortName(
                      countryTimezone(),
                    )
                  }
                </span>
              )
        }
      </div>


      {
        message && (
          <div className="admin-live-tests__message">
            {
              message
            }
          </div>
        )
      }


      {
        loading
          ? (
              <div className="admin-live-tests__state">
                Loading…
              </div>
            )
          : displayDates.length ===
              0
            ? (
                <div className="admin-live-tests__state">
                  No Live Test dates found.
                </div>
              )
            : (
                <div className="admin-live-tests__calendar-shell">
                  <div className="admin-live-tests__calendar">
                    <div className="admin-live-tests__calendar-head">
                      <strong>
                        Date
                      </strong>

                      <strong>
                        Day
                      </strong>

                      <strong>
                        Test
                      </strong>

                      <strong>
                        Program
                      </strong>

                      <div className="admin-live-tests__time-head">
                        <span
                          className="admin-live-tests__am-head"
                          style={{
                            left:
                              "0%",
                            width:
                              `${100 / 13}%`,
                          }}
                        >
                          12a–12p
                        </span>

                        {
                          pmTimelineHours.map(
                            (
                              hour,
                              index,
                            ) => (
                              <span
                                key={
                                  hour
                                }
                                className="admin-live-tests__pm-tick"
                                style={{
                                  left:
                                    `${(
                                      (
                                        index +
                                        1
                                      ) /
                                      13
                                    ) *
                                    100}%`,
                                }}
                              >
                                {
                                  hour ===
                                    24
                                    ? "12a"
                                    : hour ===
                                        12
                                      ? "12p"
                                      : `${hour - 12}p`
                                }
                              </span>
                            ),
                          )
                        }
                      </div>
                    </div>

                    {
                      displayDates.map(
                        (
                          date,
                        ) => (
                          <section
                            key={
                              date
                            }
                            className={[
                              "admin-live-tests__calendar-day",
                              dayLabel(
                                date,
                              ) ===
                                "MON"
                                ? "is-week-start"
                                : "",
                              dayLabel(
                                date,
                              ) ===
                                "SUN"
                                ? "is-sunday"
                                : "",
                            ]
                              .filter(
                                Boolean,
                              )
                              .join(
                                " ",
                              )}
                          >
                            <div className="admin-live-tests__calendar-date">
                              {
                                dateLabel(
                                  date,
                                )
                              }
                            </div>

                            <div className="admin-live-tests__calendar-weekday">
                              {
                                dayLabel(
                                  date,
                                )
                              }
                            </div>

                            <div className="admin-live-tests__calendar-number">
                              {
                                testNumberFor(
                                  date,
                                )
                                  ? `#${testNumberFor(
                                      date,
                                    )}`
                                  : "—"
                              }
                            </div>

                            <div className="admin-live-tests__lanes">
                              {
                                visiblePrograms.map(
                                  (
                                    program,
                                  ) => {
                                    const test =
                                      testFor(
                                        date,
                                        program,
                                      );

                                    return (
                                      <div
                                        key={
                                          program
                                        }
                                        className="admin-live-tests__lane"
                                      >
                                        <span className="admin-live-tests__lane-label">
                                          {
                                            program
                                          }
                                        </span>

                                        <div
                                          className="admin-live-tests__track"
                                          title="Double-click an empty time to add a Live Class or Live Test"
                                          onDoubleClick={(event) => {
                                            openAddEvent(
                                              date,
                                              program,
                                              clockFromTrackDoubleClick(event),
                                            );
                                          }}
                                        >
                                          <span
                                            className="admin-live-tests__am-compressed"
                                            aria-hidden="true"
                                          />

                                          {
                                            Array.from(
                                              {
                                                length:
                                                  13,
                                              },
                                              (
                                                _,
                                                index,
                                              ) => (
                                                <i
                                                  key={
                                                    index
                                                  }
                                                  style={{
                                                    left:
                                                      `${(
                                                        (
                                                          index +
                                                          1
                                                        ) /
                                                        13
                                                      ) *
                                                      100}%`,
                                                  }}
                                                />
                                              ),
                                            )
                                          }

                                          {
                                            classesFor(
                                              date,
                                              program,
                                            ).map(
                                              (
                                                item,
                                              ) => (
                                                <button
                                                  type="button"
                                                  key={`${item.subject}:${item.sequenceNumber}:${item.topicName}`}
                                                  className={`admin-live-tests__class-event ${subjectClass(
                                                    item.subject,
                                                  )}`}
                                                  style={
                                                    classTimelinePosition(
                                                      item,
                                                    )
                                                  }
                                                  title={`${program} · ${item.subject} · ${item.topicName} · ${displayClassTimes(
                                                    item,
                                                  ).start}–${displayClassTimes(
                                                    item,
                                                  ).end} ${timezoneShortName(
                                                    countryTimezone(),
                                                  )}`}
                                                  aria-label={`${program} ${item.subject}: ${item.topicName}, ${displayClassTimes(
                                                    item,
                                                  ).start} to ${displayClassTimes(
                                                    item,
                                                  ).end} ${timezoneShortName(
                                                    countryTimezone(),
                                                  )}`}
                                                  onClick={() =>
                                                    openClassEditor(
                                                      item,
                                                    )
                                                  }
                                                  onDoubleClick={(event) =>
                                                    event.stopPropagation()
                                                  }
                                                />
                                              ),
                                            )
                                          }

                                          {
                                            isCurrentDate(
                                              date,
                                            ) && (
                                              <span
                                                className="admin-live-tests__now-star"
                                                style={{
                                                  left:
                                                    currentHalfHourPosition(),
                                                }}
                                                title={`Current 30-minute period · ${countryTimezone()}`}
                                                aria-label="Current 30-minute period"
                                              >
                                                ★
                                              </span>
                                            )
                                          }

                                          {
                                            test && (
                                              <button
                                                type="button"
                                                className={`admin-live-tests__event admin-live-tests__event--striped ${timelineStatusClass(
                                                  test,
                                                )}`}
                                                style={
                                                  timelinePosition(
                                                    test,
                                                  )
                                                }
                                                title={`${test.code} · ${displayTestTime(
                                                  test,
                                                )} ${timezoneShortName(
                                                  countryTimezone(),
                                                )} · ${test.durationMinutes} min · ${test.frozenQuestions}/${test.expectedQuestions} questions · ${test.status}`}
                                                aria-label={`${program} Live Test ${test.code}, ${displayTestTime(
                                                  test,
                                                )} ${timezoneShortName(
                                                  countryTimezone(),
                                                )}, ${test.durationMinutes} minutes`}
                                                onClick={() =>
                                                  setSelectedCode(
                                                    test.code,
                                                  )
                                                }
                                                onDoubleClick={(event) =>
                                                  event.stopPropagation()
                                                }
                                              />
                                            )
                                          }
                                        </div>
                                      </div>
                                    );
                                  },
                                )
                              }
                            </div>
                          </section>
                        ),
                      )
                    }
                  </div>
                </div>
              )
      }





      {
        addEventDraft && (
          <div
            className="admin-live-tests__edit-backdrop"
            role="presentation"
            onMouseDown={() => setAddEventDraft(null)}
          >
            <section
              className="admin-live-tests__add-dialog"
              role="dialog"
              aria-modal="true"
              aria-label="Add Live event"
              onMouseDown={(event) => event.stopPropagation()}
            >
              <button
                type="button"
                className="admin-live-tests__edit-x"
                aria-label="Close"
                onClick={() => setAddEventDraft(null)}
              >
                ×
              </button>

              <small>ADD LIVE EVENT</small>
              <h2>
                {addEventDraft.program} · {prettyDate(addEventDraft.scheduleDate)}
              </h2>

              <div className="admin-live-tests__add-type">
                <button
                  type="button"
                  className={addEventDraft.type === "CLASS" ? "is-active" : ""}
                  onClick={() =>
                    setAddEventDraft((current) =>
                      current ? { ...current, type: "CLASS" } : current,
                    )
                  }
                >
                  Live Class
                </button>
                <button
                  type="button"
                  disabled={Boolean(testFor(addEventDraft.scheduleDate, addEventDraft.program))}
                  className={addEventDraft.type === "TEST" ? "is-active" : ""}
                  title={
                    testFor(addEventDraft.scheduleDate, addEventDraft.program)
                      ? "This program already has a Live Test on this date"
                      : "Create and freeze a Live Test paper"
                  }
                  onClick={() =>
                    setAddEventDraft((current) =>
                      current ? { ...current, type: "TEST" } : current,
                    )
                  }
                >
                  Live Test
                </button>
              </div>

              <div className="admin-live-tests__add-grid">
                <label>
                  <span>Start</span>
                  <input
                    type="time"
                    value={addEventDraft.startLocal}
                    onChange={(event) =>
                      setAddEventDraft((current) =>
                        current ? { ...current, startLocal: event.target.value } : current,
                      )
                    }
                  />
                </label>

                {addEventDraft.type === "CLASS" ? (
                  <label>
                    <span>End</span>
                    <input
                      type="time"
                      value={addEventDraft.endLocal}
                      onChange={(event) =>
                        setAddEventDraft((current) =>
                          current ? { ...current, endLocal: event.target.value } : current,
                        )
                      }
                    />
                  </label>
                ) : (
                  <label>
                    <span>Duration (auto)</span>
                    <input
                      type="text"
                      readOnly
                      value={`${addEventDraft.durationMinutes} min`}
                    />
                  </label>
                )}
              </div>

              {addEventDraft.type === "CLASS" ? (
                <>
                  <label className="admin-live-tests__add-field">
                    <span>Subject</span>
                    <select
                      value={addEventDraft.subject}
                      onChange={(event) =>
                        setAddEventDraft((current) =>
                          current ? { ...current, subject: event.target.value } : current,
                        )
                      }
                    >
                      {addEventDraft.program === "JEE" && <option value="MATH">Math</option>}
                      <option value="PHYSICS">Physics</option>
                      <option value="CHEMISTRY">Chemistry</option>
                      {addEventDraft.program === "NEET" && <option value="BIOLOGY">Biology</option>}
                      {addEventDraft.program === "SAT" && <option value="MATH">Math</option>}
                    </select>
                  </label>
                  <label className="admin-live-tests__add-field">
                    <span>Topic</span>
                    <input
                      type="text"
                      value={addEventDraft.topicName}
                      placeholder="Topic name"
                      onChange={(event) =>
                        setAddEventDraft((current) =>
                          current ? { ...current, topicName: event.target.value } : current,
                        )
                      }
                    />
                  </label>
                </>
              ) : (
                <label className="admin-live-tests__add-field">
                  <span>Question load</span>
                  <select
                    value={addEventDraft.fractionPercent}
                    onChange={(event) =>
                      setAddEventDraft((current) =>
                        current
                          ? {
                              ...current,
                              fractionPercent: Number(event.target.value),
                              durationMinutes: durationForFraction(
                                current.program,
                                Number(event.target.value),
                              ),
                            }
                          : current,
                      )
                    }
                  >
                    {[10, 20, 25, 30, 50, 75, 100].map((value) => (
                      <option key={value} value={value}>{value}%</option>
                    ))}
                  </select>
                  <small>
                    Default: {defaultFractionForDate(addEventDraft.scheduleDate)}% {
                      new Date(
                        `${addEventDraft.scheduleDate}T12:00:00Z`,
                      ).getUTCDay() === 6
                        ? "Saturday"
                        : new Date(
                            `${addEventDraft.scheduleDate}T12:00:00Z`,
                          ).getUTCDay() === 0
                          ? "Sunday sample"
                          : "weekday"
                    }. Questions and duration scale together; questions are frozen when saved.
                  </small>
                </label>
              )}

              {addEventMessage && (
                <div className="admin-live-tests__class-save-message">
                  {addEventMessage}
                </div>
              )}

              <button
                type="button"
                className="admin-live-tests__class-save"
                disabled={
                  addEventSaving ||
                  !addEventDraft.startLocal ||
                  (addEventDraft.type === "CLASS" &&
                    (!addEventDraft.endLocal || !addEventDraft.subject || !addEventDraft.topicName.trim()))
                }
                onClick={() => void createLiveEvent()}
              >
                {addEventSaving
                  ? "Saving…"
                  : addEventDraft.type === "TEST"
                    ? "Generate questions & add Live Test"
                    : "Add Live Class"}
              </button>
            </section>
          </div>
        )
      }


      {
        selectedClass && (
          <div
            className="admin-live-tests__edit-backdrop"
            role="presentation"
            onMouseDown={() =>
              setSelectedClass(
                null,
              )
            }
          >
            <section
              className="admin-live-tests__class-dialog"
              role="dialog"
              aria-modal="true"
              aria-label="Edit class time"
              onMouseDown={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <button
                type="button"
                className="admin-live-tests__edit-x"
                aria-label="Close"
                onClick={() =>
                  setSelectedClass(
                    null,
                  )
                }
              >
                ×
              </button>

              <small>
                CLASS SCHEDULE
              </small>

              <h2>
                {
                  selectedClass.program
                } · {
                  selectedClass.subject
                }
              </h2>

              <p>
                {
                  selectedClass.topicName
                }
              </p>

              {
                selectedClass.createdAt && (
                  <small className="admin-live-tests__created-at">
                    Created: {
                      createdTimeText(
                        selectedClass.createdAt,
                      )
                    }
                    {
                      selectedClass.adminModifiedAt
                        ? ` · Last Modified: ${createdTimeText(
                            selectedClass.adminModifiedAt,
                          )}`
                        : ""
                    }
                  </small>
                )
              }

              <div className="admin-live-tests__class-time-grid">
                <label>
                  <span>
                    Start
                  </span>

                  <input
                    type="time"
                    value={
                      classDraftStart
                    }
                    onChange={(
                      event,
                    ) =>
                      setClassDraftStart(
                        event.target.value,
                      )
                    }
                  />
                </label>

                <label>
                  <span>
                    End
                  </span>

                  <input
                    type="time"
                    value={
                      classDraftEnd
                    }
                    onChange={(
                      event,
                    ) =>
                      setClassDraftEnd(
                        event.target.value,
                      )
                    }
                  />
                </label>
              </div>

              {
                classSaveMessage && (
                  <div className="admin-live-tests__class-save-message">
                    {
                      classSaveMessage
                    }
                  </div>
                )
              }

              <button
                type="button"
                className="admin-live-tests__class-delete"
                disabled={
                  classSaving
                }
                onClick={() =>
                  void deleteClass(
                    selectedClass,
                  )
                }
              >
                Delete class
              </button>

              <button
                type="button"
                className="admin-live-tests__class-save"
                disabled={
                  classSaving ||
                  !classDraftStart ||
                  !classDraftEnd
                }
                onClick={() =>
                  void saveClassTime()
                }
              >
                {
                  classSaving
                    ? "Saving…"
                    : "Save class time"
                }
              </button>
            </section>
          </div>
        )
      }


      {
        testBatchDialogOpen && (
          <div
            className="admin-live-tests__edit-backdrop"
            role="presentation"
            onMouseDown={() =>
              setTestBatchDialogOpen(
                false,
              )
            }
          >
            <section
              className="admin-live-tests__batch-dialog admin-live-tests__test-batch-dialog"
              role="dialog"
              aria-modal="true"
              aria-label="Live Test batch settings"
              onMouseDown={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <button
                type="button"
                className="admin-live-tests__edit-x"
                aria-label="Close"
                onClick={() =>
                  setTestBatchDialogOpen(
                    false,
                  )
                }
              >
                ×
              </button>

              <small>
                LIVE TEST BATCH
              </small>

              <h2>
                Generate / Recreate
              </h2>

              <div className="admin-live-tests__test-batch-dialog-grid">
                <label>
                  <span>
                    Exam
                  </span>

                  <select
                    value={
                      batchExam
                    }
                    onChange={(
                      event,
                    ) => {
                      setBatchExam(
                        event.target
                          .value as
                            BatchExam,
                      );

                      setTestBatchMessage(
                        "",
                      );
                      setClassBatchMessage(
                        "",
                      );
                    }}
                  >
                    {
                      (
                        [
                          "JEE",
                          "NEET",
                          "SAT",
                          "GRE",
                          "OLSAT",
                        ] as
                          BatchExam[]
                      ).map(
                        (
                          exam,
                        ) => {
                          const status =
                            batchPrograms
                              .find(
                                (
                                  item,
                                ) =>
                                  item.program ===
                                  exam,
                              );

                          return (
                            <option
                              key={
                                exam
                              }
                              value={
                                exam
                              }
                            >
                              {
                                exam
                              }
                              {
                                status &&
                                !status.configured
                                  ? " · setup required"
                                  : ""
                              }
                            </option>
                          );
                        },
                      )
                    }
                  </select>
                </label>

                <label>
                  <span>
                    Batch
                  </span>

                  <select
                    value={
                      selectedTestBatchCode
                    }
                    onChange={(
                      event,
                    ) => {
                      setSelectedTestBatchCode(
                        event
                          .target
                          .value,
                      );

                      setTestBatchMessage(
                        "",
                      );
                      setClassBatchMessage(
                        "",
                      );
                    }}
                  >
                    {
                      testBatches.map(
                        (
                          batch,
                        ) => (
                          <option
                            key={
                              batch.batch_code
                            }
                            value={
                              batch.batch_code
                            }
                          >
                            {
                              batch.label
                            }
                          </option>
                        ),
                      )
                    }
                  </select>
                </label>
              </div>

              <div className="admin-live-tests__test-batch-dialog-summary">
                {
                  testBatchPreview
                    ? (
                        <>
                          <strong>
                            {
                              batchExam
                            } · {
                              testBatchPreview.label
                            }
                          </strong>

                          <span>
                            {
                              testBatchPreview.startDate
                            } → {
                              testBatchPreview.endDate
                            }
                          </span>

                          {
                            testBatchPreview.configured
                              ? (
                                  <span>
                                    Weekday 10%: {
                                      testBatchPreview.weekdayTests
                                    } · Saturday 20%: {
                                      testBatchPreview.saturdayTests
                                    } · Sunday 50%: {
                                      testBatchPreview.sundayTests
                                    } · Planned: {
                                      testBatchPreview.plannedTests
                                    }
                                  </span>
                                )
                              : (
                                  <span>
                                    {
                                      batchExam
                                    } Live Test setup is not ready yet.
                                  </span>
                                )
                          }

                          <span>
                            Existing automatic: {
                              testBatchPreview.existingAutoTests
                            } · Admin-created preserved: {
                              testBatchPreview.adminTests
                            }
                          </span>

                          {
                            testBatchPreview.missingScheduleDays >
                              0 && (
                              <span>
                                {
                                  testBatchPreview.missingScheduleDays
                                } eligible days currently have no usable class/week schedule.
                              </span>
                            )
                          }
                        </>
                      )
                    : (
                        <span>
                          Loading batch preview…
                        </span>
                      )
                }
              </div>

              {
                (
                  batchExam === "JEE" ||
                  batchExam === "NEET" ||
                  batchExam === "SAT"
                ) && (
                  <>
                    <button
                      type="button"
                      className="admin-live-tests__batch-copy admin-live-tests__test-batch-generate"
                      disabled={
                        classBatchBusy ||
                        !classBatchPreview ||
                        !classBatchPreview.configured
                      }
                      onClick={() =>
                        void runClassBatch()
                      }
                    >
                      {
                        classBatchBusy
                          ? "Working…"
                          : classBatchPreview &&
                              classBatchPreview.missingRows === 0 &&
                              !classBatchPreview.needsNormalization
                            ? "Recreate class batch"
                            : classBatchPreview &&
                                classBatchPreview.missingRows === 0 &&
                                classBatchPreview.needsNormalization
                              ? "Apply / normalize 38-day template"
                              : "Generate / complete class batch"
                      }
                    </button>

                    {
                      classBatchMessage && (
                        <div className="admin-live-tests__batch-message">
                          {
                            classBatchMessage
                          }
                        </div>
                      )
                    }
                  </>
                )
              }

              <button
                type="button"
                className="admin-live-tests__batch-copy admin-live-tests__test-batch-generate"
                disabled={
                  testBatchBusy ||
                  !testBatchPreview ||
                  !testBatchPreview
                    .configured
                }
                onClick={() =>
                  void runTestBatch()
                }
              >
                {
                  testBatchBusy
                    ? "Working…"
                    : testBatchPreview &&
                        testBatchPreview
                          .existingAutoTests >
                          0
                      ? "Recreate Live Test batch"
                      : "Generate Live Test batch"
                }
              </button>

              {
                testBatchMessage && (
                  <div className="admin-live-tests__batch-message">
                    {
                      testBatchMessage
                    }
                  </div>
                )
              }

              <small className="admin-live-tests__batch-note">
                Weekdays use 10%; Saturdays use 20%; Sundays use 50%. Question count and duration scale together. Admin-created tests are preserved when a batch is recreated.
              </small>
            </section>
          </div>
        )
      }


      {
        batchDialogOpen && (
          <div
            className="admin-live-tests__edit-backdrop"
            role="presentation"
            onMouseDown={() =>
              setBatchDialogOpen(
                false,
              )
            }
          >
            <section
              className="admin-live-tests__batch-dialog"
              role="dialog"
              aria-modal="true"
              aria-label="Batch settings"
              onMouseDown={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <button
                type="button"
                className="admin-live-tests__edit-x"
                aria-label="Close"
                onClick={() =>
                  setBatchDialogOpen(
                    false,
                  )
                }
              >
                ×
              </button>

              <small>
                BATCH SETTINGS
              </small>

              <h2>
                {
                  batchTitle()
                }
              </h2>

              <div className="admin-live-tests__batch-current">
                <span>
                  Current batch
                </span>

                <strong>
                  {
                    batchTitle()
                      .replace(
                        "Batch: ",
                        "",
                      )
                  }
                </strong>

                <small>
                  Current automatically follows the active two-month period.
                </small>
              </div>

              <div className="admin-live-tests__batch-next">
                <span>
                  Next batch
                </span>

                <strong>
                  {
                    nextBatchLabel()
                  }
                </strong>
              </div>

              <button
                type="button"
                className="admin-live-tests__batch-copy"
                disabled={
                  batchCopying
                }
                onClick={() =>
                  void copyToNextBatch()
                }
              >
                {
                  batchCopying
                    ? "Copying…"
                    : "Copy current class schedule → next batch"
                }
              </button>

              {
                batchMessage && (
                  <div className="admin-live-tests__batch-message">
                    {
                      batchMessage
                    }
                  </div>
                )
              }

              <small className="admin-live-tests__batch-note">
                Live Tests themselves are generated from the copied class schedule; existing attempts/results are never copied.
              </small>
            </section>
          </div>
        )
      }


      {
        countryPickerOpen && (
          <div
            className="admin-live-tests__edit-backdrop"
            role="presentation"
            onMouseDown={() =>
              setCountryPickerOpen(
                false,
              )
            }
          >
            <section
              className="admin-live-tests__country-dialog"
              role="dialog"
              aria-modal="true"
              aria-label="Live Test country"
              onMouseDown={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <button
                type="button"
                className="admin-live-tests__edit-x"
                aria-label="Close"
                onClick={() =>
                  setCountryPickerOpen(
                    false,
                  )
                }
              >
                ×
              </button>

              <small>
                LIVE TESTS
              </small>

              <h2>
                Country
              </h2>

              <div className="admin-live-tests__edit-country">
                <div>
                  <button
                    type="button"
                    className={
                      country ===
                        "IN"
                        ? "is-active"
                        : ""
                    }
                    onClick={() => {
                      setCountry(
                        "IN",
                      );

                      setSelectedCode(
                        null,
                      );

                      setCountryPickerOpen(
                        false,
                      );
                    }}
                  >
                    IN
                  </button>

                  <button
                    type="button"
                    className={
                      country ===
                        "US"
                        ? "is-active"
                        : ""
                    }
                    onClick={() => {
                      setCountry(
                        "US",
                      );

                      setSelectedCode(
                        null,
                      );
                    }}
                  >
                    US
                  </button>
                </div>
              </div>

              {
                country ===
                  "US" && (
                  <label
                    style={{
                      display:
                        "grid",
                      gap:
                        "5px",
                      marginTop:
                        "10px",
                    }}
                  >
                    <span>
                      Location
                    </span>

                    <select
                      value={
                        countryTimezone()
                      }
                      onChange={(
                        event,
                      ) => {
                        saveAdminTimezone(
                          event.target
                            .value,
                        );

                        setSelectedCode(
                          null,
                        );
                      }}
                    >
                      <option value="America/Los_Angeles">
                        Riverside, CA · Pacific
                      </option>
                      <option value="America/Denver">
                        Denver, CO · Mountain
                      </option>
                      <option value="America/Chicago">
                        Chicago, IL · Central
                      </option>
                      <option value="America/New_York">
                        New York, NY · Eastern
                      </option>
                      <option value="America/Phoenix">
                        Phoenix, AZ
                      </option>
                    </select>
                  </label>
                )
              }

              <button
                type="button"
                className="admin-live-tests__class-save"
                style={{
                  marginTop:
                    "10px",
                }}
                onClick={() =>
                  setCountryPickerOpen(
                    false,
                  )
                }
              >
                Done
              </button>
            </section>
          </div>
        )
      }


      {
        selectedTest && (
          <div
            className="admin-live-tests__edit-backdrop"
            role="presentation"
            onMouseDown={() =>
              setSelectedCode(
                null,
              )
            }
          >
            <section
              className="admin-live-tests__edit-dialog"
              role="dialog"
              aria-modal="true"
              aria-labelledby="admin-live-test-edit-title"
              onMouseDown={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <button
                type="button"
                className="admin-live-tests__edit-x"
                aria-label="Close"
                onClick={() =>
                  setSelectedCode(
                    null,
                  )
                }
              >
                ×
              </button>

              <small>
                LIVE TEST
              </small>

              <h2
                id="admin-live-test-edit-title"
              >
                #{selectedTest.code} · {
                  selectedTest.program
                }
              </h2>

              <p>
                {
                  prettyDate(
                    selectedTest.scheduleDate,
                  )
                } · {
                  selectedTest.frozenQuestions
                }/{
                  selectedTest.expectedQuestions
                } frozen questions
              </p>

              <div className="admin-live-tests__edit-country">
                <span>
                  Country
                </span>

                <div>
                  <button
                    type="button"
                    className={
                      country ===
                        "IN"
                        ? "is-active"
                        : ""
                    }
                    onClick={() => {
                      setCountry(
                        "IN",
                      );

                      setSelectedCode(
                        null,
                      );
                    }}
                  >
                    IN
                  </button>

                  <button
                    type="button"
                    className={
                      country ===
                        "US"
                        ? "is-active"
                        : ""
                    }
                    onClick={() => {
                      setCountry(
                        "US",
                      );

                      setSelectedCode(
                        null,
                      );
                    }}
                  >
                    US
                  </button>
                </div>
              </div>

              <div className="admin-live-tests__edit-fields">
                <label>
                  <span>
                    Start time
                  </span>

                  <input
                    type="time"
                    value={
                      selectedTest.localTime
                    }
                    onChange={(
                      event,
                    ) =>
                      updateDraft(
                        selectedTest.code,
                        {
                          localTime:
                            event.target.value,
                        },
                      )
                    }
                  />
                </label>

                <label>
                  <span>
                    Duration
                  </span>

                  <div className="admin-live-tests__edit-duration">
                    <input
                      type="number"
                      min="1"
                      max="480"
                      value={
                        selectedTest.durationMinutes
                      }
                      onChange={(
                        event,
                      ) =>
                        updateDraft(
                          selectedTest.code,
                          {
                            durationMinutes:
                              Number(
                                event.target.value,
                              ),
                          },
                        )
                      }
                    />

                    <small>
                      min
                    </small>
                  </div>
                </label>
              </div>

              <div className="admin-live-tests__edit-section">
                <span>
                  Visibility
                </span>

                <div className="admin-live-tests__visibility">
                  <button
                    type="button"
                    className={
                      selectedTest.visibilityMode ===
                        "AUTO"
                        ? "is-active is-auto"
                        : ""
                    }
                    onClick={() =>
                      updateDraft(
                        selectedTest.code,
                        {
                          visibilityMode:
                            "AUTO",
                        },
                      )
                    }
                  >
                    Auto
                  </button>

                  <button
                    type="button"
                    className={
                      selectedTest.visibilityMode ===
                        "HIDE"
                        ? "is-active is-hide"
                        : ""
                    }
                    onClick={() =>
                      updateDraft(
                        selectedTest.code,
                        {
                          visibilityMode:
                            "HIDE",
                        },
                      )
                    }
                  >
                    Hide
                  </button>

                  <button
                    type="button"
                    className={
                      selectedTest.visibilityMode ===
                        "SHOW"
                        ? "is-active is-show"
                        : ""
                    }
                    disabled={
                      !selectedTest.ready
                    }
                    onClick={() =>
                      updateDraft(
                        selectedTest.code,
                        {
                          visibilityMode:
                            "SHOW",
                        },
                      )
                    }
                  >
                    Show
                  </button>
                </div>
              </div>

              <div className="admin-live-tests__edit-status">
                <span>
                  Status
                </span>

                <strong>
                  {
                    selectedTest.ready
                      ? "Ready"
                      : "Needs attention"
                  } ({
                    selectedTest.status
                  } · {
                    selectedTest.frozenQuestions
                  }/{
                    selectedTest.expectedQuestions
                  } questions)
                </strong>

                {
                  selectedTest.createdAt && (
                    <small>
                      Created: {
                        createdTimeText(
                          selectedTest.createdAt,
                        )
                      }
                      {
                        selectedTest.adminModifiedAt
                          ? ` · Last Modified: ${createdTimeText(
                              selectedTest.adminModifiedAt,
                            )}`
                          : ""
                      }
                    </small>
                  )
                }
              </div>

              {
                hasEnded(
          selectedTest,
          nowMs,
        ) && (
                  <div className="admin-live-tests__participation">
                    <span>
                      Participation
                    </span>

                    {
                      participantSummaryLoading
                        ? (
                            <small>
                              Loading…
                            </small>
                          )
                        : (
                            <div>
                              <button
                                type="button"
                                onClick={() =>
                                  void openParticipants(
                                    selectedTest,
                                    "GYAN",
                                  )
                                }
                                disabled={
                                  !participantSummary ||
                                  participantSummary.humanCount ===
                                    0
                                }
                              >
                                👤 Humans{" "}
                                <strong>
                                  {
                                    participantSummary
                                      ?.humanCount ??
                                    0
                                  }
                                </strong>
                              </button>

                              <button
                                type="button"
                                onClick={() =>
                                  void openParticipants(
                                    selectedTest,
                                    "SYNTHETIC",
                                  )
                                }
                                disabled={
                                  !participantSummary ||
                                  participantSummary.botCount ===
                                    0
                                }
                              >
                                🤖 Bots{" "}
                                <strong>
                                  {
                                    participantSummary
                                      ?.botCount ??
                                    0
                                  }
                                </strong>
                              </button>
                            </div>
                          )
                    }
                  </div>
                )
              }


              <div className="admin-live-tests__edit-actions">
                <button
                  type="button"
                  className="admin-live-tests__view"
                  disabled={
                    reviewLoading
                  }
                  onClick={() => {
                    setSelectedCode(
                      null,
                    );

                    void viewQuestions(
                      selectedTest,
                    );
                  }}
                >
                  {
                    reviewLoading
                      ? "Loading…"
                      : "View Questions"
                  }
                </button>

                <button
                  type="button"
                  className="admin-live-tests__add"
                  disabled
                  title="Custom same-day Live Tests will be added later"
                >
                  Add Test
                </button>

                {
                  selectedTest.eventKind ===
                    "ADMIN_AD_HOC" && (
                    <button
                      type="button"
                      className="admin-live-tests__delete-test"
                      disabled={
                        savingCode ===
                        selectedTest.code
                      }
                      onClick={() =>
                        void deleteLiveTest(
                          selectedTest,
                        )
                      }
                    >
                      Delete Test
                    </button>
                  )
                }

                <button
                  type="button"
                  className="admin-live-tests__save"
                  disabled={
                    savingCode ===
                    selectedTest.code
                  }
                  onClick={() =>
                    void save(
                      selectedTest,
                    )
                  }
                >
                  {
                    savingCode ===
                      selectedTest.code
                      ? "Saving…"
                      : "Save"
                  }
                </button>
              </div>
            </section>
          </div>
        )
      }


      {
        participantListType &&
        selectedTest && (
          <div
            className="admin-live-tests__drill-backdrop"
            role="presentation"
            onMouseDown={() =>
              setParticipantListType(
                null,
              )
            }
          >
            <section
              className="admin-live-tests__scoreboard"
              role="dialog"
              aria-modal="true"
              aria-label="Live Test participant scores"
              onMouseDown={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <header>
                <div>
                  <small>
                    {
                      participantListType ===
                        "GYAN"
                        ? "HUMAN RESULTS"
                        : "BOT RESULTS"
                    }
                  </small>

                  <h2>
                    #{selectedTest.code}
                  </h2>
                </div>

                <button
                  type="button"
                  aria-label="Close participant scores"
                  onClick={() =>
                    setParticipantListType(
                      null,
                    )
                  }
                >
                  ×
                </button>
              </header>

              {
                participantsLoading
                  ? (
                      <div className="admin-live-tests__drill-state">
                        Loading results…
                      </div>
                    )
                  : participantsError
                    ? (
                        <div className="admin-live-tests__drill-state is-error">
                          {
                            participantsError
                          }
                        </div>
                      )
                    : participants.length ===
                        0
                      ? (
                          <div className="admin-live-tests__drill-state">
                            No participants found.
                          </div>
                        )
                      : (
                          <div className="admin-live-tests__score-table">
                            <div className="admin-live-tests__score-head">
                              <span>
                                Participant
                              </span>

                              <span>
                                Score
                              </span>

                              <span>
                                Answered
                              </span>

                              <span>
                                Status
                              </span>
                            </div>

                            {
                              participants.map(
                                (
                                  participant,
                                ) => (
                                  <div
                                    key={`${participant.participantType}:${participant.participantKey}`}
                                    className="admin-live-tests__score-row"
                                  >
                                    <strong>
                                      {
                                        participantLabel(
                                          participant,
                                        )
                                      }
                                    </strong>

                                    {
                                      participant.attemptId &&
                                      participant.correctCount !==
                                        null
                                        ? (
                                            <button
                                              type="button"
                                              className="admin-live-tests__score-link"
                                              onClick={() =>
                                                void openParticipantResult(
                                                  selectedTest,
                                                  participant,
                                                )
                                              }
                                            >
                                              {
                                                participant.correctCount
                                              }/{
                                                participant.questionCount
                                              }
                                              {
                                                participant.scorePercent !==
                                                  null
                                                  ? ` · ${participant.scorePercent}%`
                                                  : ""
                                              }
                                            </button>
                                          )
                                        : (
                                            <span>
                                              —
                                            </span>
                                          )
                                    }

                                    <span>
                                      {
                                        participant.answeredCount
                                      }/{
                                        participant.questionCount ||
                                        selectedTest.expectedQuestions
                                      }
                                    </span>

                                    <small>
                                      {
                                        participant.submittedAt
                                          ? "Submitted"
                                          : "Entered"
                                      }
                                    </small>
                                  </div>
                                ),
                              )
                            }
                          </div>
                        )
              }
            </section>
          </div>
        )
      }


      {
        (
          participantResultLoading ||
          participantResultError ||
          participantResult
        ) &&
        selectedTest && (
          <div
            className="admin-live-tests__result-backdrop"
            role="presentation"
            onMouseDown={() => {
              setParticipantResult(
                null,
              );

              setParticipantResultError(
                "",
              );
            }}
          >
            <section
              className="admin-live-tests__participant-result"
              role="dialog"
              aria-modal="true"
              aria-label="Participant Live Test result"
              onMouseDown={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <header>
                <div>
                  <small>
                    LIVE TEST RESULT
                  </small>

                  <h2>
                    #{selectedTest.code}
                    {
                      participantResult
                        ? ` · ${
                            participantResult.participant.participantType ===
                              "GYAN"
                              ? `GYAN #${participantResult.participant.participantKey}`
                              : participantResult.participant.participantKey
                          }`
                        : ""
                    }
                  </h2>
                </div>

                <button
                  type="button"
                  aria-label="Close participant result"
                  onClick={() => {
                    setParticipantResult(
                      null,
                    );

                    setParticipantResultError(
                      "",
                    );
                  }}
                >
                  ×
                </button>
              </header>

              {
                participantResultLoading
                  ? (
                      <div className="admin-live-tests__drill-state">
                        Loading result…
                      </div>
                    )
                  : participantResultError
                    ? (
                        <div className="admin-live-tests__drill-state is-error">
                          {
                            participantResultError
                          }
                        </div>
                      )
                    : participantResult && (
                        <>
                          <div className="admin-live-tests__participant-result-summary">
                            <strong>
                              {
                                participantResult.attempt.correctCount
                              }/{
                                participantResult.attempt.questionCount
                              }
                            </strong>

                            <span>
                              {
                                participantResult.attempt.scorePercent
                              }% correct
                            </span>

                            <small>
                              ✓ {
                                participantResult.attempt.correctCount
                              } · ✕ {
                                participantResult.attempt.incorrectCount
                              } · ○ {
                                participantResult.attempt.unansweredCount
                              }
                            </small>
                          </div>

                          {
                            participantResult.questions.length ===
                              0
                              ? (
                                  <div className="admin-live-tests__drill-state">
                                    Detailed answers were not recorded for this participant.
                                  </div>
                                )
                              : (
                                  <div className="admin-live-tests__participant-result-questions">
                                    {
                                      participantResult.questions.map(
                                        (
                                          question,
                                        ) => (
                                          <article
                                            key={
                                              question.questionId
                                            }
                                            className={
                                              question.correct
                                                ? "is-correct"
                                                : "is-wrong"
                                            }
                                          >
                                            <header>
                                              <strong>
                                                Q{
                                                  question.questionOrder
                                                }
                                              </strong>

                                              <span>
                                                {
                                                  question.section ??
                                                  "Question"
                                                }
                                              </span>

                                              <b>
                                                {
                                                  question.correct
                                                    ? "✓"
                                                    : question.selectedChoice
                                                      ? "✕"
                                                      : "○"
                                                }
                                              </b>
                                            </header>

                                            <p>
                                              {
                                                question.questionText
                                              }
                                            </p>

                                            <div className="admin-live-tests__participant-result-answer">
                                              Your answer:{" "}
                                              <b>
                                                {
                                                  question.selectedChoice ??
                                                  "—"
                                                }
                                              </b>
                                              {" · "}
                                              Correct:{" "}
                                              <b>
                                                {
                                                  question.correctChoice
                                                }
                                              </b>
                                            </div>

                                            {
                                              question.explanation && (
                                                <small>
                                                  {
                                                    question.explanation
                                                  }
                                                </small>
                                              )
                                            }
                                          </article>
                                        ),
                                      )
                                    }
                                  </div>
                                )
                          }
                        </>
                      )
              }
            </section>
          </div>
        )
      }


      {
        (
          reviewLoading ||
          reviewError ||
          review
        ) && (
          <section className="admin-live-tests__review">
            <header className="admin-live-tests__review-header">
              <div>
                <strong>
                  {
                    review
                      ? `#${review.test.code} · ${review.test.program}`
                      : "Live Test Questions"
                  }
                </strong>

                {
                  review && (
                    <small>
                      {
                        prettyDate(
                          review
                            .test
                            .scheduleDate,
                        )
                      }
                      {" · "}
                      {
                        review.questions.length
                      }
                      {" frozen questions"}
                    </small>
                  )
                }
              </div>

              <button
                type="button"
                aria-label="Close question review"
                onClick={() => {
                  setReview(
                    null,
                  );

                  setReviewError(
                    "",
                  );
                }}
              >
                ×
              </button>
            </header>

            {
              reviewLoading && (
                <div className="admin-live-tests__review-state">
                  Loading frozen questions…
                </div>
              )
            }

            {
              reviewError && (
                <div className="admin-live-tests__review-state">
                  {reviewError}
                </div>
              )
            }

            {
              review &&
              review.questions.length ===
                0 && (
                <div className="admin-live-tests__review-state">
                  No frozen questions are stored for this test.
                </div>
              )
            }

            {
              review &&
              review.questions.map(
                (
                  question,
                ) => (
                  <article
                    key={
                      question.questionId
                    }
                    className="admin-live-tests__review-question"
                  >
                    <div className="admin-live-tests__review-meta">
                      <strong>
                        Q
                        {
                          question.order
                        }
                      </strong>

                      <span>
                        {
                          question.subject ||
                          question.section ||
                          "—"
                        }
                      </span>

                      {
                        question.topic && (
                          <span>
                            {
                              question.topic
                            }
                          </span>
                        )
                      }

                      <span>
                        {
                          question.difficulty
                        }
                      </span>

                      <span>
                        {
                          question.selectionReason
                        }
                      </span>
                    </div>

                    <p>
                      {
                        question.questionText
                      }
                    </p>

                    <div className="admin-live-tests__review-choices">
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
                              key={
                                choice
                              }
                              className={
                                question.correctChoice ===
                                  choice
                                  ? "is-correct"
                                  : ""
                              }
                            >
                              <strong>
                                {choice}.
                              </strong>
                              {" "}
                              {
                                question
                                  .choices[
                                  choice
                                ]
                              }
                            </div>
                          ),
                        )
                      }
                    </div>

                    <div className="admin-live-tests__review-answer">
                      <strong>
                        Correct:
                      </strong>
                      {" "}
                      {
                        question.correctChoice
                      }

                      {
                        question.explanation && (
                          <>
                            {" · "}
                            {
                              question.explanation
                            }
                          </>
                        )
                      }
                    </div>
                  </article>
                ),
              )
            }
          </section>
        )
      }

    </main>
  );
}
