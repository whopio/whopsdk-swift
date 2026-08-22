import Foundation

/// Whether the discount is percentage-based or a fixed amount.
public enum PromoCodePromoType: String, Codable, Hashable, CaseIterable, Sendable {
    case percentage
    case flatAmount = "flat_amount"
}