import Foundation

/// How delivery bids are set in the ad auction. Target-based strategies use `desired_cost_per_result`.
public enum CreateAdGroupsRequestBidType: String, Codable, Hashable, CaseIterable, Sendable {
    case minimumCost = "minimum_cost"
    case averageTarget = "average_target"
    case maximumTarget = "maximum_target"
}