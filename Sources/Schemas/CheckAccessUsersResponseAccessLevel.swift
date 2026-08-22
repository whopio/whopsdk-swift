import Foundation

public enum CheckAccessUsersResponseAccessLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case noAccess = "no_access"
    case admin
    case customer
}