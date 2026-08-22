import Foundation

/// Delivery channel the preference applies to. Required when setting a topic override.
public enum SetNotificationsRequestPreferencesItemScopeChannel: String, Codable, Hashable, CaseIterable, Sendable {
    case inApp = "in_app"
    case mobile
}