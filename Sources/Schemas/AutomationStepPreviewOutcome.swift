import Foundation

/// What the step does for this member: `sent` its message, `skipped` it and moved on to the next step, or `exited` the automation.
public enum AutomationStepPreviewOutcome: String, Codable, Hashable, CaseIterable, Sendable {
    case sent
    case skipped
    case exited
}