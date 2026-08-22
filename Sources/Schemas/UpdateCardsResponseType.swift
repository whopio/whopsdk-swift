import Foundation

/// The card type.
public enum UpdateCardsResponseType: String, Codable, Hashable, CaseIterable, Sendable {
    case virtual
    case physical
}