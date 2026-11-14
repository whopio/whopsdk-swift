import Foundation

/// What this account's rule requests when every condition matches. One applicable account-rule action wins, in this order: `allow`, `block`, `review`, `enforce_3ds`. An `allow` overrides this account's other rules, never Whop's own fraud controls. A `review` requests authorization without capture for an eligible on-session card payment through Whop Payments. Automatic capture is scheduled for 48 hours after authorization; capture or void the payment before then to decide sooner. Capture may complete later or fail. Review is skipped for unsupported methods, off-session payments, and payments already configured for manual capture. An `enforce_3ds` is skipped when the account rule cannot apply a challenge. Other 3DS requirements still apply.
public enum CreatePaymentRulesRequestAction: String, Codable, Hashable, CaseIterable, Sendable {
    case allow
    case block
    case review
    case enforce3Ds = "enforce_3ds"
}