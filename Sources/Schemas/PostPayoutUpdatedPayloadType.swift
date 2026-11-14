import Foundation

/// The webhook event type
public enum PostPayoutUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case payoutUpdated = "payout.updated"
}