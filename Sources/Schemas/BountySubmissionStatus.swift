import Foundation

/// Lifecycle state. `in_progress` submissions are active attempts that have not submitted proof yet; `submitted` submissions await review; `approved` submissions were accepted and paid; `denied` submissions were rejected. `null` when the attempt ended without proof, taking it out of the public lifecycle — those attempts are absent from every public list and read.
public enum BountySubmissionStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case inProgress = "in_progress"
    case submitted
    case approved
    case denied
}