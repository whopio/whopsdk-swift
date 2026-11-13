import Foundation

/// A messaging channel that can be a one-on-one DM, group chat, company support conversation, or platform-level direct message.
public struct SupportChannelListItem: Codable, Hashable, Sendable {
    /// The unique identifier of the account associated with this channel. Null if this is not a support or account-scoped conversation.
    public let accountId: Nullable<String>
    /// The unique identifier of the account associated with this channel. Null if this is not a support or account-scoped conversation.
    public let companyId: Nullable<String>
    /// A custom display name assigned to this channel by the user. Null if no custom name has been set.
    public let customName: Nullable<String>
    /// The customer who initiated this support conversation. Null if this is not a support chat.
    public let customerUser: Nullable<SupportChannelListItemCustomerUser>
    /// The unique identifier for the entity
    public let id: String
    /// The most recent message in this channel. Null if no messages have been sent, or when listing support channels without `include_last_message`.
    public let lastMessage: Nullable<SupportChannelListItemLastMessage>
    /// The timestamp when the most recent message was sent in this channel. Null if no messages have been sent.
    public let lastMessageAt: Nullable<Date>
    /// Whether the customer sent the latest message and the linked support ticket is unresolved. Null if not a support chat.
    public let needsReply: Nullable<Bool>
    /// Whether the authenticated user has joined this channel as a participant. Null when the caller is not a user, or when listing support channels without `include_participated`.
    public let participated: Nullable<Bool>
    /// The timestamp when the linked support ticket was marked as resolved. Null if unresolved or not a support chat.
    public let resolvedAt: Nullable<Date>
    /// Whether this channel has a message from someone else that the authenticated user has not viewed yet. Null when the caller is not a user, or when listing support channels without `include_last_message`.
    public let unread: Nullable<Bool>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        companyId: Nullable<String>,
        customName: Nullable<String>,
        customerUser: Nullable<SupportChannelListItemCustomerUser>,
        id: String,
        lastMessage: Nullable<SupportChannelListItemLastMessage>,
        lastMessageAt: Nullable<Date>,
        needsReply: Nullable<Bool>,
        participated: Nullable<Bool>,
        resolvedAt: Nullable<Date>,
        unread: Nullable<Bool>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.companyId = companyId
        self.customName = customName
        self.customerUser = customerUser
        self.id = id
        self.lastMessage = lastMessage
        self.lastMessageAt = lastMessageAt
        self.needsReply = needsReply
        self.participated = participated
        self.resolvedAt = resolvedAt
        self.unread = unread
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.companyId = try container.decode(Nullable<String>.self, forKey: .companyId)
        self.customName = try container.decode(Nullable<String>.self, forKey: .customName)
        self.customerUser = try container.decode(Nullable<SupportChannelListItemCustomerUser>.self, forKey: .customerUser)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastMessage = try container.decode(Nullable<SupportChannelListItemLastMessage>.self, forKey: .lastMessage)
        self.lastMessageAt = try container.decode(Nullable<Date>.self, forKey: .lastMessageAt)
        self.needsReply = try container.decode(Nullable<Bool>.self, forKey: .needsReply)
        self.participated = try container.decode(Nullable<Bool>.self, forKey: .participated)
        self.resolvedAt = try container.decode(Nullable<Date>.self, forKey: .resolvedAt)
        self.unread = try container.decode(Nullable<Bool>.self, forKey: .unread)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.companyId, forKey: .companyId)
        try container.encode(self.customName, forKey: .customName)
        try container.encode(self.customerUser, forKey: .customerUser)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastMessage, forKey: .lastMessage)
        try container.encode(self.lastMessageAt, forKey: .lastMessageAt)
        try container.encode(self.needsReply, forKey: .needsReply)
        try container.encode(self.participated, forKey: .participated)
        try container.encode(self.resolvedAt, forKey: .resolvedAt)
        try container.encode(self.unread, forKey: .unread)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case companyId = "company_id"
        case customName = "custom_name"
        case customerUser = "customer_user"
        case id
        case lastMessage = "last_message"
        case lastMessageAt = "last_message_at"
        case needsReply = "needs_reply"
        case participated
        case resolvedAt = "resolved_at"
        case unread
    }
}