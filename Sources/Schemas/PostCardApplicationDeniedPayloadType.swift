import Foundation

/// The webhook event type
public enum PostCardApplicationDeniedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardApplicationDenied = "card_application.denied"
}