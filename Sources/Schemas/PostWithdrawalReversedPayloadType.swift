import Foundation

/// The webhook event type
public enum PostWithdrawalReversedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case withdrawalReversed = "withdrawal.reversed"
}