import Foundation

/// `pending` while Whop registers the domain with Apple, `ready` once Apple verified it, and `action_required` when Apple couldn't; its issue says how to fix it. `releasing` while Whop removes it from Apple.
public enum DomainApplePayState: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case ready
    case actionRequired = "action_required"
    case releasing
}