import Foundation

public enum ListAccountsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case suspended
}