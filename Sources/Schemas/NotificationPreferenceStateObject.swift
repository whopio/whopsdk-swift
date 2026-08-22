import Foundation

/// Which kind of preference was written: `experience_notification_preference` for an experience level, `notification_preference` for a topic override.
public enum NotificationPreferenceStateObject: String, Codable, Hashable, CaseIterable, Sendable {
    case notificationPreference = "notification_preference"
    case experienceNotificationPreference = "experience_notification_preference"
}