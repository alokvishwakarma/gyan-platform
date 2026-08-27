interface WordsHubPageProps {
  onBack: () => void;
  onOpenWordsGrowing: () => void;
  onOpenPromptGrowing: () => void;
}


export default function WordsHubPage({
  onBack,
  onOpenWordsGrowing,
  onOpenPromptGrowing,
}: WordsHubPageProps) {
  return (
    <main
      style={{
        maxWidth: "760px",
        margin: "0 auto",
        padding: "18px 16px 30px",
        fontFamily:
          "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif",
      }}
    >
      <button
        type="button"
        onClick={onBack}
        style={{
          minHeight: "42px",
          padding: "0 14px",
          borderRadius: "10px",
          border:
            "1px solid #d0d5dd",
          background: "white",
          cursor: "pointer",
        }}
      >
        ← Back
      </button>

      <header
        style={{
          textAlign: "center",
          margin: "18px 0",
        }}
      >
        <h1
          style={{
            margin: 0,
            fontSize: "1.45rem",
          }}
        >
          🌱 Words Growing
        </h1>
        <p
          style={{
            margin:
              "6px auto 0",
            maxWidth: "560px",
            color: "#667085",
            lineHeight: 1.45,
          }}
        >
          Track vocabulary growth or practice retrieving familiar words with gradually revealed letters.
        </p>
      </header>

      <div
        style={{
          display: "grid",
          gridTemplateColumns:
            "repeat(auto-fit, minmax(240px, 1fr))",
          gap: "12px",
        }}
      >
        <button
          type="button"
          onClick={
            onOpenPromptGrowing
          }
          style={{
            minHeight: "150px",
            padding: "18px",
            borderRadius: "16px",
            border:
              "1px solid #d0d5dd",
            background: "white",
            textAlign: "left",
            cursor: "pointer",
          }}
        >
          <div
            style={{
              fontSize: "2rem",
            }}
          >
            🥛 M → MI → MIL → MILK
          </div>
          <strong
            style={{
              display: "block",
              marginTop: "10px",
              fontSize: "1.05rem",
            }}
          >
            Word Growing Practice
          </strong>
          <span
            style={{
              display: "block",
              marginTop: "6px",
              color: "#667085",
              lineHeight: 1.4,
            }}
          >
            Picture first, then reveal letters gradually. Record the earliest cue that produces the spoken word.
          </span>
        </button>

        <button
          type="button"
          onClick={
            onOpenWordsGrowing
          }
          style={{
            minHeight: "150px",
            padding: "18px",
            borderRadius: "16px",
            border:
              "1px solid #d0d5dd",
            background: "white",
            textAlign: "left",
            cursor: "pointer",
          }}
        >
          <div
            style={{
              fontSize: "2rem",
            }}
          >
            📈🌱
          </div>
          <strong
            style={{
              display: "block",
              marginTop: "10px",
              fontSize: "1.05rem",
            }}
          >
            Words Growing Report
          </strong>
          <span
            style={{
              display: "block",
              marginTop: "6px",
              color: "#667085",
              lineHeight: 1.4,
            }}
          >
            Open the existing vocabulary-growth view and progress history.
          </span>
        </button>
      </div>
    </main>
  );
}
