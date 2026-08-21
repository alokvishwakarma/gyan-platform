import {
  useState,
} from "react";

import {
  rememberLittleStudentCode,
} from "../config/littleLearners";

interface LittleLearnerCardSetupProps {
  onBack:
    () => void;

  onReady:
    (
      code: string,
    ) => void;
}

export default function LittleLearnerCardSetup({
  onBack,
  onReady,
}: LittleLearnerCardSetupProps) {
  const [
    code,
    setCode,
  ] =
    useState("");

  function save():
    void {
    const normalized =
      code
        .trim()
        .toUpperCase();

    if (
      !/^[A-Z2-9]{4}$/.test(
        normalized,
      )
    ) {
      return;
    }

    rememberLittleStudentCode(
      normalized,
    );

    onReady(
      normalized,
    );
  }

  return (
    <main
      className="education-learning"
    >
      <header
        className="education-learning__header"
      >
        <button
          type="button"
          onClick={
            onBack
          }
        >
          ←
        </button>

        <div>
          <strong>
            🌱 Words Growing
          </strong>
        </div>
      </header>

      <section
        className="education-learning__result-summary"
      >
        <strong>
          Connect Student Card
        </strong>

        <p>
          Enter the 4-character GYAN student code.
        </p>

        <input
          value={
            code
          }
          maxLength={
            4
          }
          placeholder="ABCD"
          onChange={(
            event,
          ) =>
            setCode(
              event.target.value,
            )
          }
        />

        <button
          type="button"
          className="education-learning__primary"
          onClick={
            save
          }
        >
          Continue
        </button>
      </section>
    </main>
  );
}
