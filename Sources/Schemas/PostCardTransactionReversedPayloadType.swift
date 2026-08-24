import Foundation

/// The webhook event type
public enum PostCardTransactionReversedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardTransactionReversed = "card_transaction.reversed"
}