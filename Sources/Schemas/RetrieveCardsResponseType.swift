import Foundation

/// The card type.
public enum RetrieveCardsResponseType: String, Codable, Hashable, CaseIterable, Sendable {
    case virtual
    case physical
}