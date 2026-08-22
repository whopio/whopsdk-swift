import Foundation

/// The webhook event type
public enum PostWithdrawalCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case withdrawalCreated = "withdrawal.created"
}