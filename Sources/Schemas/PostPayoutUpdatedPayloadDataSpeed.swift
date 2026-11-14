import Foundation

/// Payout delivery speed.
public enum PostPayoutUpdatedPayloadDataSpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case instant
}