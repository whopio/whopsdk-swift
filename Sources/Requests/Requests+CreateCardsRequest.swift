import Foundation

extension Requests {
    public struct CreateCardsRequest: Codable, Hashable, Sendable {
        /// The owning account ID (a biz_ identifier). Provide this or user_id.
        public let accountId: String?
        /// The account member (a user_ identifier) to assign the card to. Required for business card issuing accounts. When this call files the card application, the member applies with their identity; a company API key that sends neither this nor kind is refused.
        public let assignedUserId: String?
        /// The card's initial billing address. On a company card it also registers the assigned member as a cardholder if they are not one yet. For an individual card, region is also required.
        public let billing: CreateCardsRequestBilling?
        /// Details for a company card's assigned member when they are not registered as a cardholder yet. Send with billing to register them and start provisioning in one call instead of sending them an onboarding invitation. The legal name comes from the member's approved identity verification when they have one, and from these fields when they do not.
        public let cardholder: CreateCardsRequestCardholder?
        /// Who the card application verifies, set only on the call that files it; sending it while the account's application is in progress or approved is a 400. `business` applies as the account with its approved KYB. `individual` applies as a person: assigned_user_id when given, otherwise the account owner, using the identity verified on the account. Omit it to apply as the business when its KYB is approved, and as an individual otherwise.
        public let kind: CreateCardsRequestKind?
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
            billing: CreateCardsRequestBilling? = nil,
            cardholder: CreateCardsRequestCardholder? = nil,
            kind: CreateCardsRequestKind? = nil,
            name: String? = nil,
            spendLimit: Double? = nil,
            spendLimitFrequency: CreateCardsRequestSpendLimitFrequency? = nil,
            transactionLimit: Double? = nil,
            userId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.assignedUserId = assignedUserId
            self.billing = billing
            self.cardholder = cardholder
            self.kind = kind
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
            self.billing = try container.decodeIfPresent(CreateCardsRequestBilling.self, forKey: .billing)
            self.cardholder = try container.decodeIfPresent(CreateCardsRequestCardholder.self, forKey: .cardholder)
            self.kind = try container.decodeIfPresent(CreateCardsRequestKind.self, forKey: .kind)
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
            try container.encodeIfPresent(self.billing, forKey: .billing)
            try container.encodeIfPresent(self.cardholder, forKey: .cardholder)
            try container.encodeIfPresent(self.kind, forKey: .kind)
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
            case billing
            case cardholder
            case kind
            case name
            case spendLimit = "spend_limit"
            case spendLimitFrequency = "spend_limit_frequency"
            case transactionLimit = "transaction_limit"
            case userId = "user_id"
        }
    }
}