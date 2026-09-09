import {
  useMemo,
  useState,
} from "react";

import {
  IIT_JEE_EIGHT_WEEK_SCHEDULE,
} from "./iitJeeSchedule";

import {
  NEET_EIGHT_WEEK_SCHEDULE,
} from "./neetSchedule";

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
  value:
    string,
): string {
  const [
    year,
    month,
    day,
  ] =
    value
      .split("-")
      .map(
        Number,
      );

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


function orderedRows<
  T extends {
    date:
      string;
  },
>(
  rows:
    readonly T[],

  today:
    string,
): T[] {
  const future =
    rows.filter(
      (
        row,
      ) =>
        row.date >=
        today,
    );

  const previous =
    rows
      .filter(
        (
          row,
        ) =>
          row.date <
          today,
      )
      .slice()
      .reverse();

  return [
    ...future,
    ...previous,
  ];
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

  const [
    registrationTopic,
    setRegistrationTopic,
  ] =
    useState<
      string | null
    >(
      null,
    );


  const today =
    todayKey();

  const jeeRows =
    useMemo(
      () =>
        orderedRows(
          IIT_JEE_EIGHT_WEEK_SCHEDULE,
          today,
        ),

      [
        today,
      ],
    );

  const neetRows =
    useMemo(
      () =>
        orderedRows(
          NEET_EIGHT_WEEK_SCHEDULE,
          today,
        ),

      [
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
      `/class?category=${
        next ===
          "IIT-JEE"
          ? "iit-jee"
          : "neet"
      }`,
    );
  }


  function showRegistration(
    topic:
      string,
  ): void {
    setRegistrationTopic(
      topic,
    );
  }


  function closeRegistration():
    void {
    setRegistrationTopic(
      null,
    );
  }


  function showLiveTest(
    testCode:
      string,
  ): void {
    window.alert(
      `${testCode} Live Test · open from GYAN Education`,
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

      <div className="gyan-class__note">
        Current batch full · Next batch starts Nov 1
      </div>

      {
        category ===
          "IIT-JEE"
          ? (
            <>
              <div className="gyan-class__note">
                8-week IIT-JEE cycle · Monday–Friday · classes 3:30–5:00 PM IST · Live Test 9:15 PM
              </div>

              <div className="gyan-class__table-shell">
                <table className="gyan-class__table">
                  <thead>
                    <tr>
                      <th>
                        Date
                      </th>

                      <th>
                        Maths
                        <small>
                          3:30–4:00
                        </small>
                      </th>

                      <th>
                        Physics
                        <small>
                          4:00–4:30
                        </small>
                      </th>

                      <th>
                        Chemistry
                        <small>
                          4:30–5:00
                        </small>
                      </th>

                      <th>
                        Test
                        <small>
                          9:15 PM
                        </small>
                      </th>
                    </tr>
                  </thead>

                  <tbody>
                    {
                      jeeRows.map(
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
                                onClick={() =>
                                  showRegistration(
                                    "IIT-JEE classes",
                                  )
                                }
                              >
                                <strong>
                                  {
                                    prettyDate(
                                      row.date,
                                    )
                                  }
                                </strong>

                                <span>
                                  3:30 PM IST
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
                                onClick={() =>
                                  showRegistration(
                                    row.math,
                                  )
                                }
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
                                onClick={() =>
                                  showRegistration(
                                    row.physics,
                                  )
                                }
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
                                onClick={() =>
                                  showRegistration(
                                    row.chemistry,
                                  )
                                }
                              >
                                {
                                  row.chemistry
                                }
                              </button>
                            </td>

                            <td>
                              <button
                                type="button"
                                className="gyan-class__cell-button"
                                onClick={() =>
                                  showLiveTest(
                                    row.test,
                                  )
                                }
                              >
                                <strong>
                                  {
                                    row.test
                                  }
                                </strong>
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
            <>
              <div className="gyan-class__note">
                8-week NEET cycle · Monday–Friday · classes 3:30–5:30 PM IST · Live Test 8:30 PM
              </div>

              <div className="gyan-class__table-shell">
                <table className="gyan-class__table">
                  <thead>
                    <tr>
                      <th>
                        Date
                      </th>

                      <th>
                        Physics
                        <small>
                          3:30–4:00
                        </small>
                      </th>

                      <th>
                        Chemistry
                        <small>
                          4:00–4:30
                        </small>
                      </th>

                      <th>
                        Biology
                        <small>
                          4:30–5:30
                        </small>
                      </th>

                      <th>
                        Test
                        <small>
                          8:30 PM
                        </small>
                      </th>
                    </tr>
                  </thead>

                  <tbody>
                    {
                      neetRows.map(
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
                                onClick={() =>
                                  showRegistration(
                                    "NEET classes",
                                  )
                                }
                              >
                                <strong>
                                  {
                                    prettyDate(
                                      row.date,
                                    )
                                  }
                                </strong>

                                <span>
                                  3:30 PM IST
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
                                onClick={() =>
                                  showRegistration(
                                    row.physics,
                                  )
                                }
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
                                onClick={() =>
                                  showRegistration(
                                    row.chemistry,
                                  )
                                }
                              >
                                {
                                  row.chemistry
                                }
                              </button>
                            </td>

                            <td>
                              <button
                                type="button"
                                className="gyan-class__cell-button"
                                onClick={() =>
                                  showRegistration(
                                    row.biology,
                                  )
                                }
                              >
                                {
                                  row.biology
                                }
                              </button>
                            </td>

                            <td>
                              <button
                                type="button"
                                className="gyan-class__cell-button"
                                onClick={() =>
                                  showLiveTest(
                                    row.test,
                                  )
                                }
                              >
                                <strong>
                                  {
                                    row.test
                                  }
                                </strong>
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
      }

      {
        registrationTopic && (
          <div
            className="gyan-class__dialog-backdrop"
            role="presentation"
            onMouseDown={
              closeRegistration
            }
          >
            <section
              className="gyan-class__dialog"
              role="dialog"
              aria-modal="true"
              aria-labelledby="gyan-class-registration-title"
              onMouseDown={(
                event,
              ) => {
                event.stopPropagation();
              }}
            >
              <button
                type="button"
                className="gyan-class__dialog-close"
                onClick={
                  closeRegistration
                }
                aria-label="Close"
                title="Close"
              >
                ×
              </button>

              <div
                className="gyan-class__dialog-icon"
                aria-hidden="true"
              >
                🎓
              </div>

              <small className="gyan-class__dialog-eyebrow">
                GYAN Classes
              </small>

              <h2 id="gyan-class-registration-title">
                Registration
              </h2>

              <p>
                To register for{" "}
                <strong>
                  “{
                    registrationTopic
                  }”
                </strong>
                , contact{" "}
                <a href="mailto:admin@gyan.cc">
                  admin@gyan.cc
                </a>
                .
              </p>

              <div className="gyan-class__dialog-next">
                <span
                  aria-hidden="true"
                >
                  📅
                </span>

                <div>
                  <strong>
                    Next batch: Nov–Dec
                  </strong>

                  <small>
                    Starting Nov 01
                  </small>
                </div>
              </div>

              <p className="gyan-class__dialog-note">
                The current batch is full. Please contact{" "}
                <a href="mailto:admin@gyan.cc">
                  admin@gyan.cc
                </a>{" "}
                for the next batch.
              </p>

              <div className="gyan-class__dialog-actions">
                <a
                  href={`mailto:admin@gyan.cc?subject=${encodeURIComponent(
                    `GYAN Classes registration: ${registrationTopic}`,
                  )}`}
                >
                  ✉ Contact admin
                </a>

                <button
                  type="button"
                  onClick={
                    closeRegistration
                  }
                >
                  Close
                </button>
              </div>
            </section>
          </div>
        )
      }
    </main>
  );
}
