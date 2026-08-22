import Foundation

/// Work to attach to the submission. Combine `urls`, `file_ids`, and `caption` freely; all are optional.
public struct SubmitBountySubmissionsRequestDeliverable: Codable, Hashable, Sendable {
    /// Written context shown to reviewers alongside the work.
    public let caption: Nullable<String>?
    /// IDs of uploaded files attached as work, up to 10, each prefixed `file_`. Combinable with `urls` and `caption`.
    public let fileIds: [String]?
    /// Links to the posted work, up to 10. Combinable with `file_ids` and `caption`.
    public let urls: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        caption: Nullable<String>? = nil,
        fileIds: [String]? = nil,
        urls: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.caption = caption
        self.fileIds = fileIds
        self.urls = urls
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.caption = try container.decodeNullableIfPresent(String.self, forKey: .caption)
        self.fileIds = try container.decodeIfPresent([String].self, forKey: .fileIds)
        self.urls = try container.decodeIfPresent([String].self, forKey: .urls)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.caption, forKey: .caption)
        try container.encodeIfPresent(self.fileIds, forKey: .fileIds)
        try container.encodeIfPresent(self.urls, forKey: .urls)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case caption
        case fileIds = "file_ids"
        case urls
    }
}