import Foundation

public struct UploadEvidenceDisputesRequestDocumentsItem: Codable, Hashable, Sendable {
    /// The ID returned by a direct upload.
    public let directUploadId: String?
    /// What kind of evidence the document is.
    public let documentType: UploadEvidenceDisputesRequestDocumentsItemDocumentType
    /// The file itself. Send it as a file part to upload and attach in one call, or use `id`/`direct_upload_id` for a file that is already stored.
    public let file: String?
    /// The ID of a file already stored on Whop, prefixed `file_`.
    public let id: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        directUploadId: String? = nil,
        documentType: UploadEvidenceDisputesRequestDocumentsItemDocumentType,
        file: String? = nil,
        id: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.directUploadId = directUploadId
        self.documentType = documentType
        self.file = file
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.directUploadId = try container.decodeIfPresent(String.self, forKey: .directUploadId)
        self.documentType = try container.decode(UploadEvidenceDisputesRequestDocumentsItemDocumentType.self, forKey: .documentType)
        self.file = try container.decodeIfPresent(String.self, forKey: .file)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.directUploadId, forKey: .directUploadId)
        try container.encode(self.documentType, forKey: .documentType)
        try container.encodeIfPresent(self.file, forKey: .file)
        try container.encodeIfPresent(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case directUploadId = "direct_upload_id"
        case documentType = "document_type"
        case file
        case id
    }
}