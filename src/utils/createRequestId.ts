export function createRequestId(): string {
  const datePart = new Date()
    .toISOString()
    .slice(0, 10)
    .replaceAll("-", "");

  const randomPart = Math.floor(
    1000 + Math.random() * 9000,
  );

  return `REQ-${datePart}-${randomPart}`;
}