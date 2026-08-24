import Foundation

/// Whether the campaign's ads are delivering right now, and if not, why. When several states apply at once, the highest-precedence one is returned.
public enum AdCampaignDeliveryStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case paymentFailed = "payment_failed"
    case allAdsRejected = "all_ads_rejected"
    case draft
    case noAdGroups = "no_ad_groups"
    case noAds = "no_ads"
    case paused
    case processing
    case issues
    case scheduled
    case completed
    case adGroupsOff = "ad_groups_off"
    case active
}