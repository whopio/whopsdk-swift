import Foundation

/// The payment attribute this condition reads.
public enum PaymentRuleFieldField: String, Codable, Hashable, CaseIterable, Sendable {
    case riskScore = "risk_score"
    case amountInUsd = "amount_in_usd"
    case cardCountry = "card_country"
    case cardBrand = "card_brand"
    case cardFunding = "card_funding"
    case cardBin = "card_bin"
    case billingCountry = "billing_country"
    case billingPostalCode = "billing_postal_code"
    case billingCity = "billing_city"
    case customerEmail = "customer_email"
    case emailDomain = "email_domain"
    case ipAddress = "ip_address"
    case ipCountry = "ip_country"
}