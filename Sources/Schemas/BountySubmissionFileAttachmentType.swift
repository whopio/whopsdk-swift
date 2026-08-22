import Foundation

/// Broad kind of file.
public enum BountySubmissionFileAttachmentType: String, Codable, Hashable, CaseIterable, Sendable {
    case image
    case video
    case audio
    case other
}