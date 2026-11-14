import Foundation

/// Attests that the buyer was told the payment method will be saved for later charges, and saves it once they approve, so it can be charged with `member_id` and `payment_method_id`. PayPal shows the buyer the agreement to future charges on its approval page. Omit it for a one-time payment that saves nothing. Ignored unless a `paypal` `payment_method` is provided.
public enum CreatePaymentsRequestSetupFutureUsage: String, Codable, Hashable, CaseIterable, Sendable {
    case offSession = "off_session"
}