import Foundation

/// The webhook event type
public enum PostPaymentPendingPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case paymentPending = "payment.pending"
}