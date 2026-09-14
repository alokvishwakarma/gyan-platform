import { useState } from "react";
import "./QuestionGuidanceControls.css";

export type GuidanceChoice = "A" | "B" | "C" | "D";

export type FiftyFiftyElimination = {
  choice: GuidanceChoice;
  reason: string;
};

export type QuestionGuidancePayload = {
  questionId: number;
  tipAvailable: boolean;
  fiftyFiftyAvailable: boolean;
  tipUnlocked?: boolean;
  fiftyFiftyUnlocked?: boolean;
  tipText?: string | null;
  eliminatedChoices?: FiftyFiftyElimination[];
  tipGemCost?: number;
  fiftyFiftyGemCost?: number;
  assistanceCapRemaining?: number | null;
};

type Props = {
  guidance: QuestionGuidancePayload;
  disabled?: boolean;
  resultsMode?: boolean;
  onUnlockTip: () => Promise<QuestionGuidancePayload>;
  onUnlockFiftyFifty: () => Promise<QuestionGuidancePayload>;
  onGuidanceChange?: (next: QuestionGuidancePayload) => void;
};

export default function QuestionGuidanceControls({
  guidance,
  disabled = false,
  resultsMode = false,
  onUnlockTip,
  onUnlockFiftyFifty,
  onGuidanceChange,
}: Props) {
  const [current, setCurrent] = useState(guidance);
  const [loading, setLoading] = useState<"TIP" | "FIFTY" | null>(null);
  const [error, setError] = useState("");

  async function run(
    kind: "TIP" | "FIFTY",
    action: () => Promise<QuestionGuidancePayload>,
  ) {
    if (loading || disabled) return;

    setLoading(kind);
    setError("");

    try {
      const next = await action();
      setCurrent(next);
      onGuidanceChange?.(next);
    } catch (caught) {
      setError(
        caught instanceof Error
          ? caught.message
          : "Help could not be opened.",
      );
    } finally {
      setLoading(null);
    }
  }

  const tipCost = resultsMode ? 0 : (current.tipGemCost ?? 1);
  const fiftyCost = resultsMode ? 0 : (current.fiftyFiftyGemCost ?? 1);

  return (
    <section className="question-guidance">
      <div className="question-guidance__actions">
        {current.tipAvailable && !current.tipUnlocked && (
          <button
            type="button"
            disabled={disabled || loading !== null}
            onClick={() => void run("TIP", onUnlockTip)}
          >
            💡 Tip{tipCost > 0 ? ` · 💎${tipCost}` : ""}
          </button>
        )}

        {current.fiftyFiftyAvailable &&
          !current.fiftyFiftyUnlocked &&
          !resultsMode && (
            <button
              type="button"
              disabled={disabled || loading !== null}
              onClick={() =>
                void run("FIFTY", onUnlockFiftyFifty)
              }
            >
              50/50{fiftyCost > 0 ? ` · 💎${fiftyCost}` : ""}
            </button>
          )}

        {current.assistanceCapRemaining != null &&
          current.assistanceCapRemaining > 0 &&
          !resultsMode && (
            <small>
              Test help cap: 💎{current.assistanceCapRemaining} remaining
            </small>
          )}
      </div>

      {current.tipUnlocked && current.tipText && (
        <div className="question-guidance__tip">
          <strong>💡 GYAN Tip</strong>
          <span>{current.tipText}</span>
        </div>
      )}

      {current.fiftyFiftyUnlocked &&
        current.eliminatedChoices &&
        current.eliminatedChoices.length > 0 && (
          <div className="question-guidance__fifty">
            <strong>50/50</strong>
            <span>Two choices can be eliminated:</span>

            {current.eliminatedChoices.map((item) => (
              <div
                key={item.choice}
                className="question-guidance__elimination"
              >
                <b>✕ {item.choice}</b>
                <span>{item.reason}</span>
              </div>
            ))}
          </div>
        )}

      {error && (
        <div className="question-guidance__error">
          {error}
        </div>
      )}
    </section>
  );
}
