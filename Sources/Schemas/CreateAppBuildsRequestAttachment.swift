import Foundation

/// The uploaded build file: pass `id` for an existing file or `direct_upload_id` for a completed direct upload. iOS and Android builds take a .zip bundle; web builds take a JavaScript file or a .zip archive of the hosted site.
public struct CreateAppBuildsRequestAttachment: Codable, Hashable, Sendable {
    /// The signed id of a completed direct upload.
    public let directUploadId: String?
    /// The tag of an already-uploaded file.
    public let id: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        directUploadId: String? = nil,
        id: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.directUploadId = directUploadId
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.directUploadId = try container.decodeIfPresent(String.self, forKey: .directUploadId)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.directUploadId, forKey: .directUploadId)
        try container.encodeIfPresent(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case directUploadId = "direct_upload_id"
        case id
    }
}