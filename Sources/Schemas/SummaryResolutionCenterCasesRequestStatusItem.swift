import Foundation

public enum SummaryResolutionCenterCasesRequestStatusItem: String, Codable, Hashable, CaseIterable, Sendable {
    case awaitingMerchant = "awaiting_merchant"
    case awaitingCustomer = "awaiting_customer"
    case underReview = "under_review"
    case closed
}