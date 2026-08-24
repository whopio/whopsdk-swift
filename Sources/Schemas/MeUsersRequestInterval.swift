import Foundation

public enum MeUsersRequestInterval: String, Codable, Hashable, CaseIterable, Sendable {
    case hour
    case day
    case week
    case month
}