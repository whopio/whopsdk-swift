import Foundation

/// The notification preferences for a DMs feed member
public enum DmsFeedMemberNotificationPreferences: String, Codable, Hashable, CaseIterable, Sendable {
    case all
    case mentions
    case none
}