import Foundation

extension Requests {
    public struct UpdateTeamMembersRequest: Codable, Hashable, Sendable {
        /// The system role to grant. Custom roles cannot be granted through the API. The Partner role provides view-only access.
        public let role: UpdateTeamMembersRequestRole?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            role: UpdateTeamMembersRequestRole? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.role = role
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.role = try container.decodeIfPresent(UpdateTeamMembersRequestRole.self, forKey: .role)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.role, forKey: .role)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case role
        }
    }
}