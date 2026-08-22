import Foundation

public enum ListTeamMembersRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
}