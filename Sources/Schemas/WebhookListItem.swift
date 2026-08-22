import Foundation

public struct WebhookListItem: Codable, Hashable, Sendable {
    /// The API version used to format payloads sent to this webhook endpoint.
    public let apiVersion: WebhookListItemApiVersion
    /// The dated API version (Api-Version-Date) that v1 payloads for this endpoint are pinned to: events serialize exactly like a REST read at this version (the native serializer where the resource has one). Null when unpinned — legacy (v2/v5) webhooks, and v1 webhooks on the legacy payload shape.
    public let apiVersionDate: Nullable<String>
    /// Whether events are sent for child resources. For example, if the webhook is on an account, enabling this sends events only from its connected accounts.
    public let childResourceEvents: Bool
    /// Number of consecutive deliveries whose first attempt to this endpoint failed since it last accepted one. Later retries of the same delivery do not increment it. Resets to `0` when a delivery succeeds or the webhook is re-enabled.
    public let consecutiveFailures: Int
    /// When the webhook was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// When Whop automatically disabled this webhook, as an ISO 8601 timestamp. `null` unless the webhook was disabled by Whop; a webhook you disabled yourself has `enabled: false` and a `null` `disabled_at`.
    public let disabledAt: Nullable<String>
    /// Why Whop disabled this webhook. `delivery_failures` means every delivery failed for 3 days straight. `null` when `disabled_at` is `null`.
    public let disabledReason: Nullable<WebhookListItemDisabledReason>
    /// Whether this webhook endpoint is currently active and receiving events.
    public let enabled: Bool
    public let events: [WebhookListItemEventsItem]
    /// When the current failure streak began, as an ISO 8601 timestamp. Unlike `last_failure_at`, this is set on the streak's first failed attempt, so it shows an endpoint that is failing right now. `null` when the endpoint is healthy.
    public let failingSince: Nullable<String>
    /// Webhook ID, prefixed `hook_`.
    public let id: String
    /// When a delivery to this endpoint most recently failed after exhausting retries, as an ISO 8601 timestamp. `null` if no delivery has ever failed.
    public let lastFailureAt: Nullable<String>
    /// ID of the resource (account or app) this webhook is attached to.
    public let resourceId: String
    /// Destination URL where webhook payloads are delivered via HTTP POST.
    public let url: String
    /// Secret key used to sign webhook payloads for verification. Include this in your HMAC validation logic. Returned on the create response and to interactive dashboard sessions; `null` for API-key and OAuth callers on later reads.
    public let webhookSecret: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        apiVersion: WebhookListItemApiVersion,
        apiVersionDate: Nullable<String>,
        childResourceEvents: Bool,
        consecutiveFailures: Int,
        createdAt: String,
        disabledAt: Nullable<String>,
        disabledReason: Nullable<WebhookListItemDisabledReason>,
        enabled: Bool,
        events: [WebhookListItemEventsItem],
        failingSince: Nullable<String>,
        id: String,
        lastFailureAt: Nullable<String>,
        resourceId: String,
        url: String,
        webhookSecret: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.apiVersion = apiVersion
        self.apiVersionDate = apiVersionDate
        self.childResourceEvents = childResourceEvents
        self.consecutiveFailures = consecutiveFailures
        self.createdAt = createdAt
        self.disabledAt = disabledAt
        self.disabledReason = disabledReason
        self.enabled = enabled
        self.events = events
        self.failingSince = failingSince
        self.id = id
        self.lastFailureAt = lastFailureAt
        self.resourceId = resourceId
        self.url = url
        self.webhookSecret = webhookSecret
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiVersion = try container.decode(WebhookListItemApiVersion.self, forKey: .apiVersion)
        self.apiVersionDate = try container.decode(Nullable<String>.self, forKey: .apiVersionDate)
        self.childResourceEvents = try container.decode(Bool.self, forKey: .childResourceEvents)
        self.consecutiveFailures = try container.decode(Int.self, forKey: .consecutiveFailures)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.disabledAt = try container.decode(Nullable<String>.self, forKey: .disabledAt)
        self.disabledReason = try container.decode(Nullable<WebhookListItemDisabledReason>.self, forKey: .disabledReason)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.events = try container.decode([WebhookListItemEventsItem].self, forKey: .events)
        self.failingSince = try container.decode(Nullable<String>.self, forKey: .failingSince)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastFailureAt = try container.decode(Nullable<String>.self, forKey: .lastFailureAt)
        self.resourceId = try container.decode(String.self, forKey: .resourceId)
        self.url = try container.decode(String.self, forKey: .url)
        self.webhookSecret = try container.decode(Nullable<String>.self, forKey: .webhookSecret)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.apiVersion, forKey: .apiVersion)
        try container.encode(self.apiVersionDate, forKey: .apiVersionDate)
        try container.encode(self.childResourceEvents, forKey: .childResourceEvents)
        try container.encode(self.consecutiveFailures, forKey: .consecutiveFailures)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.disabledAt, forKey: .disabledAt)
        try container.encode(self.disabledReason, forKey: .disabledReason)
        try container.encode(self.enabled, forKey: .enabled)
        try container.encode(self.events, forKey: .events)
        try container.encode(self.failingSince, forKey: .failingSince)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastFailureAt, forKey: .lastFailureAt)
        try container.encode(self.resourceId, forKey: .resourceId)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.webhookSecret, forKey: .webhookSecret)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case apiVersion = "api_version"
        case apiVersionDate = "api_version_date"
        case childResourceEvents = "child_resource_events"
        case consecutiveFailures = "consecutive_failures"
        case createdAt = "created_at"
        case disabledAt = "disabled_at"
        case disabledReason = "disabled_reason"
        case enabled
        case events
        case failingSince = "failing_since"
        case id
        case lastFailureAt = "last_failure_at"
        case resourceId = "resource_id"
        case url
        case webhookSecret = "webhook_secret"
    }
}