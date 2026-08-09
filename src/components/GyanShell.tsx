import {
  type ReactNode,
} from "react";

import GyanHeader
  from "./GyanHeader";

import "./GyanShell.css";


interface GyanShellProps {
  headerLeft?: ReactNode;
  headerCenter?: ReactNode;
  headerRight?: ReactNode;

  children:
    ReactNode;

  bodyClassName?: string;
}


export default function GyanShell({
  headerLeft,
  headerCenter,
  headerRight,
  children,
  bodyClassName = "",
}: GyanShellProps) {
  return (
    <div
      className="gyan-shell"
    >
      <GyanHeader
        left={
          headerLeft
        }
        center={
          headerCenter
        }
        right={
          headerRight
        }
      />

      <main
        className={[
          "gyan-shell__body",
          bodyClassName,
        ]
          .filter(Boolean)
          .join(" ")}
      >
        {children}
      </main>
    </div>
  );
}
