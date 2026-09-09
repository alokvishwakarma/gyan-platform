import {
  useEffect,
  useMemo,
  useState,
} from "react";

import "./AdminNearbySearchesPage.css";


interface AdminNearbySearchesPageProps {
  onBack:
    () => void;
}


interface SearchRow {
  searchKey:
    string;

  serviceCode:
    string;

  locationMode:
    string;

  city:
    string | null;

  state:
    string | null;

  latitudeBucket:
    number | null;

  longitudeBucket:
    number | null;

  searches:
    number;

  registeredResults:
    number;

  externalResults:
    number;

  firstSearchedAt:
    string;

  lastSearchedAt:
    string;

  expiresAt:
    string;
}


interface PopularService {
  serviceCode:
    string;

  searches:
    number;

  locations:
    number;

  lastSearchedAt:
    string;
}


interface DiscoveredPlace {
  provider:
    string;

  providerPlaceId:
    string;

  name:
    string;

  address:
    string;

  latitude:
    number | null;

  longitude:
    number | null;

  phoneNumber:
    string | null;

  website:
    string | null;

  categories:
    string[];

  firstSeenAt:
    string;

  lastSeenAt:
    string;

  seenCount:
    number;

  serviceCodes:
    string[];

  serviceAppearances:
    number;
}


interface SearchResponse {
  totals?: {
    searches:
      number;

    searchKeys:
      number;

    places:
      number;

    placeAppearances:
      number;
  };

  popularServices?:
    PopularService[];

  recentSearches?:
    SearchRow[];

  error?:
    string;
}


interface PlacesResponse {
  serviceCode?:
    string | null;

  places?:
    DiscoveredPlace[];

  error?:
    string;
}


function formatWhen(
  value:
    string,
): string {
  const date =
    new Date(
      value,
    );

  if (
    Number.isNaN(
      date.getTime(),
    )
  ) {
    return value;
  }

  return date.toLocaleString();
}


function serviceLabel(
  code:
    string,
): string {
  return code
    .replace(
      /^NEARBY_/,
      "",
    )
    .replace(
      /_/g,
      " ",
    )
    .toLowerCase()
    .replace(
      /\b\w/g,
      (
        value,
      ) =>
        value.toUpperCase(),
    );
}


export default function AdminNearbySearchesPage({
  onBack,
}: AdminNearbySearchesPageProps) {
  const [
    data,
    setData,
  ] =
    useState<
      SearchResponse | null
    >(null);

  const [
    places,
    setPlaces,
  ] =
    useState<
      DiscoveredPlace[]
    >([]);

  const [
    loading,
    setLoading,
  ] =
    useState(true);

  const [
    placesLoading,
    setPlacesLoading,
  ] =
    useState(true);

  const [
    error,
    setError,
  ] =
    useState("");

  const [
    serviceFilter,
    setServiceFilter,
  ] =
    useState("");

  const [
    query,
    setQuery,
  ] =
    useState("");


  const [
    view,
    setView,
  ] =
    useState<
      "searches" |
      "shops"
    >(
      "searches",
    );


  useEffect(
    () => {
      const controller =
        new AbortController();

      async function load():
        Promise<void> {
        setLoading(
          true,
        );

        setError(
          "",
        );

        try {
          const response =
            await fetch(
              "/api/admin/nearby-searches",
              {
                credentials:
                  "include",

                cache:
                  "no-store",

                signal:
                  controller.signal,
              },
            );

          const body =
            await response.json() as
              SearchResponse;

          if (!response.ok) {
            throw new Error(
              body.error ??
              "Search activity could not be loaded.",
            );
          }

          setData(
            body,
          );
        } catch (
          caught
        ) {
          if (
            caught instanceof
              DOMException &&
            caught.name ===
              "AbortError"
          ) {
            return;
          }

          setError(
            caught instanceof
              Error
              ? caught.message
              : "Search activity could not be loaded.",
          );
        } finally {
          if (
            !controller.signal.aborted
          ) {
            setLoading(
              false,
            );
          }
        }
      }

      void load();

      return () => {
        controller.abort();
      };
    },
    [],
  );


  useEffect(
    () => {
      const controller =
        new AbortController();

      async function loadPlaces():
        Promise<void> {
        setPlacesLoading(
          true,
        );

        try {
          const parameters =
            new URLSearchParams();

          if (
            serviceFilter
          ) {
            parameters.set(
              "serviceCode",
              serviceFilter,
            );
          }

          const suffix =
            parameters.toString();

          const response =
            await fetch(
              `/api/admin/nearby-searches/places${
                suffix
                  ? `?${suffix}`
                  : ""
              }`,
              {
                credentials:
                  "include",

                cache:
                  "no-store",

                signal:
                  controller.signal,
              },
            );

          const body =
            await response.json() as
              PlacesResponse;

          if (!response.ok) {
            throw new Error(
              body.error ??
              "Discovered shops could not be loaded.",
            );
          }

          setPlaces(
            body.places ??
            [],
          );
        } catch (
          caught
        ) {
          if (
            caught instanceof
              DOMException &&
            caught.name ===
              "AbortError"
          ) {
            return;
          }

          setError(
            caught instanceof
              Error
              ? caught.message
              : "Discovered shops could not be loaded.",
          );
        } finally {
          if (
            !controller.signal.aborted
          ) {
            setPlacesLoading(
              false,
            );
          }
        }
      }

      void loadPlaces();

      return () => {
        controller.abort();
      };
    },
    [
      serviceFilter,
    ],
  );


  const services =
    useMemo(
      () =>
        (
          data
            ?.popularServices ??
          []
        )
          .map(
            (
              item,
            ) =>
              item.serviceCode,
          ),

      [
        data
          ?.popularServices,
      ],
    );


  const filteredPlaces =
    useMemo(
      () => {
        const normalized =
          query
            .trim()
            .toLowerCase();

        if (!normalized) {
          return places;
        }

        return places.filter(
          (
            place,
          ) =>
            [
              place.name,
              place.address,
              place.phoneNumber ??
                "",
              place.website ??
                "",
              ...place.serviceCodes,
            ]
              .join(" ")
              .toLowerCase()
              .includes(
                normalized,
              ),
        );
      },

      [
        places,
        query,
      ],
    );


  const filteredSearches =
    useMemo(
      () =>
        (
          data
            ?.recentSearches ??
          []
        ).filter(
          (
            row,
          ) =>
            !serviceFilter ||
            row.serviceCode ===
              serviceFilter,
        ),

      [
        data
          ?.recentSearches,

        serviceFilter,
      ],
    );


  return (
    <main className="admin-nearby-searches">
      <header className="admin-nearby-searches__header">
        <button
          type="button"
          onClick={
            onBack
          }
          aria-label="Back to Admin"
          title="Back to Admin"
        >
          ←
        </button>

        <div>
          <strong>
            🔎 Nearby searches
          </strong>

          <small>
            Search demand and discovered shops
          </small>
        </div>
      </header>

      <section className="admin-nearby-searches__content">
        {error && (
          <div className="admin-nearby-searches__error">
            {
              error
            }
          </div>
        )}

        <div className="admin-nearby-searches__summary">
          <article>
            <strong>
              {
                data
                  ?.totals
                  ?.searches ??
                0
              }
            </strong>

            <span>
              Searches
            </span>
          </article>

          <article>
            <strong>
              {
                data
                  ?.totals
                  ?.searchKeys ??
                0
              }
            </strong>

            <span>
              Locations
            </span>
          </article>

          <article>
            <strong>
              {
                data
                  ?.totals
                  ?.places ??
                0
              }
            </strong>

            <span>
              Shops found
            </span>
          </article>
        </div>

        <div className="admin-nearby-searches__tabs">
          <button
            type="button"
            className={
              view ===
                "searches"
                ? "is-selected"
                : ""
            }
            onClick={() =>
              setView(
                "searches",
              )
            }
          >
            🔎 Searches
          </button>

          <button
            type="button"
            className={
              view ===
                "shops"
                ? "is-selected"
                : ""
            }
            onClick={() =>
              setView(
                "shops",
              )
            }
          >
            🏬 Shops
          </button>
        </div>

        {view ===
          "searches" && (
          <>
        <section className="admin-nearby-searches__panel">
          <div className="admin-nearby-searches__panel-heading">
            <strong>
              Popular services
            </strong>
          </div>

          {
            loading
              ? (
                <div className="admin-nearby-searches__empty">
                  Loading…
                </div>
              )
              : (
                <div className="admin-nearby-searches__chips">
                  {
                    (
                      data
                        ?.popularServices ??
                      []
                    ).map(
                      (
                        item,
                      ) => (
                        <button
                          key={
                            item.serviceCode
                          }
                          type="button"
                          className={
                            serviceFilter ===
                              item.serviceCode
                              ? "is-selected"
                              : ""
                          }
                          onClick={() =>
                            setServiceFilter(
                              (
                                current,
                              ) =>
                                current ===
                                  item.serviceCode
                                  ? ""
                                  : item.serviceCode,
                            )
                          }
                        >
                          <span>
                            {
                              serviceLabel(
                                item.serviceCode,
                              )
                            }
                          </span>

                          <strong>
                            {
                              item.searches
                            }
                          </strong>
                        </button>
                      ),
                    )
                  }
                </div>
              )
          }
        </section>

        <section className="admin-nearby-searches__panel">
          <div className="admin-nearby-searches__panel-heading">
            <strong>
              Recent searches
            </strong>
          </div>

          <div className="admin-nearby-searches__table-wrap">
            <table>
              <thead>
                <tr>
                  <th>
                    Service
                  </th>

                  <th>
                    Location
                  </th>

                  <th>
                    Searches
                  </th>

                  <th>
                    Results
                  </th>

                  <th>
                    Last
                  </th>
                </tr>
              </thead>

              <tbody>
                {
                  filteredSearches.map(
                    (
                      row,
                    ) => (
                      <tr
                        key={
                          row.searchKey
                        }
                      >
                        <td>
                          {
                            serviceLabel(
                              row.serviceCode,
                            )
                          }
                        </td>

                        <td>
                          {
                            [
                              row.city,
                              row.state,
                            ]
                              .filter(
                                Boolean,
                              )
                              .join(
                                ", ",
                              ) ||
                            (
                              row.locationMode ===
                                "gps"
                                ? `${row.latitudeBucket ?? "?"}, ${row.longitudeBucket ?? "?"}`
                                : "Unknown"
                            )
                          }
                        </td>

                        <td>
                          {
                            row.searches
                          }
                        </td>

                        <td>
                          {
                            row.registeredResults
                          } GYAN · {
                            row.externalResults
                          } found
                        </td>

                        <td>
                          {
                            formatWhen(
                              row.lastSearchedAt,
                            )
                          }
                        </td>
                      </tr>
                    ),
                  )
                }
              </tbody>
            </table>
          </div>
        </section>

          </>
        )}

        {view ===
          "shops" && (
        <section className="admin-nearby-searches__panel">
          <div className="admin-nearby-searches__panel-heading admin-nearby-searches__panel-heading--shops">
            <div>
              <strong>
                Shops discovered
              </strong>

              <small>
                Repeated appearances are good registration prospects
              </small>
            </div>

            <select
              value={
                serviceFilter
              }
              onChange={(
                event,
              ) =>
                setServiceFilter(
                  event.target.value,
                )
              }
            >
              <option value="">
                All services
              </option>

              {
                services.map(
                  (
                    serviceCode,
                  ) => (
                    <option
                      key={
                        serviceCode
                      }
                      value={
                        serviceCode
                      }
                    >
                      {
                        serviceLabel(
                          serviceCode,
                        )
                      }
                    </option>
                  ),
                )
              }
            </select>
          </div>

          <input
            className="admin-nearby-searches__shop-filter"
            type="search"
            value={
              query
            }
            placeholder="Filter shops, address, phone or website"
            onChange={(
              event,
            ) =>
              setQuery(
                event.target.value,
              )
            }
          />

          {
            placesLoading
              ? (
                <div className="admin-nearby-searches__empty">
                  Loading shops…
                </div>
              )
              : filteredPlaces.length ===
                  0
                ? (
                  <div className="admin-nearby-searches__empty">
                    No discovered shops yet.
                  </div>
                )
                : (
                  <div className="admin-nearby-searches__shops">
                    {
                      filteredPlaces.map(
                        (
                          place,
                        ) => (
                          <article
                            key={`${place.provider}:${place.providerPlaceId}`}
                            className="admin-nearby-searches__shop"
                          >
                            <div className="admin-nearby-searches__shop-main">
                              <strong>
                                {
                                  place.name
                                }
                              </strong>

                              <span>
                                {
                                  place.address ||
                                  "Address unavailable"
                                }
                              </span>

                              <small>
                                {
                                  place.serviceCodes
                                    .map(
                                      serviceLabel,
                                    )
                                    .join(
                                      " · ",
                                    )
                                }
                              </small>
                            </div>

                            <div className="admin-nearby-searches__shop-count">
                              <strong>
                                {
                                  place.serviceAppearances
                                }
                              </strong>

                              <span>
                                appearances
                              </span>
                            </div>

                            <div className="admin-nearby-searches__shop-actions">
                              {
                                place.phoneNumber && (
                                  <a
                                    href={`tel:${place.phoneNumber}`}
                                  >
                                    ☎
                                  </a>
                                )
                              }

                              {
                                place.website && (
                                  <a
                                    href={
                                      place.website
                                    }
                                    target="_blank"
                                    rel="noreferrer"
                                  >
                                    ↗
                                  </a>
                                )
                              }
                            </div>
                          </article>
                        ),
                      )
                    }
                  </div>
                )
          }
        </section>
        )}
      </section>
    </main>
  );
}
