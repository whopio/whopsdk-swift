import Foundation

/// The webhook event type
public enum PostPayoutAccountStatusUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case payoutAccountStatusUpdated = "payout_account.status_updated"
}