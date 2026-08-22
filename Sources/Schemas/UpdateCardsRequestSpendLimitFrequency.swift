import Foundation

/// The window the spend limit applies to.
public enum UpdateCardsRequestSpendLimitFrequency: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case weekly
    case monthly
    case oneTime = "one_time"
}