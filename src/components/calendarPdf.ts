import { jsPDF } from "jspdf";
import QRCode from "qrcode";

export type CalendarPdfSize =
  | "A5"
  | "A6"
  | "A7"
  | "A8"
  | "CREDIT_CARD"
  | "BUSINESS_CARD";

export type CalendarPdfMarket =
  | "IN"
  | "US";

export interface CalendarPdfMonth {
  name: string;
  year: number;
  offset: number;
  days: number;
}

interface CalendarPdfOptions {
  size: CalendarPdfSize;
  market: CalendarPdfMarket;
  code: string;
  months: CalendarPdfMonth[];
  rangeLabel: string;
}

interface PhysicalSize {
  width: number;
  height: number;
}

const SIZE_MM: Record<
  CalendarPdfSize,
  PhysicalSize
> = {
  A5: {
    width: 148,
    height: 210,
  },

  A6: {
    width: 105,
    height: 148,
  },

  A7: {
    width: 74,
    height: 105,
  },

  A8: {
    width: 52,
    height: 74,
  },

  CREDIT_CARD: {
    width: 85.6,
    height: 53.98,
  },

  BUSINESS_CARD: {
    width: 88.9,
    height: 50.8,
  },
};

function setTextColor(
  pdf: jsPDF,
  kind:
    | "blue"
    | "orange"
    | "dark"
    | "muted"
    | "white",
): void {
  if (kind === "blue") {
    pdf.setTextColor(
      23,
      74,
      115,
    );

    return;
  }

  if (kind === "orange") {
    pdf.setTextColor(
      233,
      120,
      37,
    );

    return;
  }

  if (kind === "muted") {
    pdf.setTextColor(
      90,
      104,
      114,
    );

    return;
  }

  if (kind === "white") {
    pdf.setTextColor(
      255,
      255,
      255,
    );

    return;
  }

  pdf.setTextColor(
    42,
    57,
    68,
  );
}

function drawMonth(
  pdf: jsPDF,
  month: CalendarPdfMonth,
  x: number,
  y: number,
  width: number,
  height: number,
): void {
  const titleHeight =
    Math.max(
      2.8,
      height * 0.17,
    );

  const weekHeight =
    Math.max(
      2,
      height * 0.12,
    );

  const fontSize =
    Math.max(
      3.1,
      Math.min(
        6.4,
        width / 10.5,
      ),
    );

  pdf.setDrawColor(
    218,
    224,
    228,
  );

  pdf.setLineWidth(
    0.15,
  );

  pdf.roundedRect(
    x,
    y,
    width,
    height,
    Math.min(
      1.2,
      width * 0.05,
    ),
    Math.min(
      1.2,
      width * 0.05,
    ),
  );

  pdf.setFont(
    "helvetica",
    "bold",
  );

  pdf.setFontSize(
    fontSize,
  );

  setTextColor(
    pdf,
    "blue",
  );

  pdf.text(
    `${month.name.slice(
      0,
      3,
    )} ${month.year}`,
    x + width / 2,
    y + titleHeight * 0.72,
    {
      align:
        "center",
    },
  );

  const weekdays =
    [
      "S",
      "M",
      "T",
      "W",
      "T",
      "F",
      "S",
    ];

  const cellWidth =
    width / 7;

  pdf.setFontSize(
    Math.max(
      2.6,
      fontSize * 0.72,
    ),
  );

  weekdays.forEach(
    (
      day,
      index,
    ) => {
      setTextColor(
        pdf,
        index === 0
          ? "orange"
          : "muted",
      );

      pdf.text(
        day,
        x +
          cellWidth *
            (index + 0.5),
        y +
          titleHeight +
          weekHeight * 0.7,
        {
          align:
            "center",
        },
      );
    },
  );

  const rows =
    6;

  const gridY =
    y +
    titleHeight +
    weekHeight;

  const rowHeight =
    Math.max(
      1.6,
      (
        height -
        titleHeight -
        weekHeight -
        0.6
      ) / rows,
    );

  pdf.setFont(
    "helvetica",
    "normal",
  );

  pdf.setFontSize(
    Math.max(
      2.5,
      fontSize * 0.72,
    ),
  );

  for (
    let day = 1;
    day <= month.days;
    day += 1
  ) {
    const position =
      month.offset +
      day -
      1;

    const column =
      position % 7;

    const row =
      Math.floor(
        position / 7,
      );

    setTextColor(
      pdf,
      column === 0
        ? "orange"
        : "dark",
    );

    pdf.text(
      String(day),
      x +
        cellWidth *
          (column + 0.5),
      gridY +
        rowHeight *
          (row + 0.72),
      {
        align:
          "center",
      },
    );
  }
}

function drawCalendarGrid(
  pdf: jsPDF,
  months: CalendarPdfMonth[],
  x: number,
  y: number,
  width: number,
  height: number,
  columns = 3,
): void {
  const rows =
    Math.ceil(
      months.length /
        columns,
    );

  const gap =
    Math.max(
      0.7,
      Math.min(
        1.8,
        width * 0.012,
      ),
    );

  const monthWidth =
    (
      width -
      gap *
        (columns - 1)
    ) /
    columns;

  const monthHeight =
    (
      height -
      gap *
        (rows - 1)
    ) /
    rows;

  months.forEach(
    (
      month,
      index,
    ) => {
      const column =
        index % columns;

      const row =
        Math.floor(
          index / columns,
        );

      drawMonth(
        pdf,
        month,
        x +
          column *
            (monthWidth + gap),
        y +
          row *
            (monthHeight + gap),
        monthWidth,
        monthHeight,
      );
    },
  );
}

function drawQrBlock(
  pdf: jsPDF,
  qrDataUrl: string,
  code: string,
  x: number,
  y: number,
  width: number,
  height: number,
): void {
  const qrSize =
    Math.min(
      width * 0.62,
      height * 0.66,
    );

  const qrX =
    x +
    (
      width -
      qrSize
    ) /
      2;

  pdf.addImage(
    qrDataUrl,
    "PNG",
    qrX,
    y,
    qrSize,
    qrSize,
  );

  setTextColor(
    pdf,
    "blue",
  );

  pdf.setFont(
    "helvetica",
    "bold",
  );

  pdf.setFontSize(
    Math.max(
      5,
      Math.min(
        11,
        width * 0.12,
      ),
    ),
  );

  pdf.text(
    code,
    x + width / 2,
    y +
      qrSize +
      Math.max(
        4,
        height * 0.1,
      ),
    {
      align:
        "center",
    },
  );

  pdf.setFont(
    "helvetica",
    "normal",
  );

  pdf.setFontSize(
    Math.max(
      3.7,
      Math.min(
        7,
        width * 0.07,
      ),
    ),
  );

  setTextColor(
    pdf,
    "muted",
  );

  pdf.text(
    "Your unique GYAN code",
    x + width / 2,
    y +
      qrSize +
      Math.max(
        7,
        height * 0.18,
      ),
    {
      align:
        "center",
    },
  );
}

function drawHeader(
  pdf: jsPDF,
  width: number,
  margin: number,
  rangeLabel: string,
): number {
  const headerHeight =
    Math.max(
      9,
      width * 0.075,
    );

  pdf.setFillColor(
    255,
    249,
    238,
  );

  pdf.rect(
    0,
    0,
    width,
    headerHeight,
    "F",
  );

  pdf.setFont(
    "helvetica",
    "bold",
  );

  pdf.setFontSize(
    Math.max(
      8,
      Math.min(
        18,
        width * 0.095,
      ),
    ),
  );

  setTextColor(
    pdf,
    "blue",
  );

  pdf.text(
    "GYAN",
    margin,
    headerHeight * 0.66,
  );

  pdf.setFontSize(
    Math.max(
      4.5,
      Math.min(
        8,
        width * 0.045,
      ),
    ),
  );

  setTextColor(
    pdf,
    "orange",
  );

  pdf.text(
    rangeLabel,
    width - margin,
    headerHeight * 0.62,
    {
      align:
        "right",
    },
  );

  return headerHeight;
}

function drawFooter(
  pdf: jsPDF,
  width: number,
  height: number,
  footerHeight: number,
): void {
  pdf.setFillColor(
    23,
    74,
    115,
  );

  pdf.rect(
    0,
    height - footerHeight,
    width,
    footerHeight,
    "F",
  );

  pdf.setFont(
    "helvetica",
    "bold",
  );

  pdf.setFontSize(
    Math.max(
      5,
      Math.min(
        9,
        width * 0.055,
      ),
    ),
  );

  setTextColor(
    pdf,
    "white",
  );

  pdf.text(
    "gyan.cc",
    width * 0.06,
    height -
      footerHeight * 0.34,
  );

  pdf.setFont(
    "helvetica",
    "normal",
  );

  pdf.setFontSize(
    Math.max(
      3.4,
      Math.min(
        6,
        width * 0.035,
      ),
    ),
  );

  pdf.text(
    "Learn - Practice - Grow",
    width * 0.94,
    height -
      footerHeight * 0.34,
    {
      align:
        "right",
    },
  );
}

function drawA5(
  pdf: jsPDF,
  options: CalendarPdfOptions,
  qrDataUrl: string,
  width: number,
  height: number,
): void {
  const margin = 6;
  const headerHeight =
    drawHeader(
      pdf,
      width,
      margin,
      options.rangeLabel,
    );

  const footerHeight = 9;

  drawFooter(
    pdf,
    width,
    height,
    footerHeight,
  );

  const usableTop =
    headerHeight + 3;

  const usableBottom =
    height -
    footerHeight -
    3;

  const promoHeight =
    (
      usableBottom -
      usableTop
    ) * 0.38;

  const leftWidth =
    (
      width -
      margin * 2
    ) * 0.6;

  setTextColor(
    pdf,
    "blue",
  );

  pdf.setFont(
    "helvetica",
    "bold",
  );

  pdf.setFontSize(16);

  pdf.text(
    options.market === "IN"
      ? "VIDYA - GYAN - ABHYAS"
      : "Learning for everyone",
    margin,
    usableTop + 12,
  );

  pdf.setFontSize(9);

  setTextColor(
    pdf,
    "muted",
  );

  pdf.text(
    [
      "Online learning",
      "Practice & puzzles",
      "Document help",
      "Print & scan services",
    ],
    margin,
    usableTop + 21,
  );

  drawQrBlock(
    pdf,
    qrDataUrl,
    options.code,
    margin +
      leftWidth +
      4,
    usableTop + 4,
    width -
      margin * 2 -
      leftWidth -
      4,
    promoHeight - 7,
  );

  const calendarY =
    usableTop +
    promoHeight +
    2;

  drawCalendarGrid(
    pdf,
    options.months,
    margin,
    calendarY,
    width - margin * 2,
    usableBottom -
      calendarY,
    3,
  );
}

function drawA6(
  pdf: jsPDF,
  options: CalendarPdfOptions,
  qrDataUrl: string,
  width: number,
  height: number,
): void {
  const margin = 4;
  const headerHeight =
    drawHeader(
      pdf,
      width,
      margin,
      options.rangeLabel,
    );

  const footerHeight = 7;

  drawFooter(
    pdf,
    width,
    height,
    footerHeight,
  );

  const top =
    headerHeight + 2;

  const bottom =
    height -
    footerHeight -
    2;

  const heroHeight =
    (
      bottom -
      top
    ) * 0.43;

  pdf.setFillColor(
    255,
    242,
    211,
  );

  pdf.roundedRect(
    margin,
    top,
    width -
      margin * 2,
    heroHeight,
    2,
    2,
    "F",
  );

  pdf.setFont(
    "helvetica",
    "bold",
  );

  setTextColor(
    pdf,
    "orange",
  );

  pdf.setFontSize(23);

  pdf.text(
    options.market === "IN"
      ? "VIDYA"
      : "LEARN",
    margin + 7,
    top + 15,
  );

  setTextColor(
    pdf,
    "blue",
  );

  pdf.setFontSize(11);

  pdf.text(
    options.market === "IN"
      ? "Maa Saraswati"
      : "GYAN Learning",
    margin + 7,
    top + 24,
  );

  pdf.setFont(
    "helvetica",
    "normal",
  );

  pdf.setFontSize(7);

  setTextColor(
    pdf,
    "muted",
  );

  pdf.text(
    options.market === "IN"
      ? "Knowledge - Learning - Practice"
      : "Learn - Practice - Grow",
    margin + 7,
    top + 31,
  );

  drawQrBlock(
    pdf,
    qrDataUrl,
    options.code,
    width * 0.62,
    top + 4,
    width * 0.32,
    heroHeight - 7,
  );

  drawCalendarGrid(
    pdf,
    options.months,
    margin,
    top +
      heroHeight +
      2,
    width -
      margin * 2,
    bottom -
      (
        top +
        heroHeight +
        2
      ),
    3,
  );
}

function drawA7(
  pdf: jsPDF,
  options: CalendarPdfOptions,
  qrDataUrl: string,
  width: number,
  height: number,
): void {
  const margin = 3;
  const headerHeight =
    drawHeader(
      pdf,
      width,
      margin,
      options.rangeLabel,
    );

  const footerHeight = 6;

  drawFooter(
    pdf,
    width,
    height,
    footerHeight,
  );

  const top =
    headerHeight + 1.5;

  const bottom =
    height -
    footerHeight -
    1.5;

  const promoHeight =
    (
      bottom -
      top
    ) * 0.38;

  pdf.setFont(
    "helvetica",
    "bold",
  );

  pdf.setFontSize(8);

  setTextColor(
    pdf,
    "blue",
  );

  pdf.text(
    "GYAN Features",
    margin,
    top + 6,
  );

  pdf.setFont(
    "helvetica",
    "normal",
  );

  pdf.setFontSize(5);

  setTextColor(
    pdf,
    "muted",
  );

  pdf.text(
    [
      "Learning & practice",
      "Puzzles",
      "Documents",
      "Print & scan",
    ],
    margin,
    top + 11,
  );

  drawQrBlock(
    pdf,
    qrDataUrl,
    options.code,
    width * 0.57,
    top + 1,
    width * 0.38,
    promoHeight - 2,
  );

  drawCalendarGrid(
    pdf,
    options.months,
    margin,
    top +
      promoHeight +
      1,
    width -
      margin * 2,
    bottom -
      (
        top +
        promoHeight +
        1
      ),
    3,
  );
}

function drawA8(
  pdf: jsPDF,
  options: CalendarPdfOptions,
  qrDataUrl: string,
  width: number,
  height: number,
): void {
  const margin = 3;

  pdf.setFont(
    "helvetica",
    "bold",
  );

  pdf.setFontSize(12);

  setTextColor(
    pdf,
    "blue",
  );

  pdf.text(
    "GYAN",
    width / 2,
    7,
    {
      align:
        "center",
    },
  );

  drawQrBlock(
    pdf,
    qrDataUrl,
    options.code,
    margin,
    11,
    width - margin * 2,
    height * 0.52,
  );

  pdf.setFont(
    "helvetica",
    "bold",
  );

  pdf.setFontSize(6);

  setTextColor(
    pdf,
    "orange",
  );

  pdf.text(
    "SCAN TO JOIN",
    width / 2,
    height * 0.69,
    {
      align:
        "center",
    },
  );

  pdf.setFont(
    "helvetica",
    "normal",
  );

  pdf.setFontSize(4.4);

  setTextColor(
    pdf,
    "muted",
  );

  pdf.text(
    [
      options.rangeLabel,
      "Online learning & practice",
      "gyan.cc",
    ],
    width / 2,
    height * 0.77,
    {
      align:
        "center",
    },
  );
}

function drawCard(
  pdf: jsPDF,
  options: CalendarPdfOptions,
  qrDataUrl: string,
  width: number,
  height: number,
): void {
  const margin = 3;
  const qrWidth =
    height - margin * 2;

  drawQrBlock(
    pdf,
    qrDataUrl,
    options.code,
    width -
      qrWidth -
      margin,
    margin,
    qrWidth,
    height -
      margin * 2,
  );

  const leftWidth =
    width -
    qrWidth -
    margin * 3;

  pdf.setFont(
    "helvetica",
    "bold",
  );

  pdf.setFontSize(11);

  setTextColor(
    pdf,
    "blue",
  );

  pdf.text(
    "GYAN",
    margin,
    8,
  );

  pdf.setFontSize(5.5);

  setTextColor(
    pdf,
    "orange",
  );

  pdf.text(
    options.rangeLabel,
    margin,
    13,
  );

  pdf.setFont(
    "helvetica",
    "normal",
  );

  pdf.setFontSize(4.5);

  setTextColor(
    pdf,
    "muted",
  );

  pdf.text(
    [
      "Learn - Practice - Grow",
      "",
      "Online learning",
      "Puzzles & practice",
      "Useful digital services",
      "",
      "gyan.cc",
    ],
    margin,
    19,
  );

  /*
   * A tiny four-month strip keeps the card
   * calendar-like without making the QR too small.
   */
  drawCalendarGrid(
    pdf,
    options.months.slice(
      0,
      4,
    ),
    margin,
    height - 19,
    leftWidth,
    16,
    2,
  );
}

export async function downloadCalendarPdf(
  options: CalendarPdfOptions,
): Promise<void> {
  const physical =
    SIZE_MM[
      options.size
    ];

  const orientation =
    physical.width >
    physical.height
      ? "landscape"
      : "portrait";

  const pdf =
    new jsPDF({
      orientation,
      unit:
        "mm",
      format: [
        physical.width,
        physical.height,
      ],
      compress:
        true,
    });

  const joinUrl =
    `https://gyan.cc/?student=${encodeURIComponent(
      options.code,
    )}`;

  const qrDataUrl =
    await QRCode.toDataURL(
      joinUrl,
      {
        width:
          512,
        margin:
          1,
        errorCorrectionLevel:
          "M",
      },
    );

  if (
    options.size ===
    "A5"
  ) {
    drawA5(
      pdf,
      options,
      qrDataUrl,
      physical.width,
      physical.height,
    );
  } else if (
    options.size ===
    "A6"
  ) {
    drawA6(
      pdf,
      options,
      qrDataUrl,
      physical.width,
      physical.height,
    );
  } else if (
    options.size ===
    "A7"
  ) {
    drawA7(
      pdf,
      options,
      qrDataUrl,
      physical.width,
      physical.height,
    );
  } else if (
    options.size ===
    "A8"
  ) {
    drawA8(
      pdf,
      options,
      qrDataUrl,
      physical.width,
      physical.height,
    );
  } else {
    drawCard(
      pdf,
      options,
      qrDataUrl,
      physical.width,
      physical.height,
    );
  }

  const safeRange =
    options.rangeLabel
      .replace(
        /[^A-Za-z0-9]+/g,
        "-",
      )
      .replace(
        /^-|-$/g,
        "",
      );

  pdf.save(
    `GYAN-${options.size}-${safeRange}-${options.code}.pdf`,
  );
}
