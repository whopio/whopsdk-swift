import Foundation

/// The saved audience this event came from. Present on the identify events an audience ingest writes for each of its members.
public struct ListEventsResponseDataItemRelatedAudience: Codable, Hashable, Sendable {
    public let audienceType: Nullable<ListEventsResponseDataItemRelatedAudienceAudienceType>?
    public let fileName: Nullable<String>?
    public let id: String?
    public let sourceType: Nullable<ListEventsResponseDataItemRelatedAudienceSourceType>?
    public let title: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        audienceType: Nullable<ListEventsResponseDataItemRelatedAudienceAudienceType>? = nil,
        fileName: Nullable<String>? = nil,
        id: String? = nil,
        sourceType: Nullable<ListEventsResponseDataItemRelatedAudienceSourceType>? = nil,
        title: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.audienceType = audienceType
        self.fileName = fileName
        self.id = id
        self.sourceType = sourceType
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.audienceType = try container.decodeNullableIfPresent(ListEventsResponseDataItemRelatedAudienceAudienceType.self, forKey: .audienceType)
        self.fileName = try container.decodeNullableIfPresent(String.self, forKey: .fileName)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.sourceType = try container.decodeNullableIfPresent(ListEventsResponseDataItemRelatedAudienceSourceType.self, forKey: .sourceType)
        self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.audienceType, forKey: .audienceType)
        try container.encodeNullableIfPresent(self.fileName, forKey: .fileName)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.sourceType, forKey: .sourceType)
        try container.encodeNullableIfPresent(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case audienceType = "audience_type"
        case fileName = "file_name"
        case id
        case sourceType = "source_type"
        case title
    }
}