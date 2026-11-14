import Foundation

/// Your inbox state for a private channel. `null` for other users and other channel kinds.
public enum ChannelMemberInboxStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case requested
    case accepted
    case hidden
}