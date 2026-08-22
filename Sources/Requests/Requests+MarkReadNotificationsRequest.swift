import Foundation

extension Requests {
    public struct MarkReadNotificationsRequest: Codable, Hashable, Sendable {
        /// Pass `true` to mark every notification read. Exactly one of `experience_id` or `all` is required.
        public let all: Bool?
        /// Experience to mark read (`exp_` tag). Exactly one of `experience_id` or `all` is required.
        public let experienceId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            all: Bool? = nil,
            experienceId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.all = all
            self.experienceId = experienceId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.all = try container.decodeIfPresent(Bool.self, forKey: .all)
            self.experienceId = try container.decodeIfPresent(String.self, forKey: .experienceId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.all, forKey: .all)
            try container.encodeIfPresent(self.experienceId, forKey: .experienceId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case all
            case experienceId = "experience_id"
        }
    }
}