import Foundation

/// Statuses for promo codes
public enum PromoCodeStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case archived
}