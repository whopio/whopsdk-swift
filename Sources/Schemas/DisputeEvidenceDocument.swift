import Foundation

public struct DisputeEvidenceDocument: Codable, Hashable, Sendable {
    /// The uploaded file's MIME type. Uploads are restricted to the types the processor accepts.
    public let contentType: Nullable<DisputeEvidenceDocumentContentType>
    /// What kind of evidence the document is.
    public let documentType: DisputeEvidenceDocumentDocumentType
    /// The uploaded file's name.
    public let filename: Nullable<String>
    /// The attachment's ID, prefixed `file_`.
    public let id: String
    /// A URL to download the document.
    public let url: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        contentType: Nullable<DisputeEvidenceDocumentContentType>,
        documentType: DisputeEvidenceDocumentDocumentType,
        filename: Nullable<String>,
        id: String,
        url: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.contentType = contentType
        self.documentType = documentType
        self.filename = filename
        self.id = id
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contentType = try container.decode(Nullable<DisputeEvidenceDocumentContentType>.self, forKey: .contentType)
        self.documentType = try container.decode(DisputeEvidenceDocumentDocumentType.self, forKey: .documentType)
        self.filename = try container.decode(Nullable<String>.self, forKey: .filename)
        self.id = try container.decode(String.self, forKey: .id)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.contentType, forKey: .contentType)
        try container.encode(self.documentType, forKey: .documentType)
        try container.encode(self.filename, forKey: .filename)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case contentType = "content_type"
        case documentType = "document_type"
        case filename
        case id
        case url
    }
}