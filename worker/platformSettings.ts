import {
  getAdminSession,
} from "./adminAuth";


type Env =
  Parameters<
    typeof getAdminSession
  >[1];


type Mode =
  | "HIDDEN"
  | "EVERYONE"
  | "ID_EVEN"
  | "ID_ODD";


const HEADER_GEMS_KEY =
  "HEADER_GEMS_VISIBILITY";

const WELCOME_GEMS_KEY =
  "WELCOME_GEMS";

const DEFAULT_WELCOME_GEMS =
  100;

const MIN_WELCOME_GEMS =
  0;

const MAX_WELCOME_GEMS =
  1000;


function json(
  body:
    unknown,
  status =
    200,
) {
  return new Response(
    JSON.stringify(
      body,
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


function mode(
  value:
    unknown,
): Mode | null {
  const normalized =
    typeof value ===
      "string"
      ? value
          .trim()
          .toUpperCase()
      : "";

  return [
    "HIDDEN",
    "EVERYONE",
    "ID_EVEN",
    "ID_ODD",
  ].includes(
    normalized,
  )
    ? normalized as Mode
    : null;
}


function welcomeGemsValue(
  value:
    unknown,
): number | null {
  const numeric =
    typeof value ===
      "number"
      ? value
      : typeof value ===
          "string" &&
        value.trim() !==
          ""
        ? Number(
            value,
          )
        : Number.NaN;

  if (
    !Number.isFinite(
      numeric,
    )
  ) {
    return null;
  }

  const rounded =
    Math.round(
      numeric,
    );

  if (
    rounded <
      MIN_WELCOME_GEMS ||
    rounded >
      MAX_WELCOME_GEMS
  ) {
    return null;
  }

  return rounded;
}


async function currentHeaderGemsVisibility(
  env:
    Env,
): Promise<Mode> {
  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT setting_value
        FROM platform_settings
        WHERE setting_key = ?
        LIMIT 1
        `,
      )
      .bind(
        HEADER_GEMS_KEY,
      )
      .first<{
        setting_value:
          string;
      }>();

  return (
    mode(
      row?.setting_value,
    ) ??
    "EVERYONE"
  );
}


/*
 * Public helper for account creation.
 *
 * Read this ONLY when a new GYAN account is being created.
 * Existing accounts should never receive another Welcome Gem grant
 * merely because this setting changes.
 */
export async function getWelcomeGems(
  env:
    Env,
): Promise<number> {
  const row =
    await env.gyan_registry
      .prepare(
        `
        SELECT setting_value
        FROM platform_settings
        WHERE setting_key = ?
        LIMIT 1
        `,
      )
      .bind(
        WELCOME_GEMS_KEY,
      )
      .first<{
        setting_value:
          string;
      }>();

  return (
    welcomeGemsValue(
      row?.setting_value,
    ) ??
    DEFAULT_WELCOME_GEMS
  );
}


export async function handlePlatformSettingsRoute(
  request:
    Request,
  env:
    Env,
  url:
    URL,
): Promise<Response | null> {
  /*
   * Public settings.
   *
   * Welcome Gems deliberately does not need to be returned here yet.
   * The public page only needs Header Gem visibility.
   */
  if (
    url.pathname ===
      "/api/platform-settings/public" &&
    request.method ===
      "GET"
  ) {
    return json({
      headerGemsVisibility:
        await currentHeaderGemsVisibility(
          env,
        ),
    });
  }


  if (
    url.pathname !==
      "/api/admin/platform-settings"
  ) {
    return null;
  }


  if (
    !await getAdminSession(
      request,
      env,
    )
  ) {
    return json(
      {
        error:
          "Administrator authentication is required.",
      },
      401,
    );
  }


  if (
    request.method ===
      "GET"
  ) {
    const [
      headerGemsVisibility,
      welcomeGems,
    ] =
      await Promise.all([
        currentHeaderGemsVisibility(
          env,
        ),

        getWelcomeGems(
          env,
        ),
      ]);

    return json({
      headerGemsVisibility,
      welcomeGems,
    });
  }


  if (
    request.method ===
      "PATCH"
  ) {
    let body: {
      headerGemsVisibility?:
        unknown;

      welcomeGems?:
        unknown;
    };

    try {
      body =
        await request.json() as
          typeof body;
    } catch {
      return json(
        {
          error:
            "Invalid request body.",
        },
        400,
      );
    }


    const headerVisibility =
      mode(
        body.headerGemsVisibility,
      );

    if (
      !headerVisibility
    ) {
      return json(
        {
          error:
            "Invalid Header Gem Balance visibility.",
        },
        400,
      );
    }


    const welcomeGems =
      welcomeGemsValue(
        body.welcomeGems,
      );

    if (
      welcomeGems ===
        null
    ) {
      return json(
        {
          error:
            `Welcome Gems must be between ${MIN_WELCOME_GEMS} and ${MAX_WELCOME_GEMS}.`,
        },
        400,
      );
    }


    await env.gyan_registry
      .batch([
        env.gyan_registry
          .prepare(
            `
            INSERT INTO platform_settings (
              setting_key,
              setting_value,
              updated_at
            )
            VALUES (?, ?, CURRENT_TIMESTAMP)

            ON CONFLICT(setting_key)
            DO UPDATE SET
              setting_value =
                excluded.setting_value,
              updated_at =
                CURRENT_TIMESTAMP
            `,
          )
          .bind(
            HEADER_GEMS_KEY,
            headerVisibility,
          ),

        env.gyan_registry
          .prepare(
            `
            INSERT INTO platform_settings (
              setting_key,
              setting_value,
              updated_at
            )
            VALUES (?, ?, CURRENT_TIMESTAMP)

            ON CONFLICT(setting_key)
            DO UPDATE SET
              setting_value =
                excluded.setting_value,
              updated_at =
                CURRENT_TIMESTAMP
            `,
          )
          .bind(
            WELCOME_GEMS_KEY,
            String(
              welcomeGems,
            ),
          ),
      ]);


    return json({
      saved:
        true,

      headerGemsVisibility:
        headerVisibility,

      welcomeGems,
    });
  }


  return json(
    {
      error:
        "Method not allowed.",
    },
    405,
  );
}