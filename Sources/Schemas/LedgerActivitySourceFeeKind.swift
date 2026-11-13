import Foundation

/// Action that generated a platform markup fee: deposit, swap, transfer, card_spend, or payout. Present for platform_markup_fee and platform_markup_fee_payout, including when include_resource is false. Null when the originating action is unavailable; omitted on other source types.
public enum LedgerActivitySourceFeeKind: String, Codable, Hashable, CaseIterable, Sendable {
    case payout
    case transfer
    case deposit
    case swap
    case cardSpend = "card_spend"
}