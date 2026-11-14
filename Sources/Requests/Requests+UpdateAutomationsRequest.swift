import Foundation

extension Requests {
    public struct UpdateAutomationsRequest: Codable, Hashable, Sendable {
        /// The automation's name, shown on the dashboard. Up to 255 characters.
        public let name: String?
        /// Secrets to set, by name, merged into the automation's: a name set to `null` is removed. Step code reads them as environment variables, and no endpoint returns their values. Names are uppercase letters, digits and underscores, starting with a letter, up to 64 characters. Up to 50 secrets, each up to 4 KB.
        public let secrets: [String: Nullable<String>]?
        /// `active` enrolls members and runs their steps. `closed` stops new enrollments and lets members already in it finish. `stopped` stops new enrollments and ends every member's enrollment. `active` and `closed` need a published version.
        public let status: UpdateAutomationsRequestStatus?
        /// The webhook event that enrolls the member it's about, such as `payment.succeeded`. `null` for an automation that only `POST /automations/{id}/trigger` enrolls into. Fixed once the automation has been published.
        public let triggerEvent: Nullable<UpdateAutomationsRequestTriggerEvent>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            name: String? = nil,
            secrets: [String: Nullable<String>]? = nil,
            status: UpdateAutomationsRequestStatus? = nil,
            triggerEvent: Nullable<UpdateAutomationsRequestTriggerEvent>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.name = name
            self.secrets = secrets
            self.status = status
            self.triggerEvent = triggerEvent
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.secrets = try container.decodeIfPresent([String: Nullable<String>].self, forKey: .secrets)
            self.status = try container.decodeIfPresent(UpdateAutomationsRequestStatus.self, forKey: .status)
            self.triggerEvent = try container.decodeNullableIfPresent(UpdateAutomationsRequestTriggerEvent.self, forKey: .triggerEvent)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.secrets, forKey: .secrets)
            try container.encodeIfPresent(self.status, forKey: .status)
            try container.encodeNullableIfPresent(self.triggerEvent, forKey: .triggerEvent)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case name
            case secrets
            case status
            case triggerEvent = "trigger_event"
        }
    }
}