import Foundation

/// The webhook event type
public enum PostDisputeUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case disputeUpdated = "dispute.updated"
}