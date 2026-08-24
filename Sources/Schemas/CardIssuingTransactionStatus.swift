import Foundation

/// The lifecycle status of a card transaction.
public enum CardIssuingTransactionStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case completed
    case reversed
    case declined
}