import Foundation

/// Whether Whop holds this address for the account. A platform address is ready as soon as its route is claimed.
public enum DomainPlatformState: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case ready
    case actionRequired = "action_required"
    case releasing
}