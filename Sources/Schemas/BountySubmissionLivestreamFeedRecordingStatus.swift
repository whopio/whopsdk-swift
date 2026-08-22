import Foundation

/// Recording lifecycle state.
public enum BountySubmissionLivestreamFeedRecordingStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case recording
    case processing
    case completed
    case failed
}