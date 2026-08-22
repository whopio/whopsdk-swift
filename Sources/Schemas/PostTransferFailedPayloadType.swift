import Foundation

/// The webhook event type
public enum PostTransferFailedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case transferFailed = "transfer.failed"
}