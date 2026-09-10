import {
  useState,
} from "react";

import "./AdminAddGemsPage.css";


interface AdminAddGemsPageProps {
  onBack:
    () => void;
}


interface AddGemsResponse {
  added?:
    number;

  balance?:
    number;

  account?: {
    code:
      string;

    displayName:
      string;
  };

  error?:
    string;
}


export default function AdminAddGemsPage({
  onBack,
}: AdminAddGemsPageProps) {
  const [
    recipient,
    setRecipient,
  ] =
    useState("");

  const [
    amount,
    setAmount,
  ] =
    useState("");

  const [
    busy,
    setBusy,
  ] =
    useState(false);

  const [
    message,
    setMessage,
  ] =
    useState("");

  const [
    success,
    setSuccess,
  ] =
    useState(false);


  const parsedAmount =
    Number(
      amount,
    );

  const validAmount =
    Number.isInteger(
      parsedAmount,
    ) &&
    parsedAmount >=
      1 &&
    parsedAmount <=
      9999;

  const canSubmit =
    recipient.trim().length >
      0 &&
    validAmount &&
    !busy;


  async function addGems():
    Promise<void> {
    if (!canSubmit) {
      return;
    }

    setBusy(
      true,
    );

    setMessage(
      "",
    );

    setSuccess(
      false,
    );

    try {
      const response =
        await fetch(
          "/api/admin/gems/add",
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
                recipient:
                  recipient.trim(),

                amount:
                  parsedAmount,
              }),
          },
        );

      const body =
        await response.json() as
          AddGemsResponse;

      if (
        !response.ok ||
        !body.account
      ) {
        throw new Error(
          body.error ??
          "Gems could not be added.",
        );
      }

      setSuccess(
        true,
      );

      setMessage(
        `✓ Added ${body.added ?? parsedAmount} Gems to ${body.account.displayName} [${body.account.code}]. New balance: ${body.balance ?? "—"} Gems.`,
      );

      setAmount(
        "",
      );
    } catch (
      caught
    ) {
      setSuccess(
        false,
      );

      setMessage(
        caught instanceof
          Error
          ? caught.message
          : "Gems could not be added.",
      );
    } finally {
      setBusy(
        false,
      );
    }
  }


  return (
    <main className="admin-add-gems">
      <header className="admin-add-gems__header">
        <button
          type="button"
          aria-label="Back"
          onClick={
            onBack
          }
        >
          ←
        </button>

        <div>
          <strong>
            Add Gems
          </strong>

          <small>
            Admin · credit a GYAN account
          </small>
        </div>
      </header>

      <section className="admin-add-gems__card">
        <label>
          <span>
            GYAN code or name
          </span>

          <input
            autoFocus
            type="text"
            autoComplete="off"
            spellCheck={
              false
            }
            placeholder="ABCD or morningSwan1234"
            value={
              recipient
            }
            onChange={(
              event,
            ) => {
              setRecipient(
                event.target.value,
              );

              setMessage(
                "",
              );
            }}
          />

          <small>
            Enter the GYAN code or exact GYAN display name.
          </small>
        </label>

        <label>
          <span>
            Gems to add
          </span>

          <input
            type="number"
            inputMode="numeric"
            min={
              1
            }
            max={
              9999
            }
            step={
              1
            }
            placeholder="1–9999"
            value={
              amount
            }
            onChange={(
              event,
            ) => {
              setAmount(
                event.target.value,
              );

              setMessage(
                "",
              );
            }}
            onKeyDown={(
              event,
            ) => {
              if (
                event.key ===
                  "Enter" &&
                canSubmit
              ) {
                event.preventDefault();

                void addGems();
              }
            }}
          />

          <small>
            Maximum per grant: 9,999 Gems.
          </small>
        </label>

        {
          amount !==
            "" &&
          !validAmount && (
            <div className="admin-add-gems__error">
              Enter a whole number from 1 to 9,999.
            </div>
          )
        }

        {
          message && (
            <div
              className={
                success
                  ? "admin-add-gems__message admin-add-gems__message--success"
                  : "admin-add-gems__message admin-add-gems__message--error"
              }
              role={
                success
                  ? "status"
                  : "alert"
              }
            >
              {
                message
              }
            </div>
          )
        }

        <button
          type="button"
          className="admin-add-gems__submit"
          disabled={
            !canSubmit
          }
          onClick={() =>
            void addGems()
          }
        >
          {
            busy
              ? "Adding…"
              : "Add Gems"
          }
        </button>
      </section>
    </main>
  );
}
