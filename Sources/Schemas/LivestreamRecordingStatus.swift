import Foundation

/// State of the recording. `null` when the livestream was not recorded.
public enum LivestreamRecordingStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case recording
    case processing
    case completed
    case failed
}