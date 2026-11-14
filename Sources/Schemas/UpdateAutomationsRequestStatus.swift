import Foundation

/// `active` enrolls members and runs their steps. `closed` stops new enrollments and lets members already in it finish. `stopped` stops new enrollments and ends every member's enrollment. `active` and `closed` need a published version.
public enum UpdateAutomationsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case closed
    case stopped
}