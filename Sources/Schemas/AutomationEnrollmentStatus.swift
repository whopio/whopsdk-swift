import Foundation

/// `active` while the member moves through the automation. `completed` after its last step. `canceled` when the account canceled the enrollment, or stopped or deleted the automation.
public enum AutomationEnrollmentStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case completed
    case canceled
}