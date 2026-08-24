import Foundation

/// The webhook event type
public enum PostCardCanceledPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardCanceled = "card.canceled"
}