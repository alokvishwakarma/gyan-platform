import {
  useEffect,
  useState,
} from "react";

import QRCode
  from "qrcode";

import "./GyanPublicPages.css";


const HOME_URL =
  "https://gyan.cc";


export default function QrPage() {
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
            width: 1200,
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
    <main className="gyan-public-page gyan-qr-page">
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
        </header>


        <section className="gyan-a5__hero">
          <h1>
            Open GYAN
          </h1>

          <p>
            Scan the QR code or simply type
            the short address below.
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
            Can&apos;t scan?
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
                Daily puzzle
              </strong>

              <small>
                Play, challenge yourself,
                and return tomorrow.
              </small>
            </div>
          </div>

          <div className="gyan-a5__feature">
            <span>🙋</span>

            <div>
              <strong>
                Request services
              </strong>

              <small>
                Tell GYAN what you need.
              </small>
            </div>
          </div>

          <div className="gyan-a5__feature">
            <span>📣</span>

            <div>
              <strong>
                Advertise free
              </strong>

              <small>
                Reach nearby customers.
              </small>
            </div>
          </div>
        </section>
      </article>
    </main>
  );
}
