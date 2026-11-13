import Foundation

/// Delivery channel the preference applies to. Omit it (or pass `null`) to apply the preference to every channel.
public enum SetNotificationsRequestPreferencesItemScopeChannel: String, Codable, Hashable, CaseIterable, Sendable {
    case inApp = "in_app"
    case mobile
}