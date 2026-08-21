export type EducationCountry =
  | "US"
  | "IN";

export interface EducationProgram {
  code: string;
  name: string;
  enabled: boolean;
  custom: boolean;
  sortOrder: number;
}

export interface EducationCountryConfig {
  country: EducationCountry;
  preK12Enabled: boolean;
  programs: EducationProgram[];
}

interface EducationConfigResponse {
  config?: EducationCountryConfig;
  error?: string;
}

const FALLBACK:
  Record<
    EducationCountry,
    EducationCountryConfig
  > = {
  US: {
    country: "US",
    preK12Enabled: true,
    programs: [
      {
        code: "SAT",
        name: "SAT",
        enabled: true,
        custom: false,
        sortOrder: 10,
      },
      {
        code: "OLSAT",
        name: "OLSAT",
        enabled: true,
        custom: false,
        sortOrder: 20,
      },
      {
        code: "MATH_OLYMPIAD",
        name: "Math Olympiad",
        enabled: true,
        custom: false,
        sortOrder: 30,
      },
    ],
  },

  IN: {
    country: "IN",
    preK12Enabled: true,
    programs: [
      {
        code: "MATH_OLYMPIAD",
        name: "Math Olympiad",
        enabled: true,
        custom: false,
        sortOrder: 30,
      },
      {
        code: "JEE",
        name: "JEE / IIT",
        enabled: true,
        custom: false,
        sortOrder: 40,
      },
      {
        code: "NEET",
        name: "NEET",
        enabled: true,
        custom: false,
        sortOrder: 50,
      },
    ],
  },
};

function cloneFallback(
  country:
    EducationCountry,
): EducationCountryConfig {
  const value =
    FALLBACK[country];

  return {
    ...value,

    programs:
      value.programs.map(
        (program) => ({
          ...program,
        }),
      ),
  };
}

export async function loadPublicEducationConfig(
  country:
    EducationCountry,
): Promise<EducationCountryConfig> {
  try {
    const response =
      await fetch(
        `/api/education/config?country=${country}`,
        {
          credentials:
            "same-origin",
        },
      );

    const result =
      await response.json() as
        EducationConfigResponse;

    if (
      !response.ok ||
      !result.config
    ) {
      throw new Error(
        result.error ??
          "Education configuration unavailable.",
      );
    }

    return result.config;
  } catch {
    // Public Education should remain usable
    // even if the Worker is temporarily down.
    return cloneFallback(
      country,
    );
  }
}

export async function loadAdminEducationConfig(
  country:
    EducationCountry,
): Promise<EducationCountryConfig> {
  const response =
    await fetch(
      `/api/admin/education/config?country=${country}`,
      {
        credentials:
          "include",
      },
    );

  const result =
    await response.json() as
      EducationConfigResponse;

  if (
    !response.ok ||
    !result.config
  ) {
    throw new Error(
      result.error ??
        "Education configuration could not be loaded.",
    );
  }

  return result.config;
}

export async function saveAdminEducationConfig(
  config:
    EducationCountryConfig,
): Promise<EducationCountryConfig> {
  const response =
    await fetch(
      `/api/admin/education/config?country=${config.country}`,
      {
        method:
          "PUT",

        credentials:
          "include",

        headers: {
          "content-type":
            "application/json",
        },

        body:
          JSON.stringify({
            preK12Enabled:
              config.preK12Enabled,

            programs:
              config.programs,
          }),
      },
    );

  const result =
    await response.json() as
      EducationConfigResponse & {
        message?: string;
      };

  if (
    !response.ok ||
    !result.config
  ) {
    throw new Error(
      result.error ??
        "Education configuration could not be saved.",
    );
  }

  return result.config;
}

export function makeCustomEducationProgram(
  name: string,
  sortOrder: number,
): EducationProgram {
  const clean =
    name.trim();

  const suffix =
    clean
      .toUpperCase()
      .replace(
        /[^A-Z0-9]+/g,
        "_",
      )
      .replace(
        /^_+|_+$/g,
        "",
      )
      .slice(
        0,
        32,
      );

  return {
    code:
      `CUSTOM_${
        suffix ||
        Date.now()
      }`,

    name:
      clean,

    enabled:
      true,

    custom:
      true,

    sortOrder,
  };
}
