export type StudentReportTopic = {
  code: string;
  name: string;
  attempts: number;
  questionsAnswered: number;
  correctAnswers: number;
  scorePercent: number | null;
};

export type StudentReport = {
  student: {
    code: string;
    name: string;
    email: string;
    country: string;
    grade: string;
  };
  report: StudentReportTopic[];
};

export async function loadStudentReport(
  studentCode: string,
  subject = "MATH",
): Promise<StudentReport> {
  const parameters = new URLSearchParams({
    student: studentCode.trim().toUpperCase(),
    subject,
  });

  const response = await fetch(
    `/api/education/report?${parameters.toString()}`,
    { credentials: "include" },
  );

  const result = await response.json() as
    StudentReport & { error?: string };

  if (!response.ok) {
    const error = new Error(
      result.error ?? "Student progress could not be loaded.",
    ) as Error & { status?: number };
    error.status = response.status;
    throw error;
  }

  return result;
}

export async function sendStudentAccessLink(
  email: string,
  studentCode: string,
): Promise<void> {
  const returnTo =
    `/student/${studentCode.trim().toUpperCase()}`;

  const response = await fetch(
    "/api/auth/magic-link",
    {
      method: "POST",
      credentials: "include",
      headers: {
        "content-type": "application/json",
      },
      body: JSON.stringify({
        email: email.trim().toLowerCase(),
        returnTo,
      }),
    },
  );

  const result = await response.json() as {
    sent?: boolean;
    error?: string;
  };

  if (!response.ok || !result.sent) {
    throw new Error(
      result.error ?? "Verification email could not be sent.",
    );
  }
}

export function studentCodeFromPath(
  pathname = window.location.pathname,
): string | null {
  const match =
    pathname.match(/^\/student\/([A-Z2-9]{4})\/?$/i);

  return match
    ? match[1].toUpperCase()
    : null;
}


export type StudentReviewQuestion = {
  id: number;
  key: string;

  difficulty:
    | "easy"
    | "medium"
    | "challenge";

  text: string;
  choices: string[];
};

export async function loadStudentReviewQuestions(
  input: {
    studentCode: string;
    subject?: string;
    topic: string;
  },
): Promise<{
  questions: StudentReviewQuestion[];
  unresolvedWrongCount: number;
}> {
  const parameters =
    new URLSearchParams({
      student:
        input.studentCode
          .trim()
          .toUpperCase(),

      subject:
        input.subject ??
        "MATH",

      topic:
        input.topic
          .trim()
          .toUpperCase(),
    });

  const response =
    await fetch(
      `/api/education/review-questions?${parameters.toString()}`,
      {
        credentials:
          "include",
      },
    );

  const result =
    await response.json() as {
      questions?:
        StudentReviewQuestion[];

      unresolvedWrongCount?:
        number;

      error?:
        string;
    };

  if (
    !response.ok ||
    !result.questions
  ) {
    throw new Error(
      result.error ??
        "Review questions could not be loaded.",
    );
  }

  return {
    questions:
      result.questions,

    unresolvedWrongCount:
      Number(
        result.unresolvedWrongCount ??
        0,
      ),
  };
}
