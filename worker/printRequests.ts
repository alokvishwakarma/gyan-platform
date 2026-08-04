import {
  addStoredBytes,
  assertUploadCapacity,
} from "./storageGuard";

import {
  sendPrintRequestEmail,
} from "./shopNotifications";

interface ShopStatusRow {
  code: string;
  name: string;
  status: string;

  email_address:
    | string
    | null;

  whatsapp_number:
    | string
    | null;
}

interface CreatedPrintRequestRow {
  id: number;
  order_number: string;
  status: string;
  created_at: string;
}

interface StoredPrintFile {
  file: File;
  storageKey: string;
  contentType: string;
}

const MAX_TOTAL_FILE_SIZE =
  25 * 1024 * 1024;

const allowedExtensions =
  new Set([
    "pdf",
    "doc",
    "docx",
    "txt",
    "rtf",
    "jpg",
    "jpeg",
    "png",
  ]);

function createJsonResponse(
  data: unknown,
  status = 200,
): Response {
  return new Response(
    JSON.stringify(data),
    {
      status,
      headers: {
        "content-type":
          "application/json; charset=utf-8",

        "cache-control":
          "no-store",
      },
    },
  );
}

function normalizeShopCode(
  value: string,
): string | null {
  const normalized =
    value
      .trim()
      .toUpperCase();

  return /^[A-Z0-9]{4}$/.test(
    normalized,
  )
    ? normalized
    : null;
}

function getRequiredText(
  formData: FormData,
  name: string,
): string | null {
  const value =
    formData.get(name);

  if (
    typeof value !== "string"
  ) {
    return null;
  }

  const normalized =
    value.trim();

  return normalized
    ? normalized
    : null;
}

function getOptionalText(
  formData: FormData,
  name: string,
): string {
  const value =
    formData.get(name);

  return typeof value === "string"
    ? value.trim()
    : "";
}

function getInteger(
  formData: FormData,
  name: string,
  minimum: number,
  maximum: number,
): number | null {
  const value =
    formData.get(name);

  if (
    typeof value !== "string"
  ) {
    return null;
  }

  const parsed =
    Number(value);

  if (
    !Number.isInteger(parsed) ||
    parsed < minimum ||
    parsed > maximum
  ) {
    return null;
  }

  return parsed;
}

function getFileExtension(
  fileName: string,
): string {
  return (
    fileName
      .split(".")
      .pop()
      ?.toLowerCase() ??
    ""
  );
}

function sanitizeFileName(
  fileName: string,
): string {
  const sanitized =
    fileName
      .trim()
      .replace(
        /[^A-Za-z0-9._-]+/g,
        "_",
      )
      .replace(
        /^_+|_+$/g,
        "",
      );

  return (
    sanitized ||
    "uploaded-file"
  ).slice(0, 180);
}

function generateOrderNumber(
  shopCode: string,
): string {
  const now =
    new Date();

  const datePart = [
    now.getUTCFullYear(),

    String(
      now.getUTCMonth() + 1,
    ).padStart(2, "0"),

    String(
      now.getUTCDate(),
    ).padStart(2, "0"),
  ].join("");

  const randomPart =
    crypto
      .randomUUID()
      .replace(/-/g, "")
      .slice(0, 6)
      .toUpperCase();

  return (
    `PR-${shopCode}-` +
    `${datePart}-${randomPart}`
  );
}

function createStorageKey(
  shopCode: string,
  orderNumber: string,
  file: File,
  index: number,
): string {
  const safeFileName =
    sanitizeFileName(
      file.name,
    );

  const randomPart =
    crypto
      .randomUUID()
      .replace(/-/g, "")
      .slice(0, 10);

  const fileNumber =
    String(index + 1)
      .padStart(2, "0");

  return [
    "print-requests",
    shopCode,
    orderNumber,
    `${fileNumber}-${randomPart}-${safeFileName}`,
  ].join("/");
}

async function deleteStoredFiles(
  env: Env,
  storedFiles:
    StoredPrintFile[],
): Promise<void> {
  if (
    storedFiles.length === 0
  ) {
    return;
  }

  try {
    await env.GYAN_PRINT_FILES.delete(
      storedFiles.map(
        (storedFile) =>
          storedFile.storageKey,
      ),
    );
  } catch (error) {
    console.error(
      "Unable to clean up R2 files:",
      error,
    );
  }
}

async function deletePrintRequest(
  env: Env,
  printRequestId: number,
): Promise<void> {
  try {
    await env.gyan_registry
      .prepare(
        `
          DELETE FROM print_requests
          WHERE id = ?
        `,
      )
      .bind(printRequestId)
      .run();
  } catch (error) {
    console.error(
      "Unable to clean up print request:",
      error,
    );
  }
}

async function handleCreatePrintRequest(
  request: Request,
  env: Env,
  shopCode: string,
): Promise<Response> {
  
    const shop =
  await env.gyan_registry
    .prepare(
      `
        SELECT
          code,
          name,
          status,
          email_address,
          whatsapp_number

        FROM shops

        WHERE code = ?

        LIMIT 1
      `,
    )
    .bind(shopCode)
    .first<ShopStatusRow>();

  if (!shop) {
    return createJsonResponse(
      {
        error:
          "Shop not found.",
      },
      404,
    );
  }

  if (
    shop.status !== "active"
  ) {
    return createJsonResponse(
      {
        error:
          "Shop is not active.",
      },
      403,
    );
  }

  let formData: FormData;

  try {
    formData =
      await request.formData();
  } catch {
    return createJsonResponse(
      {
        error:
          "The submitted form data could not be read.",
      },
      400,
    );
  }

  const customerName =
    getRequiredText(
      formData,
      "customerName",
    );

  const phoneNumber =
    getRequiredText(
      formData,
      "phoneNumber",
    );

  const emailAddress =
    getOptionalText(
      formData,
      "emailAddress",
    );

  const whatsAppNumber =
    getOptionalText(
      formData,
      "whatsAppNumber",
    );

  const whatsAppConsent =
    formData.get(
      "whatsAppConsent",
    ) === "true";

  const estimatedPages =
    getInteger(
      formData,
      "estimatedPages",
      1,
      1000,
    );

  const copies =
    getInteger(
      formData,
      "copies",
      1,
      100,
    );

  const estimatedAmountRupees =
    getInteger(
      formData,
      "estimatedAmountRupees",
      0,
      1_000_000,
    );

  const colorMode =
    getRequiredText(
      formData,
      "colorMode",
    );

  const printSides =
    getRequiredText(
      formData,
      "printSides",
    );

  const paperSize =
    getRequiredText(
      formData,
      "paperSize",
    );

  const instructions =
    getOptionalText(
      formData,
      "instructions",
    );

  if (
    !customerName ||
    !phoneNumber ||
    estimatedPages === null ||
    copies === null ||
    estimatedAmountRupees ===
      null ||
    !colorMode ||
    !printSides ||
    !paperSize
  ) {
    return createJsonResponse(
      {
        error:
          "Required print-request information is missing or invalid.",
      },
      400,
    );
  }

  if (
    ![
      "black-white",
      "color",
    ].includes(colorMode)
  ) {
    return createJsonResponse(
      {
        error:
          "Invalid color setting.",
      },
      400,
    );
  }

  if (
    ![
      "single",
      "double",
    ].includes(printSides)
  ) {
    return createJsonResponse(
      {
        error:
          "Invalid print-side setting.",
      },
      400,
    );
  }

  if (
    ![
      "a4",
      "letter",
      "legal",
    ].includes(paperSize)
  ) {
    return createJsonResponse(
      {
        error:
          "Invalid paper size.",
      },
      400,
    );
  }

  const files =
    formData
      .getAll("files")
      .filter(
        (
          value,
        ): value is File =>
          value instanceof File,
      );

  if (
    files.length === 0
  ) {
    return createJsonResponse(
      {
        error:
          "At least one print file is required.",
      },
      400,
    );
  }

  const invalidFile =
    files.find(
      (file) =>
        !allowedExtensions.has(
          getFileExtension(
            file.name,
          ),
        ),
    );

  if (invalidFile) {
    return createJsonResponse(
      {
        error:
          `Unsupported file type: ${invalidFile.name}`,
      },
      400,
    );
  }

  const totalFileSize =
    files.reduce(
      (
        total,
        file,
      ) =>
        total +
        file.size,
      0,
    );

  if (
    totalFileSize >
    MAX_TOTAL_FILE_SIZE
  ) {
    return createJsonResponse(
      {
        error:
          "The total file size cannot exceed 25 MB.",
      },
      400,
    );
  }

  const storageCapacity =
    await assertUploadCapacity(
      env,
      totalFileSize,
    );

  if (
    !storageCapacity.allowed
  ) {
    return createJsonResponse(
      {
        error:
          storageCapacity.error,

        storage: {
          state: "stopped",

          usedBytes:
            storageCapacity.usedBytes,

          projectedBytes:
            storageCapacity.projectedBytes,

          stopBytes:
            storageCapacity.stopBytes,
        },
      },
      storageCapacity.status,
    );
  }

  const orderNumber =
    generateOrderNumber(
      shopCode,
    );

  let createdRequest:
    CreatedPrintRequestRow | null =
      null;

  const storedFiles:
    StoredPrintFile[] = [];

  try {
    createdRequest =
      await env.gyan_registry
        .prepare(
          `
            INSERT INTO print_requests (
              order_number,
              shop_code,
              customer_name,
              phone_number,
              email_address,
              whatsapp_number,
              whatsapp_consent,
              estimated_pages,
              copies,
              color_mode,
              print_sides,
              paper_size,
              instructions,
              estimated_amount_rupees,
              status
            )
            VALUES (
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              ?,
              'submitted'
            )

            RETURNING
              id,
              order_number,
              status,
              created_at
          `,
        )
        .bind(
          orderNumber,
          shopCode,
          customerName,
          phoneNumber,
          emailAddress ||
            null,
          whatsAppNumber ||
            null,
          whatsAppConsent
            ? 1
            : 0,
          estimatedPages,
          copies,
          colorMode,
          printSides,
          paperSize,
          instructions ||
            null,
          estimatedAmountRupees,
        )
        .first<CreatedPrintRequestRow>();

    if (!createdRequest) {
      throw new Error(
        "The print request could not be created.",
      );
    }

    for (
      let index = 0;
      index < files.length;
      index += 1
    ) {
      const file =
        files[index];

      const contentType =
        file.type ||
        "application/octet-stream";

      const storageKey =
        createStorageKey(
          shopCode,
          orderNumber,
          file,
          index,
        );

      const storedObject =
        await env.GYAN_PRINT_FILES.put(
          storageKey,
          file.stream(),
          {
            httpMetadata: {
              contentType,
            },

            customMetadata: {
              orderNumber,
              shopCode,

              originalFileName:
                file.name,
            },
          },
        );

      if (!storedObject) {
        throw new Error(
          `The file ${file.name} could not be stored.`,
        );
      }

      storedFiles.push({
        file,
        storageKey,
        contentType,
      });
    }

    const fileStatements =
      storedFiles.map(
        (
          storedFile,
        ) =>
          env.gyan_registry
            .prepare(
              `
                INSERT INTO print_request_files (
                  print_request_id,
                  original_file_name,
                  content_type,
                  file_size,
                  storage_key,
                  storage_status
                )
                VALUES (
                  ?,
                  ?,
                  ?,
                  ?,
                  ?,
                  'stored'
                )
              `,
            )
            .bind(
              createdRequest!.id,
              storedFile.file.name,
              storedFile.contentType,
              storedFile.file.size,
              storedFile.storageKey,
            ),
      );

    await env.gyan_registry.batch(
      fileStatements,
    );

    await addStoredBytes(
      env,
      totalFileSize,
    );

    const notification =
  await sendPrintRequestEmail(
    env,
    {
      shopName:
        shop.name,

      shopEmail:
        shop.email_address ?? "",

      orderNumber:
        createdRequest.order_number,

      customerName,
      phoneNumber,

      whatsAppNumber:
        whatsAppNumber ||
        phoneNumber,

      emailAddress,

      fileNames:
        storedFiles.map(
          (storedFile) =>
            storedFile.file.name,
        ),

      estimatedPages,
      copies,
      colorMode,
      printSides,
      paperSize,
      instructions,

      estimatedAmountRupees,
    },
  );

    return createJsonResponse(
      {
        order: {
          orderNumber:
            createdRequest
              .order_number,

          status:
            createdRequest.status,

          createdAt:
            createdRequest
              .created_at,

          fileCount:
            storedFiles.length,
        },

        storage: {
          state:
            storageCapacity
              .warningActive
              ? "warning"
              : "normal",

          warningActive:
            storageCapacity
              .warningActive,

          projectedBytes:
            storageCapacity
              .projectedBytes,

          stopBytes:
            storageCapacity
              .stopBytes,
        },

        notification: {
  emailSent:
    notification.sent,

  emailId:
    notification.emailId,

  reason:
    notification.reason,
},
      },
      201,
    );
  } catch (error) {
    console.error(
      "Print request creation failed:",
      error,
    );

    await deleteStoredFiles(
      env,
      storedFiles,
    );

    if (createdRequest) {
      await deletePrintRequest(
        env,
        createdRequest.id,
      );
    }

    return createJsonResponse(
      {
        error:
          "The print request or its files could not be stored.",
      },
      500,
    );
  }
}

export async function handlePrintRequestsRoute(
  request: Request,
  env: Env,
  url: URL,
): Promise<Response | null> {
  const routeMatch =
    url.pathname.match(
      /^\/api\/shops\/([A-Za-z0-9]{4})\/print-requests$/,
    );

  if (!routeMatch) {
    return null;
  }

  if (
    request.method !== "POST"
  ) {
    return createJsonResponse(
      {
        error:
          "Method not allowed.",
      },
      405,
    );
  }

  const shopCode =
    normalizeShopCode(
      routeMatch[1],
    );

  if (!shopCode) {
    return createJsonResponse(
      {
        error:
          "Invalid shop code.",
      },
      400,
    );
  }

  return handleCreatePrintRequest(
    request,
    env,
    shopCode,
  );
}