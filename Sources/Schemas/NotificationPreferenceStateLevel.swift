import Foundation

/// What the user is now notified about in this scope, or `null` if the preference was cleared and the scope inherits its default again.
public enum NotificationPreferenceStateLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case all
    case mentions
    case nothing
}