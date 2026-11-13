import Foundation

/// Funds a shareable link anyone with the URL can redeem and returns a `claim_link`.
public struct CreateTransfersRequestBodyClaimLink: Codable, Hashable, Sendable {
    /// The amount each claim pays, in the link currency. For example 25.00. Use at most two decimal places. Use a whole number for a currency without decimal places, such as `jpy`.
    public let amount: Double
    /// Currency of `amount`, as a lowercase ISO 4217 code. Defaults to `usd`. The origin balance must hold `amount` times `redeemable_count` in this currency.
    public let currency: CreateTransfersRequestBodyClaimLinkCurrency?
    /// Link expiry as an ISO 8601 timestamp. Defaults to 24 hours from creation.
    public let expiresAt: Nullable<Date>?
    /// The account sending the funds. A user ID (user_xxx), account ID (biz_xxx), or ledger account ID (ldgr_xxx).
    public let originId: String
    /// How many different users can claim the link. Defaults to 1.
    public let redeemableCount: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        currency: CreateTransfersRequestBodyClaimLinkCurrency? = nil,
        expiresAt: Nullable<Date>? = nil,
        originId: String,
        redeemableCount: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.currency = currency
        self.expiresAt = expiresAt
        self.originId = originId
        self.redeemableCount = redeemableCount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.currency = try container.decodeIfPresent(CreateTransfersRequestBodyClaimLinkCurrency.self, forKey: .currency)
        self.expiresAt = try container.decodeNullableIfPresent(Date.self, forKey: .expiresAt)
        self.originId = try container.decode(String.self, forKey: .originId)
        self.redeemableCount = try container.decodeIfPresent(Int.self, forKey: .redeemableCount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.currency, forKey: .currency)
        try container.encodeNullableIfPresent(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.originId, forKey: .originId)
        try container.encodeIfPresent(self.redeemableCount, forKey: .redeemableCount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case currency
        case expiresAt = "expires_at"
        case originId = "origin_id"
        case redeemableCount = "redeemable_count"
    }
}