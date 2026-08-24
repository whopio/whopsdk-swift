import Foundation

/// Scopes the app asks a user to grant when they authorize it, shown on the consent screen.
public enum AppRequiredScopesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case readUser = "read_user"
}