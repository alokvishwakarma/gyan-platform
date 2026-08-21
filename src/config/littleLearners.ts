export type LittleQuestion = {
  id: number;

  skillCode:
    string;

  level:
    number;

  promptText:
    string;

  questionType:
    | "tap"
    | "speak";

  options:
    string[];

  correctOption:
    string |
    null;

  acceptedWords:
    string[];
};


export async function loadLittleQuestions(
  level = 2,
): Promise<LittleQuestion[]> {
  const response =
    await fetch(
      `/api/education/little/questions?level=${encodeURIComponent(
        String(
          level,
        ),
      )}`,
      {
        credentials:
          "include",
      },
    );

  const result =
    await response.json() as {
      questions?:
        LittleQuestion[];

      error?:
        string;
    };

  if (
    !response.ok ||
    !result.questions
  ) {
    throw new Error(
      result.error ??
        "Little Learners questions are unavailable.",
    );
  }

  return result.questions;
}


export async function saveLittleAttempt(
  input: {
    studentCode?:
      string;

    questionId:
      number;

    responseType:
      "tap" |
      "speech" |
      "parent";

    responseValue:
      string;

    correct:
      boolean;
  },
): Promise<void> {
  await fetch(
    "/api/education/little/attempt",
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
}


export type ChildWord = {
  id: number;
  word: string;

  status:
    | "emerging"
    | "independent";

  firstObservedAt:
    string;

  firstIndependentAt:
    string |
    null;
};


export type MonthlyWordCount = {
  month:
    string;

  count:
    number;
};


export async function loadChildWords(
  studentCode:
    string,
): Promise<{
  student: {
    code: string;
    name: string;
  };

  words:
    ChildWord[];

  monthly:
    MonthlyWordCount[];
}> {
  const response =
    await fetch(
      `/api/education/little/words?student=${encodeURIComponent(
        studentCode,
      )}`,
      {
        credentials:
          "include",
      },
    );

  const result =
    await response.json() as {
      student?: {
        code: string;
        name: string;
      };

      words?:
        ChildWord[];

      monthly?:
        MonthlyWordCount[];

      error?:
        string;
    };

  if (
    !response.ok ||
    !result.student ||
    !result.words ||
    !result.monthly
  ) {
    throw new Error(
      result.error ??
        "Words could not be loaded.",
    );
  }

  return {
    student:
      result.student,

    words:
      result.words,

    monthly:
      result.monthly,
  };
}


export async function saveChildWord(
  input: {
    studentCode:
      string;

    word:
      string;

    status:
      "emerging" |
      "independent";
  },
): Promise<void> {
  const response =
    await fetch(
      "/api/education/little/words",
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
      saved?: boolean;
      error?: string;
    };

  if (
    !response.ok ||
    !result.saved
  ) {
    throw new Error(
      result.error ??
        "Word could not be saved.",
    );
  }
}


const LITTLE_STUDENT_KEY =
  "gyan_little_learner_student";

export function getRememberedLittleStudentCode():
  string {
  try {
    return (
      localStorage.getItem(
        LITTLE_STUDENT_KEY,
      ) ??
      ""
    )
      .trim()
      .toUpperCase();
  } catch {
    return "";
  }
}

export function rememberLittleStudentCode(
  code:
    string,
): void {
  try {
    localStorage.setItem(
      LITTLE_STUDENT_KEY,
      code
        .trim()
        .toUpperCase(),
    );
  } catch {
    // Optional convenience only.
  }
}
