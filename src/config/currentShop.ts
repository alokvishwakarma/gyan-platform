import type { ShopConfig } from "../types/shop";

export const currentShop: ShopConfig = {
  id: "shop-001",
  slug: "gyan-cyber-cafe",
  name: "GYAN Cyber Cafe",
  tagline: "Your Digital Seva Partner",
  location: "Lucknow, Uttar Pradesh",
  businessType: "CYBER_CAFE",

  featuredServiceId: "printing",

  serviceIds: [
    "printing",
    "photocopy",
    "scanning",
    "forms",
  ],

  catalogEnabled: false,
  fileUploadEnabled: true,
  pickupEnabled: true,
  recurringRequestsEnabled: false,
};