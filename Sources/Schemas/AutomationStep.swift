import Foundation

public struct AutomationStep: Codable, Hashable, Sendable {
    /// What the step does: `wait` holds the member for `config.delay_seconds`, `email` emails them, and `message` sends them a message from a team member. A draft step can switch between `email` and `message`, which clears `config.sender_id`. A `wait` can't become a sending step, or the other way round.
    public let actionType: AutomationStepActionType
    /// ID of the automation the step belongs to, prefixed `ato_`.
    public let automationId: String
    /// The step's settings for its `action_type`: `delay_seconds` for a `wait`, `sender_id` for an `email` or `message`. Writing it replaces the whole object.
    public let config: AutomationStepConfig
    /// When the step was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Automation step ID, prefixed `atos_`. A step gets a new ID in every version. Its `key` stays the same.
    public let id: String
    public let issues: [String]
    /// Identifies the same step across versions. A new step gets a key no step of the automation has used.
    public let key: Int
    /// ID of the step this one runs after, prefixed `atos_`. `null` when it runs first, directly after the member enrolls.
    public let previousStepId: Nullable<String>
    /// The sender `config.sender_id` names. `null` on a `wait`, and when the step sends from the default sender.
    public let sender: Nullable<AutomationStepSender>
    /// An `email` or `message` step's code: a TSX module whose default export gets the member and returns `message.send()`, `message.skip()` or `message.exit()` from `whop:message`. An `email` step sends its `subject`, its `react` element as the body and its `text` as the plain-text part. A `message` step sends its `text`. The code can import `react` and `@react-email/components`. It reads the account through the `whop` client from `whop:message`, which can only read. That client holds every account-level `:read` permission that both the admin role and Whop AI hold, except `payout:account:read`, as listed for previewing a step. Setting it, or previewing the step, needs every one of those permissions. Up to 64,000 characters. `null` on a `wait`, and until it is written.
    public let sourceCode: Nullable<String>
    /// When the step was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// The automation version this step is part of. Only the draft version's steps can change.
    public let version: Int
    /// Members on this step's version who are waiting for it to run.
    public let waitingEnrollmentsCount: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        actionType: AutomationStepActionType,
        automationId: String,
        config: AutomationStepConfig,
        createdAt: String,
        id: String,
        issues: [String],
        key: Int,
        previousStepId: Nullable<String>,
        sender: Nullable<AutomationStepSender>,
        sourceCode: Nullable<String>,
        updatedAt: String,
        version: Int,
        waitingEnrollmentsCount: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.actionType = actionType
        self.automationId = automationId
        self.config = config
        self.createdAt = createdAt
        self.id = id
        self.issues = issues
        self.key = key
        self.previousStepId = previousStepId
        self.sender = sender
        self.sourceCode = sourceCode
        self.updatedAt = updatedAt
        self.version = version
        self.waitingEnrollmentsCount = waitingEnrollmentsCount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actionType = try container.decode(AutomationStepActionType.self, forKey: .actionType)
        self.automationId = try container.decode(String.self, forKey: .automationId)
        self.config = try container.decode(AutomationStepConfig.self, forKey: .config)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.issues = try container.decode([String].self, forKey: .issues)
        self.key = try container.decode(Int.self, forKey: .key)
        self.previousStepId = try container.decode(Nullable<String>.self, forKey: .previousStepId)
        self.sender = try container.decode(Nullable<AutomationStepSender>.self, forKey: .sender)
        self.sourceCode = try container.decode(Nullable<String>.self, forKey: .sourceCode)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.version = try container.decode(Int.self, forKey: .version)
        self.waitingEnrollmentsCount = try container.decode(Int.self, forKey: .waitingEnrollmentsCount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.actionType, forKey: .actionType)
        try container.encode(self.automationId, forKey: .automationId)
        try container.encode(self.config, forKey: .config)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.issues, forKey: .issues)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.previousStepId, forKey: .previousStepId)
        try container.encode(self.sender, forKey: .sender)
        try container.encode(self.sourceCode, forKey: .sourceCode)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.version, forKey: .version)
        try container.encode(self.waitingEnrollmentsCount, forKey: .waitingEnrollmentsCount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case actionType = "action_type"
        case automationId = "automation_id"
        case config
        case createdAt = "created_at"
        case id
        case issues
        case key
        case previousStepId = "previous_step_id"
        case sender
        case sourceCode = "source_code"
        case updatedAt = "updated_at"
        case version
        case waitingEnrollmentsCount = "waiting_enrollments_count"
    }
}