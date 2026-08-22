import Foundation

/// The webhook event type
public enum PostMembershipCancelAtPeriodEndChangedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case membershipCancelAtPeriodEndChanged = "membership.cancel_at_period_end_changed"
}