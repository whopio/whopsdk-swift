import Foundation

extension Requests {
    public struct DeletePasskeysRequest: Codable, Hashable, Sendable {
        /// The `authenticatorData` from the WebAuthn assertion, base64url-encoded.
        public let authenticatorData: String
        /// The `clientDataJSON` from the WebAuthn assertion, base64url-encoded.
        public let clientDataJson: String
        /// The `signature` from the WebAuthn assertion, base64url-encoded.
        public let signature: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            authenticatorData: String,
            clientDataJson: String,
            signature: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.authenticatorData = authenticatorData
            self.clientDataJson = clientDataJson
            self.signature = signature
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.authenticatorData = try container.decode(String.self, forKey: .authenticatorData)
            self.clientDataJson = try container.decode(String.self, forKey: .clientDataJson)
            self.signature = try container.decode(String.self, forKey: .signature)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.authenticatorData, forKey: .authenticatorData)
            try container.encode(self.clientDataJson, forKey: .clientDataJson)
            try container.encode(self.signature, forKey: .signature)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case authenticatorData = "authenticator_data"
            case clientDataJson = "client_data_json"
            case signature
        }
    }
}