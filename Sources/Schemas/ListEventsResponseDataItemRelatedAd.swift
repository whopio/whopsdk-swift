import Foundation

/// The Whop ad this event's click resolved to.
public struct ListEventsResponseDataItemRelatedAd: Codable, Hashable, Sendable {
    public let id: String?
    public let thumbnailUrl: Nullable<String>?
    public let title: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        thumbnailUrl: Nullable<String>? = nil,
        title: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.thumbnailUrl = try container.decodeNullableIfPresent(String.self, forKey: .thumbnailUrl)
        self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.thumbnailUrl, forKey: .thumbnailUrl)
        try container.encodeNullableIfPresent(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case thumbnailUrl = "thumbnail_url"
        case title
    }
}