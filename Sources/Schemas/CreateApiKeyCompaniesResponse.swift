import Foundation

/// An API key created for a child company, including the one-time secret key.
public struct CreateApiKeyCompaniesResponse: Codable, Hashable, Sendable {
    /// The unique identifier for the authorized api key.
    public let id: String
    /// A user set name to identify an API key
    public let name: Nullable<String>
    /// The secret key used to authenticate requests. Only returned at creation time.
    public let secretKey: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: Nullable<String>,
        secretKey: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.secretKey = secretKey
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.secretKey = try container.decode(String.self, forKey: .secretKey)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.secretKey, forKey: .secretKey)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case secretKey = "secret_key"
    }
}