import Foundation

/// Who can react to messages.
public enum UpdateChannelsRequestModerationWhoCanReact: String, Codable, Hashable, CaseIterable, Sendable {
    case everyone
    case noOne = "no_one"
}