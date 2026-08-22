import Foundation

/// The different types of payment transactions.
public enum PaymentTransactionTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case purchase
    case authorize
    case capture
    case refund
    case canceled
    case verify
    case chargeback
    case preChargeback = "pre_chargeback"
    case threeDSecure = "three_d_secure"
    case fraudScreening = "fraud_screening"
    case authorization
    case installment
}