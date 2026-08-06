import type { ShopService } from "../types/shop";

export const services: Record<string, ShopService> = {
  printing: {
    id: "printing",
    title: "Upload & Print",
    shortTitle: "Print",
    description:
      "Upload documents from home and collect them when ready.",
    buttonText: "Upload Files",
    icon: "🖨️",
    actionType: "UPLOAD_FILES",
    route: "/request/printing",

    requestFields: [
      {
        id: "files",
        label: "Documents",
        type: "FILE",
        required: true,
        multiple: true,
        accept: ".pdf,.doc,.docx,.jpg,.jpeg,.png",
        helperText:
          "Upload PDF, Word, JPG, JPEG, or PNG files.",
      },
      {
        id: "printColor",
        label: "Print type",
        type: "SELECT",
        required: true,
        options: [
          {
            label: "Black and white",
            value: "BLACK_AND_WHITE",
          },
          {
            label: "Color",
            value: "COLOR",
          },
        ],
      },
      {
        id: "paperSize",
        label: "Paper size",
        type: "SELECT",
        required: true,
        options: [
          {
            label: "A4",
            value: "A4",
          },
          {
            label: "A3",
            value: "A3",
          },
          {
            label: "Letter",
            value: "LETTER",
          },
        ],
      },
      {
        id: "copies",
        label: "Number of copies",
        type: "NUMBER",
        required: true,
        min: 1,
        max: 100,
      },
      {
        id: "printSides",
        label: "Printing sides",
        type: "SELECT",
        required: true,
        options: [
          {
            label: "Single-sided",
            value: "SINGLE",
          },
          {
            label: "Double-sided",
            value: "DOUBLE",
          },
        ],
      },
      {
        id: "instructions",
        label: "Special instructions",
        type: "TEXTAREA",
        placeholder:
          "Page range, stapling, binding, or other details",
      },
    ],
  },

  scanning: {
    id: "scanning",
    title: "Scan Documents",
    shortTitle: "Scan",
    description:
      "Submit a scanning request and collect or receive the PDF.",
    buttonText: "Request Scan",
    icon: "📄",
    actionType: "CREATE_REQUEST",
    route: "/request/scanning",

    requestFields: [
      {
        id: "documentDescription",
        label: "What would you like scanned?",
        type: "TEXTAREA",
        required: true,
        placeholder:
          "For example: 15-page school document",
      },
      {
        id: "scanFormat",
        label: "Output format",
        type: "SELECT",
        required: true,
        options: [
          {
            label: "PDF",
            value: "PDF",
          },
          {
            label: "JPG images",
            value: "JPG",
          },
          {
            label: "PDF and JPG",
            value: "PDF_AND_JPG",
          },
        ],
      },
      {
        id: "scanColor",
        label: "Scan type",
        type: "SELECT",
        required: true,
        options: [
          {
            label: "Color",
            value: "COLOR",
          },
          {
            label: "Grayscale",
            value: "GRAYSCALE",
          },
          {
            label: "Black and white",
            value: "BLACK_AND_WHITE",
          },
        ],
      },
      {
        id: "deliveryMethod",
        label: "How should we send the scanned files?",
        type: "SELECT",
        required: true,
        options: [
          {
            label: "WhatsApp",
            value: "WHATSAPP",
          },
          {
            label: "Email",
            value: "EMAIL",
          },
          {
            label: "USB drive",
            value: "USB",
          },
          {
            label: "Collect from shop",
            value: "SHOP_PICKUP",
          },
        ],
      },
      {
        id: "instructions",
        label: "Additional instructions",
        type: "TEXTAREA",
        placeholder:
          "File naming, page order, separate PDFs, or other details",
      },
    ],
  },

  photocopy: {
    id: "photocopy",
    title: "Photocopy",
    shortTitle: "Photocopy",
    description:
      "Request black-and-white or color photocopies.",
    buttonText: "Create Request",
    icon: "📑",
    actionType: "CREATE_REQUEST",
    route: "/request/photocopy",

    requestFields: [
      {
        id: "documentDescription",
        label: "Document details",
        type: "TEXTAREA",
        required: true,
        placeholder:
          "For example: Aadhaar card, certificates, or 20-page document",
      },
      {
        id: "copyColor",
        label: "Copy type",
        type: "SELECT",
        required: true,
        options: [
          {
            label: "Black and white",
            value: "BLACK_AND_WHITE",
          },
          {
            label: "Color",
            value: "COLOR",
          },
        ],
      },
      {
        id: "copies",
        label: "Number of copies",
        type: "NUMBER",
        required: true,
        min: 1,
        max: 100,
      },
      {
        id: "copySides",
        label: "Copy sides",
        type: "SELECT",
        required: true,
        options: [
          {
            label: "Single-sided",
            value: "SINGLE",
          },
          {
            label: "Double-sided",
            value: "DOUBLE",
          },
        ],
      },
      {
        id: "instructions",
        label: "Additional instructions",
        type: "TEXTAREA",
      },
    ],
  },

  forms: {
    id: "forms",
    title: "Form Assistance",
    shortTitle: "Forms",
    description:
      "Request assistance with supported online and offline forms.",
    buttonText: "Request Help",
    icon: "📋",
    actionType: "CREATE_REQUEST",
    route: "/request/forms",

    requestFields: [
      {
        id: "formType",
        label: "Form or service",
        type: "TEXT",
        required: true,
        placeholder:
          "For example: PAN application, passport form, or scholarship form",
      },
      {
        id: "helpNeeded",
        label: "What help do you need?",
        type: "TEXTAREA",
        required: true,
        placeholder:
          "Briefly describe the assistance required",
      },
      {
        id: "referenceFiles",
        label: "Reference documents",
        type: "FILE",
        multiple: true,
        accept: ".pdf,.jpg,.jpeg,.png",
        helperText:
          "Do not upload passwords, PINs, OTPs, or unnecessary sensitive documents.",
      },
    ],
  },

  vegetables: {
    id: "vegetables",
    title: "Today's Fresh Vegetables",
    shortTitle: "Vegetables",
    description:
      "See what is available today and submit a pickup request.",
    buttonText: "View Vegetables",
    icon: "🥬",
    actionType: "VIEW_CATALOG",
    route: "/catalog/vegetables",
  },

  prescriptionUpload: {
    id: "prescriptionUpload",
    title: "Upload Prescription",
    shortTitle: "Prescription",
    description:
      "Send your prescription for pharmacy review and pickup.",
    buttonText: "Upload Prescription",
    icon: "💊",
    actionType: "UPLOAD_PRESCRIPTION",
    route: "/request/prescriptionUpload",

    requestFields: [
      {
        id: "prescriptionFiles",
        label: "Prescription",
        type: "FILE",
        required: true,
        multiple: true,
        accept: ".pdf,.jpg,.jpeg,.png",
        helperText:
          "The pharmacy will review the prescription before confirming availability.",
      },
      {
        id: "medicineNotes",
        label: "Medicine notes",
        type: "TEXTAREA",
        placeholder:
          "Mention any medicine names or quantities shown in the prescription",
      },
      {
        id: "substitutionPreference",
        label: "Substitution preference",
        type: "SELECT",
        required: true,
        options: [
          {
            label: "Contact me before any change",
            value: "CONTACT_FIRST",
          },
          {
            label: "Only provide the prescribed brand",
            value: "PRESCRIBED_ONLY",
          },
        ],
      },
    ],
  },

  medicineRefill: {
    id: "medicineRefill",
    title: "Medicine Refill",
    shortTitle: "Refill",
    description:
      "Repeat a previously reviewed medicine request.",
    buttonText: "Request Refill",
    icon: "🔁",
    actionType: "REPEAT_REQUEST",
    route: "/requests/repeat",
  },
};