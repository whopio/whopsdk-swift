import Foundation

public enum ListPaymentsRequestSubstatusesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case succeeded
    case requiresCapture = "requires_capture"
    case pending
    case failed
    case blocked
    case pastDue = "past_due"
    case canceled
    case priceTooLow = "price_too_low"
    case uncollectible
    case refunded
    case autoRefunded = "auto_refunded"
    case partiallyRefunded = "partially_refunded"
    case disputeWarning = "dispute_warning"
    case disputeNeedsResponse = "dispute_needs_response"
    case disputeWarningNeedsResponse = "dispute_warning_needs_response"
    case resolutionNeedsResponse = "resolution_needs_response"
    case disputeUnderReview = "dispute_under_review"
    case disputeWarningUnderReview = "dispute_warning_under_review"
    case resolutionUnderReview = "resolution_under_review"
    case disputeWon = "dispute_won"
    case disputeWarningClosed = "dispute_warning_closed"
    case resolutionWon = "resolution_won"
    case disputeLost = "dispute_lost"
    case disputeClosed = "dispute_closed"
    case resolutionLost = "resolution_lost"
    case drafted
    case incomplete
    case unresolved
}