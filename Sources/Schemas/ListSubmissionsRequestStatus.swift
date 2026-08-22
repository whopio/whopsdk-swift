import Foundation

public enum ListSubmissionsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case submitted
    case approved
    case denied
}