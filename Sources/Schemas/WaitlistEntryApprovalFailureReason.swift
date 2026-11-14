import Foundation

/// Why the last approval attempt failed, or `null` when none has. `plan_unavailable` — the variant, product, or seller account was deleted. `already_member` — the user already has a membership on a one-per-user product. `checkout_failed` — checkout failed, usually a declined payment, and the signup was denied. `unknown` — another failure; retry. Cleared when approval is requeued.
public enum WaitlistEntryApprovalFailureReason: String, Codable, Hashable, CaseIterable, Sendable {
    case planUnavailable = "plan_unavailable"
    case alreadyMember = "already_member"
    case checkoutFailed = "checkout_failed"
    case unknown
}