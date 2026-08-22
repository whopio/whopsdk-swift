import Foundation

/// How long the discount applies.
public enum PromoCodeListItemDuration: String, Codable, Hashable, CaseIterable, Sendable {
    case forever
    case once
    case repeating
}