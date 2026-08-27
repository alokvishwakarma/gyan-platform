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

import StudentProgressPage
  from "./StudentProgressPage";

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

  educationCode?: string;

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


type ActiveEducationGyan = {
  code: string;
  name: string;
  email: string;
  emailKnown: boolean;
};


type EducationAttemptSummary = {
  totalAttempts: number;

  recentAttempts: {
    id: number;
    subjectCode: string;
    topicCode: string;
    questionCount: number;
    correctCount: number;
    scorePercent: number;
    createdAt: string;
  }[];
};


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

  educationCode,

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


  const initialCalendarMode =
    new URLSearchParams(
      window.location.search,
    ).get(
      "calendar",
    );

  const [
    calendarOpen,
    setCalendarOpen,
  ] =
    useState(
      () =>
        initialCalendarMode ===
          "1" ||
        initialCalendarMode ===
          "print",
    );

  const [
    calendarPrintDirect,
    setCalendarPrintDirect,
  ] =
    useState(
      () =>
        initialCalendarMode ===
          "print",
    );


  useEffect(
    () => {
      if (
        !calendarOpen
      ) {
        return;
      }

      const parameters =
        new URLSearchParams(
          window.location.search,
        );

      const calendarParameter =
        parameters.get(
          "calendar",
        );

      if (
        calendarParameter !==
          "1" &&
        calendarParameter !==
          "print"
      ) {
        return;
      }

      parameters.delete(
        "calendar",
      );

      const query =
        parameters.toString();

      window.history.replaceState(
        {},
        "",
        `${window.location.pathname}${query ? `?${query}` : ""}`,
      );
    },
    [
      calendarOpen,
    ],
  );


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
          "/puzzle"
      ) {
        return "home";
      }

      if (
        pathname ===
          "/account"
      ) {
        return "home";
      }

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


  useEffect(
    () => {
      const pathname =
        window.location.pathname;

      queueMicrotask(
        () => {
          if (
            pathname ===
              "/services"
          ) {
            setShowPuzzle(
              false,
            );

            return;
          }

          if (
            pathname ===
              "/puzzle"
          ) {
            setShowPuzzle(
              true,
            );
          }
        },
      );
    },
    [],
  );


  // Explicit route guard: services never shows Puzzle.
  useEffect(() => {
    const syncViewFromPath =
      (): void => {
        const pathname =
          window.location.pathname;

        if (
          pathname ===
            "/puzzle"
        ) {
          setActiveView(
            "home",
          );

          setShowPuzzle(
            true,
          );

          return;
        }

        if (
          pathname ===
            "/account"
        ) {
          setActiveView(
            "home",
          );

          setShowPuzzle(
            false,
          );

          return;
        }

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
    activeEducationGyan,
    setActiveEducationGyan,
  ] =
    useState<ActiveEducationGyan | null>(
      null,
    );


  const [
    educationRatingsCardOpen,
    setEducationRatingsCardOpen,
  ] =
    useState(false);


  const [
    educationAttemptSummary,
    setEducationAttemptSummary,
  ] =
    useState<EducationAttemptSummary | null>(
      null,
    );



  useEffect(() => {
    const controller =
      new AbortController();

    void fetch(
      "/api/calendar-access/me",
      {
        cache:
          "no-store",

        credentials:
          "include",

        signal:
          controller.signal,
      },
    )
      .then(async (response) => {
        if (!response.ok) {
          return null;
        }

        return await response.json() as {
          guest?: {
            slug?: string;
            gyan_name?: string;
            email?: string | null;
            status?: string;
          } | null;
        };
      })
      .then((body) => {
        if (
          controller.signal.aborted
        ) {
          return;
        }

        const guest =
          body?.guest;

        const code =
          guest?.slug
            ?.trim()
            .toUpperCase() ??
          "";

        if (
          !guest ||
          guest.status !==
            "GUEST_ACTIVE" ||
          !code
        ) {
          setActiveEducationGyan(
            null,
          );
          return;
        }

        const email =
          guest.email
            ?.trim()
            .toLowerCase() ??
          "";

        setActiveEducationGyan({
          code,

          name:
            guest.gyan_name
              ?.trim() ||
            "GYAN Learner",

          email,

          emailKnown:
            Boolean(email),
        });
      })
      .catch((caught) => {
        if (
          caught instanceof
            DOMException &&
          caught.name ===
            "AbortError"
        ) {
          return;
        }

        setActiveEducationGyan(
          null,
        );
      });

    return () => {
      controller.abort();
    };
  }, []);


  const [
    showPuzzle,
    setShowPuzzle,
  ] =
    useState(
      () =>
        window.location.pathname ===
          "/puzzle",
    );


  const [
    puzzleExitOpen,
    setPuzzleExitOpen,
  ] =
    useState(false);


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


  function chooseEducationAfterPuzzle():
    void {
    setPuzzleExitOpen(false);
    openEducation();
  }


  function chooseServicesAfterPuzzle():
    void {
    setPuzzleExitOpen(false);
    openServices();
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


  const educationHeaderCode =
    activeEducationGyan
      ?.code ||
    educationCode
      ?.trim()
      .toUpperCase() ||
    "";

  const educationEmailKnown =
    activeEducationGyan
      ?.emailKnown ??
    true;

  const educationCodeLabel =
    educationHeaderCode ||
    "";

  const educationCodeNeedsRecovery =
    Boolean(
      educationHeaderCode &&
      !educationEmailKnown,
    );

  const educationBranding =
    activeView ===
      "education" ||
    educationHeaderCode.length >
      0;


  useEffect(
    () => {
      if (
        !educationRatingsCardOpen ||
        !educationHeaderCode
      ) {
        return;
      }

      const controller =
        new AbortController();

      void fetch(
        `/api/education/report?student=${encodeURIComponent(
          educationHeaderCode,
        )}`,
        {
          cache:
            "no-store",

          credentials:
            "include",

          signal:
            controller.signal,
        },
      )
        .then(async (response) => {
          if (!response.ok) {
            return null;
          }

          return await response.json() as {
            attemptSummary?: EducationAttemptSummary;
          };
        })
        .then((body) => {
          if (
            controller.signal
              .aborted
          ) {
            return;
          }

          setEducationAttemptSummary(
            body
              ?.attemptSummary ??
            {
              totalAttempts:
                0,

              recentAttempts:
                [],
            },
          );
        })
        .catch((caught) => {
          if (
            caught instanceof
              DOMException &&
            caught.name ===
              "AbortError"
          ) {
            return;
          }

          setEducationAttemptSummary(
            null,
          );
        })
        .finally(() => {
          // No synchronous loading state is needed here.
          // Loading is derived from the open card + missing summary.
        });

      return () => {
        controller.abort();
      };
    },
    [
      educationRatingsCardOpen,
      educationHeaderCode,
    ],
  );


  const educationAttemptSummaryLoading =
    educationRatingsCardOpen &&
    Boolean(
      educationHeaderCode,
    ) &&
    educationAttemptSummary ===
      null;

  const educationAttemptCount =
    educationAttemptSummary
      ?.totalAttempts ??
    0;

  const educationGemCount =
    3 +
    educationAttemptCount;


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
        <div
          className="public-home__brand public-home__brand-split"
        >
          <button
            type="button"
            className="public-home__brand-icon-button"
            onClick={() => {
              setEducationRatingsCardOpen(
                false,
              );

              setCalendarPrintDirect(
                true,
              );

              setCalendarOpen(
                true,
              );
            }}
            aria-label="Open Education Account and Calendar"
            title="Education Account & Calendar"
          >
            <span
              className="public-home__brand-icon"
              aria-hidden="true"
            >
              📖
            </span>
          </button>

          <div
            className="public-home__brand-copy-wrap"
          >
            <button
              type="button"
              className="public-home__brand-text public-home__brand-text-button"
              onClick={() =>
                setEducationRatingsCardOpen(
                  (current) =>
                    !current,
                )
              }
              aria-expanded={
                educationRatingsCardOpen
              }
              aria-haspopup="dialog"
              title={
                educationHeaderCode
                  ? `My Ratings [${educationHeaderCode}]${
                      educationCodeNeedsRecovery
                        ? "*"
                        : ""
                    }`
                  : "Education ratings"
              }
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
                {educationBranding
                  ? (
                      <>
                        Learn • Discover • Grow
                        {educationHeaderCode && (
                          <>
                            {" "}
                            <span
                              className="public-home__education-code"
                            >
                              [{educationCodeLabel}]
                            </span>
                            {educationCodeNeedsRecovery && (
                              <span
                                className="public-home__education-code-star"
                                aria-label="Recovery email not added"
                                title="Recovery email not added"
                              >
                                *
                              </span>
                            )}
                          </>
                        )}
                      </>
                    )
                  : (
                      <>
                        Order Online • Pick Up When
                        Ready • No Waiting
                      </>
                    )}
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
            </button>

            {educationRatingsCardOpen && (
              <section
                className="public-home__education-ratings-card"
                role="dialog"
                aria-label="Education ratings"
              >
                {educationHeaderCode
                  ? (
                      <>
                        <div
                          className="public-home__education-ratings-card-title"
                        >
                          <span
                            aria-hidden="true"
                          >
                            ⭐
                          </span>

                          <strong>
                            My Ratings [{educationHeaderCode}]
                            {educationCodeNeedsRecovery
                              ? "*"
                              : ""}
                          </strong>
                        </div>

                        <small>
                          Learning progress, scores and topic ratings are saved to this GYAN.
                        </small>

                        <div
                          className="public-home__education-attempt-strip"
                          aria-label="Education attempt results"
                        >
                          {educationAttemptSummaryLoading
                            ? (
                                <span
                                  className="public-home__education-attempt-loading"
                                >
                                  Loading attempts…
                                </span>
                              )
                            : educationAttemptSummary
                                ?.recentAttempts
                                .length
                              ? (
                                  educationAttemptSummary
                                    .recentAttempts
                                    .map(
                                      (
                                        attempt,
                                      ) => {
                                        const state =
                                          attempt.scorePercent >=
                                            80
                                            ? "green"
                                            : attempt.scorePercent >=
                                                50
                                              ? "yellow"
                                              : "red";

                                        return (
                                          <span
                                            key={
                                              attempt.id
                                            }
                                            className={`public-home__education-attempt-box public-home__education-attempt-box--${state}`}
                                            title={`${attempt.correctCount}/${attempt.questionCount} · ${attempt.scorePercent}% · ${attempt.topicCode}`}
                                            aria-label={`Attempt ${attempt.scorePercent} percent`}
                                          />
                                        );
                                      },
                                    )
                                )
                              : (
                                  <span
                                    className="public-home__education-attempt-empty"
                                  >
                                    No attempts yet
                                  </span>
                                )}
                        </div>

                        <div
                          className="public-home__education-rewards"
                          aria-label="GYAN rewards"
                        >
                          <span
                            title="3 Welcome Gems + 1 Gem per saved Education attempt"
                          >
                            💎 {educationGemCount}
                          </span>

                          <span
                            title="Lost & Found stickers available"
                          >
                            🏷️ 3
                          </span>
                        </div>

                        {educationCodeNeedsRecovery && (
                          <small
                            className="public-home__education-ratings-warning"
                          >
                            * Add a recovery email so this GYAN can be restored if browser or device access code is lost.
                          </small>
                        )}

                        <button
                          type="button"
                          onClick={() => {
                            setEducationRatingsCardOpen(
                              false,
                            );

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
                        >
                          Open My Ratings
                        </button>
                      </>
                    )
                  : (
                      <>
                        <div
                          className="public-home__education-ratings-card-title"
                        >
                          <span
                            aria-hidden="true"
                          >
                            ⭐
                          </span>

                          <strong>
                            My Ratings
                          </strong>
                        </div>

                        <small>
                          Activate a GYAN card to save learning progress and ratings automatically.
                        </small>

                        <button
                          type="button"
                          onClick={() => {
                            setEducationRatingsCardOpen(
                              false,
                            );

                            setCalendarOpen(
                              true,
                            );
                          }}
                        >
                          Open Education Account
                        </button>
                      </>
                    )}
              </section>
            )}
          </div>
        </div>
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
            aria-label="Open Services Portal"
            title="Services Portal"
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

            educationCode={
              educationHeaderCode ||
              undefined
            }

            educationEmailKnown={
              educationHeaderCode
                ? educationEmailKnown
                : undefined
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
                initialPrintOpen={
                  calendarPrintDirect
                }
                useCurrentGyan
                onClose={() => {
                  setCalendarOpen(
                    false,
                  );

                  setCalendarPrintDirect(
                    false,
                  );
                }}
              />
            )
            : activeView ===
                "education"
              ? (
                <EducationLearningHub
                  country={
                    educationCountry
                  }

                  activeGyanCode={
                    educationHeaderCode ||
                    undefined
                  }

                  activeGyanName={
                    activeEducationGyan
                      ?.name
                  }

                  activeGyanEmail={
                    activeEducationGyan
                      ?.email
                  }

                  activeGyanEmailKnown={
                    educationHeaderCode
                      ? educationEmailKnown
                      : undefined
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
                  educationHeaderCode
                    ? (
                        <StudentProgressPage
                          studentCode={
                            educationHeaderCode
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

                          onContinueLearning={() => {
                            openEducation();
                          }}
                        />
                      )
                    : (
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
                )
              : shellContent
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
          activeView ===
            "home" &&
          showPuzzle &&
          (
            <Puzzle
              onClose={() => {
                setShowPuzzle(
                  false,
                );

                setPuzzleExitOpen(
                  true,
                );
              }}

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


      {puzzleExitOpen && (
        <div
          className="public-home__portal-choice-overlay"
          role="presentation"
          onClick={() =>
            setPuzzleExitOpen(false)
          }
        >
          <section
            className="public-home__portal-choice"
            role="dialog"
            aria-modal="true"
            aria-labelledby="gyan-portal-choice-title"
            onClick={(event) =>
              event.stopPropagation()
            }
          >
            <button
              type="button"
              className="public-home__portal-choice-close"
              aria-label="Close"
              onClick={() =>
                setPuzzleExitOpen(false)
              }
            >
              ×
            </button>

            <h2 id="gyan-portal-choice-title">
              Where would you like to go?
            </h2>

            <p>
              Continue learning, or explore what else GYAN can help you do.
            </p>

            <div className="public-home__portal-choice-actions">
              <button
                type="button"
                className="public-home__portal-choice-card public-home__portal-choice-card--education"
                onClick={
                  chooseEducationAfterPuzzle
                }
              >
                <span
                  className="public-home__portal-choice-icon"
                  aria-hidden="true"
                >
                  🎓
                </span>

                <strong>
                  Education Portal
                </strong>

                <small>
                  Continue learning • Practice • Track progress
                </small>

                <b>
                  Continue Learning
                </b>
              </button>

              <button
                type="button"
                className="public-home__portal-choice-card public-home__portal-choice-card--services"
                onClick={
                  chooseServicesAfterPuzzle
                }
              >
                <span
                  className="public-home__portal-choice-icon"
                  aria-hidden="true"
                >
                  🧰
                </span>

                <strong>
                  Services Portal
                </strong>

                <small>
                  Printing • Local services • Get things done
                </small>

                <b>
                  Explore Services
                </b>
              </button>
            </div>
          </section>
        </div>
      )}
    </div>
  );
}