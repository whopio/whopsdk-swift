import Foundation

/// The card type.
public enum ListCardsResponseDataItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case virtual
    case physical
}