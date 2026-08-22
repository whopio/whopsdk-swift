import Foundation

/// The webhook event type
public enum PostCardApplicationApprovedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case cardApplicationApproved = "card_application.approved"
}