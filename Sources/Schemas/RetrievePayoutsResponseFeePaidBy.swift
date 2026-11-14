import Foundation

/// Who bore the payout fee: the account itself, or its parent platform. Only returned to callers with payout:withdrawal:read on the owning ledger.
public enum RetrievePayoutsResponseFeePaidBy: String, Codable, Hashable, CaseIterable, Sendable {
    case `self`
    case platform
}