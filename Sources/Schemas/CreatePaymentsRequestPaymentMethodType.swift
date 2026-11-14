import Foundation

/// The kind of payment method; the member named after it carries its details.
public enum CreatePaymentsRequestPaymentMethodType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardPresent = "card_present"
    case paypal
}