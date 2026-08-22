import Foundation

/// `joined` for accepted members, `pending` while the invite is pending.
public enum TeamMemberStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case joined
    case pending
}