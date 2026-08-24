import Foundation

/// The webhook event type
public enum PostPayoutMethodCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case payoutMethodCreated = "payout_method.created"
}