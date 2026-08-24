import Foundation

/// The webhook event type
public enum PostMembershipTrialEndingSoonPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case membershipTrialEndingSoon = "membership.trial_ending_soon"
}