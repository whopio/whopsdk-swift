import Foundation

/// Initial status (default: `active`).
public enum CreateAdGroupsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case paused
}