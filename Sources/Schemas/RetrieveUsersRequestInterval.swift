import Foundation

public enum RetrieveUsersRequestInterval: String, Codable, Hashable, CaseIterable, Sendable {
    case hour
    case day
    case week
    case month
}