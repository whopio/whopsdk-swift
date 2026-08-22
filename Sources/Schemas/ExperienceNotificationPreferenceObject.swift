import Foundation

/// The type of object. Always `experience_notification_preference`.
public enum ExperienceNotificationPreferenceObject: String, Codable, Hashable, CaseIterable, Sendable {
    case experienceNotificationPreference = "experience_notification_preference"
}