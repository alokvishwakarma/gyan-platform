const VISITOR_KEY =
  "gyan-anonymous-visitor-v1";

const DAILY_VISIT_KEY =
  "gyan-analytics-last-visit-date-v1";

function todayUtc(): string {
  return new Date()
    .toISOString()
    .slice(0, 10);
}

function getVisitorId(): string {
  let value =
    window.localStorage.getItem(
      VISITOR_KEY,
    );

  if (value) {
    return value;
  }

  value = crypto.randomUUID();

  window.localStorage.setItem(
    VISITOR_KEY,
    value,
  );

  return value;
}

export async function trackDailyVisit():
  Promise<void> {
  try {
    const today = todayUtc();

    const lastTracked =
      window.localStorage.getItem(
        DAILY_VISIT_KEY,
      );

    if (lastTracked === today) {
      return;
    }

    const visitorId =
      getVisitorId();

    const response =
      await fetch(
        "/api/analytics/visit",
        {
          method: "POST",
          headers: {
            "content-type":
              "application/json",
          },
          body: JSON.stringify({
            visitorId,
          }),
          keepalive: true,
        },
      );

    if (response.ok) {
      window.localStorage.setItem(
        DAILY_VISIT_KEY,
        today,
      );
    }
  } catch (error) {
    console.debug(
      "Analytics visit was not recorded:",
      error,
    );
  }
}
