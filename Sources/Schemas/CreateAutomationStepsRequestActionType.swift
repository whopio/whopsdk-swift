import Foundation

/// What the step does: `wait` holds the member for `config.delay_seconds`, `email` emails them, and `message` sends them a message from a team member. A draft step can switch between `email` and `message`, which clears `config.sender_id`. A `wait` can't become a sending step, or the other way round.
public enum CreateAutomationStepsRequestActionType: String, Codable, Hashable, CaseIterable, Sendable {
    case wait
    case email
    case message
}