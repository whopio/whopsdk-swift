import Foundation

/// `active` enrolls members and runs their steps. `closed` enrolls no one new, and members already in it finish. `stopped` enrolls no one, and its members' enrollments have ended. A new automation is `stopped` until its first publish makes it `active`.
public enum AutomationStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case closed
    case stopped
}