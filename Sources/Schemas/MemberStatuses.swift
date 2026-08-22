import Foundation

/// The different statuses a Member can have.
public enum MemberStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case drafted
    case joined
    case left
}