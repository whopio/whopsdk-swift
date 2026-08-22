import Foundation

extension Requests {
    public struct CreateCardsRequest: Codable, Hashable, Sendable {
        /// The owning account ID (a biz_ identifier). Provide this or user_id.
        public let accountId: String?
        /// The account member (a user_ identifier) to assign the card to. Required for business card issuing accounts.
        public let assignedUserId: String?
        /// A display name for the card.
        public let name: String?
        /// Spending limit amount, in dollars.
        public let spendLimit: Double?
        /// The window the spend limit applies to.
        public let spendLimitFrequency: CreateCardsRequestSpendLimitFrequency?
        /// Per-transaction limit amount, in dollars.
        public let transactionLimit: Double?
        /// The owning user ID (a user_ identifier). Provide this or account_id.
        public let userId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            assignedUserId: String? = nil,
            name: String? = nil,
            spendLimit: Double? = nil,
            spendLimitFrequency: CreateCardsRequestSpendLimitFrequency? = nil,
            transactionLimit: Double? = nil,
            userId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.assignedUserId = assignedUserId
            self.name = name
            self.spendLimit = spendLimit
            self.spendLimitFrequency = spendLimitFrequency
            self.transactionLimit = transactionLimit
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.assignedUserId = try container.decodeIfPresent(String.self, forKey: .assignedUserId)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.spendLimit = try container.decodeIfPresent(Double.self, forKey: .spendLimit)
            self.spendLimitFrequency = try container.decodeIfPresent(CreateCardsRequestSpendLimitFrequency.self, forKey: .spendLimitFrequency)
            self.transactionLimit = try container.decodeIfPresent(Double.self, forKey: .transactionLimit)
            self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.assignedUserId, forKey: .assignedUserId)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.spendLimit, forKey: .spendLimit)
            try container.encodeIfPresent(self.spendLimitFrequency, forKey: .spendLimitFrequency)
            try container.encodeIfPresent(self.transactionLimit, forKey: .transactionLimit)
            try container.encodeIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case assignedUserId = "assigned_user_id"
            case name
            case spendLimit = "spend_limit"
            case spendLimitFrequency = "spend_limit_frequency"
            case transactionLimit = "transaction_limit"
            case userId = "user_id"
        }
    }
}