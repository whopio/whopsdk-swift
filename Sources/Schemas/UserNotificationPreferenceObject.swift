import Foundation

/// The type of object. Always `notification_preference`.
public enum UserNotificationPreferenceObject: String, Codable, Hashable, CaseIterable, Sendable {
    case notificationPreference = "notification_preference"
}