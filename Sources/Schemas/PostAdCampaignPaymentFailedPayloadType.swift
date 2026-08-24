import Foundation

/// The webhook event type
public enum PostAdCampaignPaymentFailedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case adCampaignPaymentFailed = "ad_campaign.payment_failed"
}