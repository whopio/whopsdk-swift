import Foundation

/// Whether the campaign's ads are delivering right now, and if not, why. Content review is in_review; a campaign waiting to start is processing. Account billing failures set payment_failed without changing the configured status. Successful payment retry clears that block and recalculates delivery. When several states apply at once, the highest-precedence one is returned.
public enum PostAdCampaignUpdatedPayloadDataDeliveryStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case paymentFailed = "payment_failed"
    case waitingForEin = "waiting_for_ein"
    case inAppeal = "in_appeal"
    case allAdsRejected = "all_ads_rejected"
    case draft
    case noAdGroups = "no_ad_groups"
    case noAds = "no_ads"
    case paused
    case inReview = "in_review"
    case learning
    case processing
    case issues
    case scheduled
    case completed
    case adGroupsOff = "ad_groups_off"
    case active
}