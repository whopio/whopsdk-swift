import Foundation

/// `joined` while the member is part of the account, `left` after they leave.
public enum SearchRecordMemberStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case joined
    case left
}