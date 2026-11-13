import Foundation

/// A shareable link anyone holding its code can open to claim the funds.
public struct ClaimClaimLinksResponse: Codable, Hashable, Sendable {
    /// Amount each claim receives.
    public let amount: String
    /// Shareable claim URL. Null when retrieving by ID without claim-link management access.
    public let claimUrl: Nullable<String>
    /// Whether this link can currently be claimed.
    public let claimable: Bool
    /// Redeemable claim code. Null when retrieving by ID without claim-link management access.
    public let code: Nullable<String>
    public let createdAt: Date
    public let currency: String
    public let expiresAt: Nullable<Date>
    /// Claim-link ID, prefixed `airdrp_`.
    public let id: String
    public let object: ClaimClaimLinksResponseObject
    /// Maximum number of claims.
    public let redeemableCount: Int
    /// Number of completed claims.
    public let redeemedCount: Int
    /// Number of available claims, excluding slots reserved by pending claims.
    public let remainingClaims: Int
    /// The public account or user funding the claim link.
    public let sender: ClaimClaimLinksResponseSender
    public let source: ClaimClaimLinksResponseSource
    /// The link's lifecycle status. A newly funded link is `pending`. Check `claimable` for current availability, including expiry and reserved claims.
    public let status: ClaimClaimLinksResponseStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: String,
        claimUrl: Nullable<String>,
        claimable: Bool,
        code: Nullable<String>,
        createdAt: Date,
        currency: String,
        expiresAt: Nullable<Date>,
        id: String,
        object: ClaimClaimLinksResponseObject,
        redeemableCount: Int,
        redeemedCount: Int,
        remainingClaims: Int,
        sender: ClaimClaimLinksResponseSender,
        source: ClaimClaimLinksResponseSource,
        status: ClaimClaimLinksResponseStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.claimUrl = claimUrl
        self.claimable = claimable
        self.code = code
        self.createdAt = createdAt
        self.currency = currency
        self.expiresAt = expiresAt
        self.id = id
        self.object = object
        self.redeemableCount = redeemableCount
        self.redeemedCount = redeemedCount
        self.remainingClaims = remainingClaims
        self.sender = sender
        self.source = source
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.claimUrl = try container.decode(Nullable<String>.self, forKey: .claimUrl)
        self.claimable = try container.decode(Bool.self, forKey: .claimable)
        self.code = try container.decode(Nullable<String>.self, forKey: .code)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.expiresAt = try container.decode(Nullable<Date>.self, forKey: .expiresAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.object = try container.decode(ClaimClaimLinksResponseObject.self, forKey: .object)
        self.redeemableCount = try container.decode(Int.self, forKey: .redeemableCount)
        self.redeemedCount = try container.decode(Int.self, forKey: .redeemedCount)
        self.remainingClaims = try container.decode(Int.self, forKey: .remainingClaims)
        self.sender = try container.decode(ClaimClaimLinksResponseSender.self, forKey: .sender)
        self.source = try container.decode(ClaimClaimLinksResponseSource.self, forKey: .source)
        self.status = try container.decode(ClaimClaimLinksResponseStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.claimUrl, forKey: .claimUrl)
        try container.encode(self.claimable, forKey: .claimable)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.redeemableCount, forKey: .redeemableCount)
        try container.encode(self.redeemedCount, forKey: .redeemedCount)
        try container.encode(self.remainingClaims, forKey: .remainingClaims)
        try container.encode(self.sender, forKey: .sender)
        try container.encode(self.source, forKey: .source)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case claimUrl = "claim_url"
        case claimable
        case code
        case createdAt = "created_at"
        case currency
        case expiresAt = "expires_at"
        case id
        case object
        case redeemableCount = "redeemable_count"
        case redeemedCount = "redeemed_count"
        case remainingClaims = "remaining_claims"
        case sender
        case source
        case status
    }
}