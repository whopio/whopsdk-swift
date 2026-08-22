import Foundation

/// The webhook event type
public enum PostDisputeAlertCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case disputeAlertCreated = "dispute_alert.created"
}