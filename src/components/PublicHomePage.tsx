import {
  type ReactNode,
  useEffect,
  useMemo,
  useState,
} from "react";

import {
  createPortal,
} from "react-dom";

import FeaturedServiceCard
  from "./FeaturedServiceCard";

import Puzzle
  from "./Puzzle";

import GyanHomeChooser, {
  type GyanHomeDestination,
} from "./GyanHomeChooser";

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

import GWinkPage
  from "./GWinkPage";

import "./PublicHomePage.css";

import PuzzleRatingsStrip
  from "./PuzzleRatingsStrip";


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

  adminAuthenticated?:
    boolean;

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

  categories: {
    gradeCode: string;
    uniqueQuestionsAttempted: number;
    answersCount: number;
    correctAnswers: number;
    scorePercent: number | null;
    updatedAt: string;
  }[];
};


type RecentGWinkMessage = {
  id: number;
  winkToken: string;
  resourceToken: string;
  kind: string;
  preview: string;
  direction: "sent" | "received";
  senderDisplayName: string;
  senderCode?: string | null;
  recipientDisplayName?: string | null;
  recipientCode?: string | null;
  read: boolean;
  createdAt: string;
};


type GyanGemTransaction = {
  id: number;
  amount: number;
  reason: string;
  createdAt: string;
};


type GyanFriendSummary = {
  code: string;
  displayName: string;
  addedAt: string;
};


type GyanServiceRequestDetail = {
  requestNumber: string;
  status: string;
  createdAt: string;
  updatedAt: string;
  serviceName: string;
  shopName: string;
  shopCode: string;
  customerName: string | null;
  phoneNumber: string | null;
  emailAddress: string | null;
  whatsAppNumber: string | null;
  estimatedAmountPaise: number | null;
  answers: Record<string, unknown>;
  files: {
    id: number;
    name: string;
    size: number;
    contentType: string | null;
  }[];
};


type GyanActivitySummary = {
  puzzles: {
    puzzleNumber: number;
    puzzleDate: string;
    fiveSolved: boolean;
    sevenSolved: boolean;
  }[];

  serviceRequests: {
    requestNumber: string;
    status: string;
    createdAt: string;
  }[];
};


function educationCategoryLabel(
  gradeCode: string,
): string {
  const normalized =
    gradeCode
      .trim()
      .toUpperCase();

  if (
    normalized.startsWith(
      "PROGRAM_",
    )
  ) {
    return normalized.replace(
      /^PROGRAM_/,
      "",
    );
  }

  if (
    normalized.startsWith(
      "GRADE_",
    )
  ) {
    return `Grade ${
      normalized.replace(
        /^GRADE_/,
        "",
      )
    }`;
  }

  if (
    normalized ===
      "PREK"
  ) {
    return "Pre-K";
  }

  return normalized;
}


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


const GYAN_HOME_DESTINATION_KEY =
  "gyan_home_destination_v1";

const GYAN_CARD_WELCOME_EVENT =
  "gyan-card-welcome-change";

const GYAN_CARD_WELCOME_SESSION_KEY =
  "gyan_card_welcome_open_v1";


function getRememberedGyanHome():
  GyanHomeDestination | null {
  try {
    const value =
      window.localStorage.getItem(
        GYAN_HOME_DESTINATION_KEY,
      );

    if (
      value === "education" ||
      value === "services" ||
      value === "puzzle"
    ) {
      return value;
    }
  } catch {
    // localStorage may be unavailable in privacy-restricted browsers.
  }

  return null;
}


export default function PublicHomePage({
  services,

  loading,

  onOpenAdmin,

  onOpenChat,

  onOpenMyShop,

  onRegisterMyShop,

  adminAuthenticated =
    false,

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
    homeChooserOpen,
    setHomeChooserOpen,
  ] =
    useState(
      () =>
        window.location.pathname ===
          "/" &&
        getRememberedGyanHome() ===
          null,
    );


  const [
    gyanCardWelcomeOpen,
    setGyanCardWelcomeOpen,
  ] =
    useState(
      () => {
        try {
          return (
            window.sessionStorage.getItem(
              GYAN_CARD_WELCOME_SESSION_KEY,
            ) === "1"
          );
        } catch {
          return false;
        }
      },
    );


  useEffect(
    () => {
      const syncWelcomeState =
        (): void => {
          try {
            setGyanCardWelcomeOpen(
              window.sessionStorage.getItem(
                GYAN_CARD_WELCOME_SESSION_KEY,
              ) === "1",
            );
          } catch {
            // Keep the current state when sessionStorage is unavailable.
          }
        };


      const handleWelcomeChange =
        (
          event:
            Event,
        ): void => {
        const customEvent =
          event as
            CustomEvent<{
              open?:
                boolean;
            }>;

        setGyanCardWelcomeOpen(
          Boolean(
            customEvent.detail
              ?.open,
          ),
        );
      };


      /*
       * Child effects can run before this listener is attached.
       * Synchronize once from sessionStorage so that the destination
       * chooser never remains visible underneath the New GYAN Card.
       */
      syncWelcomeState();

      window.addEventListener(
        GYAN_CARD_WELCOME_EVENT,
        handleWelcomeChange,
      );

      return () => {
        window.removeEventListener(
          GYAN_CARD_WELCOME_EVENT,
          handleWelcomeChange,
        );
      };
    },
    [],
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


  /*
   * Public/user-facing ABCD must always be the unified
   * gyan_accounts.code. education_students.student_code is
   * a legacy/internal Education identifier and must never
   * be used as the visible GYAN code.
   */
  const [
    canonicalGyanCode,
    setCanonicalGyanCode,
  ] =
    useState("");


  useEffect(
    () => {
      const controller =
        new AbortController();

      void fetch(
        "/api/gyan-identity",
        {
          method:
            "GET",

          credentials:
            "include",

          cache:
            "no-store",

          signal:
            controller.signal,
        },
      )
        .then(
          async (
            response,
          ) => {
            if (
              !response.ok
            ) {
              return null;
            }

            return await response.json() as {
              identity?: {
                code?: string;
              } | null;
            };
          },
        )
        .then(
          (
            body,
          ) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setCanonicalGyanCode(
              body?.identity
                ?.code
                ?.trim()
                .toUpperCase() ??
              "",
            );

          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              caught instanceof
                DOMException &&
              caught.name ===
                "AbortError"
            ) {
              return;
            }

            /*
             * Keep the calendar/session identity fallback.
             * Never fall back to Education student_code.
             */
            setCanonicalGyanCode(
              "",
            );

          },
        );

      return () => {
        controller.abort();
      };
    },
    [],
  );


  const [
    educationRatingsCardOpen,
    setEducationRatingsCardOpen,
  ] =
    useState(false);


  const [
    gemBalance,
    setGemBalance,
  ] =
    useState(0);

  const [
    gemTransactions,
    setGemTransactions,
  ] =
    useState<
      GyanGemTransaction[]
    >([]);

  const [
    gemLedgerLoading,
    setGemLedgerLoading,
  ] =
    useState(false);

  const [
    gemDialogOpen,
    setGemDialogOpen,
  ] =
    useState(false);


  const [
    recentGWinks,
    setRecentGWinks,
  ] =
    useState<
      RecentGWinkMessage[]
    >([]);

  const [
    recentGWinksLoading,
    setRecentGWinksLoading,
  ] =
    useState(false);

  const [
    openGWink,
    setOpenGWink,
  ] =
    useState<
      RecentGWinkMessage | null
    >(null);


  const [
    gyanFriends,
    setGyanFriends,
  ] =
    useState<
      GyanFriendSummary[]
    >([]);

  const [
    gyanFriendsLoading,
    setGyanFriendsLoading,
  ] =
    useState(false);

  const [
    friendsDialogOpen,
    setFriendsDialogOpen,
  ] =
    useState(false);


  const [
    educationAttemptSummary,
    setEducationAttemptSummary,
  ] =
    useState<EducationAttemptSummary | null>(
      null,
    );

  const [
    educationInitialCategoryCode,
    setEducationInitialCategoryCode,
  ] =
    useState("");


  const [
    gyanActivity,
    setGyanActivity,
  ] =
    useState<GyanActivitySummary>({
      puzzles: [],
      serviceRequests: [],
    });

  const [
    gyanActivityLoading,
    setGyanActivityLoading,
  ] =
    useState(false);


  const [
    serviceRequestDetail,
    setServiceRequestDetail,
  ] =
    useState<
      GyanServiceRequestDetail | null
    >(null);

  const [
    serviceRequestDetailLoading,
    setServiceRequestDetailLoading,
  ] =
    useState(false);

  const [
    serviceRequestDetailError,
    setServiceRequestDetailError,
  ] =
    useState("");

  const [
    serviceRequestDetailOpen,
    setServiceRequestDetailOpen,
  ] =
    useState(false);

  const [
    serviceRequestDetailExpanded,
    setServiceRequestDetailExpanded,
  ] =
    useState(false);





  useEffect(
    () => {
      if (
        !educationRatingsCardOpen &&
        !gemDialogOpen
      ) {
        return;
      }

      const controller =
        new AbortController();

      queueMicrotask(
        () => {
          if (
            !controller.signal.aborted
          ) {
            setGemLedgerLoading(
              true,
            );
          }
        },
      );

      void fetch(
        "/api/gyan-identity/gems",
        {
          method:
            "GET",

          cache:
            "no-store",

          credentials:
            "include",

          signal:
            controller.signal,
        },
      )
        .then(
          async (
            response,
          ) => {
            if (
              !response.ok
            ) {
              return null;
            }

            return await response.json() as {
              total?: number;
              transactions?: GyanGemTransaction[];
            };
          },
        )
        .then(
          (
            body,
          ) => {
            if (
              controller.signal.aborted ||
              !body
            ) {
              return;
            }

            setGemBalance(
              typeof body.total ===
                "number"
                ? body.total
                : 0,
            );

            setGemTransactions(
              Array.isArray(
                body.transactions,
              )
                ? body.transactions
                : [],
            );
          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              caught instanceof
                DOMException &&
              caught.name ===
                "AbortError"
            ) {
              return;
            }

            if (
              !controller.signal.aborted
            ) {
              setGemBalance(0);
              setGemTransactions([]);
            }
          },
        )
        .finally(
          () => {
            if (
              !controller.signal.aborted
            ) {
              setGemLedgerLoading(
                false,
              );
            }
          },
        );

      return () => {
        controller.abort();
      };
    },
    [
      educationRatingsCardOpen,
      gemDialogOpen,
    ],
  );


  useEffect(
    () => {
      if (
        !educationRatingsCardOpen
      ) {
        return;
      }

      const controller =
        new AbortController();

      queueMicrotask(
        () => {
          if (
            !controller.signal.aborted
          ) {
            setGyanFriendsLoading(
              true,
            );
          }
        },
      );

      void fetch(
        "/api/gyan-identity/friends",
        {
          method:
            "GET",

          cache:
            "no-store",

          credentials:
            "include",

          signal:
            controller.signal,
        },
      )
        .then(
          async (
            response,
          ) => {
            if (
              !response.ok
            ) {
              return {
                friends: [],
              };
            }

            return await response.json() as {
              friends?:
                GyanFriendSummary[];
            };
          },
        )
        .then(
          (
            body,
          ) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setGyanFriends(
              Array.isArray(
                body.friends,
              )
                ? body.friends
                : [],
            );
          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              caught instanceof
                DOMException &&
              caught.name ===
                "AbortError"
            ) {
              return;
            }

            if (
              !controller.signal.aborted
            ) {
              setGyanFriends(
                [],
              );
            }
          },
        )
        .finally(
          () => {
            if (
              !controller.signal.aborted
            ) {
              setGyanFriendsLoading(
                false,
              );
            }
          },
        );

      return () => {
        controller.abort();
      };
    },
    [
      educationRatingsCardOpen,
    ],
  );


  useEffect(
    () => {
      if (
        !educationRatingsCardOpen
      ) {
        return;
      }

      const controller =
        new AbortController();

      void Promise.resolve()
        .then(
          () => {
            if (
              !controller.signal.aborted
            ) {
              setRecentGWinksLoading(
                true,
              );
            }
          },
        );

      void fetch(
        "/api/safety-resources/winks/recent",
        {
          credentials:
            "include",
          cache:
            "no-store",
          signal:
            controller.signal,
        },
      )
        .then(
          async (
            response,
          ) => {
            if (!response.ok) {
              return {
                messages: [],
              };
            }

            return await response.json() as {
              messages?:
                RecentGWinkMessage[];
            };
          },
        )
        .then(
          (
            body,
          ) => {
            if (
              controller.signal.aborted
            ) {
              return;
            }

            setRecentGWinks(
              body.messages ??
              [],
            );
          },
        )
        .finally(
          () => {
            if (
              !controller.signal.aborted
            ) {
              setRecentGWinksLoading(
                false,
              );
            }
          },
        );

      return () => {
        controller.abort();
      };
    },
    [
      educationRatingsCardOpen,
      openGWink,
    ],
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
      () => {
        const pathname =
          window.location.pathname;

        return (
          pathname ===
            "/puzzle"
        );
      },
    );


  useEffect(
    () => {
      if (
        window.location.pathname !==
        "/"
      ) {
        return;
      }

      const destination =
        getRememberedGyanHome();

      if (!destination) {
        // eslint-disable-next-line react-hooks/set-state-in-effect
        setHomeChooserOpen(
          true,
        );

        setShowPuzzle(
          false,
        );

        return;
      }

      setHomeChooserOpen(
        false,
      );

      if (
        destination ===
        "education"
      ) {
        setEducationCountry(
          getEffectiveEducationCountry(),
        );

        setShowPuzzle(
          false,
        );

        setActiveView(
          "education",
        );

        window.history.replaceState(
          {},
          "",
          "/education",
        );

        return;
      }

      if (
        destination ===
        "services"
      ) {
        setShowPuzzle(
          false,
        );

        setActiveView(
          "services",
        );

        window.history.replaceState(
          {},
          "",
          "/services",
        );

        return;
      }

      setActiveView(
        "home",
      );

      setShowPuzzle(
        true,
      );

      window.history.replaceState(
        {},
        "",
        "/puzzle",
      );
    },
    [],
  );


  const [
    puzzleInstanceKey,
    setPuzzleInstanceKey,
  ] =
    useState(0);


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


  function chooseGyanHome(
    destination:
      GyanHomeDestination,
    remember:
      boolean,
  ): void {
    try {
      if (remember) {
        window.localStorage.setItem(
          GYAN_HOME_DESTINATION_KEY,
          destination,
        );
      } else {
        window.localStorage.removeItem(
          GYAN_HOME_DESTINATION_KEY,
        );
      }
    } catch {
      // Continue navigation even if localStorage is unavailable.
    }

    setHomeChooserOpen(
      false,
    );

    if (
      destination ===
      "education"
    ) {
      openEducation();
      return;
    }

    if (
      destination ===
      "services"
    ) {
      openServices();
      return;
    }

    setSearchText(
      "",
    );

    setSearchFocused(
      false,
    );

    setCalendarOpen(
      false,
    );

    setActiveView(
      "home",
    );

    setPuzzleInstanceKey(
      (current) =>
        current + 1,
    );

    setShowPuzzle(
      true,
    );

    window.history.pushState(
      {},
      "",
      "/puzzle",
    );
  }


  function openEducation():
    void {
    setHomeChooserOpen(
      false,
    );

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
    setHomeChooserOpen(
      false,
    );

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


  /*
   * Canonical public ABCD.
   *
   * First choice: /api/gyan-identity -> gyan_accounts.code.
   * Temporary fallback while that request is loading:
   * /api/calendar-access/me, which is also linked to the
   * unified GYAN account.
   *
   * Deliberately DO NOT use:
   *   - educationCode prop (legacy education student_code)
   *   - gyan_browser_code_v1 (browser recovery/internal value)
   */
  const educationHeaderCode =
    canonicalGyanCode ||
    activeEducationGyan
      ?.code
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
        )}&activity=1`,
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

              categories:
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


  useEffect(
    () => {
      if (
        !educationRatingsCardOpen
      ) {
        return;
      }

      const controller =
        new AbortController();

      queueMicrotask(
        () => {
          if (
            !controller.signal.aborted
          ) {
            setGyanActivityLoading(
              true,
            );
          }
        },
      );

      void fetch(
        "/api/gyan-activity",
        {
          cache:
            "no-store",

          credentials:
            "include",

          signal:
            controller.signal,
        },
      )
        .then(
          async (
            response,
          ) => {
            if (
              !response.ok
            ) {
              return null;
            }

            return await response.json() as
              GyanActivitySummary;
          },
        )
        .then(
          (
            body,
          ) => {
            if (
              controller.signal.aborted ||
              !body
            ) {
              return;
            }

            setGyanActivity({
              puzzles:
                Array.isArray(
                  body.puzzles,
                )
                  ? body.puzzles
                  : [],

              serviceRequests:
                Array.isArray(
                  body.serviceRequests,
                )
                  ? body.serviceRequests
                  : [],
            });
          },
        )
        .catch(
          (
            caught,
          ) => {
            if (
              caught instanceof
                DOMException &&
              caught.name ===
                "AbortError"
            ) {
              return;
            }

            if (
              !controller.signal.aborted
            ) {
              setGyanActivity({
                puzzles: [],
                serviceRequests: [],
              });
            }
          },
        )
        .finally(
          () => {
            if (
              !controller.signal.aborted
            ) {
              setGyanActivityLoading(
                false,
              );
            }
          },
        );

      return () => {
        controller.abort();
      };
    },
    [
      educationRatingsCardOpen,
    ],
  );


  const educationAttemptSummaryLoading =
    educationRatingsCardOpen &&
    Boolean(
      educationHeaderCode,
    ) &&
    educationAttemptSummary ===
      null;


  function serviceAnswerLabel(
    rawKey:
      string,
  ): string {
    const leaf =
      rawKey
        .split(".")
        .pop() ??
      rawKey;

    return leaf
      .replace(
        /_/g,
        " ",
      )
      .replace(
        /\b\w/g,
        (
          value,
        ) =>
          value.toUpperCase(),
      );
  }


  function serviceAnswerValue(
    value:
      unknown,
  ): string {
    if (
      value === null ||
      value === undefined ||
      value === ""
    ) {
      return "—";
    }

    if (
      typeof value ===
        "boolean"
    ) {
      return value
        ? "Yes"
        : "No";
    }

    if (
      Array.isArray(
        value,
      )
    ) {
      return value
        .map(
          (
            item,
          ) =>
            String(item),
        )
        .join(", ");
    }

    if (
      typeof value ===
        "object"
    ) {
      try {
        return JSON.stringify(
          value,
        );
      } catch {
        return String(
          value,
        );
      }
    }

    return String(
      value,
    );
  }


  async function openServiceRequestDetail(
    requestNumber:
      string,
  ): Promise<void> {
    setEducationRatingsCardOpen(
      false,
    );

    setServiceRequestDetail(
      null,
    );

    setServiceRequestDetailError(
      "",
    );

    setServiceRequestDetailLoading(
      true,
    );

    setServiceRequestDetailExpanded(
      false,
    );

    setServiceRequestDetailOpen(
      true,
    );

    try {
      const response =
        await fetch(
          `/api/gyan-identity/service-request?number=${encodeURIComponent(
            requestNumber,
          )}`,
          {
            method:
              "GET",

            cache:
              "no-store",

            credentials:
              "include",
          },
        );

      const body =
        await response.json() as {
          request?:
            GyanServiceRequestDetail;

          error?:
            string;
        };

      if (
        !response.ok ||
        !body.request
      ) {
        throw new Error(
          body.error ??
            "The service request could not be loaded.",
        );
      }

      setServiceRequestDetail(
        body.request,
      );
    } catch (
      caught
    ) {
      setServiceRequestDetailError(
        caught instanceof
          Error
          ? caught.message
          : "The service request could not be loaded.",
      );
    } finally {
      setServiceRequestDetailLoading(
        false,
      );
    }
  }


  function gemReasonLabel(
    reason:
      string,
  ): string {
    if (
      reason ===
        "WELCOME_UNIFIED_GYAN"
    ) {
      return "Welcome Gems";
    }

    if (
      reason ===
        "WELCOME_PRINT"
    ) {
      return "Printed GYAN welcome Gems";
    }

    if (
      reason.startsWith(
        "PUZZLE:",
      )
    ) {
      return "Puzzle reward";
    }

    if (
      reason.startsWith(
        "TEST:",
      ) ||
      reason.startsWith(
        "EDUCATION:",
      )
    ) {
      return "Education / test reward";
    }

    if (
      reason.startsWith(
        "ADMIN:",
      )
    ) {
      return "Admin Gem award";
    }

    return reason
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
                className="public-home__education-ratings-card public-home__activity-dashboard"
                role="dialog"
                aria-label="GYAN activity"
              >
                <div className="public-home__activity-top">
                  <div
                    className="public-home__activity-heading"
                    style={{
                      display:
                        "flex",
                      alignItems:
                        "center",
                      gap:
                        "6px",
                      minWidth:
                        0,
                    }}
                  >
                    <strong>
                      My Activity
                      {educationHeaderCode
                        ? ` [${educationHeaderCode}]`
                        : ""}
                    </strong>

                    <button
                      type="button"
                      onClick={() => {
                        setEducationRatingsCardOpen(
                          false,
                        );

                        setGemDialogOpen(
                          true,
                        );
                      }}
                      title="View Gem activity"
                      aria-label={`${gemBalance} Gems. View Gem activity.`}
                      style={{
                        padding:
                          "1px 5px",
                        border:
                          "1px solid rgba(15, 23, 42, 0.12)",
                        borderRadius:
                          "7px",
                        background:
                          "#fff",
                        color:
                          "#475569",
                        font:
                          "inherit",
                        fontSize:
                          "0.68rem",
                        fontWeight:
                          900,
                        cursor:
                          "pointer",
                        whiteSpace:
                          "nowrap",
                      }}
                    >
                      💎 {
                        gemLedgerLoading
                          ? "…"
                          : gemBalance
                      }
                    </button>
                  </div>

                  <button
                    type="button"
                    className="public-home__activity-close"
                    aria-label="Close"
                    onClick={() =>
                      setEducationRatingsCardOpen(
                        false,
                      )
                    }
                  >
                    ×
                  </button>
                </div>

                <div
                  className="public-home__activity-row public-home__activity-inline-row"
                  style={{
                    display:
                      "flex",
                    alignItems:
                      "center",
                    gap:
                      "6px",
                    minWidth:
                      0,
                  }}
                >
                  <div
                    aria-label={`${gyanFriends.length} friends`}
                    title={`${gyanFriends.length} friends`}
                    style={{
                      display:
                        "flex",
                      alignItems:
                        "center",
                      gap:
                        "2px",
                      minWidth:
                        0,
                      overflow:
                        "hidden",
                    }}
                  >
                    {
                      gyanFriendsLoading
                        ? (
                          <span
                            style={{
                              fontSize:
                                "0.7rem",
                            }}
                          >
                            👥 …
                          </span>
                        )
                        : gyanFriends
                            .slice(
                              0,
                              Math.min(
                                10,
                                gyanFriends.length,
                              ),
                            )
                            .map(
                              (
                                friend,
                              ) => (
                                <span
                                  key={
                                    friend.code
                                  }
                                  title={`${friend.displayName} [${friend.code}]`}
                                  aria-hidden="true"
                                  style={{
                                    flex:
                                      "0 0 auto",
                                    fontSize:
                                      "0.72rem",
                                    lineHeight:
                                      1,
                                  }}
                                >
                                  👥
                                </span>
                              ),
                            )
                    }
                  </div>

                  {
                    !gyanFriendsLoading &&
                    gyanFriends.length >
                      10 && (
                      <span
                        style={{
                          flex:
                            "0 0 auto",
                          color:
                            "#64748b",
                          fontSize:
                            "0.58rem",
                          whiteSpace:
                            "nowrap",
                        }}
                      >
                        ... {
                          gyanFriends.length -
                          10
                        } more
                      </span>
                    )
                  }

                  <button
                    type="button"
                    onClick={() =>
                      setFriendsDialogOpen(
                        true,
                      )
                    }
                    title="See all friends"
                    style={{
                      flex:
                        "0 0 auto",
                      marginLeft:
                        "2px",
                      padding:
                        "0",
                      border:
                        "0",
                      background:
                        "transparent",
                      color:
                        "#475569",
                      font:
                        "inherit",
                      fontSize:
                        "0.58rem",
                      fontWeight:
                        800,
                      textDecoration:
                        "underline",
                      cursor:
                        "pointer",
                      whiteSpace:
                        "nowrap",
                    }}
                  >
                    See all
                  </button>
                </div>

                {friendsDialogOpen && (
                  <div
                    role="presentation"
                    onClick={() =>
                      setFriendsDialogOpen(
                        false,
                      )
                    }
                    style={{
                      position:
                        "fixed",
                      inset:
                        0,
                      zIndex:
                        1200,
                      display:
                        "grid",
                      placeItems:
                        "center",
                      padding:
                        "16px",
                      background:
                        "rgba(15, 23, 42, 0.46)",
                    }}
                  >
                    <section
                      role="dialog"
                      aria-modal="true"
                      aria-label="Friends"
                      onClick={(
                        event,
                      ) =>
                        event.stopPropagation()
                      }
                      style={{
                        boxSizing:
                          "border-box",
                        width:
                          "min(100%, 360px)",
                        maxHeight:
                          "min(70vh, 520px)",
                        display:
                          "grid",
                        gridTemplateRows:
                          "auto minmax(0, 1fr) auto",
                        overflow:
                          "hidden",
                        border:
                          "1px solid #d8dee8",
                        borderRadius:
                          "13px",
                        background:
                          "#fff",
                        boxShadow:
                          "0 18px 48px rgba(15, 23, 42, 0.22)",
                      }}
                    >
                      <div
                        style={{
                          padding:
                            "11px 12px 8px",
                          borderBottom:
                            "1px solid #e5e7eb",
                          textAlign:
                            "center",
                          fontSize:
                            "0.8rem",
                          fontWeight:
                            900,
                        }}
                      >
                        👥 Friends ({
                          gyanFriends.length
                        })
                      </div>

                      <div
                        style={{
                          overflowY:
                            "auto",
                          padding:
                            "7px",
                        }}
                      >
                        {
                          gyanFriendsLoading
                            ? (
                              <div
                                style={{
                                  padding:
                                    "15px",
                                  textAlign:
                                    "center",
                                  fontSize:
                                    "0.72rem",
                                }}
                              >
                                Loading…
                              </div>
                            )
                            : gyanFriends.length
                              ? gyanFriends.map(
                                  (
                                    friend,
                                  ) => (
                                    <button
                                      key={
                                        friend.code
                                      }
                                      type="button"
                                      onClick={() => {
                                        setFriendsDialogOpen(
                                          false,
                                        );

                                        setEducationRatingsCardOpen(
                                          false,
                                        );

                                        window.open(
                                          `/${friend.code.toLowerCase()}`,
                                          "_blank",
                                          "noopener,noreferrer",
                                        );
                                      }}
                                      style={{
                                        width:
                                          "100%",
                                        display:
                                          "grid",
                                        gridTemplateColumns:
                                          "minmax(0, 1fr) auto",
                                        gap:
                                          "8px",
                                        alignItems:
                                          "center",
                                        padding:
                                          "9px 10px",
                                        border:
                                          "0",
                                        borderBottom:
                                          "1px solid #eef1f4",
                                        background:
                                          "#fff",
                                        color:
                                          "#1f2937",
                                        font:
                                          "inherit",
                                        cursor:
                                          "pointer",
                                        textAlign:
                                          "left",
                                      }}
                                    >
                                      <strong
                                        style={{
                                          overflow:
                                            "hidden",
                                          textOverflow:
                                            "ellipsis",
                                          whiteSpace:
                                            "nowrap",
                                          fontSize:
                                            "0.72rem",
                                        }}
                                      >
                                        {
                                          friend.displayName
                                        }
                                      </strong>

                                      <span
                                        style={{
                                          color:
                                            "#9a5b24",
                                          fontSize:
                                            "0.65rem",
                                          fontWeight:
                                            800,
                                        }}
                                      >
                                        [{
                                          friend.code
                                        }]
                                      </span>
                                    </button>
                                  ),
                                )
                              : (
                                <div
                                  style={{
                                    padding:
                                      "17px",
                                    textAlign:
                                      "center",
                                    color:
                                      "#64748b",
                                    fontSize:
                                      "0.72rem",
                                  }}
                                >
                                  No friends yet.
                                </div>
                              )
                        }
                      </div>

                      <div
                        style={{
                          padding:
                            "8px",
                          borderTop:
                            "1px solid #e5e7eb",
                        }}
                      >
                        <button
                          type="button"
                          onClick={() =>
                            setFriendsDialogOpen(
                              false,
                            )
                          }
                          style={{
                            width:
                              "100%",
                            minHeight:
                              "30px",
                            border:
                              "1px solid #cbd5e1",
                            borderRadius:
                              "8px",
                            background:
                              "#f8fafc",
                            color:
                              "#334155",
                            font:
                              "inherit",
                            fontSize:
                              "0.68rem",
                            fontWeight:
                              800,
                            cursor:
                              "pointer",
                          }}
                        >
                          Close
                        </button>
                      </div>
                    </section>
                  </div>
                )}

                <div
                  className="public-home__activity-row public-home__activity-winks public-home__activity-inline-row"
                >
                  <strong>
                    G-Winks:
                  </strong>

                  <div
                    className="public-home__activity-strip"
                    style={{
                      display:
                        "flex",
                      alignItems:
                        "center",
                      gap:
                        "4px",
                      flexWrap:
                        "nowrap",
                      overflowX:
                        "auto",
                    }}
                  >
                    {
                      recentGWinksLoading ? (
                        <span className="public-home__activity-loading">
                          Loading…
                        </span>
                      ) : recentGWinks.length ? (
                        recentGWinks.map(
                          (
                            wink,
                          ) => (
                            <button
                              key={
                                wink.id
                              }
                              type="button"
                              className={`public-home__activity-wink public-home__activity-wink--${wink.direction}`}
                              title={`${
                                wink.direction ===
                                  "sent"
                                  ? "Sent"
                                  : "Received"
                              } · ${
                                wink.read
                                  ? "Read"
                                  : "Unread"
                              } · ${
                                wink.direction ===
                                  "sent"
                                  ? wink.recipientDisplayName ??
                                    wink.recipientCode ??
                                    "GYAN recipient"
                                  : wink.senderDisplayName
                              } · ${wink.preview}`}
                              aria-label={`${
                                wink.direction ===
                                  "sent"
                                  ? "Sent"
                                  : "Received"
                              } ${wink.read ? "read" : "unread"} G-Wink`}
                              onClick={() => {
                                setRecentGWinks(
                                  (
                                    current,
                                  ) =>
                                    current.map(
                                      (
                                        item,
                                      ) =>
                                        item.id ===
                                          wink.id
                                          ? {
                                              ...item,
                                              read:
                                                true,
                                            }
                                          : item,
                                    ),
                                );

                                setOpenGWink(
                                  wink,
                                );
                              }}
                              style={{
                                flex:
                                  "0 0 auto",
                                width:
                                  "28px",
                                height:
                                  "28px",
                                padding:
                                  0,
                                border:
                                  "1px solid rgba(15, 23, 42, 0.16)",
                                background:
                                  wink.read
                                    ? "#86c98a"
                                    : "#f5d76e",
                                cursor:
                                  "pointer",
                                fontSize:
                                  "0.9rem",
                                lineHeight:
                                  1,
                              }}
                            >
                              ✉
                            </button>
                          ),
                        )
                      ) : (
                        <span className="public-home__activity-empty">
                          No G-Winks
                        </span>
                      )
                    }
                  </div>
                </div>

                <div className="public-home__activity-puzzle-summary">
                  <PuzzleRatingsStrip
                    onOpenPuzzle={() => {
                    setEducationRatingsCardOpen(
                      false,
                    );

                    setSearchFocused(
                      false,
                    );

                    setActiveView(
                      "home",
                    );

                    setPuzzleInstanceKey(
                      (current) =>
                        current + 1,
                    );

                    setShowPuzzle(
                      true,
                    );

                    window.history.pushState(
                      {},
                      "",
                      "/puzzle",
                    );
                    }}
                  />
                </div>

                <div className="public-home__activity-row public-home__activity-inline-row">
                  <strong>
                    Service Requests:
                  </strong>

                  <div className="public-home__activity-strip">
                    {gyanActivityLoading
                      ? (
                          <span className="public-home__activity-loading">
                            Loading…
                          </span>
                        )
                      : gyanActivity.serviceRequests.length
                        ? (
                            gyanActivity.serviceRequests.map(
                              (
                                request,
                              ) => {
                                const normalized =
                                  request.status
                                    .trim()
                                    .toLowerCase();

                                const closed =
                                  [
                                    "completed",
                                    "ready",
                                    "closed",
                                    "fulfilled",
                                  ].includes(
                                    normalized,
                                  );

                                return (
                                  <button
                                    key={
                                      request.requestNumber
                                    }
                                    type="button"
                                    className={`public-home__activity-box public-home__activity-box--${
                                      closed
                                        ? "green"
                                        : "yellow"
                                    }`}
                                    title={`${request.requestNumber} · ${request.status} · View details`}
                                    aria-label={`View service request ${request.requestNumber}`}
                                    onClick={() => {
                                      void openServiceRequestDetail(
                                        request.requestNumber,
                                      );
                                    }}
                                    style={{
                                      padding:
                                        0,
                                      cursor:
                                        "pointer",
                                    }}
                                  />
                                );
                              },
                            )
                          )
                        : (
                            <span className="public-home__activity-empty">
                              No recent requests
                            </span>
                          )}
                  </div>
                </div>

                <div
                  className="public-home__activity-row"
                  style={{
                    display:
                      "grid",
                    gap:
                      "4px",
                  }}
                >
                  <strong>
                    Education:
                  </strong>

                  {educationAttemptSummaryLoading
                    ? (
                        <span className="public-home__activity-loading">
                          Loading…
                        </span>
                      )
                    : educationAttemptSummary
                        ?.categories
                        .length
                      ? (
                          educationAttemptSummary
                            .categories
                            .map(
                              (
                                category,
                              ) => {
                                const score =
                                  category.scorePercent;

                                const background =
                                  score == null
                                    ? "#f3f5f7"
                                    : score >=
                                        80
                                      ? "#eaf7ed"
                                      : score >=
                                          50
                                        ? "#fff9dc"
                                        : "#fff0ec";

                                const border =
                                  score == null
                                    ? "#d5dce4"
                                    : score >=
                                        80
                                      ? "#78b985"
                                      : score >=
                                          50
                                        ? "#d8bd54"
                                        : "#ce826b";

                                return (
                                  <button
                                    key={
                                      category.gradeCode
                                    }
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

                                      setEducationInitialCategoryCode(
                                        category.gradeCode,
                                      );

                                      setActiveView(
                                        "education",
                                      );

                                      window.history.pushState(
                                        {},
                                        "",
                                        "/education",
                                      );
                                    }}
                                    style={{
                                      display:
                                        "grid",
                                      gridTemplateColumns:
                                        "minmax(0, 1fr) auto",
                                      alignItems:
                                        "center",
                                      gap:
                                        "8px",
                                      width:
                                        "100%",
                                      minHeight:
                                        "25px",
                                      padding:
                                        "3px 6px",
                                      border:
                                        `1px solid ${border}`,
                                      borderRadius:
                                        "7px",
                                      background,
                                      textAlign:
                                        "left",
                                      cursor:
                                        "pointer",
                                    }}
                                    title={`${category.uniqueQuestionsAttempted} unique questions attempted · ${
                                      score == null
                                        ? "New"
                                        : `${score}% accuracy`
                                    }`}
                                  >
                                    <strong
                                      style={{
                                        overflow:
                                          "hidden",
                                        textOverflow:
                                          "ellipsis",
                                        whiteSpace:
                                          "nowrap",
                                        fontSize:
                                          "0.64rem",
                                      }}
                                    >
                                      {
                                        educationCategoryLabel(
                                          category.gradeCode,
                                        )
                                      }
                                    </strong>

                                    <small
                                      style={{
                                        whiteSpace:
                                          "nowrap",
                                        fontSize:
                                          "0.6rem",
                                      }}
                                    >
                                      {
                                        category.uniqueQuestionsAttempted
                                      } attempted · {
                                        score == null
                                          ? "New"
                                          : `${score}%`
                                      }
                                    </small>
                                  </button>
                                );
                              },
                            )
                        )
                      : (
                          <span className="public-home__activity-empty">
                            No attempts yet
                          </span>
                        )}
                </div>

                {educationCodeNeedsRecovery && (
                  <small className="public-home__education-ratings-warning">
                    * Add a recovery email so this GYAN can be restored if browser or device access code is lost.
                  </small>
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
  aria-label="Open GYAN Puzzle"
  title="GYAN Puzzle"
  onClick={() => {
    setSearchFocused(
      false,
    );

    setCalendarOpen(
      false,
    );

    setActiveView(
      "home",
    );

    setPuzzleInstanceKey(
      (current) =>
        current + 1,
    );

    setShowPuzzle(
      true,
    );

    window.history.pushState(
      {},
      "",
      "/puzzle",
    );
  }}
>
  🧩
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

          {openGWink &&
            createPortal(
              <div
                role="dialog"
                aria-modal="true"
                aria-label="G-Wink"
                style={{
                  position:
                    "fixed",
                  inset:
                    0,
                  zIndex:
                    2147483000,
                  display:
                    "grid",
                  placeItems:
                    "start center",
                  padding:
                    "58px 10px 14px",
                  background:
                    "rgb(15 23 42 / 34%)",
                  overflowY:
                    "auto",
                }}
                onClick={() =>
                  setOpenGWink(
                    null,
                  )
                }
              >
                <div
                  style={{
                    position:
                      "relative",
                    zIndex:
                      2147483001,
                    width:
                      "min(96vw, 720px)",
                  }}
                  onClick={(
                    event,
                  ) =>
                    event.stopPropagation()
                  }
                >
                  <GWinkPage
                    token={
                      openGWink.resourceToken
                    }
                    winkToken={
                      openGWink.winkToken
                    }
                    displayName={
                      openGWink.senderDisplayName
                    }
                    onBack={() =>
                      setOpenGWink(
                        null,
                      )
                    }
                  />
                </div>
              </div>,
              document.body,
            )}

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

            isAdminAuthenticated={
              adminAuthenticated
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
                isAdmin={
                  adminAuthenticated
                }
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

                  initialCategoryCode={
                    educationInitialCategoryCode ||
                    undefined
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

                  adminAuthenticated={
                    adminAuthenticated
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
                        <>
                          <PuzzleRatingsStrip
                            onOpenPuzzle={() => {
                              setSearchFocused(
                                false,
                              );

                              setActiveView(
                                "home",
                              );

                              setPuzzleInstanceKey(
                                (current) =>
                                  current + 1,
                              );

                              setShowPuzzle(
                                true,
                              );

                              window.history.pushState(
                                {},
                                "",
                                "/puzzle",
                              );
                            }}
                          />

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
                        </>
                      )
                    : (
                        <>
                          <PuzzleRatingsStrip
                            onOpenPuzzle={() => {
                              setSearchFocused(
                                false,
                              );

                              setActiveView(
                                "home",
                              );

                              setPuzzleInstanceKey(
                                (current) =>
                                  current + 1,
                              );

                              setShowPuzzle(
                                true,
                              );

                              window.history.pushState(
                                {},
                                "",
                                "/puzzle",
                              );
                            }}
                          />

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
                        </>
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
          !homeChooserOpen &&
          showPuzzle &&
          (
            <Puzzle
              key={
                puzzleInstanceKey
              }

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

      {gemDialogOpen && (
        <div
          role="presentation"
          onClick={() =>
            setGemDialogOpen(
              false,
            )
          }
          style={{
            position:
              "fixed",
            top:
              "60px",
            left:
              "50%",
            zIndex:
              1250,
            width:
              "min(calc(100% - 20px), 390px)",
            transform:
              "translateX(-50%)",
          }}
        >
          <section
            role="dialog"
            aria-modal="true"
            aria-label="GYAN Gems"
            onClick={(
              event,
            ) =>
              event.stopPropagation()
            }
            style={{
              boxSizing:
                "border-box",
              width:
                "100%",
              maxHeight:
                "min(calc(100vh - 72px), 620px)",
              display:
                "grid",
              gridTemplateRows:
                "auto minmax(0, 1fr) auto",
              overflow:
                "hidden",
              border:
                "1px solid #d8dee8",
              borderRadius:
                "0 0 14px 14px",
              background:
                "#fff",
              boxShadow:
                "0 12px 30px rgba(15, 23, 42, 0.20)",
            }}
          >
            <div
              style={{
                padding:
                  "12px",
                borderBottom:
                  "1px solid #e5e7eb",
                textAlign:
                  "center",
              }}
            >
              <strong
                style={{
                  display:
                    "block",
                  fontSize:
                    "0.92rem",
                }}
              >
                💎 {
                  gemBalance
                } Gems
              </strong>

              <small
                style={{
                  color:
                    "#64748b",
                }}
              >
                Gem activity
              </small>
            </div>

            <div
              style={{
                overflowY:
                  "auto",
                padding:
                  "10px 12px",
              }}
            >
              <strong
                style={{
                  display:
                    "block",
                  marginBottom:
                    "6px",
                  fontSize:
                    "0.72rem",
                }}
              >
                Transactions
              </strong>

              {
                gemLedgerLoading
                  ? (
                    <div
                      style={{
                        padding:
                          "10px 0",
                        fontSize:
                          "0.7rem",
                      }}
                    >
                      Loading…
                    </div>
                  )
                  : gemTransactions.length
                    ? gemTransactions.map(
                        (
                          transaction,
                        ) => (
                          <div
                            key={
                              transaction.id
                            }
                            style={{
                              display:
                                "grid",
                              gridTemplateColumns:
                                "minmax(0, 1fr) auto",
                              gap:
                                "8px",
                              padding:
                                "7px 0",
                              borderBottom:
                                "1px solid #eef1f4",
                            }}
                          >
                            <div
                              style={{
                                minWidth:
                                  0,
                              }}
                            >
                              <strong
                                style={{
                                  display:
                                    "block",
                                  fontSize:
                                    "0.68rem",
                                }}
                              >
                                {
                                  gemReasonLabel(
                                    transaction.reason,
                                  )
                                }
                              </strong>

                              <small
                                style={{
                                  color:
                                    "#64748b",
                                  fontSize:
                                    "0.58rem",
                                }}
                              >
                                {
                                  new Date(
                                    transaction.createdAt,
                                  ).toLocaleString()
                                }
                              </small>
                            </div>

                            <strong
                              style={{
                                color:
                                  transaction.amount >=
                                    0
                                    ? "#166534"
                                    : "#b42318",
                                fontSize:
                                  "0.72rem",
                                whiteSpace:
                                  "nowrap",
                              }}
                            >
                              {
                                transaction.amount >=
                                  0
                                  ? "+"
                                  : ""
                              }{
                                transaction.amount
                              } 💎
                            </strong>
                          </div>
                        ),
                      )
                    : (
                      <div
                        style={{
                          padding:
                            "8px 0",
                          color:
                            "#64748b",
                          fontSize:
                            "0.68rem",
                        }}
                      >
                        No Gem transactions yet.
                      </div>
                    )
              }

              <div
                style={{
                  marginTop:
                    "13px",
                  padding:
                    "10px",
                  border:
                    "1px solid #e2e8f0",
                  borderRadius:
                    "10px",
                  background:
                    "#f8fafc",
                }}
              >
                <strong
                  style={{
                    display:
                      "block",
                    marginBottom:
                      "6px",
                    fontSize:
                      "0.72rem",
                  }}
                >
                  Earn more Gems
                </strong>

                <div
                  style={{
                    display:
                      "grid",
                    gap:
                      "5px",
                    fontSize:
                      "0.66rem",
                  }}
                >
                  <span>
                    🧩 Solve a puzzle — <strong>5 Gems</strong>
                  </span>

                  <span>
                    🎓 Take tests — <strong>1 Gem per question</strong>
                  </span>

                  <span>
                    ✉️ Contact GYAN admin for more Gems.
                  </span>
                </div>

                <a
                  href="mailto:admin@gyan.cc?subject=GYAN%20Gems"
                  style={{
                    display:
                      "inline-block",
                    marginTop:
                      "7px",
                    color:
                      "#334155",
                    fontSize:
                      "0.64rem",
                    fontWeight:
                      800,
                  }}
                >
                  Contact admin
                </a>
              </div>
            </div>

            <div
              style={{
                padding:
                  "8px",
                borderTop:
                  "1px solid #e5e7eb",
              }}
            >
              <button
                type="button"
                onClick={() =>
                  setGemDialogOpen(
                    false,
                  )
                }
                style={{
                  width:
                    "100%",
                  minHeight:
                    "30px",
                  border:
                    "1px solid #cbd5e1",
                  borderRadius:
                    "8px",
                  background:
                    "#f8fafc",
                  color:
                    "#334155",
                  font:
                    "inherit",
                  fontSize:
                    "0.68rem",
                  fontWeight:
                    800,
                  cursor:
                    "pointer",
                }}
              >
                Close
              </button>
            </div>
          </section>
        </div>
      )}



      {serviceRequestDetailOpen && (
        <div
          role="presentation"
          onClick={() =>
            setServiceRequestDetailOpen(
              false,
            )
          }
          style={{
            position:
              "fixed",
            top:
              "60px",
            left:
              "50%",
            zIndex:
              1260,
            width:
              "min(calc(100% - 20px), 430px)",
            transform:
              "translateX(-50%)",
          }}
        >
          <section
            role="dialog"
            aria-modal="true"
            aria-label="Service request details"
            onClick={(
              event,
            ) =>
              event.stopPropagation()
            }
            style={{
              boxSizing:
                "border-box",
              width:
                "100%",
              maxHeight:
                "min(calc(100vh - 72px), 680px)",
              display:
                "grid",
              gridTemplateRows:
                "auto minmax(0, 1fr) auto",
              overflow:
                "hidden",
              border:
                "1px solid #d8dee8",
              borderRadius:
                "0 0 14px 14px",
              background:
                "#fff",
              boxShadow:
                "0 12px 30px rgba(15, 23, 42, 0.20)",
            }}
          >
            <div
              style={{
                position:
                  "relative",
                padding:
                  "11px 42px 8px",
                borderBottom:
                  "1px solid #e5e7eb",
                textAlign:
                  "center",
              }}
            >
              <strong
                style={{
                  display:
                    "block",
                  fontSize:
                    "0.86rem",
                }}
              >
                🧰 Service Request
              </strong>

              {serviceRequestDetail && (
                <small
                  style={{
                    color:
                      "#64748b",
                  }}
                >
                  {
                    serviceRequestDetail.requestNumber
                  }
                </small>
              )}

              <button
                type="button"
                onClick={() =>
                  setServiceRequestDetailOpen(
                    false,
                  )
                }
                aria-label="Close service request"
                title="Close"
                style={{
                  position:
                    "absolute",
                  top:
                    "7px",
                  right:
                    "8px",
                  width:
                    "28px",
                  height:
                    "28px",
                  display:
                    "grid",
                  placeItems:
                    "center",
                  padding:
                    0,
                  border:
                    "1px solid #d7dee8",
                  borderRadius:
                    "8px",
                  background:
                    "#fff",
                  color:
                    "#475569",
                  font:
                    "inherit",
                  fontSize:
                    "1rem",
                  lineHeight:
                    1,
                  cursor:
                    "pointer",
                }}
              >
                ×
              </button>
            </div>

            <div
              style={{
                overflowY:
                  "auto",
                padding:
                  "10px 12px",
              }}
            >
              {serviceRequestDetailLoading && (
                <div
                  style={{
                    padding:
                      "14px 0",
                    textAlign:
                      "center",
                    fontSize:
                      "0.72rem",
                  }}
                >
                  Loading request…
                </div>
              )}

              {!serviceRequestDetailLoading &&
                serviceRequestDetailError && (
                  <div
                    style={{
                      padding:
                        "10px",
                      border:
                        "1px solid #fecaca",
                      borderRadius:
                        "9px",
                      background:
                        "#fff7f7",
                      color:
                        "#b42318",
                      fontSize:
                        "0.7rem",
                    }}
                  >
                    {
                      serviceRequestDetailError
                    }
                  </div>
                )}

              {!serviceRequestDetailLoading &&
                !serviceRequestDetailError &&
                serviceRequestDetail && (
                  <>
                    <div
                      style={{
                        display:
                          "grid",
                        gap:
                          "5px",
                        padding:
                          "9px",
                        border:
                          "1px solid #e2e8f0",
                        borderRadius:
                          "10px",
                        background:
                          "#f8fafc",
                        fontSize:
                          "0.66rem",
                      }}
                    >
                      <div>
                        <strong>Service: </strong>
                        {
                          serviceRequestDetail.serviceName
                        }
                      </div>

                      <div>
                        <strong>Status: </strong>
                        {
                          serviceRequestDetail.status
                        }
                      </div>

                      <div>
                        <strong>Shop: </strong>
                        {
                          serviceRequestDetail.shopName
                        } [{
                          serviceRequestDetail.shopCode
                        }]
                      </div>

                      <div>
                        <strong>Submitted: </strong>
                        {
                          new Date(
                            serviceRequestDetail.createdAt,
                          ).toLocaleString()
                        }
                      </div>
                    </div>

                    {!serviceRequestDetailExpanded && (() => {
                      const previewEntry =
                        Object.entries(
                          serviceRequestDetail.answers,
                        ).find(
                          ([key, value]) =>
                            !key.startsWith(
                              "customer.",
                            ) &&
                            value !== null &&
                            value !== undefined &&
                            value !== "",
                        );

                      if (!previewEntry) {
                        return null;
                      }

                      const [
                        previewKey,
                        previewValue,
                      ] = previewEntry;

                      return (
                        <div
                          style={{
                            marginTop:
                              "9px",
                            padding:
                              "8px 9px",
                            border:
                              "1px solid #eef1f4",
                            borderRadius:
                              "9px",
                            background:
                              "#fff",
                            fontSize:
                              "0.66rem",
                          }}
                        >
                          <strong>
                            {
                              serviceAnswerLabel(
                                previewKey,
                              )
                            }: {" "}
                          </strong>

                          <span
                            style={{
                              display:
                                "-webkit-box",
                              overflow:
                                "hidden",
                              WebkitBoxOrient:
                                "vertical",
                              WebkitLineClamp:
                                2,
                              whiteSpace:
                                "pre-wrap",
                              wordBreak:
                                "break-word",
                            }}
                          >
                            {
                              serviceAnswerValue(
                                previewValue,
                              )
                            }
                          </span>
                        </div>
                      );
                    })()}

                    {serviceRequestDetailExpanded && (
                      <>
                    <strong
                      style={{
                        display:
                          "block",
                        margin:
                          "12px 0 5px",
                        fontSize:
                          "0.72rem",
                      }}
                    >
                      Request details
                    </strong>

                    <div
                      style={{
                        display:
                          "grid",
                        gap:
                          "7px",
                      }}
                    >
                      {
                        Object.entries(
                          serviceRequestDetail.answers,
                        )
                          .filter(
                            ([
                              key,
                              value,
                            ]) =>
                              !key.startsWith(
                                "customer.",
                              ) &&
                              value !==
                                null &&
                              value !==
                                undefined &&
                              value !==
                                "",
                          )
                          .map(
                            ([
                              key,
                              value,
                            ]) => (
                              <div
                                key={
                                  key
                                }
                                style={{
                                  padding:
                                    "7px 8px",
                                  borderBottom:
                                    "1px solid #eef1f4",
                                  fontSize:
                                    "0.66rem",
                                }}
                              >
                                <strong
                                  style={{
                                    display:
                                      "block",
                                    marginBottom:
                                      "2px",
                                  }}
                                >
                                  {
                                    serviceAnswerLabel(
                                      key,
                                    )
                                  }
                                </strong>

                                <span
                                  style={{
                                    whiteSpace:
                                      "pre-wrap",
                                    wordBreak:
                                      "break-word",
                                  }}
                                >
                                  {
                                    serviceAnswerValue(
                                      value,
                                    )
                                  }
                                </span>
                              </div>
                            ),
                          )
                      }
                    </div>

                    <strong
                      style={{
                        display:
                          "block",
                        margin:
                          "12px 0 5px",
                        fontSize:
                          "0.72rem",
                      }}
                    >
                      Contact
                    </strong>

                    <div
                      style={{
                        display:
                          "grid",
                        gap:
                          "4px",
                        fontSize:
                          "0.66rem",
                      }}
                    >
                      <span>
                        <strong>Name: </strong>
                        {
                          serviceRequestDetail.customerName ??
                          "—"
                        }
                      </span>

                      <span>
                        <strong>Email: </strong>
                        {
                          serviceRequestDetail.emailAddress ??
                          "—"
                        }
                      </span>

                      <span>
                        <strong>Phone: </strong>
                        {
                          serviceRequestDetail.phoneNumber ??
                          serviceRequestDetail.whatsAppNumber ??
                          "—"
                        }
                      </span>
                    </div>

                    {serviceRequestDetail.files.length >
                      0 && (
                      <>
                        <strong
                          style={{
                            display:
                              "block",
                            margin:
                              "12px 0 5px",
                            fontSize:
                              "0.72rem",
                          }}
                        >
                          Attachments
                        </strong>

                        <div
                          style={{
                            display:
                              "grid",
                            gap:
                              "4px",
                          }}
                        >
                          {
                            serviceRequestDetail.files.map(
                              (
                                file,
                              ) => (
                                <div
                                  key={
                                    file.id
                                  }
                                  style={{
                                    fontSize:
                                      "0.64rem",
                                  }}
                                >
                                  📎 {
                                    file.name
                                  } · {
                                    Math.max(
                                      1,
                                      Math.round(
                                        file.size /
                                        1024,
                                      ),
                                    )
                                  } KB
                                </div>
                              ),
                            )
                          }
                        </div>
                      </>
                    )}

                    <div
                      style={{
                        marginTop:
                          "12px",
                        color:
                          "#64748b",
                        fontSize:
                          "0.58rem",
                        textAlign:
                          "center",
                      }}
                    >
                      Read-only view
                    </div>
                      </>
                    )}
                  </>
                )}
            </div>

            <div
              style={{
                padding:
                  "8px",
                borderTop:
                  "1px solid #e5e7eb",
              }}
            >
              {!serviceRequestDetailLoading &&
                !serviceRequestDetailError &&
                serviceRequestDetail && (
                <button
                  type="button"
                  onClick={() =>
                    setServiceRequestDetailExpanded(
                      (current) =>
                        !current,
                    )
                  }
                  aria-expanded={
                    serviceRequestDetailExpanded
                  }
                  style={{
                    width:
                      "100%",
                    minHeight:
                      "30px",
                    border:
                      "1px solid #cbd5e1",
                    borderRadius:
                      "8px",
                    background:
                      "#f8fafc",
                    color:
                      "#334155",
                    font:
                      "inherit",
                    fontSize:
                      "0.68rem",
                    fontWeight:
                      800,
                    cursor:
                      "pointer",
                  }}
                >
                  {
                    serviceRequestDetailExpanded
                      ? "Less"
                      : "More"
                  }
                </button>
              )}
            </div>
          </section>
        </div>
      )}


      {
        homeChooserOpen &&
        !gyanCardWelcomeOpen &&
        window.location.pathname ===
          "/" &&
        createPortal(
          <GyanHomeChooser
            onChoose={
              chooseGyanHome
            }
          />,
          document.body,
        )
      }


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