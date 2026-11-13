import Foundation

public struct UserEarnings: Codable, Hashable, Sendable {
    /// The first time the user earned gross income, as an ISO 8601 timestamp.
    public let firstEarnedAt: Nullable<String>
    /// Gross income from accounts the user owns or is owner-authorized on.
    public let ownedAccounts: UserEarningsAmount
    /// Partner commissions posted to the user's wallet. Pending Partner payouts are excluded until they post; later reversals do not reduce gross income.
    public let partners: UserEarningsAmount
    /// Gross income from the user's personal wallet.
    public let personal: UserEarningsAmount
    /// Gross income from the user's personal wallet plus accounts they own or are owner-authorized on.
    public let total: UserEarningsAmount
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        firstEarnedAt: Nullable<String>,
        ownedAccounts: UserEarningsAmount,
        partners: UserEarningsAmount,
        personal: UserEarningsAmount,
        total: UserEarningsAmount,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.firstEarnedAt = firstEarnedAt
        self.ownedAccounts = ownedAccounts
        self.partners = partners
        self.personal = personal
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstEarnedAt = try container.decode(Nullable<String>.self, forKey: .firstEarnedAt)
        self.ownedAccounts = try container.decode(UserEarningsAmount.self, forKey: .ownedAccounts)
        self.partners = try container.decode(UserEarningsAmount.self, forKey: .partners)
        self.personal = try container.decode(UserEarningsAmount.self, forKey: .personal)
        self.total = try container.decode(UserEarningsAmount.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.firstEarnedAt, forKey: .firstEarnedAt)
        try container.encode(self.ownedAccounts, forKey: .ownedAccounts)
        try container.encode(self.partners, forKey: .partners)
        try container.encode(self.personal, forKey: .personal)
        try container.encode(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case firstEarnedAt = "first_earned_at"
        case ownedAccounts = "owned_accounts"
        case partners
        case personal
        case total
    }
}