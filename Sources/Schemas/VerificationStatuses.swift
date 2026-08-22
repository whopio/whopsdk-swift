import Foundation

/// A status for a verification.
public enum VerificationStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case requiresInput = "requires_input"
    case processing
    case verified
    case canceled
    case created
    case started
    case submitted
    case approved
    case declined
    case resubmissionRequested = "resubmission_requested"
    case expired
    case abandoned
    case review
    case actionRequired = "action_required"
    case manualReview = "manual_review"
}