import Foundation

/// Whether the ad is delivering right now, and if not, why. When several states apply at once, the highest-precedence one is returned.
public enum AdDeliveryStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case inAppeal = "in_appeal"
    case rejected
    case inReview = "in_review"
    case draft
    case campaignPaused = "campaign_paused"
    case adGroupPaused = "ad_group_paused"
    case paused
    case processing
    case issues
    case scheduled
    case learningLimited = "learning_limited"
    case learning
    case active
}