interface MyRatingsPageProps {
  onBack:
    () => void;
}


export default function MyRatingsPage({
  onBack,
}: MyRatingsPageProps) {
  return (
    <main
      style={{
        width:
          "min(100%, 620px)",

        margin:
          "0 auto",

        padding:
          "0 12px 80px",

        boxSizing:
          "border-box",
      }}
    >
      <header
        style={{
          minHeight:
            "56px",

          display:
            "grid",

          gridTemplateColumns:
            "48px 1fr 48px",

          alignItems:
            "center",
        }}
      >
        <button
          type="button"
          aria-label="Back"
          onClick={
            onBack
          }
          style={{
            width:
              "44px",

            height:
              "44px",

            border:
              "0",

            borderRadius:
              "50%",

            background:
              "#fff",
          }}
        >
          ←
        </button>

        <strong
          style={{
            textAlign:
              "center",
          }}
        >
          ⭐ My Ratings
        </strong>

        <span />
      </header>

      <section
        style={{
          marginTop:
            "10px",

          padding:
            "16px",

          borderRadius:
            "14px",

          background:
            "#fff",

          textAlign:
            "center",
        }}
      >
        <strong>
          Your ratings
        </strong>

        <p
          style={{
            margin:
              "6px 0 0",

            fontSize:
              ".7rem",

            opacity:
              .7,
          }}
        >
          Ratings and reviews you submit for GYAN shops and services will appear here.
        </p>
      </section>
    </main>
  );
}
