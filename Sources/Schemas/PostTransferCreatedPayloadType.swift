import Foundation

/// The webhook event type
public enum PostTransferCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case transferCreated = "transfer.created"
}