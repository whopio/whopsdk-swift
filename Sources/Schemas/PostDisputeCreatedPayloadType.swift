import Foundation

/// The webhook event type
public enum PostDisputeCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case disputeCreated = "dispute.created"
}