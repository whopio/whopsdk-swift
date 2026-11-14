import Foundation

extension Requests {
    public struct CreateAutomationsRequest: Codable, Hashable, Sendable {
        /// Account ID, prefixed `biz_`. Required for user credentials; otherwise defaults to the credential's account.
        public let accountId: String?
        /// The automation's name, shown on the dashboard. Up to 255 characters.
        public let name: String
        /// The webhook event that enrolls the member it's about, such as `payment.succeeded`. `null` for an automation that only `POST /automations/{id}/trigger` enrolls into. Fixed once the automation has been published.
        public let triggerEvent: Nullable<CreateAutomationsRequestTriggerEvent>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            name: String,
            triggerEvent: Nullable<CreateAutomationsRequestTriggerEvent>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.name = name
            self.triggerEvent = triggerEvent
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.name = try container.decode(String.self, forKey: .name)
            self.triggerEvent = try container.decodeNullableIfPresent(CreateAutomationsRequestTriggerEvent.self, forKey: .triggerEvent)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encode(self.name, forKey: .name)
            try container.encodeNullableIfPresent(self.triggerEvent, forKey: .triggerEvent)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case name
            case triggerEvent = "trigger_event"
        }
    }
}