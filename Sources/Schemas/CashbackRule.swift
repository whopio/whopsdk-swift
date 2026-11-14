import Foundation

public struct CashbackRule: Codable, Hashable, Sendable {
    /// When the rule was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Optional description of the cashback rule.
    public let description: Nullable<String>
    /// When the rule was discarded, as an ISO 8601 timestamp. Null means it has not been discarded.
    public let discardedAt: Nullable<String>
    /// Exclusive end of the eligibility window, as an ISO 8601 timestamp. Null means no expiration.
    public let expiresAt: Nullable<String>
    /// Platform account designated to fund cashback, prefixed `biz_`. Derived from the authenticated credential.
    public let fundingAccountId: String
    /// Cashback rule ID, prefixed `cicbr_`.
    public let id: String
    /// Four-digit merchant category code. Null matches any MCC. When both merchant filters are null, scoped_account_id is required.
    public let merchantCategoryCode: Nullable<String>
    /// Raw merchant name reported by the card provider. Null matches any merchant name. When set, matches together with any MCC filter; not a substring or enriched display-name match.
    public let merchantName: Nullable<String>
    /// Cashback rate in basis points. 100 means 1%, and 10000 means 100%.
    public let rateBps: Int
    /// Subaccount ID, prefixed `biz_`. Null designates all direct subaccounts of the funding platform.
    public let scopedAccountId: Nullable<String>
    /// Inclusive start of the rule's eligibility window, as an ISO 8601 timestamp.
    public let startsAt: String
    /// When the rule was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: String,
        description: Nullable<String>,
        discardedAt: Nullable<String>,
        expiresAt: Nullable<String>,
        fundingAccountId: String,
        id: String,
        merchantCategoryCode: Nullable<String>,
        merchantName: Nullable<String>,
        rateBps: Int,
        scopedAccountId: Nullable<String>,
        startsAt: String,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.description = description
        self.discardedAt = discardedAt
        self.expiresAt = expiresAt
        self.fundingAccountId = fundingAccountId
        self.id = id
        self.merchantCategoryCode = merchantCategoryCode
        self.merchantName = merchantName
        self.rateBps = rateBps
        self.scopedAccountId = scopedAccountId
        self.startsAt = startsAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.discardedAt = try container.decode(Nullable<String>.self, forKey: .discardedAt)
        self.expiresAt = try container.decode(Nullable<String>.self, forKey: .expiresAt)
        self.fundingAccountId = try container.decode(String.self, forKey: .fundingAccountId)
        self.id = try container.decode(String.self, forKey: .id)
        self.merchantCategoryCode = try container.decode(Nullable<String>.self, forKey: .merchantCategoryCode)
        self.merchantName = try container.decode(Nullable<String>.self, forKey: .merchantName)
        self.rateBps = try container.decode(Int.self, forKey: .rateBps)
        self.scopedAccountId = try container.decode(Nullable<String>.self, forKey: .scopedAccountId)
        self.startsAt = try container.decode(String.self, forKey: .startsAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.discardedAt, forKey: .discardedAt)
        try container.encode(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.fundingAccountId, forKey: .fundingAccountId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.merchantCategoryCode, forKey: .merchantCategoryCode)
        try container.encode(self.merchantName, forKey: .merchantName)
        try container.encode(self.rateBps, forKey: .rateBps)
        try container.encode(self.scopedAccountId, forKey: .scopedAccountId)
        try container.encode(self.startsAt, forKey: .startsAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case description
        case discardedAt = "discarded_at"
        case expiresAt = "expires_at"
        case fundingAccountId = "funding_account_id"
        case id
        case merchantCategoryCode = "merchant_category_code"
        case merchantName = "merchant_name"
        case rateBps = "rate_bps"
        case scopedAccountId = "scoped_account_id"
        case startsAt = "starts_at"
        case updatedAt = "updated_at"
    }
}