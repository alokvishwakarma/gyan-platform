import {
  useEffect,
  useState,
} from "react";


type AccessRow = {
  id:
    number;

  slug:
    string;

  gyan_name:
    string;

  access_code:
    string;

  duration_months:
    number;

  status:
    string;

  email:
    string | null;

  generated_at:
    string;

  printed_at:
    string | null;

  claimed_at:
    string | null;

  expires_at:
    string | null;
};


export default function CalendarAccessAdminPage({
  onBack,
}: {
  onBack:
    () => void;
}) {
  const [
    rows,
    setRows,
  ] =
    useState<
      AccessRow[]
    >(
      [],
    );

  const [
    loading,
    setLoading,
  ] =
    useState(
      true,
    );

  useEffect(() => {
    void fetch(
      "/api/calendar-access",
    )
      .then(
        async (
          response,
        ) => {
          if (
            !response.ok
          ) {
            throw new Error(
              "Could not load calendar codes.",
            );
          }

          return response.json();
        },
      )
      .then(
        (
          body: {
            records:
              AccessRow[];
          },
        ) => {
          setRows(
            body.records,
          );
        },
      )
      .finally(() => {
        setLoading(
          false,
        );
      });
  }, []);

  return (
    <section className="calendar-access-admin">
      <header>
        <button
          type="button"
          onClick={
            onBack
          }
        >
          ←
        </button>

        <h1>
          Calendar QR Codes
        </h1>
      </header>

      {
        loading
          ? (
              <p>
                Loading…
              </p>
            )
          : (
              <div className="calendar-access-admin__table-wrap">
                <table>
                  <thead>
                    <tr>
                      <th>
                        URL
                      </th>

                      <th>
                        GYAN Name
                      </th>

                      <th>
                        Status
                      </th>

                      <th>
                        Duration
                      </th>

                      <th>
                        Access Code
                      </th>

                      <th>
                        Email
                      </th>

                      <th>
                        Printed
                      </th>
                    </tr>
                  </thead>

                  <tbody>
                    {
                      rows.map(
                        (
                          row,
                        ) => (
                          <tr
                            key={
                              row.id
                            }
                          >
                            <td>
                              gyan.cc/
                              {
                                row.slug
                                  .toLowerCase()
                              }
                            </td>

                            <td>
                              {
                                row.gyan_name
                              }
                            </td>

                            <td>
                              {
                                row.status
                              }
                            </td>

                            <td>
                              {
                                row.duration_months
                              }
                              {" mo"}
                            </td>

                            <td>
                              {
                                row.access_code
                              }
                            </td>

                            <td>
                              {
                                row.email ??
                                "—"
                              }
                            </td>

                            <td>
                              {
                                row.printed_at ??
                                "—"
                              }
                            </td>
                          </tr>
                        ),
                      )
                    }
                  </tbody>
                </table>
              </div>
            )
      }
    </section>
  );
}
