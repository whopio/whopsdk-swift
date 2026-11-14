import Foundation

/// The webhook event type
public enum PostMembershipUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case membershipUpdated = "membership.updated"
}