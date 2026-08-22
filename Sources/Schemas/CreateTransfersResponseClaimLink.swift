import Foundation

/// Returned for a claim_link: a shareable URL anyone can open to claim the funds.
public struct CreateTransfersResponseClaimLink: Codable, Hashable, Sendable {
    public let amount: String
    public let claimUrl: String
    public let currency: String
    public let expiresAt: Nullable<Date>
    public let id: String
    public let redeemableCount: Int
    public let source: CreateTransfersResponseClaimLinkSource
    /// A newly funded claim link is always `pending` — it stays claimable until it is fully claimed, canceled, or expires.
    public let status: CreateTransfersResponseClaimLinkStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: String,
        claimUrl: String,
        currency: String,
        expiresAt: Nullable<Date>,
        id: String,
        redeemableCount: Int,
        source: CreateTransfersResponseClaimLinkSource,
        status: CreateTransfersResponseClaimLinkStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.claimUrl = claimUrl
        self.currency = currency
        self.expiresAt = expiresAt
        self.id = id
        self.redeemableCount = redeemableCount
        self.source = source
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.claimUrl = try container.decode(String.self, forKey: .claimUrl)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.expiresAt = try container.decode(Nullable<Date>.self, forKey: .expiresAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.redeemableCount = try container.decode(Int.self, forKey: .redeemableCount)
        self.source = try container.decode(CreateTransfersResponseClaimLinkSource.self, forKey: .source)
        self.status = try container.decode(CreateTransfersResponseClaimLinkStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.claimUrl, forKey: .claimUrl)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.redeemableCount, forKey: .redeemableCount)
        try container.encode(self.source, forKey: .source)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case claimUrl = "claim_url"
        case currency
        case expiresAt = "expires_at"
        case id
        case redeemableCount = "redeemable_count"
        case source
        case status
    }
}