import Foundation

/// What the user is notified about in the experience: `all` notifications, only `mentions`, or `nothing`.
public enum ExperienceNotificationPreferenceLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case all
    case mentions
    case nothing
}