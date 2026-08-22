import Foundation

/// Which income source the commission is on: product-sales gross profit, Whop Ads spend billed to the business, platform balance transfer fees, or Whop Card interchange.
public enum ListEarningsResponseDataItemIncomeSource: String, Codable, Hashable, CaseIterable, Sendable {
    case sales
    case adSpend = "ad_spend"
    case transfer
    case cardInterchange = "card_interchange"
}