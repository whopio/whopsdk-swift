import Foundation

/// The granular calculated statuses reflecting payout account KYC and withdrawal readiness.
public enum PayoutAccountCalculatedStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case connected
    case disabled
    case actionRequired = "action_required"
    case pendingVerification = "pending_verification"
    case verificationFailed = "verification_failed"
    case manualReview = "manual_review"
    case denied
    case notStarted = "not_started"
    case blockedByParent = "blocked_by_parent"
}