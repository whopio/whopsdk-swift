import Foundation

public enum ChannelMemberNotificationPreference: String, Codable, Hashable, CaseIterable, Sendable {
    case all
    case mentions
    case none
}