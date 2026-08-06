import type {
  ChangeEvent,
  Dispatch,
  SetStateAction,
} from "react";

import type { RequestField } from "../types/shop";

interface RequestFieldRendererProps {
  field: RequestField;
  value: string | number;
  error?: string;
  onValueChange: (
    fieldId: string,
    value: string | number,
  ) => void;
  setFiles: Dispatch<
    SetStateAction<Record<string, File[]>>
  >;
}

export function RequestFieldRenderer({
  field,
  value,
  error,
  onValueChange,
  setFiles,
}: RequestFieldRendererProps) {
  function handleFileChange(
    event: ChangeEvent<HTMLInputElement>,
  ) {
    const selectedFiles = Array.from(
      event.target.files ?? [],
    );

    setFiles((currentFiles) => ({
      ...currentFiles,
      [field.id]: selectedFiles,
    }));
  }

  return (
    <div className="request-field">
      <label htmlFor={field.id}>
        {field.label}

        {field.required && (
          <span className="request-field__required">
            {" "}
            *
          </span>
        )}
      </label>

      {field.type === "TEXT" && (
        <input
          id={field.id}
          type="text"
          value={String(value ?? "")}
          placeholder={field.placeholder}
          onChange={(event) =>
            onValueChange(
              field.id,
              event.target.value,
            )
          }
        />
      )}

      {field.type === "TEXTAREA" && (
        <textarea
          id={field.id}
          rows={4}
          value={String(value ?? "")}
          placeholder={field.placeholder}
          onChange={(event) =>
            onValueChange(
              field.id,
              event.target.value,
            )
          }
        />
      )}

      {field.type === "NUMBER" && (
        <input
          id={field.id}
          type="number"
          min={field.min}
          max={field.max}
          value={value}
          onChange={(event) =>
            onValueChange(
              field.id,
              Number(event.target.value),
            )
          }
        />
      )}

      {field.type === "SELECT" && (
        <select
          id={field.id}
          value={String(value ?? "")}
          onChange={(event) =>
            onValueChange(
              field.id,
              event.target.value,
            )
          }
        >
          <option value="">
            Select an option
          </option>

          {field.options?.map((option) => (
            <option
              key={option.value}
              value={option.value}
            >
              {option.label}
            </option>
          ))}
        </select>
      )}

      {field.type === "DATE" && (
        <input
          id={field.id}
          type="date"
          value={String(value ?? "")}
          onChange={(event) =>
            onValueChange(
              field.id,
              event.target.value,
            )
          }
        />
      )}

      {field.type === "TIME" && (
        <input
          id={field.id}
          type="time"
          value={String(value ?? "")}
          onChange={(event) =>
            onValueChange(
              field.id,
              event.target.value,
            )
          }
        />
      )}

      {field.type === "FILE" && (
        <input
          id={field.id}
          type="file"
          accept={field.accept}
          multiple={field.multiple}
          onChange={handleFileChange}
        />
      )}

      {field.helperText && (
        <p className="request-field__helper">
          {field.helperText}
        </p>
      )}

      {error && (
        <p className="request-field__error">
          {error}
        </p>
      )}
    </div>
  );
}