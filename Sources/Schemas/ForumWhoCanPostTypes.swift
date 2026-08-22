import Foundation

/// Who can post on a forum feed
public enum ForumWhoCanPostTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case everyone
    case admins
}