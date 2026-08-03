import {
  useCallback,
  useEffect,
  useRef,
  useState,
} from "react";
import QRCode from "qrcode";
import "./PosterGenerator.css";

const POSTER_WIDTH = 1200;
const POSTER_HEIGHT = 1600;

const COLORS = {
  background: "#fff8e8",
  brown: "#5a3218",
  brownMuted: "#80512f",
  border: "#472611",
  black: "#111111",
  white: "#ffffff",
};

function drawRoundedRectangle(
  context: CanvasRenderingContext2D,
  x: number,
  y: number,
  width: number,
  height: number,
  radius: number,
) {
  const safeRadius = Math.min(
    radius,
    width / 2,
    height / 2,
  );

  context.beginPath();
  context.moveTo(x + safeRadius, y);
  context.lineTo(x + width - safeRadius, y);

  context.quadraticCurveTo(
    x + width,
    y,
    x + width,
    y + safeRadius,
  );

  context.lineTo(
    x + width,
    y + height - safeRadius,
  );

  context.quadraticCurveTo(
    x + width,
    y + height,
    x + width - safeRadius,
    y + height,
  );

  context.lineTo(x + safeRadius, y + height);

  context.quadraticCurveTo(
    x,
    y + height,
    x,
    y + height - safeRadius,
  );

  context.lineTo(x, y + safeRadius);

  context.quadraticCurveTo(
    x,
    y,
    x + safeRadius,
    y,
  );

  context.closePath();
}

function drawCenteredText(
  context: CanvasRenderingContext2D,
  text: string,
  y: number,
  font: string,
  color: string,
) {
  context.font = font;
  context.fillStyle = color;
  context.textAlign = "center";
  context.textBaseline = "middle";

  context.fillText(
    text,
    POSTER_WIDTH / 2,
    y,
  );
}

function normalizeShopCode(value: string) {
  return value
    .toUpperCase()
    .replace(/[^A-Z0-9]/g, "")
    .slice(0, 4);
}

export default function PosterGenerator() {
  const previewCanvasRef =
    useRef<HTMLCanvasElement>(null);

  const [shopCode, setShopCode] =
    useState("LKMV");

  const [shopName, setShopName] = useState(
    "Vishwakarma Cyber Cafe",
  );

  const [address, setAddress] = useState(
    "Manas Nagar, Lucknow",
  );

  const [isGenerating, setIsGenerating] =
    useState(false);

  const [generationError, setGenerationError] =
    useState<string | null>(null);

  const safeShopCode = shopCode || "GYAV";

const shopUrl =
  `https://gyan.cc/?shop=${encodeURIComponent(
    safeShopCode,
  )}`;

  const generatePoster = useCallback(
    async () => {
      const canvas = previewCanvasRef.current;

      if (!canvas) {
        return;
      }

      setIsGenerating(true);
      setGenerationError(null);

      try {
        canvas.width = POSTER_WIDTH;
        canvas.height = POSTER_HEIGHT;

        const context =
          canvas.getContext("2d");

        if (!context) {
          throw new Error(
            "Canvas is unavailable.",
          );
        }

        context.clearRect(
          0,
          0,
          POSTER_WIDTH,
          POSTER_HEIGHT,
        );

        context.fillStyle = COLORS.background;

        context.fillRect(
          0,
          0,
          POSTER_WIDTH,
          POSTER_HEIGHT,
        );

        context.strokeStyle = COLORS.border;
        context.lineWidth = 18;

        drawRoundedRectangle(
          context,
          35,
          35,
          POSTER_WIDTH - 70,
          POSTER_HEIGHT - 70,
          45,
        );

        context.stroke();

        drawCenteredText(
          context,
          "SCAN TO CONNECT WITH",
          115,
          "700 46px Arial, sans-serif",
          COLORS.brown,
        );

        context.font =
          "800 138px Arial, sans-serif";
        context.textAlign = "center";
        context.textBaseline = "middle";

        const gyanWidth =
          context.measureText("GYAN").width;

        context.font =
          "700 68px Arial, sans-serif";

        const ccWidth =
          context.measureText(".cc").width;

        const totalBrandWidth =
          gyanWidth + ccWidth + 10;

        const brandStartX =
          POSTER_WIDTH / 2 -
          totalBrandWidth / 2;

        context.font =
          "800 138px Arial, sans-serif";

        context.fillStyle = COLORS.black;
        context.textAlign = "left";

        context.fillText(
          "GYAN",
          brandStartX,
          225,
        );

        context.font =
          "700 68px Arial, sans-serif";

        context.fillStyle = COLORS.brown;

        context.fillText(
          ".cc",
          brandStartX + gyanWidth + 10,
          248,
        );

        const qrCanvas =
          document.createElement("canvas");

        await QRCode.toCanvas(
          qrCanvas,
          shopUrl,
          {
            width: 780,
            margin: 4,
            errorCorrectionLevel: "H",
            color: {
              dark: COLORS.brown,
              light: COLORS.background,
            },
          },
        );

        const qrX = 210;
        const qrY = 320;
        const qrSize = 780;

        context.drawImage(
          qrCanvas,
          qrX,
          qrY,
          qrSize,
          qrSize,
        );

        const badgeSize = 160;

        const badgeX =
          qrX + qrSize / 2 - badgeSize / 2;

        const badgeY =
          qrY + qrSize / 2 - badgeSize / 2;

        context.fillStyle = COLORS.background;
        context.strokeStyle = COLORS.brown;
        context.lineWidth = 8;

        drawRoundedRectangle(
          context,
          badgeX,
          badgeY,
          badgeSize,
          badgeSize,
          25,
        );

        context.fill();
        context.stroke();

        drawCenteredText(
          context,
          "GY",
          badgeY + 55,
          "800 64px Arial, sans-serif",
          COLORS.black,
        );

        drawCenteredText(
          context,
          safeShopCode,
          badgeY + 112,
          "700 24px monospace",
          COLORS.brown,
        );

        context.strokeStyle = COLORS.brown;
        context.lineWidth = 3;

        context.beginPath();
        context.moveTo(160, 1140);
        context.lineTo(1040, 1140);
        context.stroke();

        drawCenteredText(
          context,
          shopName || "GYAN Service Center",
          1205,
          "700 52px Arial, sans-serif",
          COLORS.brown,
        );

        drawCenteredText(
          context,
          address || "Your location",
          1265,
          "600 34px Arial, sans-serif",
          COLORS.brown,
        );

        const serviceY = 1370;

        const services = [
          ["PRINT", "Documents & More"],
          ["OFFICE", "Work Made Easy"],
          ["EDUCATION", "Learn & Grow"],
          ["GOVERNMENT", "Quick & Reliable"],
        ];

        services.forEach(
          ([title, subtitle], index) => {
            const sectionWidth = 260;
            const sectionX =
              80 + index * sectionWidth;

            const centerX =
              sectionX + sectionWidth / 2;

            if (index > 0) {
              context.strokeStyle = "#c6a687";
              context.lineWidth = 2;

              context.beginPath();
              context.moveTo(sectionX, 1325);
              context.lineTo(sectionX, 1450);
              context.stroke();
            }

            context.font =
              "700 24px Arial, sans-serif";

            context.fillStyle = COLORS.brown;
            context.textAlign = "center";

            context.fillText(
              title,
              centerX,
              serviceY,
            );

            context.font =
              "500 18px Arial, sans-serif";

            context.fillStyle =
              COLORS.brownMuted;

            context.fillText(
              subtitle,
              centerX,
              serviceY + 35,
            );
          },
        );

        context.fillStyle = "#f3e1c8";
        context.strokeStyle = COLORS.brown;
        context.lineWidth = 4;

        drawRoundedRectangle(
          context,
          265,
          1490,
          670,
          70,
          28,
        );

        context.fill();
        context.stroke();

        drawCenteredText(
          context,
          "One Place. Many Solutions.",
          1526,
          "700 34px Arial, sans-serif",
          COLORS.brown,
        );
      } catch (error) {
        console.error(
          "Poster generation failed:",
          error,
        );

        setGenerationError(
          error instanceof Error
            ? error.message
            : "Unable to generate poster.",
        );
      } finally {
        setIsGenerating(false);
      }
    },
    [
      safeShopCode,
      shopName,
      address,
      shopUrl,
    ],
  );

  useEffect(() => {
    void generatePoster();
  }, [generatePoster]);

  function downloadPoster() {
    const canvas = previewCanvasRef.current;

    if (!canvas) {
      return;
    }

    canvas.toBlob(
      (blob) => {
        if (!blob) {
          setGenerationError(
            "Unable to prepare the poster download.",
          );
          return;
        }

        const downloadUrl =
          URL.createObjectURL(blob);

        const link =
          document.createElement("a");

        link.href = downloadUrl;
        link.download =
          `GYAN-${safeShopCode}-poster.png`;

        document.body.appendChild(link);
        link.click();
        link.remove();

        URL.revokeObjectURL(downloadUrl);
      },
      "image/png",
      1,
    );
  }

  return (
    <main className="poster-generator">
      <header className="poster-generator__header">
        <div>
          <span>GYAN Admin Tool</span>
          <h1>Poster Generator</h1>
        </div>

        <a
          href="/"
          className="poster-generator__home"
        >
          Return to GYAN
        </a>
      </header>

      <div className="poster-generator__workspace">
        <section
          className="poster-generator__controls"
          aria-label="Poster settings"
        >
          <h2>Shop details</h2>

          <label>
            <span>Four-character shop code</span>

            <input
              type="text"
              value={shopCode}
              maxLength={4}
              placeholder="LKMV"
              onChange={(event) =>
                setShopCode(
                  normalizeShopCode(
                    event.target.value,
                  ),
                )
              }
            />
          </label>

          <label>
            <span>Shop name</span>

            <input
              type="text"
              value={shopName}
              onChange={(event) =>
                setShopName(event.target.value)
              }
            />
          </label>

          <label>
            <span>Address</span>

            <input
              type="text"
              value={address}
              onChange={(event) =>
                setAddress(event.target.value)
              }
            />
          </label>

          <div className="poster-generator__destination">
            <span>QR destination</span>
            <strong>{shopUrl}</strong>
          </div>

          {generationError && (
            <p
              className="poster-generator__error"
              role="alert"
            >
              {generationError}
            </p>
          )}

          <button
            type="button"
            className="poster-generator__download"
            disabled={isGenerating}
            onClick={downloadPoster}
          >
            {isGenerating
              ? "Generating…"
              : "Download poster PNG"}
          </button>

          <p className="poster-generator__note">
            Scan-test the downloaded poster before
            printing multiple copies.
          </p>
        </section>

        <section
          className="poster-generator__preview"
          aria-label="Poster preview"
        >
          <canvas ref={previewCanvasRef} />
        </section>
      </div>
    </main>
  );
}