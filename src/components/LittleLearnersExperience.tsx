import {
  useState,
} from "react";

import LittleLearnersPage
  from "./LittleLearnersPage";

import WordsGrowingPage
  from "./WordsGrowingPage";

import LittleLearnerCardSetup
  from "./LittleLearnerCardSetup";

import AbaProgressPage
  from "./AbaProgressPage";

import type {
  LittleQuestion,
} from "../config/littleLearners";

import {
  getRememberedLittleStudentCode,
} from "../config/littleLearners";


interface LittleLearnersExperienceProps {
  onBack:
    () => void;
}


type View =
  | "practice"
  | "words"
  | "progress"
  | "progress-setup"
  | "review";


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


  const [
    reviewQuestions,
    setReviewQuestions,
  ] =
    useState<
      LittleQuestion[]
    >(
      [],
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


  if (
    view ===
      "progress-setup"
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
            "progress",
          );
        }}
      />
    );
  }


  if (
    view ===
      "progress"
  ) {
    return (
      <AbaProgressPage
        studentCode={
          studentCode ||
          undefined
        }

        onBack={() => {
          setView(
            "practice",
          );
        }}

        onStartReview={(
          questions,
          resolvedStudentCode,
        ) => {
          setStudentCode(
            resolvedStudentCode,
          );

          setReviewQuestions(
            questions,
          );

          setView(
            "review",
          );
        }}
      />
    );
  }


  if (
    view ===
      "review"
  ) {
    return (
      <LittleLearnersPage
        title="ABA Review"

        level={
          2
        }

        studentCode={
          studentCode ||
          undefined
        }

        reviewQuestions={
          reviewQuestions
        }

        onBack={() => {
          setView(
            "progress",
          );
        }}

        onReviewComplete={() => {
          setReviewQuestions(
            [],
          );

          setView(
            "progress",
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

      onOpenProgress={() => {
        setView(
          studentCode
            ? "progress"
            : "progress-setup",
        );
      }}

      onOpenWords={() => {
        setView(
          "words",
        );
      }}
    />
  );
}