import Foundation

extension Requests {
    public struct CreatePasskeysRequest: Codable, Hashable, Sendable {
        /// The `attestationObject` from the WebAuthn attestation response, base64url-encoded.
        public let attestationObject: String
        /// The `clientDataJSON` from the WebAuthn attestation response, base64url-encoded.
        public let clientDataJson: String
        /// The WebAuthn credential ID the authenticator returned, base64url-encoded.
        public let credentialId: String
        /// A name for this passkey, usually the device it lives on. 255 characters or fewer.
        public let nickname: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            attestationObject: String,
            clientDataJson: String,
            credentialId: String,
            nickname: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.attestationObject = attestationObject
            self.clientDataJson = clientDataJson
            self.credentialId = credentialId
            self.nickname = nickname
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.attestationObject = try container.decode(String.self, forKey: .attestationObject)
            self.clientDataJson = try container.decode(String.self, forKey: .clientDataJson)
            self.credentialId = try container.decode(String.self, forKey: .credentialId)
            self.nickname = try container.decode(String.self, forKey: .nickname)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.attestationObject, forKey: .attestationObject)
            try container.encode(self.clientDataJson, forKey: .clientDataJson)
            try container.encode(self.credentialId, forKey: .credentialId)
            try container.encode(self.nickname, forKey: .nickname)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case attestationObject = "attestation_object"
            case clientDataJson = "client_data_json"
            case credentialId = "credential_id"
            case nickname
        }
    }
}