import Foundation

/// The webhook event type
public enum PostPaymentFailedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case paymentFailed = "payment.failed"
}