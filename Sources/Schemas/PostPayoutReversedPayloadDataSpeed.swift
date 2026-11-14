import Foundation

/// Payout delivery speed.
public enum PostPayoutReversedPayloadDataSpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case instant
}