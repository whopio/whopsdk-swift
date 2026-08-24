import Foundation

extension Requests {
    public struct UpdateCardsRequest: Codable, Hashable, Sendable {
        /// The owning account ID (a biz_ identifier). Provide this or user_id.
        public let accountId: String?
        /// New billing address. Requires line1, city, region, postal_code, and country_code. On an invited card, passing billing alone (as the invited user) completes onboarding and starts card provisioning.
        public let billing: UpdateCardsRequestBilling?
        /// Pass `true` to permanently cancel the card. A canceled card cannot be uncanceled. Cannot be combined with other fields.
        public let canceled: Bool?
        /// Pass `true` to freeze the card, `false` to unfreeze it. The assigned cardholder may freeze their own card without the payout:account:update scope.
        public let frozen: Bool?
        /// A display name for the card.
        public let name: String?
        /// New 4-digit PIN. Can only be set on a card assigned to the acting user, who may set it without the payout:account:update scope.
        public let pin: String?
        /// Pass `true` to remove the spending limit (make the card unlimited).
        public let removeLimit: Bool?
        /// Spending limit amount, in dollars.
        public let spendLimit: Double?
        /// The window the spend limit applies to.
        public let spendLimitFrequency: UpdateCardsRequestSpendLimitFrequency?
        /// Per-transaction limit amount, in dollars.
        public let transactionLimit: Double?
        /// The owning user ID (a user_ identifier). Provide this or account_id.
        public let userId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            billing: UpdateCardsRequestBilling? = nil,
            canceled: Bool? = nil,
            frozen: Bool? = nil,
            name: String? = nil,
            pin: String? = nil,
            removeLimit: Bool? = nil,
            spendLimit: Double? = nil,
            spendLimitFrequency: UpdateCardsRequestSpendLimitFrequency? = nil,
            transactionLimit: Double? = nil,
            userId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.billing = billing
            self.canceled = canceled
            self.frozen = frozen
            self.name = name
            self.pin = pin
            self.removeLimit = removeLimit
            self.spendLimit = spendLimit
            self.spendLimitFrequency = spendLimitFrequency
            self.transactionLimit = transactionLimit
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.billing = try container.decodeIfPresent(UpdateCardsRequestBilling.self, forKey: .billing)
            self.canceled = try container.decodeIfPresent(Bool.self, forKey: .canceled)
            self.frozen = try container.decodeIfPresent(Bool.self, forKey: .frozen)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.pin = try container.decodeIfPresent(String.self, forKey: .pin)
            self.removeLimit = try container.decodeIfPresent(Bool.self, forKey: .removeLimit)
            self.spendLimit = try container.decodeIfPresent(Double.self, forKey: .spendLimit)
            self.spendLimitFrequency = try container.decodeIfPresent(UpdateCardsRequestSpendLimitFrequency.self, forKey: .spendLimitFrequency)
            self.transactionLimit = try container.decodeIfPresent(Double.self, forKey: .transactionLimit)
            self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.billing, forKey: .billing)
            try container.encodeIfPresent(self.canceled, forKey: .canceled)
            try container.encodeIfPresent(self.frozen, forKey: .frozen)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.pin, forKey: .pin)
            try container.encodeIfPresent(self.removeLimit, forKey: .removeLimit)
            try container.encodeIfPresent(self.spendLimit, forKey: .spendLimit)
            try container.encodeIfPresent(self.spendLimitFrequency, forKey: .spendLimitFrequency)
            try container.encodeIfPresent(self.transactionLimit, forKey: .transactionLimit)
            try container.encodeIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case billing
            case canceled
            case frozen
            case name
            case pin
            case removeLimit = "remove_limit"
            case spendLimit = "spend_limit"
            case spendLimitFrequency = "spend_limit_frequency"
            case transactionLimit = "transaction_limit"
            case userId = "user_id"
        }
    }
}