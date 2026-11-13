import Foundation

/// The webhook event type
public enum PostPaymentAuthorizedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case paymentAuthorized = "payment.authorized"
}