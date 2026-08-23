import {
  useEffect,
  useMemo,
  useRef,
  useState,
} from "react";


import {
  QRCodeSVG,
} from "qrcode.react";
import {
  ADMIN_LOCATION_CHANGED_EVENT,
  getAdminLocationOverride,
} from "../location/adminLocation";

import "./GyanCalendarPage.css";

type CalendarMarket =
  | "IN"
  | "US";

type PrintSize =
  | "A5"
  | "A6"
  | "A7"
  | "A8"
  | "CREDIT_CARD"
  | "BUSINESS_CARD";

interface GyanCalendarPageProps {
  onClose: () => void;

  /*
   * Pass true only for an authenticated GYAN admin.
   * Ordinary users get the normal online-access code flow.
   * Admins may choose a 1-year scratch-code print.
   */
  isAdmin?:
    boolean;

  /*
   * /register uses the same print/preview workflow as Calendar,
   * but opens directly in the chooser and defaults to A7.
   */
  registrationMode?:
    boolean;
}

interface CalendarMonthData {
  key: string;
  name: string;
  year: number;
  offset: number;
  days: number;
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
  pdfWidthMm: number;
  pdfHeightMm: number;
}> = [
  {
    id: "A5",
    title: "A5",
    dimensions: "148 × 210 mm",
    note: "Calendar + features",
    pdfWidthMm: 210,
    pdfHeightMm: 148,
  },
  {
    id: "A6",
    title: "A6",
    dimensions: "105 × 148 mm",
    note: "Saraswati + calendar",
    pdfWidthMm: 148,
    pdfHeightMm: 105,
  },
  {
    id: "A7",
    title: "A7",
    dimensions: "74 × 105 mm",
    note: "Services + calendar",
    pdfWidthMm: 105,
    pdfHeightMm: 74,
  },
  {
    id: "A8",
    title: "A8",
    dimensions: "52 × 74 mm",
    note: "QR + contact",
    pdfWidthMm: 74,
    pdfHeightMm: 52,
  },
  {
    id: "CREDIT_CARD",
    title: "Credit Card",
    dimensions: "85.6 × 54 mm",
    note: "Wallet calendar",
    pdfWidthMm: 85.6,
    pdfHeightMm: 54,
  },
  {
    id: "BUSINESS_CARD",
    title: "Business Card",
    dimensions: "3.5 × 2 in",
    note: "QR + GYAN info",
    pdfWidthMm: 88.9,
    pdfHeightMm: 50.8,
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

  if (countryCode === "IN") {
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
          MONTH_NAMES[monthIndex],
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
  months: CalendarMonthData[],
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

function CalendarMonth({
  month,
}: {
  month: CalendarMonthData;
}) {
  const cells: Array<
    number | null
  > = [];

  for (
    let index = 0;
    index < month.offset;
    index += 1
  ) {
    cells.push(null);
  }

  for (
    let day = 1;
    day <= month.days;
    day += 1
  ) {
    cells.push(day);
  }

  /*
   * Always render six complete weeks.
   * This keeps all twelve month cards the same height and prevents
   * 29/30/31 from being clipped when a smaller month uses only 5 rows.
   */
  while (
    cells.length < 42
  ) {
    cells.push(null);
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
          (day, index) => (
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
          (day, index) => (
            <span
              key={index}
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

function UsHero({
  gyanName =
    "MangoSwan99",
  accessCode =
    "8F3K-7Q9M-P2HJ",
  publicUrl =
    "https://gyan.cc/preview",
  scratch =
    false,
}: {
  gyanName?:
    string;

  accessCode?:
    string;

  publicUrl?:
    string;

  scratch?:
    boolean;
}) {
  return (
    <section className="gyan-calendar-promo gyan-calendar-promo--us">
      <div className="gyan-calendar-promo__art gyan-calendar-promo__art--photo">
        <img
          className="gyan-calendar-promo__us-image"
          src="/calendar/us-education.webp"
          alt="GYAN Education"
        />
      </div>

      <div className="gyan-calendar-promo__message">
        <span className="gyan-calendar-promo__eyebrow">
          YOUR GYAN
        </span>

        <div className="gyan-calendar-invite">
          <div className="gyan-calendar-invite__identity-row">
            <label>
              Name:
              <span aria-hidden="true" />
            </label>

            <div>
              <small>
                Your unique GYAN Name
              </small>

              <strong>
                {
                  gyanName
                }
              </strong>
            </div>
          </div>

          <div className="gyan-calendar-invite__access-row">
            <span>
              GYAN ACCESS CODE
            </span>

            <strong
              className={
                scratch
                  ? "gyan-calendar-invite__code--scratch"
                  : ""
              }
            >
              {
                accessCode
              }
            </strong>
          </div>

          <div className="gyan-calendar-invite__access-note">
            <strong>
              Complimentary access
            </strong>

            <span>
              {
                scratch
                  ? "1 year with calendar access code"
                  : "3 months from online registration"
              }
            </span>

            <span>
              No credit card required
            </span>
          </div>
        </div>

        <div className="gyan-calendar-register">
          <div className="gyan-calendar-register__qr">
            <QRCodeSVG
              value={
                publicUrl
              }
              size={
                96
              }
              level="M"
              includeMargin
              aria-label="Scan GYAN calendar QR"
            />
          </div>

          <div>
            <span>
              Your GYAN link
            </span>

            <strong>
              {
                publicUrl
                  .replace(
                    /^https?:\/\//,
                    "",
                  )
              }
            </strong>

            <small>
              Open with QR or short link
            </small>
          </div>
        </div>

        <div className="gyan-calendar-benefits">
          <span>
            🎓 <b>Learn</b>
          </span>

          <span>
            👥 <b>Connect</b>
          </span>

          <span>
            🧭 <b>Discover</b>
          </span>

          <span>
            🤝 <b>Share</b>
          </span>
        </div>
      </div>
    </section>
  );
}

type CalendarAccessMode =
  | "ONLINE_90"
  | "ADMIN_365";


const GYAN_NAME_FIRST = [
  "Mango",
  "Lotus",
  "Sunny",
  "Blue",
  "Golden",
  "River",
  "Bright",
  "Happy",
  "Maple",
  "Silver",
] as const;

const GYAN_NAME_SECOND = [
  "Swan",
  "Tiger",
  "Panda",
  "Falcon",
  "Dolphin",
  "Peacock",
  "Parrot",
  "Star",
  "River",
  "Lotus",
] as const;


function createFriendlyGyanName():
  string {
  const first =
    GYAN_NAME_FIRST[
      Math.floor(
        Math.random() *
        GYAN_NAME_FIRST.length,
      )
    ];

  const second =
    GYAN_NAME_SECOND[
      Math.floor(
        Math.random() *
        GYAN_NAME_SECOND.length,
      )
    ];

  const number =
    Math.floor(
      10 +
      Math.random() *
      990,
    );

  return `${first}${second}${number}`;
}


type AdminBatchEntry = {
  id?:
    number;

  slug?:
    string;

  publicUrl?:
    string;

  gyanName:
    string;

  accessCode:
    string;

  durationMonths?:
    1 | 3 | 12;

  status?:
    "GENERATED" |
    "PRINTED" |
    "CLAIMED" |
    "EXPIRED";

  email?:
    string | null;
};


type CalendarAccessRecord = {
  id:
    number;

  slug:
    string;

  publicUrl:
    string;

  gyanName:
    string;

  accessCode:
    string;

  durationMonths:
    1 | 3 | 12;

  status:
    "GENERATED" |
    "PRINTED" |
    "CLAIMED" |
    "EXPIRED";

  email:
    string | null;
};


async function issueCalendarAccessRecords({
  count,
  durationMonths,
}: {
  count:
    number;

  durationMonths:
    1 | 3 | 12;
}):
  Promise<
    CalendarAccessRecord[]
  > {
  const response =
    await fetch(
      "/api/calendar-access",
      {
        method:
          "POST",

        headers: {
          "Content-Type":
            "application/json",
        },

        body:
          JSON.stringify({
            count,
            durationMonths,
          }),
      },
    );

  if (
    !response.ok
  ) {
    throw new Error(
      `Could not issue calendar access (${response.status}).`,
    );
  }

  const body =
    await response.json() as {
      records:
        CalendarAccessRecord[];
    };

  return body.records;
}


async function markCalendarAccessPrinted(
  ids:
    number[],
):
  Promise<void> {
  if (
    ids.length ===
      0
  ) {
    return;
  }

  const response =
    await fetch(
      "/api/calendar-access/printed",
      {
        method:
          "POST",

        headers: {
          "Content-Type":
            "application/json",
        },

        body:
          JSON.stringify({
            ids,
          }),
      },
    );

  if (
    !response.ok
  ) {
    throw new Error(
      `Could not mark calendar access as printed (${response.status}).`,
    );
  }
}


function createAdminBatch():
  AdminBatchEntry[] {
  const used =
    new Set<string>();

  const result:
    AdminBatchEntry[] =
      [];

  while (
    result.length < 8
  ) {
    const gyanName =
      createFriendlyGyanName();

    if (
      used.has(
        gyanName,
      )
    ) {
      continue;
    }

    used.add(
      gyanName,
    );

    result.push({
      gyanName,
      accessCode:
        createCalendarAccessCode(),
    });
  }

  return result;
}


type AdminSheetLayout = {
  orientation:
    "portrait" |
    "landscape";

  pageWidthMm:
    number;

  pageHeightMm:
    number;

  columns:
    number;

  rows:
    number;

  perSheet:
    number;
};


function getAdminSheetLayout(
  size:
    PrintSize,
): AdminSheetLayout {
  switch (
    size
  ) {
    /*
     * Exact A-series imposition on A4:
     * A5: 2 on A4 landscape
     * A6: 4 on A4 portrait
     * A7: 8 on A4 landscape
     */
    case "A5":
      return {
        orientation:
          "landscape",
        pageWidthMm:
          297,
        pageHeightMm:
          210,
        columns:
          2,
        rows:
          1,
        perSheet:
          2,
      };

    case "A6":
      return {
        orientation:
          "portrait",
        pageWidthMm:
          210,
        pageHeightMm:
          297,
        columns:
          2,
        rows:
          2,
        perSheet:
          4,
      };

    case "A7":
      return {
        orientation:
          "landscape",
        pageWidthMm:
          297,
        pageHeightMm:
          210,
        columns:
          4,
        rows:
          2,
        perSheet:
          8,
      };

    /*
     * For the smaller formats we still generate eight unique cards
     * per batch, centered on A4.
     */
    case "A8":
      return {
        orientation:
          "portrait",
        pageWidthMm:
          210,
        pageHeightMm:
          297,
        columns:
          2,
        rows:
          4,
        perSheet:
          8,
      };

    case "CREDIT_CARD":
    case "BUSINESS_CARD":
      return {
        orientation:
          "portrait",
        pageWidthMm:
          210,
        pageHeightMm:
          297,
        columns:
          2,
        rows:
          4,
        perSheet:
          8,
      };
  }
}


function createCalendarAccessCode():
  string {
  const alphabet =
    "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";

  const bytes =
    new Uint8Array(
      8,
    );

  crypto.getRandomValues(
    bytes,
  );

  const value =
    Array.from(
      bytes,
      (
        byte,
      ) =>
        alphabet[
          byte %
          alphabet.length
        ],
    )
      .join("");

  return `${value.slice(
    0,
    4,
  )}-${value.slice(
    4,
    8,
  )}`;
}


function CalendarCard({
  market,
  rangeLabel,
  months,
  accessCode,
  accessMode,
  gyanName =
    "MangoSwan99",
  publicUrl =
    "https://gyan.cc/register",
  printSize,
  className =
    "",
}: {
  market:
    CalendarMarket;

  rangeLabel:
    string;

  months:
    CalendarMonthData[];

  accessCode?:
    string;

  accessMode?:
    CalendarAccessMode;

  gyanName?:
    string;

  publicUrl?:
    string;

  printSize?:
    PrintSize;

  className?:
    string;
}) {
  const scratch =
    accessMode ===
      "ADMIN_365";

  const isPdf =
    Boolean(
      printSize,
    );

  const showImage =
    !isPdf ||
    printSize ===
      "A5" ||
    printSize ===
      "A6";

  const showCalendar =
    !isPdf ||
    printSize ===
      "A5" ||
    printSize ===
      "CREDIT_CARD";

  const compactAccessOnly =
    isPdf &&
    (
      printSize ===
        "A7" ||
      printSize ===
        "A8" ||
      printSize ===
        "BUSINESS_CARD"
    );

  return (
    <article
      className={[
        "gyan-calendar-card",

        printSize
          ? `gyan-calendar-card--${printSize.toLowerCase()}`
          : "",

        className,
      ]
        .filter(
          Boolean,
        )
        .join(
          " ",
        )}
    >
      <header className="gyan-calendar-card__header">
        <div className="gyan-calendar-card__brand">
          <span>
            GYAN
          </span>

          <small>
            Learn • Discover • Grow
          </small>
        </div>

        <div className="gyan-calendar-card__range">
          <strong>
            {
              rangeLabel
            }
          </strong>

          <small>
            Current quarter +
            next 3 quarters
          </small>
        </div>
      </header>

      {
        market ===
          "IN"
          ? (
            <section
              className={[
                "gyan-calendar-promo",
                "gyan-calendar-promo--india",

                !showImage
                  ? "gyan-calendar-promo--no-image"
                  : "",

                compactAccessOnly
                  ? "gyan-calendar-promo--access-only"
                  : "",
              ]
                .filter(
                  Boolean,
                )
                .join(
                  " ",
                )}
            >
              {
                showImage && (
                  <div className="gyan-calendar-promo__art gyan-calendar-promo__art--photo">
                    <img
                      className="gyan-calendar-promo__saraswati"
                      src="/calendar/maa-saraswati.webp"
                      alt="Ma Saraswati"
                    />
                  </div>
                )
              }

              <div className="gyan-calendar-promo__message">
                <span className="gyan-calendar-promo__eyebrow">
                  YOUR GYAN
                </span>

                <div className="gyan-calendar-invite">
                  <div className="gyan-calendar-invite__identity-row">
                    <label>
                      Name:
                      <span aria-hidden="true" />
                    </label>

                    <div>
                      <small>
                        Your unique GYAN Name
                      </small>

                      <strong>
                        {
                        gyanName
                      }
                      </strong>
                    </div>
                  </div>

                  <div className="gyan-calendar-invite__access-row">
                    <span>
                      GYAN ACCESS CODE
                    </span>

                    <strong
                      className={
                        scratch
                          ? "gyan-calendar-invite__code--scratch"
                          : ""
                      }
                    >
                      {
                        accessCode ??
                        "8F3K-7Q9M-P2HJ"
                      }
                    </strong>
                  </div>

                  <div className="gyan-calendar-invite__access-note">
                    <strong>
                      Complimentary access
                    </strong>

                    <span>
                      {
                        scratch
                          ? "1 year with calendar access code"
                          : "3 months from online registration"
                      }
                    </span>

                    <span>
                      No credit card required
                    </span>
                  </div>
                </div>

                <div className="gyan-calendar-register">
                  <div className="gyan-calendar-register__qr">
                    <QRCodeSVG
                      value={
                        publicUrl
                      }
                      size={
                        96
                      }
                      level="M"
                      includeMargin
                      aria-label="Scan GYAN calendar QR"
                    />
                  </div>

                  <div>
                    <span>
                      New to GYAN?
                    </span>

                    <strong>
                      {
                        publicUrl
                          .replace(
                            /^https?:\/\//,
                            "",
                          )
                      }
                    </strong>

                    <small>
                      3 months complimentary online
                    </small>
                  </div>
                </div>

                {
                  !compactAccessOnly && (
                    <div className="gyan-calendar-benefits">
                      <span>
                        🎓 <b>Learn</b>
                      </span>

                      <span>
                        👥 <b>Connect</b>
                      </span>

                      <span>
                        🧭 <b>Discover</b>
                      </span>

                      <span>
                        🤝 <b>Share</b>
                      </span>
                    </div>
                  )
                }
              </div>
            </section>
          )
          : (
              <UsHero
                gyanName={
                  gyanName
                }
                accessCode={
                  accessCode
                }
                publicUrl={
                  publicUrl
                }
                scratch={
                  scratch
                }
              />
            )
      }

      {
        showCalendar && (
          <section className="gyan-calendar-year">
        <div className="gyan-calendar-year__heading">
          <strong>
            {
              rangeLabel
            }
          </strong>

          <span>
            Keep • Learn • Share
          </span>
        </div>

        <div className="gyan-calendar-year__grid">
          {
            months.map(
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
            )
          }
        </div>
          </section>
        )
      }

      <footer className="gyan-calendar-card__footer">
        <strong>
          gyan.cc
        </strong>

        <span>
          Learn • Discover • Grow
        </span>
      </footer>
    </article>
  );
}


function PrintChooser({
  market,
  rangeLabel,
  months,
  isAdmin,
  defaultSize =
    null,
  onBack,
}: {
  market:
    CalendarMarket;

  rangeLabel:
    string;

  months:
    CalendarMonthData[];

  isAdmin:
    boolean;

  defaultSize?:
    PrintSize |
    null;

  onBack:
    () => void;
}) {
  const [
    selectedSize,
    setSelectedSize,
  ] =
    useState<
      PrintSize |
      null
    >(
      defaultSize,
    );

  const [
    accessMode,
    setAccessMode,
  ] =
    useState<CalendarAccessMode>(
      "ONLINE_90",
    );

  const [
    accessCode,
    setAccessCode,
  ] =
    useState(
      () =>
        createCalendarAccessCode(),
    );

  const [
    issuedRecord,
    setIssuedRecord,
  ] =
    useState<
      CalendarAccessRecord |
      null
    >(
      null,
    );

  const [
    issuingRecord,
    setIssuingRecord,
  ] =
    useState(
      false,
    );

  const [
    adminBatch,
    setAdminBatch,
  ] =
    useState<
      AdminBatchEntry[]
    >(
      () =>
        createAdminBatch(),
    );

  const [
    pdfGenerating,
    setPdfGenerating,
  ] =
    useState(
      false,
    );

  const [
    pdfError,
    setPdfError,
  ] =
    useState("");

  const pdfSheetRef =
    useRef<
      HTMLDivElement |
      null
    >(
      null,
    );

  const adminBatchRef =
    useRef<
      HTMLDivElement |
      null
    >(
      null,
    );

  const selected =
    PRINT_SIZES.find(
      (
        size,
      ) =>
        size.id ===
        selectedSize,
    ) ??
    null;

  const validityLabel =
    accessMode ===
      "ADMIN_365"
      ? "1 year"
      : "3 months";

  async function ensurePreviewRecord():
    Promise<
      CalendarAccessRecord |
      null
    > {
    if (
      issuedRecord
    ) {
      return issuedRecord;
    }

    if (
      issuingRecord
    ) {
      return null;
    }

    /*
     * Admin batch mode intentionally waits until "Generate 8".
     * Ordinary print preview gets one permanent database-backed QR
     * as soon as a print size is selected.
     */
    if (
      isAdmin &&
      accessMode ===
        "ADMIN_365"
    ) {
      return null;
    }

    setIssuingRecord(
      true,
    );

    setPdfError("");

    try {
      const [
        record,
      ] =
        await issueCalendarAccessRecords({
          count:
            1,

          durationMonths:
            3,
        });

      setIssuedRecord(
        record,
      );

      setAccessCode(
        record.accessCode,
      );

      return record;
    } catch (
      caught
    ) {
      console.error(
        "GYAN QR preview allocation failed",
        caught,
      );

      setPdfError(
        caught instanceof
          Error
          ? caught.message
          : "Could not create the GYAN QR.",
      );

      return null;
    } finally {
      setIssuingRecord(
        false,
      );
    }
  }


  function refreshCode():
    void {
    setIssuedRecord(
      null,
    );

    if (
      accessMode ===
        "ADMIN_365"
    ) {
      setAdminBatch(
        createAdminBatch(),
      );

      return;
    }

    setAccessCode(
      createCalendarAccessCode(),
    );
  }

  useEffect(
    () => {
      if (
        !selected
      ) {
        return;
      }

      if (
        isAdmin &&
        accessMode ===
          "ADMIN_365"
      ) {
        return;
      }

      if (
        issuedRecord ||
        issuingRecord
      ) {
        return;
      }

      void ensurePreviewRecord();
    },
    [
      selected,
      accessMode,
      isAdmin,
      issuedRecord,
      issuingRecord,
    ],
  );


  async function generatePdf():
    Promise<void> {
    if (
      !selected ||
      pdfGenerating
    ) {
      return;
    }

    const isAdminBatch =
      isAdmin &&
      accessMode ===
        "ADMIN_365";

    if (
      isAdminBatch
        ? !adminBatchRef.current
        : !pdfSheetRef.current
    ) {
      return;
    }

    setPdfGenerating(
      true,
    );

    setPdfError("");

    let activeSingleRecord =
      issuedRecord;

    let activeAdminBatch =
      adminBatch;

    try {
      if (
        isAdminBatch
      ) {
        const records =
          await issueCalendarAccessRecords({
            count:
              8,

            durationMonths:
              12,
          });

        activeAdminBatch =
          records.map(
            (
              record,
            ) => ({
              ...record,
            }),
          );

        setAdminBatch(
          activeAdminBatch,
        );
      } else {
        const record =
          issuedRecord ??
          await ensurePreviewRecord();

        if (
          !record
        ) {
          throw new Error(
            "The GYAN QR could not be created. Please try again.",
          );
        }

        activeSingleRecord =
          record;

        setIssuedRecord(
          record,
        );

        setAccessCode(
          record.accessCode,
        );
      }

      /*
       * Let React render the issued URLs/codes into the hidden PDF sheet
       * before html2canvas captures it.
       */
      await new Promise<void>(
        (
          resolve,
        ) => {
          requestAnimationFrame(
            () =>
              requestAnimationFrame(
                () =>
                  resolve(),
              ),
          );
        },
      );


      const [
        jsPdfModule,
        html2canvasModule,
      ] =
        await Promise.all([
          import(
            "jspdf"
          ),
          import(
            "html2canvas"
          ),
        ]);

      const {
        jsPDF,
      } =
        jsPdfModule;

      const html2canvas =
        html2canvasModule
          .default;

      async function waitForImages(
        root:
          HTMLElement,
      ):
        Promise<void> {
        const images =
          Array.from(
            root.querySelectorAll(
              "img",
            ),
          );

        await Promise.all(
          images.map(
            async (
              image,
            ) => {
              if (
                image.complete &&
                image.naturalWidth >
                  0
              ) {
                return;
              }

              try {
                await image.decode();
              } catch {
                // html2canvas gets one final chance to render it.
              }
            },
          ),
        );
      }


      if (
        isAdminBatch
      ) {
        const root =
          adminBatchRef.current;

        if (
          !root
        ) {
          return;
        }

        await waitForImages(
          root,
        );

        const sheets =
          Array.from(
            root.querySelectorAll<HTMLElement>(
              ".gyan-calendar-admin-sheet",
            ),
          );

        const layout =
          getAdminSheetLayout(
            selected.id,
          );

        const pdf =
          new jsPDF({
            orientation:
              layout.orientation,

            unit:
              "mm",

            format:
              "a4",

            compress:
              true,

            putOnlyUsedFonts:
              true,
          });

        for (
          let index = 0;
          index <
            sheets.length;
          index += 1
        ) {
          const sheet =
            sheets[
              index
            ];

          const canvas =
            await html2canvas(
              sheet,
              {
                scale:
                  2,

                useCORS:
                  true,

                backgroundColor:
                  "#ffffff",

                logging:
                  false,

                imageTimeout:
                  15000,

                windowWidth:
                  sheet.scrollWidth,

                windowHeight:
                  sheet.scrollHeight,
              },
            );

          if (
            index >
              0
          ) {
            pdf.addPage(
              "a4",
              layout.orientation,
            );
          }

          const imageData =
            canvas.toDataURL(
              "image/jpeg",
              0.95,
            );

          pdf.addImage(
            imageData,
            "JPEG",
            0,
            0,
            layout.pageWidthMm,
            layout.pageHeightMm,
            undefined,
            "FAST",
          );
        }

        pdf.save(
          `gyan-admin-${selected.id.toLowerCase()}-8-cards.pdf`,
        );

        await markCalendarAccessPrinted(
          activeAdminBatch
            .map(
              (
                entry,
              ) =>
                entry.id,
            )
            .filter(
              (
                id,
              ): id is number =>
                typeof id ===
                  "number",
            ),
        );

        return;
      }


      const sheet =
        pdfSheetRef.current;

      if (
        !sheet
      ) {
        return;
      }

      await waitForImages(
        sheet,
      );

      const canvas =
        await html2canvas(
          sheet,
          {
            scale:
              2,

            useCORS:
              true,

            backgroundColor:
              "#ffffff",

            logging:
              false,

            imageTimeout:
              15000,

            windowWidth:
              sheet.scrollWidth,

            windowHeight:
              sheet.scrollHeight,
          },
        );

      const pageWidth =
        Math.min(
          selected.pdfWidthMm,
          selected.pdfHeightMm,
        );

      const pageHeight =
        Math.max(
          selected.pdfWidthMm,
          selected.pdfHeightMm,
        );

      const pdf =
        new jsPDF({
          orientation:
            "portrait",

          unit:
            "mm",

          format: [
            pageWidth,
            pageHeight,
          ],

          compress:
            true,

          putOnlyUsedFonts:
            true,
        });

      const canvasRatio =
        canvas.width /
        canvas.height;

      const pageRatio =
        pageWidth /
        pageHeight;

      let drawWidth =
        pageWidth;

      let drawHeight =
        pageHeight;

      let x =
        0;

      let y =
        0;

      if (
        canvasRatio >
          pageRatio
      ) {
        drawHeight =
          pageWidth /
          canvasRatio;

        y =
          (
            pageHeight -
            drawHeight
          ) /
          2;
      } else {
        drawWidth =
          pageHeight *
          canvasRatio;

        x =
          (
            pageWidth -
            drawWidth
          ) /
          2;
      }

      const imageData =
        canvas.toDataURL(
          "image/jpeg",
          0.95,
        );

      pdf.addImage(
        imageData,
        "JPEG",
        x,
        y,
        drawWidth,
        drawHeight,
        undefined,
        "FAST",
      );

      const safeRange =
        rangeLabel
          .replace(
            /[^a-z0-9]+/gi,
            "-",
          )
          .replace(
            /^-|-$/g,
            "",
          )
          .toLowerCase();

      pdf.save(
        `gyan-calendar-${safeRange}-${selected.id.toLowerCase()}-90days.pdf`,
      );

      if (
        activeSingleRecord
      ) {
        await markCalendarAccessPrinted([
          activeSingleRecord.id,
        ]);
      }
    } catch (
      caught
    ) {
      console.error(
        "GYAN calendar PDF generation failed",
        caught,
      );

      setPdfError(
        caught instanceof
          Error
          ? caught.message
          : "PDF could not be generated.",
      );
    } finally {
      setPdfGenerating(
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
        >
          ←
        </button>

        <div>
          <strong>
            Education Account and Calendar
          </strong>

          <small>
            {
              market ===
                "IN"
                ? "India 🇮🇳"
                : "United States 🇺🇸"
            }
            {" · "}
            {
              rangeLabel
            }
          </small>

          {
            issuedRecord && (
              <div className="gyan-calendar-print__issued-summary">
                <strong>
                  gyan.cc/
                  {
                    issuedRecord.slug
                      .toLowerCase()
                  }
                </strong>

                <span>
                  GYAN ACCESS CODE
                  {" "}
                  <b>
                    {
                      issuedRecord.accessCode
                    }
                  </b>
                </span>

                <small>
                  3 months complimentary · no credit card required
                </small>
              </div>
            )
          }
        </div>

        <button
          type="button"
          className="gyan-calendar-print__top-print"
          aria-label={
            "Print GYAN"
          }
          title={
            "Print GYAN"
          }
          disabled={
            !selected ||
            pdfGenerating
          }
          onClick={() =>
            void generatePdf()
          }
        >
          🖨️ Print
        </button>
      </div>

      <p className="gyan-calendar-print__instruction">
        Select the physical
        size you want to print.
      </p>

      <div className="gyan-calendar-print__sizes">
        {
          PRINT_SIZES.map(
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
                  {
                    size.title
                  }
                </strong>

                <span>
                  {
                    size.dimensions
                  }
                </span>

                <small>
                  {
                    size.note
                  }
                </small>
              </button>
            ),
          )
        }
      </div>

      <section className="gyan-calendar-print__access">
        <div className="gyan-calendar-print__access-heading">
          <strong>
            GYAN access
          </strong>

          <button
            type="button"
            onClick={
              refreshCode
            }
            title="Generate another code"
          >
            {
              accessMode ===
                "ADMIN_365"
                ? "↻ New batch"
                : "↻ New code"
            }
          </button>
        </div>

        <label className="gyan-calendar-print__access-option">
          <input
            type="radio"
            name="calendar-access"
            checked={
              accessMode ===
                "ONLINE_90"
            }
            onChange={() => {
              setAccessMode(
                "ONLINE_90",
              );

              refreshCode();
            }}
          />

          <span>
            <strong>
              Visible online code
            </strong>

            <small>
              Complimentary for 3 months
            </small>
          </span>
        </label>

        {
          isAdmin && (
            <label className="gyan-calendar-print__access-option">
              <input
                type="radio"
                name="calendar-access"
                checked={
                  accessMode ===
                    "ADMIN_365"
                }
                onChange={() => {
                  setAccessMode(
                    "ADMIN_365",
                  );

                  setAdminBatch(
                    createAdminBatch(),
                  );
                }}
              />

              <span>
                <strong>
                  Scratch code
                </strong>

                <small>
                  Admin print · complimentary for 1 year
                </small>
              </span>
            </label>
          )
        }

        <div
          className={[
            "gyan-calendar-print__code-preview",

            accessMode ===
              "ADMIN_365"
              ? "is-scratch"
              : "",
          ]
            .filter(
              Boolean,
            )
            .join(
              " ",
            )}
        >
          <small>
            GYAN ACCESS CODE
          </small>

          <strong>
            {
              accessMode ===
                "ADMIN_365"
                ? "8 UNIQUE CODES"
                : accessCode
            }
          </strong>

          <span>
            {
              accessMode ===
                "ADMIN_365"
                ? "Admin batch · 8 unique GYAN names / scratch codes"
                : `${validityLabel} complimentary · no credit card required`
            }
          </span>
        </div>
      </section>

      {
        selected &&
        !(
          isAdmin &&
          accessMode ===
            "ADMIN_365"
        ) && (
          <div className="gyan-calendar-print__qr-status">
            {
              issuingRecord
                ? "Creating your unique GYAN QR…"
                : issuedRecord
                  ? `✓ QR ready · gyan.cc/${issuedRecord.slug.toLowerCase()}`
                  : "Preparing unique GYAN QR…"
            }
          </div>
        )
      }

      {
        selected &&
        !(
          isAdmin &&
          accessMode ===
            "ADMIN_365"
        ) &&
        issuedRecord && (
          <div className="gyan-calendar-print__live-preview">
            <CalendarCard
              market={
                market
              }
              rangeLabel={
                rangeLabel
              }
              months={
                months
              }
              gyanName={
                issuedRecord.gyanName
              }
              accessCode={
                issuedRecord.accessCode
              }
              accessMode={
                accessMode
              }
              publicUrl={
                issuedRecord.publicUrl
              }
              printSize={
                selected.id
              }
              className="gyan-calendar-card--preview"
            />
          </div>
        )
      }

      {
        pdfError && (
          <div className="gyan-calendar-print__pdf-error">
            {
              pdfError
            }
          </div>
        )
      }

      {
        selected && (
          <>
            {
              !(
                isAdmin &&
                accessMode ===
                  "ADMIN_365"
              ) && (
                <div
                  className="gyan-calendar-pdf-stage"
                  aria-hidden="true"
                >
                  <div
                    ref={
                      pdfSheetRef
                    }
                    className="gyan-calendar-pdf-sheet"
                    style={{
                      width:
                        "900px",

                      height:
                        `${
                          Math.round(
                            900 *
                            Math.max(
                              selected.pdfWidthMm,
                              selected.pdfHeightMm,
                            ) /
                            Math.min(
                              selected.pdfWidthMm,
                              selected.pdfHeightMm,
                            ),
                          )
                        }px`,
                    }}
                  >
                    <CalendarCard
                      market={
                        market
                      }
                      rangeLabel={
                        rangeLabel
                      }
                      months={
                        months
                      }
                      accessCode={
                        issuedRecord
                          ?.accessCode ??
                        accessCode
                      }
                      accessMode={
                        accessMode
                      }
                      gyanName={
                        issuedRecord
                          ?.gyanName ??
                        "MangoSwan99"
                      }
                      publicUrl={
                        issuedRecord
                          ?.publicUrl ??
                        "https://gyan.cc/preview"
                      }
                      printSize={
                        selected.id
                      }
                      className="gyan-calendar-card--pdf"
                    />
                  </div>
                </div>
              )
            }

            {
              isAdmin &&
              accessMode ===
                "ADMIN_365" && (
                <div
                  ref={
                    adminBatchRef
                  }
                  className="gyan-calendar-pdf-stage gyan-calendar-admin-batch"
                  aria-hidden="true"
                >
                  {
                    Array.from({
                      length:
                        Math.ceil(
                          8 /
                          getAdminSheetLayout(
                            selected.id,
                          )
                            .perSheet,
                        ),
                    }).map(
                      (
                        _,
                        sheetIndex,
                      ) => {
                        const layout =
                          getAdminSheetLayout(
                            selected.id,
                          );

                        const startIndex =
                          sheetIndex *
                          layout.perSheet;

                        const entries =
                          adminBatch.slice(
                            startIndex,
                            startIndex +
                              layout.perSheet,
                          );

                        return (
                          <div
                            key={
                              sheetIndex
                            }
                            className={[
                              "gyan-calendar-admin-sheet",
                              `gyan-calendar-admin-sheet--${selected.id.toLowerCase()}`,
                            ].join(
                              " ",
                            )}
                            style={{
                              width:
                                `${
                                  layout.orientation ===
                                    "landscape"
                                    ? 1400
                                    : 990
                                }px`,

                              height:
                                `${
                                  layout.orientation ===
                                    "landscape"
                                    ? 990
                                    : 1400
                                }px`,

                              gridTemplateColumns:
                                `repeat(${layout.columns}, minmax(0, 1fr))`,

                              gridTemplateRows:
                                `repeat(${layout.rows}, minmax(0, 1fr))`,
                            }}
                          >
                            {
                              entries.map(
                                (
                                  entry,
                                  entryIndex,
                                ) => (
                                  <div
                                    key={
                                      `${entry.gyanName}-${entryIndex}`
                                    }
                                    className="gyan-calendar-admin-cell"
                                  >
                                    <CalendarCard
                                      market={
                                        market
                                      }
                                      rangeLabel={
                                        rangeLabel
                                      }
                                      months={
                                        months
                                      }
                                      gyanName={
                                        entry.gyanName
                                      }
                                      publicUrl={
                                        entry.publicUrl ??
                                        "https://gyan.cc/preview"
                                      }
                                      accessCode={
                                        entry.accessCode
                                      }
                                      accessMode="ADMIN_365"
                                      printSize={
                                        selected.id
                                      }
                                      className="gyan-calendar-card--pdf gyan-calendar-card--batch"
                                    />
                                  </div>
                                ),
                              )
                            }
                          </div>
                        );
                      },
                    )
                  }
                </div>
              )
            }
          </>
        )
      }

      {
        selected && (
          <div className="gyan-calendar-print__next">
            <div>
              <strong>
                {
                  selected.title
                }
                {" · "}
                {
                  validityLabel
                }
              </strong>

              <span>
                {
                  accessMode ===
                    "ADMIN_365"
                    ? "Scratch-code calendar"
                    : "Visible-code calendar"
                }
              </span>
            </div>

            <button
              type="button"
              onClick={() =>
                void generatePdf()
              }
              disabled={
                pdfGenerating
              }
            >
              {
                pdfGenerating
                  ? "Preparing PDF…"
                  : (
                      isAdmin &&
                      accessMode ===
                        "ADMIN_365"
                        ? "🖨️ Generate 8"
                        : "🖨️ Print PDF using selected size"
                    )
              }
            </button>
          </div>
        )
      }
    </section>
  );
}

export default function GyanCalendarPage({
  onClose,
  isAdmin =
    false,
  registrationMode =
    false,
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
    useState(
      registrationMode,
    );

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
      [months],
    );

  useEffect(() => {
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
  }, []);

  if (printOpen) {
    return (
      <PrintChooser
        market={market}
        rangeLabel={rangeLabel}
        months={
          months
        }
        isAdmin={
          isAdmin
        }
        defaultSize={
          registrationMode
            ? "A7"
            : null
        }
        onBack={() => {
          if (
            registrationMode
          ) {
            onClose();
            return;
          }

          setPrintOpen(
            false,
          );
        }}
      />
    );
  }

  return (
    <section className="gyan-calendar-page">
      <div className="gyan-calendar-toolbar">
        <button
          type="button"
          className="gyan-calendar-toolbar__back"
          onClick={onClose}
          aria-label="Back to GYAN"
        >
          ←
        </button>

        <div className="gyan-calendar-toolbar__title">
          <strong>
            Education Account and Calendar
          </strong>

          <span>
            {market === "IN"
              ? "India 🇮🇳"
              : "United States 🇺🇸"}
          </span>
        </div>

        <button
          type="button"
          className="gyan-calendar-toolbar__print"
          onClick={() =>
            setPrintOpen(true)
          }
        >
          Create
        </button>
      </div>

      <CalendarCard
        market={
          market
        }
        rangeLabel={
          rangeLabel
        }
        months={
          months
        }
      />
    </section>
  );
}
