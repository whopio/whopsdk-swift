import Foundation

/// What the user is notified about in this scope. `mentions` is only valid for an experience level. `null` clears the preference.
public enum SetNotificationsRequestPreferencesItemLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case all
    case mentions
    case nothing
}