import Foundation

public struct ConnectExternalAccountsResponse: Codable, Hashable, Sendable {
    /// The OAuth authorization URL to redirect the user to.
    public let authorizeUrl: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authorizeUrl: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authorizeUrl = authorizeUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authorizeUrl = try container.decode(String.self, forKey: .authorizeUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.authorizeUrl, forKey: .authorizeUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authorizeUrl = "authorize_url"
    }
}