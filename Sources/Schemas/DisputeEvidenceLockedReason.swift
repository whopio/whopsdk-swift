import Foundation

/// Why evidence can no longer be edited. `null` while `evidence_editable` is true.
public enum DisputeEvidenceLockedReason: String, Codable, Hashable, CaseIterable, Sendable {
    case submitted
    case responseWindowClosed = "response_window_closed"
    case notContestable = "not_contestable"
}