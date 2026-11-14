import Foundation

/// The family the type belongs to.
public enum PaymentMethodDisplayCategory: String, Codable, Hashable, CaseIterable, Sendable {
    case card
    case wallet
    case bankDebit = "bank_debit"
    case bankTransfer = "bank_transfer"
    case voucher
    case redirect
    case crypto
    case balance
    case inAppPurchase = "in_app_purchase"
    case cardPresent = "card_present"
    case saved
}