import Foundation

public struct Passkey: Codable, Hashable, Sendable {
    /// When the user registered this passkey, as an ISO 8601 timestamp.
    public let createdAt: String
    /// The WebAuthn credential ID as a base64url string. Pass it in `allowCredentials` when you run a ceremony against this specific passkey.
    public let credentialId: String
    /// Passkey ID, prefixed `wcred_`. Use it to delete the passkey.
    public let id: String
    /// When this passkey last completed a WebAuthn ceremony, as an ISO 8601 timestamp, or `null` if it never has.
    public let lastUsedAt: Nullable<String>
    /// The name the user gave this passkey, usually the device it lives on.
    public let nickname: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: String,
        credentialId: String,
        id: String,
        lastUsedAt: Nullable<String>,
        nickname: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.credentialId = credentialId
        self.id = id
        self.lastUsedAt = lastUsedAt
        self.nickname = nickname
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.credentialId = try container.decode(String.self, forKey: .credentialId)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastUsedAt = try container.decode(Nullable<String>.self, forKey: .lastUsedAt)
        self.nickname = try container.decode(String.self, forKey: .nickname)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.credentialId, forKey: .credentialId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastUsedAt, forKey: .lastUsedAt)
        try container.encode(self.nickname, forKey: .nickname)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case credentialId = "credential_id"
        case id
        case lastUsedAt = "last_used_at"
        case nickname
    }
}