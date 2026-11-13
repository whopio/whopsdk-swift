import Foundation

/// Who can post messages.
public enum ChannelModerationWhoCanPost: String, Codable, Hashable, CaseIterable, Sendable {
    case everyone
    case admins
}