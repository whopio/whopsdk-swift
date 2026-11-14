import Foundation

/// Lifecycle state. `draft` — not yet live; `active` — currently running; `paused` — traffic paused; `ended` — concluded.
public enum ExperimentStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case draft
    case active
    case paused
    case ended
}