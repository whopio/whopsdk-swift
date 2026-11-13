import Foundation

/// The webhook event type
public enum PostPayoutReversedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case payoutReversed = "payout.reversed"
}