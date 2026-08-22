import Foundation

/// The webhook event type
public enum PostMembershipDeactivatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case membershipDeactivated = "membership.deactivated"
}