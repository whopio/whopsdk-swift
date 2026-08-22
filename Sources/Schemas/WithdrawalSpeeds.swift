import Foundation

/// The different speeds of withdrawals
public enum WithdrawalSpeeds: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case instant
}