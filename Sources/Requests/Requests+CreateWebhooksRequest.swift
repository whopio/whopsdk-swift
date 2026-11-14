import Foundation

extension Requests {
    public struct CreateWebhooksRequest: Codable, Hashable, Sendable {
        /// The dated API version (Api-Version-Date) to pin this webhook's payloads to. Omit to leave the webhook unpinned, tracking the current payload shape.
        public let apiVersionDate: Nullable<String>?
        /// Whether to send events for child resources. For example, if the webhook is created for an account, enabling this sends events only from its subaccounts.
        public let childResourceEvents: Bool?
        /// Whether or not the webhook is enabled. Defaults to `true`.
        public let enabled: Bool?
        /// The events to send the webhook for, in dot form (for example `payment.succeeded`).
        public let events: [CreateWebhooksRequestEventsItem]?
        /// The account or app to create the webhook for. Defaults to the current account.
        public let resourceId: Nullable<String>?
        /// A label for the webhook, shown in the dashboard. Up to 255 characters.
        public let title: Nullable<String>?
        /// The URL to send the webhook to.
        public let url: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiVersionDate: Nullable<String>? = nil,
            childResourceEvents: Bool? = nil,
            enabled: Bool? = nil,
            events: [CreateWebhooksRequestEventsItem]? = nil,
            resourceId: Nullable<String>? = nil,
            title: Nullable<String>? = nil,
            url: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiVersionDate = apiVersionDate
            self.childResourceEvents = childResourceEvents
            self.enabled = enabled
            self.events = events
            self.resourceId = resourceId
            self.title = title
            self.url = url
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiVersionDate = try container.decodeNullableIfPresent(String.self, forKey: .apiVersionDate)
            self.childResourceEvents = try container.decodeIfPresent(Bool.self, forKey: .childResourceEvents)
            self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
            self.events = try container.decodeIfPresent([CreateWebhooksRequestEventsItem].self, forKey: .events)
            self.resourceId = try container.decodeNullableIfPresent(String.self, forKey: .resourceId)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.url = try container.decode(String.self, forKey: .url)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.apiVersionDate, forKey: .apiVersionDate)
            try container.encodeIfPresent(self.childResourceEvents, forKey: .childResourceEvents)
            try container.encodeIfPresent(self.enabled, forKey: .enabled)
            try container.encodeIfPresent(self.events, forKey: .events)
            try container.encodeNullableIfPresent(self.resourceId, forKey: .resourceId)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
            try container.encode(self.url, forKey: .url)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case apiVersionDate = "api_version_date"
            case childResourceEvents = "child_resource_events"
            case enabled
            case events
            case resourceId = "resource_id"
            case title
            case url
        }
    }
}