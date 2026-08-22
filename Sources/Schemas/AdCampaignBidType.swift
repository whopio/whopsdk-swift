import Foundation

/// How delivery bids in the ad auction: `minimum_cost` gets the most results for the budget, `average_target` holds an average cost per result, and `maximum_target` never bids above a cap.
public enum AdCampaignBidType: String, Codable, Hashable, CaseIterable, Sendable {
    case minimumCost = "minimum_cost"
    case averageTarget = "average_target"
    case maximumTarget = "maximum_target"
}