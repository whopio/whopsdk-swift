import Foundation

/// Why the refund failed, normalized across providers. Null unless the refund failed or was canceled.
public enum RefundFailureReason: String, Codable, Hashable, CaseIterable, Sendable {
    case bankDeclined = "bank_declined"
    case expiredOrCanceledCard = "expired_or_canceled_card"
    case lostOrStolenCard = "lost_or_stolen_card"
    case insufficientFunds = "insufficient_funds"
    case chargeDisputed = "charge_disputed"
    case notRefundable = "not_refundable"
    case merchantRequest = "merchant_request"
    case unknown
}