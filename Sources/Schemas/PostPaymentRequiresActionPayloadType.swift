import Foundation

/// The webhook event type
public enum PostPaymentRequiresActionPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case paymentRequiresAction = "payment.requires_action"
}