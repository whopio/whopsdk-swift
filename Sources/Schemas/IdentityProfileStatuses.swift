import Foundation

/// Derived verification status for an identity profile.
public enum IdentityProfileStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case notStarted = "not_started"
    case pending
    case manualReview = "manual_review"
    case approved
    case rejected
    case actionRequired = "action_required"
}