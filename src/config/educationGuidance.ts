export type GuidanceChoice =
  | "A"
  | "B"
  | "C"
  | "D";

export type GuidanceKind =
  | "TIP"
  | "FIFTY_FIFTY";

export type GuidanceContextType =
  | "MOCK"
  | "LIVE";

export type GuidanceState = {
  questionId: number;
  challengeMode?: boolean;
  tipAvailable: boolean;
  fiftyFiftyAvailable: boolean;
  tipUnlocked: boolean;
  fiftyFiftyUnlocked: boolean;
  tipText: string | null;
  eliminatedChoices: {
    choice:
      GuidanceChoice;
    reason:
      string;
  }[];
  tipGemCost: number;
  fiftyFiftyGemCost: number;
  assistanceCapRemaining:
    number | null;
  gemBalance: number;
};

export async function loadQuestionGuidance(
  questionId: number,
  contextType:
    GuidanceContextType,
  contextId: number,
): Promise<GuidanceState> {
  const params =
    new URLSearchParams({
      questionId:
        String(questionId),
      contextType,
      contextId:
        String(contextId),
    });

  const response =
    await fetch(
      `/api/education/guidance?${params.toString()}`,
      {
        credentials:
          "include",
        cache:
          "no-store",
      },
    );

  const body =
    await response.json() as
      GuidanceState & {
        error?: string;
      };

  if (!response.ok) {
    throw new Error(
      body.error ??
      "Guided help could not be loaded.",
    );
  }

  return body;
}

export async function unlockQuestionGuidance(
  questionId: number,
  kind:
    GuidanceKind,
  contextType:
    GuidanceContextType,
  contextId: number,
): Promise<GuidanceState> {
  const response =
    await fetch(
      "/api/education/guidance/unlock",
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
            questionId,
            kind,
            contextType,
            contextId,
          }),
      },
    );

  const body =
    await response.json() as
      GuidanceState & {
        error?: string;
      };

  if (!response.ok) {
    throw new Error(
      body.error ??
      "Guided help could not be unlocked.",
    );
  }

  return body;
}
