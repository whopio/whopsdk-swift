import Foundation

/// What the user is notified about in this scope: `all` or `nothing`.
public enum UserNotificationPreferenceLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case all
    case nothing
}