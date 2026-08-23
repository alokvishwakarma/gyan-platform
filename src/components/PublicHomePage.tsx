import {
  type ReactNode,
  useEffect,
  useMemo,
  useState,
} from "react";

import FeaturedServiceCard
  from "./FeaturedServiceCard";

import Puzzle
  from "./Puzzle";

import GyanAboutPanel
  from "./GyanAboutPanel";

import GyanCalendarPage
  from "./GyanCalendarPage";

import EducationLearningHub
  from "./EducationLearningHub";

import MyRatingsPage
  from "./MyRatingsPage";

import {
  ADMIN_LOCATION_CHANGED_EVENT,
  getAdminLocationOverride,
} from "../location/adminLocation";

import GyanShell
  from "./GyanShell";

import UserAccountMenu
  from "./UserAccountMenu";

import "./PublicHomePage.css";




interface PublicService {
  code: string;

  name: string;

  catalogName: string;

  description: string;

  icon: string;

  enabled: boolean;

  sortOrder: number;

  homepageOrder?:
    | number
    | null;

  category?: string;

  subCategory?:
    | string
    | null;

  workflowType?: string;
}


interface PublicHomePageProps {
  services:
    PublicService[];

  loading:
    boolean;

  onOpenShop: (
    shopCode: string,
  ) => void;

  onClaimShop:
    () => void;

  onOpenAdmin:
    () => void;

  onOpenChat:
    () => void;

  onOpenMyShop: (
    shopCode: string,
  ) => void;

  onRegisterMyShop: (
    email: string,
  ) => void;

  shopName?: string;
  shopAddress?: string;

  onStartOnlineService?: (
    serviceCode: string,
    serviceName: string,
  ) => void;

  onOpenOnlineServices?:
    () => void;

  onOpenNearbyService?: (
    serviceCode: string,
    serviceName: string,
  ) => void;

  shellContent?:
    ReactNode;
}


function useResponsiveTileCount(
  maximumTileCount = 6,
): number {
  const [
    tileCount,
    setTileCount,
  ] =
    useState(5);


  useEffect(
    () => {
      const updateTileCount =
        (): void => {
          const viewportWidth =
            window.innerWidth;


          if (
            viewportWidth <
            350
          ) {
            setTileCount(
              Math.min(
                4,
                maximumTileCount,
              ),
            );

            return;
          }


          if (
            viewportWidth <
            600
          ) {
            setTileCount(
              Math.min(
                5,
                maximumTileCount,
              ),
            );

            return;
          }


          setTileCount(
            Math.min(
              6,
              maximumTileCount,
            ),
          );
        };


      updateTileCount();


      window.addEventListener(
        "resize",
        updateTileCount,
      );


      return () => {
        window.removeEventListener(
          "resize",
          updateTileCount,
        );
      };
    },

    [
      maximumTileCount,
    ],
  );


  return tileCount;
}


function isOnlineService(
  service:
    PublicService,
): boolean {
  const category =
    service.category
      ?.trim()
      .toLowerCase() ??
    "";


  const subCategory =
    service.subCategory
      ?.trim()
      .toLowerCase() ??
    "";


  const workflowType =
    service.workflowType
      ?.trim()
      .toLowerCase() ??
    "";


  return (
    category ===
      "digital" ||

    category ===
      "online" ||

    subCategory ===
      "digital" ||

    subCategory ===
      "online" ||

    workflowType ===
      "online" ||

    workflowType ===
      "remote"
  );
}


function isNearbyService(
  service:
    PublicService,
): boolean {
  return (
    service.category
      ?.trim()
      .toLowerCase() ===
    "nearby"
  );
}


function getServiceName(
  service:
    PublicService,
): string {
  return (
    service.catalogName ||
    service.name
  );
}


type EducationCountry =
  | "US"
  | "IN";


function getEffectiveEducationCountry():
  EducationCountry {
  const override =
    getAdminLocationOverride();

  const countryCode =
    override
      ?.countryCode
      ?.trim()
      .toUpperCase();

  const phoneCountryCode =
    override
      ?.phoneCountryCode
      ?.trim();

  if (
    countryCode === "IN" ||
    countryCode === "IND" ||
    countryCode === "INDIA" ||
    phoneCountryCode === "+91" ||
    phoneCountryCode === "91"
  ) {
    return "IN";
  }

  if (
    countryCode === "US" ||
    countryCode === "USA" ||
    countryCode === "UNITED STATES" ||
    phoneCountryCode === "+1" ||
    phoneCountryCode === "1"
  ) {
    return "US";
  }

  if (
    typeof navigator !== "undefined"
  ) {
    const languages =
      (
        navigator.languages ??
        [navigator.language]
      )
        .join(",")
        .toLowerCase();

    const timezone =
      Intl.DateTimeFormat()
        .resolvedOptions()
        .timeZone
        .toLowerCase();

    if (
      timezone === "asia/kolkata" ||
      timezone === "asia/calcutta" ||
      languages.includes("en-in") ||
      languages.includes("hi-in")
    ) {
      return "IN";
    }
  }

  return "US";
}


export default function PublicHomePage({
  services,

  loading,

  onOpenAdmin,

  onOpenChat,

  onOpenMyShop,

  onRegisterMyShop,

  shopName,

  shopAddress,

  onStartOnlineService,

  onOpenOnlineServices,

  onOpenNearbyService,

  shellContent,
}: PublicHomePageProps) {
  const [
    gyanAboutOpen,
    setGyanAboutOpen,
  ] =
    useState(false);


  const [
    calendarOpen,
    setCalendarOpen,
  ] =
    useState(false);


  const [
    activeView,
    setActiveView,
  ] =
    useState<
      "home" |
      "education" |
      "services" |
      "ratings"
    >(() => {
      const pathname =
        window.location.pathname;

      if (
        pathname ===
          "/services"
      ) {
        return "services";
      }

      if (
        pathname ===
          "/ratings"
      ) {
        return "ratings";
      }

      if (
        pathname.startsWith(
          "/education",
        )
      ) {
        return "education";
      }

      return "home";
    });


  useEffect(() => {
    const syncViewFromPath =
      (): void => {
        const pathname =
          window.location.pathname;

        if (
          pathname ===
            "/services"
        ) {
          setActiveView(
            "services",
          );

          setShowPuzzle(
            false,
          );

          return;
        }

        if (
          pathname ===
            "/ratings"
        ) {
          setActiveView(
            "ratings",
          );

          setShowPuzzle(
            false,
          );

          return;
        }

        if (
          pathname.startsWith(
            "/education",
          )
        ) {
          setActiveView(
            "education",
          );

          setShowPuzzle(
            false,
          );

          return;
        }

        setActiveView(
          "home",
        );

        setShowPuzzle(
          true,
        );
      };

    window.addEventListener(
      "popstate",
      syncViewFromPath,
    );

    return () => {
      window.removeEventListener(
        "popstate",
        syncViewFromPath,
      );
    };
  }, []);


  const [
    educationCountry,
    setEducationCountry,
  ] =
    useState<EducationCountry>(
      getEffectiveEducationCountry,
    );


  useEffect(
    () => {
      const refreshCountry =
        (): void => {
          setEducationCountry(
            getEffectiveEducationCountry(),
          );
        };

      window.addEventListener(
        ADMIN_LOCATION_CHANGED_EVENT,
        refreshCountry,
      );

      return () => {
        window.removeEventListener(
          ADMIN_LOCATION_CHANGED_EVENT,
          refreshCountry,
        );
      };
    },
    [],
  );


  const [
    showPuzzle,
    setShowPuzzle,
  ] =
    useState(true);


  const [
    searchText,
    setSearchText,
  ] =
    useState("");


  const [
    searchFocused,
    setSearchFocused,
  ] =
    useState(false);



  const onlineTileCount =
    useResponsiveTileCount();


  const nearbyTileCount =
    onlineTileCount;


  const enabledServices =
    useMemo(
      () =>
        [
          ...services,
        ]
          .filter(
            (
              service,
            ) =>
              service.enabled,
          )
          .sort(
            (
              first,
              second,
            ) =>
              first.sortOrder -
                second.sortOrder ||

              first.name.localeCompare(
                second.name,
              ),
          ),

      [
        services,
      ],
    );


  const searchableServices =
    useMemo(
      () =>
        enabledServices.filter(
          (
            service,
          ) =>
            isOnlineService(
              service,
            ) ||

            isNearbyService(
              service,
            ),
        ),

      [
        enabledServices,
      ],
    );


  const searchResults =
    useMemo(
      () => {
        const query =
          searchText
            .trim()
            .toLowerCase();


        if (
          !query
        ) {
          return [];
        }


        return searchableServices
          .map(
            (
              service,
            ) => {
              const name =
                getServiceName(
                  service,
                );


              const haystack =
                [
                  name,

                  service.name,

                  service.description,

                  service.category,

                  service.subCategory,
                ]
                  .filter(
                    Boolean,
                  )
                  .join(
                    " ",
                  )
                  .toLowerCase();


              const normalizedName =
                name
                  .toLowerCase();


              let rank =
                3;


              if (
                normalizedName ===
                query
              ) {
                rank =
                  0;
              } else if (
                normalizedName.startsWith(
                  query,
                )
              ) {
                rank =
                  1;
              } else if (
                normalizedName.includes(
                  query,
                )
              ) {
                rank =
                  2;
              }


              return {
                service,

                rank,

                matches:
                  haystack.includes(
                    query,
                  ),
              };
            },
          )
          .filter(
            (
              item,
            ) =>
              item.matches,
          )
          .sort(
            (
              first,
              second,
            ) =>
              first.rank -
                second.rank ||

              getServiceName(
                first.service,
              ).localeCompare(
                getServiceName(
                  second.service,
                ),
              ),
          )
          .slice(
            0,
            8,
          )
          .map(
            (
              item,
            ) =>
              item.service,
          );
      },

      [
        searchText,

        searchableServices,
      ],
    );


  const onlineServices =
    useMemo(
      () =>
        enabledServices
          .filter(
            isOnlineService,
          )
          .filter(
            (
              service,
            ) =>
              service.homepageOrder !=
              null,
          )
          .sort(
            (
              first,
              second,
            ) =>
              (
                first.homepageOrder ??
                first.sortOrder
              ) -
                (
                  second.homepageOrder ??
                  second.sortOrder
                ) ||

              first.name.localeCompare(
                second.name,
              ),
          ),

      [
        enabledServices,
      ],
    );


  const popularOnlineServices =
    useMemo(
      () =>
        onlineServices.slice(
          0,

          Math.max(
            1,

            onlineTileCount -
              1,
          ),
        ),

      [
        onlineServices,

        onlineTileCount,
      ],
    );


  const nearbyServices =
    useMemo(
      () =>
        enabledServices
          .filter(
            isNearbyService,
          )
          .filter(
            (
              service,
            ) =>
              service.homepageOrder !=
              null,
          )
          .sort(
            (
              first,
              second,
            ) =>
              (
                first.homepageOrder ??
                first.sortOrder
              ) -
                (
                  second.homepageOrder ??
                  second.sortOrder
                ) ||

              first.name.localeCompare(
                second.name,
              ),
          ),

      [
        enabledServices,
      ],
    );


  const mapsService =
    useMemo(
      () =>
        nearbyServices.find(
          (
            service,
          ) =>
            service.code ===
              "NEARBY_MAPS" ||

            getServiceName(
              service,
            )
              .trim()
              .toLowerCase() ===
              "maps",
        ) ??
        null,

      [
        nearbyServices,
      ],
    );


  const visibleNearbyServices =
    useMemo(
      () => {
        const regularServices =
          nearbyServices.filter(
            (
              service,
            ) =>
              service.code !==
              mapsService
                ?.code,
          );


        const totalSlots =
          nearbyTileCount *
          2;


        const regularServiceSlots =
          mapsService
            ? totalSlots -
              1
            : totalSlots;


        return regularServices.slice(
          0,

          Math.max(
            1,
            regularServiceSlots,
          ),
        );
      },

      [
        mapsService,

        nearbyServices,

        nearbyTileCount,
      ],
    );


  function openService(
    service:
      PublicService,
  ): void {
    const serviceName =
      getServiceName(
        service,
      );


    setSearchText(
      "",
    );


    setSearchFocused(
      false,
    );


    if (
      isNearbyService(
        service,
      )
    ) {
      onOpenNearbyService?.(
        service.code,

        serviceName,
      );

      return;
    }


    startOnlineService(
      service.code,
      serviceName,
    );
  }


  function openEducation():
    void {
    setSearchText(
      "",
    );

    setSearchFocused(
      false,
    );

    setCalendarOpen(
      false,
    );

    setEducationCountry(
      getEffectiveEducationCountry(),
    );

    setShowPuzzle(
      false,
    );

    setActiveView(
      "education",
    );

    window.history.pushState(
      {},
      "",
      "/education",
    );
  }


  function openServices():
    void {
    setSearchText(
      "",
    );

    setSearchFocused(
      false,
    );

    setCalendarOpen(
      false,
    );

    setShowPuzzle(
      false,
    );

    setActiveView(
      "services",
    );

    window.history.pushState(
      {},
      "",
      "/services",
    );
  }


  function isEducationService(
    serviceCode: string,
    serviceName: string,
  ): boolean {
    const values = [
      serviceCode,
      serviceName,
    ]
      .map(
        (value) =>
          value
            .trim()
            .toLowerCase(),
      );

    return values.some(
      (value) =>
        value === "education" ||
        value === "education_portal" ||
        value === "education portal",
    );
  }


  function startOnlineService(
    serviceCode: string,
    serviceName: string,
  ): void {
    if (
      isEducationService(
        serviceCode,
        serviceName,
      )
    ) {
      openEducation();

      return;
    }

    onStartOnlineService?.(
      serviceCode,
      serviceName,
    );
  }


  const showSearchResults =
    searchFocused &&
    searchText
      .trim()
      .length >
      0;


  const headerLeft =
    searchFocused
      ? (
        <button
          type="button"
          className="public-home__search-back"
          aria-label="Close search"
          onClick={() => {
            setSearchText("");

            setSearchFocused(
              false,
            );
          }}
        >
          ←
        </button>
      )
      : (
        <button
          type="button"
          className="public-home__brand public-home__brand-button"
          onClick={() =>
            setCalendarOpen(
              true,
            )
          }
          aria-label="Open GYAN Calendar"
          title="GYAN Calendar"
        >
          <span
            className="public-home__brand-icon"
            aria-hidden="true"
          >
            📖
          </span>

          <div
            className="public-home__brand-text"
          >
            <strong>
              GYAN
            </strong>

            <span
              className="public-home__tagline"
            >
              Your Digital Seva Partner
            </span>

            <span
              className="public-home__value"
            >
              Order Online • Pick Up When
              Ready • No Waiting
            </span>

            {shopName && (
              <span
                className="public-home__shop-context"
                title={
                  shopAddress
                    ? `${shopName} · ${shopAddress}`
                    : shopName
                }
              >
                {shopName}
                {shopAddress
                  ? ` · ${shopAddress}`
                  : ""}
              </span>
            )}
          </div>
        </button>
      );


  const headerCenter =
    searchFocused
      ? (
        <div
          className="public-home__header-search"
        >
          <span
            aria-hidden="true"
          >
            🔎
          </span>

          <input
            autoFocus
            type="search"
            value={
              searchText
            }
            placeholder="Search services..."
            aria-label="Search services"
            autoComplete="off"
            onChange={(
              event,
            ) =>
              setSearchText(
                event.target.value,
              )
            }
            onKeyDown={(
              event,
            ) => {
              if (
                event.key ===
                  "Enter" &&
                searchResults.length >
                  0
              ) {
                event.preventDefault();

                openService(
                  searchResults[0],
                );
              }

              if (
                event.key ===
                "Escape"
              ) {
                setSearchText("");

                setSearchFocused(
                  false,
                );
              }
            }}
          />

          {
            searchText &&
            (
              <button
                type="button"
                aria-label="Clear search"
                onClick={() =>
                  setSearchText("")
                }
              >
                ×
              </button>
            )
          }

          {
            showSearchResults &&
            (
              <div
                className="public-home__header-search-results"
              >
                {
                  searchResults.length >
                  0
                    ? (
                      searchResults.map(
                        (
                          service,
                        ) => (
                          <button
                            type="button"
                            key={
                              service.code
                            }
                            className="public-home__service-search-result"
                            onClick={() =>
                              openService(
                                service,
                              )
                            }
                          >
                            <span
                              className="public-home__service-search-result-icon"
                              aria-hidden="true"
                            >
                              {
                                service.icon ||
                                (
                                  isNearbyService(
                                    service,
                                  )
                                    ? "📍"
                                    : "💻"
                                )
                              }
                            </span>

                            <span
                              className="public-home__service-search-result-text"
                            >
                              <strong>
                                {
                                  getServiceName(
                                    service,
                                  )
                                }
                              </strong>

                              <small>
                                {
                                  isNearbyService(
                                    service,
                                  )
                                    ? "Nearby service"
                                    : "Online service"
                                }
                              </small>
                            </span>

                            <span
                              className="public-home__service-search-arrow"
                              aria-hidden="true"
                            >
                              ›
                            </span>
                          </button>
                        ),
                      )
                    )
                    : (
                      <div
                        className="public-home__service-search-empty"
                      >
                        No matching service.
                        Try another word.
                      </div>
                    )
                }
              </div>
            )
          }
        </div>
      )
      : null;


  const headerRight =
    searchFocused
      ? null
      : (
        <div
          className="public-home__header-actions"
        >
          <button
            type="button"
            className="public-home__search-button"
            aria-label="Search services"
            title="Search services"
            onClick={() =>
              setSearchFocused(
                true,
              )
            }
          >
            🔎
          </button>

          <button
            type="button"
            className="public-home__search-button"
            aria-label="Open Education Portal"
            title="Education Portal"
            onClick={
              openEducation
            }
          >
            🎓
          </button>

          <button
            type="button"
            className={[
              "public-home__search-button",
              activeView ===
                "services"
                ? "public-home__search-button--active"
                : "",
            ]
              .filter(
                Boolean,
              )
              .join(
                " ",
              )}
            aria-label="Open Services"
            title="Services"
            onClick={
              openServices
            }
          >
            🧰
          </button>

          <UserAccountMenu
            onOpenAdmin={
              onOpenAdmin
            }
            onOpenChat={
              onOpenChat
            }
            onOpenMyShop={
              onOpenMyShop
            }

            onOpenMyRatings={() => {
              setSearchFocused(
                false,
              );

              setShowPuzzle(
                false,
              );

              setActiveView(
                "ratings",
              );

              window.history.pushState(
                {},
                "",
                "/ratings",
              );
            }}
                      onRegisterMyShop={
              onRegisterMyShop
            }
/>
        </div>
      );


  return (
    <div
      className={[
        "public-home",
        shopName
          ? "public-home--shop"
          : "",
      ].join(" ")}
    >
      <GyanShell
        headerLeft={
          headerLeft
        }
        headerCenter={
          headerCenter
        }
        headerRight={
          headerRight
        }
        bodyClassName="public-home__content"
      >
        {
          calendarOpen
            ? (
              <GyanCalendarPage
                onClose={() =>
                  setCalendarOpen(
                    false,
                  )
                }
              />
            )
            : activeView ===
                "education"
              ? (
                <EducationLearningHub
                  country={
                    educationCountry
                  }

                  onBack={() => {
                    setActiveView(
                      "home",
                    );

                    setShowPuzzle(
                      true,
                    );

                    window.history.pushState(
                      {},
                      "",
                      "/",
                    );
                  }}
                />
              )
              : activeView ===
                  "ratings"
                ? (
                  <MyRatingsPage
                    onBack={() => {
                      setActiveView(
                        "home",
                      );

                      setShowPuzzle(
                        true,
                      );

                      window.history.pushState(
                        {},
                        "",
                        "/",
                      );
                    }}
                  />
                )
              : shellContent &&
                activeView !==
                  "services"
                ? (
                  shellContent
                )
                : (
                  <>
        {/*
         * =================================================
         * DAILY PUZZLE
         * =================================================
         */}
        {
          showPuzzle &&
          (
            <Puzzle
              onClose={() =>
                setShowPuzzle(
                  false,
                )
              }

              onOpenEducation={
                openEducation
              }
            />
          )
        }


        {
          activeView ===
            "services" && (
            <div
              className="public-home__services-view-heading"
            >
              <strong>
                🧰 Services
              </strong>

              <small>
                Featured · Online · Nearby
              </small>
            </div>
          )
        }


        {/*
         * =================================================
         * FEATURED
         * =================================================
         */}
        <FeaturedServiceCard
          onStartService={
            startOnlineService
          }
          onOpenRequestService={() =>
            onOpenNearbyService?.(
              "GENERAL_REQUEST",
              "Request Service",
            )
          }
        />


        {/*
         * =================================================
         * ONLINE SERVICES
         * =================================================
         */}
        <section
          className="public-home__section public-home__section--online"
        >
          <div
            className="public-home__section-heading"
          >
            <div>
              <span>
                Available from
                anywhere
              </span>


              <h2>
                Online services
                request
              </h2>
            </div>
          </div>


          {
            loading
              ? (
                <div
                  className="public-home__state"
                >
                  Loading online
                  services…
                </div>
              )
              : onlineServices.length >
                0
                ? (
                  <div
                    className="public-home__task-grid public-home__task-grid--online public-home__task-grid--responsive"
                    style={{
                      gridTemplateColumns:
                        `repeat(${onlineTileCount}, minmax(0, 1fr))`,
                    }}
                  >
                    {
                      popularOnlineServices.map(
                        (
                          service,
                        ) => (
                          <button
                            type="button"
                            key={
                              service.code
                            }
                            className="public-home__task-card"
                            onClick={() =>
                              startOnlineService(
                                service.code,

                                getServiceName(
                                  service,
                                ),
                              )
                            }
                          >
                            <span
                              className="public-home__task-icon"
                              aria-hidden="true"
                            >
                              {
                                service.icon ||
                                "💻"
                              }
                            </span>


                            <strong>
                              {
                                getServiceName(
                                  service,
                                )
                              }
                            </strong>
                          </button>
                        ),
                      )
                    }


                    <button
                      type="button"
                      className="public-home__task-card public-home__task-card--other"
                      onClick={
                        onOpenOnlineServices
                      }
                      disabled={
                        !onOpenOnlineServices
                      }
                    >
                      <span
                        className="public-home__task-icon"
                        aria-hidden="true"
                      >
                        ⋯
                      </span>


                      <strong>
                        Other
                      </strong>
                    </button>
                  </div>
                )
                : (
                  <div
                    className="public-home__state"
                  >
                    No online services
                    are currently
                    available.
                  </div>
                )
          }
        </section>


        {/*
         * =================================================
         * NEARBY SERVICES
         * =================================================
         */}
        <section
          className="public-home__section"
        >
          <div
            className="public-home__section-heading"
          >
            <div>
              <span>
                Visit a
                participating shop
              </span>


              <h2>
                Nearby services
                request
              </h2>
            </div>
          </div>


          {
            loading
              ? (
                <div
                  className="public-home__state"
                >
                  Loading local
                  services…
                </div>
              )
              : nearbyServices.length >
                0
                ? (
                  <div
                    className="public-home__task-grid public-home__task-grid--nearby public-home__task-grid--responsive"
                    style={{
                      gridTemplateColumns:
                        `repeat(${nearbyTileCount}, minmax(0, 1fr))`,
                    }}
                  >
                    {
                      visibleNearbyServices.map(
                        (
                          service,
                        ) => (
                          <button
                            type="button"
                            key={
                              service.code
                            }
                            className="public-home__task-card"
                            onClick={() =>
                              onOpenNearbyService?.(
                                service.code,

                                getServiceName(
                                  service,
                                ),
                              )
                            }
                            disabled={
                              !onOpenNearbyService
                            }
                          >
                            <span
                              className="public-home__task-icon"
                              aria-hidden="true"
                            >
                              {
                                service.icon ||
                                "📍"
                              }
                            </span>


                            <strong>
                              {
                                getServiceName(
                                  service,
                                )
                              }
                            </strong>
                          </button>
                        ),
                      )
                    }


                    {
                      mapsService &&
                      (
                        <button
                          type="button"
                          className="public-home__task-card public-home__task-card--maps"
                          onClick={() =>
                            onOpenNearbyService?.(
                              mapsService.code,

                              getServiceName(
                                mapsService,
                              ),
                            )
                          }
                          disabled={
                            !onOpenNearbyService
                          }
                        >
                          <span
                            className="public-home__task-icon"
                            aria-hidden="true"
                          >
                            {
                              mapsService.icon ||
                              "🗺️"
                            }
                          </span>


                          <strong>
                            {
                              getServiceName(
                                mapsService,
                              )
                            }
                          </strong>
                        </button>
                      )
                    }
                  </div>
                )
                : (
                  <div
                    className="public-home__state"
                  >
                    No nearby
                    services are
                    currently
                    available.
                  </div>
                )
          }
        </section>

              </>
            )
        }
      </GyanShell>


      {
        gyanAboutOpen &&
        (
          <GyanAboutPanel
            onClose={() =>
              setGyanAboutOpen(
                false,
              )
            }
            onOpenAdmin={() => {
              setGyanAboutOpen(
                false,
              );


              onOpenAdmin();
            }}
          />
        )
      }
    </div>
  );
}