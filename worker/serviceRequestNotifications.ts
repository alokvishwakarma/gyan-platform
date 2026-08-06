import {
  renderServiceRequestEmail,
  type ServiceEmailAction,
  type ServiceEmailFile,
  type ServiceEmailSection,
} from "./emailTemplates/serviceRequestEmail";

interface NotificationRecipient {
  email: string;
  type:
    | "shop"
    | "customer";
}

export interface ServiceRequestNotificationInput {
  shop: {
    code: string;
    name: string;
    email?: string | null;
  };

  service: {
    code: string;
    name: string;
  };

  request: {
    requestNumber: string;
    createdAt: string;
  };

  customer: {
    name?: string | null;
    phone?: string | null;
    whatsApp?: string | null;
    email?: string | null;
  };

  files: ServiceEmailFile[];
  sections: {
  shop: ServiceEmailSection[];
  customer: ServiceEmailSection[];
};

  shopActions?: ServiceEmailAction[];
  customerActions?: ServiceEmailAction[];

  retentionDays: number;
}

interface ResendResult {
  id?: string;
  message?: string;

  error?: {
    message?: string;
  };
}

export interface NotificationDeliveryResult {
  recipient:
    | "shop"
    | "customer";

  attempted: boolean;
  sent: boolean;

  email?: string;
  emailId?: string;
  reason?: string;
}

function normalizeEmail(
  value:
    | string
    | null
    | undefined,
): string | null {
  const normalized =
    value
      ?.trim()
      .toLowerCase();

  if (
    !normalized ||
    !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(
      normalized,
    )
  ) {
    return null;
  }

  return normalized;
}

async function sendEmail(
  env: Env,
  recipient:
    NotificationRecipient,
  input:
    ServiceRequestNotificationInput,
): Promise<NotificationDeliveryResult> {
  if (!env.RESEND_API_KEY) {
    return {
      recipient:
        recipient.type,

      attempted: false,
      sent: false,

      email:
        recipient.email,

      reason:
        "RESEND_API_KEY is not configured.",
    };
  }

  const rendered =
    renderServiceRequestEmail({
      recipient:
        recipient.type,

      serviceName:
        input.service.name,

      requestNumber:
        input.request.requestNumber,

      shopName:
        input.shop.name,

      shopCode:
        input.shop.code,

      customer:
        input.customer,

      files:
        input.files,

        sections:
  recipient.type === "shop"
    ? input.sections.shop
    : input.sections.customer,

      actions:
        recipient.type ===
        "shop"
          ? input.shopActions
          : input.customerActions,

      createdAt:
        input.request.createdAt,

      retentionDays:
        input.retentionDays,
    });

  try {
    const response =
      await fetch(
        "https://api.resend.com/emails",
        {
          method: "POST",

          headers: {
            authorization:
              `Bearer ${env.RESEND_API_KEY}`,

            "content-type":
              "application/json",
          },

          body: JSON.stringify({
            from:
              "GYAN Services <admin@gyan.cc>",

            to: [
              recipient.email,
            ],

            subject:
              rendered.subject,

            html:
              rendered.html,

            text:
              rendered.text,
          }),
        },
      );

    const result =
      (await response.json()) as
        ResendResult;

    if (!response.ok) {
      return {
        recipient:
          recipient.type,

        attempted: true,
        sent: false,

        email:
          recipient.email,

        reason:
          result.message ??
          result.error?.message ??
          "The email provider rejected the message.",
      };
    }

    return {
      recipient:
        recipient.type,

      attempted: true,
      sent: true,

      email:
        recipient.email,

      emailId:
        result.id,
    };
  } catch (error) {
    return {
      recipient:
        recipient.type,

      attempted: true,
      sent: false,

      email:
        recipient.email,

      reason:
        error instanceof Error
          ? error.message
          : "Unexpected notification error.",
    };
  }
}

export async function sendServiceRequestNotifications(
  env: Env,
  input:
    ServiceRequestNotificationInput,
): Promise<
  NotificationDeliveryResult[]
> {
  const deliveries:
    Promise<NotificationDeliveryResult>[] =
      [];

  const shopEmail =
    normalizeEmail(
      input.shop.email,
    );

  const customerEmail =
    normalizeEmail(
      input.customer.email,
    );

  if (shopEmail) {
    deliveries.push(
      sendEmail(
        env,
        {
          email:
            shopEmail,

          type:
            "shop",
        },
        input,
      ),
    );
  }

  if (customerEmail) {
    deliveries.push(
      sendEmail(
        env,
        {
          email:
            customerEmail,

          type:
            "customer",
        },
        input,
      ),
    );
  }

  if (
    deliveries.length === 0
  ) {
    return [];
  }

  return Promise.all(
    deliveries,
  );
}