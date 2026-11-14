import Foundation

public struct InvoiceSend: Codable, Hashable, Sendable {
    /// The user who requested the send, when you have `company:authorized_user:read`. `null` for automatic sends, account API keys, apps, or when the caller cannot read team members. Whop employee identities are shown as Whop Team to external viewers.
    public let actor: Nullable<UserSummary>
    /// How batches are classified: manual batches use `send` when no earlier completed email history exists and `resend` otherwise. Classification happens when history is recorded. Earlier unrecorded emails are unknown. Automatic sends use `scheduled_send` for a scheduled send and `reminder` for a reminder after the due date. They use `payment_follow_up` for the payment link after a charge to the saved payment method failed or needed the customer to act.
    public let kind: InvoiceSendKind
    /// How many addresses were submitted for delivery, each separately.
    public let recipientCount: Int
    public let recipients: [String]
    /// When the worker finished submitting this batch for delivery, as an ISO 8601 timestamp. Partial batches are not recorded until a retry completes them. This does not confirm delivery to an inbox.
    public let sentAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        actor: Nullable<UserSummary>,
        kind: InvoiceSendKind,
        recipientCount: Int,
        recipients: [String],
        sentAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.actor = actor
        self.kind = kind
        self.recipientCount = recipientCount
        self.recipients = recipients
        self.sentAt = sentAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actor = try container.decode(Nullable<UserSummary>.self, forKey: .actor)
        self.kind = try container.decode(InvoiceSendKind.self, forKey: .kind)
        self.recipientCount = try container.decode(Int.self, forKey: .recipientCount)
        self.recipients = try container.decode([String].self, forKey: .recipients)
        self.sentAt = try container.decode(String.self, forKey: .sentAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.actor, forKey: .actor)
        try container.encode(self.kind, forKey: .kind)
        try container.encode(self.recipientCount, forKey: .recipientCount)
        try container.encode(self.recipients, forKey: .recipients)
        try container.encode(self.sentAt, forKey: .sentAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case actor
        case kind
        case recipientCount = "recipient_count"
        case recipients
        case sentAt = "sent_at"
    }
}