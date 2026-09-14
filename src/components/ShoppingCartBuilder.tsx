import {
  useEffect,
  useMemo,
  useState,
} from "react";

type CardItemType =
  | "LIVE"
  | "MOCK"
  | "MINI";

interface BatchInfo {
  batch_code: string;
  label: string;
  start_date: string;
  end_date: string;
}

interface ShoppingCartCatalogItem {
  key: string;
  type: CardItemType;
  code: string;
  label: string;
  scheduleDate?: string | null;
  fractionPercent?: number;
  available: boolean;
  gemCost: number | null;
  reportGemCost?: number;
  questionCount?: number;
  accessMode?: string;
}

interface ShoppingCartCatalogResponse {
  phase: number;
  programs: string[];
  selectedProgram: string;
  batches: {
    current: BatchInfo | null;
    next: BatchInfo | null;
    selected: BatchInfo;
  };
  liveTests: ShoppingCartCatalogItem[];
  mockTests: ShoppingCartCatalogItem[];
  miniTests: ShoppingCartCatalogItem[];
  pricing?: {
    note?: string;
  };
  error?: string;
}

function dateLabel(
  value?: string | null,
): string {
  if (!value) {
    return "";
  }

  const date =
    new Date(
      `${value}T12:00:00`,
    );

  if (
    Number.isNaN(
      date.getTime(),
    )
  ) {
    return value;
  }

  return new Intl.DateTimeFormat(
    undefined,
    {
      month: "short",
      day: "numeric",
    },
  ).format(
    date,
  );
}

function batchLabel(
  batch: BatchInfo | null,
  fallback: string,
): string {
  if (!batch) {
    return fallback;
  }

  return batch.label;
}

interface ShoppingCartBuilderProps {
  initialProgram?: string;
  initialLiveTestCode?: string;
  onClose?: () => void;
}

const TEST_ACCESS_GEM_COST =
  5;

const RESULTS_GEM_COST =
  20;

const AI_TIPS_GEM_COST =
  10;


export default function ShoppingCartBuilder({
  initialProgram = "",
  initialLiveTestCode = "",
  onClose,
}: ShoppingCartBuilderProps) {
  const [
    catalog,
    setCatalog,
  ] =
    useState<ShoppingCartCatalogResponse | null>(
      null,
    );

  const [
    program,
    setProgram,
  ] =
    useState(
      initialProgram
        .trim()
        .toUpperCase(),
    );

  const [
    batchCode,
    setBatchCode,
  ] =
    useState("");

  const [
    selected,
    setSelected,
  ] =
    useState<Set<string>>(
      () =>
        new Set(),
    );

  const [
    loading,
    setLoading,
  ] =
    useState(true);

  const [
    liveTestsOpen,
    setLiveTestsOpen,
  ] =
    useState(false);

  const [
    mockTestsOpen,
    setMockTestsOpen,
  ] =
    useState(false);

  const [
    miniTestsOpen,
    setMiniTestsOpen,
  ] =
    useState(false);

  const [
    previewOpen,
    setPreviewOpen,
  ] =
    useState(false);

  const [
    accessRequestOpen,
    setAccessRequestOpen,
  ] =
    useState(false);

  const [
    contactEmail,
    setContactEmail,
  ] =
    useState("");

  const [
    contactSending,
    setContactSending,
  ] =
    useState(false);

  const [
    contactError,
    setContactError,
  ] =
    useState("");

  const [
    contactSuccess,
    setContactSuccess,
  ] =
    useState<{
      email: string;
      requestCode: string;
    } | null>(
      null,
    );

  const [
    gemBalance,
    setGemBalance,
  ] =
    useState<number | null>(
      null,
    );

  const [
    gemBalanceLoading,
    setGemBalanceLoading,
  ] =
    useState(true);

  const [
    purchaseBusy,
    setPurchaseBusy,
  ] =
    useState(false);

  const [
    purchaseError,
    setPurchaseError,
  ] =
    useState("");

  const [
    purchaseSuccess,
    setPurchaseSuccess,
  ] =
    useState<{
      purchaseCode: string;
      chargedGems: number;
      gemBalance: number;
      grantedItems: number;
    } | null>(
      null,
    );

  const [
    purchaseTypes,
    setPurchaseTypes,
  ] =
    useState<{
      questions: boolean;
      results: boolean;
      aiTips: boolean;
    }>({
      questions: true,
      results: true,
      aiTips: true,
    });


  const [
    error,
    setError,
  ] =
    useState("");

  useEffect(
    () => {
      const controller =
        new AbortController();

      void fetch(
        "/api/gyan-identity/gems",
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
            if (
              !response.ok
            ) {
              return null;
            }

            return await response.json() as {
              total?: number;
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

            setGemBalance(
              body &&
              typeof body.total ===
                "number"
                ? body.total
                : null,
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
              setGemBalance(
                null,
              );
            }
          },
        )
        .finally(
          () => {
            if (
              !controller.signal.aborted
            ) {
              setGemBalanceLoading(
                false,
              );
            }
          },
        );

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

      const query =
        new URLSearchParams();

      if (program) {
        query.set(
          "program",
          program,
        );
      }

      if (batchCode) {
        query.set(
          "batch",
          batchCode,
        );
      }

      void fetch(
        `/api/shopping-cart/catalog${
          query.toString()
            ? `?${query.toString()}`
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
      )
        .then(
          async (
            response,
          ) => {
            const body =
              await response.json() as
                ShoppingCartCatalogResponse;

            if (
              !response.ok
            ) {
              throw new Error(
                body.error ??
                "Shopping Cart options could not be loaded.",
              );
            }

            return body;
          },
        )
        .then(
          (
            body,
          ) => {
            setCatalog(
              body,
            );

            if (!program) {
              setProgram(
                body.selectedProgram,
              );
            }

            if (!batchCode) {
              setBatchCode(
                body.batches
                  .selected
                  .batch_code,
              );
            }

            const normalizedCode =
              initialLiveTestCode
                .trim()
                .toUpperCase()
                .replace(
                  /^#/,
                  "",
                );

            const contextual =
              normalizedCode
                ? body.liveTests.find(
                    (
                      item,
                    ) =>
                      item.code
                        .trim()
                        .toUpperCase() ===
                      normalizedCode,
                  )
                : undefined;

            setSelected(
              contextual
                ? new Set([
                    contextual.key,
                  ])
                : new Set(),
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

            setError(
              caught instanceof
                Error
                ? caught.message
                : "Shopping Cart options could not be loaded.",
            );
          },
        )
        .finally(
          () => {
            if (
              !controller.signal
                .aborted
            ) {
              setLoading(
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
      program,
      batchCode,
      initialLiveTestCode,
    ],
  );

  const allItems =
    useMemo(
      () =>
        catalog
          ? [
              ...catalog
                .liveTests,
              ...catalog
                .mockTests,
              ...catalog
                .miniTests,
            ]
          : [],
      [
        catalog,
      ],
    );

  const selectedItems =
    useMemo(
      () =>
        allItems.filter(
          (
            item,
          ) =>
            selected.has(
              item.key,
            ),
        ),
      [
        allItems,
        selected,
      ],
    );


  const unpricedCount =
    selectedItems.filter(
      (
        item,
      ) =>
        item.gemCost ===
          null,
    ).length;


  const selectedPurchaseTypeCost =
    (
      purchaseTypes.questions
        ? TEST_ACCESS_GEM_COST
        : 0
    ) +
    (
      purchaseTypes.results
        ? RESULTS_GEM_COST
        : 0
    ) +
    (
      purchaseTypes.aiTips
        ? AI_TIPS_GEM_COST
        : 0
    );

  const selectedLiveTestCount =
    selectedItems.filter(
      (
        item,
      ) =>
        item.type ===
          "LIVE",
    ).length;

  const liveTestAccessTotal =
    selectedLiveTestCount *
    selectedPurchaseTypeCost;



  async function submitAccessRequest(): Promise<void> {
    const email =
      contactEmail
        .trim()
        .toLowerCase();

    if (
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
        email,
      )
    ) {
      setContactError(
        "Please enter a valid email address.",
      );
      return;
    }

    setContactSending(
      true,
    );
    setContactError(
      "",
    );
    setContactSuccess(
      null,
    );

    try {
      const response =
        await fetch(
          "/api/shopping-cart/contact",
          {
            method:
              "POST",
            credentials:
              "include",
            headers: {
              "content-type":
                "application/json",
            },
            body:
              JSON.stringify({
                email,
                program,
                batchCode:
                  catalog?.batches
                    .selected
                    .batch_code ??
                  "",
                batchLabel:
                  catalog?.batches
                    .selected
                    .label ??
                  "",
                access: {
                  test:
                    purchaseTypes.questions,
                  results:
                    purchaseTypes.results,
                  aiTips:
                    purchaseTypes.aiTips,
                },
                items:
                  selectedItems.map(
                    (
                      item,
                    ) => ({
                      type:
                        item.type,
                      code:
                        item.code,
                      label:
                        item.label,
                    }),
                  ),
                estimatedGems:
                  liveTestAccessTotal,
                shopCode:
                  "GYAN_ONLINE",
              }),
          },
        );

      const body =
        await response.json() as {
          sent?: boolean;
          requestCode?: string;
          email?: string;
          error?: string;
        };

      if (
        !response.ok
      ) {
        throw new Error(
          body.error ??
          "GYAN could not send the access request.",
        );
      }

      setContactSuccess({
        email:
          body.email ??
          email,
        requestCode:
          body.requestCode ??
          "",
      });
    } catch (
      caught
    ) {
      setContactError(
        caught instanceof
          Error
          ? caught.message
          : "GYAN could not send the access request.",
      );
    } finally {
      setContactSending(
        false,
      );
    }
  }


  async function buyWithGems(): Promise<void> {
    if (
      purchaseBusy ||
      selectedLiveTestCount ===
        0 ||
      unpricedCount >
        0
    ) {
      return;
    }

    setPurchaseBusy(
      true,
    );
    setPurchaseError(
      "",
    );
    setPurchaseSuccess(
      null,
    );

    try {
      const requestKey =
        typeof crypto.randomUUID ===
          "function"
          ? crypto.randomUUID()
          : `${Date.now()}-${Math.random()}`;

      const response =
        await fetch(
          "/api/shopping-cart/purchase",
          {
            method:
              "POST",
            credentials:
              "include",
            headers: {
              "content-type":
                "application/json",
            },
            body:
              JSON.stringify({
                requestKey,
                program,
                batchCode:
                  catalog?.batches
                    .selected
                    .batch_code ??
                  "",
                access: {
                  test:
                    purchaseTypes.questions,
                  results:
                    purchaseTypes.results,
                  aiTips:
                    purchaseTypes.aiTips,
                },
                items:
                  selectedItems.map(
                    (
                      item,
                    ) => ({
                      type:
                        item.type,
                      code:
                        item.code,
                      label:
                        item.label,
                    }),
                  ),
              }),
          },
        );

      const body =
        await response.json() as {
          purchased?: boolean;
          purchaseCode?: string;
          chargedGems?: number;
          gemBalance?: number;
          grantedItems?: number;
          requiredGems?: number;
          error?: string;
        };

      if (
        !response.ok ||
        !body.purchased
      ) {
        if (
          typeof body.gemBalance ===
            "number"
        ) {
          setGemBalance(
            body.gemBalance,
          );
        }

        throw new Error(
          body.error ??
          "The purchase could not be completed.",
        );
      }

      const nextBalance =
        typeof body.gemBalance ===
          "number"
          ? body.gemBalance
          : gemBalance ??
            0;

      setGemBalance(
        nextBalance,
      );
      setPurchaseSuccess({
        purchaseCode:
          body.purchaseCode ??
          "",
        chargedGems:
          body.chargedGems ??
          0,
        gemBalance:
          nextBalance,
        grantedItems:
          body.grantedItems ??
          selectedLiveTestCount,
      });
      setAccessRequestOpen(
        false,
      );
    } catch (
      caught
    ) {
      setPurchaseError(
        caught instanceof
          Error
          ? caught.message
          : "The purchase could not be completed.",
      );
    } finally {
      setPurchaseBusy(
        false,
      );
    }
  }


  function toggle(
    key: string,
  ): void {
    setSelected(
      (
        current,
      ) => {
        const next =
          new Set(
            current,
          );

        if (
          next.has(
            key,
          )
        ) {
          next.delete(
            key,
          );
        } else {
          next.add(
            key,
          );
        }

        return next;
      },
    );
  }

  function setCategory(
    items:
      ShoppingCartCatalogItem[],
    checked:
      boolean,
  ): void {
    setSelected(
      (
        current,
      ) => {
        const next =
          new Set(
            current,
          );

        for (
          const item
          of items
        ) {
          if (
            !item.available
          ) {
            continue;
          }

          if (checked) {
            next.add(
              item.key,
            );
          } else {
            next.delete(
              item.key,
            );
          }
        }

        return next;
      },
    );
  }

  function togglePurchaseType(
    key:
      "questions" |
      "results" |
      "aiTips",
  ): void {
    setPurchaseTypes(
      (
        current,
      ) => {
        if (
          key ===
          "aiTips"
        ) {
          if (
            !current.aiTips
          ) {
            return {
              questions:
                true,
              results:
                true,
              aiTips:
                true,
            };
          }

          return {
            ...current,
            aiTips:
              false,
          };
        }

        if (
          key ===
          "results"
        ) {
          if (
            !current.results
          ) {
            return {
              ...current,
              questions:
                true,
              results:
                true,
            };
          }

          return {
            questions:
              current.questions,
            results:
              false,
            aiTips:
              false,
          };
        }

        if (
          !current.questions
        ) {
          return {
            ...current,
            questions:
              true,
          };
        }

        return {
          questions:
            false,
          results:
            false,
          aiTips:
            false,
        };
      },
    );
  }


  function groupOpen(
    title: string,
  ): boolean {
    if (
      title ===
      "Live Tests"
    ) {
      return liveTestsOpen;
    }

    if (
      title ===
      "Mock Tests"
    ) {
      return mockTestsOpen;
    }

    if (
      title ===
      "Mini Tests"
    ) {
      return miniTestsOpen;
    }

    return true;
  }

  function toggleGroup(
    title: string,
  ): void {
    if (
      title ===
      "Live Tests"
    ) {
      setLiveTestsOpen(
        (
          current,
        ) =>
          !current,
      );
      return;
    }

    if (
      title ===
      "Mock Tests"
    ) {
      setMockTestsOpen(
        (
          current,
        ) =>
          !current,
      );
      return;
    }

    if (
      title ===
      "Mini Tests"
    ) {
      setMiniTestsOpen(
        (
          current,
        ) =>
          !current,
      );
    }
  }


  function categoryChecked(
    items:
      ShoppingCartCatalogItem[],
  ): boolean {
    const available =
      items.filter(
        (
          item,
        ) =>
          item.available,
      );

    return (
      available.length >
        0 &&
      available.every(
        (
          item,
        ) =>
          selected.has(
            item.key,
          ),
      )
    );
  }

  function renderGroup(
    title: string,
    items:
      ShoppingCartCatalogItem[],
  ) {
    if (
      items.length ===
        0
    ) {
      return null;
    }

    const allChecked =
      categoryChecked(
        items,
      );

    return (
      <section
        style={{
          border:
            "1px solid #e2e8f0",
          borderRadius:
            "12px",
          overflow:
            "hidden",
          background:
            "#fff",
        }}
      >
        <div
          style={{
            display:
              "grid",
            gridTemplateColumns:
              "auto minmax(0, 1fr) auto",
            gap:
              "6px",
            alignItems:
              "center",
            padding:
              "6px 8px",
            background:
              "#f8fafc",
          }}
        >
          <input
            type="checkbox"
            checked={
              allChecked
            }
            onChange={(
              event,
            ) =>
              setCategory(
                items,
                event.target
                  .checked,
              )
            }
          />

          <button
            type="button"
            onClick={() =>
              toggleGroup(
                title,
              )
            }
            style={{
              minWidth:
                0,
              padding:
                0,
              border:
                0,
              background:
                "transparent",
              textAlign:
                "left",
              font:
                "inherit",
              fontWeight:
                800,
              cursor:
                "pointer",
            }}
          >
            {title}
            {
              groupOpen(
                title,
              )
                ? " ▾"
                : " ▸"
            }
          </button>

          <small
            style={{
              color:
                "#64748b",
              fontWeight:
                700,
              fontSize:
                "0.68rem",
              whiteSpace:
                "nowrap",
            }}
          >
            {
              items.filter(
                (
                  item,
                ) =>
                  item.available,
              ).length
            } available
          </small>
        </div>

        {
          groupOpen(
            title,
          ) && (
            <div
              style={{
                maxHeight:
                  title ===
                    "Live Tests"
                    ? "220px"
                    : "160px",
                overflowY:
                  "auto",
              }}
            >
          {
            items.map(
              (
                item,
              ) => (
                <label
                  key={
                    item.key
                  }
                  style={{
                    display:
                      "grid",
                    gridTemplateColumns:
                      "auto minmax(0, 1fr) auto",
                    gap:
                      "8px",
                    alignItems:
                      "center",
                    padding:
                      "6px 9px",
                    borderTop:
                      "1px solid #f1f5f9",
                    opacity:
                      item.available
                        ? 1
                        : 0.55,
                  }}
                >
                  <input
                    type="checkbox"
                    disabled={
                      !item.available
                    }
                    checked={
                      selected.has(
                        item.key,
                      )
                    }
                    onChange={() =>
                      toggle(
                        item.key,
                      )
                    }
                  />

                  <span
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
                          "0.76rem",
                      }}
                    >
                      {
                        item.label
                      }
                    </strong>

                    <small
                      style={{
                        color:
                          "#64748b",
                      }}
                    >
                      {
                        item.type ===
                          "LIVE"
                          ? `${
                              dateLabel(
                                item.scheduleDate,
                              )
                            }${
                              item.fractionPercent
                                ? ` · ${item.fractionPercent}%`
                                : ""
                            }`
                          : `${
                              item.questionCount ??
                              0
                            } questions${
                              item.available
                                ? ""
                                : " · not ready"
                            }`
                      }
                    </small>
                  </span>

                  <strong
                    style={{
                      fontSize:
                        "0.72rem",
                      whiteSpace:
                        "nowrap",
                    }}
                  >
                    {
                      typeof item.gemCost ===
                        "number"
                        ? `💎 ${item.gemCost}`
                        : "Phase 2"
                    }
                  </strong>
                </label>
              ),
            )
          }
            </div>
          )
        }
      </section>
    );
  }

  if (
    loading &&
    !catalog
  ) {
    return (
      <div
        style={{
          padding:
            "18px",
        }}
      >
        Loading Shopping Cart options…
      </div>
    );
  }

  if (
    error &&
    !catalog
  ) {
    return (
      <div
        style={{
          padding:
            "18px",
          color:
            "#b42318",
        }}
      >
        {error}
      </div>
    );
  }

  if (!catalog) {
    return null;
  }

  const current =
    catalog.batches
      .current;

  const next =
    catalog.batches
      .next;

  return (
    <main
      style={{
        width:
          "min(100%, 760px)",
        margin:
          "0 auto",
        padding:
          "10px 10px 10vh",
        display:
          "grid",
        gap:
          "6px",
        fontSize:
          "0.86rem",
      }}
    >
      <header
        style={{
          display:
            "grid",
          gridTemplateColumns:
            "minmax(0, 1fr) auto",
          gap:
            "6px",
          alignItems:
            "center",
        }}
      >
        <div>
          <strong
            style={{
              display:
                "block",
              fontSize:
                "0.96rem",
            }}
          >
            Test Access
          </strong>

          <small
            style={{
              color:
                "#64748b",
              fontSize:
                "0.72rem",
            }}
          >
            Choose the tests you want to access
          </small>
        </div>

        <div
          style={{
            display:
              "flex",
            gap:
              "5px",
            alignItems:
              "center",
          }}
        >
          <strong
            style={{
              fontSize:
                "0.78rem",
              whiteSpace:
                "nowrap",
              textAlign:
                "right",
            }}
          >
            Total: 💎 {liveTestAccessTotal}
          </strong>

          <button
            type="button"
            title="Preview Cart"
            aria-label="Preview Cart"
            disabled={
              selectedItems.length ===
                0
            }
            onClick={() =>
              setPreviewOpen(
                true,
              )
            }
            style={{
              minWidth:
                "32px",
              height:
                "28px",
              padding:
                "2px 7px",
              border:
                "1px solid #cbd5e1",
              borderRadius:
                "7px",
              background:
                "#fff",
              fontSize:
                "0.9rem",
              cursor:
                selectedItems.length
                  ? "pointer"
                  : "default",
            }}
          >
            🛒
          </button>

          {
            onClose && (
              <button
                type="button"
                aria-label="Close test access"
                title="Close"
                onClick={
                  onClose
                }
                style={{
                  width:
                    "28px",
                  height:
                    "28px",
                  border:
                    "1px solid #cbd5e1",
                  borderRadius:
                    "7px",
                  background:
                    "#fff",
                  cursor:
                    "pointer",
                }}
              >
                ×
              </button>
            )
          }
        </div>
      </header>

      <section
        style={{
          display:
            "grid",
          gridTemplateColumns:
            "auto minmax(0, 1fr)",
          gap:
            "6px",
          alignItems:
            "center",
        }}
      >
        <strong
          style={{
            fontSize:
              "0.78rem",
            whiteSpace:
              "nowrap",
          }}
        >
          Program:
        </strong>

        <div
          style={{
            display:
              "grid",
            gridTemplateColumns:
              "repeat(3, minmax(0, 1fr))",
            gap:
              "3px",
          }}
        >
          {
            catalog.programs.map(
              (
                value,
              ) => (
                <button
                  key={
                    value
                  }
                  type="button"
                  onClick={() => {
                    setLoading(
                      true,
                    );
                    setError(
                      "",
                    );
                    setProgram(
                      value,
                    );
                    setBatchCode(
                      "",
                    );
                  }}
                  style={{
                    padding:
                      "3px 6px",
                    border:
                      "1px solid #cbd5e1",
                    borderRadius:
                      "9px",
                    background:
                      program ===
                        value
                        ? "#e0f2fe"
                        : "#fff",
                    fontWeight:
                      800,
                    cursor:
                      "pointer",
                  }}
                >
                  {value}
                </button>
              ),
            )
          }
        </div>
      </section>

      <section
        style={{
          display:
            "grid",
          gridTemplateColumns:
            "auto minmax(0, 1fr)",
          gap:
            "6px",
          alignItems:
            "center",
        }}
      >
        <strong
          style={{
            fontSize:
              "0.78rem",
            whiteSpace:
              "nowrap",
          }}
        >
          Batch:
        </strong>

        <div
          style={{
            display:
              "grid",
            gridTemplateColumns:
              "repeat(2, minmax(0, 1fr))",
            gap:
              "3px",
          }}
        >
          <button
            type="button"
            disabled={
              !current
            }
            onClick={() => {
              if (!current) {
                return;
              }

              setLoading(
                true,
              );
              setError(
                "",
              );
              setBatchCode(
                current.batch_code,
              );
            }}
            style={{
              padding:
                "3px 5px",
              border:
                "1px solid #cbd5e1",
              borderRadius:
                "10px",
              background:
                "#e0f2fe",
              borderColor:
                current &&
                batchCode ===
                  current.batch_code
                  ? "#38bdf8"
                  : "#bae6fd",
              boxShadow:
                current &&
                batchCode ===
                  current.batch_code
                  ? "inset 0 0 0 1px #38bdf8"
                  : "none",
              fontWeight:
                800,
              fontSize:
                "0.72rem",
              lineHeight:
                1.1,
              whiteSpace:
                "nowrap",
              cursor:
                current
                  ? "pointer"
                  : "default",
            }}
          >
            Current · {
              batchLabel(
                current,
                "Not available",
              )
            }
          </button>

          <button
            type="button"
            disabled={
              !next
            }
            onClick={() => {
              if (!next) {
                return;
              }

              setLoading(
                true,
              );
              setError(
                "",
              );
              setBatchCode(
                next.batch_code,
              );
            }}
            style={{
              padding:
                "3px 5px",
              border:
                "1px solid #cbd5e1",
              borderRadius:
                "10px",
              background:
                "#e0f2fe",
              borderColor:
                next &&
                batchCode ===
                  next.batch_code
                  ? "#38bdf8"
                  : "#bae6fd",
              boxShadow:
                next &&
                batchCode ===
                  next.batch_code
                  ? "inset 0 0 0 1px #38bdf8"
                  : "none",
              fontWeight:
                800,
              fontSize:
                "0.72rem",
              lineHeight:
                1.1,
              whiteSpace:
                "nowrap",
              cursor:
                next
                  ? "pointer"
                  : "default",
            }}
          >
            Next · {
              batchLabel(
                next,
                "Not available",
              )
            }
          </button>
        </div>
      </section>

      <section
        style={{
          display:
            "grid",
          gridTemplateColumns:
            "auto minmax(0, 1fr)",
          gap:
            "6px",
          alignItems:
            "center",
        }}
      >
        <strong
          style={{
            fontSize:
              "0.78rem",
            whiteSpace:
              "nowrap",
          }}
        >
          Include:
        </strong>

        <div
          style={{
            display:
              "grid",
            gridTemplateColumns:
              "repeat(3, minmax(0, 1fr))",
            gap:
              "3px",
          }}
        >
          <button
            type="button"
            aria-pressed={
              purchaseTypes.questions
            }
            onClick={() =>
              togglePurchaseType(
                "questions",
              )
            }
            style={{
              padding:
                "3px 5px",
              border:
                "1px solid #cbd5e1",
              borderRadius:
                "7px",
              background:
                purchaseTypes.questions
                  ? "#e0f2fe"
                  : "#fff",
              fontSize:
                "0.7rem",
              fontWeight:
                800,
              lineHeight:
                1.1,
              whiteSpace:
                "nowrap",
              cursor:
                "pointer",
            }}
          >
            Test · 💎5
          </button>

          <button
            type="button"
            aria-pressed={
              purchaseTypes.results
            }
            onClick={() =>
              togglePurchaseType(
                "results",
              )
            }
            style={{
              padding:
                "3px 5px",
              border:
                "1px solid #cbd5e1",
              borderRadius:
                "7px",
              background:
                purchaseTypes.results
                  ? "#e0f2fe"
                  : "#fff",
              fontSize:
                "0.7rem",
              fontWeight:
                800,
              lineHeight:
                1.1,
              whiteSpace:
                "nowrap",
              cursor:
                "pointer",
            }}
          >
            Results · 💎20
          </button>

          <button
            type="button"
            aria-pressed={
              purchaseTypes.aiTips
            }
            onClick={() =>
              togglePurchaseType(
                "aiTips",
              )
            }
            title="AI tips: elimination, approximation, estimation, pattern recognition, shortcuts, common traps, and time-saving strategies"
            style={{
              padding:
                "3px 5px",
              border:
                "1px solid #cbd5e1",
              borderRadius:
                "7px",
              background:
                purchaseTypes.aiTips
                  ? "#e0f2fe"
                  : "#fff",
              fontSize:
                "0.7rem",
              fontWeight:
                800,
              lineHeight:
                1.1,
              whiteSpace:
                "nowrap",
              cursor:
                "pointer",
            }}
          >
            AI Tips · 💎10
          </button>
        </div>

        {
          purchaseTypes.aiTips && (
            <small
              style={{
                gridColumn:
                  "2",
                display:
                  "flex",
                gap:
                  "5px",
                alignItems:
                  "flex-start",
                color:
                  "#7c4a21",
                fontSize:
                  "0.72rem",
                lineHeight:
                  1.3,
                marginTop:
                  "-1px",
                fontWeight:
                  600,
              }}
            >
              <strong
                title="AI solving tips"
                aria-label="AI solving tips"
                style={{
                  flex:
                    "0 0 auto",
                  padding:
                    "1px 4px",
                  border:
                    "1px solid #9a6a3a",
                  borderRadius:
                    "4px",
                  color:
                    "#7c4a21",
                  fontSize:
                    "0.68rem",
                  lineHeight:
                    1.1,
                }}
              >
                AI
              </strong>

              <span>
                Elimination · approximation · estimation · pattern recognition · shortcut · common trap · time-saving strategy
              </span>
            </small>
          )
        }
      </section>

      {
        unpricedCount > 0 && (
          <small
            style={{
              textAlign:
                "right",
              color:
                "#64748b",
              fontSize:
                "0.66rem",
            }}
          >
            + {unpricedCount} item{
              unpricedCount === 1
                ? ""
                : "s"
            } pending Phase 2 pricing
          </small>
        )
      }

      {
        renderGroup(
          "Live Tests",
          catalog.liveTests,
        )
      }

      {
        renderGroup(
          "Mock Tests",
          catalog.mockTests,
        )
      }

      {
        renderGroup(
          "Mini Tests",
          catalog.miniTests,
        )
      }

      <section
        style={{
          position:
            "sticky",
          bottom:
            "8px",
          display:
            "grid",
          gridTemplateColumns:
            "minmax(0, 1fr) auto",
          gap:
            "8px",
          alignItems:
            "center",
          padding:
            "7px 9px",
          border:
            "1px solid #cbd5e1",
          borderRadius:
            "9px",
          background:
            "rgba(255,255,255,0.97)",
          boxShadow:
            "0 6px 18px rgba(15,23,42,0.08)",
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
                "0.8rem",
            }}
          >
            Total: 💎 {liveTestAccessTotal}
            {
              unpricedCount > 0
                ? ` + ${unpricedCount} Phase 2`
                : ""
            }
          </strong>

          <small
            style={{
              color:
                "#64748b",
              fontSize:
                "0.63rem",
            }}
          >
            {selectedItems.length} selected · {selectedLiveTestCount} Live Test{
              selectedLiveTestCount === 1
                ? ""
                : "s"
            } × 💎{selectedPurchaseTypeCost}
          </small>
        </div>

        <button
          type="button"
          disabled={
            selectedItems.length ===
              0
          }
          onClick={() =>
            setPreviewOpen(
              true,
            )
          }
          style={{
            padding:
              "5px 9px",
            border:
              "1px solid #0f172a",
            borderRadius:
              "8px",
            background:
              "#0f172a",
            color:
              "#fff",
            fontSize:
              "0.72rem",
            fontWeight:
              800,
            cursor:
              selectedItems.length
                ? "pointer"
                : "default",
            whiteSpace:
              "nowrap",
          }}
        >
          Preview Cart
        </button>
      </section>

      <div
        aria-hidden="true"
        style={{
          height:
            "max(100px, 20vh)",
          minHeight:
            "100px",
        }}
      />

      {
        previewOpen && (
          <div
            role="presentation"
            onMouseDown={() =>
              setPreviewOpen(
                false,
              )
            }
            style={{
              position:
                "fixed",
              inset:
                0,
              zIndex:
                1800,
              display:
                "grid",
              placeItems:
                "start center",
              padding:
                "68px 16px 16px",
              background:
                "rgba(15,23,42,0.42)",
            }}
          >
            <section
              role="dialog"
              aria-modal="true"
              aria-label="Shopping Cart Preview"
              onMouseDown={(
                event,
              ) =>
                event.stopPropagation()
              }
              style={{
                width:
                  "min(92vw, 520px)",
                height:
                  "55vh",
                maxHeight:
                  "55vh",
                overflow:
                  "hidden",
                display:
                  "grid",
                gridTemplateRows:
                  "auto minmax(0, 1fr) auto",
                border:
                  "1px solid #e2e8f0",
                borderRadius:
                  "14px",
                background:
                  "#fff",
                boxShadow:
                  "0 24px 70px rgba(15,23,42,0.28)",
              }}
            >
              <header
                style={{
                  display:
                    "flex",
                  alignItems:
                    "center",
                  justifyContent:
                    "space-between",
                  gap:
                    "10px",
                  padding:
                    "11px 13px",
                  borderBottom:
                    "1px solid #e2e8f0",
                }}
              >
                <div>
                  <strong
                    style={{
                      display:
                        "block",
                      fontSize:
                        "0.95rem",
                    }}
                  >
                    🛒 Shopping Cart
                  </strong>

                  <small
                    style={{
                      color:
                        "#64748b",
                      fontSize:
                        "0.68rem",
                    }}
                  >
                    {selectedItems.length} selected
                  </small>

                  <small
                    style={{
                      display:
                        "block",
                      marginTop:
                        "2px",
                      color:
                        "#64748b",
                      fontSize:
                        "0.62rem",
                    }}
                  >
                    {
                      [
                        purchaseTypes.questions
                          ? "Test 💎5"
                          : "",
                        purchaseTypes.results
                          ? "Results 💎20"
                          : "",
                        purchaseTypes.aiTips
                          ? "AI Tips 💎10"
                          : "",
                      ]
                        .filter(
                          Boolean,
                        )
                        .join(
                          " · ",
                        ) ||
                      "No purchase type selected"
                    }
                  </small>

                  {
                    purchaseTypes.aiTips && (
                      <small
                        style={{
                          display:
                            "block",
                          marginTop:
                            "2px",
                          color:
                            "#64748b",
                          fontSize:
                            "0.58rem",
                          lineHeight:
                            1.25,
                        }}
                      >
                        [AI] elimination · approximation · estimation · pattern recognition · shortcut · common trap · time-saving strategy
                      </small>
                    )
                  }
                </div>

                <button
                  type="button"
                  aria-label="Close preview"
                  title="Close"
                  onClick={() => {
                    setAccessRequestOpen(
                      false,
                    );
                    setContactError(
                      "",
                    );
                    setContactSuccess(
                      null,
                    );
                    setPreviewOpen(
                      false,
                    );
                  }}
                  style={{
                    width:
                      "28px",
                    height:
                      "28px",
                    border:
                      "1px solid #cbd5e1",
                    borderRadius:
                      "7px",
                    background:
                      "#fff",
                    cursor:
                      "pointer",
                  }}
                >
                  ×
                </button>
              </header>

              <div
                style={{
                  overflowY:
                    "auto",
                  padding:
                    "6px 12px",
                  maxHeight:
                    "22vh",
                  minHeight:
                    0,
                }}
              >
                {
                  selectedItems.map(
                    (
                      item,
                    ) => (
                      <div
                        key={
                          item.key
                        }
                        style={{
                          display:
                            "grid",
                          gridTemplateColumns:
                            "minmax(0, 1fr) auto",
                          gap:
                            "8px",
                          padding:
                            "3px 0",
                          borderBottom:
                            "1px solid #f1f5f9",
                        }}
                      >
                        <span
                          style={{
                            fontSize:
                              "0.68rem",
                            minWidth:
                              0,
                          }}
                        >
                          {
                            item.label
                          }
                        </span>

                        <strong
                          style={{
                            fontSize:
                              "0.68rem",
                            whiteSpace:
                              "nowrap",
                          }}
                        >
                          {
                            item.type ===
                              "LIVE"
                              ? `💎 ${selectedPurchaseTypeCost}`
                              : typeof item.gemCost ===
                                  "number"
                                ? `💎 ${item.gemCost}`
                                : "Phase 2"
                          }
                        </strong>
                      </div>
                    ),
                  )
                }
              </div>

              <footer
                style={{
                  display:
                    "grid",
                  gap:
                    "4px",
                  padding:
                    "10px 13px",
                  borderTop:
                    "1px solid #e2e8f0",
                  background:
                    "#f8fafc",
                }}
              >
                {
                  !purchaseTypes.questions &&
                  !purchaseTypes.results &&
                  !purchaseTypes.aiTips && (
                    <small
                      style={{
                        color:
                          "#b42318",
                        fontSize:
                          "0.64rem",
                        textAlign:
                          "right",
                      }}
                    >
                      Select at least one purchase type.
                    </small>
                  )
                }

                <strong
                  style={{
                    textAlign:
                      "right",
                    fontSize:
                      "0.86rem",
                  }}
                >
                  Total: 💎 {liveTestAccessTotal}
                  {
                    unpricedCount > 0
                      ? ` + ${unpricedCount} Phase 2`
                      : ""
                  }
                </strong>

                {
                  unpricedCount > 0 && (
                    <small
                      style={{
                        textAlign:
                          "right",
                        color:
                          "#64748b",
                        fontSize:
                          "0.64rem",
                      }}
                    >
                      Mock/Mini package pricing will be added in Phase 2.
                    </small>
                  )
                }
                <div
                  style={{
                    display:
                      "grid",
                    gap:
                      "5px",
                    marginTop:
                      "4px",
                  }}
                >
                  <div
                    style={{
                      display:
                        "flex",
                      gap:
                        "4px",
                      alignItems:
                        "baseline",
                      justifyContent:
                        "flex-end",
                    }}
                  >
                    <small
                      style={{
                        color:
                          "#64748b",
                        fontSize:
                          "0.64rem",
                      }}
                    >
                      Your Gems
                    </small>

                    <strong
                      style={{
                        fontSize:
                          "0.76rem",
                        whiteSpace:
                          "nowrap",
                      }}
                    >
                      💎 {
                        gemBalanceLoading
                          ? "…"
                          : gemBalance ??
                            "—"
                      }
                    </strong>
                  </div>

                  {
                    gemBalance !==
                      null &&
                    liveTestAccessTotal >
                      0 && (
                      <small
                        style={{
                          textAlign:
                            "right",
                          color:
                            gemBalance >=
                            liveTestAccessTotal
                              ? "#477052"
                              : "#9a3412",
                          fontSize:
                            "0.62rem",
                          fontWeight:
                            700,
                        }}
                      >
                        {
                          gemBalance >=
                          liveTestAccessTotal
                            ? `After purchase: 💎 ${gemBalance - liveTestAccessTotal}`
                            : `Need 💎 ${liveTestAccessTotal - gemBalance} more`
                        }
                      </small>
                    )
                  }

                  {
                    purchaseError && (
                      <small
                        style={{
                          color:
                            "#b42318",
                          fontSize:
                            "0.64rem",
                        }}
                      >
                        {
                          purchaseError
                        }
                      </small>
                    )
                  }

                  {
                    purchaseSuccess && (
                      <div
                        style={{
                          padding:
                            "7px 8px",
                          border:
                            "1px solid #bbdcc3",
                          borderRadius:
                            "8px",
                          background:
                            "#f1fbf3",
                        }}
                      >
                        <strong
                          style={{
                            display:
                              "block",
                            fontSize:
                              "0.7rem",
                          }}
                        >
                          Access purchased ✓
                        </strong>
                        <small
                          style={{
                            color:
                              "#475569",
                            fontSize:
                              "0.62rem",
                          }}
                        >
                          Charged 💎{purchaseSuccess.chargedGems} · Balance 💎{purchaseSuccess.gemBalance}
                          {
                            purchaseSuccess.purchaseCode
                              ? ` · ${purchaseSuccess.purchaseCode}`
                              : ""
                          }
                        </small>
                      </div>
                    )
                  }

                  <div
                    style={{
                      display:
                        "flex",
                      justifyContent:
                        "flex-end",
                      gap:
                        "6px",
                      flexWrap:
                        "wrap",
                    }}
                  >
                    {
                      gemBalance !==
                        null &&
                      gemBalance >=
                        liveTestAccessTotal &&
                      liveTestAccessTotal >
                        0 &&
                      unpricedCount ===
                        0 && (
                        <button
                          type="button"
                          disabled={
                            purchaseBusy ||
                            Boolean(
                              purchaseSuccess,
                            )
                          }
                          onClick={() =>
                            void buyWithGems()
                          }
                          style={{
                            padding:
                              "6px 10px",
                            border:
                              "1px solid #0f172a",
                            borderRadius:
                              "8px",
                            background:
                              "#0f172a",
                            color:
                              "#fff",
                            fontSize:
                              "0.7rem",
                            fontWeight:
                              800,
                            cursor:
                              purchaseBusy
                                ? "wait"
                                : "pointer",
                          }}
                        >
                          {
                            purchaseBusy
                              ? "Buying…"
                              : `Buy with 💎${liveTestAccessTotal}`
                          }
                        </button>
                      )
                    }

                    <button
                      type="button"
                      onClick={() => {
                        setContactError(
                          "",
                        );
                        setContactSuccess(
                          null,
                        );
                        setAccessRequestOpen(
                          (
                            current,
                          ) =>
                            !current,
                        );
                      }}
                      style={{
                        padding:
                          "6px 10px",
                        border:
                          "1px solid #cbd5e1",
                        borderRadius:
                          "8px",
                        background:
                          "#fff",
                        color:
                          "#0f172a",
                        fontSize:
                          "0.7rem",
                        fontWeight:
                          800,
                        cursor:
                          "pointer",
                      }}
                    >
                      Other payment options
                    </button>
                  </div>
                </div>

                {
                  accessRequestOpen && (
                    <div
                      style={{
                        display:
                          "grid",
                        gap:
                          "6px",
                        marginTop:
                          "4px",
                        padding:
                          "9px",
                        border:
                          "1px solid #e2e8f0",
                        borderRadius:
                          "9px",
                        background:
                          "#fff",
                      }}
                    >
                      <small
                        style={{
                          color:
                            "#64748b",
                          fontSize:
                            "0.63rem",
                          lineHeight:
                            1.3,
                        }}
                      >
                        Enter your email to continue. We’ll send a secure verification link with your selected access and payment options.
                      </small>

                      <label
                        style={{
                          display:
                            "grid",
                          gap:
                            "3px",
                        }}
                      >
                        <span
                          style={{
                            fontSize:
                              "0.66rem",
                            fontWeight:
                              700,
                          }}
                        >
                          Your email
                        </span>

                        <input
                          type="email"
                          inputMode="email"
                          autoComplete="email"
                          value={
                            contactEmail
                          }
                          placeholder="you@example.com"
                          onChange={(
                            event,
                          ) => {
                            setContactEmail(
                              event.target
                                .value,
                            );
                            setContactError(
                              "",
                            );
                            setContactSuccess(
                              null,
                            );
                          }}
                          style={{
                            width:
                              "100%",
                            boxSizing:
                              "border-box",
                            padding:
                              "6px 8px",
                            border:
                              "1px solid #cbd5e1",
                            borderRadius:
                              "8px",
                            fontSize:
                              "0.72rem",
                          }}
                        />
                      </label>

                      {
                        contactError && (
                          <small
                            style={{
                              color:
                                "#b42318",
                              fontSize:
                                "0.64rem",
                            }}
                          >
                            {
                              contactError
                            }
                          </small>
                        )
                      }

                      {
                        contactSuccess
                          ? (
                              <div
                                style={{
                                  display:
                                    "grid",
                                  gap:
                                    "3px",
                                  padding:
                                    "7px 8px",
                                  border:
                                    "1px solid #bbdcc3",
                                  borderRadius:
                                    "8px",
                                  background:
                                    "#f1fbf3",
                                }}
                              >
                                <strong
                                  style={{
                                    fontSize:
                                      "0.7rem",
                                  }}
                                >
                                  Verification email sent
                                </strong>

                                <small
                                  style={{
                                    color:
                                      "#475569",
                                    fontSize:
                                      "0.63rem",
                                    lineHeight:
                                      1.3,
                                  }}
                                >
                                  Check {
                                    contactSuccess.email
                                  } and click the verification link. admin@gyan.cc has been copied on the request.
                                  {
                                    contactSuccess.requestCode
                                      ? ` Request: ${contactSuccess.requestCode}.`
                                      : ""
                                  }
                                </small>
                              </div>
                            )
                          : (
                              <button
                                type="button"
                                disabled={
                                  contactSending
                                }
                                onClick={() =>
                                  void submitAccessRequest()
                                }
                                style={{
                                  justifySelf:
                                    "end",
                                  padding:
                                    "6px 10px",
                                  border:
                                    "1px solid #0f172a",
                                  borderRadius:
                                    "8px",
                                  background:
                                    "#0f172a",
                                  color:
                                    "#fff",
                                  fontSize:
                                    "0.7rem",
                                  fontWeight:
                                    800,
                                  cursor:
                                    contactSending
                                      ? "wait"
                                      : "pointer",
                                }}
                              >
                                {
                                  contactSending
                                    ? "Sending…"
                                    : "Contact GYAN"
                                }
                              </button>
                            )
                      }
                    </div>
                  )
                }
              </footer>
            </section>
          </div>
        )
      }
    </main>
  );
}
