import {
  useState,
} from "react";

import "./GyanHomeChooser.css";


export type GyanHomeDestination =
  | "education"
  | "services"
  | "puzzle";


interface GyanHomeChooserProps {
  onChoose: (
    destination:
      GyanHomeDestination,
    remember:
      boolean,
  ) => void;
}


export default function GyanHomeChooser({
  onChoose,
}: GyanHomeChooserProps) {
  const [
    remember,
    setRemember,
  ] =
    useState(false);


  const rememberControl = (
    <label
      className="gyan-home-choice__remember"
    >
      <input
        type="checkbox"
        checked={
          remember
        }
        onChange={(
          event,
        ) =>
          setRemember(
            event.target.checked,
          )
        }
      />

      <span>
        Remember my choice
      </span>
    </label>
  );


  return (
    <div
      className="gyan-home-choice__overlay"
      role="presentation"
    >
      <section
        className="gyan-home-choice"
        role="dialog"
        aria-modal="true"
        aria-labelledby="gyan-home-choice-title"
      >
        <div
          className="gyan-home-choice__heading"
        >
          <h1
            id="gyan-home-choice-title"
          >
            Where would you like to go?
          </h1>

          <p>
            Choose your GYAN home.
          </p>
        </div>

        <div
          className="gyan-home-choice__remember-row gyan-home-choice__remember-row--top"
        >
          {rememberControl}
        </div>

        <div
          className="gyan-home-choice__cards"
        >
          <button
            type="button"
            className="gyan-home-choice__card gyan-home-choice__card--education"
            onClick={() =>
              onChoose(
                "education",
                remember,
              )
            }
          >
            <span
              className="gyan-home-choice__icon"
              aria-hidden="true"
            >
              🎓
            </span>

            <span
              className="gyan-home-choice__copy"
            >
              <strong>
                Education Portal
              </strong>

              <small>
                Learn • Practice • Progress
              </small>
            </span>

            <b>
              Explore →
            </b>
          </button>

          <button
            type="button"
            className="gyan-home-choice__card gyan-home-choice__card--services"
            onClick={() =>
              onChoose(
                "services",
                remember,
              )
            }
          >
            <span
              className="gyan-home-choice__icon"
              aria-hidden="true"
            >
              🧰
            </span>

            <span
              className="gyan-home-choice__copy"
            >
              <strong>
                Services Portal
              </strong>

              <small>
                Local services • Get things done
              </small>
            </span>

            <b>
              Explore →
            </b>
          </button>

          <button
            type="button"
            className="gyan-home-choice__card gyan-home-choice__card--puzzle"
            onClick={() =>
              onChoose(
                "puzzle",
                remember,
              )
            }
          >
            <span
              className="gyan-home-choice__icon"
              aria-hidden="true"
            >
              🧩
            </span>

            <span
              className="gyan-home-choice__copy"
            >
              <strong>
                GYAN Puzzle
              </strong>

              <small>
                Play • Earn Gems • Leaderboard
              </small>
            </span>

            <b>
              Play →
            </b>
          </button>
        </div>

        <div
          className="gyan-home-choice__remember-row gyan-home-choice__remember-row--bottom"
        >
          {rememberControl}
        </div>
      </section>
    </div>
  );
}
