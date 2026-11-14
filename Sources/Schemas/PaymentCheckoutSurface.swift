import Foundation

/// The checkout experience that produced this payment, such as `embedded_checkout` for a checkout on the account's own website or `off_session` for a subscription renewal. Null when the checkout was not recorded.
public enum PaymentCheckoutSurface: String, Codable, Hashable, CaseIterable, Sendable {
    case hostedCheckout = "hosted_checkout"
    case embeddedCheckout = "embedded_checkout"
    case customCheckout = "custom_checkout"
    case modalCheckout = "modal_checkout"
    case inAppCheckout = "in_app_checkout"
    case mobileCheckout = "mobile_checkout"
    case offSession = "off_session"
    case cardPresent = "card_present"
}