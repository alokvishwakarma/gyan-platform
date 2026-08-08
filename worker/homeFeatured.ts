interface FeaturedRow {
  id: number;

  source_type: string;

  title: string;

  description:
    | string
    | null;

  icon:
    | string
    | null;

  image_url:
    | string
    | null;

  cta_label: string;

  target_url:
    | string
    | null;

  service_code:
    | string
    | null;

  shop_code:
    | string
    | null;

  latitude:
    | number
    | null;

  longitude:
    | number
    | null;

  radius_km:
    | number
    | null;

  priority: number;

  offer_text:
    | string
    | null;

  discount_percent:
    | number
    | null;
}


interface ShopServiceRow {
  shop_code: string;

  shop_name: string;

  latitude: number;

  longitude: number;

  service_code: string;

  service_name: string;

  service_description:
    | string
    | null;

  service_icon:
    | string
    | null;

  sort_order: number;
}


interface RankedPromotion {
  promotion:
    FeaturedRow;

  distanceKm:
    number;
}


const DEFAULT_FEATURED_SHOP_DISTANCE_KM =
  5;


const DEFAULT_LOCAL_AD_LIMIT =
  3;


const MAX_LOCAL_AD_LIMIT =
  10;


/*
 * ========================================================
 * RESPONSE
 * ========================================================
 */

function jsonResponse(
  data: unknown,
  status = 200,
): Response {
  return new Response(
    JSON.stringify(
      data,
    ),
    {
      status,

      headers: {
        "content-type":
          "application/json; charset=utf-8",

        "cache-control":
          "no-store",
      },
    },
  );
}


/*
 * ========================================================
 * CONFIGURATION
 * ========================================================
 */

function getMaxFeaturedShopDistanceKm(
  env: Env,
): number {
  const configured =
    Number(
      env.FEATURED_SHOP_DISTANCE_KM,
    );


  if (
    Number.isFinite(
      configured,
    ) &&
    configured >
      0
  ) {
    return configured;
  }


  return (
    DEFAULT_FEATURED_SHOP_DISTANCE_KM
  );
}


function getRequestedLimit(
  url: URL,
): number {
  const requested =
    Number(
      url.searchParams.get(
        "limit",
      ),
    );


  if (
    !Number.isFinite(
      requested,
    ) ||
    requested <=
      0
  ) {
    return (
      DEFAULT_LOCAL_AD_LIMIT
    );
  }


  return Math.min(
    Math.floor(
      requested,
    ),

    MAX_LOCAL_AD_LIMIT,
  );
}


/*
 * ========================================================
 * LOCATION HELPERS
 * ========================================================
 */

function parseCoordinate(
  value:
    | string
    | null,
): number | null {
  if (
    value == null ||
    value.trim() ===
      ""
  ) {
    return null;
  }


  const parsed =
    Number(
      value,
    );


  return Number.isFinite(
    parsed,
  )
    ? parsed
    : null;
}


function toRadians(
  value: number,
): number {
  return (
    value *
    Math.PI /
    180
  );
}


function calculateDistanceKm(
  firstLatitude: number,
  firstLongitude: number,

  secondLatitude: number,
  secondLongitude: number,
): number {
  const earthRadiusKm =
    6371;


  const latitudeDifference =
    toRadians(
      secondLatitude -
        firstLatitude,
    );


  const longitudeDifference =
    toRadians(
      secondLongitude -
        firstLongitude,
    );


  const firstLatitudeRadians =
    toRadians(
      firstLatitude,
    );


  const secondLatitudeRadians =
    toRadians(
      secondLatitude,
    );


  const value =
    Math.sin(
      latitudeDifference /
        2,
    ) ** 2 +
    Math.cos(
      firstLatitudeRadians,
    ) *
      Math.cos(
        secondLatitudeRadians,
      ) *
      Math.sin(
        longitudeDifference /
          2,
      ) ** 2;


  return (
    earthRadiusKm *
    2 *
    Math.atan2(
      Math.sqrt(
        value,
      ),

      Math.sqrt(
        1 - value,
      ),
    )
  );
}


/*
 * ========================================================
 * PROMOTION MAPPING
 * ========================================================
 */

function mapPromotion(
  row:
    FeaturedRow,

  distanceKm:
    | number
    | null,
) {
  return {
    id:
      row.id,

    source:
      row.source_type,

    title:
      row.title,

    description:
      row.description ??
      "",

    icon:
      row.icon ??
      "⭐",

    imageUrl:
      row.image_url,

    ctaLabel:
      row.cta_label,

    targetUrl:
      row.target_url,

    serviceCode:
      row.service_code,

    shopCode:
      row.shop_code,

    shopName:
      null,

    offerText:
      row.offer_text,

    discountPercent:
      row.discount_percent,

    distanceKm,
  };
}


/*
 * ========================================================
 * ACTIVE PROMOTIONS
 * ========================================================
 */

async function loadActivePromotions(
  env: Env,
): Promise<
  FeaturedRow[]
> {
  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          id,
          source_type,
          title,
          description,
          icon,
          image_url,
          cta_label,
          target_url,
          service_code,
          shop_code,
          latitude,
          longitude,
          radius_km,
          priority,
          offer_text,
          discount_percent

        FROM featured_promotions

        WHERE
          enabled = 1

AND (
  starts_at IS NULL
  OR datetime(starts_at) <= CURRENT_TIMESTAMP
)

AND (
  ends_at IS NULL
  OR datetime(ends_at) >= CURRENT_TIMESTAMP
)

        ORDER BY
          priority DESC,
          id DESC
        `,
      )
      .all<FeaturedRow>();


  return (
    result.results ??
    []
  );
}


/*
 * ========================================================
 * RANK LOCAL PHYSICAL ADS
 *
 * Eligibility:
 *
 * user distance <= ad radius
 *
 * Ranking:
 *
 * 1. closest
 * 2. highest discount %
 * 3. highest priority
 * 4. newest id
 * ========================================================
 */

function rankLocalPromotions(
  promotions:
    FeaturedRow[],

  latitude:
    number,

  longitude:
    number,
): RankedPromotion[] {
  return promotions
    .filter(
      (
        promotion,
      ) =>
        promotion
          .source_type ===
          "gyan" &&

        promotion.latitude !=
          null &&

        promotion.longitude !=
          null &&

        promotion.radius_km !=
          null,
    )

    .map(
      (
        promotion,
      ) => {
        const distanceKm =
          calculateDistanceKm(
            latitude,
            longitude,

            promotion
              .latitude as number,

            promotion
              .longitude as number,
          );


        return {
          promotion,

          distanceKm,
        };
      },
    )

    .filter(
      (
        candidate,
      ) =>
        candidate.distanceKm <=
        (
          candidate
            .promotion
            .radius_km as number
        ),
    )

    .sort(
      (
        first,
        second,
      ) => {
        /*
         * 1. Closest first.
         */
        const distanceDifference =
          first.distanceKm -
          second.distanceKm;


        /*
         * Treat effectively equal
         * distances as equal so that
         * discount can break the tie.
         */
        if (
          Math.abs(
            distanceDifference,
          ) >
          0.001
        ) {
          return (
            distanceDifference
          );
        }


        /*
         * 2. Higher percentage
         * discount wins.
         *
         * NULL behaves like 0.
         */
        const firstDiscount =
          first
            .promotion
            .discount_percent ??
          0;


        const secondDiscount =
          second
            .promotion
            .discount_percent ??
          0;


        if (
          firstDiscount !==
          secondDiscount
        ) {
          return (
            secondDiscount -
            firstDiscount
          );
        }


        /*
         * 3. Higher priority.
         */
        if (
          first
            .promotion
            .priority !==
          second
            .promotion
            .priority
        ) {
          return (
            second
              .promotion
              .priority -
            first
              .promotion
              .priority
          );
        }


        /*
         * 4. Newer record.
         */
        return (
          second
            .promotion
            .id -
          first
            .promotion
            .id
        );
      },
    );
}


/*
 * ========================================================
 * SHOP SERVICES
 *
 * We do not currently require the owner to select
 * a featured service.
 *
 * First enabled service by sort_order becomes the
 * featured service for that shop.
 * ========================================================
 */

async function loadShopServices(
  env: Env,
): Promise<
  ShopServiceRow[]
> {
  const result =
    await env.gyan_registry
      .prepare(
        `
        SELECT
          sh.code
            AS shop_code,

          sh.name
            AS shop_name,

          sh.latitude,

          sh.longitude,

          s.service_code,

          COALESCE(
            ss.display_name,
            s.name
          )
            AS service_name,

          COALESCE(
            ss.description_override,
            s.description
          )
            AS service_description,

          COALESCE(
            ss.icon_override,
            s.icon
          )
            AS service_icon,

          ss.sort_order

        FROM shops sh

        JOIN shop_services ss
          ON ss.shop_code =
             sh.code

        JOIN services s
          ON s.id =
             ss.service_id

        WHERE
          sh.status =
            'active'

          AND sh.code !=
            'SUPP'

          AND sh.latitude
            IS NOT NULL

          AND sh.longitude
            IS NOT NULL

          AND ss.enabled =
            1

          AND s.enabled =
            1

        ORDER BY
          sh.code,
          ss.sort_order,
          ss.id
        `,
      )
      .all<ShopServiceRow>();


  return (
    result.results ??
    []
  );
}


/*
 * ========================================================
 * NEAREST PARTICIPATING GYAN SHOP
 * ========================================================
 */

async function findNearestShopFeatured(
  env: Env,

  latitude:
    number,

  longitude:
    number,
) {
  const rows =
    await loadShopServices(
      env,
    );


  const maxDistanceKm =
    getMaxFeaturedShopDistanceKm(
      env,
    );


  /*
   * Keep only the first enabled
   * service for each shop.
   */
  const firstServiceByShop =
    new Map<
      string,
      ShopServiceRow
    >();


  for (
    const row of
    rows
  ) {
    if (
      !firstServiceByShop.has(
        row.shop_code,
      )
    ) {
      firstServiceByShop.set(
        row.shop_code,
        row,
      );
    }
  }


  let nearest:
    {
      service:
        ShopServiceRow;

      distanceKm:
        number;
    }
    | null = null;


  for (
    const service of
    firstServiceByShop.values()
  ) {
    const distanceKm =
      calculateDistanceKm(
        latitude,
        longitude,

        service.latitude,
        service.longitude,
      );


    if (
      distanceKm >
      maxDistanceKm
    ) {
      continue;
    }


    if (
      !nearest ||
      distanceKm <
        nearest.distanceKm
    ) {
      nearest = {
        service,

        distanceKm,
      };
    }
  }


  if (
    !nearest
  ) {
    return null;
  }


  return {
    source:
      "shop",

    title:
      nearest
        .service
        .service_name,

    description:
      nearest
        .service
        .service_description ??
      `Available from ${
        nearest
          .service
          .shop_name
      }`,

    icon:
      nearest
        .service
        .service_icon ??
      "🏪",

    imageUrl:
      null,

    ctaLabel:
      "Open",

    targetUrl:
      null,

    serviceCode:
      nearest
        .service
        .service_code,

    shopCode:
      nearest
        .service
        .shop_code,

    shopName:
      nearest
        .service
        .shop_name,

    offerText:
      null,

    discountPercent:
      null,

    distanceKm:
      nearest
        .distanceKm,
  };
}


/*
 * ========================================================
 * ONLINE FALLBACK
 *
 * For layouts with only 1 or 2 local ads,
 * we allow exactly ONE online service.
 *
 * We currently use the Admin Default
 * promotion for that slot.
 * ========================================================
 */

function findOnlineFallback(
  promotions:
    FeaturedRow[],
) {
  const fallback =
    promotions.find(
      (
        promotion,
      ) =>
        promotion
          .source_type ===
        "default",
    );


  if (
    !fallback
  ) {
    return null;
  }


  return mapPromotion(
    fallback,
    null,
  );
}


/*
 * ========================================================
 * GENERAL AFFILIATE FALLBACK
 * ========================================================
 */

function findAffiliateFallback(
  promotions:
    FeaturedRow[],
) {
  const affiliate =
    promotions.find(
      (
        promotion,
      ) =>
        (
          promotion
            .source_type ===
            "groupon" ||

          promotion
            .source_type ===
            "woot" ||

          promotion
            .source_type ===
            "affiliate"
        ) &&

        promotion.latitude ==
          null &&

        promotion.longitude ==
          null,
    );


  if (
    !affiliate
  ) {
    return null;
  }


  return mapPromotion(
    affiliate,
    null,
  );
}


/*
 * ========================================================
 * ADMIN DEFAULT FALLBACK
 * ========================================================
 */

function findDefaultFallback(
  promotions:
    FeaturedRow[],
) {
  const fallback =
    promotions.find(
      (
        promotion,
      ) =>
        promotion
          .source_type ===
          "default",
    );


  if (
    !fallback
  ) {
    return null;
  }


  return mapPromotion(
    fallback,
    null,
  );
}


/*
 * ========================================================
 * HOME FEATURED ROUTE
 *
 * GET /api/home-featured
 *
 * Optional:
 *
 * ?lat=...
 * &lng=...
 * &limit=3
 *
 *
 * LOCAL ADS:
 *
 * 3+ ads
 *
 * #1             100%
 * #2 40% | #3 40% | More 20%
 *
 *
 * 2 ads
 *
 * #1             100%
 * #2 50% | Online 50%
 *
 *
 * 1 ad
 *
 * #1             100%
 * Online 50% | Discover GYAN 50%
 *
 *
 * 0 ads
 *
 * Nearby GYAN shop
 *      ↓
 * Affiliate
 *      ↓
 * Admin default
 * ========================================================
 */

export async function handleHomeFeaturedRoute(
  request:
    Request,

  env:
    Env,

  url:
    URL,
): Promise<
  Response | null
> {
  if (
    request.method !==
      "GET" ||

    url.pathname !==
      "/api/home-featured"
  ) {
    return null;
  }


  const latitude =
    parseCoordinate(
      url.searchParams.get(
        "lat",
      ),
    );


  const longitude =
    parseCoordinate(
      url.searchParams.get(
        "lng",
      ),
    );


  const requestedLimit =
    getRequestedLimit(
      url,
    );


  const promotions =
    await loadActivePromotions(
      env,
    );


  /*
   * =====================================================
   * PHYSICAL LOCAL ADS
   * =====================================================
   */

  if (
    latitude != null &&
    longitude != null
  ) {
    const ranked =
      rankLocalPromotions(
        promotions,

        latitude,

        longitude,
      );


    /*
     * If ANY physical advertisement qualifies,
     * it becomes the primary Featured content.
     *
     * We do NOT replace it with shop,
     * affiliate or default.
     */
    if (
      ranked.length >
      0
    ) {
      const physicalAds =
        ranked
          .slice(
            0,
            requestedLimit,
          )
          .map(
            (
              candidate,
            ) =>
              mapPromotion(
                candidate
                  .promotion,

                candidate
                  .distanceKm,
              ),
          );


      const otherCount =
        Math.max(
          0,

          ranked.length -
            physicalAds.length,
        );


      /*
       * At most ONE online service.
       *
       * Only needed when fewer than
       * three physical advertisements
       * exist.
       */
      const onlineFallback =
        ranked.length <
        3
          ? findOnlineFallback(
              promotions,
            )
          : null;


      return jsonResponse({
        mode:
          "local_ads",

        physicalAds,

        onlineFallback,

        /*
         * UI can show the GYAN
         * introduction/video tile
         * when exactly one physical
         * advertisement exists.
         */
        showGyanTile:
          ranked.length ===
          1,

        otherCount,

        totalPhysicalAds:
          ranked.length,

        fallback:
          null,
      });
    }


    /*
     * =================================================
     * ZERO LOCAL ADS:
     * NEAREST PARTICIPATING GYAN SHOP
     * =================================================
     */

    const shopFeatured =
      await findNearestShopFeatured(
        env,

        latitude,

        longitude,
      );


    if (
      shopFeatured
    ) {
      return jsonResponse({
        mode:
          "fallback",

        physicalAds:
          [],

        onlineFallback:
          null,

        showGyanTile:
          false,

        otherCount:
          0,

        totalPhysicalAds:
          0,

        fallback:
          shopFeatured,
      });
    }
  }


  /*
   * =====================================================
   * ZERO LOCAL ADS:
   * GENERAL AFFILIATE
   * =====================================================
   */

  const affiliate =
    findAffiliateFallback(
      promotions,
    );


  if (
    affiliate
  ) {
    return jsonResponse({
      mode:
        "fallback",

      physicalAds:
        [],

      onlineFallback:
        null,

      showGyanTile:
        false,

      otherCount:
        0,

      totalPhysicalAds:
        0,

      fallback:
        affiliate,
    });
  }


  /*
   * =====================================================
   * ZERO LOCAL ADS:
   * ADMIN DEFAULT
   * =====================================================
   */

  const defaultFallback =
    findDefaultFallback(
      promotions,
    );


  if (
    defaultFallback
  ) {
    return jsonResponse({
      mode:
        "fallback",

      physicalAds:
        [],

      onlineFallback:
        null,

      showGyanTile:
        false,

      otherCount:
        0,

      totalPhysicalAds:
        0,

      fallback:
        defaultFallback,
    });
  }


  /*
   * Absolutely nothing configured.
   */
  return jsonResponse({
    mode:
      "fallback",

    physicalAds:
      [],

    onlineFallback:
      null,

    showGyanTile:
      false,

    otherCount:
      0,

    totalPhysicalAds:
      0,

    fallback:
      null,
  });
}