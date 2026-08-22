import Foundation

/// The lifecycle status of the ad campaign.
public enum AdCampaignStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case paused
    case inactive
    case stale
    case pendingRefund = "pending_refund"
    case paymentFailed = "payment_failed"
    case draft
    case inReview = "in_review"
    case flagged
    case importing
    case imported
    case duplicating
}