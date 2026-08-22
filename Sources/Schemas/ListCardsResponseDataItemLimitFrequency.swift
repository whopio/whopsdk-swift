import Foundation

/// The window the limit amount applies to. `per_transaction` caps each individual authorization and is what a limit set with `transaction_limit` reports.
public enum ListCardsResponseDataItemLimitFrequency: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case weekly
    case monthly
    case oneTime = "one_time"
    case perTransaction = "per_transaction"
}