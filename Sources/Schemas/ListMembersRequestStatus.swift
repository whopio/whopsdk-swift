import Foundation

public enum ListMembersRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case joined
    case left
}