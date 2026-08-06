import type { ShopService } from "../types/shop";

export const services: Record<string, ShopService> = {
  printing: {
    id: "printing",
    title: "Upload & Print",
    shortTitle: "Print",
    description: "Upload documents from home and collect them when ready.",
    buttonText: "Upload Files",
    icon: "🖨️",
    actionType: "UPLOAD_FILES",
    route: "/request/printing",
  },

  scanning: {
    id: "scanning",
    title: "Scan Documents",
    shortTitle: "Scan",
    description: "Submit a scanning request and collect or receive the PDF.",
    buttonText: "Request Scan",
    icon: "📄",
    actionType: "CREATE_REQUEST",
    route: "/request/scanning",
  },

  photocopy: {
    id: "photocopy",
    title: "Photocopy",
    shortTitle: "Photocopy",
    description: "Request black-and-white or color photocopies.",
    buttonText: "Create Request",
    icon: "📑",
    actionType: "CREATE_REQUEST",
    route: "/request/photocopy",
  },

  forms: {
    id: "forms",
    title: "Form Assistance",
    shortTitle: "Forms",
    description: "Request assistance with supported online and offline forms.",
    buttonText: "Request Help",
    icon: "📋",
    actionType: "CREATE_REQUEST",
    route: "/request/forms",
  },

  vegetables: {
    id: "vegetables",
    title: "Today's Fresh Vegetables",
    shortTitle: "Vegetables",
    description: "See what is available today and submit a pickup request.",
    buttonText: "View Vegetables",
    icon: "🥬",
    actionType: "VIEW_CATALOG",
    route: "/catalog/vegetables",
  },

  prescriptionUpload: {
    id: "prescriptionUpload",
    title: "Upload Prescription",
    shortTitle: "Prescription",
    description: "Send your prescription for pharmacy review and pickup.",
    buttonText: "Upload Prescription",
    icon: "💊",
    actionType: "UPLOAD_PRESCRIPTION",
    route: "/request/prescription",
  },

  medicineRefill: {
    id: "medicineRefill",
    title: "Medicine Refill",
    shortTitle: "Refill",
    description: "Repeat a previously reviewed medicine request.",
    buttonText: "Request Refill",
    icon: "🔁",
    actionType: "REPEAT_REQUEST",
    route: "/requests/repeat",
  },
};