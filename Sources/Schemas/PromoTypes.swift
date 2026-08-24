import Foundation

/// The type of promo code used to discount a plan
public enum PromoTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case percentage
    case flatAmount = "flat_amount"
}