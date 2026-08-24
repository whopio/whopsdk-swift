import Foundation

/// These are the scopes an app can request on behalf of a user
public enum AppValidScopes: String, Codable, Hashable, CaseIterable, Sendable {
    case readUser = "read_user"
}