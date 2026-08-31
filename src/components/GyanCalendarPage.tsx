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
    boolean;  /*
   * Opens directly in the final print/calendar chooser.
   * Used by /?calendar=print from the public GYAN account card.
   */
  initialPrintOpen?:
    boolean;

  /*
   * When true, Calendar/Print uses the current browser's unified GYAN
   * identity instead of issuing a fresh calendar-access ABCD.
   */
  useCurrentGyan?:
    boolean;

  /*
   * Independent print mode is used by Admin -> Generate QR.
   * It never creates calendar-access records. All QR destinations are
   * generic public URLs and the recipient gets/reuses a GYAN on visit.
   */
  isIndependent?:
    boolean;

  /*
   * Welcome-dialog direct download: render the existing A5 PDF machinery
   * without showing the print chooser, download once, then close.
   */
  autoDownloadA5?:
    boolean;

  onPdfDownloaded?:
    () => void;
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


type DurationMonths =
  1 | 3 | 6 | 12;

type ArtworkKey =
  | "GODDESS"
  | "EDUCATION"
  | "SCENIC";

type CalendarAccessRecord = {
  id:
    number;

  slug:
    string;

  publicUrl:
    string;

  qrUrl:
    string;

  gyanName:
    string;

  accessCode:
    string;

  durationMonths:
    DurationMonths;

  welcomeGems:
    number;

  artworkKey:
    ArtworkKey;

  status:
    "GENERATED" |
    "PRINTED" |
    "GUEST_ACTIVE" |
    "CLAIMED" |
    "EXPIRED";

  email:
    string | null;

  safetyCards?: {
    type:
      | "MESSAGE"
      | "CERTIFICATE"
      | "LOST_FOUND"
      | "EMERGENCY"
      | "HELP";

    token:
      string;

    publicUrl:
      string;
  }[];
};

type UnifiedGyanIdentity = {
  accountId?: number;
  code: string;
  displayName: string;
  publicUrl: string;
  accessCode?: string;

  goodies?: {
    type:
      | "MESSAGE"
      | "CERTIFICATE"
      | "LOST_FOUND"
      | "EMERGENCY"
      | "HELP";

    token:
      string;

    publicUrl:
      string;
  }[];
};


function nearestAccountPrintSize():
  PrintSize {
  const width =
    window.innerWidth;

  if (
    width <=
      480
  ) {
    return "A7";
  }

  if (
    width <=
      820
  ) {
    return "A6";
  }

  return "A5";
}


async function loadCurrentGyanRecord({
  durationMonths,
  artworkKey,
}: {
  durationMonths:
    DurationMonths;

  artworkKey:
    ArtworkKey;
}):
  Promise<CalendarAccessRecord> {
  const response =
    await fetch(
      "/api/gyan-identity",
      {
        method:
          "POST",

        credentials:
          "include",

        headers: {
          "Content-Type":
            "application/json",
        },

        body:
          JSON.stringify({
            browserCode:
              window.localStorage.getItem(
                "gyan_browser_code_v1",
              ) ??
              undefined,
          }),
      },
    );

  const body =
    await response.json() as {
      identity?:
        UnifiedGyanIdentity;

      error?:
        string;
    };

  if (
    !response.ok ||
    !body.identity
  ) {
    throw new Error(
      body.error ??
        "Your GYAN account could not be loaded.",
    );
  }

  const identity =
    body.identity;

  return {
    id:
      identity.accountId ??
      -1,

    slug:
      identity.code
        .trim()
        .toUpperCase(),

    publicUrl:
      identity.publicUrl,

    qrUrl:
      identity.publicUrl,

    gyanName:
      identity.displayName,

    accessCode:
      identity.accessCode ??
      "•••••-•••••",

    durationMonths,

    welcomeGems:
      getPrintConfig(
        durationMonths === 12
          ? "A5"
          : durationMonths === 6
            ? "A6"
            : "A7",
      ).welcomeGems,

    artworkKey,

    /*
     * This record represents an already-existing unified GYAN account,
     * not a newly issued calendar-access code.
     */
    status:
      "CLAIMED",

    /*
     * /api/gyan-identity intentionally does not expose a raw email here.
     */
    email:
      null,

    safetyCards:
      identity.goodies,
  };
}



function createIndependentRecord({
  durationMonths,
  artworkKey,
}: {
  durationMonths:
    DurationMonths;

  artworkKey:
    ArtworkKey;
}):
  CalendarAccessRecord {
  return {
    id: -1,
    slug: "",
    publicUrl: "https://gyan.cc/",
    qrUrl: "https://gyan.cc/",
    gyanName: "Independent GYAN",
    accessCode: "ON-SCAN",
    durationMonths,
    welcomeGems:
      getPrintConfig(
        durationMonths === 12
          ? "A5"
          : durationMonths === 6
            ? "A6"
            : "A7",
      ).welcomeGems,
    artworkKey,
    status: "GENERATED",
    email: null,

    /*
     * Intentionally omit safetyCards so A5SafetyCards uses the
     * privacy-friendly generic preview URLs.
     */
  };
}


type PrintSizeConfig = {
  id:
    PrintSize;

  title:
    string;

  product:
    string;

  dimensions:
    string;

  note:
    string;

  pdfWidthMm:
    number;

  pdfHeightMm:
    number;

  durationMonths:
    DurationMonths;

  welcomeGems:
    number;

  calendarMonths:
    number;
};

const PRINT_SIZES_V2:
  PrintSizeConfig[] = [
    {
      id:
        "A5",
      title:
        "A5",
      product:
        "Education Calendar",
      dimensions:
        "148 × 210 mm · portrait",
      note:
        "12-month calendar · full Education Account",
      pdfWidthMm:
        148,
      pdfHeightMm:
        210,
      durationMonths:
        12,
      welcomeGems:
        12,
      calendarMonths:
        12,
    },
    {
      id:
        "A6",
      title:
        "A6",
      product:
        "Mini Education Calendar",
      dimensions:
        "105 × 148 mm · portrait",
      note:
        "6-month calendar · compact Education Account",
      pdfWidthMm:
        105,
      pdfHeightMm:
        148,
      durationMonths:
        6,
      welcomeGems:
        6,
      calendarMonths:
        6,
    },
    {
      id:
        "A7",
      title:
        "A7",
      product:
        "Education Card",
      dimensions:
        "74 × 105 mm · portrait",
      note:
        "Artwork + GYAN Name + QR",
      pdfWidthMm:
        74,
      pdfHeightMm:
        105,
      durationMonths:
        3,
      welcomeGems:
        3,
      calendarMonths:
        0,
    },
    {
      id:
        "A8",
      title:
        "A8",
      product:
        "Pocket Education Card",
      dimensions:
        "52 × 74 mm · portrait",
      note:
        "Compact artwork + QR",
      pdfWidthMm:
        52,
      pdfHeightMm:
        74,
      durationMonths:
        3,
      welcomeGems:
        3,
      calendarMonths:
        0,
    },
    {
      id:
        "CREDIT_CARD",
      title:
        "Credit Card",
      product:
        "Wallet Education Card",
      dimensions:
        "85.6 × 54 mm · landscape",
      note:
        "GYAN Name + QR",
      pdfWidthMm:
        85.6,
      pdfHeightMm:
        54,
      durationMonths:
        3,
      welcomeGems:
        3,
      calendarMonths:
        0,
    },
    {
      id:
        "BUSINESS_CARD",
      title:
        "Business Card",
      product:
        "Wallet Education Card",
      dimensions:
        "88.9 × 50.8 mm · landscape",
      note:
        "GYAN Name + QR",
      pdfWidthMm:
        88.9,
      pdfHeightMm:
        50.8,
      durationMonths:
        3,
      welcomeGems:
        3,
      calendarMonths:
        0,
    },
  ];

const ARTWORK_OPTIONS:
  Array<{
    id:
      ArtworkKey;

    title:
      string;

    icon:
      string;
  }> = [
    {
      id:
        "GODDESS",
      title:
        "Saraswati",
      icon:
        "🪷",
    },
    {
      id:
        "EDUCATION",
      title:
        "Education",
      icon:
        "🎓",
    },
    {
      id:
        "SCENIC",
      title:
        "Scenic",
      icon:
        "🌄",
    },
  ];

function getPrintConfig(
  size:
    PrintSize,
):
  PrintSizeConfig {
  return (
    PRINT_SIZES_V2.find(
      (
        item,
      ) =>
        item.id ===
        size,
    ) ??
    PRINT_SIZES_V2[0]
  );
}

function getAdminCountOptions(
  size:
    PrintSize,
):
  number[] {
  switch (
    size
  ) {
    case "A5":
      return [
        1,
        2,
        4,
        6,
      ];

    case "A6":
      return [
        4,
        8,
      ];

    case "A7":
      return [
        8,
        16,
      ];

    case "A8":
      return [
        16,
        32,
      ];

    case "CREDIT_CARD":
      return [
        10,
        20,
        30,
        40,
      ];

    case "BUSINESS_CARD":
      return [
        10,
        20,
        30,
        40,
      ];
  }
}


function getArtworkSource(
  artwork:
    ArtworkKey,
  size:
    PrintSize,
):
  string {
  /*
   * A5/A6 use dedicated print-sized JPG artwork.
   * Smaller/card formats currently fall back to the closest
   * available A6 artwork until dedicated assets are added.
   */
  const artworkName =
    artwork ===
      "GODDESS"
      ? "goddess"
      : artwork ===
          "EDUCATION"
        ? "education"
        : "scenery";

  const sizeName =
    size ===
        "A5"
      ? "a5"
      : "a6";

  return `/calendar/${artworkName}-${sizeName}.jpg`;
}

function getArtworkFallback(
  artwork:
    ArtworkKey,
):
  string {
  if (
    artwork ===
      "GODDESS"
  ) {
    return "/calendar/goddess-a6.jpg";
  }

  if (
    artwork ===
      "EDUCATION"
  ) {
    return "/calendar/education-a6.jpg";
  }

  return "/calendar/scenery-a6.jpg";
}

function durationLabel(
  months:
    DurationMonths,
):
  string {
  return `${
    months
  } ${
    months ===
      1
      ? "month"
      : "months"
  }`;
}

async function issueCalendarAccessRecords({
  count,
  durationMonths,
  artworkKey,
}: {
  count:
    number;

  durationMonths:
    DurationMonths;

  artworkKey:
    ArtworkKey;
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
            artworkKey,
          }),
      },
    );

  const body =
    await response.json() as {
      records?:
        CalendarAccessRecord[];

      error?:
        string;
    };

  if (
    !response.ok ||
    !body.records
  ) {
    throw new Error(
      body.error ??
      `Could not issue calendar access (${response.status}).`,
    );
  }

  return body.records;
}

async function updateCalendarAccessPreview({
  id,
  durationMonths,
  artworkKey,
}: {
  id:
    number;

  durationMonths:
    DurationMonths;

  artworkKey:
    ArtworkKey;
}):
  Promise<
    CalendarAccessRecord
  > {
  const response =
    await fetch(
      `/api/calendar-access/${id}/preview`,
      {
        method:
          "POST",

        headers: {
          "Content-Type":
            "application/json",
        },

        body:
          JSON.stringify({
            durationMonths,
            artworkKey,
          }),
      },
    );

  const body =
    await response.json() as {
      record?:
        CalendarAccessRecord;

      error?:
        string;
    };

  if (
    !response.ok ||
    !body.record
  ) {
    throw new Error(
      body.error ??
      "Could not update the GYAN preview.",
    );
  }

  return body.record;
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
      "PDF was created, but print status could not be saved.",
    );
  }
}

function CalendarArtwork({
  artwork,
  size,
  market,
}: {
  artwork:
    ArtworkKey;

  size:
    PrintSize;

  market:
    CalendarMarket;
}) {
  const primarySource =
    getArtworkSource(
      artwork,
      size,
    );

  const fallbackSource =
    getArtworkFallback(
      artwork,
    );

  return (
    <div
      className={[
        "gyan-print-card-v2__art",
        `gyan-print-card-v2__art--${artwork.toLowerCase()}`,
      ].join(
        " ",
      )}
    >
      <img
        key={
          `${artwork}-${size}-${market}`
        }
        src={
          primarySource
        }
        alt={
          artwork ===
            "GODDESS"
            ? "Saraswati artwork"
            : artwork ===
                "EDUCATION"
              ? "Education artwork"
              : "Scenic artwork"
        }
        onError={(
          event,
        ) => {
          const image =
            event.currentTarget;

          if (
            image.dataset.fallbackApplied ===
              "true"
          ) {
            return;
          }

          image.dataset.fallbackApplied =
            "true";

          image.src =
            fallbackSource;
        }}
      />
    </div>
  );
}


type A5SafetyCardKind =
  | "MESSAGE"
  | "CERTIFICATE"
  | "LOST_FOUND"
  | "EMERGENCY"
  | "HELP";


function A5SafetyCards({
  record,
  fallbackName,
}: {
  record:
    CalendarAccessRecord |
    null;

  fallbackName:
    string;
}) {
  const displayName =
    record
      ?.gyanName ??
    fallbackName;

  const fallbackCards:
    Array<{
      type:
        A5SafetyCardKind;
      token:
        string;
      publicUrl:
        string;
    }> = [
      {
        type:
          "MESSAGE",
        token:
          "",
        publicUrl:
          "https://gyan.cc/",
      },
      {
        type:
          "CERTIFICATE",
        token:
          "previewcert",
        publicUrl:
          "https://gyan.cc/previewcert",
      },
      {
        type:
          "LOST_FOUND",
        token:
          "previewlost",
        publicUrl:
          "https://gyan.cc/previewlost",
      },
      {
        type:
          "EMERGENCY",
        token:
          "previewemrg",
        publicUrl:
          "https://gyan.cc/previewemrg",
      },
      {
        type:
          "HELP",
        token:
          "previewhelp",
        publicUrl:
          "https://gyan.cc/previewhelp",
      },
    ];

  const cardOrder:
    Record<
      A5SafetyCardKind,
      number
    > = {
      MESSAGE: 0,
      LOST_FOUND: 1,
      CERTIFICATE: 2,
      EMERGENCY: 3,
      HELP: 4,
    };

  const recordCards =
    record
      ?.safetyCards
      ?.slice() ??
    [];

  const hasMessage =
    recordCards.some(
      (
        card,
      ) =>
        card.type ===
          "MESSAGE",
    );

  const cards =
    (
      recordCards.length > 0
        ? hasMessage
          ? recordCards
          : [
              {
                type:
                  "MESSAGE" as const,
                token:
                  "",
                publicUrl:
                  "https://gyan.cc/",
              },
              ...recordCards,
            ]
        : fallbackCards
    )
      .slice()
      .sort(
        (first, second) =>
          cardOrder[first.type] -
          cardOrder[second.type],
      );

  const labelFor =
    (
      type:
        A5SafetyCardKind,
    ): string => {
      if (
        type ===
          "MESSAGE"
      ) {
        return "GYAN MESSAGE";
      }

      if (
        type ===
          "CERTIFICATE"
      ) {
        return "CERTIFICATE";
      }

      if (
        type ===
          "LOST_FOUND"
      ) {
        return "LOST & FOUND";
      }

      if (
        type ===
          "EMERGENCY"
      ) {
        return "EMERGENCY";
      }

      return "HELP";
    };

  return (
    <section className="gyan-a5-safety">
      <div className="gyan-a5-safety__heading">
        ✂ FREE GYAN CARDS
      </div>

      <div className="gyan-a5-safety__cards gyan-a5-safety__cards--five">
        {
          cards.map(
            (
              card,
            ) => (
              <div
                key={
                  card.type
                }
                className="gyan-a5-safety__card"
              >
                <div className="gyan-a5-safety__qr-group">
                  <div className="gyan-a5-safety__site">
                    {
                      card.token
                        ? `https://gyan.cc/${card.token}`
                        : "https://gyan.cc/"
                    }
                  </div>

                  <a
                    className="gyan-a5-safety__qr gyan-print-card-v2__qr-link"
                    href={card.publicUrl}
                    target="_blank"
                    rel="noreferrer"
                    title={card.publicUrl}
                    aria-label={`Open ${labelFor(
                      card.type,
                    )}`}
                  >
                    <QRCodeSVG
                      value={
                        card.publicUrl
                      }
                      size={
                        92
                      }
                      level="M"
                      includeMargin
                      aria-label={`Open ${labelFor(
                        card.type,
                      )}`}
                    />
                  </a>

                  <strong className="gyan-a5-safety__label">
                    {
                      labelFor(
                        card.type,
                      )
                    }
                  </strong>
                </div>
              </div>
            ),
          )
        }
      </div>

      <div className="gyan-a5-safety__privacy">
        No name, phone or email required. You’ll be known as{" "}
        <strong>
          {
            displayName
          }
        </strong>{" "}
        (unless you change it). Scan to see privacy-friendly forms.
      </div>
    </section>
  );
}

function EducationAccountBlock({
  size,
  record,
  fallbackName,
  fallbackAccessCode,
}: {
  size:
    PrintSize;

  record:
    CalendarAccessRecord |
    null;

  fallbackName:
    string;

  fallbackAccessCode:
    string;
}) {
  const config =
    getPrintConfig(
      size,
    );

  const gyanName =
    record
      ?.gyanName ??
    fallbackName;

  const publicUrl =
    record
      ?.publicUrl ??
    "https://gyan.cc/preview";

  const qrUrl =
    record
      ?.qrUrl ??
    publicUrl;

  const accessCode =
    record
      ?.accessCode ??
    fallbackAccessCode;

  const isLargeAccount =
    size ===
      "A5" ||
    size ===
      "A6";

  const isCollectibleCard =
    size ===
      "A7" ||
    size ===
      "A8";

  if (
    size ===
      "A5"
  ) {
    const shortCode =
      record
        ?.slug
        ?.toUpperCase() ??
      "ABCD";

    return (
      <section className="gyan-print-card-v2__account gyan-print-card-v2__account--screenlet gyan-print-card-v2__account--a5-main">
        <div className="gyan-account-screenlet__label">
          Your Display Name
        </div>

        <strong className="gyan-account-screenlet__name">
          {
            gyanName
          }
        </strong>

        <div className="gyan-account-screenlet__qr">
          <a

            href={

              qrUrl

            }

            className="gyan-print-card-v2__qr-link"

            aria-label="Open this GYAN account"

            title={

              qrUrl

            }

          >
<QRCodeSVG            value={
              qrUrl
            }
            size={
              168
            }
            level="M"
            includeMargin
            aria-label="Scan to open this GYAN Education Account"          />

          </a>
        </div>

        <div className="gyan-account-screenlet__url">
          <span>
            https://
          </span>

          <strong>
            gyan.cc/{shortCode}
          </strong>
        </div>

        <div className="gyan-a5-account__summary">
          <span>
            {
              durationLabel(
                config.durationMonths,
              )
            } complimentary
          </span>

          <span aria-hidden="true">
            •
          </span>

          <span>
            💎 {
              config.welcomeGems
            } Gems
          </span>
        </div>

        <div className="gyan-a5-account__access">
          Access code:{" "}
          <strong>
            {
              accessCode
            }
          </strong>
        </div>
      </section>
    );
  }

  if (
    isCollectibleCard
  ) {
    const shortUrl =
      record
        ?.slug
        ? `gyan.cc/${record.slug.toLowerCase()}`
        : publicUrl.replace(
            /^https?:\/\//,
            "",
          );

    return (
      <section className="gyan-print-card-v2__account gyan-print-card-v2__account--collectible">
        <div className="gyan-collectible-account__qr">
          <a

            href={

              qrUrl

            }

            className="gyan-print-card-v2__qr-link"

            aria-label="Open this GYAN account"

            title={

              qrUrl

            }

          >
<QRCodeSVG            value={
              qrUrl
            }
            size={
              180
            }
            level="M"
            includeMargin
            aria-label="Scan to open this GYAN Education Account"          />

          </a>
        </div>

        <div className="gyan-collectible-account__copy">
          <div className="gyan-collectible-account__identity">
            <span>
              YOUR Display name:
            </span>

            <strong>
              {
                gyanName
              }
            </strong>
          </div>

          <strong className="gyan-collectible-account__url">
            {
              shortUrl.includes("/")
                ? (
                    <>
                      {
                        shortUrl.slice(
                          0,
                          shortUrl.lastIndexOf("/") + 1,
                        )
                      }
                      <b>
                        {
                          shortUrl.slice(
                            shortUrl.lastIndexOf("/") + 1,
                          )
                        }
                      </b>
                    </>
                  )
                : shortUrl
            }
          </strong>

          <span>
            {
              durationLabel(
                config.durationMonths,
              )
            } complimentary
          </span>

          <span>
            💎 {
              config.welcomeGems
            } Welcome Gems
          </span>
        </div>
      </section>
    );
  }

  if (
    size ===
      "CREDIT_CARD" ||
    size ===
      "BUSINESS_CARD"
  ) {
    const shortCode =
      record
        ?.slug
        ?.toUpperCase() ??
      "ABCD";

    return (
      <section className="gyan-print-card-v2__account gyan-print-card-v2__account--screenlet gyan-print-card-v2__account--wallet-screenlet">
        <div className="gyan-account-screenlet__label">
          YOUR Display name:
        </div>

        <strong className="gyan-account-screenlet__name">
          {
            gyanName
          }
        </strong>

        <div className="gyan-account-screenlet__qr">
          <a

            href={

              qrUrl

            }

            className="gyan-print-card-v2__qr-link"

            aria-label="Open this GYAN account"

            title={

              qrUrl

            }

          >
<QRCodeSVG            value={
              qrUrl
            }
            size={
              150
            }
            level="M"
            includeMargin
            aria-label="Scan to open this GYAN Education Account"          />

          </a>
        </div>

        <div className="gyan-account-screenlet__url">
          gyan.cc/
          <strong>
            {
              shortCode
            }
          </strong>
        </div>

        <div className="gyan-account-screenlet__benefit">
          {
            durationLabel(
              config.durationMonths,
            )
          } complimentary
        </div>

        <div className="gyan-account-screenlet__benefit">
          💎 {
            config.welcomeGems
          } Welcome Gems
        </div>

        <div className="gyan-account-screenlet__access-code">
          <span>
            ACCESS CODE
          </span>

          <strong>
            {
              accessCode
            }
          </strong>
        </div>
      </section>
    );
  }

  if (
    isLargeAccount
  ) {
    const shortCode =
      record
        ?.slug
        ?.toUpperCase() ??
      "ABCD";

    return (
      <section className="gyan-print-card-v2__account gyan-print-card-v2__account--screenlet">
        <div className="gyan-account-screenlet__label">
          Display name:
        </div>

        <strong className="gyan-account-screenlet__name">
          {
            gyanName
          }
        </strong>

        <div className="gyan-account-screenlet__qr">
          <a

            href={

              qrUrl

            }

            className="gyan-print-card-v2__qr-link"

            aria-label="Open this GYAN account"

            title={

              qrUrl

            }

          >
<QRCodeSVG            value={
              qrUrl
            }
            size={
              168
            }
            level="M"
            includeMargin
            aria-label="Scan to open this GYAN Education Account"          />

          </a>
        </div>

        <div className="gyan-account-screenlet__url">
          gyan.cc/
          <strong>
            {
              shortCode
            }
          </strong>
        </div>

        <div className="gyan-account-screenlet__benefit">
          {
            durationLabel(
              config.durationMonths,
            )
          } complimentary
        </div>

        <div className="gyan-account-screenlet__benefit">
          💎 {
            config.welcomeGems
          } Welcome Gems
        </div>

        <div className="gyan-account-screenlet__benefit gyan-account-screenlet__benefit--small">
          No credit card required
        </div>

        <div className="gyan-account-screenlet__benefit gyan-account-screenlet__benefit--small">
          🧩 Puzzle of the Day · gyan.cc/puzzle
        </div>

        <div className="gyan-account-screenlet__benefit gyan-account-screenlet__benefit--small">
          💎 108 Gems → Complimentary Vedic Mathematics Class
        </div>

        <div className="gyan-account-screenlet__access-code">
          <span>
            ACCESS CODE
          </span>

          <strong>
            {
              accessCode
            }
          </strong>
        </div>
      </section>
    );
  }

  return (
    <section className="gyan-print-card-v2__account">
      <div className="gyan-print-card-v2__identity">
        <small>
          YOUR Display name:
        </small>

        <strong>
          {
            gyanName
          }
        </strong>
      </div>

      <div className="gyan-print-card-v2__account-main">
        <div className="gyan-print-card-v2__qr">
          <a

            href={

              qrUrl

            }

            className="gyan-print-card-v2__qr-link"

            aria-label="Open this GYAN account"

            title={

              qrUrl

            }

          >
<QRCodeSVG            value={
              qrUrl
            }
            size={
              160
            }
            level="H"
            includeMargin
            aria-label="Scan to open this GYAN Education Account"          />

          </a>
        </div>

        <div className="gyan-print-card-v2__account-copy">
          <strong>
            {
              publicUrl.replace(
                /^https?:\/\//,
                "",
              )
            }
          </strong>

          <span>
            {
              durationLabel(
                config.durationMonths,
              )
            } complimentary
          </span>

          <span>
            💎 {
              config.welcomeGems
            } Welcome Gems
          </span>
        </div>
      </div>

      <div className="gyan-print-card-v2__gem-goal">
        💎 108 Gems → Complimentary Vedic Mathematics Class
      </div>

    </section>
  );
}

function CalendarCard({
  market,
  rangeLabel,
  months,
  printSize =
    "A5",
  artwork =
    "GODDESS",
  record =
    null,
  fallbackName =
    "MangoSwan99",
  fallbackAccessCode =
    "VJBM-VFNL",
  className =
    "",
}: {
  market:
    CalendarMarket;

  rangeLabel:
    string;

  months:
    CalendarMonthData[];

  printSize?:
    PrintSize;

  artwork?:
    ArtworkKey;

  record?:
    CalendarAccessRecord |
    null;

  fallbackName?:
    string;

  fallbackAccessCode?:
    string;

  className?:
    string;
}) {
  const config =
    getPrintConfig(
      printSize,
    );

  const calendarMonths =
    config.calendarMonths >
      0
      ? months.slice(
          0,
          config.calendarMonths,
        )
      : [];

  return (
    <article
      className={[
        "gyan-print-card-v2",
        `gyan-print-card-v2--${printSize.toLowerCase()}`,
        className,
      ]
        .filter(
          Boolean,
        )
        .join(
          " ",
        )}
    >
      <header className="gyan-print-card-v2__header">
        <div>
          <strong>
            GYAN
          </strong>

          <span>
            Education Account
          </span>
        </div>

        {
          config.calendarMonths >
            0 && (
            <small>
              {
                rangeLabel
              }
            </small>
          )
        }
      </header>

      <div
        className={
          printSize ===
              "A7" ||
            printSize ===
              "A8"
            ? "gyan-print-card-v2__hero-row gyan-print-card-v2__hero-row--stacked"
            : "gyan-print-card-v2__hero-row"
        }
      >
        <CalendarArtwork
          artwork={
            artwork
          }
          size={
            printSize
          }
          market={
            market
          }
        />

        <EducationAccountBlock
          size={
            printSize
          }
          record={
            record
          }
          fallbackName={
            fallbackName
          }
          fallbackAccessCode={
            fallbackAccessCode
          }
        />

        {
          printSize ===
            "A5" && (
            <A5SafetyCards
              record={
                record
              }
              fallbackName={
                fallbackName
              }
            />
          )
        }
      </div>

      {
        calendarMonths.length >
          0 && (
          <section className="gyan-print-card-v2__calendar">
            <div className="gyan-print-card-v2__calendar-heading">
              <strong>
                {
                  config.calendarMonths ===
                    12
                    ? "12-Month Calendar"
                    : "6-Month Calendar"
                }
              </strong>

              <span>
                {
                  rangeLabel
                }
              </span>
            </div>

            <div className="gyan-print-card-v2__calendar-grid">
              {
                calendarMonths.map(
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

      <footer className="gyan-print-card-v2__footer">
        <div className="gyan-print-card-v2__contact-row">
          <strong>https://gyan.cc/</strong>
          <span aria-hidden="true">•</span>
          <strong className="gyan-print-card-v2__contact">
            admin@gyan.cc
          </strong>
        </div>

        <span className="gyan-print-card-v2__footer-tagline">
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
  defaultSize =
    null,
  useCurrentGyan =
    false,
  isIndependent =
    false,
  autoDownloadA5 =
    false,
  onPdfDownloaded,
  onBack,
}: {
  market:
    CalendarMarket;

  rangeLabel:
    string;

  months:
    CalendarMonthData[];

  defaultSize?:
    PrintSize |
    null;

  useCurrentGyan?:
    boolean;

  isIndependent?:
    boolean;

  autoDownloadA5?:
    boolean;

  onPdfDownloaded?:
    () => void;

  onBack:
    () => void;
}) {
  const [
    selectedSize,
    setSelectedSize,
  ] =
    useState<
      PrintSize
    >(
      () => {
        if (
          autoDownloadA5
        ) {
          return "A5";
        }

        if (
          defaultSize
        ) {
          return defaultSize;
        }

        if (
          useCurrentGyan ||
          isIndependent
        ) {
          return nearestAccountPrintSize();
        }

        return window.matchMedia(
          "(max-width: 620px)",
        ).matches
          ? "A7"
          : "A5";
      },
    );

  const [
    artwork,
    setArtwork,
  ] =
    useState<ArtworkKey>(
      market ===
        "IN"
        ? "GODDESS"
        : "EDUCATION",
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

  const initialArtworkRef =
    useRef<ArtworkKey>(
      artwork,
    );

  const [
    adminBatch,
    setAdminBatch,
  ] =
    useState<
      CalendarAccessRecord[]
    >(
      [],
    );

  const [
    adminCount,
    setAdminCount,
  ] =
    useState(
      () => {
        const initialSize =
          defaultSize ??
          (
            window.matchMedia(
              "(max-width: 620px)",
            ).matches
              ? "A7"
              : "A5"
          );

        return getAdminCountOptions(
          initialSize,
        )[0];
      },
    );

  const [
    busy,
    setBusy,
  ] =
    useState(
      false,
    );

  const [
    error,
    setError,
  ] =
    useState("");

  function emailCalendarLink():
    void {
    const subject =
      encodeURIComponent(
        "GYAN Calendar",
      );

    const body =
      encodeURIComponent(
        `Open your GYAN Calendar: ${window.location.origin}/?calendar=print`,
      );

    window.location.href =
      `mailto:?subject=${subject}&body=${body}`;
  }


  const pdfSheetRef =
    useRef<
      HTMLDivElement |
      null
    >(
      null,
    );

  const batchRef =
    useRef<
      HTMLDivElement |
      null
    >(
      null,
    );

  const autoDownloadStartedRef =
    useRef(
      false,
    );

  const selected =
    getPrintConfig(
      selectedSize,
    );

  const issuanceConfig =
    selected;

  /*
   * Render the hidden PDF card at the same effective width used by the
   * live preview. This keeps typography/QR proportions visually consistent
   * between preview and generated PDF instead of shrinking text inside a
   * generic 900px capture stage. html2canvas still captures at 2.4x.
   */
  const pdfRenderWidth =
    selected.id === "A7"
      ? 430
      : selected.id === "A8"
        ? 360
        : 720;


  async function createPreviewRecord():
    Promise<
      CalendarAccessRecord |
      null
    > {
    setBusy(
      true,
    );

    setError("");

    try {
      const record =
        isIndependent
          ? createIndependentRecord({
              durationMonths:
                issuanceConfig.durationMonths,

              artworkKey:
                artwork,
            })
          : useCurrentGyan
            ? await loadCurrentGyanRecord({
                durationMonths:
                  issuanceConfig.durationMonths,

                artworkKey:
                  artwork,
              })
            : (
                await issueCalendarAccessRecords({
                  count:
                    1,

                  durationMonths:
                    issuanceConfig.durationMonths,

                  artworkKey:
                    artwork,
                })
              )[0] ??
              null;

      setIssuedRecord(
        record,
      );

      return record;
    } catch (
      caught
    ) {
      setError(
        caught instanceof
          Error
          ? caught.message
          : "Could not create the GYAN account.",
      );

      return null;
    } finally {
      setBusy(
        false,
      );
    }
  }

  useEffect(
    () => {
      let cancelled =
        false;

      const initialSize =
        defaultSize ??
        (
          useCurrentGyan ||
          isIndependent
            ? nearestAccountPrintSize()
            : window.matchMedia(
                "(max-width: 620px)",
              ).matches
              ? "A7"
              : "A5"
        );

      const initialConfig =
        getPrintConfig(
          initialSize,
        );

      const initialRecordPromise =
        isIndependent
          ? Promise.resolve(
              createIndependentRecord({
                durationMonths:
                  initialConfig.durationMonths,

                artworkKey:
                  initialArtworkRef.current,
              }),
            )
          : useCurrentGyan
            ? loadCurrentGyanRecord({
                durationMonths:
                  initialConfig.durationMonths,

                artworkKey:
                  initialArtworkRef.current,
              })
            : issueCalendarAccessRecords({
                count:
                  1,

                durationMonths:
                  12,

                artworkKey:
                  initialArtworkRef.current,
              }).then(
                (
                  records,
                ) =>
                  records[0] ??
                  null,
              );

      void initialRecordPromise
        .then(
          (
            record,
          ) => {
            if (
              cancelled
            ) {
              return;
            }

            if (
              record
            ) {
              setIssuedRecord(
                record,
              );
            }
          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              cancelled
            ) {
              return;
            }

            setError(
              caught instanceof
                Error
                ? caught.message
                : "Could not create the GYAN account.",
            );
          },
        );

      return () => {
        cancelled =
          true;
      };
    },
    [],
  );


  useEffect(
    () => {
      if (
        !selected
      ) {
        return;
      }

      if (
        !issuedRecord
      ) {
        return;
      }

      if (
        issuedRecord.durationMonths ===
          selected.durationMonths &&
        issuedRecord.artworkKey ===
          artwork
      ) {
        return;
      }

      if (
        useCurrentGyan ||
        isIndependent
      ) {
        /*
         * These modes do not persist preview changes to
         * /api/calendar-access. Defer the local preview sync so
         * state is not updated synchronously inside the effect.
         */
        queueMicrotask(
          () => {
            setIssuedRecord(
              (
                previous,
              ) => {
                if (
                  !previous ||
                  (
                    previous.durationMonths ===
                      selected.durationMonths &&
                    previous.artworkKey ===
                      artwork
                  )
                ) {
                  return previous;
                }

                return {
                  ...previous,

                  durationMonths:
                    selected.durationMonths,

                  welcomeGems:
                    selected.welcomeGems,

                  artworkKey:
                    artwork,
                };
              },
            );
          },
        );

        return;
      }

      let cancelled =
        false;

      void updateCalendarAccessPreview({
        id:
          issuedRecord.id,

        durationMonths:
          selected.durationMonths,

        artworkKey:
          artwork,
      })
        .then(
          (
            record,
          ) => {
            if (
              !cancelled
            ) {
              setIssuedRecord(
                (
                  previous,
                ) => ({
                  ...record,

                  qrUrl:
                    record.qrUrl ??
                    previous?.qrUrl ??
                    record.publicUrl,
                }),
              );
            }
          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              !cancelled
            ) {
              setError(
                caught instanceof
                  Error
                  ? caught.message
                  : "Could not update the preview.",
              );
            }
          },
        )
.then(
          () => undefined,
        );

      return () => {
        cancelled =
          true;
      };
    },
    [
      selected,
      issuedRecord,
      artwork,
      useCurrentGyan,
      isIndependent,
    ],
  );

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
            // html2canvas still gets a final chance.
          }
        },
      ),
    );
  }

  async function captureCard(
    element:
      HTMLElement,
    html2canvas:
      (
        element:
          HTMLElement,
        options:
          Record<string, unknown>,
      ) =>
        Promise<HTMLCanvasElement>,
  ):
    Promise<HTMLCanvasElement> {
    await waitForImages(
      element,
    );

    return html2canvas(
      element,
      {
        scale:
          2.4,

        useCORS:
          true,

        backgroundColor:
          "#ffffff",

        logging:
          false,

        imageTimeout:
          15000,

        windowWidth:
          element.scrollWidth,

        windowHeight:
          element.scrollHeight,
      },
    );
  }

  async function generatePdf():
    Promise<boolean> {
    if (
      !selected ||
      busy
    ) {
      return false;
    }

    setBusy(
      true,
    );

    setError("");

    try {
      let singleRecord =
        issuedRecord;

      if (
        !singleRecord
      ) {
        singleRecord =
          await createPreviewRecord();
      }

      if (
        !singleRecord
      ) {
        throw new Error(
          "The GYAN account could not be created.",
        );
      }

      let batchRecords:
        CalendarAccessRecord[] =
          [];

      const additionalCount =
        useCurrentGyan
          ? 0
          : Math.max(
              0,
              adminCount -
                1,
            );

      const additionalRecords =
        isIndependent
          ? Array.from(
              {
                length:
                  additionalCount,
              },
              () =>
                createIndependentRecord({
                  durationMonths:
                    selected.durationMonths,

                  artworkKey:
                    artwork,
                }),
            )
          : additionalCount >
              0
            ? await issueCalendarAccessRecords({
                count:
                  additionalCount,

                durationMonths:
                  selected.durationMonths,

                artworkKey:
                  artwork,
              })
            : [];

      batchRecords = [
        singleRecord,
        ...additionalRecords,
      ];

      setAdminBatch(
        batchRecords,
      );

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

      const pdf =
        new jsPDF({
          orientation:
            selected.id ===
                "CREDIT_CARD" ||
              selected.id ===
                "BUSINESS_CARD"
              ? "landscape"
              : "portrait",

          unit:
            "mm",

          format: [
            selected.pdfWidthMm,
            selected.pdfHeightMm,
          ],

          compress:
            true,

          putOnlyUsedFonts:
            true,
        });

      const addPdfLinks =
        (
          element:
            HTMLElement,
        ):
          void => {
          const pageRect =
            element.getBoundingClientRect();

          if (
            pageRect.width <= 0 ||
            pageRect.height <= 0
          ) {
            return;
          }

          const scaleX =
            selected.pdfWidthMm /
            pageRect.width;

          const scaleY =
            selected.pdfHeightMm /
            pageRect.height;

          const links =
            Array.from(
              element.querySelectorAll<HTMLAnchorElement>(
                "a[href]",
              ),
            );

          links.forEach(
            (
              link,
            ) => {
              const href =
                link.href;

              if (
                !href
              ) {
                return;
              }

              const rect =
                link.getBoundingClientRect();

              pdf.link(
                (rect.left - pageRect.left) *
                  scaleX,
                (rect.top - pageRect.top) *
                  scaleY,
                rect.width *
                  scaleX,
                rect.height *
                  scaleY,
                {
                  url:
                    href,
                },
              );
            },
          );
        };


      const addCanvasPage =
        (
          canvas:
            HTMLCanvasElement,
          element:
            HTMLElement,
          first:
            boolean,
        ):
          void => {
          if (
            !first
          ) {
            pdf.addPage(
              [
                selected.pdfWidthMm,
                selected.pdfHeightMm,
              ],
              selected.id ===
                  "CREDIT_CARD" ||
                selected.id ===
                  "BUSINESS_CARD"
                ? "landscape"
                : "portrait",
            );
          }

          const imageData =
            canvas.toDataURL(
              "image/jpeg",
              0.96,
            );

          pdf.addImage(
            imageData,
            "JPEG",
            0,
            0,
            selected.pdfWidthMm,
            selected.pdfHeightMm,
            undefined,
            "FAST",
          );

          addPdfLinks(
            element,
          );
        };

      const printedIds:
        number[] =
          [];

      if (
        batchRecords.length > 0
      ) {
        const root =
          batchRef.current;

        if (
          !root
        ) {
          throw new Error(
            "Batch pages are not ready.",
          );
        }

        const pages =
          Array.from(
            root.querySelectorAll<HTMLElement>(
              ".gyan-calendar-batch-page-v2",
            ),
          );

        for (
          let index = 0;
          index <
            pages.length;
          index += 1
        ) {
          const canvas =
            await captureCard(
              pages[index],
              html2canvas,
            );

          addCanvasPage(
            canvas,
            pages[index],
            index ===
              0,
          );
        }

        printedIds.push(
          ...batchRecords
            .map(
              (
                record,
              ) =>
                record.id,
            )
            .filter(
              (
                id,
              ) =>
                id > 0,
            ),
        );
      } else {
        const root =
          pdfSheetRef.current;

        if (
          !root
        ) {
          throw new Error(
            "Print page is not ready.",
          );
        }

        const canvas =
          await captureCard(
            root,
            html2canvas,
          );

        addCanvasPage(
          canvas,
          root,
          true,
        );

        if (
          singleRecord.id > 0
        ) {
          printedIds.push(
            singleRecord.id,
          );
        }
      }

      const fileName =
        useCurrentGyan
          ? `GYAN-${singleRecord.slug.toUpperCase()}-A5.pdf`
          : `gyan-${selected.id.toLowerCase()}-${selected.durationMonths}months.pdf`;

      pdf.save(
        fileName,
      );

      if (
        !isIndependent
      ) {
        await markCalendarAccessPrinted(
          printedIds,
        );
      }

      onPdfDownloaded?.();

      if (
        autoDownloadA5 &&
        useCurrentGyan &&
        new URLSearchParams(
          window.location.search,
        ).get(
          "autodownload",
        ) ===
          "1"
      ) {
        window.localStorage.setItem(
          `gyan_new_card_welcome_seen_v1:${singleRecord.slug
            .trim()
            .toUpperCase()}`,
          "1",
        );

        window.setTimeout(
          () => {
            window.location.replace(
              "/",
            );
          },
          250,
        );
      }

      return true;
    } catch (
      caught
    ) {
      console.error(
        "GYAN PDF generation failed",
        caught,
      );

      setError(
        caught instanceof
          Error
          ? caught.message
          : "PDF could not be generated.",
      );

      return false;
    } finally {
      setBusy(
        false,
      );
    }
  }

  useEffect(
    () => {
      if (
        !autoDownloadA5 ||
        autoDownloadStartedRef.current ||
        !issuedRecord ||
        busy
      ) {
        return;
      }

      autoDownloadStartedRef.current =
        true;

      void generatePdf();
    },
    [
      autoDownloadA5,
      issuedRecord,
      busy,
    ],
  );


  return (
    <section className="gyan-calendar-print gyan-calendar-print--v2">
      <div className="gyan-calendar-print__heading">
        <button
          type="button"
          onClick={
            onBack
          }
          aria-label="Back"
        >
          ←
        </button>

        <div>
          <strong>
            Education Account and Calendar
          </strong>

          <div className="gyan-calendar-print__access-line gyan-calendar-print__access-line--header">
            <span>
              URL:
            </span>

            <strong>
              {
                isIndependent
                  ? "GYAN.CC/ · Independent"
                  : issuedRecord
                    ? `GYAN.CC/${issuedRecord.slug.toUpperCase()}`
                    : "GYAN.CC/ABCD"
              }
            </strong>

            <i aria-hidden="true">
              |
            </i>

            <span>
              ACCESS CODE:
            </span>

            <b>
              {
                isIndependent
                  ? "Created on first use"
                  : issuedRecord
                    ?.accessCode ??
                    "•••••-•••••"
              }
            </b>
          </div>
        </div>

        <button
          type="button"
          className="gyan-calendar-print__top-print"
          disabled={
            !selected ||
            busy
          }
          onClick={() =>
            void generatePdf()
          }
        >
          🖨️
        </button>
      </div>






      <div className="gyan-calendar-print__quick-controls">
        <div className="gyan-calendar-print__quick-group">
          <span>
            Size:
          </span>

          {
            [
              ["A5", "A5"],
              ["A6", "A6"],
              ["A7", "A7"],
              ["A8", "A8"],
              ["CREDIT_CARD", "CC"],
              ["BUSINESS_CARD", "BC"],
            ].map(
              (
                [
                  value,
                  label,
                ],
              ) => (
                <button
                  key={
                    value
                  }
                  type="button"
                  className={
                    selectedSize ===
                      value
                      ? "is-selected"
                      : ""
                  }
                  onClick={() => {
                    const nextSize =
                      value as PrintSize;

                    setSelectedSize(
                      nextSize,
                    );

                    setAdminCount(
                      getAdminCountOptions(
                        nextSize,
                      )[0],
                    );
                  }}
                >
                  {
                    label
                  }
                </button>
              ),
            )
          }
        </div>

        <i aria-hidden="true">
          |
        </i>

        <div className="gyan-calendar-print__quick-group">
          <span>
            Artwork:
          </span>

          <button
            type="button"
            className={
              artwork ===
                "EDUCATION"
                ? "is-selected"
                : ""
            }
            title="Education"
            onClick={() =>
              setArtwork(
                "EDUCATION",
              )
            }
          >
            ED
          </button>

          <button
            type="button"
            className={
              artwork ===
                "GODDESS"
                ? "is-selected"
                : ""
            }
            title="Saraswati"
            onClick={() =>
              setArtwork(
                "GODDESS",
              )
            }
          >
            Maa
          </button>

          <button
            type="button"
            className={
              artwork ===
                "SCENIC"
                ? "is-selected"
                : ""
            }
            title="Scenic"
            onClick={() =>
              setArtwork(
                "SCENIC",
              )
            }
          >
            SC
          </button>
        </div>

        <>
          <i aria-hidden="true">
            |
          </i>

          <div className="gyan-calendar-print__quick-group">
            <span>
              Count:
            </span>

            <select
              className="gyan-calendar-print__count-select"
              value={
                adminCount
              }
              onChange={(
                event,
              ) =>
                setAdminCount(
                  Number(
                    event.target.value,
                  ),
                )
              }
              aria-label={
                isIndependent
                  ? "Number of independent GYAN cards to generate"
                  : "Number of unique GYAN cards to generate"
              }
            >
              {
                getAdminCountOptions(
                  selectedSize,
                ).map(
                  (
                    count,
                  ) => (
                    <option
                      key={
                        count
                      }
                      value={
                        count
                      }
                    >
                      {
                        count
                      }
                    </option>
                  ),
                )
              }
            </select>
          </div>
        </>
      </div>

      {
        selected &&
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
              printSize={
                selected.id
              }
              artwork={
                artwork
              }
              record={
                issuedRecord
              }
              className="gyan-print-card-v2--preview"
            />
          </div>
        )
      }

            {
        selected && (
          <section className="gyan-calendar-print__artwork">
            <strong>
              Choose artwork
            </strong>

            <span>
              Artwork contains no text or QR. The print uses a size-specific image to avoid stretching.
            </span>

            <div>
              {
                ARTWORK_OPTIONS.map(
                  (
                    option,
                  ) => (
                    <button
                      key={
                        option.id
                      }
                      type="button"
                      className={
                        artwork ===
                          option.id
                          ? "is-selected"
                          : ""
                      }
                      onClick={() =>
                        setArtwork(
                          option.id,
                        )
                      }
                    >
                      <span>
                        {
                          option.icon
                        }
                      </span>

                      {
                        option.title
                      }
                    </button>
                  ),
                )
              }
            </div>
          </section>
        )
      }

      <p className="gyan-calendar-print__instruction gyan-calendar-print__instruction--below-preview">
        Choose a portrait format. Each size has its own useful layout and complimentary period.
      </p>

      <div className="gyan-calendar-print__sizes">
        {
          PRINT_SIZES_V2.map(
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
                onClick={() => {
                  setSelectedSize(
                    size.id,
                  );

                  setAdminCount(
                    getAdminCountOptions(
                      size.id,
                    )[0],
                  );
                }}
              >
                <strong>
                  {
                    size.title
                  } · {
                    size.product
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

                <small>
                  {
                    durationLabel(
                      size.durationMonths,
                    )
                  } complimentary · 💎 {
                    size.welcomeGems
                  }
                </small>
              </button>
            ),
          )
        }
      </div>

      {
        error && (
          <div className="gyan-calendar-print__pdf-error">
            {
              error
            }
          </div>
        )
      }

      {
        selected && (
          <div
            className="gyan-calendar-pdf-stage"
            aria-hidden="true"
          >
            <div
              ref={
                pdfSheetRef
              }
              className="gyan-calendar-pdf-sheet-v2"
              style={{
                width:
                  `${pdfRenderWidth}px`,

                height:
                  `${
                    Math.round(
                      pdfRenderWidth *
                      selected.pdfHeightMm /
                      selected.pdfWidthMm,
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
                printSize={
                  selected.id
                }
                artwork={
                  artwork
                }
                record={
                  issuedRecord
                }
                className="gyan-print-card-v2--pdf"
              />
            </div>

            <div
              ref={
                batchRef
              }
              className="gyan-calendar-batch-v2"
            >
              {
                adminBatch.map(
                  (
                    record,
                    index,
                  ) => (
                    <div
                      key={
                        `${record.id}-${index}`
                      }
                      className="gyan-calendar-batch-page-v2"
                      style={{
                        width:
                          `${pdfRenderWidth}px`,

                        height:
                          `${
                            Math.round(
                              pdfRenderWidth *
                              selected.pdfHeightMm /
                              selected.pdfWidthMm,
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
                        printSize={
                          selected.id
                        }
                        artwork={
                          artwork
                        }
                        record={
                          record
                        }
                        className="gyan-print-card-v2--pdf"
                      />
                    </div>
                  ),
                )
              }
            </div>
          </div>
        )
      }

      <div className="gyan-calendar-print__next gyan-calendar-print__next--compact">
        <span className="gyan-calendar-print__next-context">
          {
            selected.title
          }
          {" · "}
          {
            durationLabel(
              selected.durationMonths,
            )
          }
        </span>

        <div className="gyan-calendar-print__action-buttons">
          <button
            type="button"
            className="gyan-calendar-print__email-button"
            onClick={
              emailCalendarLink
            }
            aria-label="Email calendar link"
            title="Email calendar link"
          >
            ✉️
            <span>
              Email
            </span>
          </button>

          <button
            type="button"
            disabled={
              busy
            }
            onClick={() =>
              void generatePdf()
            }
          >
            <span className="gyan-calendar-print__button-label--desktop">
              {
                busy
                  ? "Preparing PDF…"
                  : "🖨️ Print PDF using selected size"
              }
            </span>

            <span className="gyan-calendar-print__button-label--mobile">
              {
                busy
                  ? "Preparing…"
                  : "🖨️ Print PDF"
              }
            </span>
          </button>
        </div>
      </div>
    </section>
  );
}


export default function GyanCalendarPage({
  onClose,
  registrationMode =
    false,
  initialPrintOpen =
    false,
  useCurrentGyan =
    false,
  isIndependent =
    false,
  autoDownloadA5 =
    false,
  onPdfDownloaded,
}: GyanCalendarPageProps) {
  const routeAutoDownloadA5 =
    new URLSearchParams(
      window.location.search,
    ).get(
      "autodownload",
    ) ===
      "1";

  const shouldAutoDownloadA5 =
    autoDownloadA5 ||
    routeAutoDownloadA5;

  const shouldUseCurrentGyan =
    useCurrentGyan ||
    routeAutoDownloadA5;
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
      registrationMode ||
      initialPrintOpen ||
      shouldAutoDownloadA5,
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
        defaultSize={
          shouldAutoDownloadA5
            ? "A5"
            : registrationMode
              ? "A7"
              : shouldUseCurrentGyan ||
                  isIndependent
                ? nearestAccountPrintSize()
                : null
        }
        useCurrentGyan={
          shouldUseCurrentGyan
        }
        isIndependent={
          isIndependent
        }
        autoDownloadA5={
          shouldAutoDownloadA5
        }
        onPdfDownloaded={
          onPdfDownloaded
        }
        onBack={() => {
          if (
            registrationMode ||
            initialPrintOpen
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
        printSize="A5"
        artwork={
          market ===
            "IN"
            ? "GODDESS"
            : "EDUCATION"
        }
      />
    </section>
  );
}
