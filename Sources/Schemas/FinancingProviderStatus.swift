import Foundation

/// Where the provider stands for this account: `eligible` (included if the account applies), `needs_action` (waiting on the merchant, see `action`), `in_review` (waiting on Whop's review, or on the provider's own when `reason` is `provider_review`), `active` (offered at checkout), or `inactive` (not offered, see `reason`).
public enum FinancingProviderStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case eligible
    case needsAction = "needs_action"
    case inReview = "in_review"
    case active
    case inactive
}