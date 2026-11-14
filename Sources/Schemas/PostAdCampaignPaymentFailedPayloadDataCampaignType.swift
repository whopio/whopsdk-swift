import Foundation

/// The kind of campaign, fixed at creation. `standard` runs image and video ads; `search` shows text ads on search results for the ad groups' keywords.
public enum PostAdCampaignPaymentFailedPayloadDataCampaignType: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case search
}