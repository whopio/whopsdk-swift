import Foundation

/// Who can post messages.
public enum UpdateChannelsRequestModerationWhoCanPost: String, Codable, Hashable, CaseIterable, Sendable {
    case everyone
    case admins
}