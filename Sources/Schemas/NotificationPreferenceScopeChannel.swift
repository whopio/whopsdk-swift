import Foundation

/// Delivery channel the preference applies to. `null` applies to every channel.
public enum NotificationPreferenceScopeChannel: String, Codable, Hashable, CaseIterable, Sendable {
    case inApp = "in_app"
    case mobile
}