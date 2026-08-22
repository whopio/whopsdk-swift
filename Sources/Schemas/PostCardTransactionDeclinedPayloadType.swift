import Foundation

/// The webhook event type
public enum PostCardTransactionDeclinedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardTransactionDeclined = "card_transaction.declined"
}