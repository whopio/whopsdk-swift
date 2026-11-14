import Foundation

/// Why instant delivery is unavailable for this method. `minimum_crypto_sales_not_met` means the account has not reached the total sales required for instant cryptocurrency payouts. `null` when this restriction does not apply.
public enum ListMethodsResponseDataItemQuoteInstantUnavailableReason: String, Codable, Hashable, CaseIterable, Sendable {
    case minimumCryptoSalesNotMet = "minimum_crypto_sales_not_met"
}