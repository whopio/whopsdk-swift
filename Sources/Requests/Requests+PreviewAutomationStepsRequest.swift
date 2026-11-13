import Foundation

extension Requests {
    public struct PreviewAutomationStepsRequest: Codable, Hashable, Sendable {
        /// The member to preview the step for, prefixed `mber_`.
        public let memberId: String
        /// ID of the record the automation's trigger event was about for this member, such as a `pay_` payment.
        public let triggerResourceId: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            memberId: String,
            triggerResourceId: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.memberId = memberId
            self.triggerResourceId = triggerResourceId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.memberId = try container.decode(String.self, forKey: .memberId)
            self.triggerResourceId = try container.decodeNullableIfPresent(String.self, forKey: .triggerResourceId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.memberId, forKey: .memberId)
            try container.encodeNullableIfPresent(self.triggerResourceId, forKey: .triggerResourceId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case memberId = "member_id"
            case triggerResourceId = "trigger_resource_id"
        }
    }
}