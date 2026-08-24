import Foundation

/// The status of the setup intent.
public enum SetupIntentStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case processing
    case succeeded
    case canceled
    case requiresAction = "requires_action"
}