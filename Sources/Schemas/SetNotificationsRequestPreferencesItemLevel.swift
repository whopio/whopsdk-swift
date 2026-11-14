import Foundation

/// What the user is notified about in this scope. `mentions` is only valid for an experience level; a topic override is `all` or `nothing`. `null` clears the preference, so the scope inherits its default again rather than being switched off.
public enum SetNotificationsRequestPreferencesItemLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case all
    case mentions
    case nothing
}