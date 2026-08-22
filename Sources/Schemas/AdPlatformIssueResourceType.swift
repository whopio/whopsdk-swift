import Foundation

/// The type of resource the issue is attached to.
public enum AdPlatformIssueResourceType: String, Codable, Hashable, CaseIterable, Sendable {
    case adCampaign = "ad_campaign"
    case adGroup = "ad_group"
    case ad
}