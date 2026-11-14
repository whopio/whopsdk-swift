import Foundation

/// What acted: a `user`, an `account` through one of its API keys, or an `app`.
public enum AutomationActorObject: String, Codable, Hashable, CaseIterable, Sendable {
    case user
    case account
    case app
}