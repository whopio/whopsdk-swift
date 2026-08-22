import Foundation

public struct ListEventsResponseDataItemRelatedProduct: Codable, Hashable, Sendable {
    public let id: String?
    public let route: Nullable<String>?
    public let title: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        route: Nullable<String>? = nil,
        title: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.route = route
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.route = try container.decodeNullableIfPresent(String.self, forKey: .route)
        self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.route, forKey: .route)
        try container.encodeNullableIfPresent(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case route
        case title
    }
}