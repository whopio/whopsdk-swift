import Foundation

public struct ChannelSupportState: Codable, Hashable, Sendable {
    public let awaitingReply: Bool
    public let customerUserId: String
    public let lastMessageBy: Nullable<ChannelSupportStateLastMessageBy>
    /// When the support conversation was resolved, as an ISO 8601 timestamp. Null while unresolved.
    public let resolvedAt: Nullable<String>
    public let status: ChannelSupportStateStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        awaitingReply: Bool,
        customerUserId: String,
        lastMessageBy: Nullable<ChannelSupportStateLastMessageBy>,
        resolvedAt: Nullable<String>,
        status: ChannelSupportStateStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.awaitingReply = awaitingReply
        self.customerUserId = customerUserId
        self.lastMessageBy = lastMessageBy
        self.resolvedAt = resolvedAt
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.awaitingReply = try container.decode(Bool.self, forKey: .awaitingReply)
        self.customerUserId = try container.decode(String.self, forKey: .customerUserId)
        self.lastMessageBy = try container.decode(Nullable<ChannelSupportStateLastMessageBy>.self, forKey: .lastMessageBy)
        self.resolvedAt = try container.decode(Nullable<String>.self, forKey: .resolvedAt)
        self.status = try container.decode(ChannelSupportStateStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.awaitingReply, forKey: .awaitingReply)
        try container.encode(self.customerUserId, forKey: .customerUserId)
        try container.encode(self.lastMessageBy, forKey: .lastMessageBy)
        try container.encode(self.resolvedAt, forKey: .resolvedAt)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case awaitingReply = "awaiting_reply"
        case customerUserId = "customer_user_id"
        case lastMessageBy = "last_message_by"
        case resolvedAt = "resolved_at"
        case status
    }
}