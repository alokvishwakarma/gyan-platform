import {
  useState,
} from "react";

import LittleLearnersPage
  from "./LittleLearnersPage";

import WordsGrowingPage
  from "./WordsGrowingPage";

import LittleLearnerCardSetup
  from "./LittleLearnerCardSetup";

import {
  getRememberedLittleStudentCode,
} from "../config/littleLearners";


interface LittleLearnersExperienceProps {
  onBack:
    () => void;
}


type View =
  | "practice"
  | "words";


export default function LittleLearnersExperience({
  onBack,
}: LittleLearnersExperienceProps) {
  const [
    view,
    setView,
  ] =
    useState<View>(
      "practice",
    );

  const [
    studentCode,
    setStudentCode,
  ] =
    useState(
      () =>
        getRememberedLittleStudentCode(),
    );


  if (
    view ===
      "words"
  ) {
    if (
      !studentCode
    ) {
      return (
        <LittleLearnerCardSetup
          onBack={() => {
            setView(
              "practice",
            );
          }}

          onReady={(
            code,
          ) => {
            setStudentCode(
              code,
            );

            setView(
              "words",
            );
          }}
        />
      );
    }

    return (
      <WordsGrowingPage
        studentCode={
          studentCode
        }

        onBack={() => {
          setView(
            "practice",
          );
        }}
      />
    );
  }


  return (
    <LittleLearnersPage
      title="Education ABA"

      level={
        2
      }

      studentCode={
        studentCode ||
        undefined
      }

      onBack={
        onBack
      }

      onOpenWords={() => {
        setView(
          "words",
        );
      }}
    />
  );
}
