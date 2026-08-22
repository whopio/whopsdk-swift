import Foundation

extension Requests {
    public struct CreateTransfersRequest: Codable, Hashable, Sendable {
        /// The amount to move, in the transfer currency. For example 25.00.
        public let amount: Double
        /// Currency, such as `usd`. Required for ledger transfers.
        public let currency: String?
        /// The recipient. Required for ledger and wallet_send (a user_/biz_/ldgr_ ID, or — for sends — an email). Omit for claim_link.
        public let destinationId: String?
        /// claim_link only. Link expiry as an ISO 8601 timestamp. Defaults to 24 hours from creation.
        public let expiresAt: Nullable<Date>?
        /// Ledger transfers and wallet sends. A unique key that makes retries safe. Retrying with the same key returns the original transfer, or attaches to the original wallet send, instead of moving money twice.
        public let idempotenceKey: Nullable<String>?
        /// Ledger transfers only. Custom key-value pairs attached to the transfer. Max 50 keys, 100 chars per key, 500 chars per string value.
        public let metadata: Nullable<[String: JSONValue]>?
        /// Ledger transfers only. A short note describing the transfer.
        public let notes: Nullable<String>?
        /// The account sending the funds. A user ID (user_xxx), account ID (biz_xxx), or ledger account ID (ldgr_xxx).
        public let originId: String
        /// claim_link only. How many different users can claim the link. Defaults to 1.
        public let redeemableCount: Int?
        /// The kind of money movement, which decides what comes back. Defaults to ledger. `ledger` moves credit between two Whop balances and returns a `transfer`; `wallet_send` sends USDT from the origin account's Ethereum wallet and returns a `send`; `claim_link` funds a shareable link anyone with the URL can redeem and returns a `claim_link`. A `ledger` transfer from a stablecoin-rails account settles on-chain when covered, and still returns a `transfer`.
        public let type: CreateTransfersRequestType?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            amount: Double,
            currency: String? = nil,
            destinationId: String? = nil,
            expiresAt: Nullable<Date>? = nil,
            idempotenceKey: Nullable<String>? = nil,
            metadata: Nullable<[String: JSONValue]>? = nil,
            notes: Nullable<String>? = nil,
            originId: String,
            redeemableCount: Int? = nil,
            type: CreateTransfersRequestType? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.amount = amount
            self.currency = currency
            self.destinationId = destinationId
            self.expiresAt = expiresAt
            self.idempotenceKey = idempotenceKey
            self.metadata = metadata
            self.notes = notes
            self.originId = originId
            self.redeemableCount = redeemableCount
            self.type = type
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.amount = try container.decode(Double.self, forKey: .amount)
            self.currency = try container.decodeIfPresent(String.self, forKey: .currency)
            self.destinationId = try container.decodeIfPresent(String.self, forKey: .destinationId)
            self.expiresAt = try container.decodeNullableIfPresent(Date.self, forKey: .expiresAt)
            self.idempotenceKey = try container.decodeNullableIfPresent(String.self, forKey: .idempotenceKey)
            self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
            self.notes = try container.decodeNullableIfPresent(String.self, forKey: .notes)
            self.originId = try container.decode(String.self, forKey: .originId)
            self.redeemableCount = try container.decodeIfPresent(Int.self, forKey: .redeemableCount)
            self.type = try container.decodeIfPresent(CreateTransfersRequestType.self, forKey: .type)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.amount, forKey: .amount)
            try container.encodeIfPresent(self.currency, forKey: .currency)
            try container.encodeIfPresent(self.destinationId, forKey: .destinationId)
            try container.encodeNullableIfPresent(self.expiresAt, forKey: .expiresAt)
            try container.encodeNullableIfPresent(self.idempotenceKey, forKey: .idempotenceKey)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.notes, forKey: .notes)
            try container.encode(self.originId, forKey: .originId)
            try container.encodeIfPresent(self.redeemableCount, forKey: .redeemableCount)
            try container.encodeIfPresent(self.type, forKey: .type)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case amount
            case currency
            case destinationId = "destination_id"
            case expiresAt = "expires_at"
            case idempotenceKey = "idempotence_key"
            case metadata
            case notes
            case originId = "origin_id"
            case redeemableCount = "redeemable_count"
            case type
        }
    }
}