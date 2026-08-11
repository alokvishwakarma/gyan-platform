import {
  useEffect,
  useState,
} from "react";

import QRCode
  from "qrcode";

import "./GyanPublicPages.css";


const HOME_URL =
  "https://gyan.cc";


export default function CompanyCardPage() {
  const [
    qrUrl,
    setQrUrl,
  ] =
    useState("");


  useEffect(
    () => {
      void QRCode
        .toDataURL(
          HOME_URL,
          {
            width: 900,
            margin: 2,
            errorCorrectionLevel: "H",
          },
        )
        .then(
          setQrUrl,
        )
        .catch(
          (
            error,
          ) => {
            console.error(
              "Unable to create GYAN QR:",
              error,
            );
          },
        );
    },
    [],
  );


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
            Scan. Play. Discover.
          </h1>

          <p>
            Start with today&apos;s puzzle,
            discover nearby offers, request
            services, or advertise your local
            business for free.
          </p>
        </section>


        <div className="gyan-a5__qr-wrap">
          {
            qrUrl &&
            (
              <img
                className="gyan-a5__qr"
                src={qrUrl}
                alt="QR code for gyan.cc"
              />
            )
          }
        </div>


        <div className="gyan-a5__scan">
          <strong>
            Scan or visit
          </strong>

          <span>
            GYAN.CC
          </span>
        </div>


        <section className="gyan-a5__features">
          <div className="gyan-a5__feature">
            <span>🧩</span>

            <div>
              <strong>
                Play today&apos;s puzzle
              </strong>

              <small>
                Challenge yourself and build
                a daily streak.
              </small>
            </div>
          </div>

          <div className="gyan-a5__feature">
            <span>🙋</span>

            <div>
              <strong>
                Request a service
              </strong>

              <small>
                Tell GYAN what you need and
                connect with nearby providers.
              </small>
            </div>
          </div>

          <div className="gyan-a5__feature">
            <span>📣</span>

            <div>
              <strong>
                Advertise for FREE
              </strong>

              <small>
                Local businesses can reach
                customers in their service area.
              </small>
            </div>
          </div>

          <div className="gyan-a5__feature">
            <span>⭐</span>

            <div>
              <strong>
                Discover nearby offers
              </strong>

              <small>
                See relevant local promotions
                around you.
              </small>
            </div>
          </div>
        </section>


        <footer className="gyan-a5__footer">
          GYAN connects people with useful
          digital and local services.
        </footer>
      </article>
    </main>
  );
}
