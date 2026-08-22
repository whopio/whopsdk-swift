import Foundation

public struct UserBalanceBusiness: Codable, Hashable, Sendable {
    /// The account's total balance in USD.
    public let balanceUsd: String
    /// The account ID, which looks like biz_*************.
    public let id: String
    /// The account's logo URL.
    public let logoUrl: Nullable<String>
    /// The account's display name.
    public let name: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        balanceUsd: String,
        id: String,
        logoUrl: Nullable<String>,
        name: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.balanceUsd = balanceUsd
        self.id = id
        self.logoUrl = logoUrl
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.balanceUsd = try container.decode(String.self, forKey: .balanceUsd)
        self.id = try container.decode(String.self, forKey: .id)
        self.logoUrl = try container.decode(Nullable<String>.self, forKey: .logoUrl)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.balanceUsd, forKey: .balanceUsd)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.logoUrl, forKey: .logoUrl)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case balanceUsd = "balance_usd"
        case id
        case logoUrl = "logo_url"
        case name
    }
}