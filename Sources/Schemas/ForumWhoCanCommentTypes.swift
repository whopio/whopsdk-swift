import Foundation

/// Who can comment on a forum feed
public enum ForumWhoCanCommentTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case everyone
    case admins
}