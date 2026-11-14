import Foundation

/// Why the stream cannot be adjusted: `no_merchant_fee` (the business is charged nothing on it), `commission_fixed` (the commission is a flat share a fee discount may not move), `no_headroom` (already at the floor), `fee_unavailable` (no fee or rate could be resolved). Null when adjustable.
public enum FeeOptionsPartnersResponseStreamsItemUnadjustableReason: String, Codable, Hashable, CaseIterable, Sendable {
    case noMerchantFee = "no_merchant_fee"
    case commissionFixed = "commission_fixed"
    case noHeadroom = "no_headroom"
    case feeUnavailable = "fee_unavailable"
}