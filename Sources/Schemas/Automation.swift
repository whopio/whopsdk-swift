import Foundation

public struct Automation: Codable, Hashable, Sendable {
    /// ID of the account the automation belongs to, prefixed `biz_`.
    public let accountId: String
    /// Members currently in the automation.
    public let activeEnrollmentsCount: Int
    /// When the automation was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Who created the automation.
    public let createdByActor: AutomationActor
    /// The version that step edits change. Always `published_version` plus one, or `1` before the first publish.
    public let draftVersion: Int
    /// Whether the draft has edits that `POST /automations/{id}/publish` would publish. Always `true` before the first publish.
    public let hasUnpublishedChanges: Bool
    /// Automation ID, prefixed `ato_`.
    public let id: String
    /// The automation's name, shown on the dashboard. Up to 255 characters.
    public let name: String
    /// When the automation was last published, as an ISO 8601 timestamp. `null` until its first publish.
    public let publishedAt: Nullable<String>
    /// Who last published the automation. `null` until its first publish.
    public let publishedByActor: Nullable<AutomationActor>
    /// The version new members start on. `null` until the automation is first published.
    public let publishedVersion: Nullable<Int>
    public let secretNames: [String]
    /// `active` enrolls members and runs their steps. `closed` enrolls no one new, and members already in it finish. `stopped` enrolls no one, and its members' enrollments have ended. A new automation is `stopped` until its first publish makes it `active`.
    public let status: AutomationStatus
    /// How many times members have enrolled in the automation, including enrollments that have ended.
    public let totalEnrollmentsCount: Int
    /// The webhook event that enrolls the member it's about, such as `payment.succeeded`. `null` for an automation that only `POST /automations/{id}/trigger` enrolls into. Fixed once the automation has been published.
    public let triggerEvent: Nullable<AutomationTriggerEvent>
    /// When the automation was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        activeEnrollmentsCount: Int,
        createdAt: String,
        createdByActor: AutomationActor,
        draftVersion: Int,
        hasUnpublishedChanges: Bool,
        id: String,
        name: String,
        publishedAt: Nullable<String>,
        publishedByActor: Nullable<AutomationActor>,
        publishedVersion: Nullable<Int>,
        secretNames: [String],
        status: AutomationStatus,
        totalEnrollmentsCount: Int,
        triggerEvent: Nullable<AutomationTriggerEvent>,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.activeEnrollmentsCount = activeEnrollmentsCount
        self.createdAt = createdAt
        self.createdByActor = createdByActor
        self.draftVersion = draftVersion
        self.hasUnpublishedChanges = hasUnpublishedChanges
        self.id = id
        self.name = name
        self.publishedAt = publishedAt
        self.publishedByActor = publishedByActor
        self.publishedVersion = publishedVersion
        self.secretNames = secretNames
        self.status = status
        self.totalEnrollmentsCount = totalEnrollmentsCount
        self.triggerEvent = triggerEvent
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.activeEnrollmentsCount = try container.decode(Int.self, forKey: .activeEnrollmentsCount)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.createdByActor = try container.decode(AutomationActor.self, forKey: .createdByActor)
        self.draftVersion = try container.decode(Int.self, forKey: .draftVersion)
        self.hasUnpublishedChanges = try container.decode(Bool.self, forKey: .hasUnpublishedChanges)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.publishedAt = try container.decode(Nullable<String>.self, forKey: .publishedAt)
        self.publishedByActor = try container.decode(Nullable<AutomationActor>.self, forKey: .publishedByActor)
        self.publishedVersion = try container.decode(Nullable<Int>.self, forKey: .publishedVersion)
        self.secretNames = try container.decode([String].self, forKey: .secretNames)
        self.status = try container.decode(AutomationStatus.self, forKey: .status)
        self.totalEnrollmentsCount = try container.decode(Int.self, forKey: .totalEnrollmentsCount)
        self.triggerEvent = try container.decode(Nullable<AutomationTriggerEvent>.self, forKey: .triggerEvent)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.activeEnrollmentsCount, forKey: .activeEnrollmentsCount)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.createdByActor, forKey: .createdByActor)
        try container.encode(self.draftVersion, forKey: .draftVersion)
        try container.encode(self.hasUnpublishedChanges, forKey: .hasUnpublishedChanges)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.publishedAt, forKey: .publishedAt)
        try container.encode(self.publishedByActor, forKey: .publishedByActor)
        try container.encode(self.publishedVersion, forKey: .publishedVersion)
        try container.encode(self.secretNames, forKey: .secretNames)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.totalEnrollmentsCount, forKey: .totalEnrollmentsCount)
        try container.encode(self.triggerEvent, forKey: .triggerEvent)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case activeEnrollmentsCount = "active_enrollments_count"
        case createdAt = "created_at"
        case createdByActor = "created_by_actor"
        case draftVersion = "draft_version"
        case hasUnpublishedChanges = "has_unpublished_changes"
        case id
        case name
        case publishedAt = "published_at"
        case publishedByActor = "published_by_actor"
        case publishedVersion = "published_version"
        case secretNames = "secret_names"
        case status
        case totalEnrollmentsCount = "total_enrollments_count"
        case triggerEvent = "trigger_event"
        case updatedAt = "updated_at"
    }
}