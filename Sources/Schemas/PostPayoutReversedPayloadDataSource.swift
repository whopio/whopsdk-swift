import Foundation

/// How the payout was created. `automatic` means a scheduled auto-payout. `null` when the payout has no recorded source.
public enum PostPayoutReversedPayloadDataSource: String, Codable, Hashable, CaseIterable, Sendable {
    case api
    case dashboard
    case automatic
}