import Foundation

/// The different fee types for a withdrawal.
public enum WithdrawalFeeTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case exclusive
    case inclusive
}