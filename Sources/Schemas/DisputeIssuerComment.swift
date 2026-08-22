import Foundation

public struct DisputeIssuerComment: Codable, Hashable, Sendable {
    /// When the comment was received, as an ISO 8601 timestamp.
    public let receivedAt: Nullable<String>
    /// What the issuer wrote, as received.
    public let text: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        receivedAt: Nullable<String>,
        text: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.receivedAt = receivedAt
        self.text = text
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.receivedAt = try container.decode(Nullable<String>.self, forKey: .receivedAt)
        self.text = try container.decode(String.self, forKey: .text)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.receivedAt, forKey: .receivedAt)
        try container.encode(self.text, forKey: .text)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case receivedAt = "received_at"
        case text
    }
}