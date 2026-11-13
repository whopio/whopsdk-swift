import Foundation

public struct PasskeyCreationOptions: Codable, Hashable, Sendable {
    /// Whop does not ask for attestation.
    public let attestation: PasskeyCreationOptionsAttestation
    /// What the authenticator must support.
    public let authenticatorSelection: PasskeyAuthenticatorSelection
    /// The registration challenge, base64url-encoded without padding.
    public let challenge: String
    public let excludeCredentials: [PasskeyCredentialDescriptor]
    /// The WebAuthn extensions to run.
    public let extensions: PasskeyCreationExtensions
    public let pubKeyCredParams: [PasskeyCredentialParameter]
    /// The site the passkey belongs to.
    public let rp: PasskeyRelyingParty
    /// How long the ceremony may take, in milliseconds. Matches the challenge's lifetime.
    public let timeout: Int
    /// The account the passkey signs in to.
    public let user: PasskeyUserEntity
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        attestation: PasskeyCreationOptionsAttestation,
        authenticatorSelection: PasskeyAuthenticatorSelection,
        challenge: String,
        excludeCredentials: [PasskeyCredentialDescriptor],
        extensions: PasskeyCreationExtensions,
        pubKeyCredParams: [PasskeyCredentialParameter],
        rp: PasskeyRelyingParty,
        timeout: Int,
        user: PasskeyUserEntity,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.attestation = attestation
        self.authenticatorSelection = authenticatorSelection
        self.challenge = challenge
        self.excludeCredentials = excludeCredentials
        self.extensions = extensions
        self.pubKeyCredParams = pubKeyCredParams
        self.rp = rp
        self.timeout = timeout
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attestation = try container.decode(PasskeyCreationOptionsAttestation.self, forKey: .attestation)
        self.authenticatorSelection = try container.decode(PasskeyAuthenticatorSelection.self, forKey: .authenticatorSelection)
        self.challenge = try container.decode(String.self, forKey: .challenge)
        self.excludeCredentials = try container.decode([PasskeyCredentialDescriptor].self, forKey: .excludeCredentials)
        self.extensions = try container.decode(PasskeyCreationExtensions.self, forKey: .extensions)
        self.pubKeyCredParams = try container.decode([PasskeyCredentialParameter].self, forKey: .pubKeyCredParams)
        self.rp = try container.decode(PasskeyRelyingParty.self, forKey: .rp)
        self.timeout = try container.decode(Int.self, forKey: .timeout)
        self.user = try container.decode(PasskeyUserEntity.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.attestation, forKey: .attestation)
        try container.encode(self.authenticatorSelection, forKey: .authenticatorSelection)
        try container.encode(self.challenge, forKey: .challenge)
        try container.encode(self.excludeCredentials, forKey: .excludeCredentials)
        try container.encode(self.extensions, forKey: .extensions)
        try container.encode(self.pubKeyCredParams, forKey: .pubKeyCredParams)
        try container.encode(self.rp, forKey: .rp)
        try container.encode(self.timeout, forKey: .timeout)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case attestation
        case authenticatorSelection = "authenticator_selection"
        case challenge
        case excludeCredentials = "exclude_credentials"
        case extensions
        case pubKeyCredParams = "pub_key_cred_params"
        case rp
        case timeout
        case user
    }
}