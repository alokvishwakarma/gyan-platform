import {
  useEffect,
  useMemo,
  useRef,
  useState,
} from "react";

import "./LivePuzzle.css";

type LivePuzzleProps = {
  onBack: () => void;
};

type TileKind = {
  color: string;
  shape: string;
};

type Position = {
  x: number;
  y: number;
};

type Bot = {
  id: string;
  name: string;
  tile: TileKind;
  body: Position[];
};

type BotProposal = {
  bot: Bot;
  target: Position;
  selectedTile: TileKind;
  grows: boolean;
};

const BOARD_SIZE = 36;
const CELL_SIZE = 30;
const DECAY_SECONDS = 10;
const BOT_MOVE_MS = 850;

const COLORS = [
  "#facc15",
  "#ef4444",
  "#3b82f6",
  "#22c55e",
  "#a855f7",
  "#f97316",
];

const SHAPES = [
  "★",
  "●",
  "▲",
  "■",
  "◆",
  "✚",
];

const ACTIVE_TILE: TileKind = {
  color: "#facc15",
  shape: "★",
};

const START_BODY: Position[] = [
  { x: 18, y: 18 },
  { x: 18, y: 19 },
  { x: 18, y: 20 },
];

const START_BOTS: Bot[] = [
  {
    id: "red",
    name: "Red",
    tile: { color: "#ef4444", shape: "●" },
    body: [
      { x: 12, y: 12 },
      { x: 12, y: 13 },
      { x: 12, y: 14 },
      { x: 13, y: 14 },
    ],
  },
  {
    id: "blue",
    name: "Blue",
    tile: { color: "#3b82f6", shape: "▲" },
    body: [
      { x: 25, y: 11 },
      { x: 24, y: 11 },
      { x: 23, y: 11 },
      { x: 22, y: 11 },
      { x: 21, y: 11 },
    ],
  },
  {
    id: "green",
    name: "Green",
    tile: { color: "#22c55e", shape: "■" },
    body: [
      { x: 27, y: 24 },
      { x: 27, y: 23 },
      { x: 27, y: 22 },
    ],
  },
  {
    id: "purple",
    name: "Purple",
    tile: { color: "#a855f7", shape: "◆" },
    body: [
      { x: 10, y: 25 },
      { x: 11, y: 25 },
      { x: 12, y: 25 },
      { x: 13, y: 25 },
      { x: 14, y: 25 },
      { x: 15, y: 25 },
    ],
  },
  {
    id: "orange",
    name: "Orange",
    tile: { color: "#f97316", shape: "✚" },
    body: [
      { x: 24, y: 18 },
      { x: 25, y: 18 },
    ],
  },
];

const OFFSETS =
  [
    [-1, -1],
    [0, -1],
    [1, -1],
    [-1, 0],
    [1, 0],
    [-1, 1],
    [0, 1],
    [1, 1],
  ] as const;

const CELLS: Position[] = [];

for (let y = 0; y < BOARD_SIZE; y += 1) {
  for (let x = 0; x < BOARD_SIZE; x += 1) {
    CELLS.push({ x, y });
  }
}

function keyOf(position: Position): string {
  return `${position.x}:${position.y}`;
}

function samePosition(
  first: Position,
  second: Position,
): boolean {
  return (
    first.x === second.x &&
    first.y === second.y
  );
}

function insideBoard(
  position: Position,
): boolean {
  return (
    position.x >= 0 &&
    position.x < BOARD_SIZE &&
    position.y >= 0 &&
    position.y < BOARD_SIZE
  );
}

function isGrowthMatch(
  selected: TileKind,
  active: TileKind,
): boolean {
  return (
    selected.color === active.color ||
    selected.shape === active.shape
  );
}

function isExactMatch(
  selected: TileKind,
  active: TileKind,
): boolean {
  return (
    selected.color === active.color &&
    selected.shape === active.shape
  );
}

function baseTileAt(
  x: number,
  y: number,
): TileKind {
  return {
    color:
      COLORS[
        (x + y) %
        COLORS.length
      ],

    shape:
      SHAPES[
        (x * 2 + y * 3) %
        SHAPES.length
      ],
  };
}

function cloneBots(): Bot[] {
  return START_BOTS.map(
    (bot) => ({
      ...bot,
      tile: { ...bot.tile },
      body:
        bot.body.map(
          (position) => ({
            ...position,
          }),
        ),
    }),
  );
}

/*
 * A diagonal move from (x,y) to (x+dx,y+dy)
 * passes between two orthogonal side cells:
 *
 *   side A = (x+dx, y)
 *   side B = (x, y+dy)
 *
 * If either side cell is occupied by ANY linked body,
 * the diagonal move is blocked.
 *
 * This prevents bodies from visually crossing through
 * each other at corners.
 */
function diagonalSides(
  from: Position,
  to: Position,
): Position[] {
  const dx = to.x - from.x;
  const dy = to.y - from.y;

  if (
    Math.abs(dx) !== 1 ||
    Math.abs(dy) !== 1
  ) {
    return [];
  }

  return [
    {
      x: from.x + dx,
      y: from.y,
    },
    {
      x: from.x,
      y: from.y + dy,
    },
  ];
}


/*
 * ========================================================
 * LOOP / TERRITORY CAPTURE
 * ========================================================
 *
 * The linked body is treated as a wall.
 *
 * We flood-fill the board from the outside using
 * 4-direction movement. This matches the game's
 * "no diagonal corner crossing" rule: a diagonal
 * corner cannot be slipped through.
 *
 * Any non-body cell not reachable from the outside
 * is enclosed territory.
 */

function headTouchesEarlierBody(
  linkedBody: Position[],
): boolean {
  if (linkedBody.length < 4) {
    return false;
  }

  const head = linkedBody[0];

  /*
   * Skip body[1], which is always the next linked
   * segment. Touching body[2+] is a possible loop
   * closure. Flood-fill below decides whether it
   * actually enclosed territory.
   */
  return linkedBody
    .slice(2)
    .some((position) => {
      const dx =
        Math.abs(
          position.x -
            head.x,
        );

      const dy =
        Math.abs(
          position.y -
            head.y,
        );

      return (
        dx <= 1 &&
        dy <= 1
      );
    });
}

function findEnclosedCells(
  linkedBody: Position[],
): Position[] {
  const wallKeys =
    new Set(
      linkedBody.map(
        keyOf,
      ),
    );

  const outside =
    new Set<string>();

  const queue:
    Position[] = [];

  function pushOutside(
    position: Position,
  ): void {
    const key =
      keyOf(position);

    if (
      wallKeys.has(key) ||
      outside.has(key)
    ) {
      return;
    }

    outside.add(key);
    queue.push(position);
  }

  /*
   * Seed every free border cell.
   */
  for (
    let x = 0;
    x < BOARD_SIZE;
    x += 1
  ) {
    pushOutside({
      x,
      y: 0,
    });

    pushOutside({
      x,
      y:
        BOARD_SIZE - 1,
    });
  }

  for (
    let y = 0;
    y < BOARD_SIZE;
    y += 1
  ) {
    pushOutside({
      x: 0,
      y,
    });

    pushOutside({
      x:
        BOARD_SIZE - 1,
      y,
    });
  }

  const cardinal =
    [
      [0, -1],
      [1, 0],
      [0, 1],
      [-1, 0],
    ] as const;

  let cursor = 0;

  while (
    cursor <
    queue.length
  ) {
    const current =
      queue[cursor];

    cursor += 1;

    for (
      const [
        dx,
        dy,
      ] of cardinal
    ) {
      const next = {
        x:
          current.x +
          dx,

        y:
          current.y +
          dy,
      };

      if (
        !insideBoard(
          next,
        )
      ) {
        continue;
      }

      pushOutside(
        next,
      );
    }
  }

  const enclosed:
    Position[] = [];

  for (
    let y = 0;
    y < BOARD_SIZE;
    y += 1
  ) {
    for (
      let x = 0;
      x < BOARD_SIZE;
      x += 1
    ) {
      const position = {
        x,
        y,
      };

      const key =
        keyOf(
          position,
        );

      if (
        !wallKeys.has(
          key,
        ) &&
        !outside.has(
          key,
        )
      ) {
        enclosed.push(
          position,
        );
      }
    }
  }

  return enclosed;
}

export default function LivePuzzle({
  onBack,
}: LivePuzzleProps) {
  const worldRef =
    useRef<HTMLDivElement | null>(
      null,
    );

  const deadlineRef =
    useRef(
      Date.now() +
        DECAY_SECONDS * 1000,
    );

  const botTickRef =
    useRef(0);

  const [
    body,
    setBody,
  ] =
    useState<Position[]>(
      START_BODY,
    );

  const [
    bots,
    setBots,
  ] =
    useState<Bot[]>(
      cloneBots,
    );

  const [
    overrides,
    setOverrides,
  ] =
    useState<
      Record<
        string,
        TileKind
      >
    >({});

  const [
    lastPlaced,
    setLastPlaced,
  ] =
    useState<Position | null>(
      null,
    );

  const [
    busted,
    setBusted,
  ] =
    useState(false);

  const [
    secondsLeft,
    setSecondsLeft,
  ] =
    useState(
      DECAY_SECONDS,
    );

  const [
    message,
    setMessage,
  ] =
    useState(
      "Select a highlighted neighboring cell.",
    );

  const head =
    body[0] ??
    START_BODY[0];

  const bodyKeys =
    useMemo(
      () =>
        new Set(
          body.map(
            keyOf,
          ),
        ),
      [body],
    );

  const botCellMap =
    useMemo(() => {
      const map =
        new Map<
          string,
          {
            bot: Bot;
            index: number;
          }
        >();

      for (const bot of bots) {
        bot.body.forEach(
          (
            position,
            index,
          ) => {
            map.set(
              keyOf(position),
              { bot, index },
            );
          },
        );
      }

      return map;
    }, [bots]);

  /*
   * Occupied by any linked body:
   * player or bot.
   */
  const occupiedBodyKeys =
    useMemo(() => {
      const keys =
        new Set<string>(
          body.map(
            keyOf,
          ),
        );

      for (const bot of bots) {
        for (
          const position
          of bot.body
        ) {
          keys.add(
            keyOf(position),
          );
        }
      }

      return keys;
    }, [
      body,
      bots,
    ]);

  useEffect(() => {
    const bodyOverflow =
      document.body.style
        .overflow;

    const htmlOverflow =
      document
        .documentElement
        .style.overflow;

    document.body.style
      .overflow =
      "hidden";

    document.documentElement
      .style.overflow =
      "hidden";

    return () => {
      document.body.style
        .overflow =
        bodyOverflow;

      document.documentElement
        .style.overflow =
        htmlOverflow;
    };
  }, []);

  useEffect(() => {
    const world =
      worldRef.current;

    if (!world) {
      return;
    }

    world.scrollLeft =
      Math.max(
        0,
        START_BODY[0].x *
          CELL_SIZE -
          world.clientWidth /
            2 +
          CELL_SIZE / 2,
      );

    world.scrollTop =
      Math.max(
        0,
        START_BODY[0].y *
          CELL_SIZE -
          world.clientHeight /
            2 +
          CELL_SIZE / 2,
      );
  }, []);

  function resetTimer():
    void {
    deadlineRef.current =
      Date.now() +
      DECAY_SECONDS * 1000;

    setSecondsLeft(
      DECAY_SECONDS,
    );
  }

  function boardTile(
    position: Position,
  ): TileKind {
    return (
      overrides[
        keyOf(position)
      ] ??
      baseTileAt(
        position.x,
        position.y,
      )
    );
  }

  function isNeighbor(
    position: Position,
  ): boolean {
    const dx =
      Math.abs(
        position.x -
          head.x,
      );

    const dy =
      Math.abs(
        position.y -
          head.y,
      );

    return (
      dx <= 1 &&
      dy <= 1 &&
      !(
        dx === 0 &&
        dy === 0
      )
    );
  }

  function diagonalPathClear(
    from: Position,
    to: Position,
    occupiedKeys:
      Set<string>,
  ): boolean {
    const sides =
      diagonalSides(
        from,
        to,
      );

    if (
      sides.length ===
      0
    ) {
      return true;
    }

    return sides.every(
      (side) =>
        !occupiedKeys.has(
          keyOf(side),
        ),
    );
  }

  function canPlayerEnter(
    position: Position,
  ): boolean {
    return (
      !busted &&
      body.length > 0 &&
      insideBoard(
        position,
      ) &&
      isNeighbor(
        position,
      ) &&
      !bodyKeys.has(
        keyOf(position),
      ) &&
      !botCellMap.has(
        keyOf(position),
      ) &&
      diagonalPathClear(
        head,
        position,
        occupiedBodyKeys,
      )
    );
  }

  function surroundedByOpponents():
    boolean {
    if (
      busted ||
      body.length === 0
    ) {
      return false;
    }

    const candidates =
      OFFSETS
        .map(
          ([dx, dy]) => ({
            x:
              head.x +
              dx,
            y:
              head.y +
              dy,
          }),
        )
        .filter(
          insideBoard,
        )
        .filter(
          (position) =>
            !bodyKeys.has(
              keyOf(position),
            ),
        );

    if (
      candidates.length ===
      0
    ) {
      return false;
    }

    /*
     * A neighbor is effectively blocked if:
     * 1. opponent occupies the target, OR
     * 2. it is diagonal and the corner path is blocked
     *    by opponent bodies.
     *
     * Own-body corner blocking alone does not create Bust.
     */
    return candidates.every(
      (position) => {
        if (
          botCellMap.has(
            keyOf(position),
          )
        ) {
          return true;
        }

        const sides =
          diagonalSides(
            head,
            position,
          );

        if (
          sides.length ===
          0
        ) {
          return false;
        }

        return sides.some(
          (side) =>
            botCellMap.has(
              keyOf(side),
            ),
        );
      },
    );
  }

  function bustPlayer():
    void {
    if (
      busted ||
      body.length === 0
    ) {
      return;
    }

    setOverrides(
      (current) => {
        const next = {
          ...current,
        };

        for (
          const position
          of body
        ) {
          next[
            keyOf(position)
          ] =
            ACTIVE_TILE;
        }

        return next;
      },
    );

    setBody([]);
    setBusted(true);

    setMessage(
      "💥 Busted — opponents completely surrounded your head.",
    );
  }

  useEffect(() => {
    if (
      !busted &&
      body.length > 0 &&
      surroundedByOpponents()
    ) {
      bustPlayer();
    }
  });

  useEffect(() => {
    if (
      busted ||
      body.length <= 1
    ) {
      return;
    }

    const intervalId =
      window.setInterval(
        () => {
          if (
            surroundedByOpponents()
          ) {
            return;
          }

          const remainingMs =
            Math.max(
              0,
              deadlineRef.current -
                Date.now(),
            );

          setSecondsLeft(
            Math.max(
              0,
              Math.ceil(
                remainingMs /
                  1000,
              ),
            ),
          );

          if (
            remainingMs > 0
          ) {
            return;
          }

          setBody(
            (current) => {
              if (
                current.length <= 1
              ) {
                return current;
              }

              const oldTail =
                current[
                  current.length -
                    1
                ];

              setOverrides(
                (
                  currentOverrides,
                ) => ({
                  ...currentOverrides,

                  [keyOf(oldTail)]:
                    ACTIVE_TILE,
                }),
              );

              setLastPlaced(
                oldTail,
              );

              return current.slice(
                0,
                -1,
              );
            },
          );

          setMessage(
            "⌛ 10 seconds without movement — one linked tail cell returned to the board.",
          );

          resetTimer();
        },
        250,
      );

    return () => {
      window.clearInterval(
        intervalId,
      );
    };
  });

  /*
   * Moving bots with no diagonal corner-cutting.
   */
  useEffect(() => {
    if (busted) {
      return;
    }

    const intervalId =
      window.setInterval(
        () => {
          botTickRef.current +=
            1;

          const occupied =
            new Map<
              string,
              string
            >();

          for (
            const position
            of body
          ) {
            occupied.set(
              keyOf(position),
              "player",
            );
          }

          for (
            const bot of bots
          ) {
            for (
              const position
              of bot.body
            ) {
              occupied.set(
                keyOf(position),
                bot.id,
              );
            }
          }

          const occupiedSet =
            new Set(
              occupied.keys(),
            );

          const proposals:
            BotProposal[] = [];

          bots.forEach(
            (
              bot,
              botIndex,
            ) => {
              const botHead =
                bot.body[0];

              const ownKeys =
                new Set(
                  bot.body.map(
                    keyOf,
                  ),
                );

              const candidates =
                OFFSETS
                  .map(
                    (
                      [
                        dx,
                        dy,
                      ],
                    ) => ({
                      x:
                        botHead.x +
                        dx,
                      y:
                        botHead.y +
                        dy,
                    }),
                  )
                  .filter(
                    insideBoard,
                  )
                  .filter(
                    (
                      position,
                    ) => {
                      const targetKey =
                        keyOf(
                          position,
                        );

                      if (
                        ownKeys.has(
                          targetKey,
                        ) ||
                        occupied.has(
                          targetKey,
                        )
                      ) {
                        return false;
                      }

                      return (
                        diagonalPathClear(
                          botHead,
                          position,
                          occupiedSet,
                        )
                      );
                    },
                  );

              if (
                candidates.length ===
                0
              ) {
                return;
              }

              const growthCandidates =
                candidates.filter(
                  (
                    position,
                  ) =>
                    isGrowthMatch(
                      boardTile(
                        position,
                      ),
                      bot.tile,
                    ),
                );

              const pool =
                growthCandidates.length >
                0
                  ? growthCandidates
                  : candidates;

              const index =
                (
                  botTickRef.current +
                  botIndex * 3
                ) %
                pool.length;

              const target =
                pool[index];

              const selectedTile =
                boardTile(
                  target,
                );

              proposals.push({
                bot,
                target,
                selectedTile,
                grows:
                  isGrowthMatch(
                    selectedTile,
                    bot.tile,
                  ),
              });
            },
          );

          const groups =
            new Map<
              string,
              BotProposal[]
            >();

          for (
            const proposal
            of proposals
          ) {
            const targetKey =
              keyOf(
                proposal.target,
              );

            const group =
              groups.get(
                targetKey,
              ) ??
              [];

            group.push(
              proposal,
            );

            groups.set(
              targetKey,
              group,
            );
          }

          const winners =
            new Map<
              string,
              BotProposal
            >();

          for (
            const group
            of groups.values()
          ) {
            if (
              group.length ===
              1
            ) {
              winners.set(
                group[0].bot.id,
                group[0],
              );
              continue;
            }

            const strongest =
              Math.max(
                ...group.map(
                  (
                    proposal,
                  ) =>
                    proposal.bot
                      .body
                      .length,
                ),
              );

            const strongestGroup =
              group.filter(
                (
                  proposal,
                ) =>
                  proposal.bot
                    .body
                    .length ===
                  strongest,
              );

            if (
              strongestGroup.length >
              1
            ) {
              continue;
            }

            winners.set(
              strongestGroup[0]
                .bot.id,
              strongestGroup[0],
            );
          }

          if (
            winners.size ===
            0
          ) {
            return;
          }

          const nextOverrides = {
            ...overrides,
          };

          const nextBots =
            bots.map(
              (bot) => {
                const proposal =
                  winners.get(
                    bot.id,
                  );

                if (!proposal) {
                  return bot;
                }

                const oldTail =
                  bot.body[
                    bot.body.length -
                      1
                  ];

                delete nextOverrides[
                  keyOf(
                    proposal.target,
                  )
                ];

                if (
                  proposal.grows
                ) {
                  return {
                    ...bot,
                    body: [
                      proposal.target,
                      ...bot.body,
                    ],
                  };
                }

                nextOverrides[
                  keyOf(oldTail)
                ] =
                  proposal.selectedTile;

                return {
                  ...bot,
                  body: [
                    proposal.target,
                    ...bot.body.slice(
                      0,
                      -1,
                    ),
                  ],
                };
              },
            );

          setOverrides(
            nextOverrides,
          );

          setBots(
            nextBots,
          );
        },
        BOT_MOVE_MS,
      );

    return () => {
      window.clearInterval(
        intervalId,
      );
    };
  }, [
    bots,
    body,
    busted,
    overrides,
  ]);

  function selectCell(
    selected: Position,
  ): void {
    if (
      busted ||
      body.length === 0
    ) {
      return;
    }

    /*
     * Give explicit feedback for diagonal corner blocking.
     */
    if (
      isNeighbor(selected) &&
      !diagonalPathClear(
        head,
        selected,
        occupiedBodyKeys,
      )
    ) {
      setMessage(
        "↘ Diagonal blocked — you cannot cross through another linked body.",
      );

      return;
    }

    const botCell =
      botCellMap.get(
        keyOf(selected),
      );

    if (botCell) {
      setMessage(
        `${botCell.bot.name} sequence occupies that cell — move blocked.`,
      );

      return;
    }

    if (
      !canPlayerEnter(
        selected,
      )
    ) {
      return;
    }

    const selectedTile =
      boardTile(
        selected,
      );

    const grows =
      isGrowthMatch(
        selectedTile,
        ACTIVE_TILE,
      );

    const exact =
      isExactMatch(
        selectedTile,
        ACTIVE_TILE,
      );

    const oldTail =
      body[
        body.length - 1
      ];

    /*
     * Compute the complete next linked body BEFORE
     * updating state so loop detection sees the
     * exact post-move shape.
     */
    const nextBody =
      grows
        ? [
            selected,
            ...body,
          ]
        : [
            selected,
            ...body.slice(
              0,
              -1,
            ),
          ];

    /*
     * A loop is only considered when the new head
     * reconnects beside an earlier part of its own
     * linked body. Flood-fill then confirms whether
     * any territory was truly enclosed.
     */
    const enclosed =
      headTouchesEarlierBody(
        nextBody,
      )
        ? findEnclosedCells(
            nextBody,
          )
        : [];

    const enclosedKeys =
      new Set(
        enclosed.map(
          keyOf,
        ),
      );

    /*
     * Any bot with at least one linked cell inside
     * the enclosed territory is captured/busted.
     */
    const capturedBotIds =
      new Set(
        bots
          .filter(
            (bot) =>
              bot.body.some(
                (position) =>
                  enclosedKeys.has(
                    keyOf(
                      position,
                    ),
                  ),
              ),
          )
          .map(
            (bot) =>
              bot.id,
          ),
      );

    setOverrides(
      (current) => {
        const next = {
          ...current,
        };

        /*
         * Normal move mechanics first.
         */
        delete next[
          keyOf(selected)
        ];

        if (!grows) {
          next[
            keyOf(oldTail)
          ] =
            selectedTile;
        }

        if (
          enclosed.length >
          0
        ) {
          /*
           * LOOP CAPTURE:
           * every enclosed board cell becomes the
           * player's active Yellow Star.
           */
          for (
            const position
            of enclosed
          ) {
            next[
              keyOf(
                position,
              )
            ] =
              ACTIVE_TILE;
          }

          /*
           * A captured bot is busted completely.
           *
           * - cells INSIDE the captured territory
           *   remain Yellow Stars (capture wins)
           * - any part of that bot OUTSIDE the loop
           *   returns to the board as the bot's own
           *   normal tile.
           */
          for (
            const bot of bots
          ) {
            if (
              !capturedBotIds.has(
                bot.id,
              )
            ) {
              continue;
            }

            for (
              const position
              of bot.body
            ) {
              const key =
                keyOf(
                  position,
                );

              if (
                enclosedKeys.has(
                  key,
                )
              ) {
                next[key] =
                  ACTIVE_TILE;
              } else {
                next[key] =
                  bot.tile;
              }
            }
          }
        }

        return next;
      },
    );

    setBody(
      nextBody,
    );

    if (!grows) {
      setLastPlaced(
        oldTail,
      );
    } else {
      setLastPlaced(
        null,
      );
    }

    if (
      capturedBotIds.size >
      0
    ) {
      setBots(
        (currentBots) =>
          currentBots.filter(
            (bot) =>
              !capturedBotIds.has(
                bot.id,
              ),
          ),
      );
    }

    if (
      enclosed.length >
      0
    ) {
      const botText =
        capturedBotIds.size >
        0
          ? ` · ${capturedBotIds.size} bot${
              capturedBotIds.size === 1
                ? ""
                : "s"
            } busted`
          : "";

      setMessage(
        `🟨 Loop capture! ${enclosed.length} enclosed cell${
          enclosed.length === 1
            ? ""
            : "s"
        } became Yellow Stars${botText}.`,
      );
    } else if (grows) {
      setMessage(
        exact
          ? `✨ EXACT MATCH — grew to ${nextBody.length}.`
          : `✨ COLOR/SHAPE MATCH — grew to ${nextBody.length}.`,
      );
    } else {
      setMessage(
        "Moved — no color/shape match, so selected tile moved to the released tail.",
      );
    }

    resetTimer();
  }

  function restart():
    void {
    setBody(
      START_BODY,
    );

    setBots(
      cloneBots(),
    );

    setOverrides(
      {},
    );

    setLastPlaced(
      null,
    );

    setBusted(
      false,
    );

    setMessage(
      "Select a highlighted neighboring cell.",
    );

    botTickRef.current =
      0;

    resetTimer();
  }

  return (
    <section className="live-puzzle">
      <div className="live-puzzle__topbar">
        <button
          type="button"
          onClick={onBack}
          className="live-puzzle__back"
        >
          ← Puzzle
        </button>

        <strong className="live-puzzle__brand">
          GYAN LIVE
        </strong>

        <span className="live-puzzle__status">
          ● LIVE
        </span>
      </div>

      <div className="live-puzzle__game">
        <div
          ref={worldRef}
          className="live-puzzle__world"
        >
          <div className="live-puzzle__board">
            {CELLS.map(
              (position) => {
                const key =
                  keyOf(
                    position,
                  );

                const bodyIndex =
                  body.findIndex(
                    (
                      bodyPosition,
                    ) =>
                      samePosition(
                        bodyPosition,
                        position,
                      ),
                  );

                const botCell =
                  botCellMap.get(
                    key,
                  );

                const placed =
                  lastPlaced !==
                    null &&
                  samePosition(
                    lastPlaced,
                    position,
                  );

                if (
                  bodyIndex >= 0
                ) {
                  const tailWarning =
                    body.length >
                      1 &&
                    bodyIndex ===
                      body.length - 1 &&
                    secondsLeft <=
                      3;

                  return (
                    <div
                      key={key}
                      className={[
                        "live-puzzle__tile",
                        "live-puzzle__linked",
                        bodyIndex === 0
                          ? "live-puzzle__head"
                          : "",
                        tailWarning
                          ? "live-puzzle__tail-warning"
                          : "",
                      ].join(" ")}
                      style={{
                        backgroundColor:
                          ACTIVE_TILE.color,
                      }}
                    >
                      {
                        ACTIVE_TILE.shape
                      }
                    </div>
                  );
                }

                if (botCell) {
                  return (
                    <div
                      key={key}
                      className={[
                        "live-puzzle__tile",
                        "live-puzzle__bot",
                        botCell.index === 0
                          ? "live-puzzle__bot-head"
                          : "",
                      ].join(" ")}
                      style={{
                        backgroundColor:
                          botCell.bot.tile.color,
                      }}
                      title={`${botCell.bot.name} · strength ${botCell.bot.body.length}`}
                    >
                      {
                        botCell.bot.tile.shape
                      }
                    </div>
                  );
                }

                const tile =
                  boardTile(
                    position,
                  );

                const enterable =
                  canPlayerEnter(
                    position,
                  );

                const diagonalBlocked =
                  isNeighbor(
                    position,
                  ) &&
                  !bodyKeys.has(
                    key,
                  ) &&
                  !botCellMap.has(
                    key,
                  ) &&
                  !diagonalPathClear(
                    head,
                    position,
                    occupiedBodyKeys,
                  );

                const growth =
                  enterable &&
                  isGrowthMatch(
                    tile,
                    ACTIVE_TILE,
                  );

                const exact =
                  growth &&
                  isExactMatch(
                    tile,
                    ACTIVE_TILE,
                  );

                return (
                  <button
                    key={key}
                    type="button"
                    className={[
                      "live-puzzle__tile",
                      "live-puzzle__board-tile",
                      enterable
                        ? "live-puzzle__neighbor"
                        : "",
                      diagonalBlocked
                        ? "live-puzzle__diagonal-blocked"
                        : "",
                      growth
                        ? "live-puzzle__growth"
                        : "",
                      exact
                        ? "live-puzzle__exact"
                        : "",
                      placed
                        ? "live-puzzle__placed"
                        : "",
                    ].join(" ")}
                    style={{
                      color:
                        tile.color,
                    }}
                    disabled={
                      !enterable
                    }
                    onClick={() =>
                      selectCell(
                        position,
                      )
                    }
                  >
                    {tile.shape}

                    {growth && (
                      <span
                        className="live-puzzle__grow-mark"
                        aria-hidden="true"
                      >
                        +
                      </span>
                    )}
                  </button>
                );
              },
            )}
          </div>
        </div>

        <div className="live-puzzle__hud">
          <span>
            You:{" "}
            {body.length}
          </span>

          <span>
            Tail:{" "}
            {body.length > 1
              ? `${secondsLeft}s`
              : "safe"}
          </span>

          {bots.map(
            (bot) => (
              <span
                key={bot.id}
              >
                🤖{" "}
                {bot.body.length}
              </span>
            ),
          )}
        </div>

        <div className="live-puzzle__message">
          {message}
        </div>

        {busted && (
          <button
            type="button"
            className="live-puzzle__restart"
            onClick={
              restart
            }
          >
            Play Again
          </button>
        )}
      </div>
    </section>
  );
}
