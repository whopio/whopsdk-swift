import Foundation

/// Where the file is in its upload lifecycle.
public enum DisputeEvidenceDocumentUploadStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case processing
    case ready
    case failed
}