import Foundation

extension Requests {
    public struct CreateChannelsRequest: Codable, Hashable, Sendable {
        /// Owning account ID, prefixed `biz_`. Accepted for all channel kinds. Required for community and support channels unless supplied by the credential's account context.
        public let accountId: String?
        /// Customer ID, prefixed `user_`. Support channels only; requires support management permission. Omit to open your own support conversation.
        public let customerUserId: String?
        /// Channel icon as a file reference, for community channels and private channels with two or more participant IDs. Image files only. Group icons can be up to 5 MB. For community channels it sets the experience logo. Used only when a channel is created.
        public let icon: CreateChannelsRequestIcon?
        /// Channel kind. `private` is a one-to-one or group conversation, `community` creates a Chat experience on the account, and `support` opens a conversation between the account and a customer.
        public let kind: CreateChannelsRequestKind
        /// Channel display name, accepted for all channel kinds. Used only when a channel is created. For community channels, names the new Chat experience; defaults to the Chat app's name.
        public let name: String?
        /// Whether app notifications are on for any channel kind. Webhooks fire either way. Defaults to `true`. Used only when a channel is created; change an existing channel with `PATCH /channels/:id`.
        public let notificationsEnabled: Bool?
        /// Other participant IDs, prefixed `user_`, excluding the sender. Required for private channels and accepted only for them. One ID creates a one-to-one conversation; more create a group.
        public let participantUserIds: [String]?
        /// Product ID, prefixed `prod_`, to attach the new community channel to. Accepted only for community channels. Must belong to the owning account and requires the `experience:attach` permission on it. Omit to leave the channel unattached.
        public let productId: String?
        /// Sender ID, prefixed `user_`. Private channels only. Required for account API keys; omit when authenticating as a user. Requires channel management permission on the account.
        public let senderUserId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            customerUserId: String? = nil,
            icon: CreateChannelsRequestIcon? = nil,
            kind: CreateChannelsRequestKind,
            name: String? = nil,
            notificationsEnabled: Bool? = nil,
            participantUserIds: [String]? = nil,
            productId: String? = nil,
            senderUserId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.customerUserId = customerUserId
            self.icon = icon
            self.kind = kind
            self.name = name
            self.notificationsEnabled = notificationsEnabled
            self.participantUserIds = participantUserIds
            self.productId = productId
            self.senderUserId = senderUserId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.customerUserId = try container.decodeIfPresent(String.self, forKey: .customerUserId)
            self.icon = try container.decodeIfPresent(CreateChannelsRequestIcon.self, forKey: .icon)
            self.kind = try container.decode(CreateChannelsRequestKind.self, forKey: .kind)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.notificationsEnabled = try container.decodeIfPresent(Bool.self, forKey: .notificationsEnabled)
            self.participantUserIds = try container.decodeIfPresent([String].self, forKey: .participantUserIds)
            self.productId = try container.decodeIfPresent(String.self, forKey: .productId)
            self.senderUserId = try container.decodeIfPresent(String.self, forKey: .senderUserId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.customerUserId, forKey: .customerUserId)
            try container.encodeIfPresent(self.icon, forKey: .icon)
            try container.encode(self.kind, forKey: .kind)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.notificationsEnabled, forKey: .notificationsEnabled)
            try container.encodeIfPresent(self.participantUserIds, forKey: .participantUserIds)
            try container.encodeIfPresent(self.productId, forKey: .productId)
            try container.encodeIfPresent(self.senderUserId, forKey: .senderUserId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case customerUserId = "customer_user_id"
            case icon
            case kind
            case name
            case notificationsEnabled = "notifications_enabled"
            case participantUserIds = "participant_user_ids"
            case productId = "product_id"
            case senderUserId = "sender_user_id"
        }
    }
}