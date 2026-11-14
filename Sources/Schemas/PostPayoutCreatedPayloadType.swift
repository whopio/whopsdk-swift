import Foundation

/// The webhook event type
public enum PostPayoutCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case payoutCreated = "payout.created"
}