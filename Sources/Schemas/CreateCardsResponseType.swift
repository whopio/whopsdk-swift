import Foundation

/// The card type.
public enum CreateCardsResponseType: String, Codable, Hashable, CaseIterable, Sendable {
    case virtual
    case physical
}