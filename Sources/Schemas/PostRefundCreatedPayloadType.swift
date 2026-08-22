import Foundation

/// The webhook event type
public enum PostRefundCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case refundCreated = "refund.created"
}