import type {
  PuzzleTile,
} from "../puzzle/puzzleGenerator";

export interface PuzzleCertificateEmailInput {
  puzzleNumber: number;
  puzzleDate: string;

  board: PuzzleTile[];

  qrModules:
    boolean[][];
}

export interface RenderedPuzzleCertificateEmail {
  subject: string;
  html: string;
  text: string;
}


/*
 * ========================================================
 * TILE COLORS
 * ========================================================
 */

function tileBackground(
  tile: PuzzleTile,
): string {
  if (
    tile.hidden
  ) {
    return "#ece5d6";
  }

  switch (
    tile.color
  ) {
    case "red":
      return "#ef5350";

    case "blue":
      return "#42a5f5";

    case "green":
      return "#66bb6a";

    case "yellow":
      return "#fdd835";

    case "purple":
      return "#ab47bc";

    case "orange":
      return "#ffa726";

    default:
      return "#ece5d6";
  }
}


/*
 * ========================================================
 * SOLVED 5×5 BOARD
 * ========================================================
 */

function renderBoard(
  board: PuzzleTile[],
): string {
  const rows:
    string[] = [];

  for (
    let row = 0;
    row < 5;
    row += 1
  ) {
    const cells =
      board
        .slice(
          row * 5,
          row * 5 + 5,
        )
        .map(
          (tile) => `
            <td
              width="30"
              height="30"
              style="
                width:30px;
                height:30px;
                padding:0;
                background:${tileBackground(
                  tile,
                )};
                border:2px solid #fffdf8;
                border-radius:4px;
                color:#5f5543;
                font-family:Arial,sans-serif;
                font-size:13px;
                font-weight:700;
                text-align:center;
                vertical-align:middle;
              "
            >
              ${
                tile.hidden
                  ? "?"
                  : "&nbsp;"
              }
            </td>
          `,
        )
        .join("");

    rows.push(
      `<tr>${cells}</tr>`,
    );
  }

  return rows.join("");
}


/*
 * ========================================================
 * QR CODE
 *
 * Render the QR matrix directly as HTML.
 *
 * No canvas.
 * No Base64 image.
 * No external image.
 * No CID attachment.
 * ========================================================
 */

function renderQr(
  modules: boolean[][],
): string {
  const rows =
    modules
      .map(
        (row) => `
          <tr>
            ${row
              .map(
                (dark) => `
                  <td
                    width="3"
                    height="3"
                    style="
                      width:3px;
                      height:3px;
                      min-width:3px;
                      max-width:3px;
                      padding:0;
                      margin:0;
                      border:0;
                      line-height:0;
                      font-size:0;
                      background:${
                        dark
                          ? "#000000"
                          : "#ffffff"
                      };
                    "
                  ></td>
                `,
              )
              .join("")}
          </tr>
        `,
      )
      .join("");

  return `
    <table
      role="presentation"
      cellspacing="0"
      cellpadding="0"
      border="0"
      style="
        margin-left:auto;
        border-collapse:collapse;
        border-spacing:0;
        background:#ffffff;
        border:10px solid #ffffff;
      "
    >
      ${rows}
    </table>
  `;
}


/*
 * ========================================================
 * CERTIFICATE EMAIL
 * ========================================================
 */

export function renderPuzzleCertificateEmail(
  input:
    PuzzleCertificateEmailInput,
): RenderedPuzzleCertificateEmail {
  const subject =
    `GYAN Puzzle #${input.puzzleNumber} (5×5) — Certificate of Completion`;

  const html = `
    <!doctype html>

    <html>
      <body
        style="
          margin:0;
          padding:0;
          background:#f4f1eb;
        "
      >
        <div
          style="
            max-width:520px;
            margin:0 auto;
            padding:24px 14px;
          "
        >
          <div
            style="
              padding:20px;
              background:#fffdf8;
              border:1px solid #e5d9b8;
              border-radius:16px;
              font-family:Arial,sans-serif;
              color:#102a56;
            "
          >

            <!-- =========================================
                 GYAN + QR
                 ========================================= -->

            <table
              role="presentation"
              width="100%"
              cellspacing="0"
              cellpadding="0"
              border="0"
              style="
                width:100%;
                border-collapse:collapse;
              "
            >
              <tr>

                <td
                  style="
                    text-align:left;
                    vertical-align:top;
                  "
                >
                  <div
                    style="
                      font-size:20px;
                      font-weight:800;
                    "
                  >
                    📖 GYAN
                  </div>

                  <div
                    style="
                      margin-top:2px;
                      color:#7a8492;
                      font-size:11px;
                    "
                  >
                    Daily Puzzle
                  </div>
                </td>


                <td
                  style="
                    text-align:right;
                    vertical-align:top;
                  "
                >
                  ${renderQr(
                    input.qrModules,
                  )}
                </td>

              </tr>
            </table>


            <!-- =========================================
                 TITLE
                 ========================================= -->

            <div
              style="
                margin-top:12px;
                color:#9b7413;
                font-size:11px;
                font-weight:800;
                letter-spacing:1.2px;
                text-align:center;
              "
            >
              CERTIFICATE OF COMPLETION
            </div>


            <div
              style="
                margin-top:7px;
                font-size:22px;
                font-weight:800;
                text-align:center;
              "
            >
              🎓 Puzzle Solver
            </div>


            <div
              style="
                margin-top:5px;
                color:#677487;
                font-size:14px;
                font-weight:700;
                text-align:center;
              "
            >
              GYAN Puzzle #${input.puzzleNumber} (5×5)
            </div>


            <!-- =========================================
                 SOLVED BOARD
                 ========================================= -->

            <table
              role="presentation"
              cellspacing="0"
              cellpadding="0"
              border="0"
              style="
                margin:18px auto 14px;
                border-collapse:separate;
                border-spacing:2px;
              "
            >
              ${renderBoard(
                input.board,
              )}
            </table>


            <!-- =========================================
                 DATE
                 ========================================= -->

            <div
              style="
                color:#7a8492;
                font-size:11px;
                text-align:center;
              "
            >
              ${input.puzzleDate}
            </div>


            <!-- =========================================
                 PLAY AGAIN
                 ========================================= -->

            <div
              style="
                margin-top:16px;
                text-align:center;
              "
            >
              <a
                href="https://gyan.cc"
                style="
                  display:inline-block;
                  padding:10px 18px;
                  background:#1976d2;
                  border-radius:9px;
                  color:#ffffff;
                  font-size:13px;
                  font-weight:700;
                  text-decoration:none;
                "
              >
                Play today's GYAN Puzzle
              </a>
            </div>


            <!-- =========================================
                 FOOTER
                 ========================================= -->

            <div
              style="
                margin-top:17px;
                color:#8a8d92;
                font-size:11px;
                text-align:center;
              "
            >
              gyan.cc
            </div>

          </div>
        </div>
      </body>
    </html>
  `;


  const text =
    [
      "GYAN",
      "Certificate of Completion",
      "",
      "Puzzle Solver",

      `GYAN Puzzle #${input.puzzleNumber} (5×5)`,

      input.puzzleDate,

      "",

      "Play today's GYAN Puzzle:",
      "https://gyan.cc",
    ].join(
      "\n",
    );


  return {
    subject,
    html,
    text,
  };
}