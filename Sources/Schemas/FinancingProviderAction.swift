import Foundation

/// The merchant action that turns this provider on when `status` is `needs_action`; `null` otherwise.
public enum FinancingProviderAction: String, Codable, Hashable, CaseIterable, Sendable {
    case verifyBusiness = "verify_business"
    case addPayoutAccount = "add_payout_account"
}