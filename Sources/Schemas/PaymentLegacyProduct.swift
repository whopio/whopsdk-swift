import Foundation

/// The product this payment was made for
public struct PaymentLegacyProduct: Codable, Hashable, Sendable {
    /// The unique identifier for the product.
    public let id: String
    /// Custom key-value pairs stored on the product and included in payment and membership webhook payloads. Max 50 keys, 100 characters per key, 500 characters per string value.
    public let metadata: Nullable<[String: JSONValue]>
    /// URL slug in the product's public link, e.g. `pickaxe-analytics` in whop.com/company/pickaxe-analytics.
    public let route: String
    /// The display name of the product shown to customers on the product page and in search results.
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        metadata: Nullable<[String: JSONValue]>,
        route: String,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.metadata = metadata
        self.route = route
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.route = try container.decode(String.self, forKey: .route)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.route, forKey: .route)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case metadata
        case route
        case title
    }
}