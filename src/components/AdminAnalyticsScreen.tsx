import {
  useEffect,
  useMemo,
  useRef,
  useState,
} from "react";

import * as maplibregl
  from "maplibre-gl";

import type {
  Map,
} from "maplibre-gl";

import type {
  FeatureCollection,
} from "geojson";

import "maplibre-gl/dist/maplibre-gl.css";
import "./AdminAnalyticsScreen.css";


type AnalyticsPeriod =
  | "today"
  | "7d"
  | "30d"
  | "1y";

interface AnalyticsSummary {
  uniqueVisitors: number;
  visits: number;
  registeredUsers: number;
  registeredShops: number;
  newShops: number;
  adsSubmitted: number;
  adsApproved: number;
  serviceRequests: number;
  requestsToShops: number;
  requestsToSupport: number;
  puzzleWins:
    Record<string, number>;
}

interface AnalyticsMapPoint {
  countryCode: string;
  region: string;
  city: string;
  latitude: number | null;
  longitude: number | null;
  uniqueVisitors: number;
  visits: number;
}

interface AnalyticsTrendPoint {
  date: string;
  uniqueVisitors: number;
  visits: number;
}

interface AnalyticsResponse {
  period: AnalyticsPeriod;
  days: number;
  summary: AnalyticsSummary;
  mapPoints: AnalyticsMapPoint[];
  trend: AnalyticsTrendPoint[];
  error?: string;
}

type AnalyticsDetailMetric =
  | "visitors"
  | "visits"
  | "users"
  | "shops"
  | "ads"
  | "ads-approved"
  | "requests"
  | "requests-shops"
  | "requests-support"
  | "shops-new"
  | "puzzle-5"
  | "puzzle-7"
  | "location"
  | "trend-date";

interface AnalyticsDetailRow {
  id: string;
  title: string;
  subtitle: string;
  meta: string;
  badge?: string;
}

interface AnalyticsDetailResponse {
  metric: AnalyticsDetailMetric;
  period: AnalyticsPeriod;
  title: string;
  total: number;
  rows: AnalyticsDetailRow[];
  error?: string;
}

interface AnalyticsDetailOptions {
  country?: string;
  region?: string;
  city?: string;
  date?: string;
}

interface AdminAnalyticsScreenProps {
  onBack: () => void;
}

const PERIODS: {
  key: AnalyticsPeriod;
  label: string;
}[] = [
  { key: "today", label: "Today" },
  { key: "7d", label: "7 Days" },
  { key: "30d", label: "30 Days" },
  { key: "1y", label: "1 Year" },
];

function formatNumber(
  value: number,
): string {
  return new Intl
    .NumberFormat()
    .format(value);
}

function createGeoJson(
  points: AnalyticsMapPoint[],
): FeatureCollection {
  return {
    type: "FeatureCollection",
    features: points
      .filter((point) =>
        point.latitude != null &&
        point.longitude != null,
      )
      .map((point) => ({
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: [
            point.longitude!,
            point.latitude!,
          ],
        },
        properties: {
          countryCode:
            point.countryCode,
          region: point.region,
          city: point.city,
          uniqueVisitors:
            point.uniqueVisitors,
          visits: point.visits,
        },
      })),
  };
}

export default function AdminAnalyticsScreen({
  onBack,
}: AdminAnalyticsScreenProps) {
  const [period, setPeriod] =
    useState<AnalyticsPeriod>(
      "today",
    );

  const [data, setData] =
    useState<AnalyticsResponse | null>(
      null,
    );

  const [loading, setLoading] =
    useState(true);

  const [error, setError] =
    useState("");

  const [detail, setDetail] =
    useState<AnalyticsDetailResponse | null>(null);

  const [detailLoading, setDetailLoading] =
    useState(false);

  const [detailError, setDetailError] =
    useState("");

  async function openDetails(
    metric: AnalyticsDetailMetric,
    options: AnalyticsDetailOptions = {},
  ): Promise<void> {
    setDetailLoading(true);
    setDetailError("");

    const params =
      new URLSearchParams({
        metric,
        period,
      });

    if (options.country) {
      params.set(
        "country",
        options.country,
      );
    }

    if (options.region) {
      params.set(
        "region",
        options.region,
      );
    }

    if (options.city) {
      params.set(
        "city",
        options.city,
      );
    }

    if (options.date) {
      params.set(
        "date",
        options.date,
      );
    }

    try {
      const response =
        await fetch(
          `/api/admin/analytics/details?${params.toString()}`,
          {
            credentials: "include",
          },
        );

      const result =
        await response.json() as
          AnalyticsDetailResponse;

      if (!response.ok) {
        throw new Error(
          result.error ??
            "Analytics details could not be loaded.",
        );
      }

      setDetail(result);
    } catch (caughtError) {
      setDetailError(
        caughtError instanceof Error
          ? caughtError.message
          : "Analytics details could not be loaded.",
      );

      setDetail({
        metric,
        period,
        title: "Analytics details",
        total: 0,
        rows: [],
      });
    } finally {
      setDetailLoading(false);
    }
  }

  const mapElementRef =
    useRef<HTMLDivElement | null>(
      null,
    );

  const mapRef =
    useRef<Map | null>(null);

  useEffect(() => {
    const controller =
      new AbortController();

    async function load():
      Promise<void> {
      setLoading(true);
      setError("");

      try {
        const response =
          await fetch(
            `/api/admin/analytics?period=${encodeURIComponent(period)}`,
            {
              credentials: "include",
              signal:
                controller.signal,
            },
          );

        const result =
          await response.json() as
            AnalyticsResponse;

        if (!response.ok) {
          throw new Error(
            result.error ??
              "Analytics could not be loaded.",
          );
        }

        setData(result);
      } catch (caughtError) {
        if (
          caughtError instanceof
            DOMException &&
          caughtError.name ===
            "AbortError"
        ) {
          return;
        }

        setError(
          caughtError instanceof Error
            ? caughtError.message
            : "Analytics could not be loaded.",
        );
      } finally {
        if (!controller.signal.aborted) {
          setLoading(false);
        }
      }
    }

    void load();

    return () => {
      controller.abort();
    };
  }, [period]);

  const geoJson =
    useMemo(
      () =>
        createGeoJson(
          data?.mapPoints ?? [],
        ),
      [data?.mapPoints],
    );

  useEffect(() => {
    if (!mapElementRef.current) {
      return;
    }

    if (!mapRef.current) {
      const map =
        new maplibregl.Map({
          container:
            mapElementRef.current,
          center: [10, 20],
          zoom: 1.1,
          style: {
            version: 8,
            sources: {
              osm: {
                type: "raster",
                tiles: [
                  "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                ],
                tileSize: 256,
                attribution:
                  "© OpenStreetMap contributors",
              },
            },
            layers: [
              {
                id: "osm",
                type: "raster",
                source: "osm",
              },
            ],
          },
        });

      map.addControl(
        new maplibregl
          .NavigationControl({
            showCompass: false,
          }),
        "top-right",
      );

      map.on("load", () => {
        map.addSource(
          "analytics",
          {
            type: "geojson",
            data: geoJson,
          },
        );

        map.addLayer({
          id: "analytics-bubbles",
          type: "circle",
          source: "analytics",
          paint: {
            "circle-radius": [
              "interpolate",
              ["linear"],
              ["get", "uniqueVisitors"],
              1, 6,
              10, 12,
              100, 24,
              1000, 42,
            ],
            "circle-opacity": 0.72,
            "circle-stroke-width": 2,
            "circle-stroke-color":
              "#ffffff",
          },
        });

        map.on(
          "click",
          "analytics-bubbles",
          (
            event:
              maplibregl.MapMouseEvent & {
                features?:
                  maplibregl.MapGeoJSONFeature[];
              },
          ) => {
            const feature =
              event.features?.[0];

            if (
              !feature ||
              feature.geometry.type !==
                "Point"
            ) {
              return;
            }

            const properties =
              feature.properties ?? {};

            void openDetails(
              "location",
              {
                country:
                  String(
                    properties.countryCode ??
                      "",
                  ),

                region:
                  String(
                    properties.region ??
                      "",
                  ),

                city:
                  String(
                    properties.city ??
                      "",
                  ),
              },
            );
          },
        );

        map.on(
          "mouseenter",
          "analytics-bubbles",
          () => {
            map.getCanvas()
              .style.cursor =
                "pointer";
          },
        );

        map.on(
          "mouseleave",
          "analytics-bubbles",
          () => {
            map.getCanvas()
              .style.cursor = "";
          },
        );
      });

      mapRef.current = map;

      return () => {
        map.remove();
        mapRef.current = null;
      };
    }

    const map = mapRef.current;

    if (!map.isStyleLoaded()) {
      return;
    }

    const source =
      map.getSource(
        "analytics",
      ) as
        maplibregl.GeoJSONSource |
        undefined;

    source?.setData(geoJson);
  }, [geoJson]);

  const summary = data?.summary;

  const topPlaces =
    useMemo(
      () =>
        [...(data?.mapPoints ?? [])]
          .sort(
            (a, b) =>
              b.uniqueVisitors -
              a.uniqueVisitors,
          )
          .slice(0, 8),
      [data?.mapPoints],
    );

  return (
    <main className="admin-analytics">
      <header className="admin-analytics__header">
        <button
          type="button"
          className="admin-analytics__brand"
          onClick={onBack}
        >
          <span aria-hidden="true">
            📖
          </span>
          <span>
            <strong>GYAN</strong>
            <small>Analytics</small>
          </span>
        </button>

        <button
          type="button"
          className="admin-analytics__back"
          onClick={onBack}
        >
          Admin
        </button>
      </header>

      <section className="admin-analytics__content">
        <div className="admin-analytics__title-row">
          <div>
            <span>
              Platform activity
            </span>
            <h1>Analytics</h1>
          </div>

          <div className="admin-analytics__periods">
            {PERIODS.map((option) => (
              <button
                type="button"
                key={option.key}
                className={
                  period === option.key
                    ? "admin-analytics__period admin-analytics__period--active"
                    : "admin-analytics__period"
                }
                onClick={() =>
                  setPeriod(option.key)
                }
              >
                {option.label}
              </button>
            ))}
          </div>
        </div>

        {loading && !data && (
          <p className="admin-analytics__state">
            Loading analytics…
          </p>
        )}

        {error && (
          <p className="admin-analytics__state admin-analytics__state--error">
            {error}
          </p>
        )}

        {summary && (
          <>
            <section className="admin-analytics__metrics">
              <button
                type="button"
                className="admin-analytics__metric-button"
                onClick={() => {
                  void openDetails("visitors");
                }}
              >
                <span>👥</span>
                <strong>{formatNumber(summary.uniqueVisitors)}</strong>
                <small>Unique visitors</small>
              </button>

              <button
                type="button"
                className="admin-analytics__metric-button"
                onClick={() => {
                  void openDetails("visits");
                }}
              >
                <span>👁️</span>
                <strong>{formatNumber(summary.visits)}</strong>
                <small>Visits</small>
              </button>

              <button
                type="button"
                className="admin-analytics__metric-button"
                onClick={() => {
                  void openDetails("users");
                }}
              >
                <span>👤</span>
                <strong>{formatNumber(summary.registeredUsers)}</strong>
                <small>Registered users</small>
              </button>

              <button
                type="button"
                className="admin-analytics__metric-button"
                onClick={() => {
                  void openDetails("shops");
                }}
              >
                <span>🏪</span>
                <strong>{formatNumber(summary.registeredShops)}</strong>
                <small>Shops</small>
              </button>

              <button
                type="button"
                className="admin-analytics__metric-button"
                onClick={() => {
                  void openDetails("ads");
                }}
              >
                <span>📣</span>
                <strong>{formatNumber(summary.adsSubmitted)}</strong>
                <small>Ads submitted</small>
              </button>

              <button
                type="button"
                className="admin-analytics__metric-button"
                onClick={() => {
                  void openDetails("requests");
                }}
              >
                <span>🙋</span>
                <strong>{formatNumber(summary.serviceRequests)}</strong>
                <small>Service requests</small>
              </button>
            </section>

            <section className="admin-analytics__map-card">
              <div className="admin-analytics__section-heading">
                <div>
                  <span>
                    Geographic activity
                  </span>
                  <h2>Visitor map</h2>
                </div>
                <small>
                  Circle size = unique visitors
                </small>
              </div>

              <div
                ref={mapElementRef}
                className="admin-analytics__map"
              />
            </section>

            <div className="admin-analytics__two-column">
              <section className="admin-analytics__panel">
                <div className="admin-analytics__section-heading">
                  <div>
                    <span>Puzzle</span>
                    <h2>Winners</h2>
                  </div>
                </div>

                <div className="admin-analytics__puzzle-grid">
                  <button
                    type="button"
                    className="admin-analytics__drill-button"
                    onClick={() => {
                      void openDetails("puzzle-5");
                    }}
                  >
                    <strong>
                      {formatNumber(
                        summary.puzzleWins["5x5"] ?? 0,
                      )}
                    </strong>
                    <small>5×5 winners</small>
                  </button>

                  <button
                    type="button"
                    className="admin-analytics__drill-button"
                    onClick={() => {
                      void openDetails("puzzle-7");
                    }}
                  >
                    <strong>
                      {formatNumber(
                        summary.puzzleWins["7x7"] ?? 0,
                      )}
                    </strong>
                    <small>7×7 winners</small>
                  </button>
                </div>
              </section>

              <section className="admin-analytics__panel">
                <div className="admin-analytics__section-heading">
                  <div>
                    <span>
                      Marketplace
                    </span>
                    <h2>Activity</h2>
                  </div>
                </div>

                <div className="admin-analytics__list">
                  <button
                    type="button"
                    onClick={() => {
                      void openDetails("ads-approved");
                    }}
                  >
                    <span>Ads approved</span>
                    <strong>{formatNumber(summary.adsApproved)}</strong>
                  </button>

                  <button
                    type="button"
                    onClick={() => {
                      void openDetails("requests-shops");
                    }}
                  >
                    <span>Requests → shops</span>
                    <strong>{formatNumber(summary.requestsToShops)}</strong>
                  </button>

                  <button
                    type="button"
                    onClick={() => {
                      void openDetails("requests-support");
                    }}
                  >
                    <span>Requests → support</span>
                    <strong>{formatNumber(summary.requestsToSupport)}</strong>
                  </button>

                  <button
                    type="button"
                    onClick={() => {
                      void openDetails("shops-new");
                    }}
                  >
                    <span>New shops</span>
                    <strong>{formatNumber(summary.newShops)}</strong>
                  </button>
                </div>
              </section>
            </div>

            <section className="admin-analytics__panel">
              <div className="admin-analytics__section-heading">
                <div>
                  <span>Geography</span>
                  <h2>Top locations</h2>
                </div>
              </div>

              <div className="admin-analytics__locations">
                {topPlaces.map((place) => (
                  <button
                    type="button"
                    className="admin-analytics__location-button"
                    key={`${place.countryCode}|${place.region}|${place.city}`}
                    onClick={() => {
                      void openDetails(
                        "location",
                        {
                          country: place.countryCode,
                          region: place.region,
                          city: place.city,
                        },
                      );
                    }}
                  >
                    <div>
                      <strong>{place.city}</strong>
                      <small>
                        {[place.region, place.countryCode]
                          .filter(Boolean)
                          .join(", ")}
                      </small>
                    </div>

                    <div>
                      <strong>{formatNumber(place.uniqueVisitors)}</strong>
                      <small>
                        {formatNumber(place.visits)} visits
                      </small>
                    </div>
                  </button>
                ))}
              </div>
            </section>

            <section className="admin-analytics__panel">
              <div className="admin-analytics__section-heading">
                <div>
                  <span>Trend</span>
                  <h2>Daily activity</h2>
                </div>
              </div>

              <div className="admin-analytics__trend">
                {(data?.trend ?? []).map(
                  (point) => (
                    <button
                      type="button"
                      className="admin-analytics__trend-button"
                      key={point.date}
                      onClick={() => {
                        void openDetails(
                          "trend-date",
                          {
                            date: point.date,
                          },
                        );
                      }}
                    >
                      <span>{point.date}</span>
                      <strong>
                        {formatNumber(point.uniqueVisitors)} visitors
                      </strong>
                      <small>
                        {formatNumber(point.visits)} visits
                      </small>
                    </button>
                  ),
                )}
              </div>
            </section>
          </>
        )}
      </section>


      {(detail || detailLoading || detailError) && (
        <div
          className="admin-analytics__detail-overlay"
          role="presentation"
          onClick={() => {
            setDetail(null);
            setDetailError("");
          }}
        >
          <section
            className="admin-analytics__detail-panel"
            role="dialog"
            aria-modal="true"
            aria-label="Analytics details"
            onClick={(event) =>
              event.stopPropagation()
            }
          >
            <header className="admin-analytics__detail-header">
              <div>
                <span>Drill down</span>
                <h2>
                  {detail?.title ?? "Analytics details"}
                </h2>
              </div>

              <button
                type="button"
                aria-label="Close"
                onClick={() => {
                  setDetail(null);
                  setDetailError("");
                }}
              >
                ×
              </button>
            </header>

            {detailLoading ? (
              <p className="admin-analytics__detail-state">
                Loading rows…
              </p>
            ) : detailError ? (
              <p className="admin-analytics__detail-state admin-analytics__detail-state--error">
                {detailError}
              </p>
            ) : (
              <>
                <div className="admin-analytics__detail-count">
                  Showing {formatNumber(detail?.total ?? 0)} rows
                </div>

                {(detail?.rows ?? []).length === 0 ? (
                  <p className="admin-analytics__detail-state">
                    No rows for this period.
                  </p>
                ) : (
                  <div className="admin-analytics__detail-list">
                    {(detail?.rows ?? []).map((row) => (
                      <article key={row.id}>
                        <div className="admin-analytics__detail-row-heading">
                          <strong>{row.title}</strong>
                          {row.badge && (
                            <span>{row.badge}</span>
                          )}
                        </div>

                        {row.subtitle && (
                          <p>{row.subtitle}</p>
                        )}

                        {row.meta && (
                          <small>{row.meta}</small>
                        )}
                      </article>
                    ))}
                  </div>
                )}
              </>
            )}
          </section>
        </div>
      )}

    </main>
  );
}