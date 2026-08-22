import Foundation

/// Payout delivery speed.
public enum PostWithdrawalReversedPayloadDataSpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case instant
}