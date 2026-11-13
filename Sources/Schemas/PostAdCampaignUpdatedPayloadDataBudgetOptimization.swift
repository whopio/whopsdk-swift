import Foundation

/// Which level owns the budget: the whole campaign (`ad_campaign`) or each ad group individually (`ad_group`).
public enum PostAdCampaignUpdatedPayloadDataBudgetOptimization: String, Codable, Hashable, CaseIterable, Sendable {
    case adCampaign = "ad_campaign"
    case adGroup = "ad_group"
}