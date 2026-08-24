import Foundation

/// The window the spend limit applies to.
public enum CreateCardsRequestSpendLimitFrequency: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case weekly
    case monthly
    case oneTime = "one_time"
}