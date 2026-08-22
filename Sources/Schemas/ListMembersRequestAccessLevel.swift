import Foundation

public enum ListMembersRequestAccessLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case noAccess = "no_access"
    case admin
    case customer
}