import Foundation

/// Why the refund was issued, when recorded.
public enum RefundReason: String, Codable, Hashable, CaseIterable, Sendable {
    case duplicate
    case fraudulent
    case requestedByCustomer = "requested_by_customer"
    case expiredUncapturedCharge = "expired_uncaptured_charge"
    case disputeAlert = "dispute_alert"
}