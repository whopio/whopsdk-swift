import Foundation

/// Which Tap to Pay SDK collects the payment. Stripe offers Tap to Pay in different countries per platform, so eligibility is checked for the named one, as it is for the connection-token session.
public enum CreatePaymentsRequestPaymentMethodCardPresentPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case ios
    case android
}