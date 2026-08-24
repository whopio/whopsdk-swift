import Foundation

/// Lifecycle status: `created` means saved but unused, `active` means a payout succeeded through it, `broken` means a payout failure disabled it; a later successful payout returns it to `active`.
public enum PostPayoutMethodCreatedPayloadDataStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case created
    case active
    case broken
}