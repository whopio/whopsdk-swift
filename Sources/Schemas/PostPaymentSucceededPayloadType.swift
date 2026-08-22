import Foundation

/// The webhook event type
public enum PostPaymentSucceededPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case paymentSucceeded = "payment.succeeded"
}