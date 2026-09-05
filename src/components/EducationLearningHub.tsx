import {
  useEffect,
  useState,
} from "react";

import QRCode
  from "qrcode";

import EducationPortal
  from "./EducationPortal";

import MockTestsPage
  from "./MockTestsPage";

import LittleLearnersExperience
  from "./LittleLearnersExperience";

import {
  checkPracticeAnswer,
  loadPracticeQuestions,
  loadSubjects,
  loadTopics,
  type EducationCountry,
  type LearningItem,
  type PracticeQuestion,
  type TopicItem,
} from "../config/educationLearning";

import {
  saveEducationProgress,
  sendEducationRecoveryLink,
  type EducationReportTopic,
  type SavedStudentCard,
} from "../config/educationProgress";

import "./EducationLearningHub.css";


type PortalSelection = {
  type:
    | "grade"
    | "program";

  code: string;
  name: string;
  countryCode?: string;
  programCode?: string;
  experienceType?: string;
};


type Step =
  | "portal"
  | "subjects"
  | "topics"
  | "skills"
  | "questions"
  | "report"
  | "program-report"
  | "student-card"
  | "little-learners"
  | "mock-tests";


type AnswerState = {
  selectedChoice?:
    string;

  result?: {
    correct: boolean;
    correctChoice: string;
    explanation: string;
  };
};


type SatSkillItem = {
  code: string;
  name: string;
  questionCount: number;
};


type PracticeSequence = {
  mode: "sequential";
  advanced: boolean;
  wrapped: boolean;
  completedCycles: number;
  start: number;
  end: number;
  total: number;
  hasMore: boolean;
};


type EducationAttemptSummary = {
  totalAttempts: number;

  recentAttempts: {
    id: number;
    subjectCode: string;
    topicCode: string;
    questionCount: number;
    correctCount: number;
    scorePercent: number;
    createdAt: string;
  }[];
};


type EducationTopicProgress = {
  subjectCode: string;
  topicCode: string;
  uniqueQuestionsAttempted: number;
  answersCount: number;
  correctAnswers: number;
  scorePercent: number | null;
};


type EducationMockAttemptReport = {
  id: number;
  testId: number;
  testCode: string;
  testName: string;
  testKind: string;
  examLevel: string;
  programCode?: string;
  attemptNumber: number;
  questionCount: number;
  score: number;
  maximumMarks: number;
  scorePercent: number;
  correctCount: number;
  incorrectCount: number;
  unansweredCount: number;
  elapsedSeconds: number;
  saveCount: number;
  submittedAt: string;
  questionResults: Array<{
    questionId: number;
    sectionCode: string;
    questionOrder: number;
    status:
      | "correct"
      | "wrong"
      | "unanswered";
    selectedAnswer: string;
    questionText: string;
    choices: {
      A: string;
      B: string;
      C: string;
      D: string;
    };
    correctAnswer: string;
    explanation: string | null;
  }>;
  percentile?: number | null;
};

type EducationProtectionStatus = {
  answeredCount: number;
  emailProtected: boolean;
  milestone25Shown: boolean;
  milestone50Shown: boolean;
};


type EducationProgressReport = {
  attemptSummary: EducationAttemptSummary;
  topicProgress: EducationTopicProgress[];
  mockAttempts: EducationMockAttemptReport[];
  protection: EducationProtectionStatus;
};


type ProgramReportTopic = {
  subjectCode: string;
  subjectName: string;
  topicCode: string;
  topicName: string;
  questionCount: number;
  completionPercent: number;
  scorePercent: number | null;
};


type EducationTeacher = {
  id: number;
  name: string;
  email: string;
  subjects: string;
  location: string | null;
  bio: string | null;
  status: string;
};


type EducationTeacherAssignment = {
  id: number;
  status: string;
  requestedAt: string;
  assignedAt: string | null;
  teacher: EducationTeacher | null;
};


type EducationTeacherRequest = {
  id: number;
  studentCode: string;
  studentName: string;
  displayName: string;
  requestedAt: string;
  email: string;
  phone: string;
  subjects: string;
};


interface EducationLearningHubProps {
  country:
    EducationCountry;

  activeGyanCode?:
    string;

  activeGyanName?:
    string;

  activeGyanEmail?:
    string;

  activeGyanEmailKnown?:
    boolean;

  adminAuthenticated?:
    boolean;

  onBack:
    () => void;
}


export default function EducationLearningHub({
  country,
  activeGyanCode,
  activeGyanName,
  activeGyanEmail,
  activeGyanEmailKnown,
  adminAuthenticated =
    false,
  onBack,
}: EducationLearningHubProps) {
  const [
    step,
    setStep,
  ] =
    useState<Step>(() =>
      window.location.pathname ===
      "/education/aba"
        ? "little-learners"
        : "portal",
    );

  const [
    grade,
    setGrade,
  ] =
    useState<
      PortalSelection |
      null
    >(
      null,
    );

  const [
    mockProgram,
    setMockProgram,
  ] =
    useState<
      string |
      null
    >(
      null,
    );


  const [
    expandedSubjectCode,
    setExpandedSubjectCode,
  ] =
    useState<string | null>(
      null,
    );

  const [
    subjectTopicsLoading,
    setSubjectTopicsLoading,
  ] =
    useState(
      false,
    );


  const [
    subjects,
    setSubjects,
  ] =
    useState<
      LearningItem[]
    >(
      [],
    );


  const [
    subject,
    setSubject,
  ] =
    useState<
      LearningItem |
      null
    >(
      null,
    );

  const [
    topics,
    setTopics,
  ] =
    useState<
      TopicItem[]
    >(
      [],
    );

  const [
    topic,
    setTopic,
  ] =
    useState<
      TopicItem |
      null
    >(
      null,
    );


  const [
    satSkills,
    setSatSkills,
  ] =
    useState<SatSkillItem[]>(
      [],
    );

  const [
    satSkill,
    setSatSkill,
  ] =
    useState<SatSkillItem | null>(
      null,
    );

  const [
    questions,
    setQuestions,
  ] =
    useState<
      PracticeQuestion[]
    >(
      [],
    );

  const [
    practiceSequence,
    setPracticeSequence,
  ] =
    useState<
      PracticeSequence |
      null
    >(
      null,
    );


  const [
    answers,
    setAnswers,
  ] =
    useState<
      Record<
        number,
        AnswerState
      >
    >(
      {},
    );

  const [
    submitted,
    setSubmitted,
  ] =
    useState(
      false,
    );

  const [
    practiceQuestionIndex,
    setPracticeQuestionIndex,
  ] =
    useState(
      0,
    );

  const [
    practiceReviewIds,
    setPracticeReviewIds,
  ] =
    useState<
      number[]
    >(
      [],
    );

  const [
    reportTopics,
    setReportTopics,
  ] =
    useState<
      EducationReportTopic[]
    >(
      [],
    );

  const [
    attemptSummary,
    setAttemptSummary,
  ] =
    useState<
      EducationAttemptSummary |
      null
    >(
      null,
    );

  const [
,
    setTopicProgress,
  ] =
    useState<
      EducationTopicProgress[]
    >(
      [],
    );


  const [
    programReportTopics,
    setProgramReportTopics,
  ] =
    useState<
      ProgramReportTopic[]
    >(
      [],
    );

  const [
    programMockAttempts,
    setProgramMockAttempts,
  ] =
    useState<
      EducationMockAttemptReport[]
    >(
      [],
    );

  const [
    teacherDialogOpen,
    setTeacherDialogOpen,
  ] =
    useState(
      false,
    );

  const [teacherRequestDialogOpen, setTeacherRequestDialogOpen] = useState(false);
  const [teacherRequestEmail, setTeacherRequestEmail] = useState(activeGyanEmail ?? "");
  const [teacherRequestPhone, setTeacherRequestPhone] = useState("");
  const [teacherRequestSubjects, setTeacherRequestSubjects] = useState("");


  const [
    registrationDialog,
    setRegistrationDialog,
  ] =
    useState<
      {
        title: string;
        message: string;
      } |
      null
    >(
      null,
    );


  const [
    teachers,
    setTeachers,
  ] =
    useState<
      EducationTeacher[]
    >(
      [],
    );

  const [
    teacherAssignment,
    setTeacherAssignment,
  ] =
    useState<
      EducationTeacherAssignment |
      null
    >(
      null,
    );

  const [
    teacherRequests,
    setTeacherRequests,
  ] =
    useState<
      EducationTeacherRequest[]
    >(
      [],
    );

  const [
    teacherBusy,
    setTeacherBusy,
  ] =
    useState(
      false,
    );

  const [
    teacherMessage,
    setTeacherMessage,
  ] =
    useState("");

  const [
    teacherRegisterOpen,
    setTeacherRegisterOpen,
  ] =
    useState(
      false,
    );

  const [
    teacherName,
    setTeacherName,
  ] =
    useState("");

  const [
    teacherEmail,
    setTeacherEmail,
  ] =
    useState(
      activeGyanEmail ??
      "",
    );

  const [
    teacherSubjects,
    setTeacherSubjects,
  ] =
    useState("");

  const [
    teacherLocation,
    setTeacherLocation,
  ] =
    useState("");

  const [
    teacherBio,
    setTeacherBio,
  ] =
    useState("");

  const [
    teacherSelections,
    setTeacherSelections,
  ] =
    useState<
      Record<
        number,
        number
      >
    >(
      {},
    );


  const [
    selectedMockAttempt,
    setSelectedMockAttempt,
  ] =
    useState<
      EducationMockAttemptReport |
      null
    >(
      null,
    );

  const [
    selectedMockQuestion,
    setSelectedMockQuestion,
  ] =
    useState<
      EducationMockAttemptReport[
        "questionResults"
      ][number] |
      null
    >(
      null,
    );

  const [
    protectionStatus,
    setProtectionStatus,
  ] =
    useState<
      EducationProtectionStatus
    >({
      answeredCount:
        0,
      emailProtected:
        activeGyanEmailKnown ===
          true,
      milestone25Shown:
        false,
      milestone50Shown:
        false,
    });

  const [
    practiceProtectionStage,
    setPracticeProtectionStage,
  ] =
    useState<
      25 |
      50 |
      null
    >(
      null,
    );

  const [
    practiceRecoveryEmail,
    setPracticeRecoveryEmail,
  ] =
    useState("");

  const [
    practiceRecoveryEmailError,
    setPracticeRecoveryEmailError,
  ] =
    useState("");

  const [
    practiceRecoverySending,
    setPracticeRecoverySending,
  ] =
    useState(
      false,
    );

  const [
    programReportLoading,
    setProgramReportLoading,
  ] =
    useState(false);

  const [
    saveFormOpen,
    setSaveFormOpen,
  ] =
    useState(
      false,
    );

  const [
    studentName,
    setStudentName,
  ] =
    useState("");

  const [
    studentEmail,
    setStudentEmail,
  ] =
    useState("");

  const [
    savedStudent,
    setSavedStudent,
  ] =
    useState<
      SavedStudentCard |
      null
    >(
      null,
    );

  const [
    qrDataUrl,
    setQrDataUrl,
  ] =
    useState("");

  const [
    recoverySent,
    setRecoverySent,
  ] =
    useState(
      false,
    );


  const [
    loading,
    setLoading,
  ] =
    useState(
      false,
    );

  const [
    error,
    setError,
  ] =
    useState("");


  const [
    autoSaveMessage,
    setAutoSaveMessage,
  ] =
    useState("");


  const normalizedActiveGyanCode =
    activeGyanCode
      ?.trim()
      .toUpperCase() ??
    "";

  const activeGyanCodeLabel =
    normalizedActiveGyanCode
      ? `${normalizedActiveGyanCode}${
          activeGyanEmailKnown ===
            false
            ? "*"
            : ""
        }`
      : "";


  async function loadProtectionStatus():
  Promise<EducationProtectionStatus | null> {
    if (
      !normalizedActiveGyanCode
    ) {
      return null;
    }

    try {
      const response =
        await fetch(
          `/api/education/protection-status?student=${encodeURIComponent(
            normalizedActiveGyanCode,
          )}`,
          {
            credentials:
              "include",
            cache:
              "no-store",
          },
        );

      if (!response.ok) {
        return null;
      }

      const body =
        await response.json() as {
          protection?:
            EducationProtectionStatus;
        };

      if (
        !body.protection
      ) {
        return null;
      }

      setProtectionStatus(
        body.protection,
      );

      return body.protection;
    } catch {
      return null;
    }
  }


  async function markPracticeProtectionShown(
    milestone:
      25 |
      50,
  ): Promise<void> {
    if (
      !normalizedActiveGyanCode
    ) {
      return;
    }

    try {
      await fetch(
        "/api/education/protection-milestone",
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
              studentCode:
                normalizedActiveGyanCode,
              milestone,
            }),
        },
      );
    } catch {
      // Reminders must never block practice.
    }
  }


  async function maybeShowPracticeProtection(
    status:
      EducationProtectionStatus,
  ): Promise<void> {
    /*
     * Trust the server-owned protection state here.
     *
     * The parent may temporarily report emailKnown=true while
     * the GYAN identity is still loading. Using that transient
     * prop can suppress a legitimate 25/50 warning permanently
     * for this mount.
     */
    if (
      status.emailProtected
    ) {
      return;
    }

    if (
      status.answeredCount >=
        50 &&
      !status.milestone50Shown
    ) {
      setPracticeProtectionStage(
        50,
      );

      return;
    }

    if (
      status.answeredCount >=
        25 &&
      !status.milestone25Shown &&
      !status.milestone50Shown
    ) {
      setPracticeProtectionStage(
        25,
      );
    }
  }


  async function acknowledgePracticeProtection():
  Promise<void> {
    const milestone =
      practiceProtectionStage;

    if (
      milestone !== 25 &&
      milestone !== 50
    ) {
      setPracticeProtectionStage(
        null,
      );

      return;
    }

    setPracticeProtectionStage(
      null,
    );

    setProtectionStatus(
      (
        current,
      ) => ({
        ...current,
        milestone25Shown:
          milestone === 50
            ? true
            : current.milestone25Shown ||
              milestone === 25,
        milestone50Shown:
          current.milestone50Shown ||
          milestone === 50,
      }),
    );

    await markPracticeProtectionShown(
      milestone,
    );
  }


  async function protectPracticeGyan():
  Promise<void> {
    const email =
      practiceRecoveryEmail
        .trim()
        .toLowerCase();

    if (
      !/^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/.test(
        email,
      )
    ) {
      setPracticeRecoveryEmailError(
        "Enter a valid email address.",
      );

      return;
    }

    setPracticeRecoverySending(
      true,
    );

    setPracticeRecoveryEmailError(
      "",
    );

    try {
      const response =
        await fetch(
          "/api/gyan-identity/email",
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
              }),
          },
        );

      const body =
        await response
          .json()
          .catch(
            () => ({}),
          ) as {
            error?: string;
          };

      if (!response.ok) {
        throw new Error(
          body.error ??
          "Recovery email could not be added.",
        );
      }

      setProtectionStatus(
        (
          current,
        ) => ({
          ...current,
          emailProtected:
            true,
        }),
      );

      setPracticeProtectionStage(
        null,
      );
    } catch (
      caught
    ) {
      setPracticeRecoveryEmailError(
        caught instanceof
          Error
          ? caught.message
          : "Recovery email could not be added.",
      );
    } finally {
      setPracticeRecoverySending(
        false,
      );
    }
  }


  useEffect(
    () => {
      if (
        !normalizedActiveGyanCode
      ) {
        return;
      }

      let cancelled =
        false;

      void (
        async () => {
          try {
            const response =
              await fetch(
                `/api/education/protection-status?student=${encodeURIComponent(
                  normalizedActiveGyanCode,
                )}`,
                {
                  credentials:
                    "include",
                  cache:
                    "no-store",
                },
              );

            if (
              !response.ok ||
              cancelled
            ) {
              return;
            }

            const body =
              await response.json() as {
                protection?:
                  EducationProtectionStatus;
              };

            if (
              !body.protection ||
              cancelled
            ) {
              return;
            }

            setProtectionStatus(
              body.protection,
            );

            await maybeShowPracticeProtection(
              body.protection,
            );
          } catch {
            /*
             * Protection status is helpful but must never
             * interrupt ordinary Education navigation.
             */
          }
        }
      )();

      return () => {
        cancelled =
          true;
      };
    },
    [
      normalizedActiveGyanCode,
    ],
  );


  function showRegistrationMessage(
    topicName:
      string,
    message?:
      string,
  ): void {
    const cleanedMessage =
      (
        message ??
        ""
      )
        .trim();

    setError(
      "",
    );

    setRegistrationDialog({
      title:
        topicName ||
        "Class Registration",

      message:
        cleanedMessage ||
        `To register for "${topicName}", contact admin@gyan.cc`,
    });
  }


  function isRegistrationMessage(
    message:
      string,
  ): boolean {
    const normalized =
      message
        .trim()
        .toLowerCase();

    return (
      normalized.includes(
        "contact admin@gyan.cc",
      ) ||
      normalized.includes(
        "to register for",
      ) ||
      normalized.includes(
        "register for",
      )
    );
  }


  async function loadTeacherData():
  Promise<void> {
    setTeacherBusy(
      true,
    );

    setTeacherMessage(
      "",
    );

    try {
      const teacherResponse =
        await fetch(
          "/api/education/teachers",
          {
            credentials:
              "include",
            cache:
              "no-store",
          },
        );

      const teacherBody =
        await teacherResponse.json() as {
          teachers?:
            EducationTeacher[];
          error?:
            string;
        };

      if (
        !teacherResponse.ok
      ) {
        throw new Error(
          teacherBody.error ??
          "Teachers could not be loaded.",
        );
      }

      setTeachers(
        teacherBody.teachers ??
        [],
      );

      if (
        normalizedActiveGyanCode
      ) {
        const assignmentResponse =
          await fetch(
            `/api/education/teacher-assignment?student=${encodeURIComponent(
              normalizedActiveGyanCode,
            )}`,
            {
              credentials:
                "include",
              cache:
                "no-store",
            },
          );

        if (
          assignmentResponse.ok
        ) {
          const assignmentBody =
            await assignmentResponse.json() as {
              assignment?:
                EducationTeacherAssignment |
                null;
            };

          setTeacherAssignment(
            assignmentBody.assignment ??
            null,
          );
        }
      }

      if (
        adminAuthenticated
      ) {
        const requestResponse =
          await fetch(
            "/api/education/teacher-assignment/requests",
            {
              credentials:
                "include",
              cache:
                "no-store",
            },
          );

        if (
          requestResponse.ok
        ) {
          const requestBody =
            await requestResponse.json() as {
              requests?:
                EducationTeacherRequest[];
            };

          setTeacherRequests(
            requestBody.requests ??
            [],
          );
        }
      }
    } catch (
      caught
    ) {
      setTeacherMessage(
        caught instanceof
          Error
          ? caught.message
          : "Teacher information could not be loaded.",
      );
    } finally {
      setTeacherBusy(
        false,
      );
    }
  }


  async function openTeachers():
  Promise<void> {
    setTeacherDialogOpen(
      true,
    );

    await loadTeacherData();
  }


  async function requestTeacher(): Promise<void> {
    if (!normalizedActiveGyanCode) { setTeacherMessage("Open or create a GYAN first."); return; }
    const email = teacherRequestEmail.trim().toLowerCase();
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) { setTeacherMessage("Enter a valid email address."); return; }
    setTeacherBusy(true); setTeacherMessage("");
    try {
      const response = await fetch("/api/education/teacher-assignment/request", { method:"POST", credentials:"include", headers:{"content-type":"application/json"}, body:JSON.stringify({ studentCode:normalizedActiveGyanCode, email, phone:teacherRequestPhone.trim(), subjects:teacherRequestSubjects.trim() }) });
      const body = await response.json() as { requested?: boolean; error?: string };
      if (!response.ok || !body.requested) throw new Error(body.error ?? "Teacher request could not be sent.");
      setTeacherRequestDialogOpen(false); setTeacherMessage("✓ Teacher request sent to GYAN Admin."); await loadTeacherData();
    } catch (caught) { setTeacherMessage(caught instanceof Error ? caught.message : "Teacher request could not be sent."); }
    finally { setTeacherBusy(false); }
  }


  async function registerTeacher():
  Promise<void> {
    setTeacherBusy(
      true,
    );

    setTeacherMessage(
      "",
    );

    try {
      const response =
        await fetch(
          "/api/education/teachers/register",
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
                name:
                  teacherName,
                email:
                  teacherEmail,
                subjects:
                  teacherSubjects,
                location:
                  teacherLocation,
                bio:
                  teacherBio,
              }),
          },
        );

      const body =
        await response.json() as {
          saved?: boolean;
          status?: string;
          error?: string;
        };

      if (
        !response.ok ||
        !body.saved
      ) {
        throw new Error(
          body.error ??
          "Teacher registration could not be saved.",
        );
      }

      setTeacherRegisterOpen(
        false,
      );

      setTeacherMessage(
        "✓ Registration submitted for admin approval.",
      );

      await loadTeacherData();
    } catch (
      caught
    ) {
      setTeacherMessage(
        caught instanceof
          Error
          ? caught.message
          : "Teacher registration could not be saved.",
      );
    } finally {
      setTeacherBusy(
        false,
      );
    }
  }


  async function approveTeacher(
    teacherId:
      number,
  ): Promise<void> {
    setTeacherBusy(
      true,
    );

    setTeacherMessage(
      "",
    );

    try {
      const response =
        await fetch(
          "/api/education/teachers/approve",
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
                teacherId,
              }),
          },
        );

      const body =
        await response.json() as {
          approved?: boolean;
          error?: string;
        };

      if (
        !response.ok ||
        !body.approved
      ) {
        throw new Error(
          body.error ??
          "Teacher could not be approved.",
        );
      }

      setTeacherMessage(
        "✓ Teacher approved.",
      );

      await loadTeacherData();
    } catch (
      caught
    ) {
      setTeacherMessage(
        caught instanceof
          Error
          ? caught.message
          : "Teacher could not be approved.",
      );
    } finally {
      setTeacherBusy(
        false,
      );
    }
  }


  async function assignTeacherToRequest(
    requestId:
      number,
  ): Promise<void> {
    const teacherId =
      teacherSelections[
        requestId
      ];

    if (!teacherId) {
      setTeacherMessage(
        "Choose an approved teacher.",
      );

      return;
    }

    setTeacherBusy(
      true,
    );

    setTeacherMessage(
      "",
    );

    try {
      const response =
        await fetch(
          "/api/education/teacher-assignment/assign",
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
                requestId,
                teacherId,
              }),
          },
        );

      const body =
        await response.json() as {
          assigned?: boolean;
          error?: string;
        };

      if (
        !response.ok ||
        !body.assigned
      ) {
        throw new Error(
          body.error ??
          "Teacher could not be assigned.",
        );
      }

      setTeacherMessage(
        "✓ Teacher assigned.",
      );

      await loadTeacherData();
    } catch (
      caught
    ) {
      setTeacherMessage(
        caught instanceof
          Error
          ? caught.message
          : "Teacher could not be assigned.",
      );
    } finally {
      setTeacherBusy(
        false,
      );
    }
  }


  function scoreState(
    scorePercent:
      number |
      null |
      undefined,
  ):
    "green" |
    "light-green" |
    "yellow" |
    "orange" |
    "red" |
    "none" {
    if (
      scorePercent ==
        null
    ) {
      return "none";
    }

    if (
      scorePercent >=
        80
    ) {
      return "green";
    }

    if (
      scorePercent >=
        60
    ) {
      return "light-green";
    }

    if (
      scorePercent >=
        40
    ) {
      return "yellow";
    }

    if (
      scorePercent >=
        20
    ) {
      return "orange";
    }

    return "red";
  }


  function mockScoreState(
    scorePercent:
      number,
  ):
    "green" |
    "light-green" |
    "yellow" |
    "orange" |
    "red" {
    if (
      scorePercent <
      0
    ) {
      return "red";
    }

    if (
      scorePercent <
      30
    ) {
      return "orange";
    }

    if (
      scorePercent <
      60
    ) {
      return "yellow";
    }

    if (
      scorePercent <
      80
    ) {
      return "light-green";
    }

    return "green";
  }


  function mockSubjectLabel(
    sectionCode:
      string,
  ): string {
    const normalized =
      sectionCode
        .trim()
        .toUpperCase();

    if (
      normalized ===
      "MATH"
    ) {
      return "Mathematics";
    }

    if (
      normalized ===
      "PHYSICS"
    ) {
      return "Physics";
    }

    if (
      normalized ===
      "CHEMISTRY"
    ) {
      return "Chemistry";
    }

    return sectionCode;
  }


  function mockLevelLabel(
    examLevel:
      string,
  ): string {
    if (
      examLevel ===
      "MAIN"
    ) {
      return "Main";
    }

    if (
      examLevel ===
      "ADVANCED"
    ) {
      return "Advanced";
    }

    return examLevel;
  }


  function latestTopicAttempt(
    subjectCode: string,
    topicCode: string,
  ) {
    return attemptSummary
      ?.recentAttempts
      .filter(
        (attempt) =>
          attempt.subjectCode ===
            subjectCode &&
          attempt.topicCode ===
            topicCode,
      )
      .sort(
        (left, right) =>
          right.createdAt.localeCompare(
            left.createdAt,
          ),
      )[0];
  }


  async function loadEducationProgressReport(
    program?:
      "JEE" |
      "NEET",
  ):
    Promise<EducationProgressReport> {
    const empty:
      EducationProgressReport = {
      attemptSummary: {
        totalAttempts:
          0,
        recentAttempts:
          [],
      },
      topicProgress:
        [],
      mockAttempts:
        [],
      protection: {
        answeredCount:
          0,
        emailProtected:
          activeGyanEmailKnown ===
            true,
        milestone25Shown:
          false,
        milestone50Shown:
          false,
      },
    };

    if (
      !normalizedActiveGyanCode
    ) {
      setAttemptSummary(
        empty.attemptSummary,
      );
      setTopicProgress(
        [],
      );

      return empty;
    }

    const response =
      await fetch(
        `/api/education/report?student=${encodeURIComponent(
          normalizedActiveGyanCode,
        )}${program ? `&program=${encodeURIComponent(program)}` : ""}`,
        {
          credentials:
            "include",
          cache:
            "no-store",
        },
      );

    if (
      !response.ok
    ) {
      throw new Error(
        "Progress report could not be loaded.",
      );
    }

    const body =
      await response.json() as {
        attemptSummary?:
          EducationAttemptSummary;
        topicProgress?:
          EducationTopicProgress[];
        mockAttempts?:
          EducationMockAttemptReport[];
        protection?:
          EducationProtectionStatus;
      };

    const result:
      EducationProgressReport = {
      attemptSummary:
        body.attemptSummary ??
        empty.attemptSummary,
      topicProgress:
        Array.isArray(
          body.topicProgress,
        )
          ? body.topicProgress
          : [],
      mockAttempts:
        Array.isArray(
          body.mockAttempts,
        )
          ? body.mockAttempts
          : [],
      protection:
        body.protection ??
        empty.protection,
    };

    setAttemptSummary(
      result.attemptSummary,
    );
    setTopicProgress(
      result.topicProgress,
    );

    setProtectionStatus(
      result.protection,
    );

    return result;
  }


  async function openProgramReport(
    program:
      "JEE" |
      "NEET",
  ): Promise<void> {
    const programGradeCode =
      program ===
        "NEET"
        ? "PROGRAM_NEET"
        : "PROGRAM_JEE";

    const programName =
      program ===
        "NEET"
        ? "NEET"
        : "IIT-JEE";

    setProgramReportLoading(
      true,
    );
    setError("");

    try {
      const progressReport =
        await loadEducationProgressReport(
          program,
        );

      setProgramMockAttempts(
        progressReport.mockAttempts,
      );

      const reportSubjects =
        await loadSubjects(
          "IN",
          programGradeCode,
        );

      const progressByTopic =
        new Map<
          string,
          EducationTopicProgress
        >(
          progressReport.topicProgress.map(
            (item) => [
              `${item.subjectCode}::${item.topicCode}`,
              item,
            ],
          ),
        );

      const rows:
        ProgramReportTopic[] =
          [];

      for (
        const reportSubject of
          reportSubjects
      ) {
        const reportSubjectTopics =
          await loadTopics(
            "IN",
            programGradeCode,
            reportSubject.code,
          );

        for (
          const reportTopic of
            reportSubjectTopics
        ) {
          const progressItem =
            progressByTopic.get(
              `${reportSubject.code}::${reportTopic.code}`,
            );

          const uniqueQuestionsAttempted =
            progressItem
              ?.uniqueQuestionsAttempted ??
            0;

          const completionPercent =
            reportTopic.questionCount >
              0
              ? Math.min(
                  100,
                  Math.round(
                    (
                      uniqueQuestionsAttempted /
                      reportTopic.questionCount
                    ) *
                      100,
                  ),
                )
              : 0;

          rows.push({
            subjectCode:
              reportSubject.code,
            subjectName:
              reportSubject.name
                .replace(
                  /^JEE\s+/i,
                  "",
                ),
            topicCode:
              reportTopic.code,
            topicName:
              reportTopic.name,
            questionCount:
              reportTopic.questionCount,
            completionPercent,
            scorePercent:
              progressItem
                ?.scorePercent ??
              null,
          });
        }
      }

      setGrade({
        type:
          "program",
        code:
          programGradeCode,
        name:
          programName,
      });
      setSubjects(
        reportSubjects,
      );
      setProgramReportTopics(
        rows,
      );
      setStep(
        "program-report",
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Progress report could not be loaded.",
      );
    } finally {
      setProgramReportLoading(
        false,
      );
    }
  }


  async function openProgramReportTopic(
    reportItem:
      ProgramReportTopic,
  ): Promise<void> {
    setLoading(
      true,
    );
    setError("");

    try {
      const nextSubjects =
        subjects.length
          ? subjects
          : await loadSubjects(
              "IN",
              grade?.code ??
              grade?.code ??
        "PROGRAM_JEE",
            );

      const nextSubject =
        nextSubjects.find(
          (item) =>
            item.code ===
            reportItem.subjectCode,
        );

      if (
        !nextSubject
      ) {
        throw new Error(
          "Subject could not be opened.",
        );
      }

      const nextTopics =
        await loadTopics(
          "IN",
          grade?.code ??
        "PROGRAM_JEE",
          nextSubject.code,
        );

      const nextTopic =
        nextTopics.find(
          (item) =>
            item.code ===
            reportItem.topicCode,
        );

      if (
        !nextTopic
      ) {
        throw new Error(
          "Topic could not be opened.",
        );
      }

      const nextQuestions =
        await loadPracticeQuestions(
          "IN",
          grade?.code ??
        "PROGRAM_JEE",
          nextSubject.code,
          nextTopic.code,
        );

      setGrade({
        type:
          "program",
        code:
          grade?.code ??
        "PROGRAM_JEE",
        name:
          "IIT-JEE",
      });
      setSubjects(
        nextSubjects,
      );
      setSubject(
        nextSubject,
      );
      setTopics(
        nextTopics,
      );
      setTopic(
        nextTopic,
      );
      setQuestions(
        nextQuestions,
      );
      setAnswers(
        {},
      );
      setSubmitted(
        false,
      );
      setPracticeQuestionIndex(
        0,
      );
      setPracticeReviewIds(
        [],
      );
      setStep(
        "questions",
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Topic could not be opened.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  function learningCountryFor(
    selection:
      PortalSelection |
      null,
  ): EducationCountry {
    const selectedCountry =
      selection
        ?.countryCode
        ?.trim()
        .toUpperCase();

    if (
      selectedCountry
    ) {
      return selectedCountry as
        EducationCountry;
    }

    return country;
  }


  const educationAccessNotice =
    normalizedActiveGyanCode &&
    activeGyanEmailKnown ===
      false
      ? (
          <div
            className="education-learning__access-warning"
            role="note"
          >
            <strong>
              ⚠ [{activeGyanCodeLabel}]
            </strong>{" "}
            Add a recovery email when convenient. It helps restore this GYAN if browser/device access code is lost.
          </div>
        )
      : null;


  useEffect(() => {
    const syncEducationRoute =
      (): void => {
        setStep(
          window.location.pathname ===
            "/education/aba"
            ? "little-learners"
            : "portal",
        );
      };

    window.addEventListener(
      "popstate",
      syncEducationRoute,
    );

    return () => {
      window.removeEventListener(
        "popstate",
        syncEducationRoute,
      );
    };
  }, []);


  async function loadTopicList(
    selection:
      PortalSelection,

    selectedSubject:
      LearningItem,
  ): Promise<void> {
    const next =
      await loadTopics(
        learningCountryFor(
          selection,
        ),
        selection.code,
        selectedSubject.code,
      );

    setSubject(
      selectedSubject,
    );

    setTopics(
      next,
    );

    setStep(
      "topics",
    );
  }


  async function toggleProgramSubject(
    selectedSubject:
      LearningItem,
  ): Promise<void> {
    if (
      !grade ||
      grade.type !==
        "program"
    ) {
      return;
    }

    if (
      expandedSubjectCode ===
        selectedSubject.code
    ) {
      setExpandedSubjectCode(
        null,
      );
      return;
    }

    setSubjectTopicsLoading(
      true,
    );
    setError(
      "",
    );

    try {
      const nextTopics =
        await loadTopics(
          learningCountryFor(
            grade,
          ),
          grade.code,
          selectedSubject.code,
        );

      setSubject(
        selectedSubject,
      );
      setTopics(
        nextTopics,
      );
      setExpandedSubjectCode(
        selectedSubject.code,
      );
    } catch (caught) {
      setError(
        caught instanceof Error
          ? caught.message
          : "Topics unavailable.",
      );
    } finally {
      setSubjectTopicsLoading(
        false,
      );
    }
  }


  async function selectPortal(
    selection:
      PortalSelection,
  ): Promise<void> {
    if (
      selection.type ===
        "program" &&
      selection.code ===
        "LITTLE_LEARNERS"
    ) {
      window.history.pushState(
        {},
        "",
        "/education/aba",
      );

      setStep(
        "little-learners",
      );
      return;
    }

    if (
      selection.type ===
        "program"
    ) {
      const programGradeCode =
        selection.code;

      const programSelection:
        PortalSelection = {
        type:
          "program",

        code:
          programGradeCode,

        name:
          selection.name,

        countryCode:
          selection.countryCode,

        programCode:
          selection.programCode,

        experienceType:
          selection.experienceType,
      };

      setGrade(programSelection);
      setSubject(null);
      setTopic(null);
      setExpandedSubjectCode(null);
      setLoading(true);
      setError("");

      if (
        programGradeCode ===
          "PROGRAM_JEE" ||
        programGradeCode ===
          "PROGRAM_NEET"
      ) {
        void loadEducationProgressReport()
          .catch(
            () => {
              // Practice must remain available if report data cannot load.
            },
          );
      }

      try {
        const nextSubjects =
          await loadSubjects(
            learningCountryFor(
              programSelection,
            ),
            programGradeCode,
          );

        setSubjects(nextSubjects);

        if (
          nextSubjects.length === 1
        ) {
          await loadTopicList(
            programSelection,
            nextSubjects[0],
          );
          return;
        }

        if (
          nextSubjects.length === 0
        ) {
          setError(
            "No subjects are configured for this program yet.",
          );
        }

        setStep("subjects");
      } catch (caught) {
        setError(
          caught instanceof Error
            ? caught.message
            : "Program could not be loaded.",
        );
      } finally {
        setLoading(false);
      }

      return;
    }

    setGrade(
      selection,
    );
    setExpandedSubjectCode(
      null,
    );

    setLoading(
      true,
    );

    setError("");

    try {
      const subjects =
        await loadSubjects(
          country,
          selection.code,
        );

      /*
       * Grade 6 currently has only Mathematics.
       * Skip a redundant subject screen when there
       * is exactly one subject.
       */
      if (
        subjects.length ===
          1
      ) {
        await loadTopicList(
          selection,
          subjects[0],
        );

        return;
      }

      /*
       * Keep the multi-subject architecture ready
       * for later grades.
       */
      setSubject(
        null,
      );

      setStep(
        "subjects",
      );

      setError(
        subjects.length ===
          0
          ? "No subjects are configured for this grade yet."
          : "",
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Subjects unavailable.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  async function loadPracticeBatch(
    selectedGrade:
      PortalSelection,
    selectedSubject:
      LearningItem,
    selectedTopic:
      TopicItem,
    selectedSubtopicCode?:
      string,
    advance =
      false,
  ): Promise<{
    questions:
      PracticeQuestion[];
    sequence:
      PracticeSequence |
      null;
  }> {
    const params =
      new URLSearchParams({
        country:
          learningCountryFor(
            selectedGrade,
          ),
        grade:
          selectedGrade.code,
        subject:
          selectedSubject.code,
        topic:
          selectedTopic.code,
      });

    if (
      selectedSubtopicCode
    ) {
      params.set(
        "subtopic",
        selectedSubtopicCode,
      );
    }

    if (advance) {
      params.set(
        "advance",
        "1",
      );
    }

    const response =
      await fetch(
        `/api/education/practice?${params.toString()}`,
        {
          credentials:
            "same-origin",
          cache:
            "no-store",
        },
      );

    const body =
      await response.json() as {
        questions?:
          PracticeQuestion[];
        sequence?:
          PracticeSequence;
        error?:
          string;
      };

    if (!response.ok) {
      throw new Error(
        body.error ??
          "Questions unavailable.",
      );
    }

    return {
      questions:
        body.questions ??
        [],
      sequence:
        body.sequence ??
        null,
    };
  }


  async function completePracticeBatch(): Promise<void> {
    if (
      !grade ||
      !subject ||
      !topic
    ) {
      return;
    }

    const params =
      new URLSearchParams({
        country:
          learningCountryFor(
            grade,
          ),
        grade:
          grade.code,
        subject:
          subject.code,
        topic:
          topic.code,
      });

    if (
      grade.code ===
        "PROGRAM_SAT" &&
      satSkill
    ) {
      params.set(
        "subtopic",
        satSkill.code,
      );
    }

    const response =
      await fetch(
        `/api/education/practice/complete?${params.toString()}`,
        {
          method:
            "POST",
          credentials:
            "same-origin",
          cache:
            "no-store",
        },
      );

    if (!response.ok) {
      const body =
        await response
          .json()
          .catch(
            () => ({}),
          ) as {
            error?: string;
          };

      throw new Error(
        body.error ??
          "Practice progress could not be advanced.",
      );
    }
  }


  async function selectTopic(
    item:
      TopicItem,
  ): Promise<void> {
    if (
      !grade ||
      !subject
    ) {
      return;
    }

    setTopic(
      item,
    );

    setSatSkill(
      null,
    );

    setLoading(
      true,
    );

    setError("");
    setAutoSaveMessage("");

    try {
      /*
       * SAT has one extra academic level:
       * Section -> Domain -> Skill -> Practice.
       *
       * JEE / NEET / school flows remain unchanged.
       */
      if (
        grade.code ===
          "PROGRAM_SAT"
      ) {
        const params =
          new URLSearchParams({
            country:
              learningCountryFor(
                grade,
              ),
            grade:
              grade.code,
            subject:
              subject.code,
            topic:
              item.code,
          });

        const response =
          await fetch(
            `/api/education/subtopics?${params.toString()}`,
            {
              cache:
                "no-store",
            },
          );

        const body =
          await response.json() as {
            subtopics?: SatSkillItem[];
            error?: string;
          };

        if (!response.ok) {
          throw new Error(
            body.error ??
              "SAT skills unavailable.",
          );
        }

        setSatSkills(
          body.subtopics ??
            [],
        );

        setStep(
          "skills",
        );

        return;
      }

      const batch =
        await loadPracticeBatch(
          grade,
          subject,
          item,
        );

      setQuestions(
        batch.questions,
      );

      setPracticeSequence(
        batch.sequence,
      );

      setAnswers(
        {},
      );

      setSubmitted(
        false,
      );

      setPracticeQuestionIndex(
        0,
      );

      setPracticeReviewIds(
        [],
      );

      setStep(
        "questions",
      );
    } catch (
      caught
    ) {
      const message =
        caught instanceof
        Error
          ? caught.message
          : "Questions unavailable.";

      if (
        isRegistrationMessage(
          message,
        )
      ) {
        showRegistrationMessage(
          item.name,
          message,
        );
      } else {
        setError(
          message,
        );
      }
    } finally {
      setLoading(
        false,
      );
    }
  }


  async function selectSatSkill(
    item:
      SatSkillItem,
  ): Promise<void> {
    if (
      !grade ||
      !subject ||
      !topic
    ) {
      return;
    }

    setSatSkill(
      item,
    );

    setLoading(
      true,
    );

    setError("");
    setAutoSaveMessage("");

    try {
      const params =
        new URLSearchParams({
          country:
            learningCountryFor(
              grade,
            ),
          grade:
            grade.code,
          subject:
            subject.code,
          topic:
            topic.code,
          subtopic:
            item.code,
        });

      const response =
        await fetch(
          `/api/education/practice?${params.toString()}`,
          {
            cache:
              "no-store",
          },
        );

      const body =
        await response.json() as {
          questions?: PracticeQuestion[];
          sequence?: PracticeSequence;
          error?: string;
        };

      if (!response.ok) {
        throw new Error(
          body.error ??
            "SAT practice questions unavailable.",
        );
      }

      const next =
        body.questions ??
          [];

      if (
        next.length <
          5
      ) {
        throw new Error(
          "This SAT skill does not yet have 5 practice questions.",
        );
      }

      setQuestions(
        next,
      );

      setPracticeSequence(
        body.sequence ??
        null,
      );

      setAnswers(
        {},
      );

      setSubmitted(
        false,
      );

      setPracticeQuestionIndex(
        0,
      );

      setPracticeReviewIds(
        [],
      );

      setStep(
        "questions",
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
        Error
          ? caught.message
          : "SAT practice questions unavailable.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }

  async function newFive():
    Promise<void> {
    if (
      !grade ||
      !subject ||
      !topic ||
      loading ||
      practiceSequence?.hasMore ===
        false
    ) {
      return;
    }

    setLoading(
      true,
    );

    setError("");

    try {
      const batch =
        await loadPracticeBatch(
          grade,
          subject,
          topic,
          grade.code ===
              "PROGRAM_SAT" &&
            satSkill
            ? satSkill.code
            : undefined,
          false,
        );

      setQuestions(
        batch.questions,
      );

      setPracticeSequence(
        batch.sequence,
      );

      setAnswers(
        {},
      );

      setSubmitted(
        false,
      );

      setPracticeQuestionIndex(
        0,
      );

      setPracticeReviewIds(
        [],
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Questions unavailable.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  function selectChoice(
    questionId:
      number,

    choice:
      string,
  ): void {
    if (
      submitted
    ) {
      return;
    }

    setAnswers(
      (
        current,
      ) => ({
        ...current,

        [
          questionId
        ]: {
          ...current[
            questionId
          ],

          selectedChoice:
            choice,
        },
      }),
    );
  }


  async function submitAnswers():
    Promise<void> {
    if (
      questions.some(
        (
          question,
        ) =>
          !answers[
            question.id
          ]?.selectedChoice,
      )
    ) {
      setError(
        "Please answer all 5 questions before submitting.",
      );

      return;
    }

    setLoading(
      true,
    );

    setError("");

    try {
      const entries =
        await Promise.all(
          questions.map(
            async (
              question,
            ) => {
              const selectedChoice =
                answers[
                  question.id
                ]
                  ?.selectedChoice ??
                "";

              const result =
                await checkPracticeAnswer(
                  question.id,
                  selectedChoice,
                );

              return [
                question.id,
                {
                  selectedChoice,
                  result,
                },
              ] as const;
            },
          ),
        );

      setAnswers(
        Object.fromEntries(
          entries,
        ),
      );

      setSubmitted(
        true,
      );

      await completePracticeBatch();

      if (
        normalizedActiveGyanCode &&
        grade &&
        subject &&
        topic
      ) {
        /*
         * Unified GYAN identity owns the Education save.
         * A recovery email is optional and must never
         * prevent an attempt from being saved.
         */
        const normalizedActiveEmail =
          activeGyanEmail
            ?.trim()
            .toLowerCase() ??
          "";

        setAutoSaveMessage(
          `Saving to [${activeGyanCodeLabel}]…`,
        );

        try {
          const checkedAnswers =
            Object.fromEntries(
              entries,
            );

          const saved =
            await saveEducationProgress({
              studentName:
                activeGyanName
                  ?.trim() ||
                "GYAN Learner",

              email:
                normalizedActiveEmail,

              country:
                learningCountryFor(
                  grade,
                ),

              grade:
                grade.code,

              subject:
                subject.code,

              topic:
                topic.code,

              studentCode:
                normalizedActiveGyanCode,

              answers:
                questions.map(
                  (question) => ({
                    questionId:
                      question.id,

                    selectedChoice:
                      checkedAnswers[
                        question.id
                      ]?.selectedChoice ??
                      "",
                  }),
                ),
            });

          setSavedStudent(
            saved.student,
          );

          setReportTopics(
            saved.report,
          );

          setAutoSaveMessage(
            `✓ Saved to [${activeGyanCodeLabel}]`,
          );

          const nextProtection =
            await loadProtectionStatus();

          if (
            nextProtection
          ) {
            await maybeShowPracticeProtection(
              nextProtection,
            );
          }
        } catch (
          saveCaught
        ) {
          setAutoSaveMessage(
            "⚠ Progress could not be saved automatically.",
          );

          setError(
            saveCaught instanceof
              Error
              ? saveCaught.message
              : "Progress could not be saved automatically.",
          );
        }
      }
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Answers could not be checked.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  const correctCount =
    questions.filter(
      (
        question,
      ) =>
        answers[
          question.id
        ]?.result
          ?.correct,
    )
      .length;

  const answeredCount =
    questions.filter(
      (
        question,
      ) =>
        Boolean(
          answers[
            question.id
          ]?.selectedChoice,
        ),
    ).length;

  const canSubmit =
    questions.length === 5 &&
    answeredCount === 5 &&
    !submitted;


  const currentPracticeQuestion =
    questions[
      Math.min(
        Math.max(
          practiceQuestionIndex,
          0,
        ),
        Math.max(
          0,
          questions.length -
          1,
        ),
      )
    ] ??
    null;

  const currentSatPracticeQuestion =
    currentPracticeQuestion as
      | (
          PracticeQuestion & {
            stimulusType?: string;
            stimulusText?: string;
            stimulusSecondaryText?: string;
          }
        )
      | null;

  const currentPracticeState =
    currentPracticeQuestion
      ? answers[
          currentPracticeQuestion.id
        ]
      : undefined;

  const absolutePracticeQuestionNumber =
    practiceSequence
      ? practiceSequence.start +
        practiceQuestionIndex
      : practiceQuestionIndex +
        1;


  function goToPracticeQuestion(
    index:
      number,
  ): void {
    if (
      questions.length ===
        0
    ) {
      return;
    }

    setPracticeQuestionIndex(
      Math.min(
        Math.max(
          index,
          0,
        ),
        questions.length -
          1,
      ),
    );
  }


  function togglePracticeReview():
  void {
    if (
      !currentPracticeQuestion ||
      submitted
    ) {
      return;
    }

    setPracticeReviewIds(
      (
        current,
      ) =>
        current.includes(
          currentPracticeQuestion.id,
        )
          ? current.filter(
              (
                questionId,
              ) =>
                questionId !==
                currentPracticeQuestion.id,
            )
          : [
              ...current,
              currentPracticeQuestion.id,
            ],
    );
  }



  function currentHeatmap():
    EducationReportTopic[] {
    return topics.map(
      (
        item,
      ) => {
        if (
          item.code !==
            topic?.code ||
          !submitted
        ) {
          return {
            code:
              item.code,
            name:
              item.name,
            attempts:
              0,
            questionsAnswered:
              0,
            correctAnswers:
              0,
            scorePercent:
              null,
          };
        }

        return {
          code:
            item.code,
          name:
            item.name,
          attempts:
            1,
          questionsAnswered:
            5,
          correctAnswers:
            correctCount,
          scorePercent:
            correctCount *
            20,
        };
      },
    );
  }


  async function saveProgress():
    Promise<void> {
    if (
      !grade ||
      !subject ||
      !topic ||
      !submitted
    ) {
      return;
    }

    const normalizedName =
      studentName.trim();

    const normalizedEmail =
      studentEmail
        .trim()
        .toLowerCase();

    if (!normalizedName) {
      setError(
        "Enter the student's name.",
      );

      return;
    }

    if (
      normalizedEmail &&
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        normalizedEmail,
      )
    ) {
      setError(
        "Enter a valid email address.",
      );

      return;
    }

    setLoading(
      true,
    );

    setError("");

    try {
      const saved =
        await saveEducationProgress({
          studentName:
            normalizedName,

          email:
            normalizedEmail,

          country:
            learningCountryFor(
              grade,
            ),

          grade:
            grade.code,

          subject:
            subject.code,

          topic:
            topic.code,

          studentCode:
            savedStudent
              ?.code,

          answers:
            questions.map(
              (
                question,
              ) => ({
                questionId:
                  question.id,

                selectedChoice:
                  answers[
                    question.id
                  ]
                    ?.selectedChoice ??
                  "",
              }),
            ),
        });

      setSavedStudent(
        saved.student,
      );

      setReportTopics(
        saved.report,
      );

      const qr =
        await QRCode.toDataURL(
          saved.student.cardUrl,
          {
            width:
              320,
            margin:
              1,
          },
        );

      setQrDataUrl(
        qr,
      );

      setSaveFormOpen(
        false,
      );

      setStep(
        "student-card",
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Progress could not be saved.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  async function sendRecovery():
    Promise<void> {
    if (
      !savedStudent
    ) {
      return;
    }

    setLoading(
      true,
    );

    setError("");

    try {
      await sendEducationRecoveryLink(
        savedStudent.email,
      );

      setRecoverySent(
        true,
      );
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Recovery email could not be sent.",
      );
    } finally {
      setLoading(
        false,
      );
    }
  }


  if (
    step ===
      "little-learners"
  ) {
    return (
      <>
        {educationAccessNotice}

        <LittleLearnersExperience
          onBack={() => {
            window.history.pushState(
              {},
              "",
              "/education",
            );

            setStep(
              "portal",
            );
          }}
        />
      </>
    );
  }


  if (
    step ===
      "mock-tests" &&
    mockProgram
  ) {
    return (
      <>
        {educationAccessNotice}

        <MockTestsPage
          program={
            mockProgram
          }

          activeGyanCode={
            normalizedActiveGyanCode
          }

          activeGyanEmailKnown={
            activeGyanEmailKnown ||
            protectionStatus.emailProtected
          }

          onBack={() => {
            setStep(
              "portal",
            );
          }}
        />
      </>
    );
  }


  if (
    step ===
      "portal"
  ) {
    return (
      <>
        {educationAccessNotice}

        <EducationPortal
          country={
            country
          }

          onBack={
            onBack
          }

          onMockTests={(
            program,
          ) => {
            /*
             * Mock tests are catalog driven. Do not whitelist
             * JEE / NEET / SAT / GRE / OLSAT here.
             */
            setMockProgram(
              program,
            );

            setStep(
              "mock-tests",
            );
          }}

          onReport={(
            program,
          ) => {
            if (
              program !==
                "JEE" &&
              program !==
                "NEET"
            ) {
              setError(
                `${program} report is not configured yet.`,
              );

              return;
            }

            void openProgramReport(
              program,
            );
          }}

          onSelect={(
            selection,
          ) => {
            void selectPortal(
              selection,
            );
          }}
        />
      </>
    );
  }


  return (
    <main
      className="education-learning"
    >
      {educationAccessNotice}

      <header
        className="education-learning__header"
      >
        <button
          type="button"
          onClick={() => {
            if (
              step ===
                "program-report"
            ) {
              setStep(
                "portal",
              );

              return;
            }

            if (
              step ===
                "student-card" ||
              step ===
                "report"
            ) {
              setStep(
                "questions",
              );

              return;
            }

            if (
              step ===
                "questions"
            ) {
              if (
                grade?.code ===
                  "PROGRAM_SAT"
              ) {
                setStep(
                  "skills",
                );
              } else if (
                grade?.type ===
                  "program"
              ) {
                setStep(
                  "subjects",
                );

                setExpandedSubjectCode(
                  subject?.code ??
                    null,
                );
              } else {
                setStep(
                  "topics",
                );
              }

              return;
            }

            if (
              step ===
                "skills"
            ) {
              setStep(
                "subjects",
              );

              setExpandedSubjectCode(
                subject?.code ??
                  null,
              );

              return;
            }

            if (
              step ===
                "topics" &&
              subjects.length >
                1
            ) {
              setStep(
                "subjects",
              );

              return;
            }

            setStep(
              "portal",
            );
          }}
        >
          ←
        </button>

        <div>
          <strong>
            🎓 Education
          </strong>

          <small>
            {
              [
                grade?.name,
                subject?.name,
                topic?.name,
              ]
                .filter(
                  Boolean,
                )
                .join(
                  " › ",
                )
            }
          </small>
        </div>
      </header>


      {
        registrationDialog && (
          <div
            className="education-learning__registration-backdrop"
            role="presentation"
            onMouseDown={() =>
              setRegistrationDialog(
                null,
              )
            }
          >
            <section
              className="education-learning__registration-dialog"
              role="dialog"
              aria-modal="true"
              aria-labelledby="education-registration-title"
              onMouseDown={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <button
                type="button"
                className="education-learning__registration-x"
                aria-label="Close"
                onClick={() =>
                  setRegistrationDialog(
                    null,
                  )
                }
              >
                ×
              </button>

              <small>
                CLASS REGISTRATION
              </small>

              <h2
                id="education-registration-title"
              >
                {
                  registrationDialog.title
                }
              </h2>

              <p>
                {
                  registrationDialog.message
                }
              </p>

              <div
                className="education-learning__registration-contact"
              >
                <span>
                  Contact
                </span>

                <a
                  href={`mailto:admin@gyan.cc?subject=${encodeURIComponent(
                    `GYAN Class Registration · ${registrationDialog.title}`,
                  )}`}
                >
                  admin@gyan.cc
                </a>
              </div>

              <div
                className="education-learning__registration-actions"
              >
                <button
                  type="button"
                  onClick={() =>
                    setRegistrationDialog(
                      null,
                    )
                  }
                >
                  Close
                </button>
              </div>
            </section>
          </div>
        )
      }


      {
        error && (
          <div
            className="education-learning__error"
          >
            {
              error
            }
          </div>
        )
      }


      {
        loading && (
          <div
            className="education-learning__state"
          >
            Loading…
          </div>
        )
      }


      {
        practiceProtectionStage && (
          <div
            className="education-learning__protect-backdrop"
            role="presentation"
            onMouseDown={() =>
              void acknowledgePracticeProtection()
            }
          >
            <section
              className="education-learning__protect-dialog"
              role="dialog"
              aria-modal="true"
              aria-label="Protect your GYAN"
              onMouseDown={(
                event,
              ) =>
                event.stopPropagation()
              }
            >
              <button
                type="button"
                className="education-learning__protect-x"
                aria-label="Close"
                onClick={() =>
                  void acknowledgePracticeProtection()
                }
              >
                ×
              </button>

              <div
                className="education-learning__protect-heading"
              >
                <span
                  aria-hidden="true"
                >
                  🛡
                </span>

                <div>
                  <strong>
                    Protect your GYAN
                  </strong>

                  <small>
                    {
                      protectionStatus.answeredCount
                    } cumulative questions answered
                  </small>
                </div>
              </div>

              <p>
                {
                  practiceProtectionStage ===
                    25
                    ? "You have already built meaningful learning progress. Add a recovery email so this GYAN can be restored if this browser or device is lost or reset."
                    : "You have answered 50 or more questions. Your learning history is still tied to this browser unless you add a recovery email."
                }
              </p>

              <div
                className="education-learning__protect-email"
              >
                <input
                  type="email"
                  inputMode="email"
                  autoComplete="email"
                  placeholder="Recovery email"
                  value={
                    practiceRecoveryEmail
                  }
                  disabled={
                    practiceRecoverySending
                  }
                  onChange={(
                    event,
                  ) => {
                    setPracticeRecoveryEmail(
                      event.target.value,
                    );

                    setPracticeRecoveryEmailError(
                      "",
                    );
                  }}
                />

                <button
                  type="button"
                  disabled={
                    practiceRecoverySending
                  }
                  onClick={() =>
                    void protectPracticeGyan()
                  }
                >
                  {
                    practiceRecoverySending
                      ? "Sending…"
                      : "Protect my GYAN"
                  }
                </button>
              </div>

              {
                practiceRecoveryEmailError && (
                  <div
                    className="education-learning__protect-error"
                    role="alert"
                  >
                    {
                      practiceRecoveryEmailError
                    }
                  </div>
                )
              }

              <small
                className="education-learning__protect-note"
              >
                Recovery email is for restoring your GYAN and learning progress. You can continue without adding one.
              </small>

              <div
                className="education-learning__protect-actions"
              >
                <button
                  type="button"
                  onClick={() =>
                    void acknowledgePracticeProtection()
                  }
                >
                  Continue for now
                </button>
              </div>
            </section>
          </div>
        )
      }


      {
        !loading &&
        step ===
          "subjects" && (
          <section>
            <h1>
              {
                grade?.type ===
                  "program"
                  ? "Choose a subject / topic"
                  : "Choose a subject"
              }
            </h1>

            {
              grade?.type ===
                "program" ? (
                <div
                  className="education-learning__subject-accordion"
                >
                  {
                    subjects.map(
                      (item) => {
                        const expanded =
                          expandedSubjectCode ===
                            item.code;

                        return (
                          <section
                            key={
                              item.code
                            }
                            className={[
                              "education-learning__subject-block",
                              expanded
                                ? "education-learning__subject-block--expanded"
                                : "",
                            ]
                              .filter(
                                Boolean,
                              )
                              .join(
                                " ",
                              )}
                          >
                            <button
                              type="button"
                              className="education-learning__subject-toggle"
                              onClick={() =>
                                void toggleProgramSubject(
                                  item,
                                )
                              }
                              aria-expanded={
                                expanded
                              }
                            >
                              <strong>
                                {
                                  item.name
                                    .replace(
                                      /^JEE\s+/i,
                                      "",
                                    )
                                    .replace(
                                      /^NEET\s+/i,
                                      "",
                                    )
                                }
                              </strong>

                              <span>
                                {
                                  expanded
                                    ? "▴"
                                    : "▾"
                                }
                              </span>
                            </button>

                            {
                              expanded && (
                                <div
                                  className="education-learning__subject-topics"
                                >
                                  {
                                    subjectTopicsLoading ? (
                                      <div
                                        className="education-learning__subject-topics-state"
                                      >
                                        Loading topics…
                                      </div>
                                    ) : topics.length >
                                      0 ? (
                                      <div
                                        className="education-learning__topic-grid--compact"
                                      >
                                        {
                                          topics.map(
                                            (topicItem) => (
                                              <button
                                                key={
                                                  topicItem.code
                                                }
                                                type="button"
                                                className={
                                                  `education-learning__topic-status education-learning__topic-status--${scoreState(
                                                    latestTopicAttempt(
                                                      item.code,
                                                      topicItem.code,
                                                    )?.scorePercent,
                                                  )}`
                                                }
                                                disabled={
                                                  topicItem.questionCount <
                                                    5
                                                }
                                                onClick={() =>
                                                  void selectTopic(
                                                    topicItem,
                                                  )
                                                }
                                              >
                                                <strong>
                                                  {
                                                    topicItem.name
                                                  }
                                                </strong>

                                                <small>
                                                  {
                                                    latestTopicAttempt(
                                                      item.code,
                                                      topicItem.code,
                                                    )
                                                      ? `${latestTopicAttempt(
                                                          item.code,
                                                          topicItem.code,
                                                        )?.scorePercent}% · ${topicItem.questionCount} questions`
                                                      : `${topicItem.questionCount} questions · New`
                                                  }
                                                </small>
                                              </button>
                                            ),
                                          )
                                        }
                                      </div>
                                    ) : (
                                      <div
                                        className="education-learning__subject-topics-state"
                                      >
                                        No topics configured yet.
                                      </div>
                                    )
                                  }
                                </div>
                              )
                            }
                          </section>
                        );
                      },
                    )
                  }
                </div>
              ) : (
                <div
                  className="education-learning__cards"
                >
                  {
                    subjects.map(
                      (item) => (
                        <button
                          key={
                            item.code
                          }
                          type="button"
                          onClick={() => {
                            if (
                              !grade
                            ) {
                              return;
                            }

                            void loadTopicList(
                              grade,
                              item,
                            );
                          }}
                        >
                          <strong>
                            {
                              item.name
                            }
                          </strong>
                        </button>
                      ),
                    )
                  }
                </div>
              )
            }
          </section>
        )
      }


      {
        !loading &&
        step ===
          "skills" && (
          <section>
            <h1>
              {
                topic?.name
              }
            </h1>

            <p>
              Choose a skill
            </p>

            <div
              className="education-learning__cards"
            >
              {
                satSkills.map(
                  (
                    item,
                  ) => (
                    <button
                      key={
                        item.code
                      }
                      type="button"
                      disabled={
                        item.questionCount <
                          5
                      }
                      onClick={() =>
                        void selectSatSkill(
                          item,
                        )
                      }
                    >
                      <strong>
                        {
                          item.name
                        }
                      </strong>

                      <small>
                        {
                          item.questionCount
                        }{" "}
                        questions
                      </small>
                    </button>
                  ),
                )
              }
            </div>
          </section>
        )
      }


      {
        !loading &&
        step ===
          "topics" && (
          <section>
            <h1>
              Choose a topic
            </h1>

            <div
              className="education-learning__cards"
            >
              {
                topics.map(
                  (
                    item,
                  ) => (
                    <button
                      key={
                        item.code
                      }
                      type="button"
                      disabled={
                        item.questionCount <
                          5
                      }
                      onClick={() =>
                        void selectTopic(
                          item,
                        )
                      }
                    >
                      <strong>
                        {
                          item.name
                        }
                      </strong>

                      <small>
                        {
                          item.subtopicCount
                        }{" "}
                        subtopics ·{" "}
                        {
                          item.questionCount
                        }{" "}
                        questions
                      </small>
                    </button>
                  ),
                )
              }
            </div>
          </section>
        )
      }


      {
        !loading &&
        step ===
          "questions" && (
          <section
            className="education-learning__questions"
          >
            <div
              className="education-learning__questions-heading"
            >
              <div>
                <h1>
                  {
                    grade?.code ===
                      "PROGRAM_SAT" &&
                    satSkill
                      ? satSkill.name
                      : topic?.name
                  }
                </h1>

                {practiceSequence &&
                  practiceSequence.total >
                    0 && (
                    <small>
                      Questions {
                        practiceSequence.start
                      }–{
                        practiceSequence.end
                      } of {
                        practiceSequence.total
                      }
                    </small>
                  )}
              </div>

              <div
                className="education-learning__question-actions"
              >
                <button
                  type="button"
                  disabled={
                    loading ||
                    !submitted ||
                    !grade ||
                    !subject ||
                    !topic ||
                    practiceSequence?.hasMore ===
                      false ||
                    (
                      grade.code ===
                        "PROGRAM_SAT" &&
                      !satSkill
                    )
                  }
                  onClick={() =>
                    void newFive()
                  }
                >
                  🔄 New 5
                </button>

                <button
                  type="button"
                  disabled={
                    !canSubmit
                  }
                  onClick={() =>
                    void submitAnswers()
                  }
                  title={
                    canSubmit
                      ? "Submit 5 answers"
                      : "Answer all 5 questions first"
                  }
                >
                  ✓ Submit
                </button>
              </div>
            </div>


            {
              currentPracticeQuestion && (
                <div
                  className="education-learning__practice-cbt-layout"
                >
                  <div
                    className="education-learning__practice-cbt-main"
                  >
                    <div
                      className="education-learning__practice-cbt-status"
                    >
                      <strong>
                        Question {
                          absolutePracticeQuestionNumber
                        } of {
                          practiceSequence?.total ??
                          questions.length
                        }
                      </strong>

                      <span>
                        {
                          answeredCount
                        }/{questions.length} answered
                      </span>
                    </div>

                    <article
                      className="education-learning__question-card education-learning__question-card--cbt"
                    >
                      {
                        grade?.code ===
                          "PROGRAM_SAT" &&
                        currentSatPracticeQuestion
                          ?.stimulusText && (
                          <div
                            className="education-learning__sat-stimulus"
                            style={{
                              marginBottom:
                                "1rem",
                              padding:
                                "1rem",
                              border:
                                "1px solid var(--education-border, #d8dee8)",
                              borderRadius:
                                "0.75rem",
                              background:
                                "rgba(127, 127, 127, 0.06)",
                              whiteSpace:
                                "pre-wrap",
                              lineHeight:
                                1.55,
                            }}
                          >
                            {
                              currentSatPracticeQuestion
                                .stimulusText
                            }

                            {
                              currentSatPracticeQuestion
                                .stimulusSecondaryText && (
                                <>
                                  <hr
                                    style={{
                                      margin:
                                        "0.9rem 0",
                                    }}
                                  />
                                  {
                                    currentSatPracticeQuestion
                                      .stimulusSecondaryText
                                  }
                                </>
                              )
                            }
                          </div>
                        )
                      }

                      <div
                        className="education-learning__practice-question-heading"
                        title={`Difficulty: ${
                          currentPracticeQuestion.difficulty
                        }`}
                      >
                        <strong>
                          <span
                            className="education-learning__practice-question-number-inline"
                          >
                            {
                              absolutePracticeQuestionNumber
                            }.
                          </span>{" "}
                          {
                            currentPracticeQuestion.text
                          }
                        </strong>
                      </div>

                      <div
                        className="education-learning__choices"
                      >
                        {
                          currentPracticeQuestion.choices.map(
                            (
                              choice,
                              choiceIndex,
                            ) => {
                              const key =
                                [
                                  "A",
                                  "B",
                                  "C",
                                  "D",
                                ][
                                  choiceIndex
                                ];

                              const selected =
                                currentPracticeState
                                  ?.selectedChoice ===
                                key;

                              const correct =
                                submitted &&
                                currentPracticeState
                                  ?.result
                                  ?.correctChoice ===
                                key;

                              const wrongSelected =
                                submitted &&
                                selected &&
                                !currentPracticeState
                                  ?.result
                                  ?.correct;

                              return (
                                <button
                                  type="button"
                                  key={
                                    key
                                  }
                                  disabled={
                                    submitted
                                  }
                                  className={[
                                    selected
                                      ? "selected"
                                      : "",

                                    correct
                                      ? "correct"
                                      : "",

                                    wrongSelected
                                      ? "wrong"
                                      : "",
                                  ]
                                    .filter(
                                      Boolean,
                                    )
                                    .join(
                                      " ",
                                    )}
                                  onClick={() =>
                                    selectChoice(
                                      currentPracticeQuestion.id,
                                      key,
                                    )
                                  }
                                >
                                  <b>
                                    {
                                      key
                                    }.
                                  </b>{" "}
                                  {
                                    choice
                                  }
                                </button>
                              );
                            },
                          )
                        }
                      </div>

                      {
                        submitted &&
                        currentPracticeState
                          ?.result && (
                          <div
                            className={[
                              "education-learning__answer",

                              currentPracticeState.result
                                .correct
                                ? "correct"
                                : "wrong",
                            ].join(
                              " ",
                            )}
                          >
                            <strong>
                              {
                                currentPracticeState.result
                                  .correct
                                  ? "✓ Correct"
                                  : `Correct answer: ${currentPracticeState.result.correctChoice}`
                              }
                            </strong>

                            {
                              currentPracticeState.result
                                .explanation && (
                                <span>
                                  {
                                    currentPracticeState.result
                                      .explanation
                                  }
                                </span>
                              )
                            }
                          </div>
                        )
                      }
                    </article>

                    <nav
                      className="education-learning__practice-cbt-nav"
                      aria-label="Practice question navigation"
                    >
                      <button
                        type="button"
                        disabled={
                          practiceQuestionIndex <=
                          0
                        }
                        onClick={() =>
                          goToPracticeQuestion(
                            practiceQuestionIndex -
                            1,
                          )
                        }
                      >
                        ← Previous
                      </button>

                      <button
                        type="button"
                        disabled={
                          submitted
                        }
                        className={
                          practiceReviewIds.includes(
                            currentPracticeQuestion.id,
                          )
                            ? "education-learning__practice-review education-learning__practice-review--active"
                            : "education-learning__practice-review"
                        }
                        onClick={
                          togglePracticeReview
                        }
                      >
                        {
                          practiceReviewIds.includes(
                            currentPracticeQuestion.id,
                          )
                            ? "★ Reviewed"
                            : "☆ Mark Review"
                        }
                      </button>

                      <button
                        type="button"
                        disabled={
                          practiceQuestionIndex >=
                          questions.length -
                            1
                        }
                        onClick={() =>
                          goToPracticeQuestion(
                            practiceQuestionIndex +
                            1,
                          )
                        }
                      >
                        Save & Next →
                      </button>
                    </nav>
                  </div>

                  <aside
                    className="education-learning__practice-palette"
                    aria-label="Question palette"
                  >
                    <div
                      className="education-learning__practice-palette-title"
                    >
                      <strong>
                        Questions
                      </strong>

                      <small>
                        {
                          answeredCount
                        }/{questions.length}
                      </small>
                    </div>

                    <div
                      className="education-learning__practice-palette-grid"
                    >
                      {
                        questions.map(
                          (
                            question,
                            index,
                          ) => {
                            const answered =
                              Boolean(
                                answers[
                                  question.id
                                ]?.selectedChoice,
                              );

                            const result =
                              answers[
                                question.id
                              ]?.result;

                            return (
                              <button
                                type="button"
                                key={
                                  question.id
                                }
                                className={[
                                  "education-learning__practice-palette-number",

                                  submitted &&
                                  result
                                    ? result.correct
                                      ? "education-learning__practice-palette-number--correct"
                                      : "education-learning__practice-palette-number--wrong"
                                    : answered
                                      ? "education-learning__practice-palette-number--answered"
                                      : "education-learning__practice-palette-number--blank",

                                  practiceReviewIds.includes(
                                    question.id,
                                  )
                                    ? "education-learning__practice-palette-number--review"
                                    : "",

                                  index ===
                                    practiceQuestionIndex
                                    ? "education-learning__practice-palette-number--current"
                                    : "",
                                ]
                                  .filter(
                                    Boolean,
                                  )
                                  .join(
                                    " ",
                                  )}
                                onClick={() =>
                                  goToPracticeQuestion(
                                    index,
                                  )
                                }
                                aria-label={`Question ${
                                  practiceSequence
                                    ? practiceSequence.start +
                                      index
                                    : index +
                                      1
                                }${
                                  answered
                                    ? ", answered"
                                    : ", unanswered"
                                }`}
                              >
                                {
                                  practiceSequence
                                    ? practiceSequence.start +
                                      index
                                    : index +
                                      1
                                }
                              </button>
                            );
                          },
                        )
                      }
                    </div>

                    <button
                      type="button"
                      className="education-learning__practice-palette-submit"
                      disabled={
                        !canSubmit
                      }
                      onClick={() =>
                        void submitAnswers()
                      }
                      title={
                        canSubmit
                          ? "Submit 5 answers"
                          : "Answer all 5 questions first"
                      }
                    >
                      ✓ Submit
                    </button>
                  </aside>
                </div>
              )
            }


            {
              submitted && (
                <div
                  className="education-learning__result-summary"
                >
                  <strong>
                    {
                      correctCount
                    }{" "}
                    / 5 correct
                  </strong>

                  <span>
                    {
                      correctCount >=
                        4
                        ? "🟢 Strong"
                        : correctCount >=
                            3
                          ? "🟡 Developing"
                          : "🔴 Needs Practice"
                    }
                  </span>

                  {autoSaveMessage && (
                    <small
                      className="education-learning__autosave"
                    >
                      {autoSaveMessage}
                    </small>
                  )}

                  <button
                    type="button"
                    className="education-learning__primary"
                    onClick={() => {
                      setReportTopics(
                        currentHeatmap(),
                      );

                      setStep(
                        "report",
                      );
                    }}
                  >
                    View Learning Map
                  </button>

                  <button
                    type="button"
                    className="education-learning__secondary"
                    disabled={
                      loading ||
                      !submitted ||
                      !grade ||
                      !subject ||
                      !topic ||
                      practiceSequence?.hasMore ===
                        false ||
                      (
                        grade.code ===
                          "PROGRAM_SAT" &&
                        !satSkill
                      )
                    }
                    onClick={() =>
                      void newFive()
                    }
                  >
                    🔄 New 5 Questions
                  </button>

                  <button
                    type="button"
                    className="education-learning__secondary"
                    onClick={() =>
                      setStep(
                        grade?.code ===
                          "PROGRAM_SAT"
                          ? "skills"
                          : "topics",
                      )
                    }
                  >
                    {
                      grade?.code ===
                        "PROGRAM_SAT"
                        ? "Choose Another Skill"
                        : "Choose Another Topic"
                    }
                  </button>
                </div>
              )
            }
          </section>
        )
      }


      {
        step ===
          "program-report" && (
          <section
            className="education-learning__program-report"
          >
            {
              !programReportLoading && (
                <section
                    className="education-learning__mock-results-card"
                  >
                    <h2>
                      MOCK TEST RESULTS
                    </h2>

                    {
                      programMockAttempts.length ===
                        0 ? (
                        <div
                          className="education-learning__mock-results-empty"
                        >
                          No submitted mock tests yet.
                        </div>
                      ) : (
                        <div
                          className="education-learning__mock-results-list"
                        >
                          {
                            programMockAttempts.map(
                              (
                                attempt,
                              ) => {
                                const attemptedCount =
                                  attempt.correctCount +
                                  attempt.incorrectCount;

                                const attemptedPercent =
                                  attempt.questionCount >
                                    0
                                    ? Math.max(
                                        0,
                                        Math.min(
                                          100,
                                          Math.round(
                                            attemptedCount *
                                              100 /
                                              attempt.questionCount,
                                          ),
                                        ),
                                      )
                                    : 0;

                                const scoreBand =
                                  mockScoreState(
                                    attempt.scorePercent,
                                  );

                                return (
                                  <button
                                    type="button"
                                    key={
                                      attempt.id
                                    }
                                    className="education-learning__mock-result-row"
                                    onClick={() => {
                                      setSelectedMockQuestion(
                                        null,
                                      );

                                      setSelectedMockAttempt(
                                        attempt,
                                      );
                                    }}
                                    title={`${attempt.testName} · ${mockLevelLabel(
                                      attempt.examLevel,
                                    )} · Attempt ${attempt.attemptNumber} · ${attemptedPercent}% attempted · ${attempt.scorePercent}% score`}
                                  >
                                    <span
                                      className="education-learning__mock-result-test"
                                    >
                                      {
                                        grade?.code ===
                                          "PROGRAM_NEET"
                                          ? `NEET ${attempt.testName}`
                                          : `JEE ${attempt.testName} ${mockLevelLabel(
                                              attempt.examLevel,
                                            )}`
                                      }
                                    </span>

                                    <span
                                      className="education-learning__mock-result-attempt"
                                    >
                                      Attempt {
                                        attempt.attemptNumber
                                      }
                                    </span>

                                    <span
                                      className="education-learning__mock-result-progress"
                                      aria-label={`${attemptedPercent}% questions attempted`}
                                    >
                                      <span
                                        className={`education-learning__mock-result-progress-fill education-learning__mock-result-progress-fill--${scoreBand}`}
                                        style={{
                                          width:
                                            `${attemptedPercent}%`,
                                        }}
                                      />
                                    </span>

                                    <span
                                      className="education-learning__mock-result-percentile"
                                      title={
                                        attempt.percentile ==
                                          null
                                          ? "Percentile will be available when enough comparable attempts exist."
                                          : `${attempt.percentile} percentile`
                                      }
                                      aria-label={
                                        attempt.percentile ==
                                          null
                                          ? "Percentile not available yet"
                                          : `${attempt.percentile} percentile`
                                      }
                                    >
                                      {
                                        attempt.percentile ??
                                        "?"
                                      }
                                    </span>
                                  </button>
                                );
                              },
                            )
                          }
                        </div>
                      )
                    }
                  </section>

              )
            }

            <div
              className="education-learning__report-title"
            >
              <h1>
                📊 {
                  grade?.code ===
                    "PROGRAM_NEET"
                    ? "NEET Progress"
                    : "IIT-JEE Progress"
                }
              </h1>

              <small>
                Bar width = completion · color = accuracy
              </small>
            </div>

            {
              programReportLoading ? (
                <div
                  className="education-learning__state"
                >
                  Preparing report…
                </div>
              ) : (
                <>
                  {
                    Array.from(
                      new Set(
                        programReportTopics.map(
                          (item) =>
                            item.subjectName,
                        ),
                      ),
                    ).map(
                      (
                        subjectName,
                      ) => (
                        <section
                          key={
                            subjectName
                          }
                          className="education-learning__program-report-group"
                        >
                          <h2>
                            {
                              subjectName
                            }
                          </h2>

                          <div
                            className="education-learning__compact-report-grid"
                          >
                            {
                              programReportTopics
                                .filter(
                                  (item) =>
                                    item.subjectName ===
                                      subjectName,
                                )
                                .map(
                                  (
                                    item,
                                  ) => {
                                    const accuracyState =
                                      scoreState(
                                        item.scorePercent,
                                      );

                                    return (
                                      <button
                                        type="button"
                                        key={
                                          `${item.subjectCode}:${item.topicCode}`
                                        }
                                        className={`education-learning__compact-report-item education-learning__compact-report-item--${accuracyState}`}
                                        onClick={() =>
                                          void openProgramReportTopic(
                                            item,
                                          )
                                        }
                                        title={`${item.topicName} · ${item.completionPercent}% completed · ${
                                          item.scorePercent == null
                                            ? "Not scored yet"
                                            : `${item.scorePercent}% correct`
                                        }`}
                                      >
                                        <span
                                          className="education-learning__compact-report-title"
                                        >
                                          {
                                            item.topicName
                                          }
                                        </span>

                                        <span
                                          className="education-learning__compact-report-meter"
                                          aria-hidden="true"
                                        >
                                          <span
                                            className={`education-learning__compact-report-fill education-learning__compact-report-fill--${accuracyState}`}
                                            style={{
                                              width:
                                                `${item.completionPercent}%`,
                                            }}
                                          />
                                        </span>

                                        <span
                                          className={`education-learning__compact-report-circle education-learning__compact-report-circle--${scoreState(
                                            item.scorePercent ==
                                              null
                                              ? null
                                              : (
                                                  item.completionPercent *
                                                  item.scorePercent
                                                ) /
                                                100,
                                          )}`}
                                          title={
                                            item.scorePercent ==
                                              null
                                              ? "Not attempted"
                                              : "Progress × accuracy"
                                          }
                                          aria-label={
                                            item.scorePercent ==
                                              null
                                              ? "Not attempted"
                                              : "Combined progress and accuracy"
                                          }
                                        />
                                      </button>
                                    );
                                  },
                                )
                            }
                          </div>
                        </section>
                      ),
                    )
                  }

                  <section className="education-learning__teacher-footer" aria-label="Teacher help">
                    <div className="education-learning__teacher-footer-copy"><strong>Need a teacher?</strong><small>Take your time. Request help whenever you are ready.</small></div>
                    <div className="education-learning__teacher-footer-actions">
                      <button type="button" disabled={teachers.filter((t) => t.status === "APPROVED").length < 5} onClick={() => void openTeachers()}>
                        {teachers.filter((t) => t.status === "APPROVED").length < 5 ? "🔒 View Teachers" : "👩‍🏫 View Teachers"}
                      </button>
                      <button type="button" className="education-learning__teacher-assign-button" disabled={teacherAssignment?.status === "ASSIGNED"} onClick={() => { setTeacherMessage(""); setTeacherRequestEmail(activeGyanEmail ?? teacherRequestEmail); setTeacherRequestDialogOpen(true); }}>
                        {teacherAssignment?.status === "ASSIGNED" ? `✓ ${teacherAssignment.teacher?.name ?? "Teacher"}` : teacherAssignment?.status === "REQUESTED" ? "Update Teacher Request" : "Assign Teacher"}
                      </button>
                    </div>
                  </section>

                  {teacherRequestDialogOpen && (
                    <div className="education-learning__teacher-request-backdrop" onMouseDown={() => setTeacherRequestDialogOpen(false)}>
                      <section className="education-learning__teacher-request-dialog" role="dialog" aria-modal="true" onMouseDown={(e) => e.stopPropagation()}>
                        <button type="button" className="education-learning__teacher-request-x" onClick={() => setTeacherRequestDialogOpen(false)}>×</button>
                        <small>TEACHER REQUEST</small><h2>Assign Teacher</h2>
                        <p>Tell GYAN how to contact you and what you would like help with. Email is required.</p>
                        <label><span>Email *</span><input type="email" value={teacherRequestEmail} onChange={(e) => setTeacherRequestEmail(e.target.value)} /></label>
                        <label><span>Phone</span><input type="tel" value={teacherRequestPhone} onChange={(e) => setTeacherRequestPhone(e.target.value)} /></label>
                        <label><span>Subjects</span><input type="text" value={teacherRequestSubjects} placeholder="Physics, Maths, Kinematics…" onChange={(e) => setTeacherRequestSubjects(e.target.value)} /></label>
                        {teacherMessage && <div className="education-learning__teacher-request-message">{teacherMessage}</div>}
                        <div className="education-learning__teacher-request-actions"><button type="button" onClick={() => setTeacherRequestDialogOpen(false)}>Cancel</button><button type="button" className="education-learning__teacher-request-submit" disabled={teacherBusy || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(teacherRequestEmail.trim())} onClick={() => void requestTeacher()}>{teacherBusy ? "Sending…" : "Send Request"}</button></div>
                      </section>
                    </div>
                  )}

                  {
                    teacherDialogOpen && (
                      <div
                        className="education-learning__teacher-backdrop"
                        role="presentation"
                        onMouseDown={() =>
                          setTeacherDialogOpen(
                            false,
                          )
                        }
                      >
                        <section
                          className="education-learning__teacher-dialog"
                          role="dialog"
                          aria-modal="true"
                          aria-label="GYAN Teachers"
                          onMouseDown={(
                            event,
                          ) =>
                            event.stopPropagation()
                          }
                        >
                          <button
                            type="button"
                            className="education-learning__teacher-x"
                            onClick={() =>
                              setTeacherDialogOpen(
                                false,
                              )
                            }
                            aria-label="Close"
                          >
                            ×
                          </button>

                          <h2>
                            GYAN Teachers
                          </h2>

                          {
                            teacherAssignment
                              ?.status ===
                              "ASSIGNED" &&
                            teacherAssignment.teacher && (
                              <div
                                className="education-learning__teacher-assigned"
                              >
                                <strong>
                                  Your Teacher
                                </strong>

                                <span>
                                  {
                                    teacherAssignment.teacher.name
                                  }
                                </span>

                                <small>
                                  {
                                    teacherAssignment.teacher.subjects
                                  }
                                </small>
                              </div>
                            )
                          }

                          <div
                            className="education-learning__teacher-list"
                          >
                            {
                              teachers
                                .filter(
                                  (
                                    teacher,
                                  ) =>
                                    teacher.status ===
                                    "APPROVED",
                                )
                                .map(
                                  (
                                    teacher,
                                  ) => (
                                    <article
                                      key={
                                        teacher.id
                                      }
                                    >
                                      <strong>
                                        {
                                          teacher.name
                                        }
                                      </strong>

                                      <span>
                                        {
                                          teacher.subjects
                                        }
                                      </span>

                                      {
                                        teacher.location && (
                                          <small>
                                            {
                                              teacher.location
                                            }
                                          </small>
                                        )
                                      }

                                      {
                                        teacher.bio && (
                                          <p>
                                            {
                                              teacher.bio
                                            }
                                          </p>
                                        )
                                      }
                                    </article>
                                  ),
                                )
                            }

                            {
                              teachers.filter(
                                (
                                  teacher,
                                ) =>
                                  teacher.status ===
                                  "APPROVED",
                              ).length ===
                                0 && (
                                <small>
                                  No approved teachers are listed yet.
                                </small>
                              )
                            }
                          </div>

                          <button
                            type="button"
                            className="education-learning__teacher-register-button"
                            onClick={() =>
                              setTeacherRegisterOpen(
                                (
                                  current,
                                ) =>
                                  !current,
                              )
                            }
                          >
                            Register as Teacher
                          </button>

                          {
                            teacherRegisterOpen && (
                              <div
                                className="education-learning__teacher-register"
                              >
                                <input
                                  value={
                                    teacherName
                                  }
                                  placeholder="Name"
                                  onChange={(
                                    event,
                                  ) =>
                                    setTeacherName(
                                      event.target.value,
                                    )
                                  }
                                />

                                <input
                                  type="email"
                                  value={
                                    teacherEmail
                                  }
                                  placeholder="Email"
                                  onChange={(
                                    event,
                                  ) =>
                                    setTeacherEmail(
                                      event.target.value,
                                    )
                                  }
                                />

                                <input
                                  value={
                                    teacherSubjects
                                  }
                                  placeholder="Subjects e.g. Physics, Maths"
                                  onChange={(
                                    event,
                                  ) =>
                                    setTeacherSubjects(
                                      event.target.value,
                                    )
                                  }
                                />

                                <input
                                  value={
                                    teacherLocation
                                  }
                                  placeholder="Location (optional)"
                                  onChange={(
                                    event,
                                  ) =>
                                    setTeacherLocation(
                                      event.target.value,
                                    )
                                  }
                                />

                                <textarea
                                  value={
                                    teacherBio
                                  }
                                  placeholder="Short introduction (optional)"
                                  onChange={(
                                    event,
                                  ) =>
                                    setTeacherBio(
                                      event.target.value,
                                    )
                                  }
                                />

                                <button
                                  type="button"
                                  disabled={
                                    teacherBusy
                                  }
                                  onClick={() =>
                                    void registerTeacher()
                                  }
                                >
                                  Submit Registration
                                </button>
                              </div>
                            )
                          }

                          {
                            adminAuthenticated && (
                              <section
                                className="education-learning__teacher-admin"
                              >
                                <h3>
                                  Pending Teacher Registrations
                                </h3>

                                <div
                                  className="education-learning__teacher-pending-list"
                                >
                                  {
                                    teachers
                                      .filter(
                                        (
                                          teacher,
                                        ) =>
                                          teacher.status ===
                                          "PENDING",
                                      )
                                      .map(
                                        (
                                          teacher,
                                        ) => (
                                          <div
                                            key={
                                              teacher.id
                                            }
                                            className="education-learning__teacher-pending-row"
                                          >
                                            <span>
                                              <b>
                                                {
                                                  teacher.name
                                                }
                                              </b>
                                              {" · "}
                                              {
                                                teacher.subjects
                                              }
                                              {" · "}
                                              {
                                                teacher.email
                                              }
                                            </span>

                                            <button
                                              type="button"
                                              disabled={
                                                teacherBusy
                                              }
                                              onClick={() =>
                                                void approveTeacher(
                                                  teacher.id,
                                                )
                                              }
                                            >
                                              Approve
                                            </button>
                                          </div>
                                        ),
                                      )
                                  }

                                  {
                                    teachers.filter(
                                      (
                                        teacher,
                                      ) =>
                                        teacher.status ===
                                        "PENDING",
                                    ).length ===
                                      0 && (
                                      <small>
                                        No pending teacher registrations.
                                      </small>
                                    )
                                  }
                                </div>

                                <h3>
                                  Pending Assignment Requests
                                </h3>

                                {
                                  teacherRequests.map(
                                    (
                                      request,
                                    ) => (
                                      <div
                                        key={
                                          request.id
                                        }
                                        className="education-learning__teacher-request-row"
                                      >
                                        <span>
                                          <b>
                                            {
                                              request.studentCode
                                            }
                                          </b>{" "}
                                          { request.displayName }
                                          <small>{request.email}{request.phone ? ` · ${request.phone}` : ""}{request.subjects ? ` · ${request.subjects}` : ""}</small>
                                        </span>

                                        <select
                                          value={
                                            teacherSelections[
                                              request.id
                                            ] ??
                                            ""
                                          }
                                          onChange={(
                                            event,
                                          ) =>
                                            setTeacherSelections(
                                              (
                                                current,
                                              ) => ({
                                                ...current,
                                                [
                                                  request.id
                                                ]:
                                                  Number(
                                                    event.target.value,
                                                  ),
                                              }),
                                            )
                                          }
                                        >
                                          <option
                                            value=""
                                          >
                                            Choose teacher
                                          </option>

                                          {
                                            teachers
                                              .filter(
                                                (
                                                  teacher,
                                                ) =>
                                                  teacher.status ===
                                                  "APPROVED",
                                              )
                                              .map(
                                                (
                                                  teacher,
                                                ) => (
                                                  <option
                                                    key={
                                                      teacher.id
                                                    }
                                                    value={
                                                      teacher.id
                                                    }
                                                  >
                                                    {
                                                      teacher.name
                                                    } · {
                                                      teacher.subjects
                                                    }
                                                  </option>
                                                ),
                                              )
                                          }
                                        </select>

                                        <button
                                          type="button"
                                          disabled={
                                            teacherBusy ||
                                            !teacherSelections[
                                              request.id
                                            ]
                                          }
                                          onClick={() =>
                                            void assignTeacherToRequest(
                                              request.id,
                                            )
                                          }
                                        >
                                          Assign
                                        </button>
                                      </div>
                                    ),
                                  )
                                }

                                {
                                  teacherRequests.length ===
                                    0 && (
                                    <small>
                                      No pending teacher requests.
                                    </small>
                                  )
                                }
                              </section>
                            )
                          }

                          {
                            teacherMessage && (
                              <div
                                className="education-learning__teacher-message"
                              >
                                {
                                  teacherMessage
                                }
                              </div>
                            )
                          }

                          <div
                            className="education-learning__teacher-actions"
                          >
                            <button
                              type="button"
                              onClick={() =>
                                setTeacherDialogOpen(
                                  false,
                                )
                              }
                            >
                              Close
                            </button>
                          </div>
                        </section>
                      </div>
                    )
                  }


                  {
                    selectedMockAttempt && (
                      <div
                        className="education-learning__mock-result-dialog-backdrop"
                        role="presentation"
                        onMouseDown={() =>
                          setSelectedMockAttempt(
                            null,
                          )
                        }
                      >
                        <section
                          className="education-learning__mock-result-dialog"
                          role="dialog"
                          aria-modal="true"
                          aria-label="Mock test attempt results"
                          onMouseDown={(
                            event,
                          ) =>
                            event.stopPropagation()
                          }
                        >
                          <button
                            type="button"
                            className="education-learning__mock-result-dialog-x"
                            onClick={() =>
                              setSelectedMockAttempt(
                                null,
                              )
                            }
                            aria-label="Close results"
                          >
                            ×
                          </button>

                          <h2>
                            JEE {
                              selectedMockAttempt.testName
                            } {
                              mockLevelLabel(
                                selectedMockAttempt.examLevel,
                              )
                            } · Attempt {
                              selectedMockAttempt.attemptNumber
                            }
                          </h2>

                          <div
                            className="education-learning__mock-result-dialog-summary"
                          >
                            <span>
                              {
                                selectedMockAttempt.score
                              } / {
                                selectedMockAttempt.maximumMarks
                              }
                            </span>

                            <span>
                              {
                                selectedMockAttempt.correctCount +
                                selectedMockAttempt.incorrectCount
                              } / {
                                selectedMockAttempt.questionCount
                              } attempted
                            </span>

                            <span>
                              Percentile {
                                selectedMockAttempt.percentile ??
                                "?"
                              }
                            </span>
                          </div>

                          <div
                            className="education-learning__mock-result-subjects"
                          >
                            {
                              [
                                "MATH",
                                "PHYSICS",
                                "CHEMISTRY",
                              ].map(
                                (
                                  sectionCode,
                                ) => {
                                  const sectionResults =
                                    selectedMockAttempt.questionResults
                                      .filter(
                                        (
                                          item,
                                        ) =>
                                          item.sectionCode ===
                                          sectionCode,
                                      )
                                      .sort(
                                        (
                                          left,
                                          right,
                                        ) =>
                                          left.questionOrder -
                                          right.questionOrder,
                                      );

                                  if (
                                    sectionResults.length ===
                                    0
                                  ) {
                                    return null;
                                  }

                                  return (
                                    <div
                                      key={
                                        sectionCode
                                      }
                                      className="education-learning__mock-result-subject"
                                    >
                                      <strong>
                                        {
                                          mockSubjectLabel(
                                            sectionCode,
                                          )
                                        } ({
                                          sectionResults.length
                                        })
                                      </strong>

                                      <span
                                        className="education-learning__mock-result-grid"
                                      >
                                        {
                                          sectionResults.map(
                                            (
                                              item,
                                              index,
                                            ) => (
                                              <button
                                                type="button"
                                                key={`${item.questionId}:${index}`}
                                                className={[
                                                  "education-learning__mock-result-cell",
                                                  `education-learning__mock-result-cell--${item.status}`,
                                                  selectedMockQuestion
                                                    ?.questionId ===
                                                    item.questionId
                                                    ? "education-learning__mock-result-cell--selected"
                                                    : "",
                                                ]
                                                  .filter(
                                                    Boolean,
                                                  )
                                                  .join(
                                                    " ",
                                                  )}
                                                title={`Question ${index + 1} · ${
                                                  item.status ===
                                                    "correct"
                                                    ? "Correct"
                                                    : item.status ===
                                                        "wrong"
                                                      ? "Incorrect"
                                                      : "Unanswered"
                                                }`}
                                                aria-label={`Open question ${index + 1}`}
                                                onClick={() =>
                                                  setSelectedMockQuestion(
                                                    item,
                                                  )
                                                }
                                              />
                                            ),
                                          )
                                        }
                                      </span>
                                    </div>
                                  );
                                },
                              )
                            }
                          </div>

                          {
                            selectedMockQuestion && (
                              <section
                                className="education-learning__mock-question-detail"
                              >
                                <div
                                  className="education-learning__mock-question-detail-heading"
                                >
                                  <strong>
                                    {
                                      mockSubjectLabel(
                                        selectedMockQuestion.sectionCode,
                                      )
                                    } · Question {
                                      selectedMockQuestion.questionOrder
                                    }
                                  </strong>

                                  <button
                                    type="button"
                                    aria-label="Close question detail"
                                    onClick={() =>
                                      setSelectedMockQuestion(
                                        null,
                                      )
                                    }
                                  >
                                    ×
                                  </button>
                                </div>

                                <p
                                  className="education-learning__mock-question-text"
                                >
                                  {
                                    selectedMockQuestion.questionText
                                  }
                                </p>

                                <div
                                  className="education-learning__mock-question-options"
                                >
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
                                      ) => {
                                        const optionText =
                                          selectedMockQuestion
                                            .choices[
                                              choice
                                            ];

                                        if (
                                          !optionText
                                        ) {
                                          return null;
                                        }

                                        const selected =
                                          selectedMockQuestion.selectedAnswer
                                            .includes(
                                              choice,
                                            );

                                        const correct =
                                          selectedMockQuestion.correctAnswer
                                            .includes(
                                              choice,
                                            );

                                        return (
                                          <div
                                            key={
                                              choice
                                            }
                                            className={[
                                              "education-learning__mock-question-option",
                                              correct
                                                ? "education-learning__mock-question-option--correct"
                                                : "",
                                              selected &&
                                              !correct
                                                ? "education-learning__mock-question-option--wrong"
                                                : "",
                                            ]
                                              .filter(
                                                Boolean,
                                              )
                                              .join(
                                                " ",
                                              )}
                                          >
                                            <b>
                                              {
                                                choice
                                              }.
                                            </b>{" "}
                                            {
                                              optionText
                                            }

                                            {
                                              selected && (
                                                <span>
                                                  {" "}← your answer
                                                </span>
                                              )
                                            }

                                            {
                                              correct && (
                                                <span>
                                                  {" "}✓
                                                </span>
                                              )
                                            }
                                          </div>
                                        );
                                      },
                                    )
                                  }
                                </div>

                                <div
                                  className="education-learning__mock-question-answer-summary"
                                >
                                  <span>
                                    Your answer:{" "}
                                    <b>
                                      {
                                        selectedMockQuestion.selectedAnswer ||
                                        "Not answered"
                                      }
                                    </b>
                                  </span>

                                  <span>
                                    Correct answer:{" "}
                                    <b>
                                      {
                                        selectedMockQuestion.correctAnswer ||
                                        "—"
                                      }
                                    </b>
                                  </span>
                                </div>

                                {
                                  selectedMockQuestion.explanation && (
                                    <div
                                      className="education-learning__mock-question-explanation"
                                    >
                                      <strong>
                                        Explanation
                                      </strong>

                                      <span>
                                        {
                                          selectedMockQuestion.explanation
                                        }
                                      </span>
                                    </div>
                                  )
                                }
                              </section>
                            )
                          }

                          <div
                            className="education-learning__mock-result-dialog-actions"
                          >
                            <button
                              type="button"
                              onClick={() =>
                                setSelectedMockAttempt(
                                  null,
                                )
                              }
                            >
                              Close
                            </button>

                            <button
                              type="button"
                              disabled
                              title="Detailed AI analysis will be enabled later."
                            >
                              🔒 Analyze
                            </button>
                          </div>
                        </section>
                      </div>
                    )
                  }

                  <div
                    className="education-learning__program-report-actions"
                  >
                    <button
                      type="button"
                      className="education-learning__primary"
                      onClick={() => {
                        setMockProgram(
                          "JEE",
                        );

                        setStep(
                          "mock-tests",
                        );
                      }}
                    >
                      📝 Take Mock Test
                    </button>

                    <button
                      type="button"
                      className="education-learning__secondary"
                      onClick={() =>
                        void selectPortal({
                          type:
                            "program",
                          code:
                            "IIT",
                          name:
                            "IIT-JEE",
                        })
                      }
                    >
                      🎯 Practice Topics
                    </button>

                    <button
                      type="button"
                      className="education-learning__secondary education-learning__publish-progress"
                      disabled
                    >
                      🏅 Publish Progress Certificate
                    </button>
                  </div>
                </>
              )
            }
          </section>
        )
      }


      {
        !loading &&
        step ===
          "report" && (
          <section
            className="education-learning__report"
          >
            <div
              className="education-learning__report-title"
            >
              <div>
                <h1>
                  Learning Map
                </h1>

                <small>
                  🟢 Strong · 🟡 Developing · 🔴 Needs Practice · ⚪ Not attempted
                </small>
              </div>
            </div>

            <div
              className="education-learning__heatmap"
            >
              {
                reportTopics.map(
                  (
                    item,
                  ) => {
                    const state =
                      item.scorePercent ==
                        null
                        ? "none"
                        : item.scorePercent >=
                            80
                          ? "green"
                          : item.scorePercent >=
                              50
                            ? "yellow"
                            : "red";

                    return (
                      <button
                        type="button"
                        key={
                          item.code
                        }
                        className={
                          `education-learning__heatmap-item education-learning__heatmap-item--${state}`
                        }
                        onClick={() => {
                          const selectedTopic =
                            topics.find(
                              (
                                candidate,
                              ) =>
                                candidate.code ===
                                item.code,
                            );

                          if (
                            selectedTopic
                          ) {
                            void selectTopic(
                              selectedTopic,
                            );
                          }
                        }}
                      >
                        <strong>
                          {
                            item.name
                          }
                        </strong>

                        <small>
                          {
                            item.scorePercent ==
                              null
                              ? "Not attempted"
                              : `${item.scorePercent}%`
                          }
                        </small>
                      </button>
                    );
                  },
                )
              }
            </div>

            {normalizedActiveGyanCode ? (
              <div
                className="education-learning__autosave-note"
              >
                <strong>
                  ✓ Progress saves automatically to [{activeGyanCodeLabel}]
                </strong>
              </div>
            ) : (
              <button
                type="button"
                className="education-learning__primary"
                onClick={() =>
                  setSaveFormOpen(
                    true,
                  )
                }
              >
                Save My Progress
              </button>
            )}

            {
              !normalizedActiveGyanCode &&
              saveFormOpen && (
                <div
                  className="education-learning__save-form"
                >
                  <input
                    value={
                      studentName
                    }
                    placeholder="Student name"
                    autoComplete="name"
                    onChange={(
                      event,
                    ) =>
                      setStudentName(
                        event.target.value,
                      )
                    }
                  />

                  <input
                    type="email"
                    inputMode="email"
                    value={
                      studentEmail
                    }
                    placeholder="Parent / Guardian Email"
                    autoComplete="email"
                    onChange={(
                      event,
                    ) =>
                      setStudentEmail(
                        event.target.value,
                      )
                    }
                  />

                  <button
                    type="button"
                    className="education-learning__primary"
                    onClick={() =>
                      void saveProgress()
                    }
                  >
                    Save & Create GYAN Card
                  </button>
                </div>
              )
            }
          </section>
        )
      }


      {
        !loading &&
        step ===
          "student-card" &&
        savedStudent && (
          <section
            className="education-learning__student-card"
          >
            <span
              className="education-learning__student-card-icon"
            >
              🎓
            </span>

            <h1>
              Your GYAN Card is ready
            </h1>

            <strong>
              {
                savedStudent.name
              }
            </strong>

            <div
              className="education-learning__student-code"
            >
              <small>
                GYAN Code
              </small>

              <b>
                {
                  savedStudent.code
                }
              </b>
            </div>

            {
              qrDataUrl && (
                <img
                  src={
                    qrDataUrl
                  }
                  alt={`QR code for GYAN student ${savedStudent.code}`}
                />
              )
            }

            <small>
              The code identifies this card. Email verification protects recovery and access on another device.
            </small>

            <button
              type="button"
              className="education-learning__primary"
              disabled={
                recoverySent
              }
              onClick={() =>
                void sendRecovery()
              }
            >
              {
                recoverySent
                  ? "✓ Recovery Email Sent"
                  : "Verify Email / Send Recovery Link"
              }
            </button>

            <button
              type="button"
              className="education-learning__secondary"
              onClick={() => {
                setStep(
                  "topics",
                );

                setSubmitted(
                  false,
                );
              }}
            >
              Continue Learning
            </button>
          </section>
        )
      }
    </main>
  );
}
