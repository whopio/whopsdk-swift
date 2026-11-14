import Foundation

/// Moves credit between two Whop balances and returns a `transfer`. The transfer can come back `processing` and reach `succeeded` or `failed` asynchronously, usually within seconds.
public struct CreateTransfersRequestBodyBalance: Codable, Hashable, Sendable {
    /// The amount to move, in the transfer currency. For example 25.00.
    public let amount: Double
    /// Currency, such as `usd`.
    public let currency: String
    /// The recipient. A user ID (user_xxx), account ID (biz_xxx), or ledger account ID (ldgr_xxx).
    public let destinationId: String
    /// The feed the transfer was initiated from. Given with `feed_type`, the payment receipt posts into that feed instead of a direct message.
    public let feedId: Nullable<String>?
    /// The type of the feed named by `feed_id`.
    public let feedType: Nullable<CreateTransfersRequestBodyBalanceFeedType>?
    /// A unique key that makes retries safe. Retrying with the same key returns the original transfer instead of moving money twice.
    public let idempotenceKey: Nullable<String>?
    /// Custom key-value pairs attached to the transfer. Max 50 keys, 100 chars per key, 500 chars per string value.
    public let metadata: Nullable<[String: JSONValue]>?
    /// A short note describing the transfer.
    public let notes: Nullable<String>?
    /// The account sending the funds. A user ID (user_xxx), account ID (biz_xxx), or ledger account ID (ldgr_xxx).
    public let originId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        currency: String,
        destinationId: String,
        feedId: Nullable<String>? = nil,
        feedType: Nullable<CreateTransfersRequestBodyBalanceFeedType>? = nil,
        idempotenceKey: Nullable<String>? = nil,
        metadata: Nullable<[String: JSONValue]>? = nil,
        notes: Nullable<String>? = nil,
        originId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.currency = currency
        self.destinationId = destinationId
        self.feedId = feedId
        self.feedType = feedType
        self.idempotenceKey = idempotenceKey
        self.metadata = metadata
        self.notes = notes
        self.originId = originId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.destinationId = try container.decode(String.self, forKey: .destinationId)
        self.feedId = try container.decodeNullableIfPresent(String.self, forKey: .feedId)
        self.feedType = try container.decodeNullableIfPresent(CreateTransfersRequestBodyBalanceFeedType.self, forKey: .feedType)
        self.idempotenceKey = try container.decodeNullableIfPresent(String.self, forKey: .idempotenceKey)
        self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
        self.notes = try container.decodeNullableIfPresent(String.self, forKey: .notes)
        self.originId = try container.decode(String.self, forKey: .originId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.destinationId, forKey: .destinationId)
        try container.encodeNullableIfPresent(self.feedId, forKey: .feedId)
        try container.encodeNullableIfPresent(self.feedType, forKey: .feedType)
        try container.encodeNullableIfPresent(self.idempotenceKey, forKey: .idempotenceKey)
        try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
        try container.encodeNullableIfPresent(self.notes, forKey: .notes)
        try container.encode(self.originId, forKey: .originId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case currency
        case destinationId = "destination_id"
        case feedId = "feed_id"
        case feedType = "feed_type"
        case idempotenceKey = "idempotence_key"
        case metadata
        case notes
        case originId = "origin_id"
    }
}