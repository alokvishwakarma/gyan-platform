import "./GyanPublicPages.css";


export default function AboutPage() {
  return (
    <main className="gyan-public-page">
      <article className="gyan-a5">
        <header className="gyan-a5__brand">
          <div className="gyan-a5__brand-main">
            <div className="gyan-a5__logo">
              📖
            </div>

            <div>
              <strong>
                GYAN
              </strong>

              <small>
                Play • Request • Connect
              </small>
            </div>
          </div>

          <div className="gyan-a5__domain">
            GYAN.CC
          </div>
        </header>


        <section className="gyan-a5__hero">
          <h1>
            What is GYAN?
          </h1>

          <p>
            GYAN is a simple community platform:
            enjoy a daily puzzle, discover local
            businesses, request help, and connect
            with useful services.
          </p>
        </section>


        <section className="gyan-about__section">
          <h2>
            🧩 Start with a puzzle
          </h2>

          <p>
            GYAN&apos;s daily puzzle gives people
            a reason to visit, challenge themselves,
            return regularly, and discover what else
            is available in their community.
          </p>
        </section>


        <section className="gyan-about__section">
          <h2>
            🙋 Need something?
          </h2>

          <p>
            Instead of searching through long lists,
            tell GYAN what service you need. GYAN can
            route the request to a participating local
            provider or GYAN Support.
          </p>
        </section>


        <section className="gyan-about__section">
          <h2>
            📣 Own a local business?
          </h2>

          <p>
            Businesses can advertise for free,
            select their service area, publish an
            offer, and become discoverable by nearby
            users.
          </p>
        </section>


        <section className="gyan-about__section">
          <h2>
            How it works
          </h2>

          <div className="gyan-about__steps">
            <div className="gyan-about__step">
              <span>1️⃣</span>
              <span>
                Visit <strong>GYAN.CC</strong>.
              </span>
            </div>

            <div className="gyan-about__step">
              <span>2️⃣</span>
              <span>
                Play the puzzle or explore
                nearby services.
              </span>
            </div>

            <div className="gyan-about__step">
              <span>3️⃣</span>
              <span>
                Request what you need or
                advertise what you provide.
              </span>
            </div>

            <div className="gyan-about__step">
              <span>4️⃣</span>
              <span>
                GYAN helps connect demand
                with local supply.
              </span>
            </div>
          </div>
        </section>


        <footer className="gyan-a5__footer">
          Built to grow one useful community
          at a time.
        </footer>
      </article>
    </main>
  );
}
