import Foundation

/// How the app authenticates at the OAuth token endpoint.
public enum AppOauthClientType: String, Codable, Hashable, CaseIterable, Sendable {
    case `public`
    case confidential
}