import Foundation

/// Whether the commission is paid on the membership's first payment only or on all its payments.
public enum MembershipAffiliateAppliesToPayments: String, Codable, Hashable, CaseIterable, Sendable {
    case firstPayment = "first_payment"
    case allPayments = "all_payments"
}