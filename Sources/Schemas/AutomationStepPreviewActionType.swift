import Foundation

/// The step's action type: `email` or `message`.
public enum AutomationStepPreviewActionType: String, Codable, Hashable, CaseIterable, Sendable {
    case email
    case message
}