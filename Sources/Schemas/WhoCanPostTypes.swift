import Foundation

/// Who can post on a chat feed
public enum WhoCanPostTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case everyone
    case admins
}