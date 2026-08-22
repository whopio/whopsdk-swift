import Foundation

/// Where the dispute stands. `needs_response` is awaiting evidence, `under_review` is with the processor, `won` returned the funds to the seller, `lost` returned them to the customer, and `closed` ended without a ruling. A dispute past its `evidence_due_at` reports `under_review` — the window to respond has closed.
public enum DisputeStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case needsResponse = "needs_response"
    case underReview = "under_review"
    case won
    case lost
    case closed
}