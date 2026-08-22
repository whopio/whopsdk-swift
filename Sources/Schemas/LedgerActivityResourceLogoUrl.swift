import Foundation

public struct LedgerActivityResourceLogoUrl: Codable, Hashable, Sendable {
    /// Account ID.
    public let id: String
    /// Account logo URL.
    public let logoUrl: Nullable<String>
    public let object: LedgerActivityResourceLogoUrlObject
    /// Account route.
    public let route: Nullable<String>
    /// Account display name.
    public let title: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        logoUrl: Nullable<String>,
        object: LedgerActivityResourceLogoUrlObject,
        route: Nullable<String>,
        title: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.logoUrl = logoUrl
        self.object = object
        self.route = route
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.logoUrl = try container.decode(Nullable<String>.self, forKey: .logoUrl)
        self.object = try container.decode(LedgerActivityResourceLogoUrlObject.self, forKey: .object)
        self.route = try container.decode(Nullable<String>.self, forKey: .route)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.logoUrl, forKey: .logoUrl)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.route, forKey: .route)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case logoUrl = "logo_url"
        case object
        case route
        case title
    }
}