import Foundation

public struct AppApiKey: Codable, Hashable, Sendable {
    /// When the key was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// The key's secret token, sent as a bearer token to authenticate requests on the app's behalf.
    public let token: String
    /// The unique identifier for the private api key.
    public let id: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: String,
        token: String,
        id: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.token = token
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.token = try container.decode(String.self, forKey: .token)
        self.id = try container.decode(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.token, forKey: .token)
        try container.encode(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case token
        case id
    }
}