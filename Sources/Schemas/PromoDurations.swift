import Foundation

/// The duration setting for the promo code
public enum PromoDurations: String, Codable, Hashable, CaseIterable, Sendable {
    case forever
    case once
    case repeating
}