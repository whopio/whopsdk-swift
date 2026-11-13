import Foundation

/// The downstream MCP client displayed on the consent screen. Requires explicit consent even when the upstream app already has a grant. Bound to the authorization code and returned on token exchange so the MCP server can verify the approved client.
public struct CreateOauthGrantsRequestMcpClient: Codable, Hashable, Sendable {
    /// The requesting MCP client's identifier.
    public let clientId: String
    /// The requesting MCP client's display name.
    public let clientName: String
    /// The downstream redirect URI displayed to the user.
    public let redirectUri: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        clientId: String,
        clientName: String,
        redirectUri: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.clientId = clientId
        self.clientName = clientName
        self.redirectUri = redirectUri
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clientId = try container.decode(String.self, forKey: .clientId)
        self.clientName = try container.decode(String.self, forKey: .clientName)
        self.redirectUri = try container.decode(String.self, forKey: .redirectUri)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.clientId, forKey: .clientId)
        try container.encode(self.clientName, forKey: .clientName)
        try container.encode(self.redirectUri, forKey: .redirectUri)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case clientId = "client_id"
        case clientName = "client_name"
        case redirectUri = "redirect_uri"
    }
}