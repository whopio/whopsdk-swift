import Foundation

public enum UpdateChannelMembersRequestNotificationPreference: String, Codable, Hashable, CaseIterable, Sendable {
    case all
    case mentions
    case none
}