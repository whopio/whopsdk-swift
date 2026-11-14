import Foundation

public struct CreatePaypalLinkSessionsResponse: Codable, Hashable, Sendable {
    /// The PayPal login page to send the account holder to.
    public let authorizeUrl: String
    /// When the login session stops being accepted, as an ISO 8601 timestamp; start a new one after this.
    public let expiresAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authorizeUrl: String,
        expiresAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authorizeUrl = authorizeUrl
        self.expiresAt = expiresAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authorizeUrl = try container.decode(String.self, forKey: .authorizeUrl)
        self.expiresAt = try container.decode(Date.self, forKey: .expiresAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.authorizeUrl, forKey: .authorizeUrl)
        try container.encode(self.expiresAt, forKey: .expiresAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authorizeUrl = "authorize_url"
        case expiresAt = "expires_at"
    }
}