import Foundation

/// The webhook event type
public enum PostMembershipActivatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case membershipActivated = "membership.activated"
}