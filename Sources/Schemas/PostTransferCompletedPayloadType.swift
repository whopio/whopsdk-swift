import Foundation

/// The webhook event type
public enum PostTransferCompletedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case transferCompleted = "transfer.completed"
}