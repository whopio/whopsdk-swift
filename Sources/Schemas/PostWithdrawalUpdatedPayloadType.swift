import Foundation

/// The webhook event type
public enum PostWithdrawalUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case withdrawalUpdated = "withdrawal.updated"
}