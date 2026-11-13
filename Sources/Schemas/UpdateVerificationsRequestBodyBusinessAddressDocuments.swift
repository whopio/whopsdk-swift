import Foundation

/// Company formation documents, each the ID of a file uploaded with Create File and not yet attached to anything else, prefixed `file_`. Send the ID once its `upload_status` is `ready`. Each file must be a PDF, JPEG, or PNG of up to 10MB. They are filed under the business's country, from `country`, `address`, or an earlier request. A document of a kind already on file is kept unless it was rejected, so a retried request does not add a second copy. The hosted session at `session_url` collects anything still missing.
public struct UpdateVerificationsRequestBodyBusinessAddressDocuments: Codable, Hashable, Sendable {
    /// File ID of the articles of incorporation or organization, prefixed `file_`.
    public let articlesOfIncorporation: String?
    /// File ID of the certificate of incorporation or formation, prefixed `file_`.
    public let certificateOfIncorporation: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        articlesOfIncorporation: String? = nil,
        certificateOfIncorporation: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.articlesOfIncorporation = articlesOfIncorporation
        self.certificateOfIncorporation = certificateOfIncorporation
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.articlesOfIncorporation = try container.decodeIfPresent(String.self, forKey: .articlesOfIncorporation)
        self.certificateOfIncorporation = try container.decodeIfPresent(String.self, forKey: .certificateOfIncorporation)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.articlesOfIncorporation, forKey: .articlesOfIncorporation)
        try container.encodeIfPresent(self.certificateOfIncorporation, forKey: .certificateOfIncorporation)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case articlesOfIncorporation = "articles_of_incorporation"
        case certificateOfIncorporation = "certificate_of_incorporation"
    }
}