import Foundation

/// Information to aid in pagination.
public struct DeliveriesWebhookResponsePageInfo: Codable, Hashable, Sendable {
    /// When paginating forwards, the cursor to continue.
    public let endCursor: Nullable<String>
    /// When paginating forwards, are there more items?
    public let hasNextPage: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        endCursor: Nullable<String>,
        hasNextPage: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.endCursor = endCursor
        self.hasNextPage = hasNextPage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endCursor = try container.decode(Nullable<String>.self, forKey: .endCursor)
        self.hasNextPage = try container.decode(Bool.self, forKey: .hasNextPage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.endCursor, forKey: .endCursor)
        try container.encode(self.hasNextPage, forKey: .hasNextPage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case endCursor = "end_cursor"
        case hasNextPage = "has_next_page"
    }
}