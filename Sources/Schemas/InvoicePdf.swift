import Foundation

public struct InvoicePdf: Codable, Hashable, Sendable {
    /// When the link stops working, as an ISO 8601 timestamp. Generate a new PDF for a fresh link.
    public let expiresAt: String
    /// A short-lived link to download the invoice as a PDF. Anyone holding the link can download the file until it expires.
    public let url: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        expiresAt: String,
        url: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.expiresAt = expiresAt
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.expiresAt = try container.decode(String.self, forKey: .expiresAt)
        self.url = try container.decode(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case expiresAt = "expires_at"
        case url
    }
}