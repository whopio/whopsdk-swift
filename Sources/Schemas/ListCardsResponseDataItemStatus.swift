import Foundation

/// The card status. `denied` means the issuer declined the cardholder, so the card will never be issued.
public enum ListCardsResponseDataItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case frozen
    case canceled
    case invited
    case denied
}