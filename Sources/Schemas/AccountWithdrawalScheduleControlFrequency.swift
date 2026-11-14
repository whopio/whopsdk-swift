import Foundation

/// How often the account's balance automatically withdraws.
public enum AccountWithdrawalScheduleControlFrequency: String, Codable, Hashable, CaseIterable, Sendable {
    case manual
    case daily
    case weekly
    case monthly
}