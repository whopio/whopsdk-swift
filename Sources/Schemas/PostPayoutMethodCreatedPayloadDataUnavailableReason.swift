import Foundation

/// Why this method is unavailable: `destination_retired` means the payout provider stopped offering the destination. Whop may automatically remap an eligible method that was not linked through Plaid to a compatible replacement; otherwise, the account owner must re-add it. `null` means no unavailability reason is known.
public enum PostPayoutMethodCreatedPayloadDataUnavailableReason: String, Codable, Hashable, CaseIterable, Sendable {
    case destinationRetired = "destination_retired"
}