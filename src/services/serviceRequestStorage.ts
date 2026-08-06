import type { ServiceRequest } from "../types/serviceRequest";

const STORAGE_KEY = "gyan-service-requests";

function readRequests(): ServiceRequest[] {
  try {
    const storedValue = localStorage.getItem(STORAGE_KEY);

    if (!storedValue) {
      return [];
    }

    const parsedValue: unknown = JSON.parse(storedValue);

    return Array.isArray(parsedValue)
      ? (parsedValue as ServiceRequest[])
      : [];
  } catch {
    return [];
  }
}

export function getServiceRequests(): ServiceRequest[] {
  return readRequests();
}

export function saveServiceRequest(
  request: ServiceRequest,
): ServiceRequest {
  const requests = readRequests();

  requests.unshift(request);

  localStorage.setItem(
    STORAGE_KEY,
    JSON.stringify(requests),
  );

  return request;
}

export function getServiceRequestById(
  requestId: string,
): ServiceRequest | undefined {
  return readRequests().find(
    (request) => request.id === requestId,
  );
}