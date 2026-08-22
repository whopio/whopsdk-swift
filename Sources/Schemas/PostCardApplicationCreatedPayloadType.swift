import Foundation

/// The webhook event type
public enum PostCardApplicationCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardApplicationCreated = "card_application.created"
}