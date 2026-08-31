import {
  useMemo,
  useState,
} from "react";

import {
  IIT_JEE_EIGHT_WEEK_SCHEDULE,
} from "./iitJeeSchedule";

import "./ClassPage.css";

type Category =
  | "IIT-JEE"
  | "NEET";

function categoryFromUrl():
  Category {
  const value =
    new URLSearchParams(
      window.location.search,
    )
      .get("category")
      ?.trim()
      .toLowerCase();

  return value ===
    "neet"
    ? "NEET"
    : "IIT-JEE";
}

function todayKey():
  string {
  const now =
    new Date();

  const year =
    now.getFullYear();

  const month =
    String(
      now.getMonth() +
        1,
    ).padStart(
      2,
      "0",
    );

  const day =
    String(
      now.getDate(),
    ).padStart(
      2,
      "0",
    );

  return `${year}-${month}-${day}`;
}

function prettyDate(
  value: string,
): string {
  const [
    year,
    month,
    day,
  ] =
    value
      .split("-")
      .map(Number);

  return new Intl.DateTimeFormat(
    undefined,
    {
      weekday:
        "short",

      month:
        "short",

      day:
        "numeric",
    },
  ).format(
    new Date(
      year,
      month - 1,
      day,
    ),
  );
}

export default function ClassPage() {
  const [
    category,
    setCategory,
  ] =
    useState<
      Category
    >(
      categoryFromUrl,
    );

  const today =
    todayKey();

  const rows =
    useMemo(
      () => {
        if (
          category ===
            "NEET"
        ) {
          return [];
        }

        /*
         * Upcoming first, today at the top if present,
         * then previous classes underneath.
         *
         * The table itself is independently scrollable in
         * both directions.
         */
        const future =
          IIT_JEE_EIGHT_WEEK_SCHEDULE.filter(
            (
              row,
            ) =>
              row.date >=
              today,
          );

        const previous =
          IIT_JEE_EIGHT_WEEK_SCHEDULE
            .filter(
              (
                row,
              ) =>
                row.date <
                today,
            )
            .reverse();

        return [
          ...future,
          ...previous,
        ];
      },
      [
        category,
        today,
      ],
    );

  function selectCategory(
    next:
      Category,
  ): void {
    setCategory(
      next,
    );

    window.history.pushState(
      {},
      "",
      `/class?category=${next === "IIT-JEE" ? "iit-jee" : "neet"}`,
    );
  }

  return (
    <main className="gyan-class">
      <header className="gyan-class__header">
        <button
          type="button"
          aria-label="Back"
          onClick={() => {
            window.location.href =
              "/education";
          }}
        >
          ←
        </button>

        <div>
          <strong>
            👨‍🏫 GYAN Classes
          </strong>

          <small>
            Master Class Calendar
          </small>
        </div>
      </header>

      <div className="gyan-class__filters">
        <button
          type="button"
          className={
            category ===
              "IIT-JEE"
              ? "is-active"
              : ""
          }
          onClick={() =>
            selectCategory(
              "IIT-JEE",
            )
          }
        >
          IIT-JEE
        </button>

        <button
          type="button"
          className={
            category ===
              "NEET"
              ? "is-active"
              : ""
          }
          onClick={() =>
            selectCategory(
              "NEET",
            )
          }
        >
          NEET
        </button>
      </div>

      {
        category ===
          "IIT-JEE"
          ? (
            <>
              <div className="gyan-class__note">
                8-week IIT-JEE cycle · Monday–Friday · 8:30–10:30 PM IST
              </div>

              <div className="gyan-class__table-shell">
                <table className="gyan-class__table">
                  <thead>
                    <tr>
                      <th>
                        Date
                        <small>
                          8:30–9:00 Demo
                        </small>
                      </th>

                      <th>
                        Maths
                        <small>
                          9:00–9:30
                        </small>
                      </th>

                      <th>
                        Physics
                        <small>
                          9:30–10:00
                        </small>
                      </th>

                      <th>
                        Chemistry
                        <small>
                          10:00–10:30
                        </small>
                      </th>
                    </tr>
                  </thead>

                  <tbody>
                    {
                      rows.map(
                        (
                          row,
                        ) => (
                          <tr
                            key={
                              row.date
                            }
                            className={
                              row.date ===
                                today
                                ? "is-today"
                                : ""
                            }
                          >
                            <td className="gyan-class__date">
                              <button
                                type="button"
                                className="gyan-class__cell-button gyan-class__cell-button--date"
                                onClick={() => {
                                  window.alert(
                                    "To join the demo class, contact admin@gyan.cc",
                                  );
                                }}
                              >
                                <strong>
                                  {
                                    prettyDate(
                                      row.date,
                                    )
                                  }
                                </strong>

                                <span>
                                  8:30–9:00 PM IST · Demo
                                </span>

                                {
                                  row.date ===
                                    today && (
                                    <small>
                                      TODAY
                                    </small>
                                  )
                                }
                              </button>
                            </td>

                            <td>
                              <button
                                type="button"
                                className="gyan-class__cell-button"
                                onClick={() => {
                                  window.alert(
                                    `To register for "${row.math}", contact admin@gyan.cc`,
                                  );
                                }}
                              >
                                {
                                  row.math
                                }
                              </button>
                            </td>

                            <td>
                              <button
                                type="button"
                                className="gyan-class__cell-button"
                                onClick={() => {
                                  window.alert(
                                    `To register for "${row.physics}", contact admin@gyan.cc`,
                                  );
                                }}
                              >
                                {
                                  row.physics
                                }
                              </button>
                            </td>

                            <td>
                              <button
                                type="button"
                                className="gyan-class__cell-button"
                                onClick={() => {
                                  window.alert(
                                    `To register for "${row.chemistry}", contact admin@gyan.cc`,
                                  );
                                }}
                              >
                                {
                                  row.chemistry
                                }
                              </button>
                            </td>
                          </tr>
                        ),
                      )
                    }
                  </tbody>
                </table>
              </div>
            </>
          )
          : (
            <div className="gyan-class__state">
              NEET schedule coming next.
            </div>
          )
      }
    </main>
  );
}
