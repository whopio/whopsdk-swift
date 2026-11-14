import Foundation

/// Income source that generates this percentage payout.
public enum PartnerPayoutRateIncomeSource: String, Codable, Hashable, CaseIterable, Sendable {
    case sales
    case transfer
    case cardInterchange = "card_interchange"
    case adSpend = "ad_spend"
    case withdrawal
}