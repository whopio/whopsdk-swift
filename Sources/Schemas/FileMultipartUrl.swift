import Foundation

public struct FileMultipartUrl: Codable, Hashable, Sendable {
    /// The 1-based index of this part within the multipart upload.
    public let partNumber: Int
    /// The presigned URL to PUT this part's bytes to.
    public let url: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        partNumber: Int,
        url: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.partNumber = partNumber
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.partNumber = try container.decode(Int.self, forKey: .partNumber)
        self.url = try container.decode(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.partNumber, forKey: .partNumber)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case partNumber = "part_number"
        case url
    }
}