import Foundation

/// The webhook event type
public enum PostPaymentCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case paymentCreated = "payment.created"
}