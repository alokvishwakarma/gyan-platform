export type EducationCountry =
  | "US"
  | "IN";

export type LearningItem = {
  code: string;
  name: string;
};

export type TopicItem =
  LearningItem & {
    subtopicCount: number;
    questionCount: number;
  };

export type SubtopicItem =
  LearningItem & {
    questionCount: number;
  };

export type PracticeQuestion = {
  id: number;
  key: string;

  difficulty:
    | "easy"
    | "medium"
    | "challenge";

  text: string;

  choices:
    string[];
};

async function getJson<T>(
  path: string,
): Promise<T> {
  const response =
    await fetch(
      path,
      {
        credentials:
          "same-origin",
      },
    );

  const result =
    await response.json() as
      T & {
        error?: string;
      };

  if (
    !response.ok
  ) {
    throw new Error(
      result.error ??
        "Education data unavailable.",
    );
  }

  return result;
}

function qs(
  values:
    Record<
      string,
      string
    >,
): string {
  return new URLSearchParams(
    values,
  ).toString();
}

export async function loadSubjects(
  country:
    EducationCountry,
  grade:
    string,
): Promise<LearningItem[]> {
  const result =
    await getJson<{
      subjects:
        LearningItem[];
    }>(
      `/api/education/subjects?${
        qs({
          country,
          grade,
        })
      }`,
    );

  return result.subjects;
}

export async function loadTopics(
  country:
    EducationCountry,
  grade:
    string,
  subject:
    string,
): Promise<TopicItem[]> {
  const result =
    await getJson<{
      topics:
        TopicItem[];
    }>(
      `/api/education/topics?${
        qs({
          country,
          grade,
          subject,
        })
      }`,
    );

  return result.topics;
}

export async function loadSubtopics(
  country:
    EducationCountry,
  grade:
    string,
  subject:
    string,
  topic:
    string,
): Promise<SubtopicItem[]> {
  const result =
    await getJson<{
      subtopics:
        SubtopicItem[];
    }>(
      `/api/education/subtopics?${
        qs({
          country,
          grade,
          subject,
          topic,
        })
      }`,
    );

  return result.subtopics;
}

export async function loadPracticeQuestions(
  country:
    EducationCountry,
  grade:
    string,
  subject:
    string,
  topic:
    string,
  subtopic?:
    string,
  advance =
    false,
): Promise<PracticeQuestion[]> {
  const values:
    Record<
      string,
      string
    > = {
    country,
    grade,
    subject,
    topic,
  };

  if (
    subtopic
  ) {
    values.subtopic =
      subtopic;
  }

  if (
    advance
  ) {
    values.advance =
      "1";
  }

  const result =
    await getJson<{
      questions:
        PracticeQuestion[];
    }>(
      `/api/education/practice?${
        qs(
          values,
        )
      }`,
    );

  return result.questions;
}

export async function checkPracticeAnswer(
  questionId:
    number,
  choice:
    string,
): Promise<{
  correct: boolean;
  correctChoice: string;
  explanation: string;
}> {
  const response =
    await fetch(
      "/api/education/check-answer",
      {
        method:
          "POST",
        credentials:
          "same-origin",

        headers: {
          "content-type":
            "application/json",
        },

        body:
          JSON.stringify({
            questionId,
            choice,
          }),
      },
    );

  const result =
    await response.json() as {
      correct?: boolean;
      correctChoice?: string;
      explanation?: string;
      error?: string;
    };

  if (
    !response.ok ||
    typeof result.correct !==
      "boolean" ||
    !result.correctChoice
  ) {
    throw new Error(
      result.error ??
        "Answer could not be checked.",
    );
  }

  return {
    correct:
      result.correct,

    correctChoice:
      result.correctChoice,

    explanation:
      result.explanation ??
      "",
  };
}
