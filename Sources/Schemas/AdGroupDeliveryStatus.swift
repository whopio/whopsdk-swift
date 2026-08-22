import Foundation

/// Whether ads in this ad group are delivering right now, and if not, why. When several states apply at once, the highest-precedence one is returned.
public enum AdGroupDeliveryStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case allAdsRejected = "all_ads_rejected"
    case rejected
    case draft
    case noAds = "no_ads"
    case campaignPaused = "campaign_paused"
    case paused
    case processing
    case issues
    case scheduled
    case completed
    case adsOff = "ads_off"
    case learningLimited = "learning_limited"
    case learning
    case active
}