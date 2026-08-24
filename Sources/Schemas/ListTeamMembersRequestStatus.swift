import Foundation

public enum ListTeamMembersRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case joined
    case pending
}