export type EducationReportTopic = {
  code: string;
  name: string;

  attempts: number;
  questionsAnswered: number;
  correctAnswers: number;

  scorePercent:
    number |
    null;
};

export type SavedStudentCard = {
  code: string;
  name: string;
  email: string;
  cardUrl: string;
};

export async function saveEducationProgress(
  input: {
    studentName: string;
    email: string;
    country: string;
    grade: string;
    subject: string;
    topic: string;

    studentCode?:
      string;

    answers:
      Array<{
        questionId:
          number;

        selectedChoice:
          string;
      }>;
  },
): Promise<{
  student:
    SavedStudentCard;

  report:
    EducationReportTopic[];
}> {
  const response =
    await fetch(
      "/api/education/save-progress",
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
          JSON.stringify(
            input,
          ),
      },
    );

  const result =
    await response.json() as {
      student?:
        SavedStudentCard;

      report?:
        EducationReportTopic[];

      error?:
        string;
    };

  if (
    !response.ok ||
    !result.student ||
    !result.report
  ) {
    throw new Error(
      result.error ??
        "Progress could not be saved.",
    );
  }

  return {
    student:
      result.student,

    report:
      result.report,
  };
}

export async function sendEducationRecoveryLink(
  email:
    string,
): Promise<void> {
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
            email:
              email
                .trim()
                .toLowerCase(),
          }),
      },
    );

  const result =
    await response.json() as {
      sent?: boolean;
      error?: string;
    };

  if (
    !response.ok ||
    !result.sent
  ) {
    throw new Error(
      result.error ??
        "Recovery email could not be sent.",
    );
  }
}
