import Foundation

public enum ListEarningsRequestIncomeSourceItem: String, Codable, Hashable, CaseIterable, Sendable {
    case sales
    case adSpend = "ad_spend"
    case transfer
    case cardInterchange = "card_interchange"
}