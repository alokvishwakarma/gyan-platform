export type BusinessType =
  | "CYBER_CAFE"
  | "FARM_PRODUCE"
  | "PHARMACY"
  | "GROCERY"
  | "REPAIR"
  | "GENERAL_SERVICES";

export type ServiceActionType =
  | "UPLOAD_FILES"
  | "CREATE_REQUEST"
  | "VIEW_CATALOG"
  | "UPLOAD_PRESCRIPTION"
  | "REPEAT_REQUEST";

export type RequestFieldType =
  | "TEXT"
  | "TEXTAREA"
  | "NUMBER"
  | "SELECT"
  | "FILE"
  | "DATE"
  | "TIME";

export interface RequestFieldOption {
  label: string;
  value: string;
}

export interface RequestField {
  id: string;
  label: string;
  type: RequestFieldType;
  required?: boolean;
  placeholder?: string;
  accept?: string;
  multiple?: boolean;
  min?: number;
  max?: number;
  options?: RequestFieldOption[];
  helperText?: string;
}

export interface ShopService {
  id: string;
  title: string;
  shortTitle: string;
  description: string;
  buttonText: string;
  icon: string;
  actionType: ServiceActionType;
  route: string;
  requestFields?: RequestField[];
}

export interface ShopConfig {
  id: string;
  slug: string;
  name: string;
  tagline: string;
  location: string;
  businessType: BusinessType;

  featuredServiceId: string;
  serviceIds: string[];

  catalogEnabled: boolean;
  fileUploadEnabled: boolean;
  pickupEnabled: boolean;
  recurringRequestsEnabled: boolean;
}