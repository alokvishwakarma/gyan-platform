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

  optionScales:
    Array<
      "small" |
      "medium" |
      "big" |
      null
    >;

  visualType:
    string |
    null;

  visualObject:
    string |
    null;

  correctOption:
    string |
    null;

  acceptedWords:
    string[];

  topicCode:
    string |
    null;

  topicName:
    string |
    null;

  subtopicCode:
    string |
    null;

  subtopicName:
    string |
    null;
};


export async function loadLittleQuestions(
  input: {
    level:
      number;

    mode?:
      "exact" |
      "upTo";

    topic?:
      string;

    subtopic?:
      string;

    limit?:
      number;
  },
): Promise<LittleQuestion[]> {
  const parameters =
    new URLSearchParams();

  parameters.set(
    "level",
    String(
      input.level,
    ),
  );

  parameters.set(
    "mode",
    input.mode ??
      "exact",
  );

  parameters.set(
    "limit",
    String(
      input.limit ??
      5,
    ),
  );

  if (
    input.topic &&
    input.topic !==
      "ALL"
  ) {
    parameters.set(
      "topic",
      input.topic,
    );
  }

  if (
    input.subtopic
  ) {
    parameters.set(
      "subtopic",
      input.subtopic,
    );
  }

  const response =
    await fetch(
      `/api/education/little/questions?${parameters.toString()}`,
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
): Promise<{
  saved:
    boolean;

  linked:
    boolean;

  studentCode?:
    string;
}> {
  const response =
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

  const result =
    await response.json() as {
      saved?: boolean;
      linked?: boolean;
      studentCode?: string;
      error?: string;
    };

  if (
    !response.ok ||
    !result.saved
  ) {
    throw new Error(
      result.error ??
        "Learning progress could not be saved.",
    );
  }

  return {
    saved:
      true,

    linked:
      Boolean(
        result.linked,
      ),

    studentCode:
      result.studentCode,
  };
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


export type AbaQuestionMastery = {
  questionId:
    number;

  level:
    number;

  promptText:
    string;

  topicCode:
    string;

  topicName:
    string;

  subtopicCode:
    string;

  subtopicName:
    string;

  attempts:
    number;

  correctCount:
    number;

  wrongCount:
    number;

  accuracyPercent:
    number;

  latestCorrect:
    boolean;

  recentCorrect:
    number;

  recentAttempts:
    number;

  state:
    "green" |
    "yellow" |
    "red";
};


export type AbaTopicMastery = {
  code:
    string;

  name:
    string;

  attempts:
    number;

  correctCount:
    number;

  wrongCount:
    number;

  accuracyPercent:
    number;

  greenQuestions:
    number;

  yellowQuestions:
    number;

  redQuestions:
    number;

  state:
    "green" |
    "yellow" |
    "red";
};


export type AbaProgressReport = {
  student: {
    code:
      string;

    name:
      string;
  };

  summary: {
    attempts:
      number;

    correctCount:
      number;

    wrongCount:
      number;

    accuracyPercent:
      number;

    questionsTried:
      number;
  };

  topics:
    AbaTopicMastery[];

  questions:
    AbaQuestionMastery[];
};


export async function loadAbaProgress(
  studentCode?:
    string,
): Promise<AbaProgressReport> {
  const parameters =
    new URLSearchParams();

  if (
    studentCode
  ) {
    parameters.set(
      "student",
      studentCode
        .trim()
        .toUpperCase(),
    );
  }

  const response =
    await fetch(
      `/api/education/little/progress?${parameters.toString()}`,
      {
        credentials:
          "include",
      },
    );

  const result =
    await response.json() as
      AbaProgressReport & {
        error?:
          string;
      };

  if (
    !response.ok ||
    !result.student
  ) {
    throw new Error(
      result.error ??
        "ABA progress could not be loaded.",
    );
  }

  return result;
}


export async function loadAbaDifficultQuestions(
  input: {
    studentCode?:
      string;

    limit?:
      number;
  },
): Promise<LittleQuestion[]> {
  const parameters =
    new URLSearchParams();

  if (
    input.studentCode
  ) {
    parameters.set(
      "student",
      input.studentCode
        .trim()
        .toUpperCase(),
    );
  }

  parameters.set(
    "limit",
    String(
      input.limit ??
      5,
    ),
  );

  const response =
    await fetch(
      `/api/education/little/review?${parameters.toString()}`,
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
        "Difficult questions could not be loaded.",
    );
  }

  return result.questions;
}
