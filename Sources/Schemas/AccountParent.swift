import Foundation

public struct AccountParent: Codable, Hashable, Sendable {
    /// Markup rates this parent charges the subaccount being read, keyed by fee type (for example `crypto_deposit_markup`), each with `percentage_fee` and `fixed_fee_usd`. Resolved with the subaccount's own overrides winning over the platform default.
    public let fees: [String: AccountParentFeesValue]?
    /// Account ID, prefixed `biz_`.
    public let id: String
    /// Account logo image URL.
    public let logoUrl: Nullable<String>
    /// Account public route identifier.
    public let route: String
    /// Account display name.
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fees: [String: AccountParentFeesValue]? = nil,
        id: String,
        logoUrl: Nullable<String>,
        route: String,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fees = fees
        self.id = id
        self.logoUrl = logoUrl
        self.route = route
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fees = try container.decodeIfPresent([String: AccountParentFeesValue].self, forKey: .fees)
        self.id = try container.decode(String.self, forKey: .id)
        self.logoUrl = try container.decode(Nullable<String>.self, forKey: .logoUrl)
        self.route = try container.decode(String.self, forKey: .route)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fees, forKey: .fees)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.logoUrl, forKey: .logoUrl)
        try container.encode(self.route, forKey: .route)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fees
        case id
        case logoUrl = "logo_url"
        case route
        case title
    }
}