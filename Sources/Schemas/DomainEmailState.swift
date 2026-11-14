import Foundation

/// `pending` while Whop sets the domain up with its email provider and publishes its DNS records, `ready` once the provider verified them, and `action_required` when it couldn't; its issue says what happens next. `releasing` while Whop removes email from the domain.
public enum DomainEmailState: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case ready
    case actionRequired = "action_required"
    case releasing
}