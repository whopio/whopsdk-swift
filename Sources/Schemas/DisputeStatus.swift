import Foundation

/// `needs_response` awaits evidence (after a processor refused a filing, `submission_failure_reason` says why); `generating_response` has evidence with the processor, not yet accepted; `under_review` is with the processor; `won`/`lost` are the rulings; `prevented` settles like `lost`. `warning_` statuses are the inquiry tiers. Past `evidence_due_at` an open one reports `under_review`.
public enum DisputeStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case needsResponse = "needs_response"
    case warningNeedsResponse = "warning_needs_response"
    case underReview = "under_review"
    case warningUnderReview = "warning_under_review"
    case generatingResponse = "generating_response"
    case won
    case lost
    case prevented
    case warningClosed = "warning_closed"
}