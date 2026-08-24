import Foundation

public struct ListEventsResponseDataItemRelatedApp: Codable, Hashable, Sendable {
    public let domainId: Nullable<String>?
    public let iconUrl: Nullable<String>?
    public let id: String?
    public let title: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        domainId: Nullable<String>? = nil,
        iconUrl: Nullable<String>? = nil,
        id: String? = nil,
        title: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.domainId = domainId
        self.iconUrl = iconUrl
        self.id = id
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domainId = try container.decodeNullableIfPresent(String.self, forKey: .domainId)
        self.iconUrl = try container.decodeNullableIfPresent(String.self, forKey: .iconUrl)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.domainId, forKey: .domainId)
        try container.encodeNullableIfPresent(self.iconUrl, forKey: .iconUrl)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case domainId = "domain_id"
        case iconUrl = "icon_url"
        case id
        case title
    }
}