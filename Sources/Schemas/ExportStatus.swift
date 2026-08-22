import Foundation

/// `pending` or `processing` while the CSV is generated, `completed` when the download is ready, `failed` if it errored, `expired` once the CSV has been deleted.
public enum ExportStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case processing
    case completed
    case failed
    case expired
}