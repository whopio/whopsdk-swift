import Foundation

/// The webhook event type
public enum PostCardFrozenPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardFrozen = "card.frozen"
}