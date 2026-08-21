import {
  useEffect,
  useMemo,
  useState,
} from "react";

import {
  ADMIN_LOCATION_CHANGED_EVENT,
  getAdminLocationOverride,
} from "../location/adminLocation";

import {
  downloadCalendarPdf,
  type CalendarPdfSize,
} from "./calendarPdf";

import {
  getCalendarHeroConfig,
  type CalendarMarket,
} from "./calendarHero";

import "./GyanCalendarPage.css";

type PrintSize =
  CalendarPdfSize;

interface GyanCalendarPageProps {
  onClose: () => void;
}

interface CalendarMonthData {
  key: string;
  name: string;
  year: number;
  offset: number;
  days: number;
}

interface StudentInviteCodeResponse {
  code?: string;
  error?: string;
}

const MONTH_NAMES = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

const WEEK_DAYS = [
  "S",
  "M",
  "T",
  "W",
  "T",
  "F",
  "S",
];

const PRINT_SIZES: Array<{
  id: PrintSize;
  title: string;
  dimensions: string;
  note: string;
}> = [
  {
    id: "A5",
    title: "A5",
    dimensions: "148 × 210 mm",
    note: "Calendar + features",
  },
  {
    id: "A6",
    title: "A6",
    dimensions: "105 × 148 mm",
    note: "Saraswati + calendar",
  },
  {
    id: "A7",
    title: "A7",
    dimensions: "74 × 105 mm",
    note: "Services + calendar",
  },
  {
    id: "A8",
    title: "A8",
    dimensions: "52 × 74 mm",
    note: "QR + contact",
  },
  {
    id: "CREDIT_CARD",
    title: "Credit Card",
    dimensions: "85.6 × 54 mm",
    note: "Wallet calendar",
  },
  {
    id: "BUSINESS_CARD",
    title: "Business Card",
    dimensions: "3.5 × 2 in",
    note: "QR + GYAN info",
  },
];

function getCalendarMarket():
  CalendarMarket {
  const adminLocation =
    getAdminLocationOverride();

  const countryCode =
    adminLocation
      ?.countryCode
      ?.trim()
      .toUpperCase();

  const phoneCountryCode =
    adminLocation
      ?.phoneCountryCode
      ?.trim();

  if (
    countryCode === "IN" ||
    countryCode === "IND" ||
    countryCode === "INDIA" ||
    phoneCountryCode === "+91" ||
    phoneCountryCode === "91"
  ) {
    return "IN";
  }

  return "US";
}

function getQuarterStart(
  date: Date,
): Date {
  const quarterStartMonth =
    Math.floor(
      date.getMonth() / 3,
    ) * 3;

  return new Date(
    date.getFullYear(),
    quarterStartMonth,
    1,
  );
}

function createRollingCalendarMonths(
  now = new Date(),
): CalendarMonthData[] {
  const start =
    getQuarterStart(now);

  return Array.from(
    { length: 12 },
    (_, index) => {
      const firstDay =
        new Date(
          start.getFullYear(),
          start.getMonth() + index,
          1,
        );

      const year =
        firstDay.getFullYear();

      const monthIndex =
        firstDay.getMonth();

      return {
        key:
          `${year}-${monthIndex}`,
        name:
          MONTH_NAMES[
            monthIndex
          ],
        year,
        offset:
          firstDay.getDay(),
        days:
          new Date(
            year,
            monthIndex + 1,
            0,
          ).getDate(),
      };
    },
  );
}

function getCalendarRangeLabel(
  months:
    CalendarMonthData[],
): string {
  const first =
    months[0];

  const last =
    months[
      months.length - 1
    ];

  if (
    !first ||
    !last
  ) {
    return "";
  }

  return `${first.name.slice(
    0,
    3,
  )} ${first.year} – ${last.name.slice(
    0,
    3,
  )} ${last.year}`;
}

function toMonthKey(
  month:
    CalendarMonthData,
): string {
  const monthNumber =
    MONTH_NAMES.indexOf(
      month.name,
    ) + 1;

  return [
    month.year,
    String(
      monthNumber,
    ).padStart(
      2,
      "0",
    ),
  ].join("-");
}

async function createStudentInviteCode(
  market: CalendarMarket,
  size: PrintSize,
  months:
    CalendarMonthData[],
): Promise<string> {
  const first =
    months[0];

  const last =
    months[
      months.length - 1
    ];

  if (
    !first ||
    !last
  ) {
    throw new Error(
      "Calendar range is unavailable.",
    );
  }

  const response =
    await fetch(
      "/api/student-invite-codes",
      {
        method:
          "POST",

        headers: {
          "content-type":
            "application/json",
        },

        body:
          JSON.stringify({
            countryCode:
              market,

            printFormat:
              size,

            orientation:
              (
                size ===
                  "CREDIT_CARD" ||
                size ===
                  "BUSINESS_CARD"
              )
                ? "landscape"
                : "portrait",

            rangeStart:
              toMonthKey(
                first,
              ),

            rangeEnd:
              toMonthKey(
                last,
              ),
          }),
      },
    );

  let body:
    StudentInviteCodeResponse =
      {};

  try {
    body =
      (await response.json()) as
        StudentInviteCodeResponse;
  } catch {
    // Keep the generic error.
  }

  if (
    !response.ok ||
    !body.code
  ) {
    throw new Error(
      body.error ||
        "Unable to generate a GYAN student code.",
    );
  }

  return body.code;
}

function CalendarMonth({
  month,
}: {
  month:
    CalendarMonthData;
}) {
  const cells: Array<
    number | null
  > = [];

  for (
    let index = 0;
    index < month.offset;
    index += 1
  ) {
    cells.push(
      null,
    );
  }

  for (
    let day = 1;
    day <= month.days;
    day += 1
  ) {
    cells.push(
      day,
    );
  }

  while (
    cells.length % 7 !== 0
  ) {
    cells.push(
      null,
    );
  }

  return (
    <section className="gyan-calendar-month">
      <h3>
        {month.name}
        {" "}
        <small>
          {month.year}
        </small>
      </h3>

      <div className="gyan-calendar-month__week">
        {WEEK_DAYS.map(
          (
            day,
            index,
          ) => (
            <span
              key={`${day}-${index}`}
            >
              {day}
            </span>
          ),
        )}
      </div>

      <div className="gyan-calendar-month__days">
        {cells.map(
          (
            day,
            index,
          ) => (
            <span
              key={
                index
              }
              className={
                day === null
                  ? "is-empty"
                  : ""
              }
            >
              {day ?? ""}
            </span>
          ),
        )}
      </div>
    </section>
  );
}

function CalendarHero({
  market,
}: {
  market: CalendarMarket;
}) {
  const hero =
    getCalendarHeroConfig(
      market,
    );

  const [
    imageFailed,
    setImageFailed,
  ] =
    useState(false);

  useEffect(() => {
    setImageFailed(
      false,
    );
  }, [hero.imageSrc]);

  return (
    <section className="gyan-calendar-promo">
      <div className="gyan-calendar-promo__art">
        {!imageFailed
          ? (
            <img
              className="gyan-calendar-promo__image"
              src={
                hero.imageSrc
              }
              alt={
                hero.imageAlt
              }
              onError={() =>
                setImageFailed(
                  true,
                )
              }
            />
          )
          : (
            <div
              className="gyan-calendar-promo__lotus"
              aria-hidden="true"
            >
              {market === "IN"
                ? "🪷"
                : "📚"}
            </div>
          )}

        <strong>
          {hero.title}
        </strong>

        <span>
          {hero.subtitle}
        </span>
      </div>

      <div className="gyan-calendar-promo__message">
        <span className="gyan-calendar-promo__eyebrow">
          {hero.eyebrow}
        </span>

        <h2>
          Learn • Practice • Grow
        </h2>

        <p>
          {market === "IN"
            ? "Online learning, puzzles and useful digital services."
            : "Practice, puzzles and useful online services."}
        </p>

        <div className="gyan-calendar-promo__services">
          <span>
            📚 Learning
          </span>

          <span>
            🧩 Practice
          </span>

          <span>
            📄 Documents
          </span>

          <span>
            🖨️ Print & Scan
          </span>
        </div>

        <div className="gyan-calendar-promo__qr-placeholder">
          <div>
            QR
          </div>

          <p>
            GYAN से जुड़ें
            <strong>
              gyan.cc
            </strong>
          </p>
        </div>
      </div>
    </section>
  );
}

function PrintChooser({
  market,
  rangeLabel,
  months,
  onBack,
}: {
  market:
    CalendarMarket;
  rangeLabel:
    string;
  months:
    CalendarMonthData[];
  onBack:
    () => void;
}) {
  const [
    selectedSize,
    setSelectedSize,
  ] =
    useState<PrintSize | null>(
      "A5",
    );

  const [
    generating,
    setGenerating,
  ] =
    useState(false);

  const [
    error,
    setError,
  ] =
    useState("");

  const selected =
    PRINT_SIZES.find(
      (size) =>
        size.id ===
        selectedSize,
    ) ??
    null;

  async function generatePdf():
    Promise<void> {
    if (
      !selectedSize ||
      generating
    ) {
      return;
    }

    setGenerating(
      true,
    );

    setError(
      "",
    );

    try {
      const code =
        await createStudentInviteCode(
          market,
          selectedSize,
          months,
        );

      await downloadCalendarPdf({
        size:
          selectedSize,

        market,

        code,

        months,

        rangeLabel,
      });
    } catch (
      caught
    ) {
      setError(
        caught instanceof Error
          ? caught.message
          : "Unable to generate the PDF.",
      );
    } finally {
      setGenerating(
        false,
      );
    }
  }

  return (
    <section className="gyan-calendar-print">
      <div className="gyan-calendar-print__heading">
        <button
          type="button"
          onClick={
            onBack
          }
          aria-label="Back to calendar"
          title="Back to calendar"
        >
          ←
        </button>

        <div>
          <strong>
            Print Calendar
          </strong>

          <small>
            {market ===
              "IN"
              ? "India 🇮🇳"
              : "United States 🇺🇸"}
            {" · "}
            {rangeLabel}
          </small>
        </div>

        <button
          type="button"
          className="gyan-calendar-print__top-generate"
          onClick={
            generatePdf
          }
          disabled={
            !selectedSize ||
            generating
          }
          aria-label="Generate PDF"
          title="Generate PDF"
        >
          {generating
            ? "…"
            : "🖨️"}
        </button>
      </div>

      <p className="gyan-calendar-print__instruction">
        Select a size. Each
        generated PDF receives
        its own unique four-character
        GYAN code and QR.
      </p>

      <div className="gyan-calendar-print__sizes">
        {PRINT_SIZES.map(
          (
            size,
          ) => (
            <button
              key={
                size.id
              }
              type="button"
              className={[
                "gyan-calendar-print__size",
                selectedSize ===
                size.id
                  ? "is-selected"
                  : "",
              ].join(
                " ",
              )}
              onClick={() =>
                setSelectedSize(
                  size.id,
                )
              }
            >
              <strong>
                {size.title}
              </strong>

              <span>
                {
                  size.dimensions
                }
              </span>

              <small>
                {size.note}
              </small>
            </button>
          ),
        )}
      </div>

      {error && (
        <div
          className="gyan-calendar-print__error"
          role="alert"
        >
          {error}
        </div>
      )}

      {selected && (
        <div className="gyan-calendar-print__next">
          <strong>
            {
              selected.title
            }
          </strong>

          <span>
            {
              selected.note
            }
          </span>

          <button
            type="button"
            onClick={
              generatePdf
            }
            disabled={
              generating
            }
          >
            {generating
              ? "Generating…"
              : "Generate PDF"}
          </button>
        </div>
      )}
    </section>
  );
}

export default function GyanCalendarPage({
  onClose,
}: GyanCalendarPageProps) {
  const [
    market,
    setMarket,
  ] =
    useState<CalendarMarket>(
      () =>
        getCalendarMarket(),
    );

  const [
    printOpen,
    setPrintOpen,
  ] =
    useState(false);

  const months =
    useMemo(
      () =>
        createRollingCalendarMonths(),
      [],
    );

  const rangeLabel =
    useMemo(
      () =>
        getCalendarRangeLabel(
          months,
        ),
      [
        months,
      ],
    );

  useEffect(
    () => {
      const updateMarket =
        (): void => {
          setMarket(
            getCalendarMarket(),
          );
        };

      window.addEventListener(
        ADMIN_LOCATION_CHANGED_EVENT,
        updateMarket,
      );

      return () => {
        window.removeEventListener(
          ADMIN_LOCATION_CHANGED_EVENT,
          updateMarket,
        );
      };
    },
    [],
  );

  if (
    printOpen
  ) {
    return (
      <PrintChooser
        market={
          market
        }
        rangeLabel={
          rangeLabel
        }
        months={
          months
        }
        onBack={() =>
          setPrintOpen(
            false,
          )
        }
      />
    );
  }

  return (
    <section className="gyan-calendar-page">
      <div className="gyan-calendar-toolbar">
        <button
          type="button"
          className="gyan-calendar-toolbar__back"
          onClick={
            onClose
          }
          aria-label="Back to GYAN"
        >
          ←
        </button>

        <div className="gyan-calendar-toolbar__title">
          <strong>
            GYAN Calendar
          </strong>

          <span>
            {market ===
              "IN"
              ? "India 🇮🇳"
              : "United States 🇺🇸"}
          </span>
        </div>

        <button
          type="button"
          className="gyan-calendar-toolbar__print"
          onClick={() =>
            setPrintOpen(
              true,
            )
          }
        >
          🖨️ Print
        </button>
      </div>

      <article className="gyan-calendar-card">
        <header className="gyan-calendar-card__header">
          <span>
            GYAN
          </span>

          <strong>
            {rangeLabel}
          </strong>

          <small>
            Current quarter +
            next 3 quarters
          </small>
        </header>

        <CalendarHero
          market={
            market
          }
        />

        <section className="gyan-calendar-year">
          <div className="gyan-calendar-year__heading">
            <strong>
              {rangeLabel}
            </strong>

            <span>
              Keep • Learn • Share
            </span>
          </div>

          <div className="gyan-calendar-year__grid">
            {months.map(
              (
                month,
              ) => (
                <CalendarMonth
                  key={
                    month.key
                  }
                  month={
                    month
                  }
                />
              ),
            )}
          </div>
        </section>

        <footer className="gyan-calendar-card__footer">
          <strong>
            gyan.cc
          </strong>

          <span>
            Learn • Practice • Grow
          </span>
        </footer>
      </article>
    </section>
  );
}
