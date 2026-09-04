export type EducationCountryCode =
  string;


export type EducationCatalogCountry = {
  code: EducationCountryCode;
  name: string;
  flag: string;
  sortOrder: number;
};


export type EducationCatalogProgram = {
  code: string;
  name: string;
  canonicalName: string;
  gradeCode: string;
  countryCode: EducationCountryCode;
  experienceType: string;

  showQuestions: boolean;
  showMockTests: boolean;
  showReports: boolean;
  showDemo: boolean;
  showClasses: boolean;

  durationMinutes: number | null;
  questionCount: number | null;
  correctMarks: number | null;
  incorrectMarks: number | null;
  sortOrder: number;
};


export type EducationCatalog = {
  selectedCountry:
    EducationCountryCode;

  countries:
    EducationCatalogCountry[];

  programs:
    EducationCatalogProgram[];
};


export async function loadEducationCatalog(
  countryCode?: string,
): Promise<EducationCatalog> {
  const normalized =
    countryCode
      ?.trim()
      .toUpperCase();

  const response =
    await fetch(
      `/api/education/catalog${
        normalized
          ? `?country=${encodeURIComponent(
              normalized,
            )}`
          : ""
      }`,
      {
        credentials:
          "include",
        cache:
          "no-store",
      },
    );

  const body =
    await response.json() as
      Partial<
        EducationCatalog
      > & {
        error?: string;
      };

  if (
    !response.ok
  ) {
    throw new Error(
      body.error ??
      "Education catalog could not be loaded.",
    );
  }

  return {
    selectedCountry:
      body.selectedCountry ??
      normalized ??
      "US",

    countries:
      Array.isArray(
        body.countries,
      )
        ? body.countries
        : [],

    programs:
      Array.isArray(
        body.programs,
      )
        ? body.programs
        : [],
  };
}
