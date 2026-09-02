export type MockTestLevel =
  | "MAIN"
  | "ADVANCED"
  | "NEET";

export type MockTestKind =
  | "FULL"
  | "MINI";

export type FixedMockQuestion = {
  order: number;
  sectionCode:
    string | null;
  id: number;
  key: string;
  difficulty: string;
  text: string;
  choices: {
    A: string;
    B: string;
    C: string;
    D: string;
  };
  marksCorrect: number;
  marksIncorrect: number;
  marksUnanswered: number;
};

export type FixedMockTest = {
  id: number;
  programCode: string;
  kind: MockTestKind;
  testCode: string;
  name: string;
  level: MockTestLevel;
  version: number;
  questionCount: number;
  maximumMarks: number;
  questions:
    FixedMockQuestion[];
};

export type FixedMockScore = {
  testId: number;
  testName: string;
  score: number;
  maximumMarks: number;
  correctCount: number;
  incorrectCount: number;
  unansweredCount: number;
  sections: Array<{
    sectionCode: string;
    score: number;
    maximumMarks: number;
    correct: number;
    incorrect: number;
    unanswered: number;
  }>;
  questions: Array<{
    questionId: number;
    order: number;
    sectionCode: string;
    selectedChoice:
      string | null;
    correctChoice: string;
    correct: boolean;
    marksAwarded: number;
    explanation: string;
  }>;
};

async function readJsonOrThrow<
  T,
>(
  response: Response,
): Promise<T> {
  const body =
    (await response
      .json()) as {
      error?: string;
    } & T;

  if (
    !response.ok
  ) {
    throw new Error(
      body.error ??
        `Request failed (${response.status}).`,
    );
  }

  return body;
}

export async function loadFixedMockTest(
  options: {
    program: string;
    kind: MockTestKind;
    testCode: string;
    level: MockTestLevel;
    version?: number;
  },
): Promise<FixedMockTest> {
  const params =
    new URLSearchParams({
      program:
        options.program,
      kind:
        options.kind,
      testCode:
        options.testCode,
      level:
        options.level,
      version:
        String(
          options.version ??
            1,
        ),
    });

  const response =
    await fetch(
      `/api/education/mock-test?${params.toString()}`,
      {
        headers: {
          accept:
            "application/json",
        },
      },
    );

  const body =
    await readJsonOrThrow<{
      test:
        FixedMockTest;
    }>(
      response,
    );

  return body.test;
}

export async function scoreFixedMockTest(
  options: {
    program: string;
    kind: MockTestKind;
    testCode: string;
    level: MockTestLevel;
    version?: number;
    answers:
      Record<
        number,
        string
      >;
  },
): Promise<FixedMockScore> {
  const response =
    await fetch(
      "/api/education/mock-test/score",
      {
        method:
          "POST",

        headers: {
          "content-type":
            "application/json",

          accept:
            "application/json",
        },

        body:
          JSON.stringify({
            program:
              options.program,

            kind:
              options.kind,

            testCode:
              options.testCode,

            level:
              options.level,

            version:
              options.version ??
              1,

            answers:
              Object.fromEntries(
                Object.entries(
                  options.answers,
                ).map(
                  ([
                    questionId,
                    choice,
                  ]) => [
                    questionId,
                    choice,
                  ],
                ),
              ),
          }),
      },
    );

  const body =
    await readJsonOrThrow<{
      result:
        FixedMockScore;
    }>(
      response,
    );

  return body.result;
}
