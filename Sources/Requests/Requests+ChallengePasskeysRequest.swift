import Foundation

extension Requests {
    public struct ChallengePasskeysRequest: Codable, Hashable, Sendable {
        /// The ceremony this challenge is for.
        public let challengeType: ChallengePasskeysRequestChallengeType
        /// The passkey the ceremony targets, prefixed `wcred_`. Required when `challenge_type` is `deletion`, ignored otherwise.
        public let passkeyId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            challengeType: ChallengePasskeysRequestChallengeType,
            passkeyId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.challengeType = challengeType
            self.passkeyId = passkeyId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.challengeType = try container.decode(ChallengePasskeysRequestChallengeType.self, forKey: .challengeType)
            self.passkeyId = try container.decodeIfPresent(String.self, forKey: .passkeyId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.challengeType, forKey: .challengeType)
            try container.encodeIfPresent(self.passkeyId, forKey: .passkeyId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case challengeType = "challenge_type"
            case passkeyId = "passkey_id"
        }
    }
}