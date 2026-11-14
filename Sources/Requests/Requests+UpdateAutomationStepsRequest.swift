import Foundation

extension Requests {
    public struct UpdateAutomationStepsRequest: Codable, Hashable, Sendable {
        /// What the step does: `wait` holds the member for `config.delay_seconds`, `email` emails them, and `message` sends them a message from a team member. A draft step can switch between `email` and `message`, which clears `config.sender_id`. A `wait` can't become a sending step, or the other way round.
        public let actionType: UpdateAutomationStepsRequestActionType?
        public let config: AutomationStepConfig?
        /// An `email` or `message` step's code: a TSX module whose default export gets the member and returns `message.send()`, `message.skip()` or `message.exit()` from `whop:message`. An `email` step sends its `subject`, its `react` element as the body and its `text` as the plain-text part. A `message` step sends its `text`. The code can import `react` and `@react-email/components`. It reads the account through the `whop` client from `whop:message`, which can only read. That client holds every account-level `:read` permission that both the admin role and Whop AI hold, except `payout:account:read`, as listed for previewing a step. Setting it, or previewing the step, needs every one of those permissions. Up to 64,000 characters. `null` on a `wait`, and until it is written.
        public let sourceCode: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            actionType: UpdateAutomationStepsRequestActionType? = nil,
            config: AutomationStepConfig? = nil,
            sourceCode: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.actionType = actionType
            self.config = config
            self.sourceCode = sourceCode
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.actionType = try container.decodeIfPresent(UpdateAutomationStepsRequestActionType.self, forKey: .actionType)
            self.config = try container.decodeIfPresent(AutomationStepConfig.self, forKey: .config)
            self.sourceCode = try container.decodeNullableIfPresent(String.self, forKey: .sourceCode)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.actionType, forKey: .actionType)
            try container.encodeIfPresent(self.config, forKey: .config)
            try container.encodeNullableIfPresent(self.sourceCode, forKey: .sourceCode)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case actionType = "action_type"
            case config
            case sourceCode = "source_code"
        }
    }
}