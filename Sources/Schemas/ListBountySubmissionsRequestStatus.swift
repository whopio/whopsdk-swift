import Foundation

public enum ListBountySubmissionsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case inProgress = "in_progress"
    case submitted
    case approved
    case denied
}