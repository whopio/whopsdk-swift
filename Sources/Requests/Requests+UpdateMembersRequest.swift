import Foundation

extension Requests {
    public struct UpdateMembersRequest: Codable, Hashable, Sendable {
        /// Your own key-value data on this member. Up to 50 keys of at most 100 characters. Values are strings of at most 500 characters, numbers, `true`, `false`, or `null`. At most 200 KB. Replaces existing metadata, and `null` clears it. Requires `member:manage`.
        public let metadata: Nullable<[String: Nullable<UpdateMembersRequestMetadataValue>]>?
        /// The name invoices show for this member, in place of the user's own. `null` clears it. Requires `member:manage`.
        public let name: Nullable<String>?
        /// `unsubscribed` to opt out of the account's marketing, `null` to opt back in. Only the member can set it, with `user:notifications:update`.
        public let unsubscribeStatus: Nullable<UpdateMembersRequestUnsubscribeStatus>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            metadata: Nullable<[String: Nullable<UpdateMembersRequestMetadataValue>]>? = nil,
            name: Nullable<String>? = nil,
            unsubscribeStatus: Nullable<UpdateMembersRequestUnsubscribeStatus>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.metadata = metadata
            self.name = name
            self.unsubscribeStatus = unsubscribeStatus
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.metadata = try container.decodeNullableIfPresent([String: Nullable<UpdateMembersRequestMetadataValue>].self, forKey: .metadata)
            self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
            self.unsubscribeStatus = try container.decodeNullableIfPresent(UpdateMembersRequestUnsubscribeStatus.self, forKey: .unsubscribeStatus)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.name, forKey: .name)
            try container.encodeNullableIfPresent(self.unsubscribeStatus, forKey: .unsubscribeStatus)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case metadata
            case name
            case unsubscribeStatus = "unsubscribe_status"
        }
    }
}