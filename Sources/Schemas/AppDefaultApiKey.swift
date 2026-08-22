import Foundation

public struct AppDefaultApiKey: Codable, Hashable, Sendable {
    /// API key ID, prefixed `apik_`.
    public let id: String
    /// Human-readable name identifying the API key, or `null` when none was set.
    public let name: Nullable<String>
    /// Masked version of the secret key, so the key can be recognized without revealing the full secret.
    public let obfuscatedSecretKey: String
    /// The full secret used to authenticate requests. `null` unless the caller could have created the key themselves.
    public let secretKey: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: Nullable<String>,
        obfuscatedSecretKey: String,
        secretKey: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.obfuscatedSecretKey = obfuscatedSecretKey
        self.secretKey = secretKey
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.obfuscatedSecretKey = try container.decode(String.self, forKey: .obfuscatedSecretKey)
        self.secretKey = try container.decode(Nullable<String>.self, forKey: .secretKey)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.obfuscatedSecretKey, forKey: .obfuscatedSecretKey)
        try container.encode(self.secretKey, forKey: .secretKey)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case obfuscatedSecretKey = "obfuscated_secret_key"
        case secretKey = "secret_key"
    }
}