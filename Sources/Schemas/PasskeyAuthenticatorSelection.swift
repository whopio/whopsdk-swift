import Foundation

public struct PasskeyAuthenticatorSelection: Codable, Hashable, Sendable {
    /// Always `true`. The older form of `resident_key`, for authenticators that predate it.
    public let requireResidentKey: Bool
    /// The authenticator must store a discoverable passkey, so it can sign in without a username.
    public let residentKey: PasskeyAuthenticatorSelectionResidentKey
    /// The authenticator must verify the user, with a biometric or the device's screen lock.
    public let userVerification: PasskeyAuthenticatorSelectionUserVerification
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        requireResidentKey: Bool,
        residentKey: PasskeyAuthenticatorSelectionResidentKey,
        userVerification: PasskeyAuthenticatorSelectionUserVerification,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.requireResidentKey = requireResidentKey
        self.residentKey = residentKey
        self.userVerification = userVerification
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.requireResidentKey = try container.decode(Bool.self, forKey: .requireResidentKey)
        self.residentKey = try container.decode(PasskeyAuthenticatorSelectionResidentKey.self, forKey: .residentKey)
        self.userVerification = try container.decode(PasskeyAuthenticatorSelectionUserVerification.self, forKey: .userVerification)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.requireResidentKey, forKey: .requireResidentKey)
        try container.encode(self.residentKey, forKey: .residentKey)
        try container.encode(self.userVerification, forKey: .userVerification)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case requireResidentKey = "require_resident_key"
        case residentKey = "resident_key"
        case userVerification = "user_verification"
    }
}