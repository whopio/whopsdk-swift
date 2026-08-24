import Foundation

/// The webhook event type
public enum PostCardApplicationUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardApplicationUpdated = "card_application.updated"
}