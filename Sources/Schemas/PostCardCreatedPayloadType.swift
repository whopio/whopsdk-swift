import Foundation

/// The webhook event type
public enum PostCardCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardCreated = "card.created"
}