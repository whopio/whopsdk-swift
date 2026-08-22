import Foundation

/// Payout delivery speed.
public enum PostWithdrawalCreatedPayloadDataSpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case instant
}