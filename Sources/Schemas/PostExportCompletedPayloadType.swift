import Foundation

/// The webhook event type
public enum PostExportCompletedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case exportCompleted = "export.completed"
}