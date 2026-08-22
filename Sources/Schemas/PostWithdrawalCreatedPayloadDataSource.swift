import Foundation

/// How the payout was created. `automatic` means a scheduled auto-payout; `null` on payouts created before source tracking or through internal tooling.
public enum PostWithdrawalCreatedPayloadDataSource: String, Codable, Hashable, CaseIterable, Sendable {
    case api
    case dashboard
    case automatic
}