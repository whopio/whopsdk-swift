import Foundation

/// Who can react to messages.
public enum ChannelModerationWhoCanReact: String, Codable, Hashable, CaseIterable, Sendable {
    case everyone
    case noOne = "no_one"
}