import Foundation

public enum ListMembersRequestMembershipStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
}