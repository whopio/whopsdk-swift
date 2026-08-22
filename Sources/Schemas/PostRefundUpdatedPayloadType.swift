import Foundation

/// The webhook event type
public enum PostRefundUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case refundUpdated = "refund.updated"
}