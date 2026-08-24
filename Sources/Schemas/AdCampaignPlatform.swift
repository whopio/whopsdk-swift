import Foundation

/// The ad network the campaign runs on.
public enum AdCampaignPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case meta
    case tiktok
}