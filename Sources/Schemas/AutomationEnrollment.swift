import Foundation

public struct AutomationEnrollment: Codable, Hashable, Sendable {
    /// ID of the account the automation belongs to, prefixed `biz_`.
    public let accountId: String
    /// ID of the automation, prefixed `ato_`.
    public let automationId: String
    /// When the member enrolled, as an ISO 8601 timestamp.
    public let createdAt: String
    /// When the enrollment ended, as an ISO 8601 timestamp. `null` while it's active.
    public let endedAt: Nullable<String>
    /// Automation enrollment ID, prefixed `atoe_`.
    public let id: String
    /// ID of the member in the automation, prefixed `mber_`.
    public let memberId: String
    /// When that step runs for this member, as an ISO 8601 timestamp. `null` once the enrollment ends.
    public let nextRunAt: Nullable<String>
    /// ID of that step in the member's version, prefixed `atos_`. `null` once the enrollment ends.
    public let nextStepId: Nullable<String>
    /// The `key` of the step the member is waiting on, in their version. `null` once the enrollment ends.
    public let nextStepKey: Nullable<Int>
    /// `active` while the member moves through the automation. `completed` after its last step. `canceled` when the account canceled the enrollment, or stopped or deleted the automation.
    public let status: AutomationEnrollmentStatus
    /// The webhook event that enrolled the member. `null` when `POST /automations/{id}/trigger` enrolled them.
    public let triggerEvent: Nullable<AutomationEnrollmentTriggerEvent>
    /// ID of the record the triggering event was about, such as a `pay_` payment or `mem_` membership. `null` when a trigger request enrolled them.
    public let triggerResourceId: Nullable<String>
    /// When the enrollment last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// ID of the member's user, prefixed `user_`. `null` when the member is another business.
    public let userId: Nullable<String>
    /// The automation version the member is on. It changes only when a publish moves members to the new version.
    public let version: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        automationId: String,
        createdAt: String,
        endedAt: Nullable<String>,
        id: String,
        memberId: String,
        nextRunAt: Nullable<String>,
        nextStepId: Nullable<String>,
        nextStepKey: Nullable<Int>,
        status: AutomationEnrollmentStatus,
        triggerEvent: Nullable<AutomationEnrollmentTriggerEvent>,
        triggerResourceId: Nullable<String>,
        updatedAt: String,
        userId: Nullable<String>,
        version: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.automationId = automationId
        self.createdAt = createdAt
        self.endedAt = endedAt
        self.id = id
        self.memberId = memberId
        self.nextRunAt = nextRunAt
        self.nextStepId = nextStepId
        self.nextStepKey = nextStepKey
        self.status = status
        self.triggerEvent = triggerEvent
        self.triggerResourceId = triggerResourceId
        self.updatedAt = updatedAt
        self.userId = userId
        self.version = version
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.automationId = try container.decode(String.self, forKey: .automationId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.endedAt = try container.decode(Nullable<String>.self, forKey: .endedAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.memberId = try container.decode(String.self, forKey: .memberId)
        self.nextRunAt = try container.decode(Nullable<String>.self, forKey: .nextRunAt)
        self.nextStepId = try container.decode(Nullable<String>.self, forKey: .nextStepId)
        self.nextStepKey = try container.decode(Nullable<Int>.self, forKey: .nextStepKey)
        self.status = try container.decode(AutomationEnrollmentStatus.self, forKey: .status)
        self.triggerEvent = try container.decode(Nullable<AutomationEnrollmentTriggerEvent>.self, forKey: .triggerEvent)
        self.triggerResourceId = try container.decode(Nullable<String>.self, forKey: .triggerResourceId)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.userId = try container.decode(Nullable<String>.self, forKey: .userId)
        self.version = try container.decode(Int.self, forKey: .version)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.automationId, forKey: .automationId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.endedAt, forKey: .endedAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.memberId, forKey: .memberId)
        try container.encode(self.nextRunAt, forKey: .nextRunAt)
        try container.encode(self.nextStepId, forKey: .nextStepId)
        try container.encode(self.nextStepKey, forKey: .nextStepKey)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.triggerEvent, forKey: .triggerEvent)
        try container.encode(self.triggerResourceId, forKey: .triggerResourceId)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.userId, forKey: .userId)
        try container.encode(self.version, forKey: .version)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case automationId = "automation_id"
        case createdAt = "created_at"
        case endedAt = "ended_at"
        case id
        case memberId = "member_id"
        case nextRunAt = "next_run_at"
        case nextStepId = "next_step_id"
        case nextStepKey = "next_step_key"
        case status
        case triggerEvent = "trigger_event"
        case triggerResourceId = "trigger_resource_id"
        case updatedAt = "updated_at"
        case userId = "user_id"
        case version
    }
}