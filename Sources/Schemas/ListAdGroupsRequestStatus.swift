import Foundation

public enum ListAdGroupsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case paused
    case rejected
    case duplicating
}