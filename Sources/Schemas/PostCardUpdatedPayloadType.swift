import Foundation

/// The webhook event type
public enum PostCardUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardUpdated = "card.updated"
}