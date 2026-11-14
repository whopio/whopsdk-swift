import Foundation

/// The step's settings for its `action_type`: `delay_seconds` for a `wait`, and `sender_id` for an `email` or a `message`. Writing it replaces the whole object.
public enum AutomationStepConfig: Codable, Hashable, Sendable {
    case automationStepWaitConfig(AutomationStepWaitConfig)
    case automationStepEmailConfig(AutomationStepEmailConfig)
    case automationStepMessageConfig(AutomationStepMessageConfig)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(AutomationStepWaitConfig.self) {
            self = .automationStepWaitConfig(value)
        } else if let value = try? container.decode(AutomationStepEmailConfig.self) {
            self = .automationStepEmailConfig(value)
        } else if let value = try? container.decode(AutomationStepMessageConfig.self) {
            self = .automationStepMessageConfig(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .automationStepWaitConfig(let value):
            try container.encode(value)
        case .automationStepEmailConfig(let value):
            try container.encode(value)
        case .automationStepMessageConfig(let value):
            try container.encode(value)
        }
    }
}