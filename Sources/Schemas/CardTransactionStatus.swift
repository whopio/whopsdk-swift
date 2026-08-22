import Foundation

/// Current status of the transaction.
public enum CardTransactionStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case completed
    case reversed
    case declined
}