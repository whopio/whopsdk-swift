import Foundation

/// Payout delivery speed.
public enum PostWithdrawalUpdatedPayloadDataSpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case instant
}