import Foundation

/// The webhook event type
public enum PostCardTransactionUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardTransactionUpdated = "card_transaction.updated"
}