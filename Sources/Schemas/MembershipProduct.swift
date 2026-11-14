import Foundation

public struct MembershipProduct: Codable, Hashable, Sendable {
    /// Product ID, prefixed `prod_`.
    public let id: String
    /// Product logo image URL. `null` when the product has no logo.
    public let logoUrl: Nullable<String>
    /// Product display name.
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        logoUrl: Nullable<String>,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.logoUrl = logoUrl
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.logoUrl = try container.decode(Nullable<String>.self, forKey: .logoUrl)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.logoUrl, forKey: .logoUrl)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case logoUrl = "logo_url"
        case title
    }
}