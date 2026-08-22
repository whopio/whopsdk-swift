import Foundation

/// Current verification state. `not_started` before any session exists; `pending` while a session needs the user's input; `processing` while the provider's automated checks run on a fresh submission; `action_required` when `requested_information` needs answers; `manual_review` while information already sent is under review — an audit answer, or a document the payout provider holds — nothing to submit, usually done within 3 business days; `approved` on success; `rejected` on failure. Call Create Verification again to start a new session.
public enum ListVerificationsResponseDataItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case notStarted = "not_started"
    case pending
    case processing
    case manualReview = "manual_review"
    case approved
    case rejected
    case actionRequired = "action_required"
}