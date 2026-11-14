import Foundation

extension Requests {
    public struct CreatePayoutsRequest: Codable, Hashable, Sendable {
        /// Account to pay out from, prefixed `biz_`. Provide exactly one of `account_id` or `user_id`.
        public let accountId: String?
        /// Set to `true` to continue when the destination bank could not confirm the payout method account holder's name, or `false` to have the payout refused in that case so the account holder can correct the name or link their bank first. Omitting the field skips the warning gate — a client that cannot show the warning keeps its pre-gate behavior.
        public let acknowledgeBankWarning: Bool?
        /// The amount to pay out in the specified currency.
        public let amount: Float
        /// The currency to pay out. Balances are held per currency and the payout draws only from the balance in this currency, so match the currency the funds arrived in — for example `cad` for an account funded by CAD transfers. When omitted, uses `usd` if that balance can cover a withdrawal, otherwise the account's only other funded currency.
        public let currency: String?
        /// Key-value data to attach to the payout, echoed on every read and in webhook payloads. At most 50 keys, key names up to 40 characters, string values up to 500 characters. Never store secrets or regulated personal data here — webhook bodies are retained for delivery inspection.
        public let metadata: [String: String]?
        /// Free-form notes to attach to the payout, with a maximum of 255 characters. Omit or pass `null` for no notes.
        public let notes: Nullable<String>?
        /// A saved card of the account, prefixed `payt_`, to charge for this payout instead of paying from the balance. Requires a `quote_token` from `POST /payouts/quotes` made with the same card and `amount`. Only for business accounts paying a saved recipient in `usd` at `standard` speed. The payout is returned under the card payment's `pay_` id until it is submitted, then `GET /payouts/{id}` returns the submitted payout.
        public let paymentMethodId: String?
        /// The saved payout method to deliver to (a potk_ identifier).
        public let payoutMethodId: String
        /// Whether the parent platform covers the payout fee instead of the account being paid out. Omit to use the platform's configured fee coverage policy; pass `false` to opt out of it. `true` is only accepted for accounts that belong to a platform, and requires the platform's policy to cover this payout method's category or a caller authorized to manage the platform's child account fees.
        public let platformCoversFees: Bool?
        /// Required server-signed token from POST /payouts/quotes, matching this payout's owner, method, amount, currency and speed. Submit before expiry. For an uncertain payout, retry with the original token and Idempotency-Key to recover the existing payout.
        public let quoteToken: String
        /// How fast the funds should arrive. `instant` is only accepted when the account and payout method are eligible; otherwise the payout is rejected.
        public let speed: CreatePayoutsRequestSpeed?
        /// Payment description sent with the payout, such as an invoice number or what it pays for. Must be 5-80 printable ASCII characters (letters, digits, spaces and punctuation); Whop sends it in upper case. Not all countries and banks show it on the recipient's statement, and it is not the sender name. Set this value when creating the quote; the payout request may omit it but cannot add or change it.
        public let statementDescriptor: Nullable<String>?
        /// User to pay out from, prefixed `user_`. Provide exactly one of `account_id` or `user_id`.
        public let userId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            acknowledgeBankWarning: Bool? = nil,
            amount: Float,
            currency: String? = nil,
            metadata: [String: String]? = nil,
            notes: Nullable<String>? = nil,
            paymentMethodId: String? = nil,
            payoutMethodId: String,
            platformCoversFees: Bool? = nil,
            quoteToken: String,
            speed: CreatePayoutsRequestSpeed? = nil,
            statementDescriptor: Nullable<String>? = nil,
            userId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.acknowledgeBankWarning = acknowledgeBankWarning
            self.amount = amount
            self.currency = currency
            self.metadata = metadata
            self.notes = notes
            self.paymentMethodId = paymentMethodId
            self.payoutMethodId = payoutMethodId
            self.platformCoversFees = platformCoversFees
            self.quoteToken = quoteToken
            self.speed = speed
            self.statementDescriptor = statementDescriptor
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.acknowledgeBankWarning = try container.decodeIfPresent(Bool.self, forKey: .acknowledgeBankWarning)
            self.amount = try container.decode(Float.self, forKey: .amount)
            self.currency = try container.decodeIfPresent(String.self, forKey: .currency)
            self.metadata = try container.decodeIfPresent([String: String].self, forKey: .metadata)
            self.notes = try container.decodeNullableIfPresent(String.self, forKey: .notes)
            self.paymentMethodId = try container.decodeIfPresent(String.self, forKey: .paymentMethodId)
            self.payoutMethodId = try container.decode(String.self, forKey: .payoutMethodId)
            self.platformCoversFees = try container.decodeIfPresent(Bool.self, forKey: .platformCoversFees)
            self.quoteToken = try container.decode(String.self, forKey: .quoteToken)
            self.speed = try container.decodeIfPresent(CreatePayoutsRequestSpeed.self, forKey: .speed)
            self.statementDescriptor = try container.decodeNullableIfPresent(String.self, forKey: .statementDescriptor)
            self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.acknowledgeBankWarning, forKey: .acknowledgeBankWarning)
            try container.encode(self.amount, forKey: .amount)
            try container.encodeIfPresent(self.currency, forKey: .currency)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.notes, forKey: .notes)
            try container.encodeIfPresent(self.paymentMethodId, forKey: .paymentMethodId)
            try container.encode(self.payoutMethodId, forKey: .payoutMethodId)
            try container.encodeIfPresent(self.platformCoversFees, forKey: .platformCoversFees)
            try container.encode(self.quoteToken, forKey: .quoteToken)
            try container.encodeIfPresent(self.speed, forKey: .speed)
            try container.encodeNullableIfPresent(self.statementDescriptor, forKey: .statementDescriptor)
            try container.encodeIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case acknowledgeBankWarning = "acknowledge_bank_warning"
            case amount
            case currency
            case metadata
            case notes
            case paymentMethodId = "payment_method_id"
            case payoutMethodId = "payout_method_id"
            case platformCoversFees = "platform_covers_fees"
            case quoteToken = "quote_token"
            case speed
            case statementDescriptor = "statement_descriptor"
            case userId = "user_id"
        }
    }
}