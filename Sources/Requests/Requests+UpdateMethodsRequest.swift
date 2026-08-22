import Foundation

extension Requests {
    public struct UpdateMethodsRequest: Codable, Hashable, Sendable {
        /// New label for the payout method, with at least one non-whitespace character and a maximum of 100 characters.
        public let nickname: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            nickname: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.nickname = nickname
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.nickname = try container.decode(String.self, forKey: .nickname)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.nickname, forKey: .nickname)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case nickname
        }
    }
}