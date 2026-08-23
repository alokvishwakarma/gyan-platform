import "./GyanProtectionReminder.css";


export default function GyanProtectionReminder({
  ageDays,
  hasVerifiedEmail,
  reportReady,
  onProtect,
}: {
  ageDays:
    number;

  hasVerifiedEmail:
    boolean;

  reportReady:
    boolean;

  onProtect:
    () => void;
}) {
  if (
    hasVerifiedEmail
  ) {
    return null;
  }

  if (
    reportReady
  ) {
    return (
      <aside className="gyan-protection-reminder gyan-protection-reminder--report">
        <div>
          <strong>
            Your report is ready ✓
          </strong>

          <span>
            Protect this report with email. If you lose your access code before adding an email, GYAN cannot recover your saved progress.
          </span>
        </div>

        <button
          type="button"
          onClick={
            onProtect
          }
        >
          Protect this report
        </button>
      </aside>
    );
  }

  if (
    ageDays < 7
  ) {
    return (
      <div className="gyan-protection-reminder__quiet">
        Guest GYAN · Keep your access code safe
      </div>
    );
  }

  return (
    <aside className="gyan-protection-reminder">
      <div>
        <strong>
          🔑 Keep your GYAN safe
        </strong>

        <span>
          Without a verified email, a lost access code cannot be recovered.
        </span>
      </div>

      <button
        type="button"
        onClick={
          onProtect
        }
      >
        Protect My GYAN
      </button>
    </aside>
  );
}
