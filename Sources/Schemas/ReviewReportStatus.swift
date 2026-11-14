import Foundation

/// Where the report stands. `pending` reports are waiting for Whop staff, `accepted` reports led to the review being removed, and `rejected` reports left the review up.
public enum ReviewReportStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case accepted
    case rejected
}