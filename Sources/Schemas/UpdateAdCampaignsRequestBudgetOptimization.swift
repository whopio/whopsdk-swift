import Foundation

/// Which level owns the budget: the whole campaign (`ad_campaign`) or each ad group individually (`ad_group`). Only changeable before the campaign launches; switching to `ad_campaign` requires budget_amount in the same request, and switching to `ad_group` clears the campaign budget.
public enum UpdateAdCampaignsRequestBudgetOptimization: String, Codable, Hashable, CaseIterable, Sendable {
    case adCampaign = "ad_campaign"
    case adGroup = "ad_group"
}