import {
  renderServiceRequestEmail,
  type ServiceEmailAction,
  type ServiceEmailFile,
  type ServiceEmailSection,
} from "./emailTemplates/serviceRequestEmail";

type NotificationRecipientType =
  | "shop"
  | "customer"
  | "admin";

interface NotificationRecipient {
  email: string;
  type:
    NotificationRecipientType;
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
    status: string;
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
    admin?: ServiceEmailSection[];
  };

  shopActions?: ServiceEmailAction[];
  customerActions?: ServiceEmailAction[];
  adminActions?: ServiceEmailAction[];

  retentionDays: number;

  adminEmail?: string | null;
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
    NotificationRecipientType;

  attempted: boolean;
  sent: boolean;

  email?: string;
  emailId?: string;
  reason?: string;
}

const DEFAULT_ADMIN_EMAIL =
  "admin@gyan.cc";

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

function getSections(
  input:
    ServiceRequestNotificationInput,

  recipientType:
    NotificationRecipientType,
): ServiceEmailSection[] {
  if (
    recipientType ===
    "shop"
  ) {
    return input.sections.shop;
  }

  if (
    recipientType ===
    "admin"
  ) {
    return (
      input.sections.admin ??
      input.sections.shop
    );
  }

  return input.sections.customer;
}

function getActions(
  input:
    ServiceRequestNotificationInput,

  recipientType:
    NotificationRecipientType,
): ServiceEmailAction[] | undefined {
  if (
    recipientType ===
    "shop"
  ) {
    return input.shopActions;
  }

  if (
    recipientType ===
    "admin"
  ) {
    return input.adminActions;
  }

  return input.customerActions;
}

async function sendEmail(
  env: Env,
  recipient:
    NotificationRecipient,
  input:
    ServiceRequestNotificationInput,
  adminEmail:
    string | null,
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

      status:
        input.request.status,

      shopName:
        input.shop.name,

      shopCode:
        input.shop.code,

      customer:
        input.customer,

      files:
        input.files,

      sections:
        getSections(
          input,
          recipient.type,
        ),

      actions:
        getActions(
          input,
          recipient.type,
        ),

      createdAt:
        input.request.createdAt,

      retentionDays:
        input.retentionDays,
    });

  const shouldAuditCopyAdmin =
    adminEmail &&
    recipient.type !==
      "admin" &&
    recipient.email !==
      adminEmail;

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

            bcc:
              shouldAuditCopyAdmin
                ? [adminEmail]
                : undefined,

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

  const adminEmail =
    normalizeEmail(
      input.adminEmail,
    ) ??
    DEFAULT_ADMIN_EMAIL;

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
        adminEmail,
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
        adminEmail,
      ),
    );
  }

  if (adminEmail) {
    deliveries.push(
      sendEmail(
        env,
        {
          email:
            adminEmail,

          type:
            "admin",
        },
        input,
        adminEmail,
      ),
    );
  }

  return Promise.all(
    deliveries,
  );
}