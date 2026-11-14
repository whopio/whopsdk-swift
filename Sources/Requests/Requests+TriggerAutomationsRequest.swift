import Foundation

extension Requests {
    public struct TriggerAutomationsRequest: Codable, Hashable, Sendable {
        /// Who to enroll: up to 1,000 member IDs, or an object of `GET /members` filters. An empty object enrolls every member.
        public let members: TriggerAutomationsRequestMembers
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            members: TriggerAutomationsRequestMembers,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.members = members
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.members = try container.decode(TriggerAutomationsRequestMembers.self, forKey: .members)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.members, forKey: .members)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case members
        }
    }
}