import Foundation

public struct CompleteFilesRequestMultipartPartsItem: Codable, Hashable, Sendable {
    /// The `ETag` response header from the part's upload.
    public let etag: String
    /// The 1-based index of the part.
    public let partNumber: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        etag: String,
        partNumber: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.etag = etag
        self.partNumber = partNumber
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.etag = try container.decode(String.self, forKey: .etag)
        self.partNumber = try container.decode(Int.self, forKey: .partNumber)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.etag, forKey: .etag)
        try container.encode(self.partNumber, forKey: .partNumber)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case etag
        case partNumber = "part_number"
    }
}