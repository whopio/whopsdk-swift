import Foundation

/// Whether tax is added on top of the price (`exclusive`) or already inside it (`inclusive`). Null when no tax was calculated.
public enum PaymentQuoteTaxBehavior: String, Codable, Hashable, CaseIterable, Sendable {
    case inclusive
    case exclusive
}