import Foundation

/// The webhook event type
public enum PostCardTransactionCompletedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardTransactionCompleted = "card_transaction.completed"
}