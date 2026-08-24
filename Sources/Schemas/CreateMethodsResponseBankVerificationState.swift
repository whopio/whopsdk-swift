import Foundation

/// Lifecycle trust state: `checking` (verification still running), `verified` (bank confirmed ownership or a payout already completed to it), `no_data` (verification unavailable or bank returned no ownership data), `warning` (bank could not confirm the destination's owner), `broken` (payouts failed with a permanent account error), `null` (never checked).
public enum CreateMethodsResponseBankVerificationState: String, Codable, Hashable, CaseIterable, Sendable {
    case checking
    case verified
    case noData = "no_data"
    case warning
    case broken
}