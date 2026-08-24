import Foundation

/// A messaging channel that can be a one-on-one DM, group chat, company support conversation, or platform-level direct message.
public struct SupportChannel: Codable, Hashable, Sendable {
    /// The unique identifier of the company associated with this channel. Null if this is not a support or company-scoped conversation.
    public let companyId: Nullable<String>
    /// A custom display name assigned to this channel by the user. Null if no custom name has been set.
    public let customName: Nullable<String>
    /// The customer who initiated this support conversation. Null if this is not a support chat.
    public let customerUser: Nullable<SupportChannelCustomerUser>
    /// The unique identifier for the entity
    public let id: String
    /// The timestamp when the most recent message was sent in this channel. Null if no messages have been sent.
    public let lastMessageAt: Nullable<Date>
    /// The timestamp when the linked support ticket was marked as resolved. Null if unresolved or not a support chat.
    public let resolvedAt: Nullable<Date>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        companyId: Nullable<String>,
        customName: Nullable<String>,
        customerUser: Nullable<SupportChannelCustomerUser>,
        id: String,
        lastMessageAt: Nullable<Date>,
        resolvedAt: Nullable<Date>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.companyId = companyId
        self.customName = customName
        self.customerUser = customerUser
        self.id = id
        self.lastMessageAt = lastMessageAt
        self.resolvedAt = resolvedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.companyId = try container.decode(Nullable<String>.self, forKey: .companyId)
        self.customName = try container.decode(Nullable<String>.self, forKey: .customName)
        self.customerUser = try container.decode(Nullable<SupportChannelCustomerUser>.self, forKey: .customerUser)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastMessageAt = try container.decode(Nullable<Date>.self, forKey: .lastMessageAt)
        self.resolvedAt = try container.decode(Nullable<Date>.self, forKey: .resolvedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.companyId, forKey: .companyId)
        try container.encode(self.customName, forKey: .customName)
        try container.encode(self.customerUser, forKey: .customerUser)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastMessageAt, forKey: .lastMessageAt)
        try container.encode(self.resolvedAt, forKey: .resolvedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case companyId = "company_id"
        case customName = "custom_name"
        case customerUser = "customer_user"
        case id
        case lastMessageAt = "last_message_at"
        case resolvedAt = "resolved_at"
    }
}