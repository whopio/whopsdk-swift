import Foundation

/// The webhook event type
public enum PostAdCampaignUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case adCampaignUpdated = "ad_campaign.updated"
}