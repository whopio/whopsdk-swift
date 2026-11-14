import Foundation

/// Payout delivery speed.
public enum PostPayoutCreatedPayloadDataSpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case instant
}