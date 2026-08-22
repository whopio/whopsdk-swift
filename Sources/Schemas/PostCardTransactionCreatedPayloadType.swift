import Foundation

/// The webhook event type
public enum PostCardTransactionCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardTransactionCreated = "card_transaction.created"
}