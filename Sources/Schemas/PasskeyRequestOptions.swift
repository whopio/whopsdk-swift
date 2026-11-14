import Foundation

public struct PasskeyRequestOptions: Codable, Hashable, Sendable {
    public let allowCredentials: [PasskeyCredentialDescriptor]
    /// The assertion challenge, base64url-encoded without padding.
    public let challenge: String
    /// The site the passkey belongs to.
    public let rpId: String
    /// How long the ceremony may take, in milliseconds. Matches the challenge's lifetime.
    public let timeout: Int
    /// The authenticator must verify the user, with a biometric or the device's screen lock.
    public let userVerification: PasskeyRequestOptionsUserVerification
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        allowCredentials: [PasskeyCredentialDescriptor],
        challenge: String,
        rpId: String,
        timeout: Int,
        userVerification: PasskeyRequestOptionsUserVerification,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.allowCredentials = allowCredentials
        self.challenge = challenge
        self.rpId = rpId
        self.timeout = timeout
        self.userVerification = userVerification
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.allowCredentials = try container.decode([PasskeyCredentialDescriptor].self, forKey: .allowCredentials)
        self.challenge = try container.decode(String.self, forKey: .challenge)
        self.rpId = try container.decode(String.self, forKey: .rpId)
        self.timeout = try container.decode(Int.self, forKey: .timeout)
        self.userVerification = try container.decode(PasskeyRequestOptionsUserVerification.self, forKey: .userVerification)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.allowCredentials, forKey: .allowCredentials)
        try container.encode(self.challenge, forKey: .challenge)
        try container.encode(self.rpId, forKey: .rpId)
        try container.encode(self.timeout, forKey: .timeout)
        try container.encode(self.userVerification, forKey: .userVerification)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case allowCredentials = "allow_credentials"
        case challenge
        case rpId = "rp_id"
        case timeout
        case userVerification = "user_verification"
    }
}