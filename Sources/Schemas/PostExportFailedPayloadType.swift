import Foundation

/// The webhook event type
public enum PostExportFailedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case exportFailed = "export.failed"
}