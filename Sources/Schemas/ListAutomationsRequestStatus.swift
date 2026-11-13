import Foundation

public enum ListAutomationsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case closed
    case stopped
}