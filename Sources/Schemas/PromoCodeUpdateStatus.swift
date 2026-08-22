import Foundation

/// Statuses that can be applied to promo codes through update operations.
public enum PromoCodeUpdateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
}