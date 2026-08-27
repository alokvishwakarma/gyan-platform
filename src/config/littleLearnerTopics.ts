export type LittleLearnerTopic = {
  code: string;
  name: string;
  icon: string;

  subtopics:
    Array<{
      code: string;
      name: string;
    }>;
};

export const LITTLE_LEARNER_TOPICS:
  LittleLearnerTopic[] = [
  {
    code:
      "ALL",
    name:
      "Mixed",
    icon:
      "🌱",
    subtopics: [],
  },

  {
    code:
      "CONCEPTS",
    name:
      "Concepts",
    icon:
      "🧠",
    subtopics: [
      {
        code:
          "BIG_SMALL",
        name:
          "Big & Small",
      },
      {
        code:
          "SAME_DIFFERENT",
        name:
          "Same & Different",
      },
      {
        code:
          "FUNCTIONAL",
        name:
          "Help & More",
      },
      {
        code:
          "FEELINGS",
        name:
          "Feelings",
      },
      {
        code:
          "LOCATION",
        name:
          "In, On & Under",
      },
      {
        code:
          "SEQUENCE",
        name:
          "First & Then",
      },
    ],
  },

  {
    code:
      "WORDS",
    name:
      "Words",
    icon:
      "🗣️",
    subtopics: [
      {
        code:
          "NOUNS",
        name:
          "Nouns",
      },
    ],
  },

  {
  code: "TEXTUAL_PROMPTING",
  name: "Textual Prompting",
  icon: "📝",
  subtopics: [],
},

  {
    code:
      "ACTIONS",
    name:
      "Actions",
    icon:
      "🏃",
    subtopics: [
      {
        code:
          "BASIC_ACTIONS",
        name:
          "Go, Stop & Come",
      },
      {
        code:
          "MOVEMENT",
        name:
          "Push & Spin",
      },
    ],
  },

  {
    code:
      "COLORS",
    name:
      "Colors",
    icon:
      "🎨",
    subtopics: [
      {
        code:
          "BASIC_COLORS",
        name:
          "Basic Colors",
      },
    ],
  },

  {
    code:
      "NUMBERS",
    name:
      "Numbers",
    icon:
      "🔢",
    subtopics: [
      {
        code:
          "COUNT_1_5",
        name:
          "Numbers 1–5",
      },
    ],
  },
];


export const LITTLE_LEARNER_LEVELS =
  [
    {
      level:
        1,
      name:
        "Exposure",
    },
    {
      level:
        2,
      name:
        "2 choices",
    },
    {
      level:
        3,
      name:
        "3 choices",
    },
    {
      level:
        4,
      name:
        "Generalize",
    },
    {
      level:
        5,
      name:
        "Combine",
    },
  ] as const;
