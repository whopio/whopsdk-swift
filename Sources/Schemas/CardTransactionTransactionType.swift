import Foundation

/// The kind of card transaction. Always `spend` today.
public enum CardTransactionTransactionType: String, Codable, Hashable, CaseIterable, Sendable {
    case spend
}