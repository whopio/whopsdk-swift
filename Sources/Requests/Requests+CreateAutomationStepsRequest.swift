import Foundation

extension Requests {
    public struct CreateAutomationStepsRequest: Codable, Hashable, Sendable {
        /// What the step does: `wait` holds the member for `config.delay_seconds`, `email` emails them, and `message` sends them a message from a team member. A draft step can switch between `email` and `message`, which clears `config.sender_id`. A `wait` can't become a sending step, or the other way round.
        public let actionType: CreateAutomationStepsRequestActionType
        /// ID of the automation to add the step to, prefixed `ato_`.
        public let automationId: String
        public let config: AutomationStepConfig?
        /// ID of the draft step the new one runs after, prefixed `atos_`. Leave it out to make the new step run first.
        public let previousStepId: Nullable<String>?
        /// An `email` or `message` step's code: a TSX module whose default export gets the member and returns `message.send()`, `message.skip()` or `message.exit()` from `whop:message`. An `email` step sends its `subject`, its `react` element as the body and its `text` as the plain-text part. A `message` step sends its `text`. The code can import `react` and `@react-email/components`. It reads the account through the `whop` client from `whop:message`, which can only read. That client holds every account-level `:read` permission that both the admin role and Whop AI hold, except `payout:account:read`, as listed for previewing a step. Setting it, or previewing the step, needs every one of those permissions. Up to 64,000 characters. `null` on a `wait`, and until it is written.
        public let sourceCode: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            actionType: CreateAutomationStepsRequestActionType,
            automationId: String,
            config: AutomationStepConfig? = nil,
            previousStepId: Nullable<String>? = nil,
            sourceCode: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.actionType = actionType
            self.automationId = automationId
            self.config = config
            self.previousStepId = previousStepId
            self.sourceCode = sourceCode
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.actionType = try container.decode(CreateAutomationStepsRequestActionType.self, forKey: .actionType)
            self.automationId = try container.decode(String.self, forKey: .automationId)
            self.config = try container.decodeIfPresent(AutomationStepConfig.self, forKey: .config)
            self.previousStepId = try container.decodeNullableIfPresent(String.self, forKey: .previousStepId)
            self.sourceCode = try container.decodeNullableIfPresent(String.self, forKey: .sourceCode)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.actionType, forKey: .actionType)
            try container.encode(self.automationId, forKey: .automationId)
            try container.encodeIfPresent(self.config, forKey: .config)
            try container.encodeNullableIfPresent(self.previousStepId, forKey: .previousStepId)
            try container.encodeNullableIfPresent(self.sourceCode, forKey: .sourceCode)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case actionType = "action_type"
            case automationId = "automation_id"
            case config
            case previousStepId = "previous_step_id"
            case sourceCode = "source_code"
        }
    }
}