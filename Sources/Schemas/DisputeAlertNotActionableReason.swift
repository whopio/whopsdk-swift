import Foundation

/// Why refunding can no longer avoid a chargeback. `network_resolved` when a Visa RDR already closed the case, `payment_unmatched` when no payment matched, `payment_not_captured` when it never captured money, `payment_disputed` once the payment carries a dispute, `payment_refunded` once fully refunded. `null` while `actionable` is true.
public enum DisputeAlertNotActionableReason: String, Codable, Hashable, CaseIterable, Sendable {
    case networkResolved = "network_resolved"
    case paymentUnmatched = "payment_unmatched"
    case paymentNotCaptured = "payment_not_captured"
    case paymentDisputed = "payment_disputed"
    case paymentRefunded = "payment_refunded"
}