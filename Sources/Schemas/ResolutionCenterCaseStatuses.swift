import Foundation

/// The statuses a resolution object can have
public enum ResolutionCenterCaseStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case merchantResponseNeeded = "merchant_response_needed"
    case customerResponseNeeded = "customer_response_needed"
    case merchantInfoNeeded = "merchant_info_needed"
    case customerInfoNeeded = "customer_info_needed"
    case underPlatformReview = "under_platform_review"
    case customerWon = "customer_won"
    case merchantWon = "merchant_won"
    case customerWithdrew = "customer_withdrew"
}