import Foundation

/// How the payout was created. `automatic` means a scheduled auto-payout. `null` when the payout has no recorded source. Only returned to callers with payout:withdrawal:read on the owning ledger.
public enum RetrievePayoutsResponseSource: String, Codable, Hashable, CaseIterable, Sendable {
    case api
    case dashboard
    case automatic
}