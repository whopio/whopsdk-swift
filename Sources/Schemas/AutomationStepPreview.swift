import Foundation

public struct AutomationStepPreview: Codable, Hashable, Sendable {
    /// The step's action type: `email` or `message`.
    public let actionType: AutomationStepPreviewActionType
    /// The email's HTML, with Whop's footer. Its unsubscribe link is a placeholder until the email is sent. `null` unless an `email` step sends.
    public let html: Nullable<String>
    /// What the step does for this member: `sent` its message, `skipped` it and moved on to the next step, or `exited` the automation.
    public let outcome: AutomationStepPreviewOutcome
    /// The inbox preview line after the subject. `null` when the email has none.
    public let preheader: Nullable<String>
    /// Why the step skipped or exited, as the step's code said. `null` when it sends or gave no reason.
    public let reason: Nullable<String>
    /// The email's subject. `null` unless an `email` step sends.
    public let subject: Nullable<String>
    /// The message as plain text: the message on a `message` step, or the email's plain-text version with Whop's footer. `null` unless the step sends.
    public let text: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        actionType: AutomationStepPreviewActionType,
        html: Nullable<String>,
        outcome: AutomationStepPreviewOutcome,
        preheader: Nullable<String>,
        reason: Nullable<String>,
        subject: Nullable<String>,
        text: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.actionType = actionType
        self.html = html
        self.outcome = outcome
        self.preheader = preheader
        self.reason = reason
        self.subject = subject
        self.text = text
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actionType = try container.decode(AutomationStepPreviewActionType.self, forKey: .actionType)
        self.html = try container.decode(Nullable<String>.self, forKey: .html)
        self.outcome = try container.decode(AutomationStepPreviewOutcome.self, forKey: .outcome)
        self.preheader = try container.decode(Nullable<String>.self, forKey: .preheader)
        self.reason = try container.decode(Nullable<String>.self, forKey: .reason)
        self.subject = try container.decode(Nullable<String>.self, forKey: .subject)
        self.text = try container.decode(Nullable<String>.self, forKey: .text)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.actionType, forKey: .actionType)
        try container.encode(self.html, forKey: .html)
        try container.encode(self.outcome, forKey: .outcome)
        try container.encode(self.preheader, forKey: .preheader)
        try container.encode(self.reason, forKey: .reason)
        try container.encode(self.subject, forKey: .subject)
        try container.encode(self.text, forKey: .text)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case actionType = "action_type"
        case html
        case outcome
        case preheader
        case reason
        case subject
        case text
    }
}