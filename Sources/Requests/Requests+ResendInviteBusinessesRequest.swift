import Foundation

extension Requests {
    public struct ResendInviteBusinessesRequest: Codable, Hashable, Sendable {
        /// The outstanding invite to resend (an ausri_ identifier from `pending_owner_invites`).
        public let inviteId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            inviteId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.inviteId = inviteId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.inviteId = try container.decode(String.self, forKey: .inviteId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.inviteId, forKey: .inviteId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case inviteId = "invite_id"
        }
    }
}