import Foundation

/// Who the case is waiting on. `awaiting_merchant` and `awaiting_customer` name the side that owes a response, `under_review` means Whop is deciding, and `closed` means it is settled — read `outcome` for how.
public enum ResolutionCenterCaseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case awaitingMerchant = "awaiting_merchant"
    case awaitingCustomer = "awaiting_customer"
    case underReview = "under_review"
    case closed
}