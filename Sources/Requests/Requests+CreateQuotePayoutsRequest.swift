import Foundation

extension Requests {
    public struct CreateQuotePayoutsRequest: Codable, Hashable, Sendable {
        /// Account to pay out from, prefixed `biz_`. Provide exactly one of `account_id` or `user_id`.
        public let accountId: String?
        /// The amount to pay out in the specified currency, fees included. Provide exactly one of `amount` or `recipient_amount`.
        public let amount: Double?
        /// The currency to pay out. When omitted, uses `usd` if that balance can cover a withdrawal, otherwise the account's only other funded currency.
        public let currency: String?
        /// A saved card of the account, prefixed `payt_`, to quote paying this payout from. The quote's `amount` is the card charge, `fee` adds the estimated card fees to the payout fee, and `net_amount` is what the recipient receives. Send `recipient_amount` instead of `amount` to quote the charge that delivers a set amount.
        public let paymentMethodId: String?
        /// The saved payout method to quote (a potk_ identifier).
        public let payoutMethodId: String
        /// Whether the parent platform covers the payout fee instead of the account being paid out.
        public let platformCoversFees: Bool?
        /// The amount the recipient should receive, with fees added on top. When the payout method pays out in `currency`, the quote's `destination_amount` covers it; otherwise its `net_amount` does. With `payment_method_id`, the card charge is set so the quote's `net_amount` is exactly this amount, or the quote is refused. Provide exactly one of `amount` or `recipient_amount`.
        public let recipientAmount: Double?
        /// How fast the funds should arrive.
        public let speed: CreateQuotePayoutsRequestSpeed?
        /// Payment description sent with the payout, such as an invoice number or what it pays for. Must be 5-80 printable ASCII characters (letters, digits, spaces and punctuation); Whop sends it in upper case. Not all countries and banks show it on the recipient's statement, and it is not the sender name. Omit or pass `null` to use the default descriptor.
        public let statementDescriptor: Nullable<String>?
        /// User to pay out from, prefixed `user_`. Provide exactly one of `account_id` or `user_id`.
        public let userId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            amount: Double? = nil,
            currency: String? = nil,
            paymentMethodId: String? = nil,
            payoutMethodId: String,
            platformCoversFees: Bool? = nil,
            recipientAmount: Double? = nil,
            speed: CreateQuotePayoutsRequestSpeed? = nil,
            statementDescriptor: Nullable<String>? = nil,
            userId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.amount = amount
            self.currency = currency
            self.paymentMethodId = paymentMethodId
            self.payoutMethodId = payoutMethodId
            self.platformCoversFees = platformCoversFees
            self.recipientAmount = recipientAmount
            self.speed = speed
            self.statementDescriptor = statementDescriptor
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.amount = try container.decodeIfPresent(Double.self, forKey: .amount)
            self.currency = try container.decodeIfPresent(String.self, forKey: .currency)
            self.paymentMethodId = try container.decodeIfPresent(String.self, forKey: .paymentMethodId)
            self.payoutMethodId = try container.decode(String.self, forKey: .payoutMethodId)
            self.platformCoversFees = try container.decodeIfPresent(Bool.self, forKey: .platformCoversFees)
            self.recipientAmount = try container.decodeIfPresent(Double.self, forKey: .recipientAmount)
            self.speed = try container.decodeIfPresent(CreateQuotePayoutsRequestSpeed.self, forKey: .speed)
            self.statementDescriptor = try container.decodeNullableIfPresent(String.self, forKey: .statementDescriptor)
            self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.amount, forKey: .amount)
            try container.encodeIfPresent(self.currency, forKey: .currency)
            try container.encodeIfPresent(self.paymentMethodId, forKey: .paymentMethodId)
            try container.encode(self.payoutMethodId, forKey: .payoutMethodId)
            try container.encodeIfPresent(self.platformCoversFees, forKey: .platformCoversFees)
            try container.encodeIfPresent(self.recipientAmount, forKey: .recipientAmount)
            try container.encodeIfPresent(self.speed, forKey: .speed)
            try container.encodeNullableIfPresent(self.statementDescriptor, forKey: .statementDescriptor)
            try container.encodeIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case amount
            case currency
            case paymentMethodId = "payment_method_id"
            case payoutMethodId = "payout_method_id"
            case platformCoversFees = "platform_covers_fees"
            case recipientAmount = "recipient_amount"
            case speed
            case statementDescriptor = "statement_descriptor"
            case userId = "user_id"
        }
    }
}