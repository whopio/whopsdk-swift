import Foundation

/// The upload status of a file
public enum UploadStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case processing
    case ready
    case failed
}