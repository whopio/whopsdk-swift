import Foundation

/// How delivery bids in the ad auction: `minimum_cost` gets the most results for the budget, `average_target` holds an average cost per result, `maximum_target` never bids above a cap. Switching to `minimum_cost` clears the cap amounts stored on the campaign's ad groups. Only for campaigns that own the budget.
public enum UpdateAdCampaignsRequestBidType: String, Codable, Hashable, CaseIterable, Sendable {
    case minimumCost = "minimum_cost"
    case averageTarget = "average_target"
    case maximumTarget = "maximum_target"
}