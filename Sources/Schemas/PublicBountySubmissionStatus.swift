import Foundation

/// Lifecycle state. `submitted` submissions await review; `approved` submissions were accepted and paid; `denied` submissions were rejected. In-progress attempts never appear on the public list.
public enum PublicBountySubmissionStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case submitted
    case approved
    case denied
}