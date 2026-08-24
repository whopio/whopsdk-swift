import Foundation

public enum ListAdGroupsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case spend
    case impressions
    case reach
    case clicks
    case uniqueClicks = "unique_clicks"
    case frequency
    case clickThroughRate = "click_through_rate"
    case results
    case costPerMille = "cost_per_mille"
    case costPerClick = "cost_per_click"
    case costPerResult = "cost_per_result"
    case returnOnAdSpend = "return_on_ad_spend"
}