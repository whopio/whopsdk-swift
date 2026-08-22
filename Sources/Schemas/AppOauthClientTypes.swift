import Foundation

/// How this app authenticates at the OAuth token endpoint.
public enum AppOauthClientTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case `public`
    case confidential
}