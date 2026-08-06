export type ServiceRequestStatus =
  | "SUBMITTED"
  | "REVIEWING"
  | "ACCEPTED"
  | "IN_PROGRESS"
  | "READY"
  | "COMPLETED"
  | "CANCELLED";

export interface ServiceRequestCustomer {
  name: string;
  phone: string;
  email?: string;
}

export interface ServiceRequest {
  id: string;
  shopId: string;
  serviceId: string;
  status: ServiceRequestStatus;

  customer: ServiceRequestCustomer;

  requestedDate?: string;
  requestedTime?: string;

  values: Record<string, string | number | string[]>;
  fileNames: string[];

  createdAt: string;
}