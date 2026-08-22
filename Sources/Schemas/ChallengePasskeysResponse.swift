import Foundation

public struct ChallengePasskeysResponse: Codable, Hashable, Sendable {
    /// The challenge to pass to the WebAuthn ceremony, base64url-encoded without padding.
    public let challenge: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        challenge: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.challenge = challenge
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.challenge = try container.decode(String.self, forKey: .challenge)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.challenge, forKey: .challenge)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case challenge
    }
}