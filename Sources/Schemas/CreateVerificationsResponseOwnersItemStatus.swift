import Foundation

/// Where the owner's own verification stands, in the same states as `status`. `action_required` when their documents need sending again.
public enum CreateVerificationsResponseOwnersItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case notStarted = "not_started"
    case pending
    case processing
    case manualReview = "manual_review"
    case approved
    case rejected
    case actionRequired = "action_required"
}