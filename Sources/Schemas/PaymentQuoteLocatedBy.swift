import Foundation

/// Which location tax was calculated for: `shipping_address` when it carries a country, else the billing `address` when it does, else the `presentment_country` sent, else the buyer's `ip_address`. A quote located by `presentment_country` or `ip_address` is a preview that estimates tax: a payment cannot use it, so quote again with the buyer's address to pay. Null when nothing in the request located the buyer, which only a seller that collects no tax on this purchase is quoted without; `tax_status` is then `not_applicable`.
public enum PaymentQuoteLocatedBy: String, Codable, Hashable, CaseIterable, Sendable {
    case shippingAddress = "shipping_address"
    case address
    case presentmentCountry = "presentment_country"
    case ipAddress = "ip_address"
}