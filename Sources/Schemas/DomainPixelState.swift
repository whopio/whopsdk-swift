import Foundation

/// `ready` while the Whop pixel recorded a page view on the domain in the last 7 days. `pending` until a pixel you asked for records its first one, and `action_required` once it goes 7 days without one; its issue says what to do.
public enum DomainPixelState: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case ready
    case actionRequired = "action_required"
}