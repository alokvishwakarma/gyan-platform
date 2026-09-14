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

export class GuidanceInsufficientGemsError
  extends Error {
  requiredGems: number;
  gemBalance: number;
  contactEmail: string;
  assistanceType:
    GuidanceKind;

  constructor(
    message: string,
    details: {
      requiredGems: number;
      gemBalance: number;
      contactEmail: string;
      assistanceType:
        GuidanceKind;
    },
  ) {
    super(message);

    this.name =
      "GuidanceInsufficientGemsError";

    this.requiredGems =
      details.requiredGems;

    this.gemBalance =
      details.gemBalance;

    this.contactEmail =
      details.contactEmail;

    this.assistanceType =
      details.assistanceType;
  }
}

export type GemRequestResult = {
  sent: boolean;
  email: string;
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
        code?: string;
        requiredGems?: number;
        contactEmail?: string;
        assistanceType?:
          GuidanceKind;
      };

  if (!response.ok) {
    if (
      response.status === 402 &&
      body.code ===
        "INSUFFICIENT_GEMS"
    ) {
      throw new GuidanceInsufficientGemsError(
        body.error ??
          "More Gems are needed.",
        {
          requiredGems:
            Number(
              body.requiredGems ??
              1,
            ),
          gemBalance:
            Number(
              body.gemBalance ??
              0,
            ),
          contactEmail:
            String(
              body.contactEmail ??
              "",
            ),
          assistanceType:
            body.assistanceType ??
            kind,
        },
      );
    }

    throw new Error(
      body.error ??
      "Guided help could not be unlocked.",
    );
  }

  return body;
}


export async function requestMoreGems(
  options: {
    email: string;
    questionId: number;
    kind:
      GuidanceKind;
    contextType:
      GuidanceContextType;
    contextId: number;
  },
): Promise<GemRequestResult> {
  const response =
    await fetch(
      "/api/education/guidance/gem-request",
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
            options,
          ),
      },
    );

  const body =
    await response.json() as
      GemRequestResult & {
        error?: string;
      };

  if (!response.ok) {
    throw new Error(
      body.error ??
      "Gem request could not be sent.",
    );
  }

  return body;
}
