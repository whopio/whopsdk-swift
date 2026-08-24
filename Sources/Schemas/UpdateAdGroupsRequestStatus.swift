import Foundation

/// Initial status (default: `active`).
public enum UpdateAdGroupsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case paused
}