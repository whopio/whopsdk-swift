import Foundation

/// Whether the affiliate commission applies to the first payment or all payments
public enum AffiliateAppliesToPayments: String, Codable, Hashable, CaseIterable, Sendable {
    case firstPayment = "first_payment"
    case allPayments = "all_payments"
}