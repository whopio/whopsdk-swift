import Foundation

/// Promo code lifecycle status.
public enum PromoCodeListItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case archived
}