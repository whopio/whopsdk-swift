import Foundation

/// The webhook event type
public enum PostPaymentCanceledPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case paymentCanceled = "payment.canceled"
}